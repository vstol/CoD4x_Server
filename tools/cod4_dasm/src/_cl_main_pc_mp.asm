;Imports of cl_main_pc_mp:
	extern NET_CompareAdrSigned
	extern cmd_args
	extern clientUIActives
	extern Com_Printf
	extern Q_stricmp
	extern SND_StopSounds
	extern clientConnections
	extern cl_serverLoadingMap
	extern g_waitingForServer
	extern FS_DisablePureCheck
	extern SV_Frame
	extern CL_Disconnect
	extern Con_Close
	extern cls
	extern Q_strncpyz
	extern NET_StringToAdr
	extern BigShort
	extern NET_IsLocalAddress
	extern cl_cdkey
	extern sprintf
	extern cl_cdkeychecksum
	extern Q_stricmpn
	extern Com_Error
	extern Com_HasPlayerProfile
	extern g_qport
	extern Cbuf_ExecuteBuffer
	extern UI_CloseAll
	extern SCR_UpdateLoadScreen
	extern SV_KillLocalServer
	extern Sys_Milliseconds
	extern va
	extern Cbuf_AddText
	extern DL_DownloadLoop
	extern DL_DLIsMotd
	extern CL_ClearStaticDownload
	extern CL_AddReliableCommand
	extern FS_ReadFile
	extern Cvar_SetStringByName
	extern FS_FreeFile
	extern fs_homepath
	extern FS_BuildOSPath
	extern rename
	extern legacyHacks
	extern CL_NextDownload
	extern FS_CopyFile
	extern remove
	extern NET_CompareAdr
	extern NET_OutOfBandPrint
	extern cl_serverStatusResendTime
	extern Info_ValueForKey
	extern atoi
	extern memset
	extern Com_Memset
	extern Cvar_VariableBooleanValue
	extern CL_GetServerList
	extern MSG_ReadString
	extern Cvar_VariableString
	extern Com_DPrintf
	extern NET_AdrToString
	extern qsort
	extern MSG_ReadStringLine
	extern Com_sprintf
	extern sscanf
	extern strchr
	extern cl_pinglist
	extern memcpy
	extern Com_AddToString
	extern NET_OutOfBandData

;Exports of cl_main_pc_mp:
	global s_playerMute
	global rconGlob
	global CL_CompareAdrSigned
	global CL_RconInit
	global CL_Connect_f
	global CL_MutePlayer
	global CL_WWWDownload
	global CL_ServerStatus
	global CL_CDKeyValidate
	global CL_IsPlayerMuted
	global CL_SetServerInfo
	global CL_ClearMutedList
	global CL_ServerStatus_f
	global CL_GlobalServers_f
	global CL_FindServerByAddr
	global CL_ServerInfoPacket
	global CL_ResetPlayerMuting
	global CL_SortGlobalServers
	global CL_ServerStatusResponse
	global CL_ServersResponsePacket
	global CL_SetServerInfoByAddress
	global CL_Ping_f
	global CL_Rcon_f
	global cl_serverStatusList


SECTION .text


;CL_CompareAdrSigned(void const*, void const*)
CL_CompareAdrSigned:
	push ebp
	mov ebp, esp
	pop ebp
	jmp NET_CompareAdrSigned
	nop


;CL_RconInit()
CL_RconInit:
	push ebp
	mov ebp, esp
	mov byte [rconGlob], 0x0
	mov dword [rconGlob+0x18], 0x1
	pop ebp
	ret


;CL_Connect_f()
CL_Connect_f:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x4c
	mov ecx, cmd_args
	mov ebx, [ecx]
	mov edx, [ecx+ebx*4+0x44]
	cmp edx, 0x1
	jle CL_Connect_f_10
	mov eax, clientUIActives
	cmp dword [eax+0xc], 0x2
	jle CL_Connect_f_20
	cmp edx, 0x3
	jz CL_Connect_f_30
CL_Connect_f_40:
	mov dword [esp+0x4], _cstring_already_connecte
	mov dword [esp], 0x0
	call Com_Printf
CL_Connect_f_150:
	add esp, 0x4c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_Connect_f_30:
	mov dword [esp+0x4], _cstring_reconnect
	mov eax, [ecx+ebx*4+0x64]
	mov eax, [eax+0x8]
	mov [esp], eax
	call Q_stricmp
	test eax, eax
	jnz CL_Connect_f_40
CL_Connect_f_20:
	mov dword [esp], 0x0
	call SND_StopSounds
	mov eax, clientConnections
	mov byte [eax+0x24], 0x0
	mov eax, cmd_args
	mov edx, [eax]
	cmp dword [eax+edx*4+0x44], 0x1
	jle CL_Connect_f_50
	mov eax, [eax+edx*4+0x64]
	mov ebx, [eax+0x4]
CL_Connect_f_200:
	mov edi, _cstring_localhost
	mov ecx, 0xa
	cld
	mov esi, ebx
	repe cmpsb
	mov edx, 0x0
	jz CL_Connect_f_60
	movzx edx, byte [esi-0x1]
	movzx ecx, byte [edi-0x1]
	sub edx, ecx
CL_Connect_f_60:
	test edx, edx
	jz CL_Connect_f_70
CL_Connect_f_190:
	mov eax, cl_serverLoadingMap
	mov byte [eax], 0x0
	mov eax, g_waitingForServer
	mov byte [eax], 0x0
	mov dword [esp], 0x0
	call FS_DisablePureCheck
	mov dword [esp], 0x0
	call SV_Frame
	mov dword [esp], 0x0
	call CL_Disconnect
	mov dword [esp], 0x0
	call Con_Close
	mov dword [esp+0x8], 0x100
	mov [esp+0x4], ebx
	mov esi, cls
	add esi, 0x8
	mov [esp], esi
	call Q_strncpyz
	mov ebx, clientConnections
	lea eax, [ebx+0x10]
	mov [esp+0x4], eax
	mov [esp], esi
	call NET_StringToAdr
	test eax, eax
	jz CL_Connect_f_80
	cmp word [ebx+0x18], 0x0
	jz CL_Connect_f_90
CL_Connect_f_180:
	movsx eax, word [ebx+0x18]
	mov [esp], eax
	call BigShort
	cwde
	mov [esp+0x1c], eax
	movzx eax, byte [ebx+0x17]
	mov [esp+0x18], eax
	movzx eax, byte [ebx+0x16]
	mov [esp+0x14], eax
	movzx eax, byte [ebx+0x15]
	mov [esp+0x10], eax
	movzx eax, byte [ebx+0x14]
	mov [esp+0xc], eax
	mov [esp+0x8], esi
	mov dword [esp+0x4], _cstring_s_resolved_to_ii
	mov dword [esp], 0x0
	call Com_Printf
	mov ecx, [ebx+0x10]
	mov [ebp-0x38], ecx
	mov edx, [ebx+0x14]
	mov [ebp-0x34], edx
	mov eax, [ebx+0x18]
	mov [ebp-0x30], eax
	mov [esp], ecx
	mov [esp+0x4], edx
	mov [esp+0x8], eax
	call NET_IsLocalAddress
	test eax, eax
	jnz CL_Connect_f_100
	xor edx, edx
	mov ecx, cl_cdkey
	lea ebx, [ecx+0x10]
CL_Connect_f_140:
	movsx eax, byte [ecx]
	xor edx, eax
	mov eax, 0x8
	jmp CL_Connect_f_110
CL_Connect_f_130:
	shr edx, 1
	xor edx, 0xa001
	sub eax, 0x1
	jz CL_Connect_f_120
CL_Connect_f_110:
	test dl, 0x1
	jnz CL_Connect_f_130
	shr edx, 1
	sub eax, 0x1
	jnz CL_Connect_f_110
CL_Connect_f_120:
	add ecx, 0x1
	cmp ecx, ebx
	jnz CL_Connect_f_140
	mov [esp+0x8], edx
	mov dword [esp+0x4], _cstring_04x
	lea ebx, [ebp-0x1d]
	mov [esp], ebx
	call sprintf
	mov dword [esp+0x8], 0x4
	mov eax, cl_cdkeychecksum
	mov [esp+0x4], eax
	mov [esp], ebx
	call Q_stricmpn
	test eax, eax
	jz CL_Connect_f_100
	mov dword [esp+0x4], _cstring_exe_err_invalid_
	mov dword [esp], 0x2
	call Com_Error
	jmp CL_Connect_f_150
CL_Connect_f_100:
	call Com_HasPlayerProfile
	test al, al
	jz CL_Connect_f_160
	mov ebx, clientConnections
	mov ecx, [ebx+0x10]
	mov [ebp-0x2c], ecx
	mov edx, [ebx+0x14]
	mov [ebp-0x28], edx
	mov eax, [ebx+0x18]
	mov [ebp-0x24], eax
	mov [esp], ecx
	mov [esp+0x4], edx
	mov [esp+0x8], eax
	call NET_IsLocalAddress
	test eax, eax
	jnz CL_Connect_f_170
	mov eax, clientUIActives
	mov dword [eax+0xc], 0x3
	mov edx, ebx
CL_Connect_f_210:
	mov dword [eax+0x4], 0x0
	mov byte [eax+0x8], 0x0
	mov dword [edx+0x1c], 0xfffe7961
	mov dword [edx+0x20], 0x0
	mov eax, g_qport
	mov eax, [eax]
	mov [edx], eax
	mov dword [esp+0x8], _cstring_selectstringtabl
	mov dword [esp+0x4], 0x0
	mov dword [esp], 0x0
	call Cbuf_ExecuteBuffer
	mov dword [esp], 0x0
	call UI_CloseAll
	call SCR_UpdateLoadScreen
	add esp, 0x4c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_Connect_f_160:
	mov dword [esp+0x4], _cstring_platform_notsign
	mov dword [esp], 0x2
	call Com_Error
	add esp, 0x4c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_Connect_f_90:
	mov dword [esp], 0x7120
	call BigShort
	mov [ebx+0x18], ax
	jmp CL_Connect_f_180
CL_Connect_f_80:
	mov dword [esp+0x4], _cstring_bad_server_addre
	mov dword [esp], 0x0
	call Com_Printf
	mov eax, clientUIActives
	mov dword [eax+0xc], 0x0
	add esp, 0x4c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_Connect_f_70:
	call SV_KillLocalServer
	jmp CL_Connect_f_190
CL_Connect_f_10:
	mov dword [esp+0x4], _cstring_usage_connect_se
	mov dword [esp], 0x0
	call Com_Printf
	add esp, 0x4c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_Connect_f_50:
	mov ebx, _cstring_null
	jmp CL_Connect_f_200
CL_Connect_f_170:
	mov ebx, clientUIActives
	mov dword [ebx+0xc], 0x4
	call Sys_Milliseconds
	mov edx, clientConnections
	mov [edx+0xc], eax
	mov eax, ebx
	jmp CL_Connect_f_210


;CL_MutePlayer(int, int)
CL_MutePlayer:
	push ebp
	mov ebp, esp
	sub esp, 0x18
	mov edx, [ebp+0xc]
	cmp byte [edx+s_playerMute], 0x0
	setz al
	mov [edx+s_playerMute], al
	test al, al
	jz CL_MutePlayer_10
	mov [esp+0x4], edx
	mov dword [esp], _cstring_muteplayer_i
	call va
	mov [ebp+0xc], eax
	mov dword [ebp+0x8], 0x0
	leave
	jmp Cbuf_AddText
CL_MutePlayer_10:
	mov [esp+0x4], edx
	mov dword [esp], _cstring_unmuteplayer_i
	call va
	mov [ebp+0xc], eax
	mov dword [ebp+0x8], 0x0
	leave
	jmp Cbuf_AddText
	nop


;CL_WWWDownload()
CL_WWWDownload:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x12c
	call DL_DownloadLoop
	mov ebx, eax
	test eax, eax
	jnz CL_WWWDownload_10
CL_WWWDownload_60:
	add esp, 0x12c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_WWWDownload_10:
	call DL_DLIsMotd
	mov esi, eax
	test al, al
	jz CL_WWWDownload_20
	sub ebx, 0x1
	jz CL_WWWDownload_30
CL_WWWDownload_70:
	mov eax, cls
	mov dword [eax+0x2dc6b4], 0x0
	add esp, 0x12c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_WWWDownload_20:
	sub ebx, 0x1
	jz CL_WWWDownload_40
	mov esi, cls
	mov edx, [esi+0x2dc6b0]
	test edx, edx
	jz CL_WWWDownload_50
	lea eax, [esi+0x2dc198]
	mov [esp+0x4], eax
	mov dword [esp], _cstring_download_failure
	call va
	mov ebx, eax
	mov dword [esi+0x2dc6b0], 0x0
	call CL_ClearStaticDownload
	mov [esp+0x4], ebx
	mov dword [esp], 0x2
	call Com_Error
	jmp CL_WWWDownload_60
