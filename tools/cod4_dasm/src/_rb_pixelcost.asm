;Imports of rb_pixelcost:
	extern gfxAssets
	extern R_AcquireGpuFenceLock
	extern R_FinishGpuFence
	extern R_InsertGpuFence
	extern R_ReleaseGpuFenceLock
	extern msecPerRawTimerTick
	extern WinSleep
	extern ceil
	extern rgp

;Exports of rb_pixelcost:
	global pixelCostGlob
	global RB_PixelCost_GetCostForRecordIndex
	global RB_PixelCost_Init
	global R_PixelCost_EndSurface
	global R_PixelCost_BeginSurface
	global RB_PixelCost_OverrideRenderTarget
	global R_PixelCost_GetAccumulationMaterial
	global pixelCostMode


SECTION .text


;RB_PixelCost_GetCostForRecordIndex(int)
RB_PixelCost_GetCostForRecordIndex:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x4c
	shl eax, 0x5
	lea edx, [eax+pixelCostGlob+0x28]
	mov dword [ebp-0x4c], 0x0
	xor esi, esi
	mov ebx, 0xc
RB_PixelCost_GetCostForRecordIndex_20:
	movzx eax, word [edx]
	movzx ecx, ax
	test ax, ax
	jz RB_PixelCost_GetCostForRecordIndex_10
	add [ebp-0x4c], ecx
	mov [ebp+esi*4-0x48], ecx
	add esi, 0x1
RB_PixelCost_GetCostForRecordIndex_10:
	add edx, 0x2
	sub ebx, 0x1
	jnz RB_PixelCost_GetCostForRecordIndex_20
	cmp esi, 0x1
	jz RB_PixelCost_GetCostForRecordIndex_30
	cmp esi, 0x2
	jz RB_PixelCost_GetCostForRecordIndex_40
	mov eax, [ebp-0x4c]
	cdq
	idiv esi
	mov edi, eax
	mov ecx, eax
	pxor xmm1, xmm1
	test esi, esi
	jle RB_PixelCost_GetCostForRecordIndex_50
	xor edx, edx
	pxor xmm1, xmm1
RB_PixelCost_GetCostForRecordIndex_60:
	mov eax, [ebp+edx*4-0x48]
	sub eax, edi
	cvtsi2sd xmm0, eax
	mulsd xmm0, xmm0
	addsd xmm1, xmm0
	add edx, 0x1
	cmp edx, esi
	jnz RB_PixelCost_GetCostForRecordIndex_60
RB_PixelCost_GetCostForRecordIndex_50:
	cvtsi2sd xmm0, esi
	divsd xmm1, xmm0
	sqrtsd xmm0, xmm1
	mulsd xmm0, [_double_1_50000000]
	cvttsd2si edx, xmm0
	cmp edx, 0xa
	mov eax, 0xa
	cmovle edx, eax
	mov eax, esi
	sub eax, 0x1
	js RB_PixelCost_GetCostForRecordIndex_70
	cvtsi2sd xmm1, edx
	lea ecx, [ebp+eax*4-0x48]
	xor ebx, ebx
	mov [ebp-0x50], esi
	jmp RB_PixelCost_GetCostForRecordIndex_80
RB_PixelCost_GetCostForRecordIndex_110:
	cvtsi2sd xmm0, eax
	ucomisd xmm0, xmm1
	jbe RB_PixelCost_GetCostForRecordIndex_90
	sub [ebp-0x4c], edx
	sub esi, 0x1
RB_PixelCost_GetCostForRecordIndex_90:
	add ebx, 0x1
	sub ecx, 0x4
	cmp [ebp-0x50], ebx
	jz RB_PixelCost_GetCostForRecordIndex_100
RB_PixelCost_GetCostForRecordIndex_80:
	mov edx, [ecx]
	mov eax, edx
	sub eax, edi
	jns RB_PixelCost_GetCostForRecordIndex_110
	neg eax
	jmp RB_PixelCost_GetCostForRecordIndex_110
RB_PixelCost_GetCostForRecordIndex_100:
	mov eax, [ebp-0x4c]
	cdq
	idiv esi
	mov ecx, eax
RB_PixelCost_GetCostForRecordIndex_70:
	mov [ebp-0x4c], ecx
	mov eax, ecx
	add esp, 0x4c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
