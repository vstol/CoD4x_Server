;Imports of cg_colltree:
	extern memset
	extern CM_ModelBounds

;Exports of cg_colltree:
	global cgEntCollWorld
	global cgEntCollNodes
	global cgCollWorldLocalClientNum
	global CG_LinkEntityColl
	global CG_UnlinkEntityColl
	global CG_GetEntityCollNode
	global CG_GetEntityCollSector
	global CG_ClearEntityCollWorld
	global CG_GetCollWorldLocalClientNum
	global CG_SetCollWorldLocalClientNum


SECTION .text


;CG_LinkEntityColl(int, int, float const*, float const*)
CG_LinkEntityColl:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x6c
	mov eax, [ebp+0x8]
	shl eax, 0xc
	mov edx, [ebp+0x8]
	lea eax, [eax+edx*8]
	sub eax, edx
	lea eax, [eax*4+cgEntCollWorld]
	mov [ebp-0x58], eax
	mov ecx, [ebp+0xc]
	lea edx, [ecx+ecx*4]
	mov ebx, [ebp+0x8]
	lea eax, [ebx+ebx*4]
	shl eax, 0xc
	lea edx, [eax+edx*4+cgEntCollNodes]
	mov [ebp-0x54], edx
	mov edi, [ebp-0x58]
	add edi, 0xc
	mov [ebp-0x60], edi
	mov edx, [ebp-0x58]
	mov ecx, edi
CG_LinkEntityColl_170:
	mov eax, [edx]
	mov [ebp-0x20], eax
	mov eax, [edx+0x4]
	mov [ebp-0x1c], eax
	mov eax, [edx+0xc]
	mov [ebp-0x28], eax
	mov eax, [ecx+0x4]
	mov [ebp-0x24], eax
	mov esi, 0x1
	mov edi, edx
CG_LinkEntityColl_30:
	movzx ebx, si
	mov eax, ebx
	shl eax, 0x4
	lea eax, [eax+edi+0x10]
	lea ecx, [eax+0xc]
	movzx edx, word [ecx+0x4]
	movss xmm1, dword [eax+0xc]
	lea eax, [edx*4]
	mov edi, [ebp+0x10]
	movss xmm0, dword [eax+edi]
	ucomiss xmm0, xmm1
	jbe CG_LinkEntityColl_10
	movss [ebp+edx*4-0x20], xmm1
	movzx eax, word [ecx+0x8]
	test ax, ax
	jz CG_LinkEntityColl_20
CG_LinkEntityColl_50:
	mov esi, eax
	mov edi, [ebp-0x58]
	jmp CG_LinkEntityColl_30
CG_LinkEntityColl_10:
	mov edi, [ebp+0x14]
	ucomiss xmm1, [eax+edi]
	jbe CG_LinkEntityColl_40
	movss [ebp+edx*4-0x28], xmm1
	movzx eax, word [ecx+0xa]
	test ax, ax
	jnz CG_LinkEntityColl_50
CG_LinkEntityColl_20:
	mov eax, [ebp-0x54]
CG_LinkEntityColl_190:
	movzx edi, word [eax]
	test di, di
	jz CG_LinkEntityColl_60
	cmp di, si
	jz CG_LinkEntityColl_70
	movzx eax, di
	shl eax, 0x4
	mov edx, [ebp-0x58]
	lea ecx, [eax+edx+0x1c]
	mov ebx, [ebp-0x54]
	mov word [ebx], 0x0
	movzx eax, word [ecx+0xc]
	sub eax, 0x1
	cmp [ebp+0xc], eax
	jz CG_LinkEntityColl_80
	lea edx, [eax+eax*4]
	mov ebx, [ebp+0x8]
	lea eax, [ebx+ebx*4]
	shl eax, 0xc
	lea edx, [eax+edx*4+cgEntCollNodes]
	mov ebx, eax
	jmp CG_LinkEntityColl_90
CG_LinkEntityColl_100:
	mov edx, eax