CL_WWWDownload_50:
	lea eax, [esi+0x2dc198]
	mov [esp+0x8], eax
	mov dword [esp+0x4], _cstring_download_failure
	mov dword [esp], 0xe
	call Com_Printf
	mov dword [esp+0x4], _cstring_wwwdl_fail
	mov dword [esp], 0x0
	call CL_AddReliableCommand
	mov dword [esi+0x2dc6b4], 0x0
	jmp CL_WWWDownload_60
CL_WWWDownload_30:
	lea eax, [ebp-0x1c]
	mov [esp+0x4], eax
	mov dword [esp], _cstring_motdtxt
	call FS_ReadFile
	test eax, eax
	js CL_WWWDownload_70
	mov eax, [ebp-0x1c]
	mov [esp+0x4], eax
	mov dword [esp], _cstring_motd
	call Cvar_SetStringByName
	mov eax, [ebp-0x1c]
	mov [esp], eax
	call FS_FreeFile
	jmp CL_WWWDownload_70
CL_WWWDownload_40:
	mov eax, cls
	mov dword [eax+0x2dc094], 0x0
	lea eax, [ebp-0x11c]
	mov [esp+0xc], eax
	mov dword [esp+0x8], _cstring_null
	mov eax, cls
	add eax, 0x2dc6bc
	mov [esp+0x4], eax
	mov eax, fs_homepath
	mov eax, [eax]
	mov eax, [eax+0xc]
	mov [esp], eax
	call FS_BuildOSPath
	cld
	mov ecx, 0xffffffff
	lea edi, [ebp-0x11c]
	mov eax, esi
	repne scasb
	not ecx
	mov byte [ecx+ebp-0x11e], 0x0
	lea eax, [ebp-0x11c]
	mov [esp+0x4], eax
	mov ebx, cls
	add ebx, 0x2dc098
	mov [esp], ebx
	call rename
	test eax, eax
	jnz CL_WWWDownload_80
CL_WWWDownload_110:
	mov eax, cls
	mov byte [eax+0x2dc198], 0x0
	mov byte [eax+0x2dc098], 0x0
	mov dword [esp+0x8], 0x40
	mov dword [esp+0x4], _cstring_null
	mov eax, legacyHacks
	add eax, 0xc
	mov [esp], eax
	call Q_strncpyz
	mov eax, cls
	mov ecx, [eax+0x2dc6b0]
	test ecx, ecx
	jz CL_WWWDownload_90
	mov dword [esp+0x4], _cstring_reconnect1
	mov dword [esp], 0x0
	call Cbuf_AddText
CL_WWWDownload_100:
	mov eax, cls
	mov dword [eax+0x2dc6b4], 0x0
	mov dword [esp], 0x0
	call CL_NextDownload
	jmp CL_WWWDownload_60
CL_WWWDownload_90:
	mov dword [esp+0x4], _cstring_wwwdl_done
	mov dword [esp], 0x0
	call CL_AddReliableCommand
	jmp CL_WWWDownload_100
CL_WWWDownload_80:
	lea eax, [ebp-0x11c]
	mov [esp+0x4], eax
	mov [esp], ebx
	call FS_CopyFile
	mov [esp], ebx
	call remove
	jmp CL_WWWDownload_110


;CL_ServerStatus(char*, char*, int)
CL_ServerStatus:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0xac
	mov edx, [ebp+0x8]
	test edx, edx
	jz CL_ServerStatus_10
	lea eax, [ebp-0x6c]
	mov [esp+0x4], eax
	mov [esp], edx
	call NET_StringToAdr
	test eax, eax
	jz CL_ServerStatus_20
	movzx eax, word [ebp-0x64]
	mov [ebp-0x7a], ax
	movzx edx, byte [ebp-0x65]
	mov [ebp-0x7b], dl
	movzx eax, byte [ebp-0x66]
	mov [ebp-0x7c], al
	movzx edx, byte [ebp-0x67]
	mov [ebp-0x7d], dl
	movzx eax, byte [ebp-0x68]
	mov [ebp-0x7e], al
	mov edx, [ebp-0x6c]
	mov [ebp-0x8c], edx
	xor esi, esi
	mov ebx, cl_serverStatusList
CL_ServerStatus_40:
	mov ecx, [ebx+0x2000]
	mov [ebp-0x30], ecx
	mov edx, [ebx+0x2004]
	mov [ebp-0x2c], edx
	mov edi, [ebx+0x2008]
	mov [ebp-0x28], edi
	movzx eax, word [ebp-0x7a]
	mov [ebp-0x40], ax
	movzx eax, byte [ebp-0x7b]
	mov [ebp-0x41], al
	movzx eax, byte [ebp-0x7c]
	mov [ebp-0x42], al
	movzx eax, byte [ebp-0x7d]
	mov [ebp-0x43], al
	movzx eax, byte [ebp-0x7e]
	mov [ebp-0x44], al
	mov edi, [ebp-0x8c]
	mov [ebp-0x48], edi
	mov [esp+0xc], ecx
	mov [esp+0x10], edx
	mov eax, [ebx+0x2008]
	mov [esp+0x14], eax
	mov [esp], edi
	mov eax, [ebp-0x44]
	mov [esp+0x4], eax
	mov eax, [ebp-0x40]
	mov [esp+0x8], eax
	call NET_CompareAdr
	test eax, eax
	jnz CL_ServerStatus_30
	add esi, 0x1
	add ebx, 0x2020
	cmp esi, 0x10
	jnz CL_ServerStatus_40
	xor edx, edx
	mov eax, cl_serverStatusList
CL_ServerStatus_60:
	mov edi, [eax+0x201c]
	test edi, edi
	jnz CL_ServerStatus_50
	add edx, 0x1
	add eax, 0x2020
	cmp edx, 0x10
	jnz CL_ServerStatus_60
CL_ServerStatus_90:
	xor esi, esi
	jmp CL_ServerStatus_70
CL_ServerStatus_100:
	mov eax, [edx+0x2010]
	add edx, 0x2020
	cmp ebx, eax
	jle CL_ServerStatus_80
	mov esi, ecx
CL_ServerStatus_70:
	mov edx, esi
	shl edx, 0x5
	mov eax, esi
	shl eax, 0xd
	lea eax, [edx+eax]
	mov ebx, [eax+cl_serverStatusList+0x2010]
	cmp esi, 0xffffffff
	jz CL_ServerStatus_90
	lea edx, [eax+cl_serverStatusList+0x2020]
	mov ecx, esi
CL_ServerStatus_80:
	add ecx, 0x1
	cmp ecx, 0xf
	jle CL_ServerStatus_100
CL_ServerStatus_30:
	mov eax, esi
	shl eax, 0x5
	shl esi, 0xd
	lea esi, [eax+esi+cl_serverStatusList]
	mov [ebp-0x84], esi
CL_ServerStatus_160:
	mov eax, [ebp+0xc]
	test eax, eax
	jz CL_ServerStatus_110
	mov eax, [ebp-0x84]
	mov edi, [eax+0x2000]
	mov [ebp-0x60], edi
	mov esi, [eax+0x2004]
	mov [ebp-0x5c], esi
	mov ebx, [eax+0x2008]
	mov [ebp-0x58], ebx
	mov ecx, [ebp-0x6c]
	mov [ebp-0x54], ecx
	mov edx, [ebp-0x68]
	mov [ebp-0x50], edx
	mov eax, [ebp-0x64]
	mov [ebp-0x4c], eax
	mov [esp+0xc], edi
	mov [esp+0x10], esi
	mov [esp+0x14], ebx
	mov [esp], ecx
	mov [esp+0x4], edx
	mov [esp+0x8], eax
	call NET_CompareAdr
	test eax, eax
	jnz CL_ServerStatus_120
	mov eax, [ebp-0x84]
	mov ebx, [eax+0x201c]
	test ebx, ebx
	jz CL_ServerStatus_20
	mov edx, eax
	mov eax, [ebp-0x6c]
	mov [edx+0x2000], eax
	mov eax, [ebp-0x68]
	mov [edx+0x2004], eax
	mov eax, [ebp-0x64]
	mov [edx+0x2008], eax
	mov dword [edx+0x2018], 0x0
	mov dword [edx+0x2014], 0x1
	mov dword [edx+0x201c], 0x0
	call Sys_Milliseconds
	mov edi, [ebp-0x84]
	mov [edi+0x2010], eax
	mov dword [edi+0x200c], 0x0
	mov ecx, [ebp-0x6c]
	mov [ebp-0x3c], ecx
	mov edx, [ebp-0x68]
	mov [ebp-0x38], edx
	mov eax, [ebp-0x64]
	mov [ebp-0x34], eax
CL_ServerStatus_150:
	mov dword [esp+0x10], _cstring_getstatus
	mov [esp+0x4], ecx
	mov [esp+0x8], edx
	mov [esp+0xc], eax
	mov dword [esp], 0x0
	call NET_OutOfBandPrint
CL_ServerStatus_20:
	xor eax, eax
CL_ServerStatus_170:
	add esp, 0xac
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_ServerStatus_10:
	mov eax, cl_serverStatusList
	mov edx, cl_serverStatusList+0x20200
CL_ServerStatus_130:
	mov word [eax+0x2008], 0x0
	mov dword [eax+0x201c], 0x1
	add eax, 0x2020
	cmp edx, eax
	jnz CL_ServerStatus_130
	jmp CL_ServerStatus_20
CL_ServerStatus_120:
	mov edx, [ebp-0x84]
	mov esi, [edx+0x2014]
	test esi, esi
	jz CL_ServerStatus_140
	mov ebx, [edx+0x2010]
	call Sys_Milliseconds
	mov edx, cl_serverStatusResendTime
	mov edx, [edx]
	sub eax, [edx+0xc]
	cmp ebx, eax
	jge CL_ServerStatus_20
	mov edi, [ebp-0x84]
	mov dword [edi+0x2018], 0x0
	mov dword [edi+0x2014], 0x1
	mov dword [edi+0x201c], 0x0
	mov dword [edi+0x200c], 0x0
	call Sys_Milliseconds
	mov [edi+0x2010], eax
	mov ecx, [ebp-0x6c]
	mov [ebp-0x24], ecx
	mov edx, [ebp-0x68]
	mov [ebp-0x20], edx
	mov eax, [ebp-0x64]
	mov [ebp-0x1c], eax
	jmp CL_ServerStatus_150
CL_ServerStatus_110:
	mov edx, [ebp-0x84]
	mov dword [edx+0x201c], 0x1
	jmp CL_ServerStatus_20
CL_ServerStatus_50:
	mov eax, edx
	shl eax, 0x5
	shl edx, 0xd
	lea edx, [eax+edx+cl_serverStatusList]
	mov [ebp-0x84], edx
	jmp CL_ServerStatus_160
CL_ServerStatus_140:
	mov eax, [ebp+0x10]
	mov [esp+0x8], eax
	mov [esp+0x4], edx
	mov edi, [ebp+0xc]
	mov [esp], edi
	call Q_strncpyz
	mov eax, [ebp-0x84]
	mov dword [eax+0x201c], 0x1
	mov dword [eax+0x2010], 0x0
	mov eax, 0x1
	jmp CL_ServerStatus_170
	nop


;CL_CDKeyValidate(char const*, char const*)
CL_CDKeyValidate:
	push ebp
	mov ebp, esp
	push esi
	push ebx
	sub esp, 0x20
	mov ebx, [ebp+0x8]
	mov esi, [ebp+0xc]
	xor edx, edx
	mov ecx, 0x1
CL_CDKeyValidate_40:
	movsx eax, byte [ecx+ebx-0x1]
	xor edx, eax
	mov eax, 0x8
	jmp CL_CDKeyValidate_10
CL_CDKeyValidate_30:
	shr edx, 1
	xor edx, 0xa001
	sub eax, 0x1
	jz CL_CDKeyValidate_20
CL_CDKeyValidate_10:
	test dl, 0x1
	jnz CL_CDKeyValidate_30
	shr edx, 1
	sub eax, 0x1
	jnz CL_CDKeyValidate_10
