// Copyright 2011 Shinichiro Hamaji. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
//
//   1. Redistributions of source code must retain the above copyright
//      notice, this list of  conditions and the following disclaimer.
//
//   2. Redistributions in binary form must reproduce the above
//      copyright notice, this list of conditions and the following
//      disclaimer in the documentation and/or other materials
//      provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY Shinichiro Hamaji ``AS IS'' AND ANY
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Shinichiro Hamaji OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
// USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
// ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
// SUCH DAMAGE.

// A Mach-O loader for linux.

#include <assert.h>
#include <dlfcn.h>
#include <err.h>
#include <errno.h>
#include <execinfo.h>
#include <fcntl.h>
#include <limits.h>
#include <memory>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <time.h>
#include <ucontext.h>
#include <unistd.h>

#include <algorithm>
#include <iostream>
#include <map>
#include <set>
#include <string>
#include <vector>
#include <cxxabi.h> //Demangle names

#ifdef USE_LIBCXX
#include <unordered_map>
#else
#include <tr1/unordered_map>
#endif

#include "env_flags.h"
#include "fat.h"
#include "log.h"
#include "mach-o.h"
#include "libudis86/extern.h"

using namespace std;
#ifndef USE_LIBCXX
using namespace std::tr1;
#endif

DEFINE_bool(TRACE_FUNCTIONS, false, "Show calling functions");
DEFINE_bool(PRINT_TIME, false, "Print time spent in this loader");

extern const char* ud_reg_tab[];  


class MachO;
class MachDisassembler;

static map<string, string> g_rename;
static vector<string> g_bound_names;
static set<string> g_no_trampoline;

struct Timer {
  Timer() : start_time(0) {}

  void start() {
    if (FLAGS_PRINT_TIME) {
      start_time = clock();
    }
  }

  void print(const char* name) {
    if (FLAGS_PRINT_TIME) {
      double elapsed = ((double)clock() - start_time) / CLOCKS_PER_SEC;
      printf("Elapsed time (%s): %f sec\n", name, elapsed);
    }
  }

  clock_t start_time;
};

static void TranslateFunctionName(char* fn)
{
  if(strcmp(fn, "I_strncpyz") == 0)
  {
    fn[0] = 'Q';
    return;
  }
  if(strcmp(fn, "I_strncmp") == 0)
  {
    fn[0] = 'Q';
    return;
  }
  if(strcmp(fn, "I_stricmp") == 0)
  {
    fn[0] = 'Q';
    return;
  }
  if(strcmp(fn, "I_strncat") == 0)
  {
    fn[0] = 'Q';
    return;
  }
  if(strcmp(fn, "I_CleanChar") == 0)
  {
    fn[0] = 'Q';
    return;
  }
  if(strcmp(fn, "I_CleanStr") == 0)
  {
    fn[0] = 'Q';
    return;
  }
  if(strcmp(fn, "I_strnicmp") == 0)
  {
    strcpy(fn, "Q_stricmpn");
    return;
  }
  if(strcmp(fn, "I_strcmp") == 0)
  {
    strcpy(fn, "strcmp");
    return;
  }
  if(strcmp(fn, "I_strlwr") == 0 || strcmp(fn, "strlwr") == 0)
  {
    strcpy(fn, "Q_strlwr");
    return;
  }

  if(strcmp(fn, "Dvar_GetInt") == 0)
  {
    strcpy(fn, "Cvar_VariableIntegerValue");
    return;
  }

  if(strcmp(fn, "Dvar_GetBool") == 0)
  {
    strcpy(fn, "Cvar_VariableBooleanValue");
    return;
  }

  if(strcmp(fn, "Dvar_GetString") == 0)
  {
    strcpy(fn, "Cvar_VariableString");
    return;
  }

  if(strncmp(fn, "Dvar_", 5) == 0)
  {
    fn[0] = 'C';
    return;
  }
  if(strcmp(fn, "Hunk_AllocateTempMemoryInternal") == 0)
  {
    strcpy(fn, "Hunk_AllocateTempMemory");
    return;
  }
  if(strcmp(fn, "Hunk_AllocateTempMemoryHighInternal") == 0)
  {
    strcpy(fn, "Hunk_AllocateTempMemoryHigh");
    return;
  }
  if(strcmp(fn, "Cmd_AddCommandInternal") == 0)
  {
    strcpy(fn, "Cmd_AddCommand"); //3rd Argument gets just discarded
    return;
  }
  if(strcmp(fn, "_Znam") == 0)
  {
    strcpy(fn, "_Znaj"); //3rd Argument gets just discarded
    return;
  }
  if(strcmp(fn, "ParseConfigStringToStructCustomSize") == 0)
  {
    strcpy(fn, "ParseConfigStringToStruct"); //3rd Argument gets just discarded
    return;
  }



}



static const char* FunctionnameFromMangled(const char* mangledname)
{
  static char demangledname[256];
  char classname[128];
  char funcname[128];

  funcname[0] = 0;
  classname[0] = 0;

  const char* orgname = mangledname;
  if(mangledname[0] != '_')
  {
    strncpy(demangledname, orgname, sizeof(demangledname));
    TranslateFunctionName(demangledname);
    return demangledname;
  }
  ++mangledname;
  if(mangledname[0] == '_')
  {
    ++mangledname;
  }
  //First get the functionname
  if(mangledname[0] != 'Z')
  {
    return orgname;
  }
  ++mangledname;
  if(!isdigit(mangledname[0]))
  {
    strncpy(demangledname, orgname, sizeof(demangledname));
    TranslateFunctionName(demangledname);
    return demangledname;
  }
  int l = atoi(mangledname);
  if(l <= 0 || l > 50)
  {
    return orgname;
  }
  while(isdigit(mangledname[0]))
  {
    ++mangledname;
  }
  strncpy(funcname, mangledname, sizeof(funcname));
  funcname[l] = 0;
  mangledname += l;
  //Now get the classname of present
  if(mangledname[0] == 'I' && isdigit(mangledname[1]))
  {
    ++mangledname;
    int c = atoi(mangledname);
    if(c > 0 && c < 50)
    {
      while(isdigit(mangledname[0]))
      {
        ++mangledname;
      }
      strncpy(classname, mangledname, sizeof(classname));
      classname[c] = 0;
      mangledname += c;
    }
  }
  strncpy(demangledname, funcname, sizeof(demangledname));
  if(classname[0])
  {
    strcat(demangledname, "_");
    strcat(demangledname, classname);
  }
  TranslateFunctionName(demangledname);
  return demangledname;
}


class FileMap {
 public:


  enum SymbolType
  {
    SYM_NONE,
    SYM_PROC,
    SYM_GLOBCONST,
    SYM_DATAVAR,
    SYM_VAR,
    SYM_CONSTVAR,
    SYM_CONSTVAR4,
    SYM_CONSTVAR8,
    SYM_CSTRING,
    SYM_CFSTRING,
    SYM_VTABLE,
    SYM_OBJECT,
    SYM_IMPORT,
    SYM_POINTERS
  };
  struct SectionData
  {
    const char* name;
    SymbolType type;
    uint32_t start;
    uint32_t end;
  };
  struct Symbol;
  struct ObjectMap
  {
    string objectname;
    Symbol *symbols[1800]; //List of symbols belong to this objectfile
    int symbolcount;
  };
  struct Symbol
  {
    uint32_t address;
    string name;
    uint8_t section;
    uint32_t size;
    SymbolType type;
    bool _export;
    ObjectMap* object;
  };


  const char* symtypename(SymbolType type)
  {
    switch(type)
    {
      case SYM_NONE: return "SYM_NONE";
      case SYM_PROC: return "SYM_PROC";
      case SYM_GLOBCONST: return "SYM_GLOBCONST";
      case SYM_DATAVAR: return "SYM_DATAVAR";
      case SYM_VAR: return "SYM_VAR";
      case SYM_CONSTVAR: return "SYM_CONSTVAR";
      case SYM_CONSTVAR4: return "SYM_CONSTVAR4";
      case SYM_CONSTVAR8: return "SYM_CONSTVAR8";
      case SYM_CSTRING: return "SYM_CSTRING";
      case SYM_CFSTRING: return "SYM_CFSTRING";
      case SYM_VTABLE: return "SYM_VTABLE";
      case SYM_OBJECT: return "SYM_OBJECT";
      case SYM_IMPORT: return "SYM_IMPORT";
      case SYM_POINTERS: return "SYM_POINTERS";
      default: return "JUNK";
    }
  }

  const char* sectionname(uint8_t section)
  {
    static char unknown[20];
    switch(section)
    {

  case 1: return "text";
  case 2: return "cstring"; //Constant strings
  case 3: return "text2";
  case 7: return "literal4"; //Constant most are float
  case 8: return "text3";
  case 9: return "const9"; //Constant stuff
  case 10: return "const_coal10"; //Discarded probably just debug info
  case 11: return "literal8"; //Constant maybe doubles?
  case 12: return "data"; //Data preinitialized variable data
  case 14: return "gcc_except_tab"; //Discard - no idea what to do with it
  case 15: return "cfstring";
  case 17: return "const_coal17"; //Discarded probably just debug info
  case 18: return "const18"; //Const stuff also vtables!
  case 19: return "bss"; //rw memory - zero initialized
  case 20: return "common"; //rw memory - zero initialized
  case 21: return "pointers";
	default:
        sprintf(unknown, "unknown: %d", section);
        return unknown;
    }
  }

  bool discard(uint8_t section, uint8_t type, const char* name)
  {
    if(section == 10 || section == 17) //const_coal - probably not needed
    {
      return true;
    }
    if(section == 14) //Exception table
    {
      return true;
    }
    if((section == 1 || section == 3 || section == 8) && type != 0x22 && type != 0x24)
    {
      return true;
    }
    if(section == 0)
    {
        if(type == 0x66)
	{
		return false;
	}
	return true;
    }
    if(section == 4)
    {
	return true;
    }
    if(type == 0x4e || type == 0x2e)
    {
    	if(name[0])
    	{
    		printf("Error non empty name\n");
    		exit(1);
    	}
      return true;
    }
    if(type == 0x44 || type == 0xc0)
    {
    	if(name[0])
    	{
    		printf("Error non empty name\n");
    		exit(1);
    	}
      return true;
    }
    return false;
  }

  bool inSymbolFilter(const char* name)
  {
    unsigned int i;
    const char* filter[] = { "DB_EnumXAssets_LoadObj", "DB_GetAllXAssetOfType_LoadObj", "DB_EnumXAssets", "DB_GetAllXAssetOfType" };
    for(i = 0; i < sizeof(filter)/sizeof(filter[0]); ++i)
    {
      if(strcmp(FunctionnameFromMangled(name), filter[i]) == 0)
      {
        return true;
      }
    }
    return false;
  }

  void AddUserSymbols(const char* name)
  {
    string newsr;
    if(strcmp(name, "db_memory") == 0)
    {
        newsr = "_Z22DB_EnumXAssets_LoadObj10XAssetTypePFv12XAssetHeaderPvES1_h";
        addsymbol(newsr, 0x1cd17e, 1, SYM_PROC);
        newsr = "_Z14DB_EnumXAssets10XAssetTypePFv12XAssetHeaderPvES1_h";
        addsymbol(newsr, 0x1cd244, 1, SYM_PROC);
        newsr = "_Z29DB_GetAllXAssetOfType_LoadObj10XAssetTypeP12XAssetHeaderi";
        addsymbol(newsr, 0x1cd51a, 1, SYM_PROC);
        newsr = "_Z21DB_GetAllXAssetOfType10XAssetTypeP12XAssetHeaderi";
        addsymbol(newsr, 0x1cd420, 1, SYM_PROC);
    }
  }
  void SymbolRename(string *name)
  {
    if(name->compare("__tolower") == 0 || name->compare("tolower_dup_1") == 0)
    {
      name->assign("tolower"); //3rd Argument gets just discarded
      return;
    }
    if(name->compare("dx") == 0)
    {
        name->assign("dx_ctx"); //dx is not allowed
        return;
    }
    if(name->compare("fs") == 0)
    {
        name->assign("gFs"); //fs is not allowed. Use gFs like in BlackOps
        return;
    }
    if(name->compare("_Z10VM_Executev") ==0)
    {
      name->assign("_Z18VM_ExecuteInternalv");
      return;
    }

  }