RB_PixelCost_GetCostForRecordIndex_40:
	mov eax, [ebp-0x44]
	mov edx, [ebp-0x48]
	cmp eax, edx
	cmovle eax, edx
	sub [ebp-0x4c], eax
	mov eax, [ebp-0x4c]
	add esp, 0x4c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
RB_PixelCost_GetCostForRecordIndex_30:
	mov eax, [ebp-0x4c]
	add esp, 0x4c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	nop
	add [eax], al


;RB_PixelCost_Init()
RB_PixelCost_Init:
	push ebp
	mov ebp, esp
	pop ebp
	ret
	nop


;R_PixelCost_EndSurface(GfxCmdBufContext)
R_PixelCost_EndSurface:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x7c
	mov edi, [ebp+0x8]
	mov eax, [pixelCostMode]
	cmp eax, 0x1
	jz R_PixelCost_EndSurface_10
	cmp eax, 0x2
	jz R_PixelCost_EndSurface_20
	add dword [pixelCostGlob+0x24], 0x1
	add esp, 0x7c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_PixelCost_EndSurface_10:
	mov ebx, gfxAssets
	mov eax, [ebx]
	mov edx, [eax]
	mov dword [esp+0x4], 0x1
	mov [esp], eax
	call dword [edx+0x18]
	call R_AcquireGpuFenceLock
	call R_FinishGpuFence
	call R_InsertGpuFence
	call R_FinishGpuFence
	call R_ReleaseGpuFenceLock
	rdtsc
	xor edx, edx
	sub eax, [pixelCostGlob+0xc]
	sbb edx, [pixelCostGlob+0x10]
	movd xmm1, eax
	movd xmm0, edx
	punpckldq xmm0, xmm1
	punpckldq xmm0, [_data16_45300000]
	subpd xmm0, [_data16_0]
	movapd [ebp-0x38], xmm0
	movapd xmm2, xmm0
	movhpd [ebp-0x38], xmm0
	addpd xmm2, [ebp-0x38]
	movapd [ebp-0x38], xmm2
	mov eax, msecPerRawTimerTick
	movsd xmm0, qword [ebp-0x38]
	mulsd xmm0, [eax]
	subsd xmm0, [pixelCostGlob+0x4]
	pxor xmm2, xmm2
	movapd xmm1, xmm0
	cmpsd xmm1, xmm2, 0x5
	andpd xmm0, xmm1
	orpd xmm0, xmm2
	movsd [pixelCostGlob+0x14], xmm0
	mov ebx, [ebx]
	lea esi, [ebp-0x1c]
	jmp R_PixelCost_EndSurface_30
R_PixelCost_EndSurface_40:
	mov dword [esp], 0x0
	call WinSleep
R_PixelCost_EndSurface_30:
	mov eax, [ebx]
	mov dword [esp+0xc], 0x1
	mov dword [esp+0x8], 0x4
	mov [esp+0x4], esi
	mov [esp], ebx
	call dword [eax+0x1c]
	cmp eax, 0x1
	jz R_PixelCost_EndSurface_40
	test eax, eax
	js R_PixelCost_EndSurface_50
	mov eax, [ebp-0x1c]
	test eax, eax
	jnz R_PixelCost_EndSurface_60
R_PixelCost_EndSurface_100:
	mov ecx, 0x1