CL_CDKeyValidate_20:
	add ecx, 0x1
	cmp ecx, 0x11
	jnz CL_CDKeyValidate_40
	mov [esp+0x8], edx
	mov dword [esp+0x4], _cstring_04x
	lea ebx, [ebp-0xd]
	mov [esp], ebx
	call sprintf
	test esi, esi
	jz CL_CDKeyValidate_50
	mov dword [esp+0x8], 0x4
	mov [esp+0x4], esi
	mov [esp], ebx
	call Q_stricmpn
	test eax, eax
	jz CL_CDKeyValidate_50
	xor eax, eax
	add esp, 0x20
	pop ebx
	pop esi
	pop ebp
	ret
CL_CDKeyValidate_50:
	mov eax, 0x1
	add esp, 0x20
	pop ebx
	pop esi
	pop ebp
	ret


;CL_IsPlayerMuted(int, int)
CL_IsPlayerMuted:
	push ebp
	mov ebp, esp
	mov eax, [ebp+0xc]
	movzx eax, byte [eax+s_playerMute]
	pop ebp
	ret
	nop


;CL_SetServerInfo(serverInfo_t*, char const*, int)
CL_SetServerInfo:
	push ebp
	mov ebp, esp
	push esi
	push ebx
	sub esp, 0x10
	mov ebx, [ebp+0x8]
	mov esi, [ebp+0xc]
	test ebx, ebx
	jz CL_SetServerInfo_10
	test esi, esi
	jz CL_SetServerInfo_20
	mov dword [esp+0x4], _cstring_clients
	mov [esp], esi
	call Info_ValueForKey
	mov [esp], eax
	call atoi
	mov [ebx+0x11], al
	mov dword [esp+0x4], _cstring_hostname
	mov [esp], esi
	call Info_ValueForKey
	mov dword [esp+0x8], 0x20
	mov [esp+0x4], eax
	lea eax, [ebx+0x29]
	mov [esp], eax
	call Q_strncpyz
	mov dword [esp+0x4], _cstring_mapname
	mov [esp], esi
	call Info_ValueForKey
	mov dword [esp+0x8], 0x20
	mov [esp+0x4], eax
	lea eax, [ebx+0x49]
	mov [esp], eax
	call Q_strncpyz
	mov dword [esp+0x4], _cstring_sv_maxclients
	mov [esp], esi
	call Info_ValueForKey
	mov [esp], eax
	call atoi
	mov [ebx+0x12], al
	mov dword [esp+0x4], _cstring_game
	mov [esp], esi
	call Info_ValueForKey
	mov dword [esp+0x8], 0x18
	mov [esp+0x4], eax
	lea eax, [ebx+0x69]
	mov [esp], eax
	call Q_strncpyz
	mov dword [esp+0x4], _cstring_gametype
	mov [esp], esi
	call Info_ValueForKey
	mov dword [esp+0x8], 0x10
	mov [esp+0x4], eax
	lea eax, [ebx+0x81]
	mov [esp], eax
	call Q_strncpyz
	mov dword [esp+0x4], _cstring_nettype
	mov [esp], esi
	call Info_ValueForKey
	mov [esp], eax
	call atoi
	mov [ebx+0x10], al
	mov dword [esp+0x4], _cstring_minping
	mov [esp], esi
	call Info_ValueForKey
	mov [esp], eax
	call atoi
	mov [ebx+0x1e], ax
	mov dword [esp+0x4], _cstring_maxping
	mov [esp], esi
	call Info_ValueForKey
	mov [esp], eax
	call atoi
	mov [ebx+0x20], ax
	mov dword [esp+0x4], _cstring_sv_allowanonymou
	mov [esp], esi
	call Info_ValueForKey
	mov [esp], eax
	call atoi
	mov [ebx+0xc], al
	mov dword [esp+0x4], _cstring_con_disabled
	mov [esp], esi
	call Info_ValueForKey
	mov [esp], eax
	call atoi
	mov [ebx+0xf], al
	mov dword [esp+0x4], _cstring_pswrd
	mov [esp], esi
	call Info_ValueForKey
	mov [esp], eax
	call atoi
	mov [ebx+0xd], al
	mov dword [esp+0x4], _cstring_pure
	mov [esp], esi
	call Info_ValueForKey
	mov [esp], eax
	call atoi
	mov [ebx+0xe], al
	mov dword [esp+0x4], _cstring_ff
	mov [esp], esi
	call Info_ValueForKey
	mov [esp], eax
	call atoi
	mov [ebx+0x14], al
	mov dword [esp+0x4], _cstring_kc
	mov [esp], esi
	call Info_ValueForKey
	mov [esp], eax
	call atoi
	mov [ebx+0x15], al
	mov dword [esp+0x4], _cstring_hc
	mov [esp], esi
	call Info_ValueForKey
	mov [esp], eax
	call atoi
	mov [ebx+0x16], al
	mov dword [esp+0x4], _cstring_od
	mov [esp], esi
	call Info_ValueForKey
	mov [esp], eax
	call atoi
	mov [ebx+0x17], al
	mov dword [esp+0x4], _cstring_hw
	mov [esp], esi
	call Info_ValueForKey
	mov [esp], eax
	call atoi
	mov [ebx+0x18], al
	mov dword [esp+0x4], _cstring_mod
	mov [esp], esi
	call Info_ValueForKey
	mov [esp], eax
	call atoi
	mov [ebx+0x19], al
	mov dword [esp+0x4], _cstring_voice
	mov [esp], esi
	call Info_ValueForKey
	mov [esp], eax
	call atoi
	mov [ebx+0x1a], al
	mov dword [esp+0x4], _cstring_pb
	mov [esp], esi
	call Info_ValueForKey
	mov [esp], eax
	call atoi
	test eax, eax
	setg byte [ebx+0x1b]
CL_SetServerInfo_20:
	mov byte [ebx+0x28], 0x1
	movzx eax, word [ebp+0x10]
	mov [ebx+0x22], ax
CL_SetServerInfo_10:
	add esp, 0x10
	pop ebx
	pop esi
	pop ebp
	ret


;CL_ClearMutedList()
CL_ClearMutedList:
	push ebp
	mov ebp, esp
	sub esp, 0x18
	mov dword [esp+0x8], 0x40
	mov dword [esp+0x4], 0x0
	mov dword [esp], s_playerMute
	call memset
	leave
	ret


;CL_ServerStatus_f()
CL_ServerStatus_f:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x7c
	mov dword [esp+0x8], 0xc
	mov dword [esp+0x4], 0x0
	lea ebx, [ebp-0x48]
	mov [esp], ebx
	call Com_Memset
	mov eax, cmd_args
	mov edx, [eax]
	cmp dword [eax+edx*4+0x44], 0x2
	jz CL_ServerStatus_f_10
	mov eax, clientUIActives
	cmp dword [eax+0xc], 0x9
	jz CL_ServerStatus_f_20
CL_ServerStatus_f_30:
	mov dword [esp+0x4], _cstring_not_connected_to
	mov dword [esp], 0x0
	call Com_Printf
	mov dword [esp+0x4], _cstring_usage_serverstat
	mov dword [esp], 0x0
	call Com_Printf
CL_ServerStatus_f_50:
	add esp, 0x7c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_ServerStatus_f_20:
	mov eax, clientConnections
	mov esi, [eax+0x4018c]
	test esi, esi
	jnz CL_ServerStatus_f_30
	mov eax, cls
	add eax, 0x8
	jmp CL_ServerStatus_f_40
CL_ServerStatus_f_10:
	mov eax, [eax+edx*4+0x64]
	mov eax, [eax+0x4]
CL_ServerStatus_f_40:
	mov [esp+0x4], ebx
	mov [esp], eax
	call NET_StringToAdr
	test eax, eax
	jz CL_ServerStatus_f_50
	mov ecx, [ebp-0x48]
	mov [ebp-0x3c], ecx
	mov edx, [ebp-0x44]
	mov [ebp-0x38], edx
	mov eax, [ebp-0x40]
	mov [ebp-0x34], eax
	mov dword [esp+0x10], _cstring_getstatus
	mov [esp+0x4], ecx
	mov [esp+0x8], edx
	mov [esp+0xc], eax
	mov dword [esp], 0x0
	call NET_OutOfBandPrint
	movzx eax, word [ebp-0x40]
	mov [ebp-0x4a], ax
	movzx eax, byte [ebp-0x41]
	mov [ebp-0x4b], al
	movzx eax, byte [ebp-0x42]
	mov [ebp-0x4c], al
	movzx eax, byte [ebp-0x43]
	mov [ebp-0x4d], al
	movzx eax, byte [ebp-0x44]
	mov [ebp-0x4e], al
	mov edi, [ebp-0x48]
	mov [ebp-0x5c], edi
	xor esi, esi
	mov ebx, cl_serverStatusList
CL_ServerStatus_f_70:
	mov ecx, [ebx+0x2000]
	mov [ebp-0x30], ecx
	mov edx, [ebx+0x2004]
	mov [ebp-0x2c], edx
	mov eax, [ebx+0x2008]
	mov [ebp-0x28], eax
	movzx edi, word [ebp-0x4a]
	mov [ebp-0x1c], di
	movzx eax, byte [ebp-0x4b]
	mov [ebp-0x1d], al
	movzx eax, byte [ebp-0x4c]
	mov [ebp-0x1e], al
	movzx eax, byte [ebp-0x4d]
	mov [ebp-0x1f], al
	movzx eax, byte [ebp-0x4e]
	mov [ebp-0x20], al
	mov edi, [ebp-0x5c]
	mov [ebp-0x24], edi
	mov [esp+0xc], ecx
	mov [esp+0x10], edx
	mov eax, [ebx+0x2008]
	mov [esp+0x14], eax
	mov [esp], edi
	mov eax, [ebp-0x20]
	mov [esp+0x4], eax
	mov eax, [ebp-0x1c]
	mov [esp+0x8], eax
	call NET_CompareAdr
	test eax, eax
	jnz CL_ServerStatus_f_60
	add esi, 0x1
	add ebx, 0x2020
	cmp esi, 0x10
	jnz CL_ServerStatus_f_70
	xor edx, edx
	mov eax, cl_serverStatusList
CL_ServerStatus_f_90:
	mov ecx, [eax+0x201c]
	test ecx, ecx
	jnz CL_ServerStatus_f_80
	add edx, 0x1
	add eax, 0x2020
	cmp edx, 0x10
	jnz CL_ServerStatus_f_90
CL_ServerStatus_f_120:
	xor esi, esi
	jmp CL_ServerStatus_f_100
CL_ServerStatus_f_130:
	mov eax, [edx+0x2010]
	add edx, 0x2020
	cmp ebx, eax
	jle CL_ServerStatus_f_110
	mov esi, ecx
CL_ServerStatus_f_100:
	mov edx, esi
	shl edx, 0x5
	mov eax, esi
	shl eax, 0xd
	lea eax, [edx+eax]
	mov ebx, [eax+cl_serverStatusList+0x2010]
	cmp esi, 0xffffffff
	jz CL_ServerStatus_f_120
	lea edx, [eax+cl_serverStatusList+0x2020]
	mov ecx, esi
CL_ServerStatus_f_110:
	add ecx, 0x1
	cmp ecx, 0xf
	jle CL_ServerStatus_f_130
CL_ServerStatus_f_60:
	mov eax, esi
	shl eax, 0x5
	shl esi, 0xd
	lea edx, [eax+esi+cl_serverStatusList]
CL_ServerStatus_f_140:
	mov eax, [ebp-0x48]
	mov [edx+0x2000], eax
	mov eax, [ebp-0x44]
	mov [edx+0x2004], eax
	mov eax, [ebp-0x40]
	mov [edx+0x2008], eax
	mov dword [edx+0x2018], 0x1
	mov dword [edx+0x2014], 0x1
	add esp, 0x7c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_ServerStatus_f_80:
	mov eax, edx
	shl eax, 0x5
	shl edx, 0xd
	lea edx, [eax+edx+cl_serverStatusList]
	jmp CL_ServerStatus_f_140
	add [eax], al


;CL_GlobalServers_f()
CL_GlobalServers_f:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x44c
	mov edx, cmd_args
	mov eax, [edx]
	cmp dword [edx+eax*4+0x44], 0x2
	jle CL_GlobalServers_f_10
	mov ebx, cls
	mov eax, [ebx+0x4b58]
	test eax, eax
	jle CL_GlobalServers_f_20
	xor edi, edi
CL_GlobalServers_f_30:
	lea eax, [edi+edi*8]
	lea eax, [edi+eax*4]
	lea eax, [ebx+eax*4+0x4b5c]
	mov edx, 0xffffffff
	movzx ecx, byte [eax+0x1c]
	add cl, 0x1
	cmovnz edx, ecx
	mov [eax+0x1c], dl
	add edi, 0x1
	cmp edi, [ebx+0x4b58]
	jl CL_GlobalServers_f_30
