;Imports of cg_playerstate:
	extern cgArray
	extern memcpy
	extern memset
	extern CG_ClearCameraShakes
	extern CL_SetStance
	extern CL_SetADS
	extern CG_SetEquippedOffHand
	extern CG_ResetLowHealthOverlay
	extern CG_HoldBreathInit
	extern CG_EntityEvent
	extern bg_viewKickScale
	extern bg_viewKickMin
	extern bg_viewKickMax
	extern AngleVectors
	extern cg_hudDamageIconTime
	extern randomf
	extern AngleNormalize360
	extern CG_MenuShowNotify

;Exports of cg_playerstate:
	global CG_Respawn
	global CG_TransitionPlayerState
	global CG_ExtractTransPlayerState


SECTION .text


;CG_Respawn(int)
CG_Respawn:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x2c
	mov eax, [ebp+0x8]
	mov [ebp-0x1c], eax
	mov ebx, cgArray
	lea edx, [ebx+0x4613c]
	mov eax, [ebx+0x20]
	add eax, 0xc
	mov dword [esp+0x8], 0x2f64
	mov [esp+0x4], eax
	mov [esp], edx
	call memcpy
	mov eax, [ebx+0x46224]
	mov [ebx+0x5036c], eax
	mov eax, [ebx+0x46128]
	mov [ebx+0x50370], eax
	mov eax, [ebx+0x4621c]
	mov [ebx+0x5037c], eax
	mov dword [ebx+0x50308], 0x0
	mov dword [ebx+0x5030c], 0x0
	mov dword [ebx+0x50358], 0x0
	xor esi, esi
	mov [ebx+0x4d378], esi
	mov [ebx+0x4d37c], esi
	mov [ebx+0x4d380], esi
	mov [ebx+0x4d384], esi
	mov [ebx+0x4d388], esi
	mov [ebx+0x4d38c], esi
	mov [ebx+0x4d390], esi
	mov [ebx+0x4d394], esi
	mov [ebx+0x4d398], esi
	mov [ebx+0x5041c], esi
	mov [ebx+0x50420], esi
	mov [ebx+0x50424], esi
	mov [ebx+0x50410], esi
	mov [ebx+0x50414], esi
	mov [ebx+0x50418], esi
	mov [ebx+0x5040c], esi
	lea edi, [ebx+0x4927c]
	cld
	mov ecx, 0xc
	xor eax, eax
	rep stosd
	mov dword [ebx+0x503e0], 0x0
	mov [ebx+0x50400], esi
	mov [ebx+0x50404], esi
	mov [ebx+0x50448], esi
	mov [ebx+0x5044c], esi
	mov [ebx+0x50450], esi
	mov [ebx+0x50454], esi
	mov [ebx+0x50458], esi
	mov [ebx+0x5045c], esi
	lea eax, [ebx+0x50380]
	mov dword [esp+0x8], 0x60
	mov dword [esp+0x4], 0x0
	mov [esp], eax
	call memset
	mov eax, [ebp-0x1c]
	mov [esp], eax
	call CG_ClearCameraShakes
	mov [ebx+0x492b0], esi
	mov [ebx+0x492b4], esi
	mov [ebx+0x492b8], esi
	mov dword [ebx+0x50528], 0x0
	mov dword [esp+0x4], 0x0
	mov eax, [ebp-0x1c]
	mov [esp], eax
	call CL_SetStance
	mov dword [esp+0x4], 0x0
	mov eax, [ebp-0x1c]
	mov [esp], eax
	call CL_SetADS
	mov eax, [ebx+0x4621c]
	mov [esp+0x4], eax
	mov eax, [ebp-0x1c]
	mov [esp], eax
	call CG_SetEquippedOffHand
	mov [esp], ebx
	call CG_ResetLowHealthOverlay
	mov [ebx+0x49290], esi
	mov dword [ebx+0x503f4], 0x0
	mov dword [ebx+0x492c4], 0x7f7fffff
	mov [ebp+0x8], ebx
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	jmp CG_HoldBreathInit


;CG_TransitionPlayerState(int, playerState_s*, transPlayerState_t const*)
CG_TransitionPlayerState:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x7c
	mov edx, [ebp+0xc]
	mov eax, [edx+0x138]
	mov ecx, [ebp+0x10]
	cmp eax, [ecx]
	jz CG_TransitionPlayerState_10
	mov eax, [edx+0x144]
	test eax, eax
	jnz CG_TransitionPlayerState_20
	mov edx, [ebp+0x10]