CG_LinkEntityColl_90:
	movzx eax, word [edx+0x2]
	lea eax, [eax+eax*4]
	lea eax, [ebx+eax*4+cgEntCollWorld+0x400c]
	cmp [ebp-0x54], eax
	jnz CG_LinkEntityColl_100
	mov ebx, [ebp-0x54]
	movzx eax, word [ebx+0x2]
	mov [edx+0x2], ax
CG_LinkEntityColl_200:
	cmp word [ecx+0xc], 0x0
	jnz CG_LinkEntityColl_110
CG_LinkEntityColl_140:
	mov ebx, [ecx+0x8]
	test ebx, ebx
	jnz CG_LinkEntityColl_110
	movzx eax, word [ecx+0x6]
	mov edx, eax
	test ax, ax
	jz CG_LinkEntityColl_120
	mov ebx, [ebp-0x58]
	movzx eax, word [ebx+0x18]
	mov [ecx+0x6], ax
	mov [ebx+0x18], di
	movzx eax, dx
	shl eax, 0x4
	lea ecx, [eax+ebx+0x1c]
	cmp di, [ecx+0x8]
	jz CG_LinkEntityColl_130
	mov word [ecx+0xa], 0x0
	mov edi, edx
CG_LinkEntityColl_180:
	cmp word [ecx+0xc], 0x0
	jz CG_LinkEntityColl_140
CG_LinkEntityColl_110:
	movzx eax, word [ecx+0x6]
CG_LinkEntityColl_120:
	test ax, ax
	jz CG_LinkEntityColl_150
CG_LinkEntityColl_160:
	movzx eax, ax
	shl eax, 0x4
	mov edi, [ebp-0x58]
	movzx eax, word [eax+edi+0x22]
	test ax, ax
	jnz CG_LinkEntityColl_160
	mov edx, edi
	mov ecx, [ebp-0x60]
	jmp CG_LinkEntityColl_170
CG_LinkEntityColl_130:
	mov word [ecx+0x8], 0x0
	mov edi, edx
	jmp CG_LinkEntityColl_180
CG_LinkEntityColl_150:
	mov edx, [ebp-0x58]
	mov ecx, [ebp-0x60]
	jmp CG_LinkEntityColl_170
CG_LinkEntityColl_40:
	mov eax, [ebp-0x54]
	cmp [eax], si
	jnz CG_LinkEntityColl_190
	mov edx, [ebp+0x10]
	mov eax, [edx]
	mov ecx, [ebp-0x54]
	mov [ecx+0x4], eax
	mov eax, [edx+0x4]
	mov [ecx+0x8], eax
	mov ebx, [ebp+0x14]
	mov eax, [ebx]
	mov [ecx+0xc], eax
	mov eax, [ebx+0x4]
	mov [ecx+0x10], eax
	add esp, 0x6c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CG_LinkEntityColl_80:
	movzx eax, word [ebx+0x2]
	mov [ecx+0xc], ax
	jmp CG_LinkEntityColl_200
CG_LinkEntityColl_70:
	mov [ebp-0x4e], bx
	movzx esi, bx
CG_LinkEntityColl_300:
	mov edx, [ebp+0x10]
	mov eax, [edx]
	mov ecx, [ebp-0x54]
	mov [ecx+0x4], eax
	mov eax, [edx+0x4]
	mov [ecx+0x8], eax
	mov ebx, [ebp+0x14]
	mov eax, [ebx]
	mov [ecx+0xc], eax
	mov eax, [ebx+0x4]
	mov [ecx+0x10], eax
	shl esi, 0x4
	mov edi, [ebp-0x58]
	lea eax, [esi+edi+0x10]
	lea edi, [eax+0xc]
	movzx edx, word [edi+0x4]
	mov [ebp-0x48], edx
	movss xmm2, dword [eax+0xc]
	movzx ecx, word [edi+0xc]
	test cx, cx
	jz CG_LinkEntityColl_210
	mov dword [ebp-0x4c], 0x0
	mov ebx, [ebp+0x8]
	lea ebx, [ebx+ebx*4]
	shl ebx, 0xc
	mov [ebp-0x5c], ebx
	movss xmm3, dword [_float_512_00000000]
	movss xmm4, dword [_float_0_50000000]
	mov [ebp-0x64], ebx