CL_GlobalServers_f_20:
	mov dword [esp+0x4], _cstring_requesting_serve
	mov dword [esp], 0x0
	call Com_Printf
	lea eax, [ebp-0x30]
	mov [esp+0x4], eax
	mov dword [esp], _cstring_cod4masteractivi
	call NET_StringToAdr
	call Sys_Milliseconds
	mov edx, cls
	add eax, 0x7d0
	mov [edx+0x4b54], eax
	mov dword [edx+0x2dbfe0], 0x1
	mov dword [edx+0x4b50], 0x0
	mov dword [ebp-0x30], 0x4
	mov dword [esp], 0x514a
	call BigShort
	mov [ebp-0x28], ax
	mov eax, cmd_args
	mov edx, [eax]
	cmp dword [eax+edx*4+0x44], 0x2
	jg CL_GlobalServers_f_40
	mov eax, _cstring_null
CL_GlobalServers_f_100:
	mov [esp+0x8], eax
	mov dword [esp+0x4], _cstring_getservers_s
	lea eax, [ebp-0x430]
	mov [esp], eax
	call sprintf
	cld
	mov ecx, 0xffffffff
	xor eax, eax
	lea edi, [ebp-0x430]
	repne scasb
	not ecx
	lea ebx, [ecx+ebp-0x431]
	mov edx, cmd_args
	mov eax, [edx]
	mov esi, [edx+eax*4+0x44]
	cmp esi, 0x3
	jle CL_GlobalServers_f_50
	mov edi, 0x3
	jmp CL_GlobalServers_f_60
CL_GlobalServers_f_70:
	mov eax, _cstring_null
	mov [esp+0x8], eax
	mov dword [esp+0x4], _cstring__s
	mov [esp], ebx
	call sprintf
	add ebx, eax
	add edi, 0x1
	cmp esi, edi
	jz CL_GlobalServers_f_50
CL_GlobalServers_f_80:
	mov edx, cmd_args
CL_GlobalServers_f_60:
	mov eax, [edx]
	cmp edi, [edx+eax*4+0x44]
	jge CL_GlobalServers_f_70
	mov eax, [edx+eax*4+0x64]
	mov eax, [eax+edi*4]
	mov [esp+0x8], eax
	mov dword [esp+0x4], _cstring__s
	mov [esp], ebx
	call sprintf
	add ebx, eax
	add edi, 0x1
	cmp esi, edi
	jnz CL_GlobalServers_f_80
CL_GlobalServers_f_50:
	mov dword [esp], _cstring_fs_restrict
	call Cvar_VariableBooleanValue
	test al, al
	jnz CL_GlobalServers_f_90
CL_GlobalServers_f_110:
	mov ecx, [ebp-0x30]
	mov [ebp-0x24], ecx
	mov edx, [ebp-0x2c]
	mov [ebp-0x20], edx
	mov eax, [ebp-0x28]
	mov [ebp-0x1c], eax
	lea ebx, [ebp-0x430]
	mov [esp+0x10], ebx
	mov [esp+0x4], ecx
	mov [esp+0x8], edx
	mov [esp+0xc], eax
	mov dword [esp], 0x1
	call NET_OutOfBandPrint
	add esp, 0x44c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_GlobalServers_f_40:
	mov eax, [eax+edx*4+0x64]
	mov eax, [eax+0x8]
	jmp CL_GlobalServers_f_100
CL_GlobalServers_f_10:
	mov dword [esp+0x4], _cstring_usage_globalserv
	mov dword [esp], 0x0
	call Com_Printf
	add esp, 0x44c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_GlobalServers_f_90:
	mov dword [ebx], 0x6d656420
	mov word [ebx+0x4], 0x6f
	jmp CL_GlobalServers_f_110
	nop


;CL_FindServerByAddr(netadr_t*, serverInfo_t*, int, int)
CL_FindServerByAddr:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x2c
	mov edi, [ebp+0x8]
	mov eax, [ebp+0x14]
	test eax, eax
	jz CL_FindServerByAddr_10
	cmp eax, 0x2
	jnz CL_FindServerByAddr_20
CL_FindServerByAddr_10:
	mov ebx, [ebp+0xc]
	xor esi, esi
	jmp CL_FindServerByAddr_30
CL_FindServerByAddr_50:
	add esi, 0x1
	add ebx, 0x94
	cmp esi, 0x80
	jz CL_FindServerByAddr_40
CL_FindServerByAddr_30:
	mov [esp+0x4], ebx
	mov [esp], edi
	call NET_CompareAdrSigned
	test eax, eax
	jnz CL_FindServerByAddr_50
CL_FindServerByAddr_130:
	mov eax, esi
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_FindServerByAddr_20:
	mov eax, [ebp+0x10]
	test eax, eax
	jg CL_FindServerByAddr_60
CL_FindServerByAddr_40:
	mov esi, 0xffffffff
CL_FindServerByAddr_100:
	mov eax, esi
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_FindServerByAddr_60:
	mov edx, [ebp+0x10]
	mov [ebp-0x1c], edx
	mov dword [ebp-0x20], 0x0
CL_FindServerByAddr_90:
	mov edx, [ebp-0x20]
	add edx, [ebp-0x1c]
	mov eax, edx
	shr eax, 0x1f
	lea esi, [eax+edx]
	sar esi, 1
	mov ebx, esi
	lea eax, [esi+esi*8]
	lea eax, [esi+eax*4]
	mov edx, [ebp+0xc]
	lea eax, [edx+eax*4]
	mov [ebp-0x24], eax
	mov [esp+0x4], eax
	mov [esp], edi
	call NET_CompareAdrSigned
	cmp eax, 0x0
	jl CL_FindServerByAddr_70
	jle CL_FindServerByAddr_80
	add ebx, 0x1
	mov [ebp-0x20], ebx
	mov eax, [ebp-0x1c]
CL_FindServerByAddr_140:
	cmp [ebp-0x20], eax
	jl CL_FindServerByAddr_90
	mov esi, 0xffffffff
	jmp CL_FindServerByAddr_100
CL_FindServerByAddr_80:
	mov esi, [ebp-0x24]
	sub esi, 0x94
CL_FindServerByAddr_120:
	sub ebx, 0x1
	js CL_FindServerByAddr_110
	mov [esp+0x4], esi
	mov [esp], edi
	call NET_CompareAdrSigned
	sub esi, 0x94
	test eax, eax
	jz CL_FindServerByAddr_120
CL_FindServerByAddr_110:
	lea esi, [ebx+0x1]
	jmp CL_FindServerByAddr_130
CL_FindServerByAddr_70:
	mov [ebp-0x1c], esi
	mov eax, esi
	jmp CL_FindServerByAddr_140
	nop


;CL_ServerInfoPacket(netadr_t, msg_t*, int)
CL_ServerInfoPacket:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x47c
	mov dword [ebp-0x20], 0x0
	mov dword [ebp-0x1c], 0x0
	lea eax, [ebp-0x1c]
	mov [esp+0x8], eax
	lea eax, [ebp-0x20]
	mov [esp+0x4], eax
	mov eax, cls
	mov eax, [eax+0x2dbfe0]
	mov [esp], eax
	call CL_GetServerList
	mov ecx, [ebp-0x20]
	test ecx, ecx
	jz CL_ServerInfoPacket_10
	mov eax, [ebp+0x14]
	mov [esp], eax
	call MSG_ReadString
	mov esi, eax
	mov dword [esp+0x4], _cstring_protocol
	mov [esp], eax
	call Info_ValueForKey
	mov [esp], eax
	call atoi
	mov ebx, eax
	mov dword [esp], _cstring_debug_protocol
	call Cvar_VariableString
	cmp byte [eax], 0x0
	jnz CL_ServerInfoPacket_20
	mov eax, 0x6
	cmp eax, ebx
	jz CL_ServerInfoPacket_30
CL_ServerInfoPacket_40:
	mov [esp+0x8], esi
	mov dword [esp+0x4], _cstring_different_protoc
	mov dword [esp], 0xe
	call Com_DPrintf
CL_ServerInfoPacket_10:
	add esp, 0x47c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_ServerInfoPacket_20:
	mov [esp], eax
	call atoi
	cmp eax, ebx
	jnz CL_ServerInfoPacket_40
CL_ServerInfoPacket_30:
	mov edi, cls
	mov eax, [edi+0x2dbfe0]
	mov [esp+0xc], eax
	mov eax, [ebp-0x1c]
	mov [esp+0x8], eax
	mov eax, [ebp-0x20]
	mov [esp+0x4], eax
	lea eax, [ebp+0x8]
	mov [esp], eax
	call CL_FindServerByAddr
	mov edx, eax
	test eax, eax
	js CL_ServerInfoPacket_50
	lea eax, [eax+eax*8]
	lea eax, [edx+eax*4]
	mov edx, [ebp-0x20]
	mov eax, [edx+eax*4+0x24]
	test eax, eax
	jz CL_ServerInfoPacket_10
	mov ebx, [ebp+0x18]
	sub ebx, eax
	js CL_ServerInfoPacket_10
	mov ecx, [ebp+0x8]
	mov [ebp-0x44], ecx
	mov edx, [ebp+0xc]
	mov [ebp-0x40], edx
	mov eax, [ebp+0x10]
	mov [ebp-0x3c], eax
	mov [esp+0x10], ebx
	mov [esp+0xc], esi
	mov [esp], ecx
	mov [esp+0x4], edx
	mov [esp+0x8], eax
	call CL_SetServerInfoByAddress
CL_ServerInfoPacket_50:
	mov edx, [edi+0x2dbfe0]
	test edx, edx
	jnz CL_ServerInfoPacket_10
	mov dword [ebp-0x460], 0x0
	mov [ebp-0x45c], edi
	mov eax, edi
	jmp CL_ServerInfoPacket_60
CL_ServerInfoPacket_80:
	mov edi, [eax+0x148]
	mov [ebp-0x2c], edi
	mov esi, [eax+0x14c]
	mov [ebp-0x28], esi
	mov ebx, [eax+0x150]
	mov [ebp-0x24], ebx
	mov ecx, [ebp+0x8]
	mov [ebp-0x50], ecx
	mov edx, [ebp+0xc]
	mov [ebp-0x4c], edx
	mov eax, [ebp+0x10]
	mov [ebp-0x48], eax
	mov [esp+0xc], edi
	mov [esp+0x10], esi
	mov [esp+0x14], ebx
	mov [esp], ecx
	mov [esp+0x4], edx
	mov [esp+0x8], eax
	call NET_CompareAdr
	test eax, eax
	jnz CL_ServerInfoPacket_10
	add dword [ebp-0x460], 0x1
	add dword [ebp-0x45c], 0x94
	cmp dword [ebp-0x460], 0x80
	jz CL_ServerInfoPacket_70
	mov eax, [ebp-0x45c]
CL_ServerInfoPacket_60:
	cmp word [eax+0x150], 0x0
	jnz CL_ServerInfoPacket_80
	mov ecx, cls
	mov eax, [ebp-0x460]
	add eax, 0x1
	mov [ecx+0x144], eax
	mov eax, [ebp-0x460]
	lea edx, [eax+eax*8]
	lea edx, [eax+edx*4]
	lea edx, [ecx+edx*4]
	lea ebx, [edx+0x140]
	mov eax, [ebp+0x8]
	mov [ebx+0x8], eax
	mov eax, [ebp+0xc]
	mov [ebx+0xc], eax
	mov eax, [ebp+0x10]
	mov [ebx+0x10], eax
	lea ecx, [edx+0x150]
	mov byte [ecx+0x9], 0x0
	lea eax, [edx+0x160]
	mov byte [eax+0x11], 0x0
	mov byte [edx+0x191], 0x0
	mov byte [ecx+0xa], 0x0
	mov word [eax+0x8], 0x0
	mov word [ecx+0x16], 0x0
	mov word [eax+0xa], 0xffff
	mov byte [edx+0x1b1], 0x0
	mov byte [edx+0x1c9], 0x0
	mov eax, [ebp+0x8]
	mov [ecx+0x8], al
	mov byte [ebx+0x14], 0x0
	mov byte [ecx+0x13], 0x0
	mov eax, [ebp+0x14]
	mov [esp], eax
	call MSG_ReadString
	mov dword [esp+0x8], 0x400
	mov [esp+0x4], eax
	lea ebx, [ebp-0x450]
	mov [esp], ebx
	call Q_strncpyz
	cmp byte [ebp-0x450], 0x0
	jz CL_ServerInfoPacket_10
	mov edx, 0xffffffff
	xor eax, eax
	cld
	mov ecx, edx
	mov edi, ebx
	repne scasb
	not ecx
	cmp byte [ecx+ebp-0x452], 0xa
	jz CL_ServerInfoPacket_90
	mov ecx, edx
	mov edi, ebx
	repne scasb
	not ecx
	mov word [ecx+ebx-0x1], 0xa