CG_TransitionPlayerState_110:
	mov esi, [edx+0x4]
	mov ecx, [ebp+0xc]
	mov eax, [ecx+0xb4]
	lea edx, [eax+0x40]
	lea ecx, [esi-0x100]
	cmp esi, edx
	cmovg esi, ecx
	lea ebx, [eax-0x4]
	lea edi, [esi-0x4]
	mov eax, cgArray
	add eax, 0x490a0
	mov [ebp-0x3c], eax
	jmp CG_TransitionPlayerState_30
CG_TransitionPlayerState_60:
	cmp ebx, edi
	jle CG_TransitionPlayerState_40
	mov eax, ebx
	and eax, 0x3
	mov ecx, [ebp+0xc]
	mov edx, [ecx+eax*4+0xb8]
	mov ecx, [ebp+0x10]
	cmp edx, [ecx+eax*4+0x8]
	jz CG_TransitionPlayerState_40
	mov ecx, [ebp+0xc]
CG_TransitionPlayerState_70:
	movzx eax, byte [ecx+eax*4+0xc8]
	mov ecx, cgArray
	mov [ecx+0x49208], eax
	mov [esp+0x8], edx
	mov eax, [ebp-0x3c]
	mov [esp+0x4], eax
	mov edx, [ebp+0x8]
	mov [esp], edx
	call CG_EntityEvent
CG_TransitionPlayerState_40:
	add ebx, 0x1
	mov ecx, [ebp+0xc]
	cmp [ecx+0xb4], ebx
	jle CG_TransitionPlayerState_50
CG_TransitionPlayerState_30:
	cmp esi, ebx
	jg CG_TransitionPlayerState_60
	mov eax, ebx
	and eax, 0x3
	mov ecx, [ebp+0xc]
	mov edx, [ecx+eax*4+0xb8]
	jmp CG_TransitionPlayerState_70
CG_TransitionPlayerState_20:
	mov ecx, [edx+0x140]
	mov edx, [edx+0x13c]
	cvtsi2ss xmm5, eax
	mov eax, bg_viewKickScale
	mov eax, [eax]
	mulss xmm5, [eax+0xc]
	mov eax, bg_viewKickMin
	mov eax, [eax]
	movss xmm0, dword [eax+0xc]
	ucomiss xmm0, xmm5
	ja CG_TransitionPlayerState_80
	mov eax, bg_viewKickMax
	mov eax, [eax]
	movss xmm0, dword [eax+0xc]
	minss xmm0, xmm5
CG_TransitionPlayerState_80:
	movaps xmm5, xmm0
	cmp edx, 0xff
	jz CG_TransitionPlayerState_90
CG_TransitionPlayerState_120:
	cvtsi2ss xmm6, edx
	movss xmm2, dword [_float_255_00000000]
	divss xmm6, xmm2
	movss xmm1, dword [_float_360_00000000]
	mulss xmm6, xmm1
	cvtsi2ss xmm0, ecx
	divss xmm0, xmm2
	mulss xmm0, xmm1
	movss [ebp-0x30], xmm0
	movss [ebp-0x2c], xmm6
	mov dword [ebp-0x28], 0x0
	mov dword [esp+0xc], 0x0
	mov dword [esp+0x8], 0x0
	lea eax, [ebp-0x24]
	mov [esp+0x4], eax
	lea eax, [ebp-0x30]
	mov [esp], eax
	movss [ebp-0x58], xmm5
	movss [ebp-0x68], xmm6
	call AngleVectors
	movss xmm2, dword [ebp-0x24]
	movss xmm3, dword [ebp-0x20]
	mov ecx, cgArray
	add ecx, 0x492fc
	movss xmm4, dword [ebp-0x1c]
	mov ebx, cgArray
	add ebx, 0x49300
	mov eax, cgArray
	add eax, 0x492f0
	mov edx, cgArray
	add edx, 0x492f4
	mov edi, cgArray
	movaps xmm1, xmm2
	mulss xmm1, [edi+0x492ec]
	movaps xmm0, xmm3
	mulss xmm0, [eax]
	addss xmm1, xmm0
	movaps xmm0, xmm4
	mulss xmm0, [edx]
	addss xmm1, xmm0
	mulss xmm2, [edi+0x492f8]
	mulss xmm3, [ecx]
	addss xmm2, xmm3
	mulss xmm4, [ebx]
	addss xmm2, xmm4
	movss xmm5, dword [ebp-0x58]
	movaps xmm0, xmm5
	xorps xmm0, [_data16_80000000]
	mulss xmm2, xmm0
	movss [edi+0x50404], xmm2
	mulss xmm1, xmm5
	movss [edi+0x50400], xmm1
	xor ebx, ebx
	mov ecx, 0x1
	mov esi, edi
	movss xmm6, dword [ebp-0x68]
