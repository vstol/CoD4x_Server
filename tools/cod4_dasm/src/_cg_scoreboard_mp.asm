;Imports of cg_scoreboard_mp:
	extern scrPlaceView
	extern UI_TextWidth
	extern UI_TextHeight
	extern UI_DrawText
	extern cgArray
	extern UI_GetFontHandle
	extern Cvar_VariableString
	extern Material_RegisterHandle
	extern Material_IsDefault
	extern UI_DrawHandlePic
	extern va
	extern CG_TeamColor
	extern SEH_LocalizeTextMessage
	extern CL_GetRankData
	extern colorWhite
	extern CL_IsPlayerMuted
	extern Cvar_GetUnpackedColorByName
	extern Cvar_VariableIntegerValue
	extern Cvar_GetUnpackedColor
	extern CL_IsPlayerTalking
	extern UI_SafeTranslateString
	extern CL_AddReliableCommand
	extern cg_paused
	extern CL_GetServerIPAddress
	extern Q_stricmp
	extern cgsArray
	extern CG_FadeColor
	extern Cvar_RegisterInt
	extern Cvar_RegisterColor
	extern Cvar_RegisterFloat
	extern Cvar_RegisterBool

;Exports of cg_scoreboard_mp:
	global columnInfo
	global columnInfoWithPing
	global DrawListString
	global CG_DrawTeamOfClientScore
	global CG_DrawScoreboard_ListColumnHeaders
	global UpdateScores
	global CG_DrawScoreboard
	global CG_IsIntermission
	global UI_GetScoreAtRank
	global UI_GetOurClientScore
	global Scoreboard_HandleInput
	global CG_IsScoreboardDisplayed
	global CG_GetGametypeDescription
	global CG_RegisterScoreboardDvars
	global CG_RegisterScoreboardGraphics
	global CG_DrawScoreboard_GetTeamColorIndex
	global cg_ScoresPing_BgColor
	global cg_ScoresPing_HighColor
	global cg_ScoresPing_Interval
	global cg_ScoresPing_LowColor
	global cg_ScoresPing_MaxBars
	global cg_ScoresPing_MedColor
	global cg_scoreboardBannerHeight
	global cg_scoreboardFont
	global cg_scoreboardHeaderFontScale
	global cg_scoreboardHeight
	global cg_scoreboardItemHeight
	global cg_scoreboardMyColor
	global cg_scoreboardPingGraph
	global cg_scoreboardPingHeight
	global cg_scoreboardPingText
	global cg_scoreboardPingWidth
	global cg_scoreboardRankFontScale
	global cg_scoreboardScrollStep
	global cg_scoreboardTextOffset
	global cg_scoreboardWidth


SECTION .text


;DrawListString(int, char const*, float, float, float, int, Font_s*, float, int, float const*)
DrawListString:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x7c
	mov edi, eax
	mov ebx, edx
	movss [ebp-0x20], xmm0
	movss [ebp-0x24], xmm1
	movss [ebp-0x28], xmm2
	mov [ebp-0x2c], ecx
	mov esi, [ebp+0x8]
	movss [ebp-0x30], xmm3
	test edx, edx
	jz DrawListString_10
	shl eax, 0x6
	lea edi, [eax+edi*4]
	add edi, scrPlaceView
	movss xmm0, dword [ebp-0x30]
	jmp DrawListString_20
DrawListString_30:
	movss xmm0, dword [ebp-0x30]
	subss xmm0, [_float_0_02500000]
	movss [ebp-0x30], xmm0
DrawListString_20:
	movss [esp+0xc], xmm0
	mov [esp+0x8], esi
	mov dword [esp+0x4], 0x7fffffff
	mov [esp], ebx
	call UI_TextWidth
	cvtsi2ss xmm0, eax
	ucomiss xmm0, [ebp-0x28]
	ja DrawListString_30
	movss xmm0, dword [_float_0_20000000]
	ucomiss xmm0, [ebp-0x30]
	mov eax, 0x0
	cmovbe eax, [ebp+0xc]
	mov [ebp+0xc], eax
	movss xmm0, dword [ebp-0x30]
	movss [esp+0xc], xmm0
	mov [esp+0x8], esi
	mov dword [esp+0x4], 0x7fffffff
	mov [esp], ebx
	call UI_TextWidth
	cvtsi2ss xmm2, eax
	cmp dword [ebp-0x2c], 0x1
	jz DrawListString_40
	cmp dword [ebp-0x2c], 0x2
	jz DrawListString_50
	pxor xmm2, xmm2
DrawListString_60:
	mov eax, [cg_scoreboardTextOffset]
	movss xmm1, dword [eax+0xc]
	mov eax, [cg_scoreboardItemHeight]
	cvtsi2ss xmm0, dword [eax+0xc]
	movss [ebp-0x1c], xmm0
	movss xmm0, dword [ebp-0x30]
	movss [esp+0x4], xmm0
	mov [esp], esi
	movss [ebp-0x48], xmm1
	movss [ebp-0x58], xmm2
	call UI_TextHeight
	mov edx, [ebp+0xc]
	mov [esp+0x28], edx
	mov edx, [ebp+0x10]
	mov [esp+0x24], edx
	movss xmm0, dword [ebp-0x30]
	movss [esp+0x20], xmm0
	mov dword [esp+0x1c], 0x0
	mov dword [esp+0x18], 0x1
	cvtsi2ss xmm0, eax
	addss xmm0, [ebp-0x1c]
	movss xmm1, dword [ebp-0x48]
	mulss xmm1, xmm0
	addss xmm1, [ebp-0x24]
	movss [esp+0x14], xmm1
	movss xmm2, dword [ebp-0x58]
	addss xmm2, [ebp-0x20]
	movss [esp+0x10], xmm2
	mov [esp+0xc], esi
	mov dword [esp+0x8], 0x7fffffff
	mov [esp+0x4], ebx
	mov [esp], edi
	call UI_DrawText
DrawListString_10:
	add esp, 0x7c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
DrawListString_40:
	movss xmm0, dword [ebp-0x28]
	subss xmm0, xmm2
	movaps xmm2, xmm0
	mulss xmm2, [_float_0_50000000]
	jmp DrawListString_60
DrawListString_50:
	movss xmm0, dword [ebp-0x28]
	subss xmm0, xmm2
	movaps xmm2, xmm0
	subss xmm2, [_float_4_00000000]
	jmp DrawListString_60
	nop


;CG_DrawTeamOfClientScore(int, float const*, float, int, float, int*)
CG_DrawTeamOfClientScore:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x13c
	mov [ebp-0xe8], eax
	mov [ebp-0xec], edx
	movss [ebp-0xf0], xmm0
	mov [ebp-0xf4], ecx
	movss [ebp-0xf8], xmm1
	mov eax, [cg_scoreboardBannerHeight]
	cvtsi2ss xmm0, dword [eax+0xc]
	movss [ebp-0xe4], xmm0
	mov ebx, cgArray
	mov edx, [ebx+0x502ec]
	test edx, edx
	jnz CG_DrawTeamOfClientScore_10
	mov eax, [ebp+0x8]
	mov edx, [eax]
	cmp edx, [ebx+0x502e8]
	jl CG_DrawTeamOfClientScore_20
	movss xmm0, dword [ebp-0xe4]
	addss xmm0, [ebp-0xf0]
	movss [ebp-0xd0], xmm0
	mov eax, [cg_scoreboardHeight]
	movss xmm3, dword [eax+0xc]
	movss xmm0, dword [_float_480_00000000]
	subss xmm0, xmm3
	mulss xmm0, [_float_0_50000000]
	pxor xmm1, xmm1
	movaps xmm2, xmm1
	subss xmm2, xmm0
	movaps xmm4, xmm1
	cmpss xmm4, xmm2, 0x6
	andps xmm0, xmm4
	orps xmm0, xmm1
	addss xmm0, xmm3
	subss xmm0, [_float_3_00000000]
	subss xmm0, [_float_2_00000000]
	subss xmm0, [_float_14_00000000]
	subss xmm0, [_float_1_00000000]
	movss xmm5, dword [ebp-0xd0]
	ucomiss xmm5, xmm0
	ja CG_DrawTeamOfClientScore_30
	lea eax, [edx+0x1]
	mov edx, [ebp+0x8]
	mov [edx], eax
	mov eax, [ebp-0xe8]
	shl eax, 0x6
	mov ebx, [ebp-0xe8]
	lea edi, [eax+ebx*4]
	add edi, scrPlaceView
	mov dword [esp+0x8], 0x3eb33333
	mov eax, [cg_scoreboardFont]
	mov eax, [eax+0xc]
	mov [esp+0x4], eax
	mov [esp], edi
	call UI_GetFontHandle
	mov [ebp-0xd4], eax
	cmp dword [ebp-0xf4], 0x1
	jz CG_DrawTeamOfClientScore_40
	cmp dword [ebp-0xf4], 0x2
	jz CG_DrawTeamOfClientScore_50
	mov eax, [ebp-0xf4]
	test eax, eax
	jnz CG_DrawTeamOfClientScore_60
	mov dword [esp], _cstring_g_teamicon_free
	call Cvar_VariableString
	mov ebx, eax
	mov esi, _cstring_null
CG_DrawTeamOfClientScore_220:
	movss xmm2, dword [edi+0x20]
	subss xmm2, [edi+0x18]
	mov eax, [cg_scoreboardWidth]
	subss xmm2, [eax+0xc]
	mulss xmm2, [_float_0_50000000]
	pxor xmm1, xmm1
	movaps xmm0, xmm1
	subss xmm0, xmm2
	ucomiss xmm0, xmm1
	jb CG_DrawTeamOfClientScore_70
	movss xmm0, dword [_float_3_00000000]
CG_DrawTeamOfClientScore_360:
	addss xmm0, [_float_2_00000000]
	addss xmm0, [_float_4_00000000]
	movss [ebp-0xd8], xmm0
	mov dword [esp+0x4], 0x7
	mov [esp], ebx
	call Material_RegisterHandle
	mov ebx, eax
	mov [esp], eax
	call Material_IsDefault
	test al, al
	jnz CG_DrawTeamOfClientScore_80
	movss xmm2, dword [edi+0x20]
	subss xmm2, [edi+0x18]
	mov eax, [cg_scoreboardWidth]
	subss xmm2, [eax+0xc]
	mulss xmm2, [_float_0_50000000]
	pxor xmm1, xmm1
	movaps xmm0, xmm1
	subss xmm0, xmm2
	ucomiss xmm0, xmm1
	jb CG_DrawTeamOfClientScore_90
	movss xmm0, dword [_float_3_00000000]
CG_DrawTeamOfClientScore_400:
	mov [esp+0x20], ebx
	mov eax, [ebp-0xec]
	mov [esp+0x1c], eax
	mov dword [esp+0x18], 0x0
	mov dword [esp+0x14], 0x1
	movss xmm1, dword [ebp-0xe4]
	movss [esp+0x10], xmm1
	movss [esp+0xc], xmm1
	movss xmm4, dword [ebp-0xf0]
	movss [esp+0x8], xmm4
	addss xmm0, [_float_2_00000000]
	addss xmm0, [_float_4_00000000]
	movss [esp+0x4], xmm0
	mov [esp], edi
	call UI_DrawHandlePic
	movss xmm5, dword [ebp-0xe4]
	addss xmm5, [_float_8_00000000]
	movss xmm0, dword [ebp-0xd8]
	addss xmm0, xmm5
	movss [ebp-0xd8], xmm0
	movaps xmm1, xmm0
CG_DrawTeamOfClientScore_320:
	mov dword [esp+0x28], 0x3
	mov eax, [ebp-0xec]
	mov [esp+0x24], eax
	mov ebx, 0x3eb33333
	mov [esp+0x20], ebx
	mov dword [esp+0x1c], 0x0
	mov dword [esp+0x18], 0x1
	movss xmm0, dword [ebp-0xd0]
	movss [esp+0x14], xmm0
	movss [esp+0x10], xmm1
	mov eax, [ebp-0xd4]
	mov [esp+0xc], eax
	mov dword [esp+0x8], 0x7fffffff
	mov [esp+0x4], esi
	mov [esp], edi
	call UI_DrawText
	mov [esp+0xc], ebx
	mov edx, [ebp-0xd4]
	mov [esp+0x8], edx
	mov dword [esp+0x4], 0x7fffffff
	mov [esp], esi
	call UI_TextWidth
	mov [ebp-0xdc], eax
	mov esi, cgArray
	mov edx, [ebp-0xf4]
	mov eax, [esi+edx*4+0x4f8cc]
	mov [esp+0x4], eax
	mov dword [esp], _cstring__i_
	call va
	mov dword [esp+0x28], 0x3
	mov edx, [ebp-0xec]
	mov [esp+0x24], edx
	mov [esp+0x20], ebx
	mov dword [esp+0x1c], 0x0
	mov dword [esp+0x18], 0x1
	movss xmm0, dword [ebp-0xd0]
	movss [esp+0x14], xmm0
	mov edx, [ebp-0xdc]
	add edx, 0x8
	cvtsi2ss xmm0, edx
	addss xmm0, [ebp-0xd8]
	movss [esp+0x10], xmm0
	mov edx, [ebp-0xd4]
	mov [esp+0xc], edx
	mov dword [esp+0x8], 0x7fffffff
	mov [esp+0x4], eax
	mov [esp], edi
	call UI_DrawText
	movss xmm0, dword [ebp-0xd0]
	addss xmm0, [_float_4_00000000]
	movss [ebp-0xf0], xmm0
	mov ebx, esi