CG_LinkEntityColl_260:
	movzx eax, cx
	sub eax, 0x1
	mov [ebp-0x40], eax
	lea eax, [eax+eax*4]
	mov ecx, [ebp-0x5c]
	lea eax, [ecx+eax*4+cgEntCollNodes]
	mov [ebp-0x3c], eax
	mov ebx, [ebp-0x48]
	movss xmm0, dword [eax+ebx*4+0x4]
	ucomiss xmm0, xmm2
	jbe CG_LinkEntityColl_220
	movzx eax, word [edi+0x8]
	test ax, ax
	jz CG_LinkEntityColl_230
CG_LinkEntityColl_320:
	movzx edx, ax
CG_LinkEntityColl_380:
	mov ebx, [ebp-0x3c]
	movzx ecx, word [ebx+0x2]
	mov esi, edx
	shl edx, 0x4
	mov ebx, [ebp-0x58]
	lea eax, [edx+ebx+0x10]
	lea ebx, [eax+0x18]
	movzx edx, word [eax+0x18]
	lea eax, [edx-0x1]
	cmp [ebp-0x40], eax
	jae CG_LinkEntityColl_240
CG_LinkEntityColl_270:
	mov eax, [ebp-0x3c]
	mov [eax], si
	movzx eax, word [ebx]
	mov edx, [ebp-0x3c]
	mov [edx+0x2], ax
	movzx eax, word [ebp-0x40]
	add eax, 0x1
	mov [ebx], ax
	mov edx, [ebp-0x4c]
	test edx, edx
	jz CG_LinkEntityColl_250
	mov ebx, [ebp-0x4c]
	mov [ebx+0x2], cx
CG_LinkEntityColl_360:
	test cx, cx
	jnz CG_LinkEntityColl_260
CG_LinkEntityColl_210:
	add esp, 0x6c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CG_LinkEntityColl_240:
	lea eax, [edx+edx*4]
	mov edx, [ebp-0x64]
	lea eax, [edx+eax*4+cgEntCollWorld+0x400c]
	lea ebx, [eax+0x2]
	movzx edx, word [eax+0x2]
	lea eax, [edx-0x1]
	cmp [ebp-0x40], eax
	jb CG_LinkEntityColl_270
	lea eax, [edx+edx*4]
	mov edx, [ebp-0x64]
	lea eax, [edx+eax*4+cgEntCollWorld+0x400c]
	lea ebx, [eax+0x2]
	movzx edx, word [eax+0x2]
	lea eax, [edx-0x1]
	cmp [ebp-0x40], eax
	jae CG_LinkEntityColl_240
	jmp CG_LinkEntityColl_270
CG_LinkEntityColl_60:
	mov [ebp-0x4e], bx
	movzx esi, bx
	mov eax, esi
	shl eax, 0x4
	mov edx, [ebp-0x58]
	lea eax, [eax+edx+0x10]
	lea ebx, [eax+0x18]
	movzx edx, word [eax+0x18]
	lea eax, [edx-0x1]
	cmp eax, [ebp+0xc]
	ja CG_LinkEntityColl_280
	mov ebx, [ebp+0x8]
	lea ecx, [ebx+ebx*4]
	shl ecx, 0xc
CG_LinkEntityColl_290:
	lea eax, [edx+edx*4]
	lea eax, [ecx+eax*4+cgEntCollWorld+0x400c]
	lea ebx, [eax+0x2]
	movzx edx, word [eax+0x2]
	lea eax, [edx-0x1]
	cmp [ebp+0xc], eax
	jae CG_LinkEntityColl_290