R_PixelCost_EndSurface_90:
	mov eax, [pixelCostGlob+0x24]
	mov edx, 0xffffffff
	cmp ecx, 0x10000
	cmovl edx, ecx
	shl eax, 0x4
	add eax, [pixelCostGlob+0x1c]
	mov [eax+eax+pixelCostGlob+0x28], dx
	add dword [pixelCostGlob+0x24], 0x1
	add esp, 0x7c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_PixelCost_EndSurface_20:
	call R_AcquireGpuFenceLock
	call R_FinishGpuFence
	call R_InsertGpuFence
	call R_FinishGpuFence
	call R_ReleaseGpuFenceLock
	rdtsc
	xor edx, edx
	sub eax, [pixelCostGlob+0xc]
	sbb edx, [pixelCostGlob+0x10]
	movd xmm1, eax
	movd xmm0, edx
	punpckldq xmm0, xmm1
	punpckldq xmm0, [_data16_45300000]
	subpd xmm0, [_data16_0]
	movapd [ebp-0x68], xmm0
	movapd xmm2, xmm0
	movhpd [ebp-0x68], xmm0
	addpd xmm2, [ebp-0x68]
	movapd [ebp-0x68], xmm2
	mov eax, msecPerRawTimerTick
	movsd xmm0, qword [ebp-0x68]
	mulsd xmm0, [eax]
	subsd xmm0, [pixelCostGlob+0x4]
	pxor xmm2, xmm2
	movapd xmm1, xmm0
	cmpsd xmm1, xmm2, 0x5
	andpd xmm0, xmm1
	orpd xmm0, xmm2
	movsd [pixelCostGlob+0x14], xmm0
	movsd xmm0, qword [_double_3932_10000000]
	mulsd xmm0, [pixelCostGlob+0x14]
	movsd [esp], xmm0
	call ceil
	fstp qword [ebp-0x70]
	cvttsd2si edx, qword [ebp-0x70]
	mov eax, [pixelCostGlob+0x24]
	mov ebx, [pixelCostGlob+0x1c]
	cmp edx, 0xfffe
	jle R_PixelCost_EndSurface_70
	mov ecx, 0xffffffff
R_PixelCost_EndSurface_80:
	shl eax, 0x4
	add eax, ebx
	mov [eax+eax+pixelCostGlob+0x28], cx
	add dword [pixelCostGlob+0x24], 0x1
	add esp, 0x7c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_PixelCost_EndSurface_70:
	mov ecx, 0x1
	cmp edx, 0x1
	cmovg ecx, edx
	jmp R_PixelCost_EndSurface_80
R_PixelCost_EndSurface_60:
	movd xmm1, eax
	pxor xmm0, xmm0
	punpckldq xmm0, xmm1
	punpckldq xmm0, [_data16_45300000]
	subpd xmm0, [_data16_0]
	movapd [ebp-0x48], xmm0
	movapd xmm1, xmm0
	movhpd [ebp-0x48], xmm0
	addpd xmm1, [ebp-0x48]
	movapd [ebp-0x48], xmm1
	movsd xmm1, qword [ebp-0x48]
R_PixelCost_EndSurface_110:
	mov eax, [edi+0xf68]
	imul eax, [edi+0xf6c]
	cvtsi2sd xmm0, eax
	mulsd xmm0, [pixelCostGlob+0x14]
	divsd xmm0, xmm1
	mulsd xmm0, [_double_30_72000000]
	movsd [esp], xmm0
	call ceil
	fstp qword [ebp-0x50]
	cvttsd2si ecx, qword [ebp-0x50]
	cmp ecx, 0x1
	jg R_PixelCost_EndSurface_90
	jmp R_PixelCost_EndSurface_100
R_PixelCost_EndSurface_50:
	movsd xmm1, qword [_double_4294967295_000000_double]
	jmp R_PixelCost_EndSurface_110


;R_PixelCost_BeginSurface(GfxCmdBufContext)
R_PixelCost_BeginSurface:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x2c
	mov dword [ebp-0x20], 0x0
	mov dword [ebp-0x1c], 0x0
	mov edi, [ebp+0x8]
	mov edx, [ebp+0xc]
	mov eax, [pixelCostMode]
	cmp eax, 0x1
	jz R_PixelCost_BeginSurface_10
	cmp eax, 0x2
	jz R_PixelCost_BeginSurface_20
	mov eax, [pixelCostGlob+0x24]
	call RB_PixelCost_GetCostForRecordIndex
	mov edx, eax
	mov eax, gfxAssets
	mov ebx, [eax]
	test ebx, ebx
	jz R_PixelCost_BeginSurface_30
	mov eax, edx
	sar eax, 0x6
	cvtsi2ss xmm5, eax
	movss xmm1, dword [_float_0_01000000]
	addss xmm5, xmm1
	movss xmm0, dword [_float_0_00392157]
	mulss xmm5, xmm0
	mov eax, edx
	sar eax, 0x4
	and eax, 0x3
	cvtsi2ss xmm4, eax
	addss xmm4, xmm1
	mulss xmm4, xmm0
	mov eax, edx
	sar eax, 0x2
	and eax, 0x3
	cvtsi2ss xmm3, eax
	addss xmm3, xmm1
	mulss xmm3, xmm0
	and edx, 0x3
	cvtsi2ss xmm2, edx
	addss xmm2, xmm1
	mulss xmm2, xmm0