CG_DrawTeamOfClientScore_10:
	mov eax, [ebx+0x4f8a8]
	test eax, eax
	jle CG_DrawTeamOfClientScore_100
	lea eax, [ebx+0x4f904]
	mov [ebp-0x8c], eax
	mov dword [ebp-0xe0], 0x0
	lea edi, [ebx+0x4f8dc]
	lea edx, [ebx+0x4f8ec]
	mov [ebp-0x88], edx
	jmp CG_DrawTeamOfClientScore_110
CG_DrawTeamOfClientScore_120:
	add dword [ebp-0xe0], 0x1
	add dword [ebp-0x8c], 0x28
	add edi, 0x28
	add dword [ebp-0x88], 0x28
	mov eax, [ebp-0xe0]
	cmp [ebx+0x4f8a8], eax
	jle CG_DrawTeamOfClientScore_100
CG_DrawTeamOfClientScore_110:
	mov eax, [edi]
	lea edx, [eax+eax*8]
	mov ecx, edx
	shl ecx, 0x4
	add edx, ecx
	lea edx, [eax+edx*2]
	mov eax, [ebx+edx*4+0xe9f34]
	test eax, eax
	jz CG_DrawTeamOfClientScore_120
	mov edx, [ebp-0xf4]
	mov eax, [ebp-0x88]
	cmp edx, [eax]
	jnz CG_DrawTeamOfClientScore_120
	mov eax, [cg_scoreboardItemHeight]
	cvtsi2ss xmm4, dword [eax+0xc]
	mov eax, [ebx+0x502ec]
	test eax, eax
	jnz CG_DrawTeamOfClientScore_120
	mov eax, [ebp+0x8]
	mov edx, [eax]
	cmp edx, [ebx+0x502e8]
	jge CG_DrawTeamOfClientScore_130
	lea eax, [edx+0x1]
	mov edx, [ebp+0x8]
	mov [edx], eax
	jmp CG_DrawTeamOfClientScore_120
CG_DrawTeamOfClientScore_100:
	movss xmm0, dword [ebp-0xf0]
	add esp, 0x13c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CG_DrawTeamOfClientScore_20:
	lea eax, [edx+0x1]
	mov edx, [ebp+0x8]
	mov [edx], eax
	jmp CG_DrawTeamOfClientScore_10
CG_DrawTeamOfClientScore_130:
	addss xmm4, [ebp-0xf0]
	mov eax, [cg_scoreboardHeight]
	movss xmm3, dword [eax+0xc]
	movss xmm0, dword [_float_480_00000000]
	subss xmm0, xmm3
	mulss xmm0, [_float_0_50000000]
	pxor xmm1, xmm1
	movaps xmm2, xmm1
	subss xmm2, xmm0
	movaps xmm5, xmm1
	cmpss xmm5, xmm2, 0x6
	andps xmm0, xmm5
	orps xmm0, xmm1
	addss xmm0, xmm3
	subss xmm0, [_float_3_00000000]
	subss xmm0, [_float_2_00000000]
	subss xmm0, [_float_14_00000000]
	subss xmm0, [_float_1_00000000]
	ucomiss xmm4, xmm0
	ja CG_DrawTeamOfClientScore_140
	lea eax, [edx+0x1]
	mov edx, [ebp+0x8]
	mov [edx], eax
	lea eax, [ebp-0x28]
	mov [esp+0x8], eax
	mov dword [esp+0x4], _cstring_g_scorescolor
	mov eax, [ebp-0xf4]
	mov [esp], eax
	call CG_TeamColor
	mov edx, [ebp-0xec]
	mov eax, [edx+0xc]
	mov [ebp-0x1c], eax
	mov edx, [edi]
	lea eax, [edx+edx*8]
	mov ecx, eax
	shl ecx, 0x4
	add eax, ecx
	lea eax, [edx+eax*2]
	lea eax, [ebx+eax*4+0xe9f30]
	lea ebx, [eax+0x4]
	mov [ebp-0xbc], ebx
	mov eax, [eax+0x4]
	test eax, eax
	jz CG_DrawTeamOfClientScore_150
	mov eax, [ebp-0xe8]
	shl eax, 0x6
	mov edx, [ebp-0xe8]
	lea eax, [eax+edx*4]
	mov ebx, scrPlaceView
	add eax, ebx
	mov [ebp-0xb0], eax
	mov eax, [cg_scoreboardPingText]
	cmp byte [eax+0xc], 0x0
	jz CG_DrawTeamOfClientScore_160
	mov esi, columnInfoWithPing
	mov dword [ebp-0xb4], 0x9
CG_DrawTeamOfClientScore_230:
	mov eax, [ebp-0xb0]
	movss xmm2, dword [eax+0x20]
	subss xmm2, [eax+0x18]
	mov eax, [cg_scoreboardWidth]
	subss xmm2, [eax+0xc]
	mulss xmm2, [_float_0_50000000]
	pxor xmm1, xmm1
	movaps xmm0, xmm1
	subss xmm0, xmm2
	ucomiss xmm0, xmm1
	jb CG_DrawTeamOfClientScore_170
	movss xmm1, dword [_float_3_00000000]
CG_DrawTeamOfClientScore_420:
	mov eax, [cg_scoreboardItemHeight]
	cvtsi2ss xmm0, dword [eax+0xc]
	movss [ebp-0xcc], xmm0
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_white
	movss [ebp-0x108], xmm1
	call Material_RegisterHandle
	mov edx, [ebp-0x28]
	mov [ebp-0x38], edx
	mov edx, [ebp-0x24]
	mov [ebp-0x34], edx
	mov edx, [ebp-0x20]
	mov [ebp-0x30], edx
	movss xmm0, dword [ebp-0x1c]
	mulss xmm0, [_float_0_50000000]
	movss [ebp-0x2c], xmm0
	mov [esp+0x20], eax
	lea eax, [ebp-0x38]
	mov [esp+0x1c], eax
	mov dword [esp+0x18], 0x0
	mov dword [esp+0x14], 0x1
	movss xmm0, dword [ebp-0xcc]
	movss [esp+0x10], xmm0
	movss xmm4, dword [ebp-0xf8]
	movss [esp+0xc], xmm4
	movss xmm5, dword [ebp-0xf0]
	movss [esp+0x8], xmm5
	movss xmm1, dword [ebp-0x108]
	addss xmm1, [_float_2_00000000]
	addss xmm1, [_float_4_00000000]
	movss [esp+0x4], xmm1
	mov eax, [ebp-0xb0]
	mov [esp], eax
	call UI_DrawHandlePic
	mov dword [esp+0x8], 0x3eb33333
	mov eax, [cg_scoreboardFont]
	mov eax, [eax+0xc]
	mov [esp+0x4], eax
	mov edx, [ebp-0xb0]
	mov [esp], edx
	call UI_GetFontHandle
	mov [ebp-0xb8], eax
	mov ebx, [ebp-0xb0]
	movss xmm2, dword [ebx+0x20]
	subss xmm2, [ebx+0x18]
	mov eax, [cg_scoreboardWidth]
	subss xmm2, [eax+0xc]
	mulss xmm2, [_float_0_50000000]
	pxor xmm1, xmm1
	movaps xmm0, xmm1
	subss xmm0, xmm2
	ucomiss xmm0, xmm1
	jb CG_DrawTeamOfClientScore_180
	movss xmm0, dword [_float_3_00000000]
CG_DrawTeamOfClientScore_410:
	addss xmm0, [_float_2_00000000]
	addss xmm0, [_float_4_00000000]
	movss [ebp-0x7c], xmm0
	mov ebx, cgArray
	mov eax, [edi]
	cmp eax, [ebx]
	jz CG_DrawTeamOfClientScore_190
	mov eax, 0x3f800000
	mov [ebp-0x48], eax
	mov [ebp-0x44], eax
	mov [ebp-0x40], eax
CG_DrawTeamOfClientScore_430:
	mov eax, [ebp-0x1c]
	mov [ebp-0x3c], eax
	mov eax, [ebp-0xb4]
	test eax, eax
	jle CG_DrawTeamOfClientScore_200
	mov [ebp-0x90], esi
	mov dword [ebp-0xc0], 0x0
	mov eax, esi
CG_DrawTeamOfClientScore_240:
	movss xmm0, dword [ebp-0xf8]
	mulss xmm0, [eax+0x4]
	movss [ebp-0xac], xmm0
	cmp dword [eax], 0x9
	ja CG_DrawTeamOfClientScore_210
	mov eax, [eax]
	jmp dword [eax*4+CG_DrawTeamOfClientScore_jumptab_0]
CG_DrawTeamOfClientScore_30:
	mov dword [ebx+0x502ec], 0x1
	jmp CG_DrawTeamOfClientScore_10
CG_DrawTeamOfClientScore_140:
	mov dword [ebx+0x502ec], 0x1
	jmp CG_DrawTeamOfClientScore_120
CG_DrawTeamOfClientScore_150:
	movss xmm1, dword [ebp-0xf0]
CG_DrawTeamOfClientScore_340:
	addss xmm1, [_float_4_00000000]
	movss [ebp-0xf0], xmm1
	mov ebx, cgArray
	jmp CG_DrawTeamOfClientScore_120
CG_DrawTeamOfClientScore_60:
	mov dword [esp], _cstring_g_teamicon_spect
	call Cvar_VariableString
	mov ebx, eax
	mov dword [esp+0x8], 0x0
	mov dword [esp+0x4], _cstring_scoreboard_team_
	mov dword [esp], _cstring_cgame_spectators
CG_DrawTeamOfClientScore_350:
	call SEH_LocalizeTextMessage
	mov [esp+0x4], eax
	mov dword [esp], _cstring_s
	call va
	mov esi, eax
	jmp CG_DrawTeamOfClientScore_220
CG_DrawTeamOfClientScore_160:
	mov esi, columnInfo
	mov dword [ebp-0xb4], 0x8
	jmp CG_DrawTeamOfClientScore_230
CG_DrawTeamOfClientScore_560:
	mov ebx, [ebp-0x88]
	cmp dword [ebx], 0x3
	jz CG_DrawTeamOfClientScore_210
	mov edx, [ebp-0x8c]
	mov eax, [edx-0xc]
CG_DrawTeamOfClientScore_250:
	mov [esp+0x4], eax
	mov dword [esp], _cstring_i
	call va
	mov ebx, [ebp-0x90]
	mov ecx, [ebx+0xc]
	lea edx, [ebp-0x48]
	mov [esp+0x8], edx
	mov dword [esp+0x4], 0x3
	mov edx, [ebp-0xb8]
	mov [esp], edx
CG_DrawTeamOfClientScore_280:
	movss xmm3, dword [_float_0_34999999]
	movss xmm2, dword [ebp-0xac]
	movss xmm1, dword [ebp-0xf0]
	movss xmm0, dword [ebp-0x7c]
	mov edx, eax
	mov eax, [ebp-0xe8]
	call DrawListString
CG_DrawTeamOfClientScore_210:
	movss xmm0, dword [ebp-0x7c]
	addss xmm0, [ebp-0xac]
	movss [ebp-0x7c], xmm0
	add dword [ebp-0xc0], 0x1
	add dword [ebp-0x90], 0x10
	mov eax, [ebp-0xb4]
	cmp [ebp-0xc0], eax
	jz CG_DrawTeamOfClientScore_200
	mov eax, [ebp-0x90]
	jmp CG_DrawTeamOfClientScore_240
CG_DrawTeamOfClientScore_540:
	mov ebx, [ebp-0x88]
	cmp dword [ebx], 0x3
	jz CG_DrawTeamOfClientScore_210
	mov edx, [ebp-0x8c]
	mov eax, [edx-0x14]
	jmp CG_DrawTeamOfClientScore_250
CG_DrawTeamOfClientScore_550:
	mov edx, [ebp-0x8c]
	lea ecx, [edx-0x4]
	mov ebx, [edx-0x4]
	test ebx, ebx
	jz CG_DrawTeamOfClientScore_210
	mov edx, [cg_scoreboardItemHeight]
	cvtsi2ss xmm0, dword [edx+0xc]
	mov esi, [ebp-0x90]
	add esi, 0xc
	mov ebx, [ebp-0x90]
	mov eax, [ebx+0xc]
	cmp eax, 0x1
	jz CG_DrawTeamOfClientScore_260
	pxor xmm1, xmm1
	cmp eax, 0x2
	jz CG_DrawTeamOfClientScore_270