CG_LinkEntityColl_280:
	movzx eax, word [ebp-0x4e]
	mov edi, [ebp-0x54]
	mov [edi], ax
	movzx eax, word [ebx]
	mov [edi+0x2], ax
	movzx eax, word [ebp+0xc]
	add eax, 0x1
	mov [ebx], ax
	jmp CG_LinkEntityColl_300
CG_LinkEntityColl_220:
	mov edx, [ebp-0x3c]
	ucomiss xmm2, [edx+ebx*4+0xc]
	jbe CG_LinkEntityColl_310
	movzx eax, word [edi+0xa]
	test ax, ax
	jnz CG_LinkEntityColl_320
	mov ecx, [ebp-0x58]
	movzx edx, word [ecx+0x18]
	test dx, dx
	jz CG_LinkEntityColl_330
	movss xmm0, dword [ebp-0x28]
	subss xmm0, [ebp-0x20]
	movss [ebp-0x30], xmm0
	movss xmm1, dword [ebp-0x24]
	subss xmm1, [ebp-0x1c]
	movss [ebp-0x2c], xmm1
	xor eax, eax
	ucomiss xmm1, xmm0
	setae al
	mov [ebp-0x42], ax
	movzx ebx, ax
	ucomiss xmm3, [ebp+ebx*4-0x30]
	jb CG_LinkEntityColl_340
CG_LinkEntityColl_330:
	mov eax, [ebp-0x3c]
	jmp CG_LinkEntityColl_350
CG_LinkEntityColl_310:
	mov eax, edx
CG_LinkEntityColl_350:
	movzx ecx, word [eax+0x2]
	mov [ebp-0x4c], eax
	jmp CG_LinkEntityColl_360
CG_LinkEntityColl_230:
	mov eax, [ebp-0x58]
	movzx edx, word [eax+0x18]
	test dx, dx
	jz CG_LinkEntityColl_330
	movss xmm0, dword [ebp-0x28]
	subss xmm0, [ebp-0x20]
	movss [ebp-0x30], xmm0
	movss xmm1, dword [ebp-0x24]
	subss xmm1, [ebp-0x1c]
	movss [ebp-0x2c], xmm1
	xor eax, eax
	ucomiss xmm1, xmm0
	setae al
	mov [ebp-0x44], ax
	movzx ebx, ax
	ucomiss xmm3, [ebp+ebx*4-0x30]
	jae CG_LinkEntityColl_330
	movzx esi, dx
	mov edx, esi
	shl edx, 0x4
	mov ecx, [ebp-0x58]
	lea edx, [edx+ecx+0x10]
	mov [ebp-0x6c], edx
	mov ecx, edx
	add ecx, 0xc
	movzx edx, word [ecx+0x6]
	mov eax, [ebp-0x58]
	mov [eax+0x18], dx
	movzx eax, word [ebp-0x44]
	mov [ecx+0x4], ax
	movss xmm0, dword [ebp+ebx*4-0x28]
	addss xmm0, [ebp+ebx*4-0x20]
	mulss xmm0, xmm4
	mov edx, [ebp-0x6c]
	movss [edx+0xc], xmm0
	mov eax, esi
	test si, si
	jz CG_LinkEntityColl_330
	mov [edi+0x8], si
	jmp CG_LinkEntityColl_370
CG_LinkEntityColl_250:
	mov [edi+0xc], cx
	jmp CG_LinkEntityColl_360
CG_LinkEntityColl_340:
	movzx esi, dx
	mov edx, esi
	shl edx, 0x4
	lea edx, [edx+ecx+0x10]
	mov [ebp-0x6c], edx
	mov ecx, edx
	add ecx, 0xc
	movzx edx, word [ecx+0x6]
	mov eax, [ebp-0x58]
	mov [eax+0x18], dx
	movzx eax, word [ebp-0x42]
	mov [ecx+0x4], ax
	movss xmm0, dword [ebp+ebx*4-0x28]
	addss xmm0, [ebp+ebx*4-0x20]
	mulss xmm0, xmm4
	mov edx, [ebp-0x6c]
	movss [edx+0xc], xmm0
	mov eax, esi
	test si, si
	jz CG_LinkEntityColl_330
	mov [edi+0xa], si
