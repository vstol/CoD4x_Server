;Imports of cm_staticmodel:
	extern Hunk_AllocInternal
	extern XModelPrecache
	extern XModelTraceLine
	extern MatrixTransposeTransformVector

;Exports of cm_staticmodel:
	global CM_Hunk_AllocXModelColl
	global CM_XModelPrecache
	global CM_Hunk_AllocXModel
	global CM_TraceStaticModel
	global CM_TraceStaticModelComplete


SECTION .text


;CM_Hunk_AllocXModelColl(int)
CM_Hunk_AllocXModelColl:
	push ebp
	mov ebp, esp
	pop ebp
	jmp Hunk_AllocInternal
	nop


;CM_XModelPrecache(char const*)
CM_XModelPrecache:
	push ebp
	mov ebp, esp
	sub esp, 0x18
	mov dword [esp+0x8], CM_Hunk_AllocXModelColl
	mov dword [esp+0x4], CM_Hunk_AllocXModel
	mov eax, [ebp+0x8]
	mov [esp], eax
	call XModelPrecache
	leave
	ret
	nop


;CM_Hunk_AllocXModel(int)
CM_Hunk_AllocXModel:
	push ebp
	mov ebp, esp
	pop ebp
	jmp Hunk_AllocInternal
	nop


;CM_TraceStaticModel(cStaticModel_s*, trace_t*, float const*, float const*, int)
CM_TraceStaticModel:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x5c
	mov edx, [ebp+0x8]
	mov edi, [ebp+0xc]
	mov eax, [ebp+0x10]
	mov ecx, [ebp+0x14]
	movss xmm2, dword [eax]
	subss xmm2, [edx+0x8]
	movss xmm3, dword [eax+0x4]
	subss xmm3, [edx+0xc]
	movss xmm4, dword [eax+0x8]
	subss xmm4, [edx+0x10]
	lea esi, [edx+0x14]
	lea eax, [edx+0x20]
	lea ebx, [edx+0x2c]
	movaps xmm0, xmm2
	mulss xmm0, [edx+0x14]
	movaps xmm1, xmm3
	mulss xmm1, [edx+0x20]
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mulss xmm1, [edx+0x2c]
	addss xmm0, xmm1
	movss [ebp-0x30], xmm0
	movaps xmm0, xmm2
	mulss xmm0, [esi+0x4]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mulss xmm1, [ebx+0x4]
	addss xmm0, xmm1
	movss [ebp-0x2c], xmm0
	mulss xmm2, [esi+0x8]
	mulss xmm3, [eax+0x8]
	addss xmm2, xmm3
	mulss xmm4, [ebx+0x8]
	addss xmm2, xmm4
	movss [ebp-0x28], xmm2
	movss xmm2, dword [ecx]
	subss xmm2, [edx+0x8]
	movss xmm3, dword [ecx+0x4]
	subss xmm3, [edx+0xc]
	movss xmm4, dword [ecx+0x8]
	subss xmm4, [edx+0x10]
	movaps xmm0, xmm2
	mulss xmm0, [edx+0x14]
	movaps xmm1, xmm3
	mulss xmm1, [edx+0x20]
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mulss xmm1, [edx+0x2c]
	addss xmm0, xmm1
	movss [ebp-0x24], xmm0
	movaps xmm0, xmm2
	mulss xmm0, [esi+0x4]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mulss xmm1, [ebx+0x4]
	addss xmm0, xmm1
	movss [ebp-0x20], xmm0
	mulss xmm2, [esi+0x8]
	mulss xmm3, [eax+0x8]
	addss xmm2, xmm3
	mulss xmm4, [ebx+0x8]
	addss xmm2, xmm4
	movss [ebp-0x1c], xmm2
	mov eax, [ebp+0x18]
	mov [esp+0x10], eax
	lea eax, [ebp-0x24]
	mov [esp+0xc], eax
	lea eax, [ebp-0x30]
	mov [esp+0x8], eax
	mov [esp+0x4], edi
	mov eax, [edx+0x4]
	mov [esp], eax
	call XModelTraceLine
	test eax, eax
	js CM_TraceStaticModel_10
	mov dword [edi+0x1c], 0x1
	mov word [edi+0x20], 0x3fe
	lea ebx, [edi+0x4]
	lea eax, [ebp-0x3c]
	mov [esp+0x8], eax
	mov [esp+0x4], esi
	mov [esp], ebx
	call MatrixTransposeTransformVector
	movss xmm3, dword [ebp-0x3c]
	movss xmm0, dword [ebp-0x38]
	movss xmm2, dword [ebp-0x34]
	movaps xmm1, xmm3
	mulss xmm1, xmm3
	mulss xmm0, xmm0
	addss xmm1, xmm0
	mulss xmm2, xmm2
	addss xmm1, xmm2
	sqrtss xmm1, xmm1
	movaps xmm0, xmm1
	xorps xmm0, [_data16_80000000]
	ucomiss xmm0, [_float_0_00000000]
	jb CM_TraceStaticModel_20
	movss xmm0, dword [_float_1_00000000]