CL_ServerInfoPacket_90:
	mov ecx, [ebp+0x8]
	mov [ebp-0x38], ecx
	mov edx, [ebp+0xc]
	mov [ebp-0x34], edx
	mov eax, [ebp+0x10]
	mov [ebp-0x30], eax
	mov [esp], ecx
	mov [esp+0x4], edx
	mov [esp+0x8], eax
	call NET_AdrToString
	mov [esp+0xc], ebx
	mov [esp+0x8], eax
	mov dword [esp+0x4], _cstring_s_s
	mov dword [esp], 0xe
	call Com_Printf
	jmp CL_ServerInfoPacket_10
CL_ServerInfoPacket_70:
	mov dword [esp+0x4], _cstring_max_other_server
	mov dword [esp], 0xe
	call Com_DPrintf
	jmp CL_ServerInfoPacket_10
	nop


;CL_ResetPlayerMuting(int)
CL_ResetPlayerMuting:
	push ebp
	mov ebp, esp
	mov eax, [ebp+0x8]
	mov byte [eax+s_playerMute], 0x0
	pop ebp
	ret
	nop


;CL_SortGlobalServers()
CL_SortGlobalServers:
	push ebp
	mov ebp, esp
	sub esp, 0x18
	mov dword [esp+0xc], CL_CompareAdrSigned
	mov dword [esp+0x8], 0x94
	mov eax, cls
	mov edx, [eax+0x4b58]
	mov [esp+0x4], edx
	add eax, 0x4b5c
	mov [esp], eax
	call qsort
	leave
	ret
	add [eax], al


;CL_ServerStatusResponse(netadr_t, msg_t*)
CL_ServerStatusResponse:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x47c
	movzx eax, word [ebp+0x10]
	mov [ebp-0x43e], ax
	movzx ebx, byte [ebp+0xf]
	mov [ebp-0x43f], bl
	movzx eax, byte [ebp+0xe]
	mov [ebp-0x440], al
	movzx ebx, byte [ebp+0xd]
	mov [ebp-0x441], bl
	movzx eax, byte [ebp+0xc]
	mov [ebp-0x442], al
	mov ebx, [ebp+0x8]
	mov [ebp-0x448], ebx
	mov dword [ebp-0x45c], 0x0
	mov edi, cl_serverStatusList
	mov esi, cl_serverStatusList
CL_ServerStatusResponse_20:
	mov ecx, [edi+0x2000]
	mov [ebp-0x38], ecx
	mov edx, [edi+0x2004]
	mov [ebp-0x34], edx
	mov eax, [edi+0x2008]
	mov [ebp-0x30], eax
	movzx ebx, word [ebp-0x43e]
	mov [ebp-0x24], bx
	movzx ebx, byte [ebp-0x43f]
	mov [ebp-0x25], bl
	movzx ebx, byte [ebp-0x440]
	mov [ebp-0x26], bl
	movzx ebx, byte [ebp-0x441]
	mov [ebp-0x27], bl
	movzx ebx, byte [ebp-0x442]
	mov [ebp-0x28], bl
	mov ebx, [ebp-0x448]
	mov [ebp-0x2c], ebx
	mov [esp+0xc], ecx
	mov [esp+0x10], edx
	mov [esp+0x14], eax
	mov [esp], ebx
	mov eax, [ebp-0x28]
	mov [esp+0x4], eax
	mov eax, [ebp-0x24]
	mov [esp+0x8], eax
	call NET_CompareAdr
	test eax, eax
	jnz CL_ServerStatusResponse_10
	add dword [ebp-0x45c], 0x1
	add esi, 0x2020
	add edi, 0x2020
	cmp dword [ebp-0x45c], 0x10
	jnz CL_ServerStatusResponse_20
CL_ServerStatusResponse_30:
	add esp, 0x47c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_ServerStatusResponse_10:
	test esi, esi
	jz CL_ServerStatusResponse_30
	mov eax, [ebp+0x14]
	mov [esp], eax
	call MSG_ReadStringLine
	mov edi, eax
	mov [esp+0xc], eax
	mov dword [esp+0x8], _cstring_s
	mov dword [esp+0x4], 0x2000
	mov [esp], esi
	call Com_sprintf
	mov eax, [esi+0x2018]
	test eax, eax
	jnz CL_ServerStatusResponse_40
CL_ServerStatusResponse_70:
	cld
	mov ecx, 0xffffffff
	xor eax, eax
	mov edi, esi
	repne scasb
	not ecx
	sub ecx, 0x1
	mov dword [esp+0x8], _cstring_
	mov eax, 0x2000
	sub eax, ecx
	mov [esp+0x4], eax
	lea ecx, [esi+ecx]
	mov [esp], ecx
	call Com_sprintf
	mov eax, [esi+0x2018]
	test eax, eax
	jnz CL_ServerStatusResponse_50
CL_ServerStatusResponse_220:
	mov ebx, [ebp+0x14]
	mov [esp], ebx
	call MSG_ReadStringLine
	mov ebx, eax
	cmp byte [eax], 0x0
	jnz CL_ServerStatusResponse_60
CL_ServerStatusResponse_180:
	cld
	mov ecx, 0xffffffff
	xor eax, eax
	mov edi, esi
	repne scasb
	not ecx
	sub ecx, 0x1
	mov dword [esp+0x8], _cstring_
	mov eax, 0x2000
	sub eax, ecx
	mov [esp+0x4], eax
	lea ecx, [esi+ecx]
	mov [esp], ecx
	call Com_sprintf
	call Sys_Milliseconds
	mov [esi+0x200c], eax
	movzx ebx, word [ebp-0x43e]
	mov [esi+0x2008], bx
	movzx eax, byte [ebp-0x43f]
	mov [esi+0x2007], al
	movzx ebx, byte [ebp-0x440]
	mov [esi+0x2006], bl
	movzx eax, byte [ebp-0x441]
	mov [esi+0x2005], al
	movzx ebx, byte [ebp-0x442]
	mov [esi+0x2004], bl
	mov eax, [ebp-0x448]
	mov [esi+0x2000], eax
	mov dword [esi+0x2014], 0x0
	mov edi, [esi+0x2018]
	test edi, edi
	jz CL_ServerStatusResponse_30
	mov dword [esi+0x201c], 0x1
	add esp, 0x47c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_ServerStatusResponse_40:
	mov dword [esp+0x4], _cstring_server_settings
	mov dword [esp], 0xe
	call Com_Printf
	movzx eax, byte [edi]
CL_ServerStatusResponse_150:
	test al, al
	jz CL_ServerStatusResponse_70
	mov dword [ebp-0x43c], 0x0
	lea ebx, [ebp-0x438]
	cmp al, 0x5c
	jz CL_ServerStatusResponse_80
CL_ServerStatusResponse_140:
	xor edx, edx
	jmp CL_ServerStatusResponse_90
CL_ServerStatusResponse_110:
	movzx eax, byte [edi]
CL_ServerStatusResponse_90:
	test al, al
	jz CL_ServerStatusResponse_100
	mov [edx+ebx], al
	add edx, 0x1
	cmp edx, 0x3ff
	jz CL_ServerStatusResponse_100
	add edi, 0x1
	cmp byte [edi], 0x5c
	jnz CL_ServerStatusResponse_110
CL_ServerStatusResponse_100:
	mov byte [ebp+edx-0x438], 0x0
	mov eax, [ebp-0x43c]
	test eax, eax
	jz CL_ServerStatusResponse_120
	mov [esp+0x8], ebx
	mov dword [esp+0x4], _cstring_s1
	mov dword [esp], 0xe
	call Com_Printf
CL_ServerStatusResponse_160:
	add dword [ebp-0x43c], 0x1
	cmp dword [ebp-0x43c], 0x2
	jz CL_ServerStatusResponse_130
	movzx eax, byte [edi]
	test al, al
	jz CL_ServerStatusResponse_70
	cmp al, 0x5c
	jnz CL_ServerStatusResponse_140
CL_ServerStatusResponse_80:
	add edi, 0x1
	movzx eax, byte [edi]
	jmp CL_ServerStatusResponse_140
CL_ServerStatusResponse_130:
	movzx eax, byte [edi]
	jmp CL_ServerStatusResponse_150
CL_ServerStatusResponse_120:
	mov [esp+0x8], ebx
	mov dword [esp+0x4], _cstring_24s
	mov dword [esp], 0xe
	call Com_Printf
	jmp CL_ServerStatusResponse_160
CL_ServerStatusResponse_60:
	mov dword [ebp-0x44c], 0x0
	jmp CL_ServerStatusResponse_170
CL_ServerStatusResponse_190:
	mov eax, [ebp+0x14]
	mov [esp], eax
	call MSG_ReadStringLine
	mov ebx, eax
	add dword [ebp-0x44c], 0x1
	cmp byte [eax], 0x0
	jz CL_ServerStatusResponse_180
CL_ServerStatusResponse_170:
	cld
	mov ecx, 0xffffffff
	mov edi, esi
	xor eax, eax
	repne scasb
	not ecx
	sub ecx, 0x1
	mov [esp+0xc], ebx
	mov dword [esp+0x8], _cstring_s2
	mov eax, 0x2000
	sub eax, ecx
	mov [esp+0x4], eax
	lea ecx, [esi+ecx]
	mov [esp], ecx
	call Com_sprintf
	mov eax, [esi+0x2018]
	test eax, eax
	jz CL_ServerStatusResponse_190
	mov dword [ebp-0x20], 0x0
	mov dword [ebp-0x1c], 0x0
	lea eax, [ebp-0x20]
	mov [esp+0xc], eax
	lea eax, [ebp-0x1c]
	mov [esp+0x8], eax
	mov dword [esp+0x4], _cstring_d_d
	mov [esp], ebx
	call sscanf
	mov dword [esp+0x4], 0x20
	mov [esp], ebx
	call strchr
	test eax, eax
	jz CL_ServerStatusResponse_200
	add eax, 0x1
	mov dword [esp+0x4], 0x20
	mov [esp], eax
	call strchr
	test eax, eax
	jz CL_ServerStatusResponse_200
	add eax, 0x1
CL_ServerStatusResponse_210:
	mov [esp+0x14], eax
	mov eax, [ebp-0x20]
	mov [esp+0x10], eax
	mov eax, [ebp-0x1c]
	mov [esp+0xc], eax
	mov ebx, [ebp-0x44c]
	mov [esp+0x8], ebx
	mov dword [esp+0x4], _cstring_2d___3d____3d___
	mov dword [esp], 0xe
	call Com_Printf
	jmp CL_ServerStatusResponse_190
CL_ServerStatusResponse_200:
	mov eax, _cstring_unknown
	jmp CL_ServerStatusResponse_210
CL_ServerStatusResponse_50:
	mov dword [esp+0x4], _cstring_players
	mov dword [esp], 0xe
	call Com_Printf
	mov dword [esp+0x4], _cstring_num_score_ping_n
	mov dword [esp], 0xe
	call Com_Printf
	jmp CL_ServerStatusResponse_220
	nop


;CL_ServersResponsePacket(netadr_t, msg_t*)
CL_ServersResponsePacket:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x67c
	mov ebx, [ebp+0x14]
	mov dword [esp+0x4], _cstring_cl_serversrespon
	mov dword [esp], 0xe
	call Com_Printf
	call Sys_Milliseconds
	add eax, 0x7d0
	mov edx, cls
	mov [edx+0x4b54], eax
	mov esi, [ebx+0x8]
	mov ebx, [ebx+0x14]
	add ebx, esi
	mov [ebp-0x644], ebx
	mov dword [ebp-0x648], 0x0
	lea edi, [ebp-0x62d]
	lea ebx, [esi+0x1]
	cmp [ebp-0x644], ebx
	ja CL_ServersResponsePacket_10
	jmp CL_ServersResponsePacket_20
CL_ServersResponsePacket_40:
	mov esi, ebx
	add ebx, 0x1