CG_DrawTeamOfClientScore_470:
	mov eax, 0x3f800000
	mov [ebp-0x38], eax
	mov [ebp-0x34], eax
	mov [ebp-0x30], eax
	mov eax, [ebp-0x1c]
	mov [ebp-0x2c], eax
	cvtsi2ss xmm0, dword [edx+0xc]
	addss xmm1, [ebp-0x7c]
	movss [ebp-0xc8], xmm1
	mov eax, [ecx]
	mov [esp+0x20], eax
	lea eax, [ebp-0x38]
	mov [esp+0x1c], eax
	mov dword [esp+0x18], 0x0
	mov dword [esp+0x14], 0x1
	movss [esp+0x10], xmm0
	movss [esp+0xc], xmm0
	movss xmm0, dword [ebp-0xf0]
	movss [esp+0x8], xmm0
	movss [esp+0x4], xmm1
	mov eax, [ebp-0xb0]
	mov [esp], eax
	call UI_DrawHandlePic
	mov dword [esp+0x4], 0xe
	mov edx, [ebp-0x8c]
	mov eax, [edx-0x10]
	mov [esp], eax
	call CL_GetRankData
	mov ebx, eax
	mov esi, [esi]
	mov eax, [cg_scoreboardRankFontScale]
	movss xmm0, dword [eax+0xc]
	movss [ebp-0xc4], xmm0
	movss [esp+0x4], xmm0
	mov eax, [ebp-0xb8]
	mov [esp], eax
	call UI_TextHeight
	cvtsi2ss xmm0, eax
	mulss xmm0, [_float_0_25000000]
	mov eax, [cg_scoreboardItemHeight]
	cvtsi2ss xmm4, dword [eax+0xc]
	mov eax, colorWhite
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x3
	mov edx, [ebp-0xb8]
	mov [esp], edx
	movss xmm3, dword [ebp-0xc4]
	mov ecx, esi
	movss xmm2, dword [ebp-0xac]
	movss xmm1, dword [ebp-0xf0]
	addss xmm1, xmm0
	movss xmm0, dword [ebp-0xc8]
	addss xmm0, xmm4
	mov edx, ebx
	mov eax, [ebp-0xe8]
	call DrawListString
	jmp CG_DrawTeamOfClientScore_210
CG_DrawTeamOfClientScore_480:
	mov edx, [ebp-0x90]
	mov ecx, [edx+0xc]
	mov edx, [ebp-0xbc]
	add edx, 0xc
	lea eax, [ebp-0x48]
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x3
	mov ebx, [ebp-0xb8]
	mov [esp], ebx
	movss xmm3, dword [_float_0_34999999]
	movss xmm2, dword [ebp-0xac]
	movss xmm1, dword [ebp-0xf0]
	movss xmm0, dword [ebp-0x7c]
	mov eax, [ebp-0xe8]
	call DrawListString
	jmp CG_DrawTeamOfClientScore_210
CG_DrawTeamOfClientScore_490:
	mov eax, [ebp-0x88]
	cmp dword [eax], 0x3
	jz CG_DrawTeamOfClientScore_210
	mov edx, [ebp-0x8c]
	mov eax, [edx-0x24]
	jmp CG_DrawTeamOfClientScore_250
CG_DrawTeamOfClientScore_500:
	mov ebx, [ebp-0x88]
	cmp dword [ebx], 0x3
	jz CG_DrawTeamOfClientScore_210
	mov edx, [ebp-0x8c]
	mov eax, [edx-0x1c]
	jmp CG_DrawTeamOfClientScore_250
CG_DrawTeamOfClientScore_510:
	mov ebx, [ebp-0x8c]
	mov eax, [ebx-0x20]
	mov [esp+0x4], eax
	mov dword [esp], _cstring_i
	call va
	mov edx, [ebp-0x90]
	mov ecx, [edx+0xc]
	lea edx, [ebp-0x48]
	mov [esp+0x8], edx
	mov dword [esp+0x4], 0x3
	mov ebx, [ebp-0xb8]
	mov [esp], ebx
	jmp CG_DrawTeamOfClientScore_280
CG_DrawTeamOfClientScore_520:
	mov ebx, [ebp-0x8c]
	lea ecx, [ebx-0x8]
	mov esi, [ebx-0x8]
	test esi, esi
	jz CG_DrawTeamOfClientScore_210
	mov edx, [cg_scoreboardItemHeight]
	cvtsi2ss xmm0, dword [edx+0xc]
	mov ebx, [ebp-0x90]
	mov eax, [ebx+0xc]
	cmp eax, 0x1
	jz CG_DrawTeamOfClientScore_290
	pxor xmm1, xmm1
	cmp eax, 0x2
	jz CG_DrawTeamOfClientScore_300
CG_DrawTeamOfClientScore_460:
	mov eax, 0x3f800000
	mov [ebp-0x38], eax
	mov [ebp-0x34], eax
	mov [ebp-0x30], eax
	mov eax, [ebp-0x1c]
	mov [ebp-0x2c], eax
	cvtsi2ss xmm0, dword [edx+0xc]
	mov eax, [ecx]
	mov [esp+0x20], eax
	lea eax, [ebp-0x38]
	mov [esp+0x1c], eax
	mov dword [esp+0x18], 0x0
	mov dword [esp+0x14], 0x1
	movss [esp+0x10], xmm0
	movss [esp+0xc], xmm0
	movss xmm0, dword [ebp-0xf0]
	movss [esp+0x8], xmm0
	addss xmm1, [ebp-0x7c]
	movss [esp+0x4], xmm1
	mov eax, [ebp-0xb0]
	mov [esp], eax
	call UI_DrawHandlePic
	jmp CG_DrawTeamOfClientScore_210
CG_DrawTeamOfClientScore_530:
	mov eax, [edi]
	mov [esp+0x4], eax
	mov ebx, [ebp-0xe8]
	mov [esp], ebx
	call CL_IsPlayerMuted
	test al, al
	jz CG_DrawTeamOfClientScore_310
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_voice_off
	call Material_RegisterHandle
	mov edx, eax
CG_DrawTeamOfClientScore_450:
	test edx, edx
	jz CG_DrawTeamOfClientScore_210
	mov eax, 0x3f800000
	mov [ebp-0x38], eax
	mov [ebp-0x34], eax
	mov [ebp-0x30], eax
	mov eax, [ebp-0x1c]
	mov [ebp-0x2c], eax
	mov eax, [cg_scoreboardItemHeight]
	cvtsi2ss xmm0, dword [eax+0xc]
	mov [esp+0x20], edx
	lea edx, [ebp-0x38]
	mov [esp+0x1c], edx
	mov dword [esp+0x18], 0x0
	mov dword [esp+0x14], 0x1
	movss [esp+0x10], xmm0
	movss [esp+0xc], xmm0
	movss xmm0, dword [ebp-0xf0]
	movss [esp+0x8], xmm0
	movss xmm1, dword [ebp-0x7c]
	movss [esp+0x4], xmm1
	mov eax, [ebp-0xb0]
	mov [esp], eax
	call UI_DrawHandlePic
	jmp CG_DrawTeamOfClientScore_210
CG_DrawTeamOfClientScore_80:
	movss xmm1, dword [ebp-0xd8]
	jmp CG_DrawTeamOfClientScore_320
CG_DrawTeamOfClientScore_200:
	mov eax, [cg_scoreboardPingGraph]
	cmp byte [eax+0xc], 0x0
	jnz CG_DrawTeamOfClientScore_330
CG_DrawTeamOfClientScore_380:
	mov eax, [cg_scoreboardItemHeight]
	cvtsi2ss xmm0, dword [eax+0xc]
	addss xmm0, [ebp-0xf0]
	movss [ebp-0xf0], xmm0
	movaps xmm1, xmm0
	jmp CG_DrawTeamOfClientScore_340
CG_DrawTeamOfClientScore_40:
	mov dword [esp], _cstring_g_teamicon_axis
	call Cvar_VariableString
	mov ebx, eax
	mov dword [esp], _cstring_g_teamname_axis
	call Cvar_VariableString
	mov dword [esp+0x8], 0x0
	mov dword [esp+0x4], _cstring_scoreboard_team_
	mov [esp], eax
	jmp CG_DrawTeamOfClientScore_350
CG_DrawTeamOfClientScore_70:
	movaps xmm0, xmm2
	addss xmm0, [_float_3_00000000]
	jmp CG_DrawTeamOfClientScore_360
CG_DrawTeamOfClientScore_50:
	mov dword [esp], _cstring_g_teamicon_allie
	call Cvar_VariableString
	mov ebx, eax
	mov dword [esp], _cstring_g_teamname_allie
	call Cvar_VariableString
	mov dword [esp+0x8], 0x0
	mov dword [esp+0x4], _cstring_scoreboard_team_
	mov [esp], eax
	jmp CG_DrawTeamOfClientScore_350
CG_DrawTeamOfClientScore_330:
	mov eax, [cg_scoreboardItemHeight]
	cvtsi2ss xmm0, dword [eax+0xc]
	movss [ebp-0x84], xmm0
	mov eax, [cg_scoreboardPingWidth]
	movss xmm1, dword [ebp-0xf8]
	mulss xmm1, [eax+0xc]
	movss [ebp-0xa8], xmm1
	mov eax, [ebp-0x8c]
	mov esi, [eax-0x20]
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_white
	call Material_RegisterHandle
	mov ebx, eax
	lea edx, [ebp-0x78]
	mov [esp+0x4], edx
	mov dword [esp], _cstring_cg_scoresping_bg
	call Cvar_GetUnpackedColorByName
	movss xmm0, dword [ebp-0x7c]
	addss xmm0, [_float_8_00000000]
	movss [ebp-0xa4], xmm0
	mov [esp+0x20], ebx
	lea eax, [ebp-0x78]
	mov [esp+0x1c], eax
	mov dword [esp+0x18], 0x0
	mov dword [esp+0x14], 0x1
	movss xmm0, dword [ebp-0x84]
	movss [esp+0x10], xmm0
	movss xmm0, dword [ebp-0xa8]
	addss xmm0, [_float_2_00000000]
	movss [esp+0xc], xmm0
	movss xmm1, dword [ebp-0xf0]
	movss [esp+0x8], xmm1
	movss xmm0, dword [ebp-0xa4]
	subss xmm0, [_float_1_00000000]
	movss [esp+0x4], xmm0
	mov eax, [ebp-0xb0]
	mov [esp], eax
	call UI_DrawHandlePic
	mov dword [esp], _cstring_cg_scoresping_ma
	call Cvar_VariableIntegerValue
	mov [ebp-0x9c], eax
	mov dword [esp], _cstring_cg_scoresping_in
	call Cvar_VariableIntegerValue
	mov ebx, eax
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_white
	call Material_RegisterHandle
	mov [ebp-0x80], eax
	mov eax, esi
	cdq
	idiv ebx
	mov edx, [ebp-0x9c]
	sub edx, eax
	mov esi, edx
	test edx, edx
	mov eax, 0x1
	cmovle esi, eax
	mov eax, [ebp-0x9c]
	shr eax, 0x1f
	mov edx, [ebp-0x9c]
	lea ebx, [eax+edx]
	sar ebx, 1
	cmp esi, ebx
	jge CG_DrawTeamOfClientScore_370
	lea eax, [ebp-0x58]
	mov [esp+0x4], eax
	mov dword [esp], _cstring_cg_scoresping_hi
	call Cvar_GetUnpackedColorByName
	lea eax, [ebp-0x68]
	mov [esp+0x4], eax
	mov dword [esp], _cstring_cg_scoresping_me
	call Cvar_GetUnpackedColorByName
	cvtsi2ss xmm2, esi
	cvtsi2ss xmm0, ebx
	divss xmm2, xmm0
CG_DrawTeamOfClientScore_440:
	movss xmm1, dword [ebp-0x58]
	movss xmm0, dword [ebp-0x68]
	subss xmm0, xmm1
	mulss xmm0, xmm2
	addss xmm1, xmm0
	movss [ebp-0x78], xmm1
	movss xmm1, dword [ebp-0x54]
	movss xmm0, dword [ebp-0x64]
	subss xmm0, xmm1
	mulss xmm0, xmm2
	addss xmm1, xmm0
	movss [ebp-0x74], xmm1
	movss xmm1, dword [ebp-0x50]
	movss xmm0, dword [ebp-0x60]
	subss xmm0, xmm1
	mulss xmm0, xmm2
	addss xmm1, xmm0
	movss [ebp-0x70], xmm1
	movss xmm1, dword [ebp-0x4c]
	movss xmm0, dword [ebp-0x5c]
	subss xmm0, xmm1
	mulss xmm2, xmm0
	addss xmm1, xmm2
	movss [ebp-0x6c], xmm1
	cvtsi2ss xmm0, dword [ebp-0x9c]
	movss [ebp-0xa0], xmm0
	movss xmm2, dword [ebp-0xa8]
	divss xmm2, xmm0
	movss xmm0, dword [_float_1_00000000]
	subss xmm2, xmm0
	movaps xmm1, xmm0
	maxss xmm1, xmm2
	movaps xmm2, xmm1
	test esi, esi
	jle CG_DrawTeamOfClientScore_380
	movss xmm4, dword [ebp-0x84]
	addss xmm4, [ebp-0xf0]
	movss [ebp-0x98], xmm4
	addss xmm0, xmm1
	movss [ebp-0x94], xmm0
	mov ebx, 0x1
CG_DrawTeamOfClientScore_390:
	mov eax, [cg_scoreboardPingHeight]
	movss xmm1, dword [ebp-0x84]
	mulss xmm1, [eax+0xc]
	cvtsi2ss xmm0, ebx
	mulss xmm1, xmm0
	divss xmm1, dword [ebp-0xa0]
	mov eax, [ebp-0x80]
	mov [esp+0x20], eax
	lea edx, [ebp-0x78]
	mov [esp+0x1c], edx
	mov dword [esp+0x18], 0x0
	mov dword [esp+0x14], 0x1
	movss [esp+0x10], xmm1
	movss [esp+0xc], xmm2
	movss xmm0, dword [ebp-0x98]
	subss xmm0, xmm1
	movss [esp+0x8], xmm0
	movss xmm0, dword [ebp-0xa4]
	movss [esp+0x4], xmm0
	mov eax, [ebp-0xb0]
	mov [esp], eax
	movss [ebp-0x118], xmm2
	call UI_DrawHandlePic
	movss xmm0, dword [ebp-0xa4]
	addss xmm0, [ebp-0x94]
	movss [ebp-0xa4], xmm0
	add ebx, 0x1
	cmp esi, ebx
	movss xmm2, dword [ebp-0x118]
	jge CG_DrawTeamOfClientScore_390
	jmp CG_DrawTeamOfClientScore_380