CM_TraceStaticModel_30:
	movaps xmm2, xmm0
	mulss xmm2, xmm3
	movss [ebp-0x3c], xmm2
	movaps xmm1, xmm0
	mulss xmm1, [ebp-0x38]
	movss [ebp-0x38], xmm1
	mulss xmm0, [ebp-0x34]
	movss [ebp-0x34], xmm0
	movss [ebx], xmm2
	movss [ebx+0x4], xmm1
	movss [ebx+0x8], xmm0
CM_TraceStaticModel_10:
	add esp, 0x5c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_TraceStaticModel_20:
	movss xmm0, dword [_float_1_00000000]
	divss xmm0, xmm1
	jmp CM_TraceStaticModel_30
	nop


;CM_TraceStaticModelComplete(cStaticModel_s*, float const*, float const*, int)
CM_TraceStaticModelComplete:
	push ebp
	mov ebp, esp
	push esi
	push ebx
	sub esp, 0x70
	mov edx, [ebp+0x8]
	mov eax, [ebp+0xc]
	mov ebx, [ebp+0x10]
	movss xmm2, dword [eax]
	subss xmm2, [edx+0x8]
	movss xmm3, dword [eax+0x4]
	subss xmm3, [edx+0xc]
	movss xmm4, dword [eax+0x8]
	subss xmm4, [edx+0x10]
	lea eax, [edx+0x14]
	lea ecx, [edx+0x20]
	lea esi, [edx+0x2c]
	movaps xmm0, xmm2
	mulss xmm0, [edx+0x14]
	movaps xmm1, xmm3
	mulss xmm1, [edx+0x20]
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mulss xmm1, [edx+0x2c]
	addss xmm0, xmm1
	movss [ebp-0x20], xmm0
	movaps xmm0, xmm2
	mulss xmm0, [eax+0x4]
	movaps xmm1, xmm3
	mulss xmm1, [ecx+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mulss xmm1, [esi+0x4]
	addss xmm0, xmm1
	movss [ebp-0x1c], xmm0
	mulss xmm2, [eax+0x8]
	mulss xmm3, [ecx+0x8]
	addss xmm2, xmm3
	mulss xmm4, [esi+0x8]
	addss xmm2, xmm4
	movss [ebp-0x18], xmm2
	movss xmm2, dword [ebx]
	subss xmm2, [edx+0x8]
	movss xmm3, dword [ebx+0x4]
	subss xmm3, [edx+0xc]
	movss xmm4, dword [ebx+0x8]
	subss xmm4, [edx+0x10]
	movaps xmm0, xmm2
	mulss xmm0, [edx+0x14]
	movaps xmm1, xmm3
	mulss xmm1, [edx+0x20]
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mulss xmm1, [edx+0x2c]
	addss xmm0, xmm1
	movss [ebp-0x14], xmm0
	movaps xmm0, xmm2
	mulss xmm0, [eax+0x4]
	movaps xmm1, xmm3
	mulss xmm1, [ecx+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mulss xmm1, [esi+0x4]
	addss xmm0, xmm1
	movss [ebp-0x10], xmm0
	mulss xmm2, [eax+0x8]
	mulss xmm3, [ecx+0x8]
	addss xmm2, xmm3
	mulss xmm4, [esi+0x8]
	addss xmm2, xmm4
	movss [ebp-0xc], xmm2
	mov dword [ebp-0x4c], 0x3f800000
	mov eax, [ebp+0x14]
	mov [esp+0x10], eax
	lea eax, [ebp-0x14]
	mov [esp+0xc], eax
	lea eax, [ebp-0x20]
	mov [esp+0x8], eax
	lea eax, [ebp-0x4c]
	mov [esp+0x4], eax
	mov eax, [edx+0x4]
	mov [esp], eax
	call XModelTraceLine
	shr eax, 0x1f
	add esp, 0x70
	pop ebx
	pop esi
	pop ebp
	ret


;Initialized global or static variables of cm_staticmodel:
SECTION .data


;Initialized constant data of cm_staticmodel:
SECTION .rdata


;Zero initialized global or static variables of cm_staticmodel:
SECTION .bss


;All cstrings:
SECTION .rdata



;All constant floats and doubles:
SECTION .rdata
_data16_80000000:		dd 0x80000000, 0x0, 0x0, 0x0	; OWORD
_float_0_00000000:		dd 0x0	; 0
_float_1_00000000:		dd 0x3f800000	; 1