CL_ServersResponsePacket_10:
	cmp byte [esi], 0x5c
	jz CL_ServersResponsePacket_30
	cmp [ebp-0x644], ebx
	ja CL_ServersResponsePacket_40
CL_ServersResponsePacket_30:
	mov eax, [ebp-0x644]
	sub eax, 0x6
	cmp eax, ebx
	jbe CL_ServersResponsePacket_20
	movzx eax, byte [esi+0x1]
	mov [edi-0x3], al
	movzx eax, byte [ebx+0x1]
	mov [edi-0x2], al
	movzx eax, byte [ebx+0x2]
	mov [edi-0x1], al
	movzx eax, byte [ebx+0x3]
	mov [edi], al
	movzx eax, byte [ebx+0x4]
	shl eax, 0x8
	mov [edi+0x1], ax
	movzx edx, byte [ebx+0x5]
	add eax, edx
	mov [edi+0x1], ax
	add esi, 0x7
	cwde
	mov [esp], eax
	call BigShort
	mov [edi+0x1], ax
	cmp byte [esi], 0x5c
	jnz CL_ServersResponsePacket_20
	movzx eax, ax
	mov [esp+0x1c], eax
	movzx eax, byte [edi]
	mov [esp+0x18], eax
	movzx eax, byte [edi-0x1]
	mov [esp+0x14], eax
	movzx eax, byte [edi-0x2]
	mov [esp+0x10], eax
	movzx eax, byte [edi-0x3]
	mov [esp+0xc], eax
	mov eax, [ebp-0x648]
	mov [esp+0x8], eax
	mov dword [esp+0x4], _cstring_server_d_ip_dddd
	mov dword [esp], 0xe
	call Com_DPrintf
	add dword [ebp-0x648], 0x1
	cmp dword [ebp-0x648], 0x100
	jz CL_ServersResponsePacket_20
	cmp byte [ebx+0x7], 0x45
	jz CL_ServersResponsePacket_50
CL_ServersResponsePacket_250:
	add edi, 0x6
CL_ServersResponsePacket_260:
	lea ebx, [esi+0x1]
	cmp [ebp-0x644], ebx
	ja CL_ServersResponsePacket_10
CL_ServersResponsePacket_20:
	mov edx, cls
	mov [ebp-0x658], edx
	mov edi, [edx+0x4b58]
	mov [ebp-0x63c], edi
	mov eax, [ebp-0x648]
	test eax, eax
	jle CL_ServersResponsePacket_60
	cmp edi, 0x4e1f
	jg CL_ServersResponsePacket_70
	mov [ebp-0x64c], edi
	mov dword [ebp-0x650], 0x0
	lea eax, [ebp-0x630]
	mov [ebp-0x660], eax
	lea eax, [edi+edi*8]
	lea eax, [edi+eax*4]
	lea eax, [eax*4+0x4b50]
	mov [ebp-0x664], eax
	jmp CL_ServersResponsePacket_80
CL_ServersResponsePacket_120:
	mov edx, [ebp-0x64c]
	cmp [ebp-0x63c], edx
	jl CL_ServersResponsePacket_90
CL_ServersResponsePacket_180:
	mov eax, [ebp-0x63c]
CL_ServersResponsePacket_300:
	cmp eax, [ebp-0x64c]
	jz CL_ServersResponsePacket_100
CL_ServersResponsePacket_220:
	add dword [ebp-0x650], 0x1
	add dword [ebp-0x660], 0x6
	mov eax, [ebp-0x650]
	cmp [ebp-0x648], eax
	jz CL_ServersResponsePacket_110
CL_ServersResponsePacket_230:
	cmp dword [ebp-0x64c], 0x4e1f
	jg CL_ServersResponsePacket_110
CL_ServersResponsePacket_80:
	mov dword [ebp-0x24], 0x4
	mov edx, [ebp-0x660]
	movzx esi, byte [edx]
	mov eax, esi
	mov [ebp-0x20], al
	movzx ebx, byte [edx+0x1]
	mov [ebp-0x1f], bl
	movzx ecx, byte [edx+0x2]
	mov [ebp-0x1e], cl
	mov edi, edx
	movzx edx, byte [edx+0x3]
	mov [ebp-0x1d], dl
	movzx eax, word [edi+0x4]
	mov [ebp-0x1c], ax
	mov [ebp-0x28], ax
	mov [ebp-0x29], dl
	mov [ebp-0x2a], cl
	mov [ebp-0x2b], bl
	mov eax, esi
	mov [ebp-0x2c], al
	mov dword [ebp-0x30], 0x4
	mov edx, [ebp-0x658]
	mov edi, [edx+0x4b58]
	test edi, edi
	jle CL_ServersResponsePacket_120
	mov dword [ebp-0x640], 0x0
	jmp CL_ServersResponsePacket_130
CL_ServersResponsePacket_160:
	jle CL_ServersResponsePacket_140
	add ebx, 0x1
	mov [ebp-0x640], ebx
	cmp edi, [ebp-0x640]
	jle CL_ServersResponsePacket_150
CL_ServersResponsePacket_170:
	mov edx, cls
	mov [ebp-0x658], edx
CL_ServersResponsePacket_130:
	mov edx, [ebp-0x640]
	add edx, edi
	mov eax, edx
	shr eax, 0x1f
	lea ebx, [eax+edx]
	sar ebx, 1
	mov esi, ebx
	lea eax, [ebx+ebx*8]
	lea eax, [ebx+eax*4]
	mov edx, [ebp-0x658]
	lea eax, [edx+eax*4+0x4b5c]
	mov [esp+0x4], eax
	lea eax, [ebp-0x30]
	mov [esp], eax
	call NET_CompareAdrSigned
	cmp eax, 0x0
	jge CL_ServersResponsePacket_160
	mov edi, ebx
	cmp edi, [ebp-0x640]
	jg CL_ServersResponsePacket_170
CL_ServersResponsePacket_150:
	mov eax, cls
	mov [ebp-0x658], eax
	mov edx, [ebp-0x64c]
	cmp [ebp-0x63c], edx
	jge CL_ServersResponsePacket_180
CL_ServersResponsePacket_90:
	mov esi, [ebp-0x63c]
	mov edx, [ebp-0x658]
	jmp CL_ServersResponsePacket_190
CL_ServersResponsePacket_210:
	mov edi, cls
	mov [ebp-0x658], edi
	mov edx, edi
CL_ServersResponsePacket_190:
	lea eax, [esi+esi*8]
	lea eax, [esi+eax*4]
	lea eax, [edx+eax*4+0x4b50]
	mov [ebp-0x654], eax
	mov edi, eax
	add edi, 0xc
	mov [esp+0x4], edi
	lea eax, [ebp-0x24]
	mov [esp], eax
	call NET_CompareAdrSigned
	test eax, eax
	jz CL_ServersResponsePacket_200
	add esi, 0x1
	mov eax, [ebp-0x64c]
	cmp eax, esi
	jnz CL_ServersResponsePacket_210
	mov edi, cls
	mov [ebp-0x658], edi
	cmp eax, [ebp-0x64c]
	jnz CL_ServersResponsePacket_220
CL_ServersResponsePacket_100:
	mov edi, [ebp-0x664]
	add edi, [ebp-0x658]
	lea eax, [edi+0xc]
	add dword [ebp-0x64c], 0x1
	add dword [ebp-0x664], 0x94
	movzx ecx, byte [ebp-0x1e]
	movzx ebx, byte [ebp-0x1f]
	movzx esi, byte [ebp-0x20]
	movzx edx, word [ebp-0x1c]
	mov [eax+0x8], dx
	movzx edx, byte [ebp-0x1d]
	mov [eax+0x7], dl
	mov [eax+0x6], cl
	mov [eax+0x5], bl
	mov edx, esi
	mov [eax+0x4], dl
	mov edx, [ebp-0x24]
	mov [edi+0xc], edx
	mov dword [eax+0x24], 0x0
	mov byte [eax+0x28], 0x0
	mov byte [eax+0x11], 0x0
	mov byte [eax+0x29], 0x0
	mov byte [eax+0x49], 0x0
	mov byte [eax+0x12], 0x0
	mov word [eax+0x20], 0x0
	mov word [eax+0x1e], 0x0
	mov word [eax+0x22], 0xffff
	mov byte [eax+0x69], 0x0
	mov byte [eax+0x81], 0x0
	mov byte [eax+0x10], 0x0
	mov byte [eax+0xc], 0x0
	mov byte [eax+0x13], 0x1
	mov byte [eax+0x1c], 0x0
	add dword [ebp-0x650], 0x1
	add dword [ebp-0x660], 0x6
	mov eax, [ebp-0x650]
	cmp [ebp-0x648], eax
	jnz CL_ServersResponsePacket_230
CL_ServersResponsePacket_110:
	mov edi, [ebp-0x64c]
	jmp CL_ServersResponsePacket_240
CL_ServersResponsePacket_50:
	cmp byte [ebx+0x8], 0x4f
	jnz CL_ServersResponsePacket_250
	movzx eax, byte [ebx+0x9]
	cmp al, 0x54
	jz CL_ServersResponsePacket_20
	cmp al, 0x46
	jz CL_ServersResponsePacket_20
	add edi, 0x6
	jmp CL_ServersResponsePacket_260
CL_ServersResponsePacket_60:
	mov edx, edi
	jmp CL_ServersResponsePacket_270
CL_ServersResponsePacket_140:
	sub esi, 0x1
	js CL_ServersResponsePacket_280
	lea eax, [esi+esi*8]
	lea eax, [esi+eax*4]
	lea eax, [eax*4+0x4b50]
	add eax, cls
	add eax, 0xc
	mov [esp+0x4], eax
	lea edx, [ebp-0x30]
	mov [esp], edx
	call NET_CompareAdrSigned
	test eax, eax
	jz CL_ServersResponsePacket_140
CL_ServersResponsePacket_280:
	lea edi, [esi+0x1]
	mov eax, cls
	mov [ebp-0x658], eax
	lea eax, [edi+edi*8]
	lea eax, [edi+eax*4]
	mov edx, [ebp-0x658]
	lea eax, [edx+eax*4]
	lea edx, [eax+0x4b5c]
	mov [ebp-0x65c], edx
	lea esi, [eax+0x4b50]
CL_ServersResponsePacket_290:
	movzx edx, byte [ebp-0x2a]
	movzx ecx, byte [ebp-0x2b]
	movzx ebx, byte [ebp-0x2c]
	movzx eax, word [ebp-0x28]
	mov [esi+0x14], ax
	movzx eax, byte [ebp-0x29]
	mov [esi+0x13], al
	mov [esi+0x12], dl
	mov [esi+0x11], cl
	mov [esi+0x10], bl
	mov eax, [ebp-0x30]
	mov [esi+0xc], eax
	mov dword [esi+0x30], 0x0
	mov byte [esi+0x34], 0x0
	mov byte [esi+0x1d], 0x0
	mov byte [esi+0x35], 0x0
	mov byte [esi+0x55], 0x0
	mov byte [esi+0x1e], 0x0
	mov word [esi+0x2c], 0x0
	mov word [esi+0x2a], 0x0
	mov word [esi+0x2e], 0xffff
	mov byte [esi+0x75], 0x0
	mov byte [esi+0x8d], 0x0
	mov byte [esi+0x1c], 0x0
	mov byte [esi+0x18], 0x0
	mov byte [esi+0x1f], 0x1
	mov byte [esi+0x28], 0x0
	add edi, 0x1
	add esi, 0x94
	add dword [ebp-0x65c], 0x94
	mov eax, [ebp-0x658]
	cmp edi, [eax+0x4b58]
	jge CL_ServersResponsePacket_220
	mov edx, [ebp-0x65c]
	mov [esp+0x4], edx
	lea eax, [ebp-0x30]
	mov [esp], eax
	call NET_CompareAdrSigned
	test eax, eax
	jz CL_ServersResponsePacket_290
	mov edi, cls
	mov [ebp-0x658], edi
	jmp CL_ServersResponsePacket_220
CL_ServersResponsePacket_70:
	mov edx, [ebp-0x63c]
CL_ServersResponsePacket_270:
	mov [ebp-0x64c], edx
	mov edi, edx