CG_DrawTeamOfClientScore_90:
	movaps xmm0, xmm2
	addss xmm0, [_float_3_00000000]
	jmp CG_DrawTeamOfClientScore_400
CG_DrawTeamOfClientScore_180:
	movaps xmm0, xmm2
	addss xmm0, [_float_3_00000000]
	jmp CG_DrawTeamOfClientScore_410
CG_DrawTeamOfClientScore_170:
	movaps xmm1, xmm2
	addss xmm1, [_float_3_00000000]
	jmp CG_DrawTeamOfClientScore_420
CG_DrawTeamOfClientScore_190:
	lea eax, [ebp-0x48]
	mov [esp+0x4], eax
	mov eax, [cg_scoreboardMyColor]
	mov [esp], eax
	call Cvar_GetUnpackedColor
	jmp CG_DrawTeamOfClientScore_430
CG_DrawTeamOfClientScore_370:
	lea eax, [ebp-0x58]
	mov [esp+0x4], eax
	mov dword [esp], _cstring_cg_scoresping_me
	call Cvar_GetUnpackedColorByName
	lea eax, [ebp-0x68]
	mov [esp+0x4], eax
	mov dword [esp], _cstring_cg_scoresping_lo
	call Cvar_GetUnpackedColorByName
	mov eax, esi
	sub eax, ebx
	cvtsi2ss xmm2, eax
	cvtsi2ss xmm0, ebx
	divss xmm2, xmm0
	jmp CG_DrawTeamOfClientScore_440
CG_DrawTeamOfClientScore_310:
	mov eax, [edi]
	mov [esp+0x4], eax
	mov eax, [ebp-0xe8]
	mov [esp], eax
	call CL_IsPlayerTalking
	test al, al
	jz CG_DrawTeamOfClientScore_210
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_voice_on
	call Material_RegisterHandle
	mov edx, eax
	jmp CG_DrawTeamOfClientScore_450
CG_DrawTeamOfClientScore_290:
	movss xmm1, dword [ebp-0xac]
	subss xmm1, xmm0
	mulss xmm1, [_float_0_50000000]
	jmp CG_DrawTeamOfClientScore_460
CG_DrawTeamOfClientScore_260:
	movss xmm1, dword [ebp-0xac]
	subss xmm1, xmm0
	mulss xmm1, [_float_0_50000000]
	jmp CG_DrawTeamOfClientScore_470
CG_DrawTeamOfClientScore_300:
	movss xmm1, dword [ebp-0xac]
	subss xmm1, xmm0
	jmp CG_DrawTeamOfClientScore_460
CG_DrawTeamOfClientScore_270:
	movss xmm1, dword [ebp-0xac]
	subss xmm1, xmm0
	jmp CG_DrawTeamOfClientScore_470
	
	
CG_DrawTeamOfClientScore_jumptab_0:
	dd CG_DrawTeamOfClientScore_480
	dd CG_DrawTeamOfClientScore_210
	dd CG_DrawTeamOfClientScore_490
	dd CG_DrawTeamOfClientScore_500
	dd CG_DrawTeamOfClientScore_510
	dd CG_DrawTeamOfClientScore_520
	dd CG_DrawTeamOfClientScore_530
	dd CG_DrawTeamOfClientScore_540
	dd CG_DrawTeamOfClientScore_550
	dd CG_DrawTeamOfClientScore_560


;CG_DrawScoreboard_ListColumnHeaders(int, float const*, float, float, float)
CG_DrawScoreboard_ListColumnHeaders:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x7c
	mov [ebp-0x2c], edx
	movss [ebp-0x30], xmm0
	movss [ebp-0x34], xmm1
	movss [ebp-0x38], xmm2
	mov edx, eax
	shl edx, 0x6
	lea eax, [edx+eax*4]
	mov edx, scrPlaceView
	add eax, edx
	mov [ebp-0x20], eax
	movss xmm0, dword [_float_0_85000002]
	mov eax, [cg_scoreboardHeaderFontScale]
	mulss xmm0, [eax+0xc]
	movss [esp+0x8], xmm0
	mov eax, [cg_scoreboardFont]
	mov eax, [eax+0xc]
	mov [esp+0x4], eax
	mov eax, [ebp-0x20]
	mov [esp], eax
	call UI_GetFontHandle
	mov [ebp-0x1c], eax
	mov edx, [ebp-0x20]
	movss xmm2, dword [edx+0x20]
	subss xmm2, [edx+0x18]
	mov eax, [cg_scoreboardWidth]
	subss xmm2, [eax+0xc]
	mulss xmm2, [_float_0_50000000]
	pxor xmm1, xmm1
	movaps xmm0, xmm1
	subss xmm0, xmm2
	ucomiss xmm0, xmm1
	jb CG_DrawScoreboard_ListColumnHeaders_10
	movss xmm1, dword [_float_3_00000000]
CG_DrawScoreboard_ListColumnHeaders_70:
	addss xmm1, [_float_2_00000000]
	movaps xmm0, xmm1
	addss xmm0, [_float_4_00000000]
	movss [ebp-0x28], xmm0
	mov eax, [cg_scoreboardPingText]
	cmp byte [eax+0xc], 0x0
	jz CG_DrawScoreboard_ListColumnHeaders_20
	mov eax, columnInfoWithPing
	mov dword [ebp-0x24], 0x9
CG_DrawScoreboard_ListColumnHeaders_60:
	mov esi, eax
	xor edi, edi
	movss xmm0, dword [ebp-0x30]
	addss xmm0, [ebp-0x34]
	movss [ebp-0x3c], xmm0
	jmp CG_DrawScoreboard_ListColumnHeaders_30
CG_DrawScoreboard_ListColumnHeaders_50:
	movss xmm0, dword [ebp-0x38]
	mulss xmm0, [esi+0x4]
	addss xmm0, [ebp-0x28]
	movss [ebp-0x28], xmm0
	add edi, 0x1
	add esi, 0x10
	cmp edi, [ebp-0x24]
	jz CG_DrawScoreboard_ListColumnHeaders_40
CG_DrawScoreboard_ListColumnHeaders_30:
	mov eax, [esi+0x8]
	cmp byte [eax], 0x0
	jz CG_DrawScoreboard_ListColumnHeaders_50
	mov [esp], eax
	call UI_SafeTranslateString
	mov ebx, eax
	movss xmm1, dword [ebp-0x38]
	mulss xmm1, [esi+0x4]
	mov eax, [cg_scoreboardHeaderFontScale]
	movss xmm0, dword [eax+0xc]
	mulss xmm0, [_float_0_85000002]
	movss [esp+0xc], xmm0
	mov eax, [ebp-0x1c]
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x0
	mov [esp], ebx
	movss [ebp-0x58], xmm1
	call UI_TextWidth
	mov dword [esp+0x28], 0x3
	mov edx, [ebp-0x2c]
	mov [esp+0x24], edx
	mov edx, [cg_scoreboardHeaderFontScale]
	movss xmm0, dword [edx+0xc]
	mulss xmm0, [_float_0_85000002]
	movss [esp+0x20], xmm0
	mov dword [esp+0x1c], 0x0
	mov dword [esp+0x18], 0x1
	movss xmm0, dword [ebp-0x3c]
	movss [esp+0x14], xmm0
	cvtsi2ss xmm0, eax
	movss xmm1, dword [ebp-0x58]
	subss xmm1, xmm0
	mulss xmm1, [_float_0_50000000]
	addss xmm1, [ebp-0x28]
	movss [esp+0x10], xmm1
	mov eax, [ebp-0x1c]
	mov [esp+0xc], eax
	mov dword [esp+0x8], 0x7fffffff
	mov [esp+0x4], ebx
	mov edx, [ebp-0x20]
	mov [esp], edx
	call UI_DrawText
	movss xmm0, dword [ebp-0x38]
	mulss xmm0, [esi+0x4]
	addss xmm0, [ebp-0x28]
	movss [ebp-0x28], xmm0
	add edi, 0x1
	add esi, 0x10
	cmp edi, [ebp-0x24]
	jnz CG_DrawScoreboard_ListColumnHeaders_30
CG_DrawScoreboard_ListColumnHeaders_40:
	movss xmm0, dword [ebp-0x3c]
	addss xmm0, [_float_4_00000000]
	add esp, 0x7c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CG_DrawScoreboard_ListColumnHeaders_20:
	mov eax, columnInfo
	mov dword [ebp-0x24], 0x8
	jmp CG_DrawScoreboard_ListColumnHeaders_60
CG_DrawScoreboard_ListColumnHeaders_10:
	movaps xmm1, xmm2
	addss xmm1, [_float_3_00000000]
	jmp CG_DrawScoreboard_ListColumnHeaders_70


;UpdateScores(int)
UpdateScores:
	push ebp
	mov ebp, esp
	sub esp, 0x18
	mov edx, cgArray
	mov ecx, [edx+0x46128]
	mov eax, [edx+0x4f8a4]
	add eax, 0x7d0
	cmp eax, ecx
	jl UpdateScores_10
	leave
	ret
UpdateScores_10:
	mov [edx+0x4f8a4], ecx
	mov dword [esp+0x4], _cstring_score
	mov eax, [ebp+0x8]
	mov [esp], eax
	call CL_AddReliableCommand
	leave
	ret


;CG_DrawScoreboard(int)
CG_DrawScoreboard:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0xfc
	mov eax, cg_paused
	mov eax, [eax]
	mov ecx, [eax+0xc]
	test ecx, ecx
	jnz CG_DrawScoreboard_10
	mov eax, cgArray
	mov edx, [eax+0x502e0]
	test edx, edx
	jz CG_DrawScoreboard_20
	movss xmm0, dword [_float_1_00000000]
	movss [ebp-0x6c], xmm0
	mov eax, cgArray
	mov edx, [eax+0x46128]
	mov ecx, eax
	mov eax, [eax+0x4f8a4]
	add eax, 0x7d0
	cmp eax, edx
	jl CG_DrawScoreboard_30
CG_DrawScoreboard_230:
	mov edx, cgArray
	mov eax, [edx+0x502e8]
	test eax, eax
	jle CG_DrawScoreboard_40
CG_DrawScoreboard_240:
	mov eax, [ebp+0x8]
	shl eax, 0x6
	mov ecx, [ebp+0x8]
	lea eax, [eax+ecx*4]
	mov edx, scrPlaceView
	add eax, edx
	mov [ebp-0x64], eax
	mov edx, colorWhite
	mov eax, [edx]
	mov [ebp-0x2c], eax
	mov eax, [edx+0x4]
	mov [ebp-0x28], eax
	mov eax, [edx+0x8]
	mov [ebp-0x24], eax
	movss xmm0, dword [ebp-0x6c]
	movss [ebp-0x20], xmm0
	call CL_GetServerIPAddress
	mov [ebp-0x5c], eax
	mov dword [esp+0x4], _cstring_00000
	mov [esp], eax
	call Q_stricmp
	test eax, eax
	jz CG_DrawScoreboard_50
CG_DrawScoreboard_380:
	movss xmm1, dword [_float_0_34999999]
	movss [ebp-0x60], xmm1
	mov esi, 0x1c
	movaps xmm2, xmm1
	jmp CG_DrawScoreboard_60
CG_DrawScoreboard_80:
	movss xmm0, dword [ebp-0x60]
	subss xmm0, [_float_0_01000000]
	movss [ebp-0x60], xmm0
	sub esi, 0x1
	jz CG_DrawScoreboard_70
	movaps xmm2, xmm0
CG_DrawScoreboard_60:
	movss [esp+0x8], xmm2
	mov eax, [cg_scoreboardFont]
	mov eax, [eax+0xc]
	mov [esp+0x4], eax
	mov eax, [ebp-0x64]
	mov [esp], eax
	call UI_GetFontHandle
	mov edi, eax
	movss xmm0, dword [ebp-0x60]
	movss [esp+0xc], xmm0
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x0
	mov eax, cgsArray
	add eax, 0x40
	mov [esp], eax
	call UI_TextWidth
	mov ebx, eax
	movss xmm1, dword [ebp-0x60]
	movss [esp+0xc], xmm1
	mov [esp+0x8], edi
	mov dword [esp+0x4], 0x0
	mov eax, [ebp-0x5c]
	mov [esp], eax
	call UI_TextWidth
	lea eax, [ebx+eax+0x4]
	cvtsi2ss xmm1, eax
	mov eax, [cg_scoreboardWidth]
	movss xmm0, dword [eax+0xc]
	subss xmm0, [_float_6_00000000]
	subss xmm0, [_float_8_00000000]
	ucomiss xmm0, xmm1
	jb CG_DrawScoreboard_80
	movss xmm4, dword [ebp-0x60]