  void add(const MachO& mach, uintptr_t base) {
    SymbolMap* symbol_map = new SymbolMap();
    symbol_map->filename = mach.filename();
    symbol_map->base = base;
    SymbolType type;
    if (!maps_.insert(make_pair(base, symbol_map)).second) {
      err(1, "dupicated base addr: %p in %s",
          (void*)base, mach.filename().c_str());
    }
    string initsr("initobj");
    addsymbol(initsr, 0, 0, SYM_OBJECT);
    initsr.assign("__i686.get_pc_thunk.bx");
    addsymbol(initsr, 0x32e0a8, 3, SYM_PROC);
    initsr.assign("__i686.get_pc_thunk.cx");
    addsymbol(initsr, 0x33a02a, 3, SYM_PROC);
    initsr.assign("atexit_common");
    addsymbol(initsr, 0x3471, 1, SYM_PROC);
    initsr.assign("get_globals");
    addsymbol(initsr, 0x30de, 1, SYM_PROC);
    initsr.assign("add_routine");
    addsymbol(initsr, 0x324b, 1, SYM_PROC);
    initsr.assign("check_cxa_atexit");
    addsymbol(initsr, 0x3069, 1, SYM_PROC);
    initsr.assign("__cxa_atexit");
    addsymbol(initsr, 0x3607, 1, SYM_PROC);

/*
    for (size_t i = 0; i < mach.symbols().size(); i++)
    {
      MachO::Symbol sym = mach.symbols()[i];

      if(discard(sym.section, sym.type, sym.name.c_str()))
      {
  		  continue;
      }
      if(sym.type == 0x66)
      {
        objectcount++;
      }else if(sym.type == 0x22 || sym.type == 0x24){

      }else if((sym.type & 0x0e) != 0x0e){
    		continue;
      }
      count++;
      continue;
    }
*/
    for (size_t i = 0; i < mach.symbols().size(); i++)
    {
      MachO::Symbol sym = mach.symbols()[i];

      if(discard(sym.section, sym.type, sym.name.c_str()))
      {
        continue;
      }
      if(sym.type == 0x66)
      {
        type = SYM_OBJECT;
        if (sym.name.empty())
        {
          char unkstr[20];
          sprintf(unkstr, "unknown%d", objectcount +1);
          sym.name.assign(unkstr);
        }
      }else if(sym.type == 0x22 || sym.type == 0x24){
        
        if(sym.section == 8)
        {
          type = SYM_GLOBCONST;
        }else{
          type = SYM_PROC;
        }
        if (sym.name.empty())
        {
          printf("Error empty name\n");
          exit(1);
        }

        if(sym.section == 3 && sym.addr >= 0x32e0a8 && sym.addr <= 0x33a02d)
        {
          
        }else if(sym.section == 8 && sym.addr >= 0x374a3c && sym.addr <= 0x38203c){

        }else if(sym.addr < 0x2f00 || sym.addr > 0x2e4f05){
          printf("Error not in __TEXT\n");
          exit(1);
        }
      }else if((sym.type & 0x0e) != 0x0e){
        continue;
      }else if(sym.section == 2){
        type = SYM_CSTRING;
      }else if(sym.section == 7 || sym.section == 9 || sym.section == 18){
        if(sym.section == 18)
        {
          if(strncmp(sym.name.c_str(), "__ZTV", 5) == 0)
          {
            type = SYM_VTABLE;
          }else{
            type = SYM_CONSTVAR;
          }
        }else{
          type = SYM_CONSTVAR;
        }
      }else if(sym.section == 12){
        type = SYM_DATAVAR;
      }else if(sym.section == 19 || sym.section == 20){
        type = SYM_VAR;
      }else{
        printf("Error: Bad symbol type\n");
        exit(1);
      }

      if (sym.name.empty())
      {
        printf("Error: Symbol with empty name - type: %d\n", type);
        exit(1);
      }

      const char* name = sym.name.c_str();
      if(type == SYM_OBJECT)
      {
        if(name[0] && name[1])
        {
          char* s = strrchr((char*)name, '/');
          if(s)
          {
            name = s+1;
          }
          s = strrchr((char*)name, '(');
          if(s)
          {
            name = s+1;
            s = strrchr((char*)name, ')');
            if(s)
            {
              *s = 0;
            }
          }
          int l = strlen(name);
          if(l > 2 && name[l-1] == 'o' && name[l-2] == '.')
          {
            ((char*)name)[l-2] = 0;
          }
        }
              }
      if(*name == '_')
      {
        ++name;
      }

      string newsr(name);

      if(!inSymbolFilter(name))
      {
        addsymbol(newsr, sym.addr, sym.section, type);
        if(type == SYM_OBJECT)
        {
          //Add missing symbols
          if(strcmp(name, "buildNumber_mp") == 0)
          {
            initsr.assign("build_string_buffer_ptr");
            addsymbol(initsr, 0x3a9cc0, 12, SYM_DATAVAR);
          }
        }
      }
    }


    string importobjname("imports");

    addsymbol(importobjname, 0, 0, SYM_OBJECT);


    for (size_t i = 0; i < mach.binds().size(); i++)
    {
      MachO::Bind* bind = mach.binds()[i];

      if (bind->name == NULL || bind->name[0] == 0)
      {
        printf("Error: Bind sym with empty name\n");
        exit(1);
      }

      const char* name = bind->name;

      if(*name == '_')
      {
        ++name;
      }
      string newsr(name);
      type = SYM_PROC;

      addsymbol(newsr, bind->vmaddr, 0, type);

    }

    sortsymbolsandcalc();

  }

  void printObjectmaps()
  {
    int i, j;
    printf("Objectmap print...\n");

    for(i = 0; i < objectcount; ++i)
    {
      ObjectMap *o = &objects[i];
      printf("Current object %s\nContains: \n", o->objectname.c_str());
      for(j = 0; j < o->symbolcount; ++j)
      {
        printf("%s, %s, 0x%x, %d\n", o->symbols[j]->name.c_str(), symtypename(o->symbols[j]->type), o->symbols[j]->address, o->symbols[j]->size);
      }
      printf("\n\n");
    }
  }

  static int addressCompare(const void* s1,const void* s2)
  {
    SymbolSorted *sym1 = (SymbolSorted*)s1;
    SymbolSorted *sym2 = (SymbolSorted*)s2;

    if(sym1->address < sym2->address) return -1;
    if(sym1->address > sym2->address) return 1;


    printf("Error: Duplicate address detected\n");
    exit(1);

    return 0;
  }

  int getSymbolForAddress(uint32_t address, Symbol* s)
  {
    int bottom, top;
    Symbol *ms;
    int mid;

    top = symbolcount -1;
    bottom = 0;

    do
    {
      mid = bottom + (top - bottom) / 2;
      ms = symbolssorted[mid].symbol;
      if(ms->address == address)
      {
        *s = *ms;
        return 0;
      }
      if(address > ms->address)
      {
        bottom = mid +1;
      }else{
        top = mid -1;
      }
    }while(top >= bottom);

    if(bottom >= symbolcount)
    {
      bottom = symbolcount -1;
      top = bottom -1;
    }
    if(top < 0)
    {
      top = 0;
      bottom = top +1;
    }

    //Always: top < bottom
    if(symbolssorted[bottom].symbol->address < address)
    {
      if( bottom +1 < symbolcount && symbolssorted[bottom +1].symbol->address < address)
      {
        printf("Error symbol search symbolssorted[bottom +1].symbol < address\n");
      }

      *s = *(symbolssorted[bottom].symbol);
    }else{
      if(top +1 < symbolcount && symbolssorted[top +1].symbol->address < address)
      {
        printf("Error symbol search symbolssorted[top +1].symbol < address\n");
      }

      *s = *(symbolssorted[top].symbol);
    }

    if(top > 0)
    {
      if(s->address > address){
        printf("Fatal error in symbol search: s->address > address\n");
        exit(-1);
      }
      return address - s->address;
    }
    return -1;
  }

  static bool getSectionDetailsForAddress(uint32_t address, SectionData *s)
  {
    unsigned int i;

    static SectionData sectiondata[22] = {{"JUNK", SYM_NONE, 0,0}, {"text", SYM_PROC, 0x2f00, 0x2e4f05}, {"cstring", SYM_CSTRING,0x2e4f08, 0x32e0a7},
       {"text", SYM_PROC, 0x32e0a8, 0x33a02d}, {"JUNK", SYM_NONE, 0, 0}, {"JUNK", SYM_NONE, 0 ,0}, {"JUNK", SYM_NONE, 0, 0}, 
       {"literal4", SYM_CONSTVAR4, 0x374440, 0x374a3b}, {"text", SYM_PROC, 0x374a3c, 0x382040}, {"const", SYM_CONSTVAR, 0x382060, 0x3a381f},
       {"JUNK", SYM_NONE, 0, 0}, {"literal8", SYM_CONSTVAR8, 0x3a3c10, 0x3a3fef}, {"data", SYM_DATAVAR, 0x3a4000, 0x3b0def},
       {"JUNK", SYM_NONE, 0, 0}, {"cfstring", SYM_CFSTRING, 0x3b4044, 0x3b4583}, {"JUNK", SYM_NONE, 0,0}, {"JUNK", SYM_NONE, 0,0},
       {"const", SYM_CONSTVAR, 0x3b4fc0, 0x3bd573}, {"bss", SYM_VAR, 0x3bd580, 0xe6828b},{"common", SYM_VAR, 0xe68300, 0xd5cbd7f},
       {"pointers", SYM_POINTERS, 0xd5cc000, 0xd5ccef7}, {"jump_table", SYM_IMPORT, 0xd5ccef8,0xd5cdc6c}};


    for(i = 0; i < sizeof(sectiondata)/sizeof(sectiondata[0]); ++i)
    {
      if(address >= sectiondata[i].start && address <= sectiondata[i].end)
      {
        *s = sectiondata[i];
        return true;
      }
    }
    return false;
  }

  void sortsymbolsandcalc()
  {
    int i;

    qsort(symbolssorted, symbolcount, sizeof(symbolssorted[0]), addressCompare);

    for(i = 0; i < symbolcount; ++i)
    {
      int size;
      if(i < symbolcount -1 && symbolssorted[i+1].symbol->section == symbolssorted[i].symbol->section)
      {
        size = symbolssorted[i+1].address - symbolssorted[i].address;
      }else{
        SectionData s;
        if(!getSectionDetailsForAddress(symbolssorted[i].address, &s))
        {
          printf("Error Address out of bounds of sections\n");
          exit(1);
        }
        size = s.end - symbolssorted[i].address;
      }
      symbolssorted[i].symbol->size = size;
    }

  }

  void addsymbol(string &name, uint32_t address, uint8_t section, SymbolType type)
  {
    string aname;
    if(currentobject == NULL && type != SYM_OBJECT)
    {
      return;
    }
    if(type == SYM_OBJECT)
    {
      objects[objectcount].objectname = name;
      objects[objectcount].symbolcount = 0;
      currentobject = &objects[objectcount];
      objectcount++;
      if(objectcount > 1000)
      {
        printf("Error: Exceeded max objects\n");
        exit(1);
      }
      AddUserSymbols(name.c_str());
      return;
    }
    int i;
    //Find different symbols with same address
    for(i = 0; i < symbolcount; ++i)
    {
      if(symbols[i].address == address)
      {
        if(symbols[i].name.compare(name) != 0)
        {
          //for(int z=0; z < symbolcount; ++z){if(symbols[z].name.compare("_Z12VEH_JoltBodyP9gentity_sPKffff")==0){printf("found at %x idx %d\n", symbols[z].address, z);}}
          printf("Duplicate address with different name detected!\n");
        }
        return;
      }
      if(symbols[i].name.compare(name) == 0)
      {
        //Special fix for _Z12VEH_JoltBodyP9gentity_sPKffff which exists as a copy with same name:
        if(name.compare("_Z12VEH_JoltBodyP9gentity_sPKffff") ==0)
        {
          name.assign("_Z17VEH_JoltBody_copyP9gentity_sPKffff");
        }

//        dup = true;
      }
    }
    if(currentobject->objectname.compare("imports") != 0)
    {
        //Find different address with same name in same object
        for(i = 0; i < currentobject->symbolcount; ++i)
        {
          if(currentobject->symbols[i]->name.compare(name) == 0)
          {
            printf("FATAL: different symbol with same name detected in current module\n");
            printf("module: %s ", currentobject->objectname.c_str());
            printf("name: %s ", currentobject->symbols[i]->name.c_str());
            printf("addresses: 0x%x 0x%x\n", currentobject->symbols[i]->address,  address);
            exit(-1);
          }
        }
    }
    SymbolRename(&name);

    aname = name;
    int dupcount = 0;

    if(currentobject->objectname.compare("imports") != 0)
    {
        for(i = 0; i < symbolcount; ++i)
        {
            if(symbols[i].name.compare(aname) == 0)
            {
              dupcount++;
              symbols[i]._export = false;
            }
        }
    }
    symbols[symbolcount].name = aname;
    symbols[symbolcount].address = address;
    symbols[symbolcount].section = section;
    symbols[symbolcount].type = type;
    symbols[symbolcount]._export = dupcount == 0;
    symbols[symbolcount].object = currentobject;

    symbolssorted[symbolcount].address = address;
    symbolssorted[symbolcount].symbol = &symbols[symbolcount];
    symbolssorted[symbolcount].obj = currentobject;

    currentobject->symbols[currentobject->symbolcount] = &symbols[symbolcount];
    currentobject->symbolcount++;

    symbolcount++;
    if(symbolcount > 20000 || currentobject->symbolcount > 1800)
    {
      printf("Error: Exceeded max symbols\n");
      exit(1);
    }
  }

  void addWatchDog(uintptr_t addr) {
    bool r = maps_.insert(make_pair(addr, (SymbolMap*)NULL)).second;
    CHECK(r);
  }

  const char* dumpSymbol(void* p) {
    uintptr_t addr = reinterpret_cast<uintptr_t>(p);
    map<uintptr_t, SymbolMap*>::const_iterator found = maps_.upper_bound(addr);
    if (found == maps_.begin() || found == maps_.end()) {
      return NULL;
    }

    --found;
    return dumpSymbolFromMap(*found->second, addr);
  }

  ObjectMap* getObjectMap(unsigned int index)
  {
    if(index < (unsigned int)objectcount)
      return &objects[index];
    else
      return NULL;
  }

 private:

  struct SymbolMap {
    string filename;
    map<uintptr_t, string> symbols;
    uintptr_t base;
  };
  struct SymbolSorted
  {
    uint32_t address;
    ObjectMap *obj; //reference to object file
    Symbol *symbol; //reference to symbol details
  };


  ObjectMap objects[1000]; //All objectfiles
  ObjectMap *currentobject;
  int objectcount;
  SymbolSorted symbolssorted[20000]; //All symbols sorted by address
  Symbol symbols[20000]; //Stores all symbols with details - does not contain SYM_OBJECT
  int symbolcount;



  const char* dumpSymbolFromMap(const SymbolMap& symbol_map, uintptr_t addr) {
    uintptr_t file_offset = addr - symbol_map.base;

    // Use lower_bound as PC may be in just after call.
    map<uintptr_t, string>::const_iterator found =
        symbol_map.symbols.lower_bound(addr);
    if (found == symbol_map.symbols.begin()) {
      snprintf(dumped_stack_frame_buf_, 4095, "%s [%p(%lx)]",
               symbol_map.filename.c_str(), (void*)addr, (long)file_offset);
      return dumped_stack_frame_buf_;
    }

    --found;
    const char* name = found->second.c_str();
    uintptr_t func_offset = addr - found->first;
    snprintf(dumped_stack_frame_buf_, 4095, "%s(%s+%lx) [%p(%lx)]",
             symbol_map.filename.c_str(), name, (long)func_offset,
             (void*)addr, (long)file_offset);
    return dumped_stack_frame_buf_;
  }

  map<uintptr_t, SymbolMap*> maps_;

  char dumped_stack_frame_buf_[4096];

};

static FileMap g_file_map;

#ifdef __x86_64__
static const char* ARCH_NAME = "x86-64";
static const int BITS = 64;
#else
static const char* ARCH_NAME = "i386";
static const int BITS = 32;
#endif

static char* g_darwin_executable_path;

static Timer g_timer;

class MachOLoader;
static MachOLoader* g_loader;



static uint64_t alignMem(uint64_t p, uint64_t a) {
  a--;
  return (p + a) & ~a;
}

bool dasmIsJump(enum ud_mnemonic_code mnemonic)
{
    if (mnemonic == UD_Ijmp || mnemonic == UD_Ija || mnemonic == UD_Ijae || mnemonic == UD_Ijb || mnemonic == UD_Ijbe ||
       mnemonic == UD_Ijcxz || mnemonic == UD_Ijecxz || mnemonic == UD_Ijg || mnemonic == UD_Ijge || mnemonic == UD_Ijl ||
       mnemonic == UD_Ijle || mnemonic == UD_Ijno || mnemonic == UD_Ijnp || mnemonic == UD_Ijns || mnemonic == UD_Ijnz ||
       mnemonic == UD_Ijo || mnemonic == UD_Ijp || mnemonic == UD_Ijrcxz || mnemonic == UD_Ijs || mnemonic == UD_Ijz)
    { //Is a jump instruction.
      return true;
    }
    return false;
}

class MachDisassembler* dasm_ptr;


class MachDisassembler
{
public:

  static const char* symbolResolver(ud_t* ud_obj, uint64_t address, int64_t *offset)
  {
    static char symnamebuf[4096];
    static int select = 0;
    FileMap::SectionData sec;

    char* symname = &symnamebuf[256 * select];
    select++;
    if(select >= 16)
    {
      select = 0;
    }



    if(address >= dasm_ptr->dasmCurrentSymbol->address && address < dasm_ptr->dasmCurrentSymbol->address + dasm_ptr->dasmCurrentSymbol->size)
    {
      int i;
      for(i = 0; i < 8000 && dasm_ptr->dasmOutputBuffer[i].address != 0; ++i)
      {
        if(dasm_ptr->dasmOutputBuffer[i].address == address)
        {
          if(dasm_ptr->dasmOutputBuffer[i].label[0] == 0)
          {
            dasm_ptr->jmplabelcounter += 10;
            snprintf(dasm_ptr->dasmOutputBuffer[i].label, sizeof(dasm_ptr->dasmOutputBuffer[0].label), "%s_%i", FunctionnameFromMangled(dasm_ptr->dasmCurrentSymbol->name.c_str()), dasm_ptr->jmplabelcounter);
          }
          return dasm_ptr->dasmOutputBuffer[i].label;
        }
      }
      printf("Error: Invalid address 0x%llx @ 0x%llx in symbolResolver!\n", address, ud_obj->pc);
      return NULL;
    }

    FileMap::Symbol s;

    int off = g_file_map.getSymbolForAddress(address, &s);

    if(!FileMap::getSectionDetailsForAddress(address, &sec))
    {
      printf("Invalid address!!!\n");
      return NULL;
    }


    if(off != 0 && sec.type == FileMap::SYM_PROC)
    {
      printf("Text section reference Error @0x%llx!!!\n", ud_obj->pc);
      return NULL;
    }

    if(off >= 0)
    {
      const char* demanname = FunctionnameFromMangled(s.name.c_str());
      addImport(demanname);

      *offset = off;
      strncpy(symname, demanname, 256);
      return symname;
    }
    printf("Error: No symbol in symbolResolver 2! 0x%llx@0x%llx\n", address, ud_obj->pc);
    return NULL;
  }


/*
  static void traceReg(ud_t *ud_obj)
  {

  }
*/
  //Dumb way again is faster than messing with mangling
  static bool FunctionArgPtr(const char* name, int arg)
  {
    struct funcptrarg_t
    {
      const char* name;
      int arg;
    };
    static funcptrarg_t l[] = {{ "qsort", 3},{ "_Z22Cmd_AddCommandInternalPKcPFvvEP14cmd_function_s", 1}, {"_Z18FX_ParseAssetArrayI13FxElemVisualsLi32EEhPPKchP15FxEditorElemDefRAT0__T_PFhS2_PS6_E", 1},
                              {"_Z28Cmd_AddServerCommandInternalPKcPFvvEP14cmd_function_s", 1}, {"_Z12Dvar_ForEachPFvPK6dvar_sPvES2_", 0},
                              { "_Z28Material_ForEachTechniqueSetPFvP20MaterialTechniqueSetE", 0},{ "CreateThread", 2},
                              {"_Z10R_DrawCallPFvPKv16GfxCmdBufContextS1_ES0_P20GfxCmdBufSourceStatePK11GfxViewInfoPK19GfxDrawSurfListInfoPK12GfxViewParmsP9GfxCmdBufSG_", 0},
                              {"_Z16Dvar_ForEachNamePFvPKcE", 0},
                              {"_Z11Cmd_ForEachPFvPKcE", 0},
                              {"InstallEventHandler", 1},
                              {"AEInstallEventHandler", 2},
                              {"_ZSt16__introsort_loopIP19GfxCachedShaderTextiPFhRKS0_S3_EEvT_S6_T0_T1_", 3},
                              {"_ZSt16__introsort_loopIPP8MaterialiPFhPKS0_S4_EEvT_S7_T0_T1_", 3},
                              {"_ZSt16__introsort_loopIPPK22GfxStaticModelDrawInstiPFhS2_S2_EEvT_S6_T0_T1_", 3},
                              {"_ZSt16__insertion_sortIP18GfxSModelSurfStatsPFhRKS0_S3_EEvT_S6_T0_", 2},
                              {"_ZSt16__insertion_sortIPP8MaterialPFhPKS0_S4_EEvT_S7_T0_", 2},
                              {"_Z14DB_EnumXAssets10XAssetTypePFv12XAssetHeaderPvES1_h", 1},
                              {"_Z18R_CylinderSurfacesPKfS0_fPK9DpvsPlanejPFiiPvES4_PP10GfxSurfacej", 5},
                              {"_Z14XModelPrecachePKcPFPviES3_", 2},
                              {"_Z14XModelPrecachePKcPFPviES3_", 1},
                              {"_Z28XSurfaceVisitTrianglesInAabbPK8XSurfacejPKfS3_PFhPvPPK15GfxPackedVertexS8_ES4_", 4},
                              {"_ZSt16__insertion_sortIPPK22GfxStaticModelDrawInstPFhS2_S2_EEvT_S6_T0_", 2},
                              {"_Z17R_BoxStaticModelsPKfS0_PFiiEPti", 2},
                              {"_Z17Com_BeginRedirectPcjPFvS_E", 2},
                              {"_Z18Dvar_SetDomainFuncPK6dvar_sPFhPS_9DvarValueE", 1},
                              {"_Z13XAnimPrecachePKcPFPviE", 1},
                              {"_Z8ms_qsortPvmmPFiPKvS1_E", 3},
                              {"_Z15XAnimCreateTreeP7XAnim_sPFPviE", 1},
                              {"_Z25ParseConfigStringToStructPhPK10cspField_tiPKciPFiS_S4_iEPFvS_S4_E", 5},
                              {"_Z25ParseConfigStringToStructPhPK10cspField_tiPKciPFiS_S4_iEPFvS_S4_E", 6},
                              {"_ZN10MacBuilder11BuildWindowEPK10__CFStringS2_hPFhP15OpaqueWindowPtrmE", 3},
                              {"_ZN10MacBuilder20SetupUserPaneControlEP15OpaqueWindowPtrlPFvP16OpaqueControlRefsEPFsS3_5PointS5_E", 2},
                              {"_ZN10MacBuilder20SetupUserPaneControlEP15OpaqueWindowPtrlPFvP16OpaqueControlRefsEPFsS3_5PointS5_E", 3},
                              {"_ZN10MacBuilder20SetupUserPaneControlEP15OpaqueWindowPtrlPFvP16OpaqueControlRefsEPFsS3_5PointS5_E", 4},
                              {"_ZN10MacBuilder11BuildWindowEPK10__CFStringS2_hPFhP15OpaqueWindowPtrmE", 3},
                              {"_Z32CM_ForEachBrushInLeafBrushNode_rP16cLeafBrushNode_sPKfS2_hiPFvPK8cbrush_tPvES6_", 5},
                              {"_ZN10MacBuilder15SetEditTextHookEP15OpaqueWindowPtrlPFhP16OpaqueControlRefsEs", 2},
                              {"_Z19FX_ForEachEffectDefPFvPK11FxEffectDefPvES2_", 0},
                              {"_Z18PhysPresetPrecachePKcPFPviE", 1},
                              {"_Z20XModelPiecesPrecachePKcPFPviE", 1},
                              {"_ZSt16__introsort_loopIP18GfxSModelSurfStatsiPFhRKS0_S3_EEvT_S6_T0_T1_", 3},
                              {"_ZSt16__insertion_sortIPP10GfxSurfacePFhS1_S1_EEvT_S5_T0_", 2},
                              {"_ZSt16__introsort_loopIPP10GfxSurfaceiPFhS1_S1_EEvT_S5_T0_T1_", 3},
                              {"_ZSt22__final_insertion_sortIP10GfxSurfacePFhRKS0_S3_EEvT_S6_T0_", 2},
                              {"_Z35ParseConfigStringToStructCustomSizePhPK10cspField_tiPKciPFiS_S4_iEPFvS_S4_E", 6},
                              {"_Z35ParseConfigStringToStructCustomSizePhPK10cspField_tiPKciPFiS_S4_iEPFvS_S4_E", 5},
                              {"_Z18Mantle_CreateAnimsPFPviE", 0},
                              {"_Z23Sys_SpawnDatabaseThreadPFvjE", 0},
                              {"_ZSt16__introsort_loopIP16DynEntSortStructiPFhRKS0_S3_EEvT_S6_T0_T1_", 3},
                              {"_Z10FX_ConvertPK17FxEditorEffectDefPFPviE", 1},
                              {"_Z18R_MarkFragments_GoP8MarkInfoPFvPviP9FxMarkTriiP11FxMarkPointPKfS7_ES1_iS3_iS5_", 1},
                              {"_Z18Mantle_CreateAnimsPFPviE", 0},
                              {"_ZSt16__introsort_loopIP9FxMarkTriiPFhRKS0_S3_EEvT_S6_T0_T1_", 3},
                              {"_ZSt16__introsort_loopIPPK6dvar_siPFhS2_S2_EEvT_S6_T0_T1_", 3},
                              {"_ZSt16__insertion_sortIPPK6dvar_sPFhS2_S2_EEvT_S6_T0_", 2},
                              {"_Z26Phys_ComputeMassPropertiesPKfS0_PFhS0_S0_PvES1_PfS4_S4_", 2},
                              {"_Z25Phys_SetCollisionCallback9PhysWorldPFvvE", 1},
                              {"_Z37R_ForEachPrimaryLightAffectingSurfaceP8GfxWorldPK10GfxSurfacejPFvS0_jjE", 3},
                              {"_ZSt16__introsort_loopIP10GfxSurfaceiPFhRKS0_S3_EEvT_S6_T0_T1_", 3},
                              {"_ZSt16__introsort_loopIP26GfxStaticModelCombinedInstiPFhRKS0_S3_EEvT_S6_T0_T1_", 3},
                              {"_ZSt16__insertion_sortIP26GfxStaticModelCombinedInstPFhRKS0_S3_EEvT_S6_T0_", 2},
                              {"_ZSt16__introsort_loopIP23AnnotatedLightGridPointiPFhRKS0_S3_EEvT_S6_T0_T1_", 3},
                              {"_ZSt16__introsort_loopIPP8GfxImageiPFiS1_S1_EEvT_S5_T0_T1_", 3},
                              {"_ZSt16__insertion_sortIPP8GfxImagePFiS1_S1_EEvT_S5_T0_", 2},
                              {"_ZSt16__introsort_loopIP15ShadowCandidateiPFhRKS0_S3_EEvT_S6_T0_T1_", 3},
                              {"_Z19R_BoxStaticModels_rP7mnode_tPKfS2_PFiiEPtiPiPh", 0}, //RegParm3
                              {"NewControlKeyFilterUPP", 0},
                              {"NewControlEditTextValidationUPP", 0},
                              {"NewControlUserPaneHitTestUPP", 0},
                              {"InstallEventLoopTimer", 5},
                              {"__cxa_atexit", 0},   
                              {"pthread_create", 2},
                              {"AudioConverterFillBuffer", 1},
                              {"ReadFileEx", 4},
                              {"AIL_set_file_callbacks", 0},
                              {"AIL_set_file_callbacks", 1},
                              {"AIL_set_file_callbacks", 2},
                              {"AIL_set_file_callbacks", 3},
                              {"dSpaceCollide", 2},
                              {"dSpaceCollide2", 3},
                              {"QTInstallNextTaskNeededSoonerCallback", 0},
                              {"QTUninstallNextTaskNeededSoonerCallback", 0},
                              {"AudioUnitAddRenderNotify", 1},
                              {"AudioUnitRemoveRenderNotify", 1},
                              {"AudioConverterFillComplexBuffer", 1},
                              {"BinkSetMemory", 1},
                              {"BinkSetMemory", 0},
                              {"jpeg_std_error", 2},
                              {"jpeg_std_error", 1},
                              {NULL, 0}};
    int i;
    for(i = 0; l[i].name; ++i)
    {
      if(strcmp(l[i].name, name) == 0)
      {
        if(l[i].arg == arg)
        {
          return true;
        }
      }
    }
    return false;
  }

  static bool isFunctionPointerWhitelist(uint32_t location)
  {
    uint32_t l[] = { 0x262161, 0x1cd555, 0x1cd57e, 0x1e1db, 0x12a6d6, 0x216f90, 0x25c53b, 0x216ee2, 0x216fca, 0x216f56, 
      0x217004, 0x218a83, 0x218a96, 0x218f78, 0x218f8c, 0x25c59d, 0x25c5ad, 0x2abd96, 0x1d0dc1, 0x1d0de5, 0x1d0e9c, 0x3bfc1,
      0x1f9bbc, 0x1f9c65, 0x1fa8f1, 0x1fa93e, 0x216ebd, 0x269967, 0x2698d4, 0x269991, 0};

    int i;
    for(i = 0; l[i]; ++i)
    {
      if(l[i] == location)
      {
        return true;
      }
    }
    if(location >= 0x25faee && location < 0x25fc8e)
    {
      return true;
    }

    return false;
  }

  static bool isCallbackFunction(uint32_t location)
  {
    uint32_t l[] = { 0x1a1646, 0x1a13d0, 0x1a1668, 0x216f30, 0x1a1696, 0x1dcdf2, 0x1dd2fa, 0};

    int i;
    for(i = 0; l[i]; ++i)
    {
      if(l[i] == location)
      {
        return true;
      }
    }
    return false;
  }