CL_ServersResponsePacket_240:
	mov eax, [ebp-0x658]
	mov [eax+0x4b58], edi
	mov dword [esp+0xc], CL_CompareAdrSigned
	mov dword [esp+0x8], 0x94
	mov [esp+0x4], edi
	mov eax, [ebp-0x658]
	add eax, 0x4b5c
	mov [esp], eax
	call qsort
	mov eax, [ebp-0x648]
	mov edx, [ebp-0x658]
	add eax, [edx+0x4b50]
	mov [edx+0x4b50], eax
	mov [esp+0x10], eax
	mov [esp+0xc], edi
	mov edi, [ebp-0x648]
	mov [esp+0x8], edi
	mov dword [esp+0x4], _cstring_d_servers_parsed
	mov dword [esp], 0xe
	call Com_Printf
	add esp, 0x67c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_ServersResponsePacket_200:
	movzx edx, byte [ebp-0x1e]
	movzx ecx, byte [ebp-0x1f]
	movzx ebx, byte [ebp-0x20]
	movzx eax, word [ebp-0x1c]
	mov [edi+0x8], ax
	movzx eax, byte [ebp-0x1d]
	mov [edi+0x7], al
	mov [edi+0x6], dl
	mov [edi+0x5], cl
	mov [edi+0x4], bl
	mov eax, [ebp-0x24]
	mov edx, [ebp-0x654]
	mov [edx+0xc], eax
	mov dword [edi+0x24], 0x0
	mov byte [edi+0x28], 0x0
	mov byte [edi+0x11], 0x0
	mov byte [edi+0x29], 0x0
	mov byte [edi+0x49], 0x0
	mov byte [edi+0x12], 0x0
	mov word [edi+0x20], 0x0
	mov word [edi+0x1e], 0x0
	mov word [edi+0x22], 0xffff
	mov byte [edi+0x69], 0x0
	mov byte [edi+0x81], 0x0
	mov byte [edi+0x10], 0x0
	mov byte [edi+0xc], 0x0
	mov byte [edi+0x13], 0x1
	mov byte [edi+0x1c], 0x0
	mov eax, esi
	mov edi, cls
	mov [ebp-0x658], edi
	jmp CL_ServersResponsePacket_300


;CL_SetServerInfoByAddress(netadr_t, char const*, int)
CL_SetServerInfoByAddress:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x7c
	mov dword [ebp-0x4c], 0x0
	mov eax, cls
	mov [ebp-0x54], eax
	add eax, 0x148
	mov [ebp-0x64], eax
	jmp CL_SetServerInfoByAddress_10
CL_SetServerInfoByAddress_30:
	add dword [ebp-0x4c], 0x1
	add dword [ebp-0x64], 0x94
	add dword [ebp-0x54], 0x94
	cmp dword [ebp-0x4c], 0x80
	jz CL_SetServerInfoByAddress_20
CL_SetServerInfoByAddress_10:
	mov edx, [ebp-0x54]
	mov edi, [edx+0x148]
	mov [ebp-0x48], edi
	mov esi, [edx+0x14c]
	mov [ebp-0x44], esi
	mov ebx, [edx+0x150]
	mov [ebp-0x40], ebx
	mov ecx, [ebp+0x8]
	mov [ebp-0x3c], ecx
	mov edx, [ebp+0xc]
	mov [ebp-0x38], edx
	mov eax, [ebp+0x10]
	mov [ebp-0x34], eax
	mov [esp+0xc], edi
	mov [esp+0x10], esi
	mov [esp+0x14], ebx
	mov [esp], ecx
	mov [esp+0x4], edx
	mov [esp+0x8], eax
	call NET_CompareAdr
	test eax, eax
	jz CL_SetServerInfoByAddress_30
	mov eax, [ebp+0x18]
	mov [esp+0x8], eax
	mov edx, [ebp+0x14]
	mov [esp+0x4], edx
	mov eax, [ebp-0x64]
	mov [esp], eax
	call CL_SetServerInfo
	add dword [ebp-0x4c], 0x1
	add dword [ebp-0x64], 0x94
	add dword [ebp-0x54], 0x94
	cmp dword [ebp-0x4c], 0x80
	jnz CL_SetServerInfoByAddress_10
CL_SetServerInfoByAddress_20:
	mov dword [esp+0xc], 0x1
	mov ebx, cls
	mov eax, [ebx+0x4b58]
	mov [esp+0x8], eax
	lea eax, [ebx+0x4b5c]
	mov [esp+0x4], eax
	lea edx, [ebp+0x8]
	mov [esp], edx
	call CL_FindServerByAddr
	mov edi, eax
	mov [ebp-0x5c], ebx
	lea eax, [eax+eax*8]
	lea eax, [edi+eax*4]
	lea ebx, [ebx+eax*4+0x4b5c]
	mov esi, ebx
CL_SetServerInfoByAddress_50:
	mov eax, [ebp+0x18]
	mov [esp+0x8], eax
	mov edx, [ebp+0x14]
	mov [esp+0x4], edx
	mov [esp], esi
	call CL_SetServerInfo
	add edi, 0x1
	add esi, 0x94
	add ebx, 0x94
	mov eax, [ebp-0x5c]
	cmp edi, [eax+0x4b58]
	jge CL_SetServerInfoByAddress_40
	mov [esp+0x4], ebx
	lea edx, [ebp+0x8]
	mov [esp], edx
	call NET_CompareAdrSigned
	test eax, eax
	jz CL_SetServerInfoByAddress_50
	mov eax, [ebp-0x5c]
CL_SetServerInfoByAddress_40:
	mov dword [ebp-0x50], 0x0
	add eax, 0x2d75e0
	mov [ebp-0x58], eax
	mov edx, cls
	add edx, 0x2d75e0
	mov [ebp-0x60], edx
	jmp CL_SetServerInfoByAddress_60
CL_SetServerInfoByAddress_80:
	add dword [ebp-0x50], 0x1
	add dword [ebp-0x60], 0x94
	add dword [ebp-0x58], 0x94
	cmp dword [ebp-0x50], 0x80
	jz CL_SetServerInfoByAddress_70
CL_SetServerInfoByAddress_90:
	mov eax, [ebp-0x58]
CL_SetServerInfoByAddress_60:
	mov edi, [eax]
	mov [ebp-0x30], edi
	mov esi, [eax+0x4]
	mov [ebp-0x2c], esi
	mov ebx, [eax+0x8]
	mov [ebp-0x28], ebx
	mov ecx, [ebp+0x8]
	mov [ebp-0x24], ecx
	mov edx, [ebp+0xc]
	mov [ebp-0x20], edx
	mov eax, [ebp+0x10]
	mov [ebp-0x1c], eax
	mov [esp+0xc], edi
	mov [esp+0x10], esi
	mov [esp+0x14], ebx
	mov [esp], ecx
	mov [esp+0x4], edx
	mov [esp+0x8], eax
	call NET_CompareAdr
	test eax, eax
	jz CL_SetServerInfoByAddress_80
	mov edx, [ebp+0x18]
	mov [esp+0x8], edx
	mov eax, [ebp+0x14]
	mov [esp+0x4], eax
	mov edx, [ebp-0x60]
	mov [esp], edx
	call CL_SetServerInfo
	add dword [ebp-0x50], 0x1
	add dword [ebp-0x60], 0x94
	add dword [ebp-0x58], 0x94
	cmp dword [ebp-0x50], 0x80
	jnz CL_SetServerInfoByAddress_90
CL_SetServerInfoByAddress_70:
	add esp, 0x7c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	nop


;CL_Ping_f()
CL_Ping_f:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x6c
	mov eax, cmd_args
	mov edx, [eax]
	cmp dword [eax+edx*4+0x44], 0x2
	jz CL_Ping_f_10
	mov dword [esp+0x4], _cstring_usage_ping_serve
	mov dword [esp], 0x0
	call Com_Printf
CL_Ping_f_20:
	add esp, 0x6c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_Ping_f_10:
	mov dword [ebp-0x3c], 0x0
	mov dword [ebp-0x38], 0x0
	mov dword [ebp-0x34], 0x0
	mov eax, [eax+edx*4+0x64]
	mov edx, [eax+0x4]
	lea eax, [ebp-0x3c]
	mov [esp+0x4], eax
	mov [esp], edx
	call NET_StringToAdr
	test eax, eax
	jz CL_Ping_f_20
	call Sys_Milliseconds
	mov edi, eax
	mov ebx, cl_pinglist
	mov [ebp-0x4c], ebx
	lea edx, [ebx+0x8]
	lea esi, [ebx+0x4140]
	jmp CL_Ping_f_30
CL_Ping_f_60:
	mov eax, edi
	sub eax, [edx+0x4]
	cmp eax, 0x1f3
	jg CL_Ping_f_40
CL_Ping_f_70:
	add ebx, 0x414
	add edx, 0x414
	mov ecx, esi
	cmp esi, ebx
	jz CL_Ping_f_50
CL_Ping_f_30:
	cmp word [edx], 0x0
	jz CL_Ping_f_40
	mov eax, [edx+0x8]
	test eax, eax
	jz CL_Ping_f_60
	cmp eax, 0x1f3
	jle CL_Ping_f_70
CL_Ping_f_40:
	mov word [ebx+0x8], 0x0
CL_Ping_f_100:
	mov eax, [ebp-0x3c]
	mov [ebx], eax
	mov eax, [ebp-0x38]
	mov [ebx+0x4], eax
	mov eax, [ebp-0x34]
	mov [ebx+0x8], eax
	call Sys_Milliseconds
	mov [ebx+0xc], eax
	mov dword [ebx+0x10], 0x0
	mov ecx, [ebx]
	mov [ebp-0x30], ecx
	mov edx, [ebx+0x4]
	mov [ebp-0x2c], edx
	mov eax, [ebx+0x8]
	mov [ebp-0x28], eax
	mov dword [esp+0x10], 0x0
	mov dword [esp+0xc], 0x0
	mov [esp], ecx
	mov [esp+0x4], edx
	mov [esp+0x8], eax
	call CL_SetServerInfoByAddress
	mov ecx, [ebp-0x3c]
	mov [ebp-0x24], ecx
	mov edx, [ebp-0x38]
	mov [ebp-0x20], edx
	mov eax, [ebp-0x34]
	mov [ebp-0x1c], eax
	mov dword [esp+0x10], _cstring_getinfo_xxx
	mov [esp+0x4], ecx
	mov [esp+0x8], edx
	mov [esp+0xc], eax
	mov dword [esp], 0x0
	call NET_OutOfBandPrint
	add esp, 0x6c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_Ping_f_50:
	mov ebx, [ebp-0x4c]
	mov edx, ebx
	mov esi, 0x80000000
CL_Ping_f_90:
	mov eax, edi
	sub eax, [edx+0xc]
	cmp eax, esi
	jle CL_Ping_f_80
	mov ebx, edx
	mov esi, eax
CL_Ping_f_80:
	add edx, 0x414
	cmp ecx, edx
	jnz CL_Ping_f_90
	jmp CL_Ping_f_100


;CL_Rcon_f()
CL_Rcon_f:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x44c
	mov ebx, cmd_args
	mov eax, [ebx]
	cmp dword [ebx+eax*4+0x44], 0x1
	jle CL_Rcon_f_10
	mov eax, [ebx+eax*4+0x64]
	mov edi, [eax+0x4]
	mov dword [esp+0x4], _cstring_login
	mov [esp], edi
	call Q_stricmp
	test eax, eax
	jnz CL_Rcon_f_20
	mov eax, [ebx]
	cmp dword [ebx+eax*4+0x44], 0x3
	jz CL_Rcon_f_30
	mov dword [esp+0x4], _cstring_usage_rcon_login
	mov dword [esp], 0xe
	call Com_Printf
CL_Rcon_f_90:
	add esp, 0x44c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_Rcon_f_30:
	mov eax, [ebx+eax*4+0x64]
	mov edx, [eax+0x8]
	cld
	mov ecx, 0xffffffff
	xor eax, eax
	mov edi, edx
	repne scasb
	not ecx
	lea eax, [ecx-0x1]
	cmp eax, 0x17
	ja CL_Rcon_f_40
	mov [esp+0x8], ecx
	mov [esp+0x4], edx
	mov dword [esp], rconGlob
	call memcpy
	add esp, 0x44c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_Rcon_f_20:
	mov dword [esp+0x4], _cstring_logout
	mov [esp], edi
	call Q_stricmp
	test eax, eax
	jnz CL_Rcon_f_50
	cmp byte [rconGlob], 0x0
	jz CL_Rcon_f_60
	mov byte [rconGlob], 0x0
	add esp, 0x44c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_Rcon_f_40:
	mov dword [esp+0x8], 0x18
	mov dword [esp+0x4], _cstring_rcon_password_mu
	mov dword [esp], 0xe
	call Com_Printf
	add esp, 0x44c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_Rcon_f_50:
	mov dword [esp+0x4], _cstring_host
	mov [esp], edi
	call Q_stricmp
	test eax, eax
	jz CL_Rcon_f_70
	cmp byte [rconGlob], 0x0
	jnz CL_Rcon_f_80
	mov dword [esp+0x4], _cstring_you_need_to_log_
	mov dword [esp], 0x0
	call Com_Printf
	jmp CL_Rcon_f_90