CG_TransitionPlayerState_100:
	lea edx, [ebx+ebx*2]
	mov eax, [esi+0x5038c]
	cmp eax, [edi+edx*4+0x50380]
	cmovl ebx, ecx
	add ecx, 0x1
	add esi, 0xc
	cmp ecx, 0x8
	jnz CG_TransitionPlayerState_100
	lea ebx, [ebx+ebx*2]
	lea ebx, [edi+ebx*4]
	mov eax, [edi+0x20]
	mov eax, [eax+0x8]
	mov [ebx+0x50380], eax
	mov eax, cg_hudDamageIconTime
	mov eax, [eax]
	mov eax, [eax+0xc]
	mov [ebx+0x50384], eax
	movss [ebp-0x68], xmm6
	call randomf
	fstp dword [ebp-0x6c]
	movss xmm0, dword [ebp-0x6c]
	subss xmm0, [_float_0_50000000]
	mulss xmm0, [_float_20_00000000]
	movss xmm6, dword [ebp-0x68]
	addss xmm6, xmm0
	movss [esp], xmm6
	call AngleNormalize360
	fstp dword [ebx+0x50388]
	mov edi, cgArray
CG_TransitionPlayerState_130:
	mov eax, [edi+0x46128]
	add eax, 0x1f4
	mov [edi+0x503fc], eax
	mov eax, [edi+0x20]
	mov eax, [eax+0x8]
	mov [edi+0x503e0], eax
	mov dword [esp+0x4], 0x0
	mov eax, [ebp+0x8]
	mov [esp], eax
	call CG_MenuShowNotify
	mov edx, [ebp+0x10]
	jmp CG_TransitionPlayerState_110
CG_TransitionPlayerState_50:
	mov eax, esi
	add esp, 0x7c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CG_TransitionPlayerState_10:
	mov edx, ecx
	jmp CG_TransitionPlayerState_110
CG_TransitionPlayerState_90:
	cmp ecx, 0xff
	jnz CG_TransitionPlayerState_120
	mov edi, cgArray
	mov dword [edi+0x50404], 0x0
	xorps xmm5, [_data16_80000000]
	movss [edi+0x50400], xmm5
	jmp CG_TransitionPlayerState_130
	add [eax], al


;CG_ExtractTransPlayerState(playerState_s const*, transPlayerState_t*)
CG_ExtractTransPlayerState:
	push ebp
	mov ebp, esp
	push esi
	push ebx
	mov edx, [ebp+0x8]
	mov ecx, [ebp+0xc]
	mov eax, [edx+0x138]
	mov [ecx], eax
	mov eax, [edx+0xb4]
	mov [ecx+0x4], eax
	lea esi, [ecx+0x8]
	lea ebx, [edx+0xb8]
	mov eax, [edx+0xb8]
	mov [ecx+0x8], eax
	mov eax, [ebx+0x4]
	mov [esi+0x4], eax
	mov eax, [ebx+0x8]
	mov [esi+0x8], eax
	mov eax, [ebx+0xc]
	mov [esi+0xc], eax
	pop ebx
	pop esi
	pop ebp
	ret


;Initialized global or static variables of cg_playerstate:
SECTION .data


;Initialized constant data of cg_playerstate:
SECTION .rdata


;Zero initialized global or static variables of cg_playerstate:
SECTION .bss


;All cstrings:
SECTION .rdata



;All constant floats and doubles:
SECTION .rdata
_float_255_00000000:		dd 0x437f0000	; 255
_float_360_00000000:		dd 0x43b40000	; 360
_data16_80000000:		dd 0x80000000, 0x0, 0x0, 0x0	; OWORD
_float_0_50000000:		dd 0x3f000000	; 0.5
_float_20_00000000:		dd 0x41a00000	; 20