CG_DrawScoreboard_310:
	mov eax, [cg_scoreboardHeight]
	movss xmm1, dword [eax+0xc]
	movss [ebp-0x58], xmm1
	movss xmm0, dword [_float_480_00000000]
	subss xmm0, xmm1
	mulss xmm0, [_float_0_50000000]
	pxor xmm2, xmm2
	movaps xmm1, xmm2
	subss xmm1, xmm0
	movaps xmm3, xmm2
	cmpss xmm3, xmm1, 0x6
	movaps xmm1, xmm3
	movaps xmm3, xmm0
	andps xmm3, xmm1
	orps xmm3, xmm2
	movss [esp+0x4], xmm4
	mov [esp], edi
	movss [ebp-0xa8], xmm2
	movss [ebp-0xb8], xmm3
	call UI_TextHeight
	movss xmm3, dword [ebp-0xb8]
	addss xmm3, [ebp-0x58]
	movss xmm4, dword [_float_3_00000000]
	subss xmm3, xmm4
	movss xmm5, dword [_float_2_00000000]
	subss xmm3, xmm5
	movss xmm0, dword [_float_14_00000000]
	subss xmm3, xmm0
	addss xmm3, xmm0
	mov edx, 0xe
	sub edx, eax
	cvtsi2ss xmm0, edx
	mulss xmm0, [_float__0_50000000]
	addss xmm3, xmm0
	mov eax, [ebp-0x64]
	movss xmm1, dword [eax+0x20]
	subss xmm1, [eax+0x18]
	mov eax, [cg_scoreboardWidth]
	subss xmm1, [eax+0xc]
	mulss xmm1, [_float_0_50000000]
	movss xmm2, dword [ebp-0xa8]
	movaps xmm0, xmm2
	subss xmm0, xmm1
	ucomiss xmm0, xmm2
	jb CG_DrawScoreboard_90
	movaps xmm0, xmm4
CG_DrawScoreboard_390:
	mov dword [esp+0x28], 0x3
	lea edx, [ebp-0x2c]
	mov [esp+0x24], edx
	movss xmm1, dword [ebp-0x60]
	movss [esp+0x20], xmm1
	mov dword [esp+0x1c], 0x0
	mov dword [esp+0x18], 0x1
	movss [esp+0x14], xmm3
	addss xmm0, xmm5
	addss xmm0, [_float_4_00000000]
	movss [esp+0x10], xmm0
	mov [esp+0xc], edi
	mov dword [esp+0x8], 0x7fffffff
	mov eax, cgsArray
	add eax, 0x40
	mov [esp+0x4], eax
	mov eax, [ebp-0x64]
	mov [esp], eax
	movss [ebp-0xb8], xmm3
	movss [ebp-0xc8], xmm5
	call UI_DrawText
	mov eax, [cg_scoreboardWidth]
	movss xmm2, dword [eax+0xc]
	mov edx, [ebp-0x64]
	movss xmm0, dword [edx+0x20]
	subss xmm0, [edx+0x18]
	subss xmm0, xmm2
	mulss xmm0, [_float_0_50000000]
	pxor xmm1, xmm1
	subss xmm1, xmm0
	pxor xmm4, xmm4
	cmpss xmm4, xmm1, 0x6
	andps xmm0, xmm4
	pxor xmm7, xmm7
	orps xmm0, xmm7
	addss xmm0, xmm2
	subss xmm0, [_float_3_00000000]
	movss xmm5, dword [ebp-0xc8]
	subss xmm0, xmm5
	subss xmm0, [_float_4_00000000]
	movss xmm1, dword [ebp-0x60]
	movss [esp+0xc], xmm1
	mov [esp+0x8], edi
	mov dword [esp+0x4], 0x0
	mov eax, [ebp-0x5c]
	mov [esp], eax
	movss [ebp-0x88], xmm0
	call UI_TextWidth
	mov dword [esp+0x28], 0x3
	lea edx, [ebp-0x2c]
	mov [esp+0x24], edx
	movss xmm1, dword [ebp-0x60]
	movss [esp+0x20], xmm1
	mov dword [esp+0x1c], 0x0
	mov dword [esp+0x18], 0x1
	movss xmm3, dword [ebp-0xb8]
	movss [esp+0x14], xmm3
	add eax, 0x4
	cvtsi2ss xmm1, eax
	movss xmm0, dword [ebp-0x88]
	subss xmm0, xmm1
	movss [esp+0x10], xmm0
	mov [esp+0xc], edi
	mov dword [esp+0x8], 0x7fffffff
	mov eax, [ebp-0x5c]
	mov [esp+0x4], eax
	mov edx, [ebp-0x64]
	mov [esp], edx
	call UI_DrawText
	mov ecx, cgArray
	mov eax, [ecx+0x4f8a8]
	test eax, eax
	jz CG_DrawScoreboard_100
	mov dword [ecx+0x502ec], 0x0
	movss xmm1, dword [_float_480_00000000]
	mov eax, [cg_scoreboardHeight]
	subss xmm1, [eax+0xc]
	mulss xmm1, [_float_0_50000000]
	pxor xmm0, xmm0
	subss xmm0, xmm1
	pxor xmm2, xmm2
	ucomiss xmm0, xmm2
	jb CG_DrawScoreboard_110
	movss xmm0, dword [_float_3_00000000]
CG_DrawScoreboard_410:
	movaps xmm3, xmm0
	addss xmm3, [_float_2_00000000]
	addss xmm3, [_float_24_00000000]
	movss xmm0, dword [_float_1_00000000]
	addss xmm3, xmm0
	movss [ebp-0x2c], xmm0
	movss [ebp-0x28], xmm0
	movss [ebp-0x24], xmm0
	movss xmm4, dword [ebp-0x6c]
	movss [ebp-0x20], xmm4
	mov eax, [cg_scoreboardWidth]
	movss xmm7, dword [eax+0xc]
	subss xmm7, [_float_6_00000000]
	movss xmm1, dword [_float_4_00000000]
	subss xmm7, xmm1
	subss xmm7, [_float_8_00000000]
	movss [ebp-0x54], xmm7
	mov eax, [cg_scoreboardItemHeight]
	cvtsi2ss xmm0, dword [eax+0xc]
	addss xmm0, xmm1
	addss xmm3, xmm0
	addss xmm3, [_float_15_00000000]
	mov eax, [cg_scoreboardBannerHeight]
	cvtsi2ss xmm1, dword [eax+0xc]
	movaps xmm0, xmm3
	addss xmm0, xmm1
	movss [ebp-0x50], xmm0
	mov eax, cgArray
	cmp dword [eax+0x502e8], 0x1
	jle CG_DrawScoreboard_120
	movaps xmm2, xmm7
	movaps xmm0, xmm3
	lea edx, [ebp-0x2c]
	mov eax, [ebp+0x8]
	call CG_DrawScoreboard_ListColumnHeaders
	movaps xmm3, xmm0
CG_DrawScoreboard_420:
	mov dword [ebp-0x1c], 0x1
	mov edx, cgArray
	mov eax, [edx+0x4f8d0]
	test eax, eax
	jnz CG_DrawScoreboard_130
	mov eax, [edx+0x4f8d4]
	test eax, eax
	jnz CG_DrawScoreboard_140
	mov ecx, cgArray
	mov eax, [ecx+0x4f8cc]
	test eax, eax
	jnz CG_DrawScoreboard_150
CG_DrawScoreboard_320:
	mov eax, ecx
	mov edi, [eax+0x4f8d8]
	test edi, edi
	jnz CG_DrawScoreboard_160
CG_DrawScoreboard_330:
	mov edx, eax
CG_DrawScoreboard_340:
	mov eax, [ebp-0x1c]
	sub eax, 0x1
	mov [edx+0x502f0], eax
	cmp dword [edx+0x502e8], 0x1
	jle CG_DrawScoreboard_170
	mov ecx, edx
CG_DrawScoreboard_400:
	mov ebx, [ecx+0x4f8a8]
	cmp dword [ecx+0x4f8cc], 0x1
	sbb ebx, 0xffffffff
	cmp dword [ecx+0x4f8d0], 0x1
	sbb ebx, 0xffffffff
	cmp dword [ecx+0x4f8d4], 0x1
	sbb ebx, 0xffffffff
	cmp dword [ecx+0x4f8d8], 0x1
	sbb ebx, 0xffffffff
	mov eax, [ebp-0x2c]
	mov [ebp-0x3c], eax
	mov eax, [ebp-0x28]
	mov [ebp-0x38], eax
	mov eax, [ebp-0x24]
	mov [ebp-0x34], eax
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_black
	call Material_RegisterHandle
	mov edx, eax
	movss xmm0, dword [ebp-0x20]
	mulss xmm0, [_float_0_50000000]
	movss [ebp-0x30], xmm0
	mov eax, [cg_scoreboardWidth]
	movss xmm4, dword [eax+0xc]
	mov eax, [ebp-0x64]
	movss xmm2, dword [eax+0x20]
	subss xmm2, [eax+0x18]
	subss xmm2, xmm4
	mulss xmm2, [_float_0_50000000]
	pxor xmm6, xmm6
	movaps xmm0, xmm6
	subss xmm0, xmm2
	ucomiss xmm0, xmm6
	jb CG_DrawScoreboard_180
	movss xmm2, dword [_float_3_00000000]
CG_DrawScoreboard_430:
	addss xmm2, [_float_2_00000000]
	movss xmm1, dword [_float_4_00000000]
	addss xmm2, xmm1
	subss xmm4, [_float_6_00000000]
	subss xmm4, xmm1
	movss xmm5, dword [_float_8_00000000]
	subss xmm4, xmm5
	movss xmm3, dword [_float_1_00000000]
	mov eax, [cg_scoreboardPingWidth]
	movss xmm0, dword [eax+0xc]
	addss xmm0, xmm3
	mulss xmm4, xmm0
	addss xmm2, xmm4
	addss xmm2, xmm5
	addss xmm2, xmm1
	mov eax, [cg_scoreboardHeight]
	movss xmm4, dword [eax+0xc]
	movss xmm0, dword [_float_480_00000000]
	subss xmm0, xmm4
	mulss xmm0, [_float_0_50000000]
	movaps xmm1, xmm6
	subss xmm1, xmm0
	movaps xmm7, xmm6
	cmpss xmm7, xmm1, 0x6
	andps xmm0, xmm7
	orps xmm0, xmm6
	addss xmm0, xmm4
	subss xmm0, [_float_3_00000000]
	subss xmm0, [_float_2_00000000]
	subss xmm0, [_float_14_00000000]
	subss xmm0, xmm3
	subss xmm0, [ebp-0x50]
	subss xmm0, xmm3
	mov [esp+0x20], edx
	lea esi, [ebp-0x3c]
	mov [esp+0x1c], esi
	mov dword [esp+0x18], 0x0
	mov dword [esp+0x14], 0x1
	movss [esp+0x10], xmm0
	movss [esp+0xc], xmm5
	movss xmm1, dword [ebp-0x50]
	movss [esp+0x8], xmm1
	movss [esp+0x4], xmm2
	mov eax, [ebp-0x64]
	mov [esp], eax
	movss [ebp-0x88], xmm0
	movss [ebp-0xa8], xmm2
	movss [ebp-0xb8], xmm3
	movss [ebp-0xd8], xmm6
	call UI_DrawHandlePic
	movss xmm2, dword [ebp-0xa8]
	movss xmm3, dword [ebp-0xb8]
	addss xmm2, xmm3
	movss [ebp-0x4c], xmm2
	addss xmm3, [ebp-0x50]
	movss xmm0, dword [ebp-0x88]
	movaps xmm2, xmm0
	subss xmm2, [_float_2_00000000]
	test ebx, ebx
	movss xmm6, dword [ebp-0xd8]
	jz CG_DrawScoreboard_190
	mov edx, cgArray
	mov ecx, [edx+0x502e8]
	cvtsi2ss xmm1, ebx
	lea eax, [ecx-0x1]
	cvtsi2ss xmm0, eax
	divss xmm0, xmm1
	mulss xmm0, xmm2
	addss xmm3, xmm0
	mov eax, [edx+0x502f0]
	sub eax, ecx
	add eax, 0x1
	cvtsi2ss xmm0, eax
	divss xmm0, xmm1
	mulss xmm2, xmm0
CG_DrawScoreboard_190:
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_white
	movss [ebp-0xa8], xmm2
	movss [ebp-0xb8], xmm3
	movss [ebp-0xd8], xmm6
	call Material_RegisterHandle
	movss xmm0, dword [_float_0_25000000]
	mulss xmm0, [ebp-0x20]
	movss [ebp-0x30], xmm0
	mov [esp+0x20], eax
	mov [esp+0x1c], esi
	mov dword [esp+0x18], 0x0
	mov dword [esp+0x14], 0x1
	movss xmm2, dword [ebp-0xa8]
	movss [esp+0x10], xmm2
	mov dword [esp+0xc], 0x40c00000
	movss xmm3, dword [ebp-0xb8]
	movss [esp+0x8], xmm3
	movss xmm0, dword [ebp-0x4c]
	movss [esp+0x4], xmm0
	mov eax, [ebp-0x64]
	mov [esp], eax
	call UI_DrawHandlePic
	mov eax, [ebp-0x20]
	mov [ebp-0x30], eax
	mov edx, cgArray
	cmp dword [edx+0x502e8], 0x1
	jle CG_DrawScoreboard_200
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_hudscoreboardscr
	call Material_RegisterHandle
	mov edx, eax
	mov eax, [cg_scoreboardWidth]
	movss xmm1, dword [eax+0xc]
	mov ecx, [ebp-0x64]
	movss xmm2, dword [ecx+0x20]
	subss xmm2, [ecx+0x18]
	subss xmm2, xmm1
	mulss xmm2, [_float_0_50000000]
	movss xmm6, dword [ebp-0xd8]
	movaps xmm0, xmm6
	subss xmm0, xmm2
	ucomiss xmm0, xmm6
	jb CG_DrawScoreboard_210
	movss xmm2, dword [_float_3_00000000]