R_PixelCost_BeginSurface_60:
	lea eax, [edi+0x9b0]
	movss [edi+0x9b0], xmm5
	movss [eax+0x4], xmm4
	movss [eax+0x8], xmm3
	movss [eax+0xc], xmm2
	add word [edi+0xe56], 0x1
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_PixelCost_BeginSurface_10:
	mov ebx, [edx+0xb8]
	mov esi, [edx+0xbc]
	mov ecx, [pixelCostGlob+0x24]
	shl ecx, 0x5
	mov eax, [ecx+pixelCostGlob+0x40]
	xor eax, ebx
	mov edx, [ecx+pixelCostGlob+0x44]
	xor edx, esi
	or eax, edx
	jnz R_PixelCost_BeginSurface_40
R_PixelCost_BeginSurface_80:
	add dword [pixelCostGlob+0x20], 0x1
	call R_AcquireGpuFenceLock
	call R_FinishGpuFence
	call R_InsertGpuFence
	call R_FinishGpuFence
	call R_ReleaseGpuFenceLock
	rdtsc
	mov [pixelCostGlob+0xc], eax
	mov dword [pixelCostGlob+0x10], 0x0
	mov eax, gfxAssets
	mov eax, [eax]
	mov edx, [eax]
	mov dword [esp+0x4], 0x2
	mov [esp], eax
	call dword [edx+0x18]
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_PixelCost_BeginSurface_20:
	mov eax, [edx+0xb8]
	mov [ebp-0x20], eax
	mov edx, [edx+0xbc]
	mov [ebp-0x1c], edx
	mov ecx, [pixelCostGlob+0x24]
	shl ecx, 0x5
	xor eax, [ecx+pixelCostGlob+0x40]
	xor edx, [ecx+pixelCostGlob+0x44]
	or eax, edx
	jnz R_PixelCost_BeginSurface_50
R_PixelCost_BeginSurface_70:
	add dword [pixelCostGlob+0x20], 0x1
	call R_AcquireGpuFenceLock
	call R_FinishGpuFence
	call R_InsertGpuFence
	call R_FinishGpuFence
	call R_ReleaseGpuFenceLock
	rdtsc
	mov [pixelCostGlob+0xc], eax
	mov dword [pixelCostGlob+0x10], 0x0
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_PixelCost_BeginSurface_30:
	movss xmm2, dword [_float_0_00396078]
	pxor xmm3, xmm3
	movss xmm4, dword [_float_0_03141177]
	movss xmm5, dword [_float_0_09415686]
	jmp R_PixelCost_BeginSurface_60
R_PixelCost_BeginSurface_50:
	mov edi, [pixelCostGlob+0x20]
	shl edi, 0x5
	add edi, pixelCostGlob+0x28
	mov eax, [ebp-0x20]
	mov edx, [ebp-0x1c]
	mov [edi+0x18], eax
	mov [edi+0x1c], edx
	cld
	mov ecx, 0x6
	xor eax, eax
	rep stosd
	jmp R_PixelCost_BeginSurface_70
R_PixelCost_BeginSurface_40:
	mov edi, [pixelCostGlob+0x20]
	shl edi, 0x5
	add edi, pixelCostGlob+0x28
	mov [edi+0x18], ebx
	mov [edi+0x1c], esi
	cld
	mov ecx, 0x6
	xor eax, eax
	rep stosd
	jmp R_PixelCost_BeginSurface_80
	add [eax], al


;RB_PixelCost_OverrideRenderTarget(GfxRenderTargetId)
RB_PixelCost_OverrideRenderTarget:
	push ebp
	mov ebp, esp
	mov edx, [ebp+0x8]
	cmp edx, 0x1
	jle RB_PixelCost_OverrideRenderTarget_10
	cmp edx, 0x8
	mov eax, 0x2
	cmovle edx, eax
	mov eax, edx
	pop ebp
	ret
RB_PixelCost_OverrideRenderTarget_10:
	mov edx, 0x1
	mov eax, edx
	pop ebp
	ret
	nop