  static bool isFunctionPointer(uint32_t location, int endaddress)
  {
    ud_t ud_obj;
    enum ud_mnemonic_code mnemonic;

    if(isFunctionPointerWhitelist(location))
    {
      return true;
    }
    initDisassembler( &ud_obj );

    uint64_t pc = location;

    int length = endaddress - location;
    
    ud_set_input_buffer(&ud_obj, (uint8_t*)location, length);
    ud_set_pc(&ud_obj, pc);
    ud_obj.inp_buf_index = 0;

    if(ud_input_end(&ud_obj) || !ud_disassemble(&ud_obj))
    {
      printf("Error\n");
      return false;
    }
    mnemonic = ud_insn_mnemonic(&ud_obj);
    
    if(mnemonic == UD_Icmp) //cmp happens only once and it is function pointer - so ignore it
    {
      return true;
    }
    if(mnemonic != UD_Imov)
    {
      printf("Error\n");
      return false;
    }
    struct ud_operand* op0 = &ud_obj.operand[0];
    struct ud_operand* op1 = &ud_obj.operand[1];

    if(op0->size != 32)
    {
      printf("Junk?\n");
      return false;
    }
    if(op1->size != 32)
    {
      printf("Junk?\n");
      return false;
    }
    if(isCallbackFunction(op1->lval.udword))
    {
      return true;
    }

    if(op0->type != UD_OP_REG && op0->type != UD_OP_MEM)
    {
      printf("Junk mov\n");
      return false;
    }

    if(op0->type == UD_OP_MEM)
    {
      if (ud_obj.pfx_seg) {
        printf("Junk segment register\n");
      }
      if (op0->index)
      {
        printf("Unexpected Index - Can't handle\n");
      }
      if (op0->base) {
        if(op0->base == UD_R_ESP)
        {
          int arg = op0->lval.udword /4;

          //printf("Possible function pointer in arg %d\n", arg);
          //Trace to a call instruction
          while(!ud_input_end(&ud_obj) && ud_disassemble(&ud_obj))
          {
            mnemonic = ud_insn_mnemonic(&ud_obj);
            if(mnemonic == UD_Icall || dasmIsJump(mnemonic))
            {
              break;
            }
          }
          if(mnemonic != UD_Icall)
          {
            printf("Error: Call not found @0x%llx\n", ud_obj.insn_offset);
            return false;
          }else{
            struct ud_operand* opc = &ud_obj.operand[0];
            if(opc->type != UD_OP_JIMM)
            {
              printf("Error: Can not handle call@0x%llx\n", ud_obj.insn_offset);
              return false;
            }
            uint32_t calladdr = ud_syn_rel_target(&ud_obj, opc);
            FileMap::Symbol s;
            int off = g_file_map.getSymbolForAddress(calladdr, &s);
            if(off != 0)
            {
              printf("Error: No symbol for address@0x%llx\n", ud_obj.insn_offset);
              return false;              
            }
            if(!FunctionArgPtr(s.name.c_str(), arg))
            {
                char demangledname[32768]; //would try realloc on failure. so it is really large so it won't happen
                size_t l = sizeof(demangledname);
                int status;
                abi::__cxa_demangle ( s.name.c_str(), demangledname, &l, &status); 
                if(status != 0)
                {
                  demangledname[0] = 0;
                }
                printf("Call {\"%s\", %d}, %s  @ 0x%x\n", s.name.c_str(),arg, demangledname, calladdr);
            }
            return true;
          }
        }else{
          printf("0x%x Check if function pointer 0x%x@0x%llx mnemonic=%s\n", location, location, ud_obj.insn_offset, ud_lookup_mnemonic(mnemonic));
        }
        //  printf("mov [%s", ud_reg_tab[op0->base - UD_R_AL]);
      }
    }else if(op0->type == UD_OP_REG){
      if (!op0->base) {
        printf("Junk\n");
        return false;
      }
      if(op0->base == UD_R_ESP || op0->base == UD_R_EBP)
      {
        printf("Junk\n");
        return false;
      }
      ud_type reg = op0->base;
      while(!ud_input_end(&ud_obj) && ud_disassemble(&ud_obj))
      {
        mnemonic = ud_insn_mnemonic(&ud_obj);
        if(mnemonic == UD_Icall || dasmIsJump(mnemonic))
        {
          break;
        }
        //Conditional move of function pointer
        if(mnemonic == UD_Icmovz || mnemonic == UD_Icmovnz)
        {
          struct ud_operand* mop0 = &ud_obj.operand[0];
          struct ud_operand* mop1 = &ud_obj.operand[1];
          if(mop1->type == UD_OP_REG && mop0->type == UD_OP_REG)
          {
            if(mop1->base == reg)
            {
              reg = mop0->base;
            }
          }
        }
      }
      if(mnemonic != UD_Icall && mnemonic != UD_Ijmp)
      {
        printf("Error: Call/JMP not found @0x%llx\n", ud_obj.insn_offset);
        return false;
      }
      struct ud_operand* opc = &ud_obj.operand[0];
      if(opc->type != UD_OP_REG)
      {
        printf("Error: Call/Jmp not register @0x%llx\n", ud_obj.insn_offset);
        return false;
      }
      if(opc->base == reg)
      {
        return true;
      }
      printf("Check if function pointer 0x%x@0x%llx mnemonic=%s\n", location, ud_obj.insn_offset, ud_lookup_mnemonic(mnemonic));
    }

/*
    while(pc = ud_obj->pc, !ud_input_end(ud_obj) && ud_disassemble(ud_obj))
    {
      mnemonic = ud_insn_mnemonic(ud_obj);
    }
*/
    return false;
  }


  static void addPotentialConstant(uint32_t arg)
  {
    unsigned int i;
    if(dasm_ptr->constantcounter >= 1024*1024*4)
    {
      printf("Error exceeded %d constants\n", 1024*1024*4);
      return;
    }
    for(i = 0; i < dasm_ptr->constantcounter; ++i)
    {
      if(dasm_ptr->potentialConstants[i] == arg)
      {
        return; //Added already
      }
    }
    dasm_ptr->potentialConstants[i] = arg;
    ++dasm_ptr->constantcounter;
  }

  static bool isConstant(uint32_t address)
  {

    int i;
    uint32_t constants[] = {0x900000, 0x1400000, 0x646162, 0x820011, 0x800811, 0x810011, 0x800000, 0x400208, 480000, 0x1600080, 0xffff00, 0x400000, 0xa00000, 0xa000000, 0xfffffe, 0xffffff, 0x1000000, 0xff00ff, 0x1f00000, 0x484c68, 0x46380c, 0x46382c, 0x504526, 0x48468c, 0x484660, 0x463840, 0x484a90, 0x463820,
                            0x43c000, 0x463800, 0x463804, 0x463808, 0x463838, 0xfe7fff, 0x7e8000, 0x802011, 0x802013, 0x803003, 0x806c31, 0x807fff, 0x810211, 0x700000, 0x600000, 0x600001, 0x400000,
                            0x39294c, 0x2dbc514, 0x2dbc518, 0x624451c, 0x8246aa0, 0x8246aa4, 0x8246aa8, 0x8246aac,
                            0x504504, 0x4e3cf0, 0x0};
    for(i = 0; constants[i]; ++i)
    {
      if(constants[i] == address)
      {
        return true;
      }
    }
    return false;

  }

  static const char* symbolResolver_imm(ud_t* ud_obj, uint64_t address, int64_t *offset)
  {
    static char symnamebuf[4096];
    static int select = 0;
    FileMap::SectionData sec;

    if(address < 0x2f00)
    {
      return NULL;
    }

    char* symname = &symnamebuf[256 * select];
    select++;
    if(select >= 16)
    {
      select = 0;
    }

    if(address > dasm_ptr->dasmCurrentSymbol->address && address < dasm_ptr->dasmCurrentSymbol->address + dasm_ptr->dasmCurrentSymbol->size)
    {
      printf("Error memory access .text @0x%llx in same procedure\n", ud_obj->pc);
      return NULL;
    }

    FileMap::Symbol s;

    int off = g_file_map.getSymbolForAddress(address, &s);

    if(!FileMap::getSectionDetailsForAddress(address, &sec))
    {
      return NULL;
    }

    if(sec.type != FileMap::SYM_PROC && isConstant(address))
    {
      return NULL;
    }

    if(ud_obj->insn_offset == 0x1839f5)
    {
        *offset = 0x120;
        return "boxVerts";
    }


    if(sec.type == FileMap::SYM_PROC)
    {
      if(off == 0)
      {
        if(!isFunctionPointer(ud_obj->insn_offset, dasm_ptr->dasmCurrentSymbol->address + dasm_ptr->dasmCurrentSymbol->size))
        {
          return NULL;
        }
      }else{
        return NULL;
      }
      const char* demanname = FunctionnameFromMangled(s.name.c_str());
      addImport(demanname);

      *offset = off;
      strncpy(symname, demanname, 256);
      return symname;
    }else if(sec.type == FileMap::SYM_CSTRING){
      return addStringToTable((const char*)address);
    }else if(sec.type == FileMap::SYM_CONSTVAR4){
      return addFloatToTable((const float*)address);
    }else if(sec.type == FileMap::SYM_CONSTVAR8){
      return addDoubleToTable((const double*)address);
    }else if(sec.type == FileMap::SYM_CFSTRING){
      //Allocate the new cfstring object
      return addCFStringToTable( (struct __builtin_CFString*)address );
    }else if(sec.type == FileMap::SYM_VAR){
      if(off < 0)
      {
        printf("address 0x%llx@0x%llx not in symbolmap (bss)\n", address, ud_obj->insn_offset);
        return NULL;
      }
      if(s.name.compare("svs") == 0 && strncmp(dasm_ptr->dasmCurrentSymbol->object->objectname.c_str(), "sv_", 3) != 0)
      {
        return NULL;
      }
      addPotentialConstant((uint32_t)address );

    }else if(sec.type == FileMap::SYM_CONSTVAR){
      if(off < 0)
      {
        printf("address 0x%llx@0x%llx not in symbolmap (const)\n", address, ud_obj->insn_offset);
        return NULL;
      }
      addPotentialConstant((uint32_t)address );

    }else if(sec.type == FileMap::SYM_DATAVAR){
      if(off < 0)
      {
        printf("address 0x%llx@0x%llx not in symbolmap (data)\n", address, ud_obj->insn_offset);
        return NULL;
      }
      addPotentialConstant((uint32_t)address );
    }else if(sec.type == FileMap::SYM_POINTERS){
      if(address & 3)
      {
        return NULL;
      }
      uint32_t* ptr = (uint32_t*)address;
      int off = g_file_map.getSymbolForAddress(*ptr, &s);
      if(off != 0)
      {
        //printf("Error pointer var has offset: %d\n", off);
        return NULL;
      }

      snprintf(symname, 256, "pt_%s", s.name.c_str());

      addImport(symname);
      *offset = off;
      return symname;
    }else if(sec.type != FileMap::SYM_NONE){
      printf("Unhandled symbol type %d\n", sec.type);

    }


//    printf("Possible symbol: 0x%llx@0x%llx\n", address, ud_obj->pc);

    if(off >= 0)
    {

      addImport(s.name.c_str());

      *offset = off;
      strncpy(symname, s.name.c_str(), 256);
      return symname;
    }
    //printf("Resolve 0x%llx\n", address);
    return NULL;
  }



  static const char* symbolResolver_mem_disp(ud_t* ud_obj, const struct ud_operand *op, uint64_t address, int64_t *offset)
  {
    static char symnamebuf[4096];
    static int select = 0;
    FileMap::SectionData sec;

    if(address < 0x2f00)
    {
      return NULL;
    }

    char* symname = &symnamebuf[256 * select];
    select++;
    if(select >= 16)
    {
      select = 0;
    }

    if(address > dasm_ptr->dasmCurrentSymbol->address && address < dasm_ptr->dasmCurrentSymbol->address + dasm_ptr->dasmCurrentSymbol->size)
    {
      printf("Error memory access .text @0x%llx in same procedure\n", ud_obj->pc);
      return NULL;
    }

    FileMap::Symbol s;

    int off = g_file_map.getSymbolForAddress(address, &s);

    if(!FileMap::getSectionDetailsForAddress(address, &sec))
    {
      return NULL;
    }

    if(sec.type != FileMap::SYM_PROC && isConstant(address))
    {
      return NULL;
    }   

    if(address >= 0x387de0 && address <= 0x387ff0 && (address & 0xf) == 0) //xmm constants of ClipMap
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address == 0x388000 || address == 0x388020) //xmm constants of Com_CanPrimaryLightAffectPoint & Com_LoadWorldLoadObj
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address < 0x391B60 && address >= 0x3918f0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address == 0x3913e0 || address == 0x3913f0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x3924f0 && address < 0x3926c0 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x390494 && address < 0x390500 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x390520 && address < 0x390820 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x3A12D0 && address < 0x3A1320 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x3A1380 && address < 0x3A13C0 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x390A30 && address < 0x390A60 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address == 0x382830) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address == 0x382B00) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x382CC0 && address < 0x382D30 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x382D60 && address < 0x382DC0 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x382DE0 && address < 0x382E60 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address == 0x382EE0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x3831A0 && address < 0x3832B0 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x3832E0 && address < 0x383360 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }


    if(address == 0x3833d0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address == 0x383500) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x3836f0 && address < 0x383740 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }


    if(address >= 0x383990 && address < 0x3839C0 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }


    if(address >= 0x3839D0 && address < 0x383A20 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address == 0x383A50) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x383CB0 && address < 0x383CF0 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }


    if(address == 0x383D80) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }


    if(address == 0x3841C0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address == 0x3844A0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x3844e0 && address < 0x3845c0 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x3848c0 && address < 0x3848e0 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }


    if(address >= 0x384e30 && address < 0x384e60 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x385330 && address < 0x385350 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }


    if(address >= 0x385360 && address < 0x385390 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }


    if(address == 0x3853b0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }


    if(address == 0x3856c0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }


    if(address >= 0x3859a0 && address < 0x385a00 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }


    if(address >= 0x385a30 && address < 0x385aa0 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }


    if(address >= 0x385df0 && address < 0x385da0 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x386080 && address < 0x386140 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x386360 && address < 0x386380 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address == 0x386590) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x3871d0 && address < 0x387240 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x387450 && address < 0x3874c0 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }


    if(address == 0x387520) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x387530 && address < 0x387580 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address == 0x387590) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x3875B0 && address < 0x387660 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x3877A0 && address < 0x3878A0 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x387AF0 && address < 0x387BA0 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address == 0x387AA0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x387950 && address < 0x387A50 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x3878D0 && address < 0x387910 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x387C40 && address < 0x387CC0 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x387CD0 && address < 0x387CF0 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x387DC0 && address < 0x388040 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x388640 && address < 0x388690 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address == 0x388700) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address == 0x38B930) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x389E60 && address < 0x389ED0 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x38f7e0 && address < 0x38f820 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }


    if(address == 0x38FD00) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address == 0x38FE80) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x390C70 && address < 0x390CC0 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x391440 && address < 0x391470 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }


    if(address >= 0x391690 && address < 0x3916E0 && (address & 0xf) == 0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x391BA0 && address < 0x391C90 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x391CB0 && address < 0x391CE0 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x391D00 && address < 0x391D20 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x391D40 && address < 0x391D60 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address == 0x391DA0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x391DF0 && address < 0x391F60 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address == 0x392080) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x392180 && address < 0x392210 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address == 0x392240) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x392280 && address < 0x3922E0 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x392910 && address < 0x392920 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address == 0x392980) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address == 0x392ae0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x392D60 && address < 0x392DA0 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address == 0x392DB0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address == 0x393200) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x39F760 && address < 0x39F780 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x39F990 && address < 0x39F9E0 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x3A00D0 && address < 0x3A0120 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x3A0570 && address < 0x3A05E0 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x3A06E0 && address < 0x3A0700 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x3A0750 && address < 0x3A0780 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address == 0x3A0BC0) //xmm constants of rotation of d-engine
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x3A1090 && address < 0x3A10C0 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x3A12D0 && address < 0x3A1320 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x3A1380 && address < 0x3A13C0 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x3A1600 && address < 0x3A1640 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x3A1890 && address < 0x3A1920 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    //Check this when errors!!!
    if(address >= 0x3A1960 && address < 0x3A19C0 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }

    if(address >= 0x3A2010 && address < 0x3A2040 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x3A2050 && address < 0x3A2100 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }
    if(address >= 0x3A2540 && address < 0x3A2560 && (address & 0xf) == 0) //xmm constants of Multiple more functions
    {
      //Not actually a float
      return addOWORDToTable((uint128_t*)address);
    }


    if(sec.type == FileMap::SYM_PROC)
    {
        return NULL;
    }else if(sec.type == FileMap::SYM_CSTRING){
      if(address == 0x3128c8)
      {
        *offset = 4;
        return addStringToTable((const char*)0x3128c4);
      }
      if(address == 0x3128cc)
      {
        *offset = 8;
        return addStringToTable((const char*)0x3128c4);
      }
      if(address == 0x3128d0)
      {
        *offset = 12;
        return addStringToTable((const char*)0x3128c4);
      }
      return addStringToTable((const char*)address);
    }else if(sec.type == FileMap::SYM_CONSTVAR4){
      //printf("Float imm at 0x%llx\n", address);
      return addFloatToTable((const float*)address);
    }else if(sec.type == FileMap::SYM_CONSTVAR8){
      //printf("Double mem at 0x%llx\n", address);
      return addDoubleToTable((const double*)address);
    }else if(sec.type == FileMap::SYM_CFSTRING){
      //Allocate the new cfstring object
      return addCFStringToTable( (struct __builtin_CFString*)address );
    }else if(sec.type == FileMap::SYM_VAR){
      if(off < 0)
      {
        printf("address 0x%llx@0x%llx not in symbolmap (bss)\n", address, ud_obj->insn_offset);
        return NULL;
      }
      if(s.name.compare("svs") == 0 && strncmp(dasm_ptr->dasmCurrentSymbol->object->objectname.c_str(), "sv_", 3) != 0)
      {
        return NULL;
      }
      addPotentialConstant((uint32_t)address );

    }else if(sec.type == FileMap::SYM_CONSTVAR){
      if(ud_obj->mnemonic == UD_Ijmp)
      {
        if(dasm_ptr->jumptableCount >= 32)
        {
          printf("Exceeded jumptable limit\n");
          exit(-1);
        }
        dasm_ptr->jumptables[dasm_ptr->jumptableCount].address = address;
        snprintf(dasm_ptr->jumptables[dasm_ptr->jumptableCount].name, sizeof(dasm_ptr->jumptables[0].name), "%s_jumptab_%d", FunctionnameFromMangled(dasm_ptr->dasmCurrentSymbol->name.c_str()), dasm_ptr->jumptableCount);
        const char* jmptabname = dasm_ptr->jumptables[dasm_ptr->jumptableCount].name;
        dasm_ptr->jumptableCount++;
        return jmptabname;
      }
      if(ud_obj->mnemonic == UD_Icall)
      {
        //printf("Calltable handling needed const\n");
      }
      if(off < 0)
      {
        printf("address 0x%llx@0x%llx not in symbolmap (const)\n", address, ud_obj->insn_offset);
        return NULL;
      }
      addPotentialConstant((uint32_t)address );

    }else if(sec.type == FileMap::SYM_DATAVAR){
      if(ud_obj->mnemonic == UD_Ijmp)
      {
        printf("Jumptable handling needed data\n");
      }
      if(ud_obj->mnemonic == UD_Icall)
      {
        //printf("Calltable handling needed const\n");
      }
      if(off < 0)
      {
        printf("address 0x%llx@0x%llx not in symbolmap (data)\n", address, ud_obj->insn_offset);
        return NULL;
      }
      addPotentialConstant((uint32_t)address );

    }else if(sec.type == FileMap::SYM_POINTERS){
      if(address & 3)
      {
        return NULL;
      }
      uint32_t* ptr = (uint32_t*)address;
      int off = g_file_map.getSymbolForAddress(*ptr, &s);
      if(off != 0)
      {
        //printf("Error pointer var has offset: %d\n", off);
        return NULL;
      }

      snprintf(symname, 256, "ptss_%s", s.name.c_str());
      *offset = off;
      return symname;

    }else if(sec.type != FileMap::SYM_NONE){
      printf("Unhandled symbol type %d\n", sec.type);
    }