CG_LinkEntityColl_370:
	movzx edx, ax
	mov eax, edx
	shl eax, 0x4
	movzx ebx, word [ebp-0x4e]
	mov ecx, [ebp-0x58]
	mov [eax+ecx+0x22], bx
	jmp CG_LinkEntityColl_380


;CG_UnlinkEntityColl(int, int)
CG_UnlinkEntityColl:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x4
	mov edx, [ebp+0x8]
	mov eax, edx
	shl eax, 0xc
	lea eax, [eax+edx*8]
	sub eax, edx
	lea esi, [eax*4+cgEntCollWorld]
	mov ecx, [ebp+0xc]
	lea eax, [ecx+ecx*4]
	lea edi, [edx+edx*4]
	shl edi, 0xc
	lea ecx, [edi+eax*4]
	lea eax, [ecx+cgEntCollNodes]
	mov [ebp-0x10], eax
	movzx ebx, word [ecx+cgEntCollNodes]
	test bx, bx
	jz CG_UnlinkEntityColl_10
	movzx eax, bx
	shl eax, 0x4
	lea edx, [eax+esi+0x1c]
	mov word [ecx+cgEntCollNodes], 0x0
	movzx eax, word [edx+0xc]
	sub eax, 0x1
	cmp [ebp+0xc], eax
	jz CG_UnlinkEntityColl_20
	lea eax, [eax+eax*4]
	lea ecx, [edi+eax*4+cgEntCollNodes]
	jmp CG_UnlinkEntityColl_30
CG_UnlinkEntityColl_40:
	mov ecx, eax
CG_UnlinkEntityColl_30:
	movzx eax, word [ecx+0x2]
	lea eax, [eax+eax*4]
	lea eax, [edi+eax*4+cgEntCollWorld+0x400c]
	cmp [ebp-0x10], eax
	jnz CG_UnlinkEntityColl_40
	mov edi, [ebp-0x10]
	movzx eax, word [edi+0x2]
	mov [ecx+0x2], ax
CG_UnlinkEntityColl_110:
	cmp word [edx+0xc], 0x0
	jnz CG_UnlinkEntityColl_50
CG_UnlinkEntityColl_80:
	mov eax, [edx+0x8]
	test eax, eax
	jnz CG_UnlinkEntityColl_50
	movzx eax, word [edx+0x6]
	mov ecx, eax
	test ax, ax
	jz CG_UnlinkEntityColl_60
	movzx eax, word [esi+0x18]
	mov [edx+0x6], ax
	mov [esi+0x18], bx
	movzx eax, cx
	shl eax, 0x4
	lea edx, [eax+esi+0x1c]
	cmp bx, [edx+0x8]
	jz CG_UnlinkEntityColl_70
	mov word [edx+0xa], 0x0
	mov ebx, ecx
CG_UnlinkEntityColl_100:
	cmp word [edx+0xc], 0x0
	jz CG_UnlinkEntityColl_80
CG_UnlinkEntityColl_50:
	movzx eax, word [edx+0x6]
	test ax, ax
	jz CG_UnlinkEntityColl_10
CG_UnlinkEntityColl_90:
	movzx eax, ax
	shl eax, 0x4
	movzx eax, word [eax+esi+0x22]
CG_UnlinkEntityColl_60:
	test ax, ax
	jnz CG_UnlinkEntityColl_90
CG_UnlinkEntityColl_10:
	add esp, 0x4
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CG_UnlinkEntityColl_70:
	mov word [edx+0x8], 0x0
	mov ebx, ecx
	jmp CG_UnlinkEntityColl_100
CG_UnlinkEntityColl_20:
	mov ecx, [ebp-0x10]
	movzx eax, word [ecx+0x2]
	mov [edx+0xc], ax
	jmp CG_UnlinkEntityColl_110