CG_DrawScoreboard_370:
	movss xmm4, dword [_float_2_00000000]
	addss xmm2, xmm4
	movss xmm0, dword [_float_4_00000000]
	addss xmm2, xmm0
	subss xmm1, [_float_6_00000000]
	subss xmm1, xmm0
	movss xmm3, dword [_float_8_00000000]
	subss xmm1, xmm3
	mov eax, [cg_scoreboardPingWidth]
	movss xmm0, dword [eax+0xc]
	mulss xmm0, xmm1
	addss xmm0, xmm1
	addss xmm2, xmm0
	addss xmm2, xmm3
	addss xmm2, xmm3
	addss xmm2, xmm3
	addss xmm2, xmm4
	addss xmm2, [_float_0_00000000]
	mov [esp+0x20], edx
	mov [esp+0x1c], esi
	mov dword [esp+0x18], 0x0
	mov dword [esp+0x14], 0x1
	mov ebx, 0x41800000
	mov [esp+0x10], ebx
	mov [esp+0xc], ebx
	movss xmm0, dword [ebp-0x50]
	movss [esp+0x8], xmm0
	movss [esp+0x4], xmm2
	mov eax, [ebp-0x64]
	mov [esp], eax
	movss [ebp-0xa8], xmm2
	call UI_DrawHandlePic
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_hudscoreboardscr1
	call Material_RegisterHandle
	mov [esp+0x20], eax
	mov [esp+0x1c], esi
	mov dword [esp+0x18], 0x0
	mov dword [esp+0x14], 0x1
	mov [esp+0x10], ebx
	mov [esp+0xc], ebx
	movss xmm0, dword [ebp-0x50]
	addss xmm0, [_float_18_00000000]
	movss [esp+0x8], xmm0
	movss xmm2, dword [ebp-0xa8]
	movss [esp+0x4], xmm2
	mov eax, [ebp-0x64]
	mov [esp], eax
	call UI_DrawHandlePic
	mov edx, cgArray
CG_DrawScoreboard_200:
	mov ebx, [edx+0x502ec]
	test ebx, ebx
	jnz CG_DrawScoreboard_220
CG_DrawScoreboard_100:
	mov eax, 0x1
	add esp, 0xfc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CG_DrawScoreboard_20:
	mov edx, eax
	mov dword [esp+0xc], 0x64
	mov dword [esp+0x8], 0x64
	mov eax, [eax+0x502e4]
	mov [esp+0x4], eax
	mov eax, [edx+0x46128]
	mov [esp], eax
	call CG_FadeColor
	test eax, eax
	jz CG_DrawScoreboard_10
	movss xmm0, dword [eax+0xc]
	movss [ebp-0x6c], xmm0
	mov eax, cgArray
	mov edx, [eax+0x46128]
	mov ecx, eax
	mov eax, [eax+0x4f8a4]
	add eax, 0x7d0
	cmp eax, edx
	jge CG_DrawScoreboard_230
CG_DrawScoreboard_30:
	mov [ecx+0x4f8a4], edx
	mov dword [esp+0x4], _cstring_score
	mov eax, [ebp+0x8]
	mov [esp], eax
	call CL_AddReliableCommand
	mov edx, cgArray
	mov eax, [edx+0x502e8]
	test eax, eax
	jg CG_DrawScoreboard_240
CG_DrawScoreboard_40:
	mov eax, [cg_scoreboardHeight]
	movss xmm1, dword [eax+0xc]
	movss xmm4, dword [_float_480_00000000]
	subss xmm4, xmm1
	mulss xmm4, [_float_0_50000000]
	pxor xmm6, xmm6
	movaps xmm2, xmm6
	subss xmm2, xmm4
	movaps xmm0, xmm6
	cmpss xmm0, xmm2, 0x6
	movaps xmm3, xmm4
	andps xmm3, xmm0
	orps xmm3, xmm6
	addss xmm3, xmm1
	movss xmm0, dword [_float_3_00000000]
	subss xmm3, xmm0
	movss xmm5, dword [_float_2_00000000]
	subss xmm3, xmm5
	subss xmm3, [_float_14_00000000]
	ucomiss xmm2, xmm6
	jb CG_DrawScoreboard_250
	movaps xmm2, xmm0
CG_DrawScoreboard_460:
	mov eax, [cg_scoreboardItemHeight]
	cvtsi2ss xmm1, dword [eax+0xc]
	addss xmm2, xmm5
	addss xmm2, [_float_24_00000000]
	movss xmm0, dword [_float_1_00000000]
	addss xmm2, xmm0
	subss xmm3, xmm2
	subss xmm3, xmm0
	mov eax, [cg_scoreboardBannerHeight]
	cvtsi2ss xmm0, dword [eax+0xc]
	subss xmm3, xmm0
	subss xmm3, xmm1
	movss xmm0, dword [_float_4_00000000]
	subss xmm3, xmm0
	addss xmm1, xmm0
	divss xmm3, xmm1
	cvttss2si ecx, xmm3
	mov [ebp-0x68], ecx
	mov eax, cgArray
	mov ecx, [eax]
	lea eax, [ecx+ecx*8]
	mov edx, eax
	shl edx, 0x4
	add eax, edx
	lea eax, [ecx+eax*2]
	mov edx, cgArray
	mov edi, [edx+eax*4+0xe9f50]
	cmp edi, 0x3
	jz CG_DrawScoreboard_260
	mov eax, edx
	mov ebx, [edx+0x4f8a8]
	test ebx, ebx
	jle CG_DrawScoreboard_270
	xor edx, edx
	mov esi, 0x1
	jmp CG_DrawScoreboard_280
CG_DrawScoreboard_300:
	add edx, 0x1
	add eax, 0x28
	cmp ebx, edx
	jz CG_DrawScoreboard_290
CG_DrawScoreboard_280:
	cmp edi, [eax+0x4f8ec]
	jnz CG_DrawScoreboard_300
	cmp ecx, [eax+0x4f8dc]
	jz CG_DrawScoreboard_290
	add esi, 0x1
	jmp CG_DrawScoreboard_300
CG_DrawScoreboard_10:
	xor eax, eax
	add esp, 0xfc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CG_DrawScoreboard_70:
	movaps xmm4, xmm0
	jmp CG_DrawScoreboard_310
CG_DrawScoreboard_130:
	mov ecx, edx
CG_DrawScoreboard_360:
	mov edx, [ecx]
	lea eax, [edx+edx*8]
	mov ecx, eax
	shl ecx, 0x4
	add eax, ecx
	lea eax, [edx+eax*2]
	mov edx, cgArray
	mov ebx, [edx+eax*4+0xe9f50]
	lea eax, [ebx-0x1]
	cmp eax, 0x2
	mov eax, 0x2
	cmovae ebx, eax
	lea esi, [ebp-0x1c]
	mov [esp], esi
	movss xmm1, dword [ebp-0x54]
	mov ecx, ebx
	movaps xmm0, xmm3
	lea edx, [ebp-0x2c]
	mov eax, [ebp+0x8]
	call CG_DrawTeamOfClientScore
	xor ecx, ecx
	cmp ebx, 0x1
	setz cl
	add ecx, 0x1
	mov [esp], esi
	movss xmm1, dword [ebp-0x54]
	addss xmm0, [_float_4_00000000]
	lea edx, [ebp-0x2c]
	mov eax, [ebp+0x8]
	call CG_DrawTeamOfClientScore
	movss xmm3, dword [_float_4_00000000]
	addss xmm3, xmm0
	mov ecx, cgArray
	mov eax, [ecx+0x4f8cc]
	test eax, eax
	jz CG_DrawScoreboard_320
CG_DrawScoreboard_150:
	lea eax, [ebp-0x1c]
	mov [esp], eax
	movss xmm1, dword [ebp-0x54]
	xor ecx, ecx
	movaps xmm0, xmm3
	lea edx, [ebp-0x2c]
	mov eax, [ebp+0x8]
	call CG_DrawTeamOfClientScore
	movaps xmm3, xmm0
	addss xmm3, [_float_4_00000000]
	mov eax, cgArray
	mov edi, [eax+0x4f8d8]
	test edi, edi
	jz CG_DrawScoreboard_330
CG_DrawScoreboard_160:
	lea eax, [ebp-0x1c]
	mov [esp], eax
	movss xmm1, dword [ebp-0x54]
	mov ecx, 0x3
	movaps xmm0, xmm3
	lea edx, [ebp-0x2c]
	mov eax, [ebp+0x8]
	call CG_DrawTeamOfClientScore
	mov edx, cgArray
	jmp CG_DrawScoreboard_340
CG_DrawScoreboard_220:
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_hudscoreboardscr2
	call Material_RegisterHandle
	mov edx, eax
	mov eax, [cg_scoreboardWidth]
	movss xmm4, dword [eax+0xc]
	mov ecx, [ebp-0x64]
	movss xmm2, dword [ecx+0x20]
	subss xmm2, [ecx+0x18]
	subss xmm2, xmm4
	mulss xmm2, [_float_0_50000000]
	pxor xmm6, xmm6
	movaps xmm0, xmm6
	subss xmm0, xmm2
	ucomiss xmm0, xmm6
	jb CG_DrawScoreboard_350
	movss xmm2, dword [_float_3_00000000]
CG_DrawScoreboard_450:
	movss xmm5, dword [_float_2_00000000]
	addss xmm2, xmm5
	movss xmm0, dword [_float_4_00000000]
	addss xmm2, xmm0
	subss xmm4, [_float_6_00000000]
	subss xmm4, xmm0
	movss xmm1, dword [_float_8_00000000]
	subss xmm4, xmm1
	movss xmm3, dword [_float_1_00000000]
	mov eax, [cg_scoreboardPingWidth]
	movss xmm0, dword [eax+0xc]
	addss xmm0, xmm3
	mulss xmm4, xmm0
	addss xmm2, xmm4
	addss xmm2, xmm1
	addss xmm2, xmm1
	addss xmm2, xmm1
	addss xmm2, xmm5
	addss xmm2, xmm6
	mov eax, [cg_scoreboardHeight]
	movss xmm4, dword [eax+0xc]
	movss xmm0, dword [_float_480_00000000]
	subss xmm0, xmm4
	mulss xmm0, [_float_0_50000000]
	movaps xmm1, xmm6
	subss xmm1, xmm0
	movaps xmm7, xmm6
	cmpss xmm7, xmm1, 0x6
	movaps xmm1, xmm7
	andps xmm0, xmm7
	andnps xmm1, xmm6
	orps xmm1, xmm0
	addss xmm1, xmm4
	subss xmm1, [_float_3_00000000]
	subss xmm1, xmm5
	subss xmm1, [_float_14_00000000]
	subss xmm1, xmm3
	subss xmm1, xmm3
	subss xmm1, [_float_16_00000000]
	mov [esp+0x20], edx
	mov [esp+0x1c], esi
	mov dword [esp+0x18], 0x0
	mov dword [esp+0x14], 0x1
	mov dword [esp+0x10], 0x41800000
	mov dword [esp+0xc], 0x41800000
	movss [esp+0x8], xmm1
	movss [esp+0x4], xmm2
	mov eax, [ebp-0x64]
	mov [esp], eax
	movss [ebp-0x98], xmm1
	movss [ebp-0xa8], xmm2
	call UI_DrawHandlePic
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_hudscoreboardscr3
	call Material_RegisterHandle
	mov [esp+0x20], eax
	mov [esp+0x1c], esi
	mov dword [esp+0x18], 0x0
	mov dword [esp+0x14], 0x1
	mov dword [esp+0x10], 0x41800000
	mov dword [esp+0xc], 0x41800000
	movss xmm1, dword [ebp-0x98]
	subss xmm1, [_float_18_00000000]
	movss [esp+0x8], xmm1
	movss xmm2, dword [ebp-0xa8]
	movss [esp+0x4], xmm2
	mov edx, [ebp-0x64]
	mov [esp], edx
	call UI_DrawHandlePic
	mov eax, 0x1
	add esp, 0xfc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CG_DrawScoreboard_140:
	mov ecx, cgArray
	jmp CG_DrawScoreboard_360
CG_DrawScoreboard_210:
	addss xmm2, [_float_3_00000000]
	jmp CG_DrawScoreboard_370
CG_DrawScoreboard_50:
	mov dword [esp], _cstring_cgame_listenserv
	call UI_SafeTranslateString
	mov [ebp-0x5c], eax
	jmp CG_DrawScoreboard_380
CG_DrawScoreboard_90:
	movaps xmm0, xmm1
	addss xmm0, xmm4
	jmp CG_DrawScoreboard_390
CG_DrawScoreboard_170:
	mov esi, [edx+0x502ec]
	test esi, esi
	jz CG_DrawScoreboard_100
	mov ecx, cgArray
	jmp CG_DrawScoreboard_400