//    printf("Possible symbol: 0x%llx@0x%llx\n", address, ud_obj->pc);

    if(off >= 0)
    {

      addImport(s.name.c_str());

      *offset = off;
      strncpy(symname, s.name.c_str(), 256);
      return symname;
    }
    //printf("Resolve 0x%llx\n", address);
    return NULL;
  }





  struct dasmOutput_t
  {
    uint32_t address;
    char label[128];
    char mnemonic[128];
    char comment[128];
  };  

  struct impexp_t
  {
    char name[256];
    int count; //How often it is referenced
  };

  struct dasmImportExports_t
  {
    int numimports;
    int numexports;
    impexp_t imports[2048];
    impexp_t exports[2048];
  };


  struct stringTableEntry_t
  {
    const char* string;
    char name[32];

  };

  struct stringTable_t
  {
    int numstrings;
    stringTableEntry_t strings[4096];
  };


  enum floatType_t
  {
    VAR_FLOAT,
    VAR_DOUBLE,
    VAR_4BYTE,
    VAR_16BYTE
  };


  struct uint128_t
  {
    uint32_t dw0;
    uint32_t dw1;
    uint32_t dw2;
    uint32_t dw3;
  };

  struct floatTableEntry_t
  {
    union
    {
      float fval;
      double dval;
      uint64_t idval;
      uint32_t ifval;
      uint128_t iqval;
    };
    char name[32];
    floatType_t type;
  };


  struct floatTable_t
  {
    int numfloats;
    floatTableEntry_t floats[4096];
  };


  struct __builtin_CFString
  {
     const int *isa; // point to __CFConstantStringClassReference
     int flags;
     const char *str;
     long length;
  };

  struct CFStringTableEntry_t
  {
    char name[32];
    const struct __builtin_CFString *cfs;
  };

  struct CFStringTable_t
  {
    int numstrings;
    CFStringTableEntry_t strings[64];
  };

  struct jumpTable_t
  {
    char name[256];
    uint32_t address;
  };

  dasmOutput_t dasmOutputBuffer[8000];
  jumpTable_t jumptables[32];
  uint32_t jumptableCount;
  int jmplabelcounter;
  const FileMap::Symbol* dasmCurrentSymbol;
  dasmImportExports_t impexp;
  char codeOutputBuffer[16*1024*1024];
  int codeOutputBufferPos;
  char dataOutputBuffer[16*1024*1024];
  int dataOutputBufferPos;
  char rdataOutputBuffer[16*1024*1024];
  int rdataOutputBufferPos;

  stringTable_t stringtab;
  CFStringTable_t CFStringtab;
  floatTable_t floattab;
  uint32_t potentialConstants[1024*1024*4]; //all imm/mem references which need to be checked if they are maybe constants.
  uint32_t constantcounter;

  static const char* addStringToTable(const char* string)
  {
    char name[64];
    int attempts;
    unsigned int j;
    int i;

    addPotentialConstant((uint32_t)string);

    for(i = 0; i < dasm_ptr->stringtab.numstrings; ++i)
    {
      //String exists already? Then return its unique name
      if(strcmp(string, dasm_ptr->stringtab.strings[i].string) == 0)
      {
        return dasm_ptr->stringtab.strings[i].name;
      }
    }

    if((unsigned int)dasm_ptr->stringtab.numstrings >= sizeof(dasm_ptr->stringtab.strings)/sizeof(dasm_ptr->stringtab.strings[0]))
    {
      printf("Error: Exceeded max cstring limit\n");
      exit(-1);
    }
    //Strip non alnum characters of string and make it lowercase for a suitable name 
    char shortstring[17];

    if(string[0] == 0)
    {
      strcpy(shortstring, "null");
    }else if(string[0] == ' ' && string[1] == 0){
      strcpy(shortstring, "space");
    }else{
      for(i = 0, j = 0; j < sizeof(shortstring) -1 && string[i]; ++i)
      {
        if(isalnum(string[i]) || string[i] == '_' || string[i] == ' ')
        {
          shortstring[j] = tolower(string[i]);
          if(shortstring[j] == ' ')
          {
            shortstring[j] = '_';
          }
          ++j;
        }
      }
      shortstring[j] = 0;
    }

    for(attempts = 0; attempts < 500; attempts++)
    {
      if(attempts > 0)
      {
        sprintf(name, "_cstring_%s%d", shortstring, attempts);
      }else{
        sprintf(name, "_cstring_%s", shortstring);
      }
      for(i = 0; i < dasm_ptr->stringtab.numstrings; ++i)
      {
        //Name exists already? Then try a new one
        if(strcmp(name, dasm_ptr->stringtab.strings[i].name) == 0)
        {
          break;
        }
      }
      if(i == dasm_ptr->stringtab.numstrings)
      {
        //Name is unique
        strcpy(dasm_ptr->stringtab.strings[i].name, name);
        dasm_ptr->stringtab.strings[i].string = string;
        dasm_ptr->stringtab.numstrings++;
        return dasm_ptr->stringtab.strings[i].name;
      }
    }
    return NULL;
  }


  static const char* addCFStringToTable(const __builtin_CFString* string)
  {
    char name[64];
    int attempts;
    unsigned int j;
    int i;
    addPotentialConstant((uint32_t)string);

    for(i = 0; i < dasm_ptr->CFStringtab.numstrings; ++i)
    {
      //String exists already? Then return its unique name
      if(dasm_ptr->CFStringtab.strings[i].cfs == string)
      {
        return dasm_ptr->CFStringtab.strings[i].name;
      }
    }

    if((unsigned int)dasm_ptr->CFStringtab.numstrings >= sizeof(dasm_ptr->CFStringtab.strings)/sizeof(dasm_ptr->CFStringtab.strings[0]))
    {
      printf("Error: Exceeded max CFString limit\n");
      exit(-1);
    }
    //Strip non alnum characters of string and make it lowercase for a suitable name 
    char shortstring[17];

    if(string->str[0] == 0)
    {
      strcpy(shortstring, "null");
    }else if(string->str[0] == ' ' && string->str[1] == 0){
      strcpy(shortstring, "space");
    }else{
      for(i = 0, j = 0; j < sizeof(shortstring) -1 && i < string->length; ++i)
      {
        if(isalnum(string->str[i]) || string->str[i] == '_' || string->str[i] == ' ')
        {
          shortstring[j] = tolower(string->str[i]);
          if(shortstring[j] == ' ')
          {
            shortstring[j] = '_';
          }
          ++j;
        }
      }
      shortstring[j] = 0;
    }

    for(attempts = 0; attempts < 500; attempts++)
    {
      if(attempts > 0)
      {
        sprintf(name, "_cfstring_%s%d", shortstring, attempts);
      }else{
        sprintf(name, "_cfstring_%s", shortstring);
      }
      for(i = 0; i < dasm_ptr->CFStringtab.numstrings; ++i)
      {
        //Name exists already? Then try a new one
        if(strcmp(name, dasm_ptr->CFStringtab.strings[i].name) == 0)
        {
          break;
        }
      }
      if(i == dasm_ptr->CFStringtab.numstrings)
      {
        //Name is unique
        strcpy(dasm_ptr->CFStringtab.strings[i].name, name);
        dasm_ptr->CFStringtab.strings[i].cfs = string;
        dasm_ptr->CFStringtab.numstrings++;
        return dasm_ptr->CFStringtab.strings[i].name;
      }
    }
    return NULL;
  }

  static const char* add4ByteDataToTable(const uint32_t *val)
  {
    char name[64];
    int attempts;
    int i;

    addPotentialConstant((uint32_t)val);

    for(i = 0; i < dasm_ptr->floattab.numfloats; ++i)
    {
      //Float exists already? Then return its unique name
      if(dasm_ptr->floattab.floats[i].ifval == *val && dasm_ptr->floattab.floats[i].type == VAR_4BYTE)
      {
        return dasm_ptr->floattab.floats[i].name;
      }
    }

    if((unsigned int)dasm_ptr->floattab.numfloats >= sizeof(dasm_ptr->floattab.floats)/sizeof(dasm_ptr->floattab.floats[0]))
    {
      printf("Error: Exceeded max floats limit\n");
      exit(-1);
    }
    //Strip non alnum characters of string and make it lowercase for a suitable name 
    char shortstring[17];

    sprintf(shortstring, "%x", *val);

    for(i = 0; i < (int)sizeof(shortstring) && shortstring[i]; ++i)
    {
      if(shortstring[i] == '.' || shortstring[i] == '-')
      {
        shortstring[i] = '_';
      }
    }

    for(attempts = 0; attempts < 500; attempts++)
    {
      if(attempts > 0)
      {
        sprintf(name, "_data4_%s%d", shortstring, attempts);
      }else{
        sprintf(name, "_data4_%s", shortstring);
      }
      for(i = 0; i < dasm_ptr->floattab.numfloats; ++i)
      {
        //Name exists already? Then try a new one
        if(strcmp(name, dasm_ptr->floattab.floats[i].name) == 0)
        {
          break;
        }
      }
      if(i == dasm_ptr->floattab.numfloats)
      {
        //Name is unique
        strcpy(dasm_ptr->floattab.floats[i].name, name);
        dasm_ptr->floattab.floats[i].ifval = *val;
        dasm_ptr->floattab.floats[i].type = VAR_4BYTE;
        dasm_ptr->floattab.numfloats++;
        return dasm_ptr->floattab.floats[i].name;
      }
    }
    return NULL;
  }

  static const char* addOWORDToTable(uint128_t *val)
  {
    char name[64];
    int attempts;
    int i;

    addPotentialConstant((uint32_t)val);

    for(i = 0; i < dasm_ptr->floattab.numfloats; ++i)
    {
      //Float exists already? Then return its unique name
      if(dasm_ptr->floattab.floats[i].type == VAR_16BYTE && 
        dasm_ptr->floattab.floats[i].iqval.dw0 == val->dw0 && 
        dasm_ptr->floattab.floats[i].iqval.dw1 == val->dw1 && 
        dasm_ptr->floattab.floats[i].iqval.dw2 == val->dw2 && 
        dasm_ptr->floattab.floats[i].iqval.dw3 == val->dw3)
      {
        return dasm_ptr->floattab.floats[i].name;
      }
    }

    if((unsigned int)dasm_ptr->floattab.numfloats >= sizeof(dasm_ptr->floattab.floats)/sizeof(dasm_ptr->floattab.floats[0]))
    {
      printf("Error: Exceeded max floats limit\n");
      exit(-1);
    }
    //Strip non alnum characters of string and make it lowercase for a suitable name 
    char shortstring[17];

    sprintf(shortstring, "%x", val->dw0);

    for(i = 0; i < (int)sizeof(shortstring) && shortstring[i]; ++i)
    {
      if(shortstring[i] == '.' || shortstring[i] == '-')
      {
        shortstring[i] = '_';
      }
    }

    for(attempts = 0; attempts < 500; attempts++)
    {
      if(attempts > 0)
      {
        sprintf(name, "_data16_%s%d", shortstring, attempts);
      }else{
        sprintf(name, "_data16_%s", shortstring);
      }
      for(i = 0; i < dasm_ptr->floattab.numfloats; ++i)
      {
        //Name exists already? Then try a new one
        if(strcmp(name, dasm_ptr->floattab.floats[i].name) == 0)
        {
          break;
        }
      }
      if(i == dasm_ptr->floattab.numfloats)
      {
        //Name is unique
        strcpy(dasm_ptr->floattab.floats[i].name, name);
        dasm_ptr->floattab.floats[i].iqval = *val;
        dasm_ptr->floattab.floats[i].type = VAR_16BYTE;
        dasm_ptr->floattab.numfloats++;
        return dasm_ptr->floattab.floats[i].name;
      }
    }
    return NULL;
  }



  static const char* addFloatToTable(const float *val)
  {
    char name[64];
    int attempts;
    int i;

    addPotentialConstant((uint32_t)val);

    for(i = 0; i < dasm_ptr->floattab.numfloats; ++i)
    {
      //Float exists already? Then return its unique name
      if(dasm_ptr->floattab.floats[i].fval == *val && dasm_ptr->floattab.floats[i].type == VAR_FLOAT)
      {
        return dasm_ptr->floattab.floats[i].name;
      }
    }

    if((unsigned int)dasm_ptr->floattab.numfloats >= sizeof(dasm_ptr->floattab.floats)/sizeof(dasm_ptr->floattab.floats[0]))
    {
      printf("Error: Exceeded max floats limit\n");
      exit(-1);
    }
    //Strip non alnum characters of string and make it lowercase for a suitable name 
    char shortstring[17];

    sprintf(shortstring, "%4.8f", *val);

    for(i = 0; i < (int)sizeof(shortstring) && shortstring[i]; ++i)
    {
      if(shortstring[i] == '.' || shortstring[i] == '-')
      {
        shortstring[i] = '_';
      }
    }

    for(attempts = 0; attempts < 500; attempts++)
    {
      if(attempts > 0)
      {
        sprintf(name, "_float_%s%d", shortstring, attempts);
      }else{
        sprintf(name, "_float_%s", shortstring);
      }
      for(i = 0; i < dasm_ptr->floattab.numfloats; ++i)
      {
        //Name exists already? Then try a new one
        if(strcmp(name, dasm_ptr->floattab.floats[i].name) == 0)
        {
          break;
        }
      }
      if(i == dasm_ptr->floattab.numfloats)
      {
        //Name is unique
        strcpy(dasm_ptr->floattab.floats[i].name, name);
        dasm_ptr->floattab.floats[i].fval = *val;
        dasm_ptr->floattab.floats[i].type = VAR_FLOAT;
        dasm_ptr->floattab.numfloats++;
        return dasm_ptr->floattab.floats[i].name;
      }
    }
    return NULL;
  }


  static const char* addDoubleToTable(const double *val)
  {
    char name[64];
    int attempts;
    int i;

    addPotentialConstant((uint32_t)val);

    for(i = 0; i < dasm_ptr->floattab.numfloats; ++i)
    {
      //Float exists already? Then return its unique name
      if(dasm_ptr->floattab.floats[i].dval == *val && dasm_ptr->floattab.floats[i].type == VAR_DOUBLE)
      {
        return dasm_ptr->floattab.floats[i].name;
      }
    }

    if((unsigned int)dasm_ptr->floattab.numfloats >= sizeof(dasm_ptr->floattab.floats)/sizeof(dasm_ptr->floattab.floats[0]))
    {
      printf("Error: Exceeded max floats limit\n");
      exit(-1);
    }
    //Strip non alnum characters of string and make it lowercase for a suitable name 
    char shortstring[17];

    sprintf(shortstring, "%4.8f", *val);

    for(i = 0; i < (int)sizeof(shortstring) && shortstring[i]; ++i)
    {
      if(shortstring[i] == '.' || shortstring[i] == '-')
      {
        shortstring[i] = '_';
      }
    }

    for(attempts = 0; attempts < 500; attempts++)
    {
      if(attempts > 0)
      {
        sprintf(name, "_double_%s%d", shortstring, attempts);
      }else{
        sprintf(name, "_double_%s", shortstring);
      }
      for(i = 0; i < dasm_ptr->floattab.numfloats; ++i)
      {
        //Name exists already? Then try a new one
        if(strcmp(name, dasm_ptr->floattab.floats[i].name) == 0)
        {
          break;
        }
      }
      if(i == dasm_ptr->floattab.numfloats)
      {
        //Name is unique
        strcpy(dasm_ptr->floattab.floats[i].name, name);
        dasm_ptr->floattab.floats[i].dval = *val;
        dasm_ptr->floattab.floats[i].type = VAR_DOUBLE;
        dasm_ptr->floattab.numfloats++;
        return dasm_ptr->floattab.floats[i].name;
      }
    }
    return NULL;
  }



  void clearStringtable()
  {
    stringtab.numstrings = 0;
  }

  void clearCFStringtable()
  {
    CFStringtab.numstrings = 0;
  }

  void clearFloattable()
  {
    floattab.numfloats = 0;
  }

  void emitChar(char c, char* escapestring, int* outstringcount, bool* inquotes)
  {
    int k = *outstringcount;
    
    if(!*inquotes && k > 0)
    {
      escapestring[k] = ',';
      ++k;
    }

    switch(c)
    {
      case '\'':
      case '\"':
      case '\\':
      case '\t':
      case '\n':
      case '\r':
      case '?':
      case '\x60':
          if(*inquotes)
          {
            escapestring[k] = '\"';
            escapestring[k+1] = ',';
            k +=2;
            *inquotes = false;
          }
          char idx[12];
          sprintf(idx, "%02x", (unsigned char)c);
          escapestring[k+0] = idx[0];
          escapestring[k+1] = idx[1];
          escapestring[k+2] = 'h';          
          k += 3;
          break;
      default:
        if(c >= ' ')
        {
          if(!*inquotes)
          {
            escapestring[k+0] = '\"';
            k += 1;
            *inquotes = true;
          }
          escapestring[k] = c;
          ++k;
        }else{
          if(*inquotes)
          {
            escapestring[k] = '\"';
            escapestring[k+1] = ',';
            k +=2;
            *inquotes = false;
          }

          char idx[13];
          sprintf(idx, "0%02x", (unsigned char)c);
          escapestring[k+0] = idx[0];
          escapestring[k+1] = idx[1];
          escapestring[k+2] = idx[2];
          escapestring[k+3] = 'h';
          k += 4;
        }
    }
    *outstringcount = k;
  }


  void dumpStringtableToFile(FILE* f)
  {
    int i;
    bool inquotes;
    fprintf(f, "\n\n;All cstrings:\nSECTION .rdata\n");
    for(i = 0; i < stringtab.numstrings; ++i)
    {
      //String escaping before writing to file
      char escapestring[8192];
      int k;
      
      const char* s = stringtab.strings[i].string;

      inquotes = false;

      for(k = 0; *s && k < 8187; ++s)
      {
        emitChar(*s, escapestring, &k, &inquotes);
      }
      if(inquotes)
      {
        escapestring[k] = '\"';
        ++k;
        inquotes = false;
      }
      if(k > 0)
      {
        escapestring[k] = ',';
        ++k;
      }
      escapestring[k] = '0';
      escapestring[k+1] = 0;
      if(k == 8187)
      {
        printf("Error: Oversize string needs software fix!\n");
      }
      //Escaped string
      fprintf(f, "%s:\t\tdb %s\n", stringtab.strings[i].name, escapestring);
    }
    fprintf(f, "\n");
  }

  void dumpFloattableToFile(FILE* f)
  {
    int i;
    fprintf(f, "\n\n;All constant floats and doubles:\nSECTION .rdata\n");
    for(i = 0; i < floattab.numfloats; ++i)
    {
      if(floattab.floats[i].type == VAR_FLOAT)
      {
        fprintf(f, "%s:\t\tdd 0x%x\t; %g\n", floattab.floats[i].name, floattab.floats[i].ifval, floattab.floats[i].fval);
      }else if(floattab.floats[i].type == VAR_DOUBLE){
        fprintf(f, "%s:\t\tdq 0x%llx\t; %g\n", floattab.floats[i].name, floattab.floats[i].idval, floattab.floats[i].dval);
      }else if(floattab.floats[i].type == VAR_4BYTE){
        fprintf(f, "%s:\t\tdd 0x%x\t; DWORD\n", floattab.floats[i].name, floattab.floats[i].ifval);
      }else if(floattab.floats[i].type == VAR_16BYTE){
        fprintf(f, "%s:\t\tdd 0x%x, 0x%x, 0x%x, 0x%x\t; OWORD\n", floattab.floats[i].name, floattab.floats[i].iqval.dw0, floattab.floats[i].iqval.dw1, floattab.floats[i].iqval.dw2, floattab.floats[i].iqval.dw3);
      }
    }
    fprintf(f, "\n");
  }

       const int *isa; // point to __CFConstantStringClassReference
     int flags;
     const char *str;
     long length;

  void dumpCFStringtableToFile(FILE* f)
  {
    int i;
    if(CFStringtab.numstrings <= 0)
    {
      return;
    }
    fprintf(f, "\n\n;All CFStrings:\n\n");
    fprintf(f, "STRUC CFString\n");
    fprintf(f, ".isa: RESD 1\n");
    fprintf(f, ".flags: RESD 1\n");
    fprintf(f, ".str: RESD 1\n");
    fprintf(f, ".length: RESD 1\n");
    fprintf(f, "ENDSTRUC\n\n");

    fprintf(f, "SECTION .rdata\n");

    for(i = 0; i < CFStringtab.numstrings; ++i)
    {
      if(CFStringtab.strings[i].cfs->isa != NULL)
      {
        printf("CFString.isa != NULL Can't handle!\n");
      }

      fprintf(f, "%s:\t\tISTRUCT CFString\n", CFStringtab.strings[i].name);
      fprintf(f, "AT CFString.isa, dd %x\n", (uint32_t)CFStringtab.strings[i].cfs->isa);
      fprintf(f, "AT CFString.flags, dd 0x%x\n", CFStringtab.strings[i].cfs->flags);
      const char* cstringname = addStringToTable(CFStringtab.strings[i].cfs->str);
      fprintf(f, "AT CFString.str dd %s\n", cstringname);
      fprintf(f, "AT CFString.length dd %d\n", (uint32_t)CFStringtab.strings[i].cfs->length);
      fprintf(f, "IEND\n\n");
    }
    fprintf(f, "\n");
  }


  static bool DoNotExport(const char* name)
  {
    if(strncmp(name, "g_swizzle", 9) == 0)
    {
      return true;
    }
    if(strncmp(name, "g_keepX", 7) == 0 || strncmp(name, "g_keepY", 7) == 0 || strncmp(name, "g_keepZ", 7) == 0)
    {
      return true;
    }
    if(strncmp(name, "g_selectW_", 10) == 0 || strncmp(name, "g_selectX_", 10) == 0 || strncmp(name, "g_selectY_", 10) == 0 || strncmp(name, "g_selectZ_", 10) == 0)
    {
      return true;
    } 
    if(strncmp(name, "g_fltMin__uint4", 15) == 0 || strncmp(name, "g_seg_negativeZero__uint4lectX", 30) == 0 || strncmp(name, "g_inc__uint4", 12) == 0 || strncmp(name, "g_fltMin", 8) == 0)
    {
      return true;
    }     
    if(strncmp(name, "g_negativeZero", 14) == 0 || strncmp(name, "g_inc_dup_1", 11) == 0)
    {
      return true;
    }   
    return false;
  }




  static void addExport(const char* name)
  {
    if(DoNotExport(name))
    {
      return;
    }


    if(dasm_ptr->impexp.numexports >= 2048)
    {
      printf("Max Import/Export count exceeded\n");
      exit(-1);
    }
    strncpy(dasm_ptr->impexp.exports[dasm_ptr->impexp.numexports].name, name, sizeof(dasm_ptr->impexp.exports[0].name));
    dasm_ptr->impexp.exports[dasm_ptr->impexp.numexports].count = 1;
    ++dasm_ptr->impexp.numexports;
  }

  static void addImport(const char* name)
  {
    int i;

    //Does it exist already?
    for(i = 0; i < dasm_ptr->impexp.numimports; ++i)
    {
      if(strcmp(dasm_ptr->impexp.imports[i].name, name) == 0)
      {
        ++dasm_ptr->impexp.imports[i].count;
        return;
      }
    }
    //Nope - Add it
    if(dasm_ptr->impexp.numimports >= 2048)
    {
      printf("Max Import/Export count exceeded\n");
      exit(-1);
    }
    strncpy(dasm_ptr->impexp.imports[dasm_ptr->impexp.numimports].name, name, sizeof(dasm_ptr->impexp.imports[0].name));
    dasm_ptr->impexp.imports[i].count = 1;
    ++dasm_ptr->impexp.numimports;
  }

  static void delImportReference(const char* name)
  {
    int i;
    //Does it exist already?
    for(i = 0; i < dasm_ptr->impexp.numimports; ++i)
    {
      if(strcmp(dasm_ptr->impexp.imports[i].name, name) == 0)
      {
        --dasm_ptr->impexp.imports[i].count;
        return;
      }
    }
  }

  bool donotdisassemble(const string &procname)
  {
    if(procname.compare("deflate") == 0)
    {
      return true;
    }
    if(procname.compare("inflate") == 0)
    {
      return true;
    }
    if(procname.compare("adler32") == 0)
    {
      return true;
    }
    if(procname.compare("infblock") == 0)
    {
      return true;
    }
    if(procname.compare("infcodes") == 0)
    {
      return true;
    }
    if(procname.compare("inffast") == 0)
    {
      return true;
    }
    if(procname.compare("inftrees") == 0)
    {
      return true;
    }
    if(procname.compare("infutil") == 0)
    {
      return true;
    }
    if(procname.compare("jcapimin") == 0)
    {
      return true;
    }
    if(procname.compare("jcmainct") == 0)
    {
      return true;
    }
    if(procname.compare("jcsample") == 0)
    {
      return true;
    }
    if(procname.compare("jdhuff") == 0)
    {
      return true;
    }
    if(procname.compare("jdpostct") == 0)
    {
      return true;
    }
    if(procname.compare("jidctfst") == 0)
    {
      return true;
    }
    if(procname.compare("jquant2") == 0)
    {
      return true;
    }
    if(procname.compare("jcapistd") == 0)
    {
      return true;
    }
    if(procname.compare("jcmarker") == 0)
    {
      return true;
    }
    if(procname.compare("jdapimin") == 0)
    {
      return true;
    }
    if(procname.compare("jdinput") == 0)
    {
      return true;
    }
    if(procname.compare("jdsample") == 0)
    {
      return true;
    }
    if(procname.compare("jidctint") == 0)
    {
      return true;
    }
    if(procname.compare("jdmainct") == 0)
    {
      return true;
    }
    if(procname.compare("jutils") == 0)
    {
      return true;
    }
    if(procname.compare("jccoefct") == 0)
    {
      return true;
    }
    if(procname.compare("jcmaster") == 0)
    {
      return true;
    }
    if(procname.compare("jdapistd") == 0)
    {
      return true;
    }
    if(procname.compare("jerror") == 0)
    {
      return true;
    }
    if(procname.compare("jidctred") == 0)
    {
      return true;
    }
    if(procname.compare("jccolor") == 0)
    {
      return true;
    }
    if(procname.compare("jcomapi") == 0)
    {
      return true;
    }
    if(procname.compare("jdatasrc") == 0)
    {
      return true;
    }
    if(procname.compare("jdmarker") == 0)
    {
      return true;
    }
    if(procname.compare("jfdctflt") == 0)
    {
      return true;
    }
    if(procname.compare("jmemmgr") == 0)
    {
      return true;
    }
    if(procname.compare("jcdctmgr") == 0)
    {
      return true;
    }
    if(procname.compare("jcparam") == 0)
    {
      return true;
    }
    if(procname.compare("jdcoefct") == 0)
    {
      return true;
    }
    if(procname.compare("jdmaster") == 0)
    {
      return true;
    }
    if(procname.compare("jfdctfst") == 0)
    {
      return true;
    }
    if(procname.compare("jmemnobs") == 0)
    {
      return true;
    }
    if(procname.compare("jchuff") == 0)
    {
      return true;
    }
    if(procname.compare("jcphuff") == 0)
    {
      return true;
    }
    if(procname.compare("jdcolor") == 0)
    {
      return true;
    }
    if(procname.compare("jdmerge") == 0)
    {
      return true;
    }
    if(procname.compare("jfdctint") == 0)
    {
      return true;
    }
    if(procname.compare("jquant1") == 0)
    {
      return true;
    }
    if(procname.compare("jcinit") == 0)
    {
      return true;
    }
    if(procname.compare("jcprepct") == 0)
    {
      return true;
    }
    if(procname.compare("jddctmgr") == 0)
    {
      return true;
    }
    if(procname.compare("jdphuff") == 0)
    {
      return true;
    }
    if(procname.compare("jidctflt") == 0)
    {
      return true;
    }
    if(procname.compare("unknown585") == 0 || procname.compare("unknown588") == 0) //Contains lot of Mac OS X stuff which comes most likely from a static library
    {
      return true;
    }
    if(procname.compare("_dyld_func_lookup_dup_1") == 0 || procname.compare("_dyld_func_lookup") == 0) //Junk
    {
      return true;
    }
    if(procname.compare("_Z19GetEntityFieldValuejii") == 0) //Will generate junk. Needs to be external implemented
    {
      return true;
    }
    return false; 
  }

  static int jumpTableSort(const void* a1, const void* a2)
  {
    jumpTable_t* j1 = (jumpTable_t*)a1;
    jumpTable_t* j2 = (jumpTable_t*)a2;

    if(j1->address < j2->address) return -1;
    if(j1->address > j2->address) return 1;


    printf("Error: Duplicate address in jumptable detected\n");
    exit(1);

    return 0;
  }


  void disassembleProcedure(FileMap::Symbol* s, ud_t* ud_obj)
  {
    char demangledname[32768]; //would try realloc on failure. so it is really large so it won't happen
    int instructionLength;
    int instructionCounter;

    if(donotdisassemble(s->name))
    {
      s->_export = false;
      return;
    }

    dasm_ptr = this;
    //Reset the jump label counter because this is new procedure
    jmplabelcounter = 0;
    //Reset jumptable counter
    jumptableCount = 0;
    //Storing current symbol so symbol resolver can know what the active function is
    dasmCurrentSymbol = s;

    uint32_t pc = s->address;

    ud_set_input_buffer(ud_obj, (uint8_t*)s->address, s->size);
    ud_set_pc(ud_obj, pc);
    ud_obj->inp_buf_index = 0;//entrypoint;

    size_t l = sizeof(demangledname);
    int status;

    abi::__cxa_demangle ( s->name.c_str(), demangledname, &l, &status); 

    if(status != 0)
    {
      strncpy(demangledname, s->name.c_str(), sizeof(demangledname));
    }
    
//    printf("\nDisassemble %s\n", demangledname);

    codeOutputBufferPos += snprintf(codeOutputBuffer +codeOutputBufferPos, sizeof(codeOutputBuffer) - codeOutputBufferPos, ";%s\n", demangledname);
    codeOutputBufferPos += snprintf(codeOutputBuffer +codeOutputBufferPos, sizeof(codeOutputBuffer) - codeOutputBufferPos, "%s:\n", FunctionnameFromMangled(s->name.c_str()));

//      int getSymbolForAddress(uint32_t address, Symbol* s);

    //Just get the addresses
    instructionCounter = 0;

    //No symbol resolving when generating address map
    ud_obj->sym_resolver = NULL;
    ud_obj->sym_resolver_imm = NULL; //symbolResolver_imm;
    ud_obj->sym_resolver_mem_disp = NULL;

    //fill in the address column first
    while(pc = ud_obj->pc, !ud_input_end(ud_obj) && ud_disassemble(ud_obj))
    {
      dasmOutputBuffer[instructionCounter].address = pc;
      dasmOutputBuffer[instructionCounter].label[0] = 0;
      dasmOutputBuffer[instructionCounter].comment[0] = 0;
      ++instructionCounter;
      if(instructionCounter >= 8000)
      {
        printf("instructionCounter exceeded\n");
        exit(-1);
      }
    }
    dasmOutputBuffer[instructionCounter].address = 0;

    pc = s->address;
    instructionCounter = 0;
    ud_set_input_buffer(ud_obj, (uint8_t*)s->address, s->size);
    ud_set_pc(ud_obj, pc);
    ud_obj->inp_buf_index = 0; //entrypoint;

    //Now we need symbol resolving
    ud_obj->sym_resolver = symbolResolver;
    ud_obj->sym_resolver_imm = symbolResolver_imm;
    ud_obj->sym_resolver_mem_disp = symbolResolver_mem_disp;

    //Now complete it - have to reset
    while (pc = ud_obj->pc, !ud_input_end(ud_obj) && (instructionLength = ud_disassemble(ud_obj)))
    {
      strncpy(dasmOutputBuffer[instructionCounter].mnemonic, ud_insn_asm(ud_obj), sizeof(dasmOutputBuffer[0].mnemonic));
      char* l = strstr(dasmOutputBuffer[instructionCounter].mnemonic, ", [ptss_");
      if(l)
      {
        char* lz = l;
        l += 8;
        while(isalnum(*l) || *l == '_')
        {
          ++l;
        }
        if(*l == ']')
        {
          char ptrless[128];
          char delimp[128];
          strcpy(ptrless, lz +8);
          l = ptrless;
          while(isalnum(*l) || *l == '_')
          {
            ++l;
          }
          *l = 0;
          sprintf(lz, ", %s", FunctionnameFromMangled(ptrless));
          sprintf(delimp, "ptss_%s", ptrless);
          delImportReference(delimp);
          addImport(FunctionnameFromMangled(ptrless));
        }
      }
      ++instructionCounter;
    }

    unsigned int i;

    if(jumptableCount > 1)
    {
      qsort(jumptables, jumptableCount, sizeof(jumptables[0]), jumpTableSort);
    }
    if(jumptableCount > 0)
    {
      int z;
      for(z = 0; z < 2; ++z)
      {
        dasmOutputBuffer[instructionCounter].comment[0] = 0;
        dasmOutputBuffer[instructionCounter].label[0] = 0;
        dasmOutputBuffer[instructionCounter].mnemonic[0] = 0;
        dasmOutputBuffer[instructionCounter].address = -1;
        ++instructionCounter;
      }
      for(i = 0; i < jumptableCount; ++i)
      {
        int size;
        if(i +1 < jumptableCount)
        {
          size = (jumptables[i+1].address - jumptables[i].address) /4;
        }else{
          size = -1; //undefined will abort when address is not in function frame
        }
        for(z = 0; z < size || size == -1; ++z)
        {
          uint32_t jloc = ((uint32_t*)jumptables[i].address)[z];
          int q;
          for(q = 0; q < instructionCounter; ++q)
          {
            if(dasmOutputBuffer[q].address == jloc)
            {
              if(dasmOutputBuffer[q].label[0] == 0)
              {
                jmplabelcounter += 10;
                snprintf(dasmOutputBuffer[q].label, sizeof(dasmOutputBuffer[0].label), "%s_%i", FunctionnameFromMangled(dasmCurrentSymbol->name.c_str()), jmplabelcounter);
              }
              break;
            }
          }
          if(q == instructionCounter)
          {
            break; //End of jumptable
          }
          snprintf(dasmOutputBuffer[instructionCounter].mnemonic, sizeof(dasmOutputBuffer[0].mnemonic), "dd %s", dasmOutputBuffer[q].label);
          dasmOutputBuffer[instructionCounter].comment[0] = 0;
          if(z == 0)
          {
            strncpy(dasmOutputBuffer[instructionCounter].label, jumptables[i].name, sizeof(dasmOutputBuffer[0].label));
          }else{
            dasmOutputBuffer[instructionCounter].label[0] = 0;
          }
          dasmOutputBuffer[instructionCounter].address = -1;
          ++instructionCounter;
        }
      }
    }
    for(i = 0; i < (unsigned int)instructionCounter; ++i)
    {
      if(strcmp(dasmOutputBuffer[i].mnemonic, "invalid") != 0)
      {
        if(dasmOutputBuffer[i].label[0])
        {
          codeOutputBufferPos += snprintf(codeOutputBuffer +codeOutputBufferPos, sizeof(codeOutputBuffer) - codeOutputBufferPos, "%s:\n", dasmOutputBuffer[i].label);
        }
        codeOutputBufferPos += snprintf(codeOutputBuffer +codeOutputBufferPos, sizeof(codeOutputBuffer) - codeOutputBufferPos, "\t%s\n", dasmOutputBuffer[i].mnemonic);
        
      }
    }

  }


  const char* symbolResolver_data(uint64_t address, uint64_t location)
  {
    static char symnamebuf[4096];
    static int select = 0;
    char* symname = &symnamebuf[256 * select];
    select++;
    if(select >= 16)
    {
      select = 0;
    }

    FileMap::Symbol s;
    uint32_t v = address;
    if(v > 0x2f00)
    {
      FileMap::SectionData sec;
      if(g_file_map.getSectionDetailsForAddress(v, &sec))
      {
        if(sec.type == FileMap::SYM_CSTRING)
        {

          const char* cstring = (const char*)v;
          if(cstring[-1] != 0)
          {
            return NULL;
          }
          /*
          const char* dbgname;
          int off = g_file_map.getSymbolForAddress(location, &s);
          if(off >= 0)
          {
            dbgname = s.name.c_str();
          }
          else
          {
            dbgname = "FAAAAAAAAAAAAIIIIIIIIIIIIIILLLLLLLL";
          }
          printf("Symbol reference from %s in .rdata 0x%x %s\n", dbgname, v, (const char*)v);
          */
          return addStringToTable(cstring);
        }else{
          int off = g_file_map.getSymbolForAddress(v, &s);
          if(off == 0 && v != 0x2e7410)
          {
            addImport(s.name.c_str());
            strncpy(symname, s.name.c_str(), 256);
            return symname;
//              printf("Symbol reference in .rdata 0x%x@0x%x  %s+%d@%s\n", v, (uint32_t)(((uint32_t*)o->symbols[j]->address) +i), s.name.c_str(), off, o->symbols[j]->name.c_str());
          }
        }
      }
      /*
      if(off >= 0)
      {
        printf("Address reference in .data 0x%x@0x%x\n", v, ((uint32_t*)o->symbols[j]->address) +i);
      }
      */
    }
    return NULL;

  }

  const char* symbolResolver_rdata(uint64_t address, uint64_t location)
  {
    static char symnamebuf[4096];
    static int select = 0;
    char* symname = &symnamebuf[256 * select];
    select++;
    if(select >= 16)
    {
      select = 0;
    }

    FileMap::Symbol s;
    uint32_t v = address;
    if(v < 0x2f00 || v == 0x90030 || (location > 0x38c360 && location < 0x38f900))
    {
      return NULL;
    }
    FileMap::SectionData sec;
    if(g_file_map.getSectionDetailsForAddress(v, &sec))
    {
      if(sec.type == FileMap::SYM_CSTRING)
      {
        const char* cstring = (const char*)v;
        if(cstring[-1] != 0)
        {
            return NULL;
        }
      /*
        const char* dbgname;
        int off = g_file_map.getSymbolForAddress(location, &s);
        if(off >= 0)
        {
          dbgname = s.name.c_str();
        }
        else
        {
          dbgname = "FAAAAAAAAAAAAIIIIIIIIIIIIIILLLLLLLL";
        }
        printf("Symbol reference from %s in .rdata 0x%x %s\n", dbgname, v, (const char*)v);
      */
        return addStringToTable(cstring);
      }else{
        int off = g_file_map.getSymbolForAddress(v, &s);
        if(off == 0)
        {
          const char* sn = s.name.c_str();
          if(s.type == FileMap::SYM_PROC)
          {
            sn = FunctionnameFromMangled(s.name.c_str());
          }
          addImport(sn);
          strncpy(symname, sn, 256);
          return symname;
        }
      }
    }
    /*
    if(off >= 0)
    {
      printf("Address reference in .data 0x%x@0x%x\n", v, ((uint32_t*)o->symbols[j]->address) +i);
    }
    */
    return NULL;

  }



  void disassembleObject(const FileMap::ObjectMap* o, ud_t* ud_obj)
  {
    int j, i;
    char outputfilename[256];
    FILE* outputFileHandle;

    codeOutputBufferPos = 0;
    dataOutputBufferPos = 0;
    rdataOutputBufferPos = 0;

    //Reset imports/exports counter for new object
    impexp.numimports = 0;
    impexp.numexports = 0;

    if(donotdisassemble(o->objectname))
    {
      return;
    }

    clearCFStringtable();
    clearStringtable();
    clearFloattable();

    for(j = 0; j < o->symbolcount; ++j)
    {
      if(o->symbols[j]->type == FileMap::SYM_PROC || o->symbols[j]->type == FileMap::SYM_GLOBCONST)
      {
        codeOutputBuffer[codeOutputBufferPos] = '\n';
        codeOutputBuffer[codeOutputBufferPos +1] = '\n';
        codeOutputBufferPos += 2;
        disassembleProcedure(o->symbols[j], ud_obj);
      }
      if(o->symbols[j]->_export == false)
      {
        //Module internal
        continue;
      }
      //printf("%s, %s, 0x%x, %d\n", o->symbols[j]->name.c_str(), symtypename(o->symbols[j]->type), o->symbols[j]->address, o->symbols[j]->size);
      if(o->symbols[j]->type == FileMap::SYM_PROC)
      {
        addExport(FunctionnameFromMangled(o->symbols[j]->name.c_str()));
      }else{
        addExport(o->symbols[j]->name.c_str());
      }
    }

    snprintf(outputfilename, sizeof(outputfilename), "src/_%s.asm", o->objectname.c_str());

    outputFileHandle = fopen(outputfilename, "wb");

    if(outputFileHandle == NULL)
    {
      printf("Error opening output file!\n");
      return;
    }


    //data:
    for(j = 0; j < o->symbolcount; ++j)
    {
      if(o->symbols[j]->type == FileMap::SYM_DATAVAR)
      {

        dataOutputBufferPos += snprintf(dataOutputBuffer +dataOutputBufferPos, sizeof(dataOutputBuffer) - dataOutputBufferPos, "%s: ", o->symbols[j]->name.c_str());

        int end = o->symbols[j]->size / 4;
        if(end > 0)
        {
          dataOutputBufferPos += snprintf(dataOutputBuffer +dataOutputBufferPos, sizeof(dataOutputBuffer) - dataOutputBufferPos, "dd ");
        }
        for(i = 0; i < end; ++i)
        {
          uint32_t v = ((uint32_t*)o->symbols[j]->address)[i];
          const char* sym_name = symbolResolver_rdata(v, (uint32_t)(((uint32_t*)o->symbols[j]->address) +i));
          if(sym_name)
          {
            dataOutputBufferPos += snprintf(dataOutputBuffer +dataOutputBufferPos, sizeof(dataOutputBuffer) - dataOutputBufferPos, "%s", sym_name);
          }else{
            dataOutputBufferPos += snprintf(dataOutputBuffer +dataOutputBufferPos, sizeof(dataOutputBuffer) - dataOutputBufferPos, "0x%x", v);
          }
          if(i+1 < end)
          {
            dataOutputBufferPos += snprintf(dataOutputBuffer +dataOutputBufferPos, sizeof(dataOutputBuffer) - dataOutputBufferPos, ", ");
          }
        }
        if(o->symbols[j]->size & 3)
        {
          if(end > 0)
          {
            dataOutputBufferPos += snprintf(dataOutputBuffer +dataOutputBufferPos, sizeof(dataOutputBuffer) - dataOutputBufferPos, "\n\t\t");
          }
          dataOutputBufferPos += snprintf(dataOutputBuffer +dataOutputBufferPos, sizeof(dataOutputBuffer) - dataOutputBufferPos, "db ");

          for(i = 0; (unsigned int)i < (o->symbols[j]->size & 3); ++i)
          {
            dataOutputBufferPos += snprintf(dataOutputBuffer +dataOutputBufferPos, sizeof(dataOutputBuffer) - dataOutputBufferPos, "0x%x", ((uint8_t*)o->symbols[j]->address)[4*end + i]);
            if((unsigned int)(i+1) < (o->symbols[j]->size & 3))
            {
              dataOutputBufferPos += snprintf(dataOutputBuffer +dataOutputBufferPos, sizeof(dataOutputBuffer) - dataOutputBufferPos, ", ");
            }
          }
        }
        dataOutputBufferPos += snprintf(dataOutputBuffer +dataOutputBufferPos, sizeof(dataOutputBuffer) - dataOutputBufferPos, "\n");
      }
    }


    //rdata:
    for(j = 0; j < o->symbolcount; ++j)
    {
      if(o->symbols[j]->type == FileMap::SYM_CONSTVAR || o->symbols[j]->type == FileMap::SYM_VTABLE)
      {
        if(o->symbols[j]->type == FileMap::SYM_VTABLE)
        {
            const char *tabname = o->symbols[j]->name.c_str();
            if(strlen(tabname) >= 6)
            {
                tabname += 4;
                while(isdigit(*tabname))
                {
                    ++tabname;
                }
            }
            rdataOutputBufferPos += snprintf(rdataOutputBuffer +rdataOutputBufferPos, sizeof(rdataOutputBuffer) - rdataOutputBufferPos, ";VTable for %s:\n", tabname);
        }
        rdataOutputBufferPos += snprintf(rdataOutputBuffer +rdataOutputBufferPos, sizeof(rdataOutputBuffer) - rdataOutputBufferPos, "%s: ", o->symbols[j]->name.c_str());

        int end = o->symbols[j]->size / 4;
        if(end > 0)
        {
          rdataOutputBufferPos += snprintf(rdataOutputBuffer +rdataOutputBufferPos, sizeof(rdataOutputBuffer) - rdataOutputBufferPos, "dd ");
        }
        for(i = 0; i < end; ++i)
        {
          uint32_t v = ((uint32_t*)o->symbols[j]->address)[i];
          const char* sym_name = symbolResolver_rdata(v, (uint32_t)(((uint32_t*)o->symbols[j]->address) +i));
          if(sym_name)
          {
            rdataOutputBufferPos += snprintf(rdataOutputBuffer +rdataOutputBufferPos, sizeof(rdataOutputBuffer) - rdataOutputBufferPos,"%s", sym_name);
          }else{
            rdataOutputBufferPos += snprintf(rdataOutputBuffer +rdataOutputBufferPos, sizeof(rdataOutputBuffer) - rdataOutputBufferPos, "0x%x", v);
          }
          if(i+1 < end)
          {
            rdataOutputBufferPos += snprintf(rdataOutputBuffer +rdataOutputBufferPos, sizeof(rdataOutputBuffer) - rdataOutputBufferPos, ", ");
          }
        }
        if(o->symbols[j]->size & 3)
        {
          if(end > 0)
          {
            rdataOutputBufferPos += snprintf(rdataOutputBuffer +rdataOutputBufferPos, sizeof(rdataOutputBuffer) - rdataOutputBufferPos, "\n\t\t");
          }
          rdataOutputBufferPos += snprintf(rdataOutputBuffer +rdataOutputBufferPos, sizeof(rdataOutputBuffer) - rdataOutputBufferPos, "db ");

          for(i = 0; (unsigned int)i < (o->symbols[j]->size & 3); ++i)
          {
            rdataOutputBufferPos += snprintf(rdataOutputBuffer +rdataOutputBufferPos, sizeof(rdataOutputBuffer) - rdataOutputBufferPos, "0x%x", ((uint8_t*)o->symbols[j]->address)[4*end + i]);
            if((unsigned int)(i+1) < (o->symbols[j]->size & 3))
            {
              rdataOutputBufferPos += snprintf(rdataOutputBuffer +rdataOutputBufferPos, sizeof(rdataOutputBuffer) - rdataOutputBufferPos, ", ");
            }
          }
        }
        rdataOutputBufferPos += snprintf(rdataOutputBuffer +rdataOutputBufferPos, sizeof(rdataOutputBuffer) - rdataOutputBufferPos, "\n");
      }
    }


    fprintf(outputFileHandle, ";Imports of %s:\n", o->objectname.c_str());
    //Writing all import/exported objects
    for(i = 0; i < impexp.numimports; ++i)
    {
      //Ignore symbols of this object in importlist
      for(j = 0; j < o->symbolcount; ++j)
      {
        if(strcmp(impexp.imports[i].name,  FunctionnameFromMangled(o->symbols[j]->name.c_str())) == 0)
        {
          break;
        }
      }
      if(j == o->symbolcount && impexp.imports[i].count > 0)
      {
        fprintf(outputFileHandle, "\textern %s\n", impexp.imports[i].name);
      }
    }

    fprintf(outputFileHandle, "\n;Exports of %s:\n", o->objectname.c_str());
    //Writing all import/exported objects
    for(i = 0; i < impexp.numexports; ++i)
    {
      fprintf(outputFileHandle, "\tglobal %s\n", impexp.exports[i].name);
    }


    fprintf(outputFileHandle, "\n\nSECTION .text\n");
    fwrite(codeOutputBuffer, 1, codeOutputBufferPos, outputFileHandle);

    fprintf(outputFileHandle, "\n\n;Initialized global or static variables of %s:\n", o->objectname.c_str());
    fprintf(outputFileHandle, "SECTION .data\n");
    fwrite(dataOutputBuffer, 1, dataOutputBufferPos, outputFileHandle);

    fprintf(outputFileHandle, "\n\n;Initialized constant data of %s:\n", o->objectname.c_str());
    fprintf(outputFileHandle, "SECTION .rdata\n");
    fwrite(rdataOutputBuffer, 1, rdataOutputBufferPos, outputFileHandle);

    fprintf(outputFileHandle, "\n\n;Zero initialized global or static variables of %s:\n", o->objectname.c_str());
    fprintf(outputFileHandle, "SECTION .bss\n");

    for(j = 0; j < o->symbolcount; ++j)
    {
      if(o->symbols[j]->type == FileMap::SYM_VAR)
      {
        fprintf(outputFileHandle, "%s: resb 0x%x\n", o->symbols[j]->name.c_str(), o->symbols[j]->size);
      }
    }



    dumpCFStringtableToFile(outputFileHandle); //Needs to come first because this function will generate additional cstrings which needs to get dumped later
    dumpStringtableToFile(outputFileHandle);
    dumpFloattableToFile(outputFileHandle);

    fclose(outputFileHandle);
    outputFileHandle = NULL;

  }

  static void initDisassembler( ud_t* ud_obj )
  {
    ud_init(ud_obj);

    ud_set_mode(ud_obj, 32);
    ud_set_vendor(ud_obj, UD_VENDOR_ANY);
    ud_set_syntax(ud_obj, UD_SYN_INTEL);

  }


  void disassemble( )
  {
    int i;
    FileMap::ObjectMap* obj;
    
    ud_t ud_obj;

    initDisassembler( &ud_obj );
    
    for(i = 0; (obj = g_file_map.getObjectMap(i)) ; ++i)
    {
      disassembleObject(obj, &ud_obj);
    }
    
  }

};