;CG_GetEntityCollNode(int, int)
CG_GetEntityCollNode:
	push ebp
	mov ebp, esp
	mov edx, [ebp+0x8]
	mov eax, [ebp+0xc]
	lea eax, [eax+eax*4]
	lea edx, [edx+edx*4]
	shl edx, 0xc
	lea eax, [edx+eax*4+cgEntCollNodes]
	pop ebp
	ret
	nop


;CG_GetEntityCollSector(int, unsigned short)
CG_GetEntityCollSector:
	push ebp
	mov ebp, esp
	mov edx, [ebp+0x8]
	mov eax, edx
	shl eax, 0xc
	lea eax, [eax+edx*8]
	sub eax, edx
	movzx edx, word [ebp+0xc]
	shl edx, 0x4
	lea eax, [edx+eax*4+cgEntCollWorld+0x1c]
	pop ebp
	ret


;CG_ClearEntityCollWorld(int)
CG_ClearEntityCollWorld:
	push ebp
	mov ebp, esp
	push esi
	push ebx
	sub esp, 0x10
	mov ebx, [ebp+0x8]
	mov eax, ebx
	shl eax, 0xc
	lea eax, [eax+ebx*8]
	sub eax, ebx
	lea esi, [eax*4+cgEntCollWorld]
	mov dword [esp+0x8], 0x401c
	mov dword [esp+0x4], 0x0
	mov [esp], esi
	call memset
	lea ebx, [ebx+ebx*4]
	shl ebx, 0xc
	add ebx, cgEntCollNodes
	mov dword [esp+0x8], 0x5000
	mov dword [esp+0x4], 0x0
	mov [esp], ebx
	call memset
	lea ebx, [esi+0xc]
	mov [esp+0x8], ebx
	mov [esp+0x4], esi
	mov dword [esp], 0x0
	call CM_ModelBounds
	mov word [esi+0x18], 0x2
	mov edx, esi
	xor ecx, ecx
CG_ClearEntityCollWorld_10:
	lea eax, [ecx+0x3]
	mov [edx+0x42], ax
	add ecx, 0x1
	add edx, 0x10
	cmp ecx, 0x3fd
	jnz CG_ClearEntityCollWorld_10
	movss xmm1, dword [ebx]
	subss xmm1, [esi]
	movss xmm0, dword [ebx+0x4]
	subss xmm0, [esi+0x4]
	xor eax, eax
	ucomiss xmm0, xmm1
	setae al
	mov [esi+0x30], ax
	movzx eax, ax
	movss xmm0, dword [esi+eax*4+0xc]
	addss xmm0, [esi+eax*4]
	mulss xmm0, [_float_0_50000000]
	movss [esi+0x2c], xmm0
	add esp, 0x10
	pop ebx
	pop esi
	pop ebp
	ret


;CG_GetCollWorldLocalClientNum()
CG_GetCollWorldLocalClientNum:
	push ebp
	mov ebp, esp
	mov eax, [cgCollWorldLocalClientNum]
	pop ebp
	ret


;CG_SetCollWorldLocalClientNum(int)
CG_SetCollWorldLocalClientNum:
	push ebp
	mov ebp, esp
	mov eax, [ebp+0x8]
	mov [cgCollWorldLocalClientNum], eax
	pop ebp
	ret
	nop


;Initialized global or static variables of cg_colltree:
SECTION .data


;Initialized constant data of cg_colltree:
SECTION .rdata


;Zero initialized global or static variables of cg_colltree:
SECTION .bss
cgEntCollWorld: resb 0x4020
cgEntCollNodes: resb 0x5000
cgCollWorldLocalClientNum: resb 0x60


;All cstrings:
SECTION .rdata



;All constant floats and doubles:
SECTION .rdata
_float_512_00000000:		dd 0x44000000	; 512
_float_0_50000000:		dd 0x3f000000	; 0.5