CG_DrawScoreboard_110:
	movaps xmm0, xmm1
	addss xmm0, [_float_3_00000000]
	jmp CG_DrawScoreboard_410
CG_DrawScoreboard_120:
	movaps xmm2, xmm7
	movaps xmm0, xmm3
	lea edx, [ebp-0x2c]
	mov eax, [ebp+0x8]
	movss [ebp-0xb8], xmm3
	call CG_DrawScoreboard_ListColumnHeaders
	movss xmm3, dword [ebp-0xb8]
	jmp CG_DrawScoreboard_420
CG_DrawScoreboard_180:
	addss xmm2, [_float_3_00000000]
	jmp CG_DrawScoreboard_430
CG_DrawScoreboard_270:
	mov esi, 0x1
CG_DrawScoreboard_290:
	cmp [ebp-0x68], esi
	jl CG_DrawScoreboard_440
	mov ecx, cgArray
	mov dword [ecx+0x502e8], 0x1
	jmp CG_DrawScoreboard_240
CG_DrawScoreboard_440:
	mov eax, [ebp-0x68]
	shr eax, 0x1f
	add eax, [ebp-0x68]
	sar eax, 1
	sub esi, eax
	lea eax, [esi+0x1]
	mov edx, cgArray
	mov [edx+0x502e8], eax
	jmp CG_DrawScoreboard_240
CG_DrawScoreboard_260:
	mov dword [edx+0x502e8], 0x1
	jmp CG_DrawScoreboard_240
CG_DrawScoreboard_350:
	addss xmm2, [_float_3_00000000]
	jmp CG_DrawScoreboard_450
CG_DrawScoreboard_250:
	movaps xmm2, xmm0
	addss xmm2, xmm4
	jmp CG_DrawScoreboard_460
	add [eax], al


;CG_IsIntermission(int)
CG_IsIntermission:
	push ebp
	mov ebp, esp
	mov eax, cgArray
	mov eax, [eax+0x24]
	cmp dword [eax+0x10], 0x5
	setz al
	movzx eax, al
	pop ebp
	ret
	nop
	add [eax], al


;UI_GetScoreAtRank(int, int)
UI_GetScoreAtRank:
	push ebp
	mov ebp, esp
	push esi
	push ebx
	mov eax, [ebp+0xc]
	test eax, eax
	jg UI_GetScoreAtRank_10
UI_GetScoreAtRank_20:
	xor ebx, ebx
	mov eax, ebx
	pop ebx
	pop esi
	pop ebp
	ret
UI_GetScoreAtRank_10:
	mov esi, cgArray
	cmp eax, [esi+0x4f8a8]
	jg UI_GetScoreAtRank_20
	lea eax, [eax+eax*4]
	lea eax, [esi+eax*8+0x4f8a8]
	lea ebx, [eax+0xc]
	mov edx, [eax+0xc]
	lea eax, [edx+edx*8]
	mov ecx, eax
	shl ecx, 0x4
	add eax, ecx
	lea eax, [edx+eax*2]
	mov edx, [esi+eax*4+0xe9f34]
	test edx, edx
	jz UI_GetScoreAtRank_20
	mov eax, ebx
	pop ebx
	pop esi
	pop ebp
	ret


;UI_GetOurClientScore(int)
UI_GetOurClientScore:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x8
	mov eax, cgArray
	mov eax, [eax]
	mov [ebp-0x14], eax
	mov edx, cgArray
	mov edx, [edx+0x4f8a8]
	mov [ebp-0x10], edx
	test edx, edx
	jle UI_GetOurClientScore_10
	xor esi, esi
	mov ebx, cgArray
	add ebx, 0x4f8d0
UI_GetOurClientScore_40:
	lea edi, [ebx+0xc]
	mov ecx, [ebx+0xc]
	lea eax, [ecx+ecx*8]
	mov edx, eax
	shl edx, 0x4
	add eax, edx
	lea eax, [ecx+eax*2]
	mov edx, cgArray
	mov eax, [edx+eax*4+0xe9f34]
	test eax, eax
	jz UI_GetOurClientScore_20
	cmp [ebp-0x14], ecx
	jz UI_GetOurClientScore_30
UI_GetOurClientScore_20:
	add esi, 0x1
	add ebx, 0x28
	cmp esi, [ebp-0x10]
	jnz UI_GetOurClientScore_40
UI_GetOurClientScore_10:
	xor edi, edi
UI_GetOurClientScore_30:
	mov eax, edi
	add esp, 0x8
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


;Scoreboard_HandleInput(int, int)
Scoreboard_HandleInput:
	push ebp
	mov ebp, esp
	push ebx
	mov eax, [ebp+0xc]
	cmp eax, 0xa4
	jz Scoreboard_HandleInput_10
	jle Scoreboard_HandleInput_20
	cmp eax, 0xcd
	jz Scoreboard_HandleInput_30
	cmp eax, 0xce
	jz Scoreboard_HandleInput_10
Scoreboard_HandleInput_40:
	xor eax, eax
	pop ebx
	pop ebp
	ret
Scoreboard_HandleInput_20:
	cmp eax, 0xa3
	jnz Scoreboard_HandleInput_40
Scoreboard_HandleInput_30:
	mov ebx, cgArray
	mov ecx, [ebx+0x502ec]
	test ecx, ecx
	jz Scoreboard_HandleInput_50
	mov ecx, [ebx+0x4f8a8]
	cmp dword [ebx+0x4f8cc], 0x1
	sbb ecx, 0xffffffff
	cmp dword [ebx+0x4f8d0], 0x1
	sbb ecx, 0xffffffff
	cmp dword [ebx+0x4f8d4], 0x1
	sbb ecx, 0xffffffff
	cmp dword [ebx+0x4f8d8], 0x1
	sbb ecx, 0xffffffff
	mov eax, [ebx+0x502e8]
	mov edx, [cg_scoreboardScrollStep]
	add eax, [edx+0xc]
	mov [ebx+0x502e8], eax
	cmp ecx, eax
	jge Scoreboard_HandleInput_50
	mov [ebx+0x502e8], ecx
	mov eax, 0x1
	pop ebx
	pop ebp
	ret
Scoreboard_HandleInput_10:
	mov ecx, cgArray
	mov edx, [ecx+0x502e8]
	cmp edx, 0x1
	jle Scoreboard_HandleInput_50
	mov eax, [cg_scoreboardScrollStep]
	sub edx, [eax+0xc]
	mov eax, edx
	mov [ecx+0x502e8], edx
	sub eax, 0x1
	jle Scoreboard_HandleInput_60
Scoreboard_HandleInput_50:
	mov eax, 0x1
	pop ebx
	pop ebp
	ret
Scoreboard_HandleInput_60:
	mov dword [ecx+0x502e8], 0x1
	mov eax, 0x1
	pop ebx
	pop ebp
	ret
	nop


;CG_IsScoreboardDisplayed(int)
CG_IsScoreboardDisplayed:
	push ebp
	mov ebp, esp
	mov eax, cgArray
	mov eax, [eax+0x502e0]
	pop ebp
	ret


;CG_GetGametypeDescription(int)
CG_GetGametypeDescription:
	push ebp
	mov ebp, esp
	sub esp, 0x18
	mov dword [esp+0x8], 0x0
	mov dword [esp+0x4], _cstring_game_objective_d
	mov eax, cgArray
	add eax, 0x4f3a1
	mov [esp], eax
	call SEH_LocalizeTextMessage
	leave
	ret


;CG_RegisterScoreboardDvars()
CG_RegisterScoreboardDvars:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x2c
	mov dword [esp+0x14], _cstring_number_of_bars_t
	mov dword [esp+0x10], 0x1
	mov dword [esp+0xc], 0xa
	mov dword [esp+0x8], 0x1
	mov dword [esp+0x4], 0x4
	mov dword [esp], _cstring_cg_scoresping_ma
	call Cvar_RegisterInt
	mov [cg_ScoresPing_MaxBars], eax
	mov dword [esp+0x14], _cstring_number_of_millis
	mov dword [esp+0x10], 0x1
	mov dword [esp+0xc], 0x1f4
	mov dword [esp+0x8], 0x1
	mov dword [esp+0x4], 0x64
	mov dword [esp], _cstring_cg_scoresping_in
	call Cvar_RegisterInt
	mov [cg_ScoresPing_Interval], eax
	mov dword [esp+0x18], _cstring_color_for_high_p
	mov dword [esp+0x14], 0x1
	mov esi, 0x3f800000
	mov [esp+0x10], esi
	xor ebx, ebx
	mov [esp+0xc], ebx
	mov [esp+0x8], ebx
	mov dword [esp+0x4], 0x3f4ccccd
	mov dword [esp], _cstring_cg_scoresping_hi
	call Cvar_RegisterColor
	mov [cg_ScoresPing_HighColor], eax
	mov dword [esp+0x18], _cstring_color_for_medium
	mov dword [esp+0x14], 0x1
	mov [esp+0x10], esi
	mov [esp+0xc], ebx
	mov dword [esp+0x8], 0x3f4ccccd
	mov dword [esp+0x4], 0x3f4ccccd
	mov dword [esp], _cstring_cg_scoresping_me
	call Cvar_RegisterColor
	mov [cg_ScoresPing_MedColor], eax
	mov dword [esp+0x18], _cstring_color_for_low_pi
	mov dword [esp+0x14], 0x1
	mov [esp+0x10], esi
	mov [esp+0xc], ebx
	mov dword [esp+0x8], 0x3f400000
	mov [esp+0x4], ebx
	mov dword [esp], _cstring_cg_scoresping_lo
	call Cvar_RegisterColor
	mov [cg_ScoresPing_LowColor], eax
	mov dword [esp+0x18], _cstring_background_color
	mov dword [esp+0x14], 0x1
	mov dword [esp+0x10], 0x3f000000
	mov dword [esp+0xc], 0x3e800000
	mov dword [esp+0x8], 0x3e800000
	mov dword [esp+0x4], 0x3e800000
	mov dword [esp], _cstring_cg_scoresping_bg
	call Cvar_RegisterColor
	mov [cg_ScoresPing_BgColor], eax
	mov dword [esp+0x14], _cstring_scroll_step_amou
	mov dword [esp+0x10], 0x0
	mov dword [esp+0xc], 0x8
	mov dword [esp+0x8], 0x1
	mov dword [esp+0x4], 0x3
	mov dword [esp], _cstring_cg_scoreboardscr
	call Cvar_RegisterInt
	mov [cg_scoreboardScrollStep], eax
	mov dword [esp+0x14], _cstring_banner_height_of
	mov dword [esp+0x10], 0x0
	mov dword [esp+0xc], 0x64
	mov dword [esp+0x8], 0x1
	mov dword [esp+0x4], 0x23
	mov dword [esp], _cstring_cg_scoreboardban
	call Cvar_RegisterInt
	mov [cg_scoreboardBannerHeight], eax
	mov dword [esp+0x14], _cstring_item_height_of_e
	mov dword [esp+0x10], 0x0
	mov dword [esp+0xc], 0x3e8
	mov dword [esp+0x8], 0x1
	mov dword [esp+0x4], 0x12
	mov dword [esp], _cstring_cg_scoreboardite
	call Cvar_RegisterInt
	mov [cg_scoreboardItemHeight], eax
	mov dword [esp+0x14], _cstring_width_of_the_pin
	mov dword [esp+0x10], 0x0
	mov [esp+0xc], esi
	mov [esp+0x8], ebx
	mov dword [esp+0x4], 0x3d1374bc
	mov dword [esp], _cstring_cg_scoreboardpin
	call Cvar_RegisterFloat
	mov [cg_scoreboardPingWidth], eax
	mov dword [esp+0x14], _cstring_height_of_the_pi
	mov dword [esp+0x10], 0x0
	mov [esp+0xc], esi
	mov [esp+0x8], ebx
	mov dword [esp+0x4], 0x3f333333
	mov dword [esp], _cstring_cg_scoreboardpin1
	call Cvar_RegisterFloat
	mov [cg_scoreboardPingHeight], eax
	mov dword [esp+0x14], _cstring_width_of_the_sco
	mov dword [esp+0x10], 0x0
	mov edi, 0x7f7fffff
	mov [esp+0xc], edi
	mov [esp+0x8], ebx
	mov dword [esp+0x4], 0x43fa0000
	mov dword [esp], _cstring_cg_scoreboardwid
	call Cvar_RegisterFloat
	mov [cg_scoreboardWidth], eax
	mov dword [esp+0x14], _cstring_height_of_the_sc
	mov dword [esp+0x10], 0x0
	mov [esp+0xc], edi
	mov [esp+0x8], ebx
	mov dword [esp+0x4], 0x43d98000
	mov dword [esp], _cstring_cg_scoreboardhei
	call Cvar_RegisterFloat
	mov [cg_scoreboardHeight], eax
	mov dword [esp+0x18], _cstring_the_local_player
	mov dword [esp+0x14], 0x0
	mov [esp+0x10], esi
	mov dword [esp+0xc], 0x3ecccccd
	mov dword [esp+0x8], 0x3f4ccccd
	mov [esp+0x4], esi
	mov dword [esp], _cstring_cg_scoreboardmyc
	call Cvar_RegisterColor
	mov [cg_scoreboardMyColor], eax
	mov dword [esp+0x14], _cstring_scoreboard_text_
	mov dword [esp+0x10], 0x0
	mov [esp+0xc], edi
	mov [esp+0x8], ebx
	mov dword [esp+0x4], 0x3f000000
	mov dword [esp], _cstring_cg_scoreboardtex
	call Cvar_RegisterFloat
	mov [cg_scoreboardTextOffset], eax
	mov dword [esp+0x14], _cstring_scoreboard_font_
	mov dword [esp+0x10], 0x0
	mov dword [esp+0xc], 0x6
	mov dword [esp+0x8], 0x0
	mov dword [esp+0x4], 0x0
	mov dword [esp], _cstring_cg_scoreboardfon
	call Cvar_RegisterInt
	mov [cg_scoreboardFont], eax
	mov dword [esp+0x14], _cstring_scoreboard_heade
	mov dword [esp+0x10], 0x0
	mov [esp+0xc], edi
	mov [esp+0x8], ebx
	mov dword [esp+0x4], 0x3eb33333
	mov dword [esp], _cstring_cg_scoreboardhea
	call Cvar_RegisterFloat
	mov [cg_scoreboardHeaderFontScale], eax
	mov dword [esp+0xc], _cstring_whether_to_show_
	mov dword [esp+0x8], 0x0
	mov dword [esp+0x4], 0x1
	mov dword [esp], _cstring_cg_scoreboardpin2
	call Cvar_RegisterBool
	mov [cg_scoreboardPingText], eax
	mov dword [esp+0xc], _cstring_whether_to_show_1
	mov dword [esp+0x8], 0x0
	mov dword [esp+0x4], 0x0
	mov dword [esp], _cstring_cg_scoreboardpin3
	call Cvar_RegisterBool
	mov [cg_scoreboardPingGraph], eax
	mov dword [esp+0x14], _cstring_scale_of_rank_fo
	mov dword [esp+0x10], 0x0
	mov [esp+0xc], edi
	mov [esp+0x8], ebx
	mov dword [esp+0x4], 0x3e800000
	mov dword [esp], _cstring_cg_scoreboardran
	call Cvar_RegisterFloat
	mov [cg_scoreboardRankFontScale], eax
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	nop