MachDisassembler dasm;


typedef unordered_map<string, MachO::Export> Exports;

class MachOLoader {
#ifdef __x86_64__
  typedef uint64_t intptr;
  typedef segment_command_64 Segment;

  static const vector<Segment*>& getSegments(const MachO& mach) {
    return mach.segments64();
  }
#else
  typedef uint32_t intptr;
  typedef segment_command Segment;

  static const vector<Segment*>& getSegments(const MachO& mach) {
    return mach.segments();
  }
#endif

 public:
  MachOLoader()
    : last_addr_(0) {

  }

  void loadSegments(const MachO& mach, intptr* slide, intptr* base) {
    *base = 0;
    --*base;

    const vector<Segment*>& segments = getSegments(mach);
    for (size_t i = 0; i < segments.size(); i++) {
      Segment* seg = segments[i];
      const char* name = seg->segname;
      if (!strcmp(name, SEG_PAGEZERO)) {
        continue;
      }

      cout << seg->segname << ": "
          << "fileoff=" << (void*)seg->fileoff
          << ", vmaddr=" << (void*)seg->vmaddr << endl;

      int prot = 0;
      if (seg->initprot & VM_PROT_READ) {
        prot |= PROT_READ;
      }
      if (seg->initprot & VM_PROT_WRITE) {
        prot |= PROT_WRITE;
      }
      if (seg->initprot & VM_PROT_EXECUTE) {
        prot |= PROT_EXEC;
      }

      intptr filesize = alignMem(seg->filesize, 0x1000);
      intptr vmaddr = seg->vmaddr + *slide;
      if (vmaddr < last_addr_) {
        cout << "will rebase: filename=" << mach.filename()
            << ", vmaddr=" << (void*)vmaddr
            << ", last_addr=" << (void*)last_addr_ << endl;
        CHECK(i == 0);
        vmaddr = last_addr_;
        *slide = vmaddr - seg->vmaddr;
      }
      *base = min(*base, vmaddr);

      intptr vmsize = alignMem(seg->vmsize, 0x1000);
      cout << "mmap(file) " << mach.filename() << ' ' << name
          << ": " << (void*)vmaddr << "-" << (void*)(vmaddr + filesize)
          << " offset=" << mach.offset() + seg->fileoff << endl;
      if (filesize == 0) {
        continue;
      }
      void* mapped = mmap((void*)vmaddr, filesize, prot,
                          MAP_PRIVATE | MAP_FIXED,
                          mach.fd(), mach.offset() + seg->fileoff);
      if (mapped == MAP_FAILED) {
        err(1, "%s mmap(file) failed", mach.filename().c_str());
      }
      printf("mapped at 0x%x\n", (uint32_t)mapped);
      if (vmsize != filesize) {
        cout << "mmap(anon) " << mach.filename() << ' ' << name
            << ": " << (void*)(vmaddr + filesize) << "-"
            << (void*)(vmaddr + vmsize)
            << endl;
        CHECK(vmsize > filesize);
        void* mapped = mmap((void*)(vmaddr + filesize),
                            vmsize - filesize, prot,
                            MAP_PRIVATE | MAP_FIXED | MAP_ANONYMOUS,
                            0, 0);
        if (mapped == MAP_FAILED) {
          err(1, "%s mmap(anon) failed", mach.filename().c_str());
        }
      }

      last_addr_ = max(last_addr_, (intptr)vmaddr + vmsize);
    }
  }