CL_Rcon_f_10:
	mov dword [esp+0x4], _cstring_usage_rcon_comma
	mov dword [esp], 0x0
	call Com_Printf
	add esp, 0x44c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CL_Rcon_f_60:
	mov dword [esp+0x4], _cstring_not_logged_in
	mov dword [esp], 0xe
	call Com_Printf
	jmp CL_Rcon_f_90
CL_Rcon_f_70:
	mov eax, [ebx]
	cmp dword [ebx+eax*4+0x44], 0x3
	jz CL_Rcon_f_100
	mov dword [esp+0x4], _cstring_usage_rcon_host_
	mov dword [esp], 0xe
	call Com_Printf
	jmp CL_Rcon_f_90
CL_Rcon_f_80:
	mov dword [esp+0x10], 0x0
	mov dword [esp+0xc], 0x400
	mov dword [esp+0x8], 0x0
	lea esi, [ebp-0x424]
	mov [esp+0x4], esi
	mov dword [esp], _cstring_rcon_
	call Com_AddToString
	mov dword [esp+0x10], 0x0
	mov dword [esp+0xc], 0x400
	mov [esp+0x8], eax
	mov [esp+0x4], esi
	mov dword [esp], rconGlob
	call Com_AddToString
	mov edx, eax
	mov eax, [ebx]
	cmp dword [ebx+eax*4+0x44], 0x1
	jg CL_Rcon_f_110
CL_Rcon_f_180:
	cmp edx, 0x400
	jz CL_Rcon_f_120
	mov byte [ebp+edx-0x424], 0x0
	mov eax, clientUIActives
	cmp dword [eax+0xc], 0x4
	jle CL_Rcon_f_130
	mov eax, clientConnections
	movzx edx, word [eax+0x401d0]
	mov [ebp-0x42a], dx
	movzx edx, byte [eax+0x401cf]
	mov [ebp-0x42b], dl
	movzx edx, byte [eax+0x401ce]
	mov [ebp-0x42c], dl
	movzx edx, byte [eax+0x401cd]
	mov [ebp-0x42d], dl
	movzx ebx, byte [eax+0x401cc]
	mov edx, [eax+0x401c8]
CL_Rcon_f_160:
	cld
	mov ecx, 0xffffffff
	xor eax, eax
	mov edi, esi
	repne scasb
	not ecx
	movzx eax, word [ebp-0x42a]
	mov [ebp-0x1c], ax
	movzx eax, byte [ebp-0x42b]
	mov [ebp-0x1d], al
	movzx eax, byte [ebp-0x42c]
	mov [ebp-0x1e], al
	movzx eax, byte [ebp-0x42d]
	mov [ebp-0x1f], al
	mov [ebp-0x20], bl
	mov [ebp-0x24], edx
	mov [esp+0x14], ecx
	mov [esp+0x10], esi
	mov [esp+0x4], edx
	mov eax, [ebp-0x20]
	mov [esp+0x8], eax
	mov eax, [ebp-0x1c]
	mov [esp+0xc], eax
	mov dword [esp], 0x0
	call NET_OutOfBandData
	jmp CL_Rcon_f_90
CL_Rcon_f_100:
	mov dword [esp+0x4], rconGlob+0x18
	mov eax, [ebx+eax*4+0x64]
	mov eax, [eax+0x8]
	mov [esp], eax
	call NET_StringToAdr
	test eax, eax
	jz CL_Rcon_f_140
	cmp word [rconGlob+0x20], 0x0
	jnz CL_Rcon_f_90
	mov dword [esp], 0x7120
	call BigShort
	mov [rconGlob+0x20], ax
	jmp CL_Rcon_f_90
CL_Rcon_f_130:
	mov edx, [rconGlob+0x18]
	cmp edx, 0x1
	jz CL_Rcon_f_150
	movzx eax, word [rconGlob+0x20]
	mov [ebp-0x42a], ax
	movzx eax, byte [rconGlob+0x1f]
	mov [ebp-0x42b], al
	movzx eax, byte [rconGlob+0x1e]
	mov [ebp-0x42c], al
	movzx eax, byte [rconGlob+0x1d]
	mov [ebp-0x42d], al
	movzx ebx, byte [rconGlob+0x1c]
	jmp CL_Rcon_f_160
CL_Rcon_f_110:
	mov edi, 0x1
	jmp CL_Rcon_f_170
CL_Rcon_f_190:
	mov eax, _cstring_null
CL_Rcon_f_200:
	mov dword [esp+0x10], 0x1
	mov dword [esp+0xc], 0x400
	mov [esp+0x8], edx
	mov [esp+0x4], esi
	mov [esp], eax
	call Com_AddToString
	mov edx, eax
	add edi, 0x1
	mov eax, [ebx]
	cmp edi, [ebx+eax*4+0x44]
	jge CL_Rcon_f_180
CL_Rcon_f_170:
	mov dword [esp+0x10], 0x0
	mov dword [esp+0xc], 0x400
	mov [esp+0x8], edx
	mov [esp+0x4], esi
	mov dword [esp], _cstring_space
	call Com_AddToString
	mov edx, eax
	mov eax, [ebx]
	cmp edi, [ebx+eax*4+0x44]
	jge CL_Rcon_f_190
	mov eax, [ebx+eax*4+0x64]
	mov eax, [eax+edi*4]
	jmp CL_Rcon_f_200
CL_Rcon_f_140:
	mov dword [esp+0x4], _cstring_bad_host_address
	mov dword [esp], 0xe
	call Com_Printf
	jmp CL_Rcon_f_90
CL_Rcon_f_120:
	mov dword [esp+0x8], 0x3ff
	mov dword [esp+0x4], _cstring_rcon_commands_ar
	mov dword [esp], 0x0
	call Com_Printf
	jmp CL_Rcon_f_90
CL_Rcon_f_150:
	mov dword [esp+0x4], _cstring_cant_determine_r
	mov dword [esp], 0x0
	call Com_Printf
	mov dword [esp+0x4], _cstring_1_joining_the_se
	mov dword [esp], 0x0
	call Com_Printf
	mov dword [esp+0x4], _cstring_2_setting_the_ho
	mov dword [esp], 0x0
	call Com_Printf
	jmp CL_Rcon_f_90


;Initialized global or static variables of cl_main_pc_mp:
SECTION .data


;Initialized constant data of cl_main_pc_mp:
SECTION .rdata


;Zero initialized global or static variables of cl_main_pc_mp:
SECTION .bss
s_playerMute: resb 0x40
rconGlob: resb 0x40
cl_serverStatusList: resb 0x20260


;All cstrings:
SECTION .rdata
_cstring_already_connecte:		db "Already connected to a server. Disconnect first",0ah,0
_cstring_reconnect:		db "reconnect",0
_cstring_localhost:		db "localhost",0
_cstring_s_resolved_to_ii:		db "%s resolved to %i.%i.%i.%i:%i",0ah,0
_cstring_04x:		db "%04x",0
_cstring_exe_err_invalid_:		db "EXE_ERR_INVALID_CD_KEY",0
_cstring_selectstringtabl:		db "selectStringTableEntryInDvar mp/didyouknow.csv 0 didyouknow",0
_cstring_platform_notsign:		db "PLATFORM_NOTSIGNEDINTOPROFILE",0
_cstring_bad_server_addre:		db "Bad server address",0ah,0
_cstring_usage_connect_se:		db "usage: connect [server]",0ah,0
_cstring_null:		db 0
_cstring_muteplayer_i:		db "muteplayer %i",0
_cstring_unmuteplayer_i:		db "unmuteplayer %i",0
_cstring_download_failure:		db 015h,"Download failure while getting ",27h,"%s",27h,0ah,0
_cstring_wwwdl_fail:		db "wwwdl fail",0
_cstring_motdtxt:		db "motd.txt",0
_cstring_motd:		db "motd",0
_cstring_reconnect1:		db "reconnect",0ah,0
_cstring_wwwdl_done:		db "wwwdl done",0
_cstring_getstatus:		db "getstatus",0
_cstring_clients:		db "clients",0
_cstring_hostname:		db "hostname",0
_cstring_mapname:		db "mapname",0
_cstring_sv_maxclients:		db "sv_maxclients",0
_cstring_game:		db "game",0
_cstring_gametype:		db "gametype",0
_cstring_nettype:		db "nettype",0
_cstring_minping:		db "minping",0
_cstring_maxping:		db "maxping",0
_cstring_sv_allowanonymou:		db "sv_allowAnonymous",0
_cstring_con_disabled:		db "con_disabled",0
_cstring_pswrd:		db "pswrd",0
_cstring_pure:		db "pure",0
_cstring_ff:		db "ff",0
_cstring_kc:		db "kc",0
_cstring_hc:		db "hc",0
_cstring_od:		db "od",0
_cstring_hw:		db "hw",0
_cstring_mod:		db "mod",0
_cstring_voice:		db "voice",0
_cstring_pb:		db "pb",0
_cstring_not_connected_to:		db "Not connected to a server.",0ah,0
_cstring_usage_serverstat:		db "Usage: serverstatus [server]",0ah,0
_cstring_requesting_serve:		db "Requesting servers from the master...",0ah,0
_cstring_cod4masteractivi:		db "cod4master.activision.com",0
_cstring_getservers_s:		db "getservers %s",0
_cstring__s:		db " %s",0
_cstring_fs_restrict:		db "fs_restrict",0
_cstring_usage_globalserv:		db "usage: globalservers <master# 0-1> <protocol> [keywords]",0ah,0
_cstring_protocol:		db "protocol",0
_cstring_debug_protocol:		db "debug_protocol",0
_cstring_different_protoc:		db "Different protocol info packet: %s",0ah,0
_cstring_s_s:		db "%s: %s",0
_cstring_max_other_server:		db "MAX_OTHER_SERVERS hit, dropping infoResponse",0ah,0
_cstring_s:		db "%s",0
_cstring_:		db 5ch,0
_cstring_server_settings:		db "Server settings:",0ah,0
_cstring_s1:		db "%s",0ah,0
_cstring_24s:		db "%-24s",0
_cstring_s2:		db 5ch,"%s",0
_cstring_d_d:		db "%d %d",0
_cstring_2d___3d____3d___:		db "%-2d   %-3d    %-3d   %s",0ah,0
_cstring_unknown:		db "unknown",0
_cstring_players:		db 0ah,"Players:",0ah,0
_cstring_num_score_ping_n:		db "num: score: ping: name:",0ah,0
_cstring_cl_serversrespon:		db "CL_ServersResponsePacket",0ah,0
_cstring_server_d_ip_dddd:		db "server: %d ip: %d.%d.%d.%d:%d",0ah,0
_cstring_d_servers_parsed:		db "%d servers parsed (total unique %d, total seen %d)",0ah,0
_cstring_usage_ping_serve:		db "usage: ping [server]",0ah,0
_cstring_getinfo_xxx:		db "getinfo xxx",0
_cstring_login:		db "login",0
_cstring_usage_rcon_login:		db "USAGE: rcon login <password>",0ah,0
_cstring_logout:		db "logout",0
_cstring_rcon_password_mu:		db "rcon password must be %i characters or less",0ah,0
_cstring_host:		db "host",0
_cstring_you_need_to_log_:		db "You need to log in with ",27h,"rcon login <password>",27h," before using rcon.",0ah,0
_cstring_usage_rcon_comma:		db "USAGE: rcon <command> <options...>",0ah,0
_cstring_not_logged_in:		db "Not logged in",0ah,0
_cstring_usage_rcon_host_:		db "USAGE: rcon host <address>",0ah,0
_cstring_rcon_:		db "rcon ",0
_cstring_space:		db " ",0
_cstring_bad_host_address:		db "bad host address",0ah,0
_cstring_rcon_commands_ar:		db "rcon commands are limited to %i characters",0ah,0
_cstring_cant_determine_r:		db "Can",27h,"t determine rcon target.  You can fix this by either:",0ah,0
_cstring_1_joining_the_se:		db "1) Joining the server as a player.",0ah,0
_cstring_2_setting_the_ho:		db "2) Setting the host server with ",27h,"rcon host <address>",27h,".",0ah,0



;All constant floats and doubles:
SECTION .rdata