;CG_RegisterScoreboardGraphics()
CG_RegisterScoreboardGraphics:
	push ebp
	mov ebp, esp
	sub esp, 0x18
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_white
	call Material_RegisterHandle
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_white
	call Material_RegisterHandle
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_black
	call Material_RegisterHandle
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_white
	call Material_RegisterHandle
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_white
	call Material_RegisterHandle
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_black
	call Material_RegisterHandle
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_hudscoreboardscr
	call Material_RegisterHandle
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_hudscoreboardscr1
	call Material_RegisterHandle
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_hudscoreboardscr2
	call Material_RegisterHandle
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_hudscoreboardscr3
	call Material_RegisterHandle
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_voice_on
	call Material_RegisterHandle
	mov dword [esp+0x4], 0x7
	mov dword [esp], _cstring_voice_off
	call Material_RegisterHandle
	leave
	ret


;CG_DrawScoreboard_GetTeamColorIndex(int, int)
CG_DrawScoreboard_GetTeamColorIndex:
	push ebp
	mov ebp, esp
	push esi
	push ebx
	mov esi, [ebp+0x8]
	mov ebx, cgArray
	mov edx, [ebx]
	lea eax, [edx+edx*8]
	mov ecx, eax
	shl ecx, 0x4
	add eax, ecx
	lea eax, [edx+eax*2]
	lea edx, [ebx+eax*4+0xe9f34]
	lea eax, [esi-0x1]
	cmp eax, 0x1
	jbe CG_DrawScoreboard_GetTeamColorIndex_10
CG_DrawScoreboard_GetTeamColorIndex_20:
	mov eax, 0x37
	pop ebx
	pop esi
	pop ebp
	ret
CG_DrawScoreboard_GetTeamColorIndex_10:
	mov edx, [edx+0x1c]
	lea eax, [edx-0x1]
	cmp eax, 0x1
	ja CG_DrawScoreboard_GetTeamColorIndex_20
	xor eax, eax
	cmp esi, edx
	setnz al
	add eax, 0x38
	pop ebx
	pop esi
	pop ebp
	ret


;Initialized global or static variables of cg_scoreboard_mp:
SECTION .data


;Initialized constant data of cg_scoreboard_mp:
SECTION .rdata
columnInfo: dd 0x8, 0x3d8f5c29, _cstring_null, 0x0, 0x5, 0x3d4ccccd, _cstring_null, 0x2, 0x0, 0x3edc28f6, _cstring_null, 0x0, 0x6, 0x3d4ccccd, _cstring_null, 0x0, 0x2, 0x3dcccccd, _cstring_cgame_sb_score, 0x2, 0x7, 0x3dcccccd, _cstring_cgame_sb_kills, 0x2, 0x9, 0x3dcccccd, _cstring_cgame_sb_assists, 0x2, 0x3, 0x3dcccccd, _cstring_cgame_sb_deaths, 0x2
columnInfoWithPing: dd 0x8, 0x3d4ccccd, _cstring_null, 0x0, 0x5, 0x3d4ccccd, _cstring_null, 0x2, 0x0, 0x3eb33333, _cstring_null, 0x0, 0x6, 0x3d4ccccd, _cstring_null, 0x0, 0x2, 0x3dcccccd, _cstring_cgame_sb_score, 0x2, 0x7, 0x3dcccccd, _cstring_cgame_sb_kills, 0x2, 0x9, 0x3dcccccd, _cstring_cgame_sb_assists, 0x2, 0x3, 0x3dcccccd, _cstring_cgame_sb_deaths, 0x2, 0x4, 0x3dcccccd, _cstring_cgame_sb_ping, 0x2, 0x0, 0x0, 0x0, 0x0


;Zero initialized global or static variables of cg_scoreboard_mp:
SECTION .bss
cg_ScoresPing_BgColor: resb 0x4
cg_ScoresPing_HighColor: resb 0x4
cg_ScoresPing_Interval: resb 0x4
cg_ScoresPing_LowColor: resb 0x4
cg_ScoresPing_MaxBars: resb 0x4
cg_ScoresPing_MedColor: resb 0x4
cg_scoreboardBannerHeight: resb 0x4
cg_scoreboardFont: resb 0x4
cg_scoreboardHeaderFontScale: resb 0x4
cg_scoreboardHeight: resb 0x4
cg_scoreboardItemHeight: resb 0x4
cg_scoreboardMyColor: resb 0x4
cg_scoreboardPingGraph: resb 0x4
cg_scoreboardPingHeight: resb 0x4
cg_scoreboardPingText: resb 0x4
cg_scoreboardPingWidth: resb 0x4
cg_scoreboardRankFontScale: resb 0x4
cg_scoreboardScrollStep: resb 0x38
cg_scoreboardTextOffset: resb 0x4
cg_scoreboardWidth: resb 0x4


;All cstrings:
SECTION .rdata
_cstring_g_teamicon_free:		db "g_TeamIcon_Free",0
_cstring_null:		db 0
_cstring__i_:		db "( %i )",0
_cstring_g_scorescolor:		db "g_ScoresColor",0
_cstring_white:		db "white",0
_cstring_g_teamicon_spect:		db "g_TeamIcon_Spectator",0
_cstring_scoreboard_team_:		db "scoreboard team name",0
_cstring_cgame_spectators:		db "CGAME_SPECTATORS",0
_cstring_s:		db "%s",0
_cstring_i:		db "%i",0
_cstring_voice_off:		db "voice_off",0
_cstring_g_teamicon_axis:		db "g_TeamIcon_Axis",0
_cstring_g_teamname_axis:		db "g_TeamName_Axis",0
_cstring_g_teamicon_allie:		db "g_TeamIcon_Allies",0
_cstring_g_teamname_allie:		db "g_TeamName_Allies",0
_cstring_cg_scoresping_bg:		db "cg_ScoresPing_BgColor",0
_cstring_cg_scoresping_ma:		db "cg_ScoresPing_MaxBars",0
_cstring_cg_scoresping_in:		db "cg_ScoresPing_Interval",0
_cstring_cg_scoresping_hi:		db "cg_ScoresPing_HighColor",0
_cstring_cg_scoresping_me:		db "cg_ScoresPing_MedColor",0
_cstring_cg_scoresping_lo:		db "cg_ScoresPing_LowColor",0
_cstring_voice_on:		db "voice_on",0
_cstring_score:		db "score",0
_cstring_00000:		db "0.0.0.0:0",0
_cstring_black:		db "black",0
_cstring_hudscoreboardscr:		db "hudscoreboardscroll_uparrow",0
_cstring_hudscoreboardscr1:		db "hudscoreboardscroll_upkey",0
_cstring_hudscoreboardscr2:		db "hudscoreboardscroll_downarrow",0
_cstring_hudscoreboardscr3:		db "hudscoreboardscroll_downkey",0
_cstring_cgame_listenserv:		db "CGAME_LISTENSERVER",0
_cstring_game_objective_d:		db "game objective display",0
_cstring_number_of_bars_t:		db "Number of bars to show in ping graph",0
_cstring_number_of_millis:		db "Number of milliseconds each bar represents",0
_cstring_color_for_high_p:		db "Color for high ping",0
_cstring_color_for_medium:		db "Color for medium ping",0
_cstring_color_for_low_pi:		db "Color for low ping",0
_cstring_background_color:		db "Background color of ping",0
_cstring_scroll_step_amou:		db "Scroll step amount for the scoreboard",0
_cstring_cg_scoreboardscr:		db "cg_scoreboardScrollStep",0
_cstring_banner_height_of:		db "Banner height of the scoreboard",0
_cstring_cg_scoreboardban:		db "cg_scoreboardBannerHeight",0
_cstring_item_height_of_e:		db "Item height of each item",0
_cstring_cg_scoreboardite:		db "cg_scoreboardItemHeight",0
_cstring_width_of_the_pin:		db "Width of the ping graph as a % of the scoreboard",0
_cstring_cg_scoreboardpin:		db "cg_scoreboardPingWidth",0
_cstring_height_of_the_pi:		db "Height of the ping graph as a % of the scoreboard row height",0
_cstring_cg_scoreboardpin1:		db "cg_scoreboardPingHeight",0
_cstring_width_of_the_sco:		db "Width of the scoreboard",0
_cstring_cg_scoreboardwid:		db "cg_scoreboardWidth",0
_cstring_height_of_the_sc:		db "Height of the scoreboard",0
_cstring_cg_scoreboardhei:		db "cg_scoreboardHeight",0
_cstring_the_local_player:		db "The local player",27h,"s font color when shown in scoreboard",0
_cstring_cg_scoreboardmyc:		db "cg_scoreboardMyColor",0
_cstring_scoreboard_text_:		db "Scoreboard text offset",0
_cstring_cg_scoreboardtex:		db "cg_scoreboardTextOffset",0
_cstring_scoreboard_font_:		db "Scoreboard font enum ( see menudefinition.h )",0
_cstring_cg_scoreboardfon:		db "cg_scoreboardFont",0
_cstring_scoreboard_heade:		db "Scoreboard header font scale",0
_cstring_cg_scoreboardhea:		db "cg_scoreboardHeaderFontScale",0
_cstring_whether_to_show_:		db "Whether to show numeric ping value",0
_cstring_cg_scoreboardpin2:		db "cg_scoreboardPingText",0
_cstring_whether_to_show_1:		db "Whether to show graphical ping",0
_cstring_cg_scoreboardpin3:		db "cg_scoreboardPingGraph",0
_cstring_scale_of_rank_fo:		db "Scale of rank font",0
_cstring_cg_scoreboardran:		db "cg_scoreboardRankFontScale",0
_cstring_cgame_sb_score:		db "CGAME_SB_SCORE",0
_cstring_cgame_sb_kills:		db "CGAME_SB_KILLS",0
_cstring_cgame_sb_assists:		db "CGAME_SB_ASSISTS",0
_cstring_cgame_sb_deaths:		db "CGAME_SB_DEATHS",0
_cstring_cgame_sb_ping:		db "CGAME_SB_PING",0



;All constant floats and doubles:
SECTION .rdata
_float_0_02500000:		dd 0x3ccccccd	; 0.025
_float_0_20000000:		dd 0x3e4ccccd	; 0.2
_float_0_50000000:		dd 0x3f000000	; 0.5
_float_4_00000000:		dd 0x40800000	; 4
_float_480_00000000:		dd 0x43f00000	; 480
_float_3_00000000:		dd 0x40400000	; 3
_float_2_00000000:		dd 0x40000000	; 2
_float_14_00000000:		dd 0x41600000	; 14
_float_1_00000000:		dd 0x3f800000	; 1
_float_8_00000000:		dd 0x41000000	; 8
_float_0_34999999:		dd 0x3eb33333	; 0.35
_float_0_25000000:		dd 0x3e800000	; 0.25
_float_0_85000002:		dd 0x3f59999a	; 0.85
_float_0_01000000:		dd 0x3c23d70a	; 0.01
_float_6_00000000:		dd 0x40c00000	; 6
_float__0_50000000:		dd 0xbf000000	; -0.5
_float_24_00000000:		dd 0x41c00000	; 24
_float_15_00000000:		dd 0x41700000	; 15
_float_0_00000000:		dd 0x0	; 0
_float_18_00000000:		dd 0x41900000	; 18
_float_16_00000000:		dd 0x41800000	; 16