  void loadSymbols(const MachO& mach, intptr base) {
    g_file_map.add(mach, base);
  }

  void load(const MachO& mach, Exports* exports = NULL) {
    intptr slide = 0;
    intptr base = 0;

    loadSegments(mach, &slide, &base);

    loadSymbols(mach, base);

    //g_file_map.printObjectmaps();

  }


  void run(MachO& mach) {

    load(mach);


    dasm.disassemble( );

  }

 private:
  // Because .loop64 cannot be redefined.
  __attribute__((noinline))
  void boot(uint64_t entry, int argc, char** argv, char** envp);

  void pushTrampolineCode(unsigned int c) {
    while (c) {
      trampoline_.push_back(c & 255);
      c = c >> 8;
    }
  }

  void pushTrampolineCode64(unsigned long long c) {
    for (int i = 0; i < 8; i++) {
      trampoline_.push_back(c & 255);
      c = c >> 8;
    }
  }

  void pushTrampolineCode32(unsigned int c) {
    for (int i = 0; i < 4; i++) {
      trampoline_.push_back(c & 255);
      c = c >> 8;
    }
  }

  string trampoline_;
  intptr last_addr_;
  vector<uint64_t> init_funcs_;
};

extern "C" {
  const char* dumpSymbol(void* p) {
    return g_file_map.dumpSymbol(p);
  }
}

int main(int argc, char* argv[]) {
  g_timer.start();

  argc--;
  argv++;
  for (;;) {
    if (argc == 0) {
      fprintf(stderr, "An argument required.\n");
      exit(1);
    }

    const char* arg = argv[0];
    if (arg[0] != '-') {
      break;
    }

    // TODO(hamaji): Do something for switches.

    argc--;
    argv++;
  }

  g_darwin_executable_path =
      (char*)dlsym(RTLD_DEFAULT, "__darwin_executable_path");
  if (!realpath(argv[0], g_darwin_executable_path)) {
  }

  unique_ptr<MachO> mach(MachO::read(argv[0], ARCH_NAME));
#ifdef __x86_64__
  if (!mach->is64()) {
    fprintf(stderr, "%s: not 64bit binary\n", argv[0]);
    exit(1);
  }
#else
  if (mach->is64()) {
    fprintf(stderr, "%s: not 32bit binary\n", argv[0]);
    exit(1);
  }
#endif
  MachOLoader loader;
  g_loader = &loader;
  loader.run(*mach);
  g_loader = NULL;

}