;R_PixelCost_GetAccumulationMaterial(Material const*)
R_PixelCost_GetAccumulationMaterial:
	push ebp
	mov ebp, esp
	mov edx, [ebp+0x8]
	mov eax, [pixelCostMode]
	cmp eax, 0x4
	jz R_PixelCost_GetAccumulationMaterial_10
	cmp eax, 0x6
	jz R_PixelCost_GetAccumulationMaterial_10
	mov eax, [edx+0x40]
	mov eax, [eax+0x1c]
	test eax, eax
	jz R_PixelCost_GetAccumulationMaterial_20
	movzx eax, byte [edx+0x1c]
	lea ecx, [eax*8]
R_PixelCost_GetAccumulationMaterial_40:
	mov eax, [edx+0x4c]
	mov eax, [eax+ecx+0x4]
	and eax, 0xf
	cmp eax, 0xf
	ja R_PixelCost_GetAccumulationMaterial_30
	jmp dword [eax*4+R_PixelCost_GetAccumulationMaterial_jumptab_0]
R_PixelCost_GetAccumulationMaterial_10:
	mov eax, rgp
	mov eax, [eax+0x206c]
	pop ebp
	ret
R_PixelCost_GetAccumulationMaterial_30:
	mov eax, rgp
	mov eax, [eax+0x207c]
	pop ebp
	ret
R_PixelCost_GetAccumulationMaterial_20:
	xor ecx, ecx
	jmp R_PixelCost_GetAccumulationMaterial_40
R_PixelCost_GetAccumulationMaterial_60:
	mov eax, rgp
	mov eax, [eax+0x2074]
	pop ebp
	ret
R_PixelCost_GetAccumulationMaterial_80:
	mov eax, rgp
	mov eax, [eax+0x2078]
	pop ebp
	ret
R_PixelCost_GetAccumulationMaterial_50:
	mov eax, rgp
	mov eax, [eax+0x2068]
	pop ebp
	ret
R_PixelCost_GetAccumulationMaterial_70:
	mov eax, rgp
	mov eax, [eax+0x2070]
	pop ebp
	ret
	add [eax], al
	
	
R_PixelCost_GetAccumulationMaterial_jumptab_0:
	dd R_PixelCost_GetAccumulationMaterial_50
	dd R_PixelCost_GetAccumulationMaterial_50
	dd R_PixelCost_GetAccumulationMaterial_10
	dd R_PixelCost_GetAccumulationMaterial_10
	dd R_PixelCost_GetAccumulationMaterial_60
	dd R_PixelCost_GetAccumulationMaterial_60
	dd R_PixelCost_GetAccumulationMaterial_10
	dd R_PixelCost_GetAccumulationMaterial_10
	dd R_PixelCost_GetAccumulationMaterial_70
	dd R_PixelCost_GetAccumulationMaterial_70
	dd R_PixelCost_GetAccumulationMaterial_10
	dd R_PixelCost_GetAccumulationMaterial_10
	dd R_PixelCost_GetAccumulationMaterial_30
	dd R_PixelCost_GetAccumulationMaterial_80
	dd R_PixelCost_GetAccumulationMaterial_10
	dd R_PixelCost_GetAccumulationMaterial_10


;Initialized global or static variables of rb_pixelcost:
SECTION .data
pixelCostMode: dd 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0


;Initialized constant data of rb_pixelcost:
SECTION .rdata


;Zero initialized global or static variables of rb_pixelcost:
SECTION .bss
pixelCostGlob: resb 0x10080


;All cstrings:
SECTION .rdata



;All constant floats and doubles:
SECTION .rdata
_double_1_50000000:		dq 0x3ff8000000000000	; 1.5
_data16_45300000:		dd 0x45300000, 0x43300000, 0x0, 0x0	; OWORD
_data16_0:		dd 0x0, 0x45300000, 0x0, 0x43300000	; OWORD
_double_3932_10000000:		dq 0x40aeb83333333333	; 3932.1
_double_30_72000000:		dq 0x403eb851eb851eb8	; 30.72
_double_4294967295_000000_double:		dq 0x41efffffffe00000	; 4.29497e+09
_float_0_01000000:		dd 0x3c23d70a	; 0.01
_float_0_00392157:		dd 0x3b808081	; 0.00392157
_float_0_00396078:		dd 0x3b81c977	; 0.00396078
_float_0_03141177:		dd 0x3d00a9a0	; 0.0314118
_float_0_09415686:		dd 0x3dc0d550	; 0.0941569

