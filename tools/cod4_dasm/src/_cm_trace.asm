;Imports of cm_trace:
	extern cm
	extern CM_TraceBox
	extern CM_SightTraceThroughAabbTree
	extern Vec3NormalizeTo
	extern CM_TraceThroughAabbTree
	extern CM_CalcTraceExtents
	extern Sys_GetValue
	extern CM_MeshTestInLeaf
	extern CM_BoxLeafnums_r
	extern AnglesToAxis

;Exports of cm_trace:
	global CM_TestInLeafBrushNode_r
	global CM_SightTraceThroughBrush
	global CM_SightTraceThroughLeafBrushNode_r
	global CM_SightTraceThroughLeaf
	global CM_TraceThroughLeafBrushNode_r
	global CM_SightTraceThroughTree
	global CM_TraceThroughLeafBrushNode
	global CM_TraceSphereThroughSphere
	global CM_SightTraceSphereThroughSphere
	global CM_TraceThroughTree
	global CM_Trace
	global CM_BoxTrace
	global CM_TempBoxModel
	global CM_BoxSightTrace
	global CM_ContentsOfModel
	global CM_ClipHandleToModel
	global Trace_GetDynEntHitId
	global Trace_GetEntityHitId
	global CM_TransformedBoxTrace
	global CM_TransformedBoxSightTrace
	global CM_TransformedBoxTraceRotated
	global CM_TransformedBoxTraceExternal


SECTION .text


;CM_TestInLeafBrushNode_r(traceWork_t const*, cLeafBrushNode_s*, trace_t*)
CM_TestInLeafBrushNode_r:
CM_TestInLeafBrushNode_r_40:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x3c
	mov esi, eax
	mov ebx, edx
	mov edi, ecx
CM_TestInLeafBrushNode_r_80:
	mov edx, [esi+0x80]
	test [ebx+0x4], edx
	jz CM_TestInLeafBrushNode_r_10
CM_TestInLeafBrushNode_r_60:
	cmp word [ebx+0x2], 0x0
	jz CM_TestInLeafBrushNode_r_20
	jg CM_TestInLeafBrushNode_r_30
	lea edx, [ebx+0x14]
	mov ecx, edi
	mov eax, esi
	call CM_TestInLeafBrushNode_r_40
	cmp byte [edi+0x28], 0x0
	jnz CM_TestInLeafBrushNode_r_10
CM_TestInLeafBrushNode_r_20:
	movzx eax, byte [ebx]
	movss xmm1, dword [ebx+0x8]
	movss xmm0, dword [esi+eax*4+0x68]
	ucomiss xmm0, xmm1
	jbe CM_TestInLeafBrushNode_r_50
	movzx eax, word [ebx+0x10]
	lea eax, [eax+eax*4]
	lea ebx, [ebx+eax*4]
	mov edx, [esi+0x80]
	test [ebx+0x4], edx
	jnz CM_TestInLeafBrushNode_r_60
CM_TestInLeafBrushNode_r_10:
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_TestInLeafBrushNode_r_50:
	movss xmm0, dword [esi+eax*4+0x74]
	ucomiss xmm0, xmm1
	jae CM_TestInLeafBrushNode_r_70
CM_TestInLeafBrushNode_r_90:
	movzx eax, word [ebx+0x12]
	lea eax, [eax+eax*4]
	lea ebx, [ebx+eax*4]
	jmp CM_TestInLeafBrushNode_r_80
CM_TestInLeafBrushNode_r_70:
	movzx edx, word [ebx+0x10]
	lea edx, [edx+edx*4]
	lea edx, [ebx+edx*4]
	mov ecx, edi
	mov eax, esi
	call CM_TestInLeafBrushNode_r_40
	cmp byte [edi+0x28], 0x0
	jz CM_TestInLeafBrushNode_r_90
	jmp CM_TestInLeafBrushNode_r_10
CM_TestInLeafBrushNode_r_30:
	mov eax, [ebx+0x8]
	mov [ebp-0x28], eax
	cmp word [ebx+0x2], 0x0
	jle CM_TestInLeafBrushNode_r_10
	mov dword [ebp-0x2c], 0x0
	movss xmm3, dword [_data16_7fffffff]
CM_TestInLeafBrushNode_r_150:
	mov ecx, [ebp-0x2c]
	mov eax, [ebp-0x28]
	movzx ecx, word [eax+ecx*2]
	mov [ebp-0x3c], ecx
	lea ecx, [ecx+ecx*4]
	shl ecx, 0x4
	mov eax, cm
	add ecx, [eax+0x90]
	test [ecx+0xc], edx
	jz CM_TestInLeafBrushNode_r_100
	movss xmm0, dword [esi+0x68]
	ucomiss xmm0, [ecx+0x10]
	jae CM_TestInLeafBrushNode_r_110
	movss xmm0, dword [esi+0x6c]
	ucomiss xmm0, [ecx+0x14]
	jae CM_TestInLeafBrushNode_r_110
	movss xmm0, dword [esi+0x70]
	ucomiss xmm0, [ecx+0x18]
	jae CM_TestInLeafBrushNode_r_110
	movss xmm0, dword [ecx]
	ucomiss xmm0, [esi+0x74]
	jae CM_TestInLeafBrushNode_r_110
	movss xmm0, dword [ecx+0x4]
	ucomiss xmm0, [esi+0x78]
	jae CM_TestInLeafBrushNode_r_110
	movss xmm0, dword [ecx+0x8]
	ucomiss xmm0, [esi+0x7c]
	jae CM_TestInLeafBrushNode_r_110
	mov edx, [ecx+0x20]
	mov eax, [ecx+0x1c]
	mov [ebp-0x20], eax
	test eax, eax
	jz CM_TestInLeafBrushNode_r_120
	mov eax, [edx]
	movss xmm0, dword [esi+0x8c]
	movss [ebp-0x24], xmm0
	movss xmm7, dword [esi+0x88]
	movss xmm6, dword [esi]
	movss xmm5, dword [esi+0x4]
	movss xmm4, dword [esi+0x8]
	movaps xmm1, xmm6
	mulss xmm1, [eax]
	movaps xmm0, xmm5
	mulss xmm0, [eax+0x4]
	addss xmm1, xmm0
	movaps xmm0, xmm4
	mulss xmm0, [eax+0x8]
	addss xmm1, xmm0
	movss xmm0, dword [ebp-0x24]
	mulss xmm0, [eax+0x8]
	andps xmm0, xmm3
	movaps xmm2, xmm7
	addss xmm2, [eax+0xc]
	addss xmm0, xmm2
	subss xmm1, xmm0
	pxor xmm0, xmm0
	ucomiss xmm1, xmm0
	ja CM_TestInLeafBrushNode_r_110
	add edx, 0xc
	mov dword [ebp-0x1c], 0x0
	mov eax, [ebp-0x20]
	sub eax, 0x1
	mov [ebp-0x30], eax
	jmp CM_TestInLeafBrushNode_r_130
CM_TestInLeafBrushNode_r_140:
	mov eax, [edx]
	add dword [ebp-0x1c], 0x1
	add edx, 0xc
	movaps xmm1, xmm6
	mulss xmm1, [eax]
	movaps xmm0, xmm5
	mulss xmm0, [eax+0x4]
	addss xmm1, xmm0
	movaps xmm0, xmm4
	mulss xmm0, [eax+0x8]
	addss xmm1, xmm0
	movss xmm0, dword [ebp-0x24]
	mulss xmm0, [eax+0x8]
	andps xmm0, xmm3
	movaps xmm2, xmm7
	addss xmm2, [eax+0xc]
	addss xmm0, xmm2
	subss xmm1, xmm0
	pxor xmm0, xmm0
	ucomiss xmm1, xmm0
	ja CM_TestInLeafBrushNode_r_110
CM_TestInLeafBrushNode_r_130:
	mov eax, [ebp-0x1c]
	cmp [ebp-0x30], eax
	jnz CM_TestInLeafBrushNode_r_140
CM_TestInLeafBrushNode_r_120:
	mov byte [edi+0x29], 0x1
	mov byte [edi+0x28], 0x1
	mov dword [edi], 0x0
	mov eax, [ecx+0xc]
	mov [edi+0x14], eax
	mov dword [edi+0x10], 0x0
CM_TestInLeafBrushNode_r_110:
	cmp byte [edi+0x28], 0x0
	jnz CM_TestInLeafBrushNode_r_10
CM_TestInLeafBrushNode_r_100:
	add dword [ebp-0x2c], 0x1
	movsx eax, word [ebx+0x2]
	cmp [ebp-0x2c], eax
	jge CM_TestInLeafBrushNode_r_10
	mov edx, [esi+0x80]
	jmp CM_TestInLeafBrushNode_r_150


;CM_SightTraceThroughBrush(traceWork_t const*, cbrush_t*)
CM_SightTraceThroughBrush:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x3c
	mov ebx, eax
	mov [ebp-0x3c], edx
	pxor xmm7, xmm7
	movaps xmm5, xmm7
	movss xmm6, dword [_float_1_00000000]
	movss xmm4, dword [_float__1_00000000]
	xor edi, edi
	mov esi, edx
	add esi, 0x10
CM_SightTraceThroughBrush_60:
	mov eax, ebx
	mov ecx, 0x1
CM_SightTraceThroughBrush_40:
	movss xmm0, dword [edx+ecx*4-0x4]
	movss xmm1, dword [eax+0x90]
	movss xmm3, dword [eax]
	subss xmm3, xmm0
	mulss xmm3, xmm4
	subss xmm3, xmm1
	movss xmm2, dword [eax+0xc]
	subss xmm2, xmm0
	mulss xmm2, xmm4
	subss xmm2, xmm1
	ucomiss xmm3, xmm5
	jbe CM_SightTraceThroughBrush_10
	ucomiss xmm2, xmm5
	ja CM_SightTraceThroughBrush_20
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x18]
	mulss xmm1, xmm4
	ucomiss xmm1, xmm6
	jae CM_SightTraceThroughBrush_20
	movaps xmm0, xmm7
	subss xmm0, xmm1
	ucomiss xmm0, xmm5
	jb CM_SightTraceThroughBrush_30
CM_SightTraceThroughBrush_70:
	add ecx, 0x1
	add eax, 0x4
	cmp ecx, 0x4
	jnz CM_SightTraceThroughBrush_40
	test edi, edi
	jnz CM_SightTraceThroughBrush_50
	mov edx, esi
	mov di, 0x1
	movss xmm4, dword [_float_1_00000000]
	jmp CM_SightTraceThroughBrush_60
CM_SightTraceThroughBrush_10:
	pxor xmm0, xmm0
	ucomiss xmm2, xmm0
	jbe CM_SightTraceThroughBrush_70
	movaps xmm2, xmm3
	mulss xmm2, [eax+0x18]
	mulss xmm2, xmm4
	ucomiss xmm7, xmm2
	jae CM_SightTraceThroughBrush_20
	movaps xmm0, xmm2
	subss xmm0, xmm6
	pxor xmm1, xmm1
	cmpss xmm1, xmm0, 0x2
	movaps xmm0, xmm1
	movaps xmm1, xmm6
	andps xmm1, xmm0
	movaps xmm6, xmm0
	andnps xmm6, xmm2
	orps xmm6, xmm1
	jmp CM_SightTraceThroughBrush_70
CM_SightTraceThroughBrush_30:
	movaps xmm7, xmm1
	jmp CM_SightTraceThroughBrush_70
CM_SightTraceThroughBrush_50:
	mov eax, [ebp-0x3c]
	mov ecx, [eax+0x20]
	mov esi, [eax+0x1c]
	test esi, esi
	jz CM_SightTraceThroughBrush_80
	movss xmm0, dword [ebx+0x8c]
	movss [ebp-0x38], xmm0
	movss xmm1, dword [ebx+0x88]
	movss [ebp-0x34], xmm1
	movss xmm2, dword [ebx]
	movss [ebp-0x30], xmm2
	movss xmm0, dword [ebx+0x4]
	movss [ebp-0x2c], xmm0
	movss xmm1, dword [ebx+0x8]
	movss [ebp-0x28], xmm1
	lea eax, [ebx+0xc]
	movss xmm2, dword [ebx+0xc]
	movss [ebp-0x24], xmm2
	movss xmm0, dword [eax+0x4]
	movss [ebp-0x20], xmm0
	movss xmm1, dword [eax+0x8]
	movss [ebp-0x1c], xmm1
	xor edx, edx
	movss xmm5, dword [_data16_7fffffff]
	jmp CM_SightTraceThroughBrush_90
CM_SightTraceThroughBrush_120:
	movaps xmm1, xmm4
	subss xmm1, xmm0
	ucomiss xmm0, xmm2
	ja CM_SightTraceThroughBrush_20
	movaps xmm0, xmm7
	mulss xmm0, xmm1
	ucomiss xmm4, xmm0
	jbe CM_SightTraceThroughBrush_100
	movaps xmm7, xmm4
	divss xmm7, xmm1
	ucomiss xmm7, xmm6
	jae CM_SightTraceThroughBrush_20
CM_SightTraceThroughBrush_100:
	add ecx, 0xc
	add edx, 0x1
	cmp esi, edx
	jz CM_SightTraceThroughBrush_110
CM_SightTraceThroughBrush_90:
	mov eax, [ecx]
	movss xmm3, dword [ebp-0x38]
	mulss xmm3, [eax+0x8]
	andps xmm3, xmm5
	movss xmm0, dword [ebp-0x34]
	addss xmm0, [eax+0xc]
	addss xmm3, xmm0
	movss xmm1, dword [eax+0x4]
	movss xmm2, dword [eax+0x8]
	movss xmm4, dword [ebp-0x30]
	mulss xmm4, [eax]
	movss xmm0, dword [ebp-0x2c]
	mulss xmm0, xmm1
	addss xmm4, xmm0
	movss xmm0, dword [ebp-0x28]
	mulss xmm0, xmm2
	addss xmm4, xmm0
	subss xmm4, xmm3
	movss xmm0, dword [ebp-0x24]
	mulss xmm0, [eax]
	mulss xmm1, [ebp-0x20]
	addss xmm0, xmm1
	mulss xmm2, [ebp-0x1c]
	addss xmm0, xmm2
	subss xmm0, xmm3
	pxor xmm2, xmm2
	ucomiss xmm4, xmm2
	ja CM_SightTraceThroughBrush_120
	pxor xmm1, xmm1
	ucomiss xmm0, xmm1
	jbe CM_SightTraceThroughBrush_100
	movaps xmm1, xmm4
	subss xmm1, xmm0
	movaps xmm0, xmm6
	mulss xmm0, xmm1
	ucomiss xmm4, xmm0
	jbe CM_SightTraceThroughBrush_100
	movaps xmm6, xmm4
	divss xmm6, xmm1
	ucomiss xmm7, xmm6
	jb CM_SightTraceThroughBrush_100
CM_SightTraceThroughBrush_20:
	xor eax, eax
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_SightTraceThroughBrush_80:
	mov ecx, eax
CM_SightTraceThroughBrush_130:
	mov eax, cm
	sub ecx, [eax+0x90]
	sar ecx, 0x4
	lea eax, [ecx+ecx*2]
	mov edx, eax
	shl edx, 0x4
	add eax, edx
	mov edx, eax
	shl edx, 0x8
	add eax, edx
	mov edx, eax
	shl edx, 0x10
	add eax, edx
	lea eax, [ecx+eax*4+0x1]
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_SightTraceThroughBrush_110:
	mov ecx, [ebp-0x3c]
	jmp CM_SightTraceThroughBrush_130


;CM_SightTraceThroughLeafBrushNode_r(traceWork_t const*, cLeafBrushNode_s*, float const*, float const*)
CM_SightTraceThroughLeafBrushNode_r:
CM_SightTraceThroughLeafBrushNode_r_40:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x6c
	mov esi, eax
	mov ebx, edx
	mov edi, [ebp+0x8]
	mov eax, [ecx]
	mov [ebp-0x24], eax
	mov eax, [ecx+0x4]
	mov [ebp-0x20], eax
	mov eax, [ecx+0x8]
	mov [ebp-0x1c], eax
CM_SightTraceThroughLeafBrushNode_r_90:
	mov ecx, [esi+0x80]
	test [ebx+0x4], ecx
	jz CM_SightTraceThroughLeafBrushNode_r_10
CM_SightTraceThroughLeafBrushNode_r_70:
	cmp word [ebx+0x2], 0x0
	jz CM_SightTraceThroughLeafBrushNode_r_20
	jg CM_SightTraceThroughLeafBrushNode_r_30
	lea edx, [ebx+0x14]
	mov [esp], edi
	lea ecx, [ebp-0x24]
	mov eax, esi
	call CM_SightTraceThroughLeafBrushNode_r_40
	test eax, eax
	jnz CM_SightTraceThroughLeafBrushNode_r_50
CM_SightTraceThroughLeafBrushNode_r_20:
	movzx eax, byte [ebx]
	movss xmm0, dword [ebx+0x8]
	movss xmm3, dword [ebp+eax*4-0x24]
	subss xmm3, xmm0
	movss xmm1, dword [edi+eax*4]
	subss xmm1, xmm0
	movss xmm4, dword [esi+eax*4+0x5c]
	addss xmm4, [_float_0_12500000]
	subss xmm4, [ebx+0xc]
	movaps xmm0, xmm3
	subss xmm0, xmm1
	pxor xmm6, xmm6
	movaps xmm2, xmm6
	cmpss xmm2, xmm0, 0x6
	movaps xmm0, xmm2
	movaps xmm2, xmm1
	andps xmm2, xmm0
	movaps xmm5, xmm0
	andnps xmm5, xmm3
	orps xmm5, xmm2
	movaps xmm2, xmm1
	subss xmm2, xmm3
	movaps xmm0, xmm6
	cmpss xmm0, xmm2, 0x6
	andps xmm1, xmm0
	andnps xmm0, xmm3
	orps xmm0, xmm1
	ucomiss xmm0, xmm4
	jb CM_SightTraceThroughLeafBrushNode_r_60
	xorps xmm4, [_data16_80000000]
	ucomiss xmm4, xmm5
	jae CM_SightTraceThroughLeafBrushNode_r_10
	movzx eax, word [ebx+0x10]
	lea eax, [eax+eax*4]
	lea ebx, [ebx+eax*4]
	mov ecx, [esi+0x80]
	test [ebx+0x4], ecx
	jnz CM_SightTraceThroughLeafBrushNode_r_70
CM_SightTraceThroughLeafBrushNode_r_10:
	xor eax, eax
CM_SightTraceThroughLeafBrushNode_r_50:
	add esp, 0x6c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_SightTraceThroughLeafBrushNode_r_60:
	movaps xmm0, xmm4
	xorps xmm0, [_data16_80000000]
	ucomiss xmm0, xmm5
	jb CM_SightTraceThroughLeafBrushNode_r_80
	movzx eax, word [ebx+0x12]
	lea eax, [eax+eax*4]
	lea ebx, [ebx+eax*4]
	jmp CM_SightTraceThroughLeafBrushNode_r_90
CM_SightTraceThroughLeafBrushNode_r_80:
	movaps xmm5, xmm2
	andps xmm5, [_data16_7fffffff]
	ucomiss xmm5, [_float_0_00000048]
	ja CM_SightTraceThroughLeafBrushNode_r_100
	movaps xmm5, xmm6
	movss xmm3, dword [_float_1_00000000]
	movaps xmm7, xmm3
	mov dword [ebp-0x40], 0x0
	movaps xmm0, xmm6
	mov eax, [ebp-0x40]
CM_SightTraceThroughLeafBrushNode_r_110:
	movaps xmm1, xmm6
	cmpss xmm1, xmm0, 0x2
	movaps xmm0, xmm1
	movaps xmm1, xmm3
	andps xmm1, xmm0
	movaps xmm3, xmm0
	andnps xmm3, xmm7
	orps xmm3, xmm1
	movss xmm1, dword [ebp-0x24]
	movss xmm0, dword [edi]
	subss xmm0, xmm1
	mulss xmm0, xmm3
	addss xmm1, xmm0
	movss [ebp-0x30], xmm1
	movss xmm1, dword [ebp-0x20]
	movss xmm0, dword [edi+0x4]
	subss xmm0, xmm1
	mulss xmm0, xmm3
	addss xmm1, xmm0
	movss [ebp-0x2c], xmm1
	movss xmm1, dword [ebp-0x1c]
	movss xmm0, dword [edi+0x8]
	subss xmm0, xmm1
	mulss xmm3, xmm0
	addss xmm1, xmm3
	movss [ebp-0x28], xmm1
	movzx edx, word [ebx+eax*2+0x10]
	lea edx, [edx+edx*4]
	lea edx, [ebx+edx*4]
	lea eax, [ebp-0x30]
	mov [esp], eax
	lea ecx, [ebp-0x24]
	mov eax, esi
	movss [ebp-0x58], xmm5
	movss [ebp-0x68], xmm6
	call CM_SightTraceThroughLeafBrushNode_r_40
	test eax, eax
	movss xmm5, dword [ebp-0x58]
	movss xmm6, dword [ebp-0x68]
	jnz CM_SightTraceThroughLeafBrushNode_r_50
	movaps xmm0, xmm6
	cmpss xmm0, xmm5, 0x2
	andps xmm5, xmm0
	orps xmm5, xmm6
	movss xmm1, dword [ebp-0x24]
	movss xmm0, dword [edi]
	subss xmm0, xmm1
	mulss xmm0, xmm5
	addss xmm1, xmm0
	movss [ebp-0x24], xmm1
	movss xmm1, dword [ebp-0x20]
	movss xmm0, dword [edi+0x4]
	subss xmm0, xmm1
	mulss xmm0, xmm5
	addss xmm1, xmm0
	movss [ebp-0x20], xmm1
	movss xmm1, dword [ebp-0x1c]
	movss xmm0, dword [edi+0x8]
	subss xmm0, xmm1
	mulss xmm5, xmm0
	addss xmm1, xmm5
	movss [ebp-0x1c], xmm1
	mov al, 0x1
	sub eax, [ebp-0x40]
	movzx eax, word [ebx+eax*2+0x10]
	lea eax, [eax+eax*4]
	lea ebx, [ebx+eax*4]
	jmp CM_SightTraceThroughLeafBrushNode_r_90
CM_SightTraceThroughLeafBrushNode_r_100:
	movaps xmm1, xmm3
	xorps xmm1, [_data16_80000000]
	movaps xmm0, xmm6
	cmpss xmm0, xmm2, 0x2
	andps xmm1, xmm0
	andnps xmm0, xmm3
	orps xmm0, xmm1
	movss xmm7, dword [_float_1_00000000]
	movaps xmm1, xmm7
	divss xmm1, xmm5
	movaps xmm5, xmm0
	subss xmm5, xmm4
	mulss xmm5, xmm1
	movaps xmm3, xmm0
	addss xmm3, xmm4
	mulss xmm3, xmm1
	xor eax, eax
	ucomiss xmm2, xmm6
	setae al
	mov [ebp-0x40], eax
	movaps xmm0, xmm7
	subss xmm0, xmm3
	jmp CM_SightTraceThroughLeafBrushNode_r_110
CM_SightTraceThroughLeafBrushNode_r_30:
	mov eax, [ebx+0x8]
	mov [ebp-0x3c], eax
	cmp word [ebx+0x2], 0x0
	jle CM_SightTraceThroughLeafBrushNode_r_10
	xor edi, edi
	jmp CM_SightTraceThroughLeafBrushNode_r_120
CM_SightTraceThroughLeafBrushNode_r_130:
	add edi, 0x1
	movsx eax, word [ebx+0x2]
	cmp eax, edi
	jle CM_SightTraceThroughLeafBrushNode_r_10
	mov ecx, [esi+0x80]
CM_SightTraceThroughLeafBrushNode_r_120:
	mov edx, [ebp-0x3c]
	movzx eax, word [edx+edi*2]
	lea edx, [eax+eax*4]
	shl edx, 0x4
	mov eax, cm
	add edx, [eax+0x90]
	test [edx+0xc], ecx
	jz CM_SightTraceThroughLeafBrushNode_r_130
	mov eax, esi
	call CM_SightTraceThroughBrush
	test eax, eax
	jz CM_SightTraceThroughLeafBrushNode_r_130
	jmp CM_SightTraceThroughLeafBrushNode_r_50


;CM_SightTraceThroughLeaf(traceWork_t const*, cLeaf_t*, trace_t*)
CM_SightTraceThroughLeaf:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x4c
	mov edi, eax
	mov esi, edx
	mov [ebp-0x3c], ecx
	mov eax, [eax+0x80]
	test [edx+0x4], eax
	jnz CM_SightTraceThroughLeaf_10
CM_SightTraceThroughLeaf_50:
	test [esi+0x8], eax
	jz CM_SightTraceThroughLeaf_20
	cmp word [esi+0x2], 0x0
	jnz CM_SightTraceThroughLeaf_30
CM_SightTraceThroughLeaf_20:
	xor eax, eax
CM_SightTraceThroughLeaf_90:
	add esp, 0x4c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_SightTraceThroughLeaf_10:
	lea eax, [edx+0xc]
	movss xmm0, dword [edx+0xc]
	subss xmm0, [edi+0x5c]
	movss [ebp-0x24], xmm0
	movss xmm0, dword [eax+0x4]
	subss xmm0, [edi+0x60]
	movss [ebp-0x20], xmm0
	movss xmm0, dword [eax+0x8]
	subss xmm0, [edi+0x64]
	movss [ebp-0x1c], xmm0
	lea eax, [edx+0x18]
	movss xmm0, dword [edx+0x18]
	addss xmm0, [edi+0x5c]
	movss [ebp-0x30], xmm0
	movss xmm0, dword [eax+0x4]
	addss xmm0, [edi+0x60]
	movss [ebp-0x2c], xmm0
	movss xmm0, dword [eax+0x8]
	addss xmm0, [edi+0x64]
	movss [ebp-0x28], xmm0
	mov dword [esp+0xc], 0x3f800000
	lea eax, [ebp-0x30]
	mov [esp+0x8], eax
	lea eax, [ebp-0x24]
	mov [esp+0x4], eax
	mov [esp], edi
	call CM_TraceBox
	test eax, eax
	jz CM_SightTraceThroughLeaf_40
CM_SightTraceThroughLeaf_80:
	mov eax, [edi+0x80]
	jmp CM_SightTraceThroughLeaf_50
CM_SightTraceThroughLeaf_30:
	xor ebx, ebx
CM_SightTraceThroughLeaf_70:
	mov eax, [ebp-0x3c]
	mov [esp+0x8], eax
	movzx eax, word [esi]
	add eax, ebx
	shl eax, 0x5
	mov edx, cm
	add eax, [edx+0x80]
	mov [esp+0x4], eax
	mov [esp], edi
	call CM_SightTraceThroughAabbTree
	movss xmm0, dword [_float_1_00000000]
	mov eax, [ebp-0x3c]
	ucomiss xmm0, [eax]
	jnz CM_SightTraceThroughLeaf_60
	jp CM_SightTraceThroughLeaf_60
	add ebx, 0x1
	movzx eax, word [esi+0x2]
	cmp ebx, eax
	jl CM_SightTraceThroughLeaf_70
	jmp CM_SightTraceThroughLeaf_20
CM_SightTraceThroughLeaf_40:
	mov edx, [esi+0x24]
	lea edx, [edx+edx*4]
	mov eax, cm
	mov eax, [eax+0x44]
	lea edx, [eax+edx*4]
	lea eax, [edi+0xc]
	mov [esp], eax
	mov ecx, edi
	mov eax, edi
	call CM_SightTraceThroughLeafBrushNode_r
	test eax, eax
	jz CM_SightTraceThroughLeaf_80
	jmp CM_SightTraceThroughLeaf_90
CM_SightTraceThroughLeaf_60:
	mov edx, cm
	movzx eax, word [edx+0x8c]
	movzx edx, word [esi]
	add eax, edx
	lea eax, [ebx+eax+0x1]
	jmp CM_SightTraceThroughLeaf_90
	nop


;CM_TraceThroughLeafBrushNode_r(traceWork_t const*, cLeafBrushNode_s*, float const*, float const*, trace_t*)
CM_TraceThroughLeafBrushNode_r:
CM_TraceThroughLeafBrushNode_r_40:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0xdc
	mov edi, eax
	mov ebx, edx
	mov esi, [ebp+0x8]
	mov eax, [ecx]
	mov [ebp-0x34], eax
	mov eax, [ecx+0x4]
	mov [ebp-0x30], eax
	mov eax, [ecx+0x8]
	mov [ebp-0x2c], eax
	mov eax, [ecx+0xc]
	mov [ebp-0x28], eax
	mov eax, [ebp+0xc]
	add eax, 0x4
	mov [ebp-0xa8], eax
CM_TraceThroughLeafBrushNode_r_80:
	mov edx, [edi+0x80]
	test [ebx+0x4], edx
	jz CM_TraceThroughLeafBrushNode_r_10
CM_TraceThroughLeafBrushNode_r_60:
	cmp word [ebx+0x2], 0x0
	jz CM_TraceThroughLeafBrushNode_r_20
	jg CM_TraceThroughLeafBrushNode_r_30
	lea edx, [ebx+0x14]
	mov ecx, [ebp+0xc]
	mov [esp+0x4], ecx
	mov [esp], esi
	lea ecx, [ebp-0x34]
	mov eax, edi
	call CM_TraceThroughLeafBrushNode_r_40
CM_TraceThroughLeafBrushNode_r_20:
	movzx eax, byte [ebx]
	movss xmm0, dword [ebx+0x8]
	movss xmm3, dword [ebp+eax*4-0x34]
	subss xmm3, xmm0
	movss xmm1, dword [esi+eax*4]
	subss xmm1, xmm0
	movss xmm4, dword [edi+eax*4+0x5c]
	addss xmm4, [_float_0_12500000]
	subss xmm4, [ebx+0xc]
	movaps xmm0, xmm3
	subss xmm0, xmm1
	pxor xmm7, xmm7
	movaps xmm2, xmm7
	cmpss xmm2, xmm0, 0x6
	movaps xmm0, xmm2
	movaps xmm2, xmm1
	andps xmm2, xmm0
	movaps xmm5, xmm0
	andnps xmm5, xmm3
	orps xmm5, xmm2
	movaps xmm2, xmm1
	subss xmm2, xmm3
	movaps xmm0, xmm7
	cmpss xmm0, xmm2, 0x6
	andps xmm1, xmm0
	andnps xmm0, xmm3
	orps xmm0, xmm1
	ucomiss xmm0, xmm4
	jb CM_TraceThroughLeafBrushNode_r_50
	xorps xmm4, [_data16_80000000]
	ucomiss xmm4, xmm5
	jae CM_TraceThroughLeafBrushNode_r_10
	movzx eax, word [ebx+0x10]
	lea eax, [eax+eax*4]
	lea ebx, [ebx+eax*4]
	mov edx, [edi+0x80]
	test [ebx+0x4], edx
	jnz CM_TraceThroughLeafBrushNode_r_60
CM_TraceThroughLeafBrushNode_r_10:
	add esp, 0xdc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_TraceThroughLeafBrushNode_r_50:
	movaps xmm0, xmm4
	xorps xmm0, [_data16_80000000]
	ucomiss xmm0, xmm5
	jb CM_TraceThroughLeafBrushNode_r_70
	movzx eax, word [ebx+0x12]
	lea eax, [eax+eax*4]
	lea ebx, [ebx+eax*4]
	jmp CM_TraceThroughLeafBrushNode_r_80
CM_TraceThroughLeafBrushNode_r_70:
	movss xmm6, dword [ebp-0x28]
	mov eax, [ebp+0xc]
	ucomiss xmm6, [eax]
	jae CM_TraceThroughLeafBrushNode_r_10
	movaps xmm5, xmm2
	andps xmm5, [_data16_7fffffff]
	ucomiss xmm5, [_float_0_00000048]
	ja CM_TraceThroughLeafBrushNode_r_90
	movaps xmm5, xmm7
	movss xmm3, dword [_float_1_00000000]
	xor eax, eax
	movaps xmm0, xmm7
	mov dword [ebp-0x60], 0x1
	movaps xmm2, xmm3
CM_TraceThroughLeafBrushNode_r_100:
	movaps xmm1, xmm7
	cmpss xmm1, xmm0, 0x2
	movaps xmm0, xmm1
	movaps xmm1, xmm3
	andps xmm1, xmm0
	movaps xmm3, xmm0
	andnps xmm3, xmm2
	orps xmm3, xmm1
	movss xmm1, dword [ebp-0x34]
	movss xmm0, dword [esi]
	subss xmm0, xmm1
	mulss xmm0, xmm3
	addss xmm1, xmm0
	movss [ebp-0x44], xmm1
	movss xmm1, dword [ebp-0x30]
	movss xmm0, dword [esi+0x4]
	subss xmm0, xmm1
	mulss xmm0, xmm3
	addss xmm1, xmm0
	movss [ebp-0x40], xmm1
	movss xmm1, dword [ebp-0x2c]
	movss xmm0, dword [esi+0x8]
	subss xmm0, xmm1
	mulss xmm0, xmm3
	addss xmm1, xmm0
	movss [ebp-0x3c], xmm1
	movss xmm0, dword [esi+0xc]
	subss xmm0, xmm6
	mulss xmm3, xmm0
	addss xmm6, xmm3
	movss [ebp-0x38], xmm6
	movzx edx, word [ebx+eax*2+0x10]
	lea edx, [edx+edx*4]
	lea edx, [ebx+edx*4]
	mov eax, [ebp+0xc]
	mov [esp+0x4], eax
	lea eax, [ebp-0x44]
	mov [esp], eax
	lea ecx, [ebp-0x34]
	mov eax, edi
	movss [ebp-0xb8], xmm5
	movss [ebp-0xc8], xmm7
	call CM_TraceThroughLeafBrushNode_r_40
	movss xmm5, dword [ebp-0xb8]
	movss xmm7, dword [ebp-0xc8]
	movaps xmm0, xmm7
	cmpss xmm0, xmm5, 0x2
	andps xmm5, xmm0
	orps xmm5, xmm7
	movss xmm1, dword [ebp-0x34]
	movss xmm0, dword [esi]
	subss xmm0, xmm1
	mulss xmm0, xmm5
	addss xmm1, xmm0
	movss [ebp-0x34], xmm1
	movss xmm1, dword [ebp-0x30]
	movss xmm0, dword [esi+0x4]
	subss xmm0, xmm1
	mulss xmm0, xmm5
	addss xmm1, xmm0
	movss [ebp-0x30], xmm1
	movss xmm1, dword [ebp-0x2c]
	movss xmm0, dword [esi+0x8]
	subss xmm0, xmm1
	mulss xmm0, xmm5
	addss xmm1, xmm0
	movss [ebp-0x2c], xmm1
	movss xmm1, dword [ebp-0x28]
	movss xmm0, dword [esi+0xc]
	subss xmm0, xmm1
	mulss xmm5, xmm0
	addss xmm1, xmm5
	movss [ebp-0x28], xmm1
	mov edx, [ebp-0x60]
	movzx eax, word [ebx+edx*2+0x10]
	lea eax, [eax+eax*4]
	lea ebx, [ebx+eax*4]
	jmp CM_TraceThroughLeafBrushNode_r_80
CM_TraceThroughLeafBrushNode_r_90:
	movaps xmm1, xmm3
	xorps xmm1, [_data16_80000000]
	movaps xmm0, xmm7
	cmpss xmm0, xmm2, 0x2
	andps xmm1, xmm0
	andnps xmm0, xmm3
	orps xmm0, xmm1
	movss xmm1, dword [_float_1_00000000]
	divss xmm1, xmm5
	movaps xmm5, xmm0
	subss xmm5, xmm4
	mulss xmm5, xmm1
	movaps xmm3, xmm0
	addss xmm3, xmm4
	mulss xmm3, xmm1
	xor eax, eax
	ucomiss xmm2, xmm7
	setae al
	movss xmm0, dword [_float_1_00000000]
	subss xmm0, xmm3
	mov dword [ebp-0x60], 0x1
	sub [ebp-0x60], eax
	movss xmm2, dword [_float_1_00000000]
	jmp CM_TraceThroughLeafBrushNode_r_100
CM_TraceThroughLeafBrushNode_r_30:
	mov ecx, [ebx+0x8]
	mov [ebp-0x9c], ecx
	cmp word [ebx+0x2], 0x0
	jle CM_TraceThroughLeafBrushNode_r_10
	mov dword [ebp-0xa0], 0x0
CM_TraceThroughLeafBrushNode_r_210:
	mov esi, [ebp-0xa0]
	mov ecx, [ebp-0x9c]
	movzx eax, word [ecx+esi*2]
	lea eax, [eax+eax*4]
	shl eax, 0x4
	mov esi, cm
	mov esi, [esi+0x90]
	add eax, esi
	mov [ebp-0x5c], eax
	test [eax+0xc], edx
	jz CM_TraceThroughLeafBrushNode_r_110
	mov eax, [ebp+0xc]
	movss xmm0, dword [eax]
	movss [ebp-0x8c], xmm0
	mov eax, [ebp-0x5c]
	mov [ebp-0x80], eax
	pxor xmm7, xmm7
	movss [ebp-0x90], xmm7
	mov byte [ebp-0x85], 0x1
	mov dword [ebp-0x84], 0x0
	movss xmm5, dword [_float__1_00000000]
	mov dword [ebp-0x7c], 0x0
	mov edx, eax
	add edx, 0x10
	mov [ebp-0xa4], edx
	movss xmm6, dword [_float_0_12500000]
	mov ecx, eax
CM_TraceThroughLeafBrushNode_r_160:
	mov edx, edi
	mov eax, [ebp-0x7c]
	add eax, eax
	add eax, [ebp-0x7c]
	lea eax, [ecx+eax*2+0x24]
	mov [ebp-0xcc], eax
	mov esi, 0x1
CM_TraceThroughLeafBrushNode_r_140:
	mov eax, [ebp-0x80]
	movss xmm0, dword [eax+esi*4-0x4]
	movss xmm1, dword [edx+0x90]
	movss xmm2, dword [edx]
	subss xmm2, xmm0
	mulss xmm2, xmm5
	subss xmm2, xmm1
	movss xmm3, dword [edx+0xc]
	subss xmm3, xmm0
	mulss xmm3, xmm5
	subss xmm3, xmm1
	ucomiss xmm2, xmm7
	jbe CM_TraceThroughLeafBrushNode_r_120
	movaps xmm0, xmm6
	subss xmm0, xmm2
	movaps xmm1, xmm7
	cmpss xmm1, xmm0, 0x6
	movaps xmm0, xmm1
	andps xmm1, xmm6
	andnps xmm0, xmm2
	orps xmm0, xmm1
	ucomiss xmm3, xmm0
	jae CM_TraceThroughLeafBrushNode_r_110
	movaps xmm0, xmm2
	subss xmm0, xmm6
	mulss xmm0, [edx+0x18]
	mulss xmm0, xmm5
	ucomiss xmm0, [ebp-0x8c]
	jae CM_TraceThroughLeafBrushNode_r_110
	ucomiss xmm3, xmm7
	mov eax, 0x0
	movzx ecx, byte [ebp-0x85]
	cmovbe eax, ecx
	mov [ebp-0x85], al
	ucomiss xmm0, [ebp-0x90]
	jbe CM_TraceThroughLeafBrushNode_r_130
	movss [ebp-0x90], xmm0
CM_TraceThroughLeafBrushNode_r_180:
	mov ecx, [ebp-0xcc]
	movsx eax, word [ecx]
	mov [ebp-0x20], eax
	mov dword [ebp-0x58], 0x0
	mov dword [ebp-0x54], 0x0
	mov dword [ebp-0x50], 0x0
	movss [ebp+esi*4-0x5c], xmm5
	lea eax, [ebp-0x58]
	mov [ebp-0x24], eax
	lea ecx, [ebp-0x24]
	mov [ebp-0x84], ecx
CM_TraceThroughLeafBrushNode_r_170:
	add esi, 0x1
	add edx, 0x4
	add dword [ebp-0xcc], 0x2
	cmp esi, 0x4
	jnz CM_TraceThroughLeafBrushNode_r_140
	mov esi, [ebp-0x7c]
	test esi, esi
	jnz CM_TraceThroughLeafBrushNode_r_150
	mov eax, [ebp-0xa4]
	mov [ebp-0x80], eax
	mov dword [ebp-0x7c], 0x1
	movss xmm5, dword [_float_1_00000000]
	mov ecx, [ebp-0x5c]
	jmp CM_TraceThroughLeafBrushNode_r_160
CM_TraceThroughLeafBrushNode_r_130:
	mov eax, [ebp-0x84]
	test eax, eax
	jnz CM_TraceThroughLeafBrushNode_r_170
	jmp CM_TraceThroughLeafBrushNode_r_180
CM_TraceThroughLeafBrushNode_r_120:
	pxor xmm0, xmm0
	ucomiss xmm3, xmm0
	jbe CM_TraceThroughLeafBrushNode_r_170
	movaps xmm1, xmm2
	mulss xmm1, [edx+0x18]
	mulss xmm1, xmm5
	movss xmm2, dword [ebp-0x90]
	ucomiss xmm2, xmm1
	jae CM_TraceThroughLeafBrushNode_r_110
	movaps xmm0, xmm1
	subss xmm0, [ebp-0x8c]
	pxor xmm2, xmm2
	ucomiss xmm0, xmm2
	jb CM_TraceThroughLeafBrushNode_r_190
CM_TraceThroughLeafBrushNode_r_220:
	mov byte [ebp-0x85], 0x0
	jmp CM_TraceThroughLeafBrushNode_r_170
CM_TraceThroughLeafBrushNode_r_230:
	mov edx, ecx
CM_TraceThroughLeafBrushNode_r_320:
	mov eax, [edx+0xc]
	mov ecx, [ebp+0xc]
	mov [ecx+0x14], eax
	mov eax, [ebp-0x84]
	test eax, eax
	jz CM_TraceThroughLeafBrushNode_r_200
	movss xmm0, dword [ebp-0x90]
	mov esi, [ebp+0xc]
	movss [esi], xmm0
	mov eax, [ebp-0x84]
	mov edx, [eax]
	mov eax, [edx]
	mov [esi+0x4], eax
	mov eax, [edx+0x4]
	mov ecx, [ebp-0xa8]
	mov [ecx+0x4], eax
	mov eax, [edx+0x8]
	mov [ecx+0x8], eax
	mov esi, [ebp-0x84]
	mov eax, [esi+0x4]
	mov ecx, cm
	mov edx, [ecx+0x1c]
	lea eax, [eax+eax*8]
	mov eax, [edx+eax*8+0x40]
	mov esi, [ebp+0xc]
	mov [esi+0x10], eax
	mov edx, [ebp-0x84]
	mov eax, [edx+0x4]
	lea eax, [eax+eax*8]
	mov edx, [ecx+0x1c]
	lea eax, [edx+eax*8]
	mov [esi+0x18], eax
	mov byte [esi+0x2a], 0x0
CM_TraceThroughLeafBrushNode_r_110:
	add dword [ebp-0xa0], 0x1
	movsx eax, word [ebx+0x2]
	cmp eax, [ebp-0xa0]
	jle CM_TraceThroughLeafBrushNode_r_10
	mov edx, [edi+0x80]
	jmp CM_TraceThroughLeafBrushNode_r_210
CM_TraceThroughLeafBrushNode_r_190:
	movss [ebp-0x8c], xmm1
	jmp CM_TraceThroughLeafBrushNode_r_220
CM_TraceThroughLeafBrushNode_r_150:
	mov ecx, [ebp-0x5c]
	mov edx, [ecx+0x20]
	mov esi, [ecx+0x1c]
	test esi, esi
	jz CM_TraceThroughLeafBrushNode_r_230
	movss xmm0, dword [edi+0x8c]
	movss [ebp-0x98], xmm0
	movss xmm1, dword [edi+0x88]
	movss [ebp-0x94], xmm1
	movss xmm2, dword [edi]
	movss [ebp-0x78], xmm2
	movss xmm0, dword [edi+0x4]
	movss [ebp-0x74], xmm0
	movss xmm1, dword [edi+0x8]
	movss [ebp-0x70], xmm1
	lea eax, [edi+0xc]
	movss xmm2, dword [edi+0xc]
	movss [ebp-0x6c], xmm2
	movss xmm0, dword [eax+0x4]
	movss [ebp-0x68], xmm0
	movss xmm1, dword [eax+0x8]
	movss [ebp-0x64], xmm1
	mov dword [ebp-0xcc], 0x0
	movaps xmm5, xmm2
	jmp CM_TraceThroughLeafBrushNode_r_240
CM_TraceThroughLeafBrushNode_r_270:
	divss xmm1, xmm2
	movss [ebp-0x90], xmm1
	ucomiss xmm1, [ebp-0x8c]
	jae CM_TraceThroughLeafBrushNode_r_110
CM_TraceThroughLeafBrushNode_r_290:
	mov [ebp-0x84], edx
CM_TraceThroughLeafBrushNode_r_280:
	add edx, 0xc
	add dword [ebp-0xcc], 0x1
	cmp esi, [ebp-0xcc]
	jz CM_TraceThroughLeafBrushNode_r_250
	movss xmm5, dword [ebp-0x6c]
CM_TraceThroughLeafBrushNode_r_240:
	mov eax, [edx]
	movss xmm3, dword [ebp-0x98]
	mulss xmm3, [eax+0x8]
	andps xmm3, [_data16_7fffffff]
	movss xmm0, dword [ebp-0x94]
	addss xmm0, [eax+0xc]
	addss xmm3, xmm0
	movss xmm1, dword [eax+0x4]
	movss xmm2, dword [eax+0x8]
	movss xmm6, dword [ebp-0x78]
	mulss xmm6, [eax]
	movss xmm0, dword [ebp-0x74]
	mulss xmm0, xmm1
	addss xmm6, xmm0
	movss xmm0, dword [ebp-0x70]
	mulss xmm0, xmm2
	addss xmm6, xmm0
	subss xmm6, xmm3
	mulss xmm5, [eax]
	mulss xmm1, [ebp-0x68]
	addss xmm5, xmm1
	mulss xmm2, [ebp-0x64]
	addss xmm5, xmm2
	subss xmm5, xmm3
	ucomiss xmm6, xmm7
	jbe CM_TraceThroughLeafBrushNode_r_260
	movss xmm4, dword [_float_0_12500000]
	movaps xmm0, xmm4
	subss xmm0, xmm6
	movaps xmm2, xmm7
	cmpss xmm2, xmm0, 0x6
	movaps xmm0, xmm2
	movaps xmm1, xmm2
	andps xmm1, xmm4
	andnps xmm0, xmm6
	orps xmm0, xmm1
	ucomiss xmm5, xmm0
	jae CM_TraceThroughLeafBrushNode_r_110
	ucomiss xmm5, xmm7
	mov eax, 0x0
	movzx ecx, byte [ebp-0x85]
	cmovbe eax, ecx
	mov [ebp-0x85], al
	movaps xmm2, xmm6
	subss xmm2, xmm5
	movaps xmm1, xmm6
	subss xmm1, xmm4
	movss xmm0, dword [ebp-0x90]
	mulss xmm0, xmm2
	ucomiss xmm1, xmm0
	ja CM_TraceThroughLeafBrushNode_r_270
	mov ecx, [ebp-0x84]
	test ecx, ecx
	jnz CM_TraceThroughLeafBrushNode_r_280
	jmp CM_TraceThroughLeafBrushNode_r_290
CM_TraceThroughLeafBrushNode_r_260:
	pxor xmm0, xmm0
	ucomiss xmm5, xmm0
	jbe CM_TraceThroughLeafBrushNode_r_280
	movaps xmm1, xmm6
	subss xmm1, xmm5
	movss xmm0, dword [ebp-0x8c]
	mulss xmm0, xmm1
	ucomiss xmm6, xmm0
	ja CM_TraceThroughLeafBrushNode_r_300
CM_TraceThroughLeafBrushNode_r_310:
	mov byte [ebp-0x85], 0x0
	jmp CM_TraceThroughLeafBrushNode_r_280
CM_TraceThroughLeafBrushNode_r_300:
	divss xmm6, xmm1
	movss [ebp-0x8c], xmm6
	movss xmm1, dword [ebp-0x90]
	ucomiss xmm1, xmm6
	jb CM_TraceThroughLeafBrushNode_r_310
	jmp CM_TraceThroughLeafBrushNode_r_110
CM_TraceThroughLeafBrushNode_r_250:
	mov edx, [ebp-0x5c]
	jmp CM_TraceThroughLeafBrushNode_r_320
CM_TraceThroughLeafBrushNode_r_200:
	mov byte [ecx+0x29], 0x1
	cmp byte [ebp-0x85], 0x0
	jz CM_TraceThroughLeafBrushNode_r_110
	mov byte [ecx+0x28], 0x1
	mov dword [ecx], 0x0
	mov dword [ecx+0x10], 0x0
	jmp CM_TraceThroughLeafBrushNode_r_110
	nop


;CM_SightTraceThroughTree(traceWork_t const*, int, float const*, float const*, trace_t*)
CM_SightTraceThroughTree:
CM_SightTraceThroughTree_110:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x6c
	mov edi, eax
	mov esi, [ebp+0x8]
	mov eax, [ecx]
	mov [ebp-0x30], eax
	mov eax, [ecx+0x4]
	mov [ebp-0x2c], eax
	mov eax, [ecx+0x8]
	mov [ebp-0x28], eax
	test edx, edx
	js CM_SightTraceThroughTree_10
	mov ecx, cm
	mov [ebp-0x40], ecx
	jmp CM_SightTraceThroughTree_20
CM_SightTraceThroughTree_50:
	movzx eax, al
	movss xmm0, dword [edx+0xc]
	movss xmm5, dword [ebp+eax*4-0x30]
	subss xmm5, xmm0
	movss xmm3, dword [esi+eax*4]
	subss xmm3, xmm0
	movss xmm2, dword [edi+eax*4+0x5c]
	addss xmm2, [_float_0_12500000]
CM_SightTraceThroughTree_90:
	movaps xmm4, xmm3
	subss xmm4, xmm5
	pxor xmm6, xmm6
	movaps xmm0, xmm6
	cmpss xmm0, xmm4, 0x6
	movaps xmm1, xmm3
	andps xmm1, xmm0
	andnps xmm0, xmm5
	orps xmm0, xmm1
	ucomiss xmm0, xmm2
	jb CM_SightTraceThroughTree_30
CM_SightTraceThroughTree_70:
	movsx edx, word [ebx+0x4]
CM_SightTraceThroughTree_130:
	test edx, edx
	js CM_SightTraceThroughTree_40
CM_SightTraceThroughTree_20:
	mov eax, [ecx+0x34]
	lea ebx, [eax+edx*8]
	mov edx, [ebx]
	movzx eax, byte [edx+0x10]
	cmp al, 0x2
	jbe CM_SightTraceThroughTree_50
	movss xmm1, dword [edx+0x4]
	movss xmm2, dword [edx+0x8]
	movss xmm4, dword [edx+0xc]
	movss xmm3, dword [edx]
	movaps xmm5, xmm3
	mulss xmm5, [ebp-0x30]
	movaps xmm0, xmm1
	mulss xmm0, [ebp-0x2c]
	addss xmm5, xmm0
	movaps xmm0, xmm2
	mulss xmm0, [ebp-0x28]
	addss xmm5, xmm0
	subss xmm5, xmm4
	mulss xmm3, [esi]
	mulss xmm1, [esi+0x4]
	addss xmm3, xmm1
	mulss xmm2, [esi+0x8]
	addss xmm3, xmm2
	subss xmm3, xmm4
	cmp byte [edi+0x84], 0x0
	jz CM_SightTraceThroughTree_60
	movss xmm2, dword [_float_0_12500000]
	movaps xmm4, xmm3
	subss xmm4, xmm5
	pxor xmm6, xmm6
	movaps xmm0, xmm6
	cmpss xmm0, xmm4, 0x6
	movaps xmm1, xmm3
	andps xmm1, xmm0
	andnps xmm0, xmm5
	orps xmm0, xmm1
	ucomiss xmm0, xmm2
	jae CM_SightTraceThroughTree_70
CM_SightTraceThroughTree_30:
	movaps xmm0, xmm5
	subss xmm0, xmm3
	movaps xmm1, xmm6
	cmpss xmm1, xmm0, 0x6
	movaps xmm0, xmm1
	andps xmm3, xmm1
	andnps xmm0, xmm5
	orps xmm0, xmm3
	movaps xmm1, xmm2
	xorps xmm1, [_data16_80000000]
	ucomiss xmm1, xmm0
	jb CM_SightTraceThroughTree_80
	movsx edx, word [ebx+0x6]
	test edx, edx
	jns CM_SightTraceThroughTree_20
CM_SightTraceThroughTree_40:
	mov eax, edx
	not eax
	lea edx, [eax+eax*4]
	lea edx, [eax+edx*2]
	mov eax, [ecx+0x3c]
	lea edx, [eax+edx*4]
	mov ecx, [ebp+0xc]
	mov eax, edi
	call CM_SightTraceThroughLeaf
CM_SightTraceThroughTree_120:
	add esp, 0x6c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_SightTraceThroughTree_60:
	movss xmm2, dword [edi+0x9c]
	addss xmm2, [_float_0_12500000]
	jmp CM_SightTraceThroughTree_90
CM_SightTraceThroughTree_80:
	movaps xmm3, xmm4
	andps xmm3, [_data16_7fffffff]
	ucomiss xmm3, [_float_0_00000048]
	ja CM_SightTraceThroughTree_100
	movaps xmm5, xmm6
	movss xmm3, dword [_float_1_00000000]
	movaps xmm7, xmm3
	mov dword [ebp-0x3c], 0x0
	movaps xmm0, xmm6
	mov eax, [ebp-0x3c]
CM_SightTraceThroughTree_140:
	movaps xmm1, xmm6
	cmpss xmm1, xmm0, 0x2
	movaps xmm0, xmm1
	movaps xmm1, xmm3
	andps xmm1, xmm0
	movaps xmm3, xmm0
	andnps xmm3, xmm7
	orps xmm3, xmm1
	movss xmm1, dword [ebp-0x30]
	movss xmm0, dword [esi]
	subss xmm0, xmm1
	mulss xmm0, xmm3
	addss xmm1, xmm0
	movss [ebp-0x24], xmm1
	movss xmm1, dword [ebp-0x2c]
	movss xmm0, dword [esi+0x4]
	subss xmm0, xmm1
	mulss xmm0, xmm3
	addss xmm1, xmm0
	movss [ebp-0x20], xmm1
	movss xmm1, dword [ebp-0x28]
	movss xmm0, dword [esi+0x8]
	subss xmm0, xmm1
	mulss xmm3, xmm0
	addss xmm1, xmm3
	movss [ebp-0x1c], xmm1
	movsx edx, word [ebx+eax*2+0x4]
	mov eax, [ebp+0xc]
	mov [esp+0x4], eax
	lea eax, [ebp-0x24]
	mov [esp], eax
	lea ecx, [ebp-0x30]
	mov eax, edi
	movss [ebp-0x58], xmm5
	movss [ebp-0x68], xmm6
	call CM_SightTraceThroughTree_110
	test eax, eax
	movss xmm5, dword [ebp-0x58]
	movss xmm6, dword [ebp-0x68]
	jnz CM_SightTraceThroughTree_120
	movaps xmm0, xmm6
	cmpss xmm0, xmm5, 0x2
	andps xmm5, xmm0
	orps xmm5, xmm6
	movss xmm1, dword [ebp-0x30]
	movss xmm0, dword [esi]
	subss xmm0, xmm1
	mulss xmm0, xmm5
	addss xmm1, xmm0
	movss [ebp-0x30], xmm1
	movss xmm1, dword [ebp-0x2c]
	movss xmm0, dword [esi+0x4]
	subss xmm0, xmm1
	mulss xmm0, xmm5
	addss xmm1, xmm0
	movss [ebp-0x2c], xmm1
	movss xmm1, dword [ebp-0x28]
	movss xmm0, dword [esi+0x8]
	subss xmm0, xmm1
	mulss xmm5, xmm0
	addss xmm1, xmm5
	movss [ebp-0x28], xmm1
	xor dword [ebp-0x3c], 0x1
	mov eax, [ebp-0x3c]
	movsx edx, word [ebx+eax*2+0x4]
	mov ecx, [ebp-0x40]
	jmp CM_SightTraceThroughTree_130
CM_SightTraceThroughTree_100:
	movaps xmm1, xmm5
	xorps xmm1, [_data16_80000000]
	movaps xmm0, xmm6
	cmpss xmm0, xmm4, 0x2
	andps xmm1, xmm0
	andnps xmm0, xmm5
	orps xmm0, xmm1
	movss xmm7, dword [_float_1_00000000]
	movaps xmm1, xmm7
	divss xmm1, xmm3
	movaps xmm5, xmm0
	subss xmm5, xmm2
	mulss xmm5, xmm1
	movaps xmm3, xmm2
	addss xmm3, xmm0
	mulss xmm3, xmm1
	xor eax, eax
	ucomiss xmm4, xmm6
	setae al
	mov [ebp-0x3c], eax
	movaps xmm0, xmm7
	subss xmm0, xmm3
	jmp CM_SightTraceThroughTree_140
CM_SightTraceThroughTree_10:
	mov ecx, cm
	mov eax, edx
	not eax
	lea edx, [eax+eax*4]
	lea edx, [eax+edx*2]
	mov eax, [ecx+0x3c]
	lea edx, [eax+edx*4]
	mov ecx, [ebp+0xc]
	mov eax, edi
	call CM_SightTraceThroughLeaf
	jmp CM_SightTraceThroughTree_120


;CM_TraceThroughLeafBrushNode(traceWork_t const*, cLeaf_t*, trace_t*)
CM_TraceThroughLeafBrushNode:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x5c
	mov ebx, eax
	mov esi, edx
	mov edi, ecx
	lea eax, [edx+0xc]
	movss xmm0, dword [edx+0xc]
	subss xmm0, [ebx+0x5c]
	movss [ebp-0x24], xmm0
	movss xmm0, dword [eax+0x4]
	subss xmm0, [ebx+0x60]
	movss [ebp-0x20], xmm0
	movss xmm0, dword [eax+0x8]
	subss xmm0, [ebx+0x64]
	movss [ebp-0x1c], xmm0
	lea eax, [edx+0x18]
	movss xmm0, dword [edx+0x18]
	addss xmm0, [ebx+0x5c]
	movss [ebp-0x30], xmm0
	movss xmm0, dword [eax+0x4]
	addss xmm0, [ebx+0x60]
	movss [ebp-0x2c], xmm0
	movss xmm0, dword [eax+0x8]
	addss xmm0, [ebx+0x64]
	movss [ebp-0x28], xmm0
	mov eax, [ecx]
	mov [esp+0xc], eax
	lea eax, [ebp-0x30]
	mov [esp+0x8], eax
	lea eax, [ebp-0x24]
	mov [esp+0x4], eax
	mov [esp], ebx
	call CM_TraceBox
	test eax, eax
	jz CM_TraceThroughLeafBrushNode_10
	xor eax, eax
	add esp, 0x5c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_TraceThroughLeafBrushNode_10:
	mov eax, [ebx]
	mov [ebp-0x40], eax
	mov eax, [ebx+0x4]
	mov [ebp-0x3c], eax
	mov eax, [ebx+0x8]
	mov [ebp-0x38], eax
	lea edx, [ebx+0xc]
	mov eax, [ebx+0xc]
	mov [ebp-0x50], eax
	mov eax, [edx+0x4]
	mov [ebp-0x4c], eax
	mov eax, [edx+0x8]
	mov [ebp-0x48], eax
	mov dword [ebp-0x34], 0x0
	mov eax, [edi]
	mov [ebp-0x44], eax
	lea ecx, [ebp-0x40]
	mov edx, [esi+0x24]
	lea edx, [edx+edx*4]
	mov eax, cm
	mov eax, [eax+0x44]
	lea edx, [eax+edx*4]
	mov [esp+0x4], edi
	lea eax, [ebp-0x50]
	mov [esp], eax
	mov eax, ebx
	call CM_TraceThroughLeafBrushNode_r
	pxor xmm0, xmm0
	ucomiss xmm0, [edi]
	setz al
	setnp dl
	and al, dl
	movzx eax, al
	add esp, 0x5c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


;CM_TraceSphereThroughSphere(traceWork_t const*, float const*, float const*, float const*, float, trace_t*)
CM_TraceSphereThroughSphere:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x9c
	mov ebx, eax
	mov edi, ecx
	mov esi, [ebp+0x8]
	movss xmm4, dword [edx]
	subss xmm4, [esi]
	movss [ebp-0x24], xmm4
	movss xmm2, dword [edx+0x4]
	subss xmm2, [esi+0x4]
	movss [ebp-0x20], xmm2
	movss xmm1, dword [edx+0x8]
	subss xmm1, [esi+0x8]
	movss [ebp-0x1c], xmm1
	movaps xmm5, xmm0
	addss xmm5, [eax+0x88]
	mulss xmm5, xmm5
	movaps xmm3, xmm4
	mulss xmm3, xmm4
	movaps xmm0, xmm2
	mulss xmm0, xmm2
	addss xmm3, xmm0
	movaps xmm0, xmm1
	mulss xmm0, xmm1
	addss xmm3, xmm0
	subss xmm3, xmm5
	pxor xmm6, xmm6
	ucomiss xmm6, xmm3
	jae CM_TraceSphereThroughSphere_10
	lea eax, [eax+0x24]
	mulss xmm4, [ebx+0x24]
	mulss xmm2, [eax+0x4]
	addss xmm4, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm4, xmm1
	ucomiss xmm4, xmm6
	jb CM_TraceSphereThroughSphere_20
CM_TraceSphereThroughSphere_30:
	mov eax, 0x1
CM_TraceSphereThroughSphere_50:
	add esp, 0x9c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_TraceSphereThroughSphere_20:
	movss xmm0, dword [ebx+0x34]
	movss [ebp-0x3c], xmm0
	movaps xmm0, xmm4
	mulss xmm0, xmm4
	mulss xmm3, [ebp-0x3c]
	subss xmm0, xmm3
	ucomiss xmm6, xmm0
	ja CM_TraceSphereThroughSphere_30
	lea eax, [ebp-0x30]
	mov [esp+0x4], eax
	lea eax, [ebp-0x24]
	mov [esp], eax
	movss [ebp-0x58], xmm0
	movss [ebp-0x68], xmm4
	movss [ebp-0x88], xmm6
	call Vec3NormalizeTo
	fstp dword [ebp-0x8c]
	movss xmm1, dword [ebp-0x8c]
	movss xmm4, dword [ebp-0x68]
	movaps xmm2, xmm4
	xorps xmm2, [_data16_80000000]
	movss xmm0, dword [ebp-0x58]
	sqrtss xmm0, xmm0
	subss xmm2, xmm0
	divss xmm2, dword [ebp-0x3c]
	mulss xmm1, [_float_0_12500000]
	divss xmm1, xmm4
	addss xmm2, xmm1
	mov eax, [ebp+0xc]
	movss xmm0, dword [eax]
	ucomiss xmm0, xmm2
	movss xmm6, dword [ebp-0x88]
	jbe CM_TraceSphereThroughSphere_30
	movaps xmm0, xmm6
	cmpss xmm0, xmm2, 0x2
	andps xmm2, xmm0
	movaps xmm0, xmm2
	orps xmm0, xmm6
	movss [eax], xmm0
	mov edx, eax
	add edx, 0x4
	mov eax, [ebp-0x30]
	mov ecx, [ebp+0xc]
	mov [ecx+0x4], eax
	mov eax, [ebp-0x2c]
	mov [edx+0x4], eax
	mov eax, [ebp-0x28]
	mov [edx+0x8], eax
	mov eax, [ebx+0xa8]
	mov eax, [eax+0xc]
	mov [ecx+0x14], eax
	mov byte [ecx+0x2a], 0x0
	mov dword [ecx+0x10], 0x0
CM_TraceSphereThroughSphere_40:
	xor eax, eax
	add esp, 0x9c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_TraceSphereThroughSphere_10:
	mov eax, [ebp+0xc]
	movss [eax], xmm6
	mov byte [eax+0x29], 0x1
	mov byte [eax+0x2a], 0x0
	mov eax, [ebp+0xc]
	add eax, 0x4
	mov [esp+0x4], eax
	lea eax, [ebp-0x24]
	mov [esp], eax
	movss [ebp-0x78], xmm5
	call Vec3NormalizeTo
	fstp st0
	mov eax, [ebx+0xa8]
	mov eax, [eax+0xc]
	mov edx, [ebp+0xc]
	mov [edx+0x14], eax
	mov dword [edx+0x10], 0x0
	movss xmm2, dword [edi]
	subss xmm2, [esi]
	movss [ebp-0x24], xmm2
	movss xmm1, dword [edi+0x4]
	subss xmm1, [esi+0x4]
	movss [ebp-0x20], xmm1
	movss xmm0, dword [edi+0x8]
	subss xmm0, [esi+0x8]
	movss [ebp-0x1c], xmm0
	mulss xmm2, xmm2
	mulss xmm1, xmm1
	addss xmm2, xmm1
	mulss xmm0, xmm0
	addss xmm2, xmm0
	movss xmm5, dword [ebp-0x78]
	ucomiss xmm5, xmm2
	jb CM_TraceSphereThroughSphere_40
	mov ecx, [ebp+0xc]
	mov byte [ecx+0x28], 0x1
	xor eax, eax
	jmp CM_TraceSphereThroughSphere_50
	nop


;CM_SightTraceSphereThroughSphere(traceWork_t const*, float const*, float const*, float const*, float, trace_t*)
CM_SightTraceSphereThroughSphere:
	push ebp
	mov ebp, esp
	sub esp, 0x68
	mov ecx, eax
	mov eax, [ebp+0x8]
	movss xmm5, dword [edx]
	subss xmm5, [eax]
	movss [ebp-0x14], xmm5
	movss xmm3, dword [edx+0x4]
	subss xmm3, [eax+0x4]
	movss [ebp-0x10], xmm3
	movss xmm2, dword [edx+0x8]
	subss xmm2, [eax+0x8]
	movss [ebp-0xc], xmm2
	addss xmm0, [ecx+0x88]
	movaps xmm4, xmm5
	mulss xmm4, xmm5
	movaps xmm1, xmm3
	mulss xmm1, xmm3
	addss xmm4, xmm1
	movaps xmm1, xmm2
	mulss xmm1, xmm2
	addss xmm4, xmm1
	mulss xmm0, xmm0
	subss xmm4, xmm0
	pxor xmm0, xmm0
	ucomiss xmm0, xmm4
	jae CM_SightTraceSphereThroughSphere_10
	lea eax, [ecx+0x24]
	mulss xmm5, [ecx+0x24]
	mulss xmm3, [eax+0x4]
	addss xmm5, xmm3
	mulss xmm2, [eax+0x8]
	addss xmm5, xmm2
	ucomiss xmm5, xmm0
	jb CM_SightTraceSphereThroughSphere_20
CM_SightTraceSphereThroughSphere_30:
	mov eax, 0x1
	leave
	ret
CM_SightTraceSphereThroughSphere_20:
	movss xmm1, dword [ecx+0x34]
	movss [ebp-0x30], xmm1
	movaps xmm1, xmm5
	mulss xmm1, xmm5
	mulss xmm4, [ebp-0x30]
	subss xmm1, xmm4
	ucomiss xmm0, xmm1
	ja CM_SightTraceSphereThroughSphere_30
	lea eax, [ebp-0x20]
	mov [esp+0x4], eax
	lea eax, [ebp-0x14]
	mov [esp], eax
	movss [ebp-0x48], xmm1
	movss [ebp-0x58], xmm5
	call Vec3NormalizeTo
	fstp dword [ebp-0x2c]
	movss xmm5, dword [ebp-0x58]
	movaps xmm0, xmm5
	xorps xmm0, [_data16_80000000]
	movss xmm1, dword [ebp-0x48]
	sqrtss xmm1, xmm1
	subss xmm0, xmm1
	divss xmm0, dword [ebp-0x30]
	mulss xmm5, [_float_0_12500000]
	divss xmm5, dword [ebp-0x2c]
	addss xmm0, xmm5
	mov eax, [ebp+0xc]
	ucomiss xmm0, [eax]
	setae al
	movzx eax, al
	leave
	ret
CM_SightTraceSphereThroughSphere_10:
	xor eax, eax
	leave
	ret


;CM_TraceThroughTree(traceWork_t const*, int, float const*, float const*, trace_t*)
CM_TraceThroughTree:
CM_TraceThroughTree_150:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x5c
	mov edi, eax
	mov esi, [ebp+0x8]
	mov eax, [ecx]
	mov [ebp-0x38], eax
	mov eax, [ecx+0x4]
	mov [ebp-0x34], eax
	mov eax, [ecx+0x8]
	mov [ebp-0x30], eax
	mov eax, [ecx+0xc]
	mov [ebp-0x2c], eax
	test edx, edx
	js CM_TraceThroughTree_10
	mov ecx, cm
	mov [ebp-0x40], ecx
	jmp CM_TraceThroughTree_20
CM_TraceThroughTree_50:
	movzx eax, al
	movss xmm0, dword [edx+0xc]
	movss xmm5, dword [ebp+eax*4-0x38]
	subss xmm5, xmm0
	movss xmm3, dword [esi+eax*4]
	subss xmm3, xmm0
	movss xmm2, dword [edi+eax*4+0x5c]
	addss xmm2, [_float_0_12500000]
CM_TraceThroughTree_130:
	movaps xmm4, xmm3
	subss xmm4, xmm5
	pxor xmm0, xmm0
	cmpss xmm0, xmm4, 0x6
	movaps xmm1, xmm3
	andps xmm1, xmm0
	andnps xmm0, xmm5
	orps xmm0, xmm1
	ucomiss xmm0, xmm2
	jb CM_TraceThroughTree_30
CM_TraceThroughTree_70:
	movsx edx, word [ebx+0x4]
CM_TraceThroughTree_160:
	test edx, edx
	js CM_TraceThroughTree_40
CM_TraceThroughTree_20:
	mov eax, [ecx+0x34]
	lea ebx, [eax+edx*8]
	mov edx, [ebx]
	movzx eax, byte [edx+0x10]
	cmp al, 0x2
	jbe CM_TraceThroughTree_50
	movss xmm1, dword [edx+0x4]
	movss xmm2, dword [edx+0x8]
	movss xmm4, dword [edx+0xc]
	movss xmm3, dword [edx]
	movaps xmm5, xmm3
	mulss xmm5, [ebp-0x38]
	movaps xmm0, xmm1
	mulss xmm0, [ebp-0x34]
	addss xmm5, xmm0
	movaps xmm0, xmm2
	mulss xmm0, [ebp-0x30]
	addss xmm5, xmm0
	subss xmm5, xmm4
	mulss xmm3, [esi]
	mulss xmm1, [esi+0x4]
	addss xmm3, xmm1
	mulss xmm2, [esi+0x8]
	addss xmm3, xmm2
	subss xmm3, xmm4
	cmp byte [edi+0x84], 0x0
	jz CM_TraceThroughTree_60
	movss xmm2, dword [_float_0_12500000]
	movaps xmm4, xmm3
	subss xmm4, xmm5
	pxor xmm0, xmm0
	cmpss xmm0, xmm4, 0x6
	movaps xmm1, xmm3
	andps xmm1, xmm0
	andnps xmm0, xmm5
	orps xmm0, xmm1
	ucomiss xmm0, xmm2
	jae CM_TraceThroughTree_70
CM_TraceThroughTree_30:
	movaps xmm0, xmm5
	subss xmm0, xmm3
	pxor xmm1, xmm1
	cmpss xmm1, xmm0, 0x6
	movaps xmm0, xmm1
	andps xmm3, xmm1
	andnps xmm0, xmm5
	orps xmm0, xmm3
	movaps xmm1, xmm2
	xorps xmm1, [_data16_80000000]
	ucomiss xmm1, xmm0
	jb CM_TraceThroughTree_80
	movsx edx, word [ebx+0x6]
	test edx, edx
	jns CM_TraceThroughTree_20
CM_TraceThroughTree_40:
	mov eax, edx
	not eax
	lea edx, [eax+eax*4]
	lea edx, [eax+edx*2]
	mov eax, [ecx+0x3c]
	lea esi, [eax+edx*4]
	pxor xmm0, xmm0
	mov edx, [ebp+0xc]
	ucomiss xmm0, [edx]
	jp CM_TraceThroughTree_90
	jz CM_TraceThroughTree_100
CM_TraceThroughTree_90:
	mov eax, [edi+0x80]
	test [esi+0x4], eax
	jnz CM_TraceThroughTree_110
	test [esi+0x8], eax
	jz CM_TraceThroughTree_100
CM_TraceThroughTree_180:
	cmp word [esi+0x2], 0x0
	jz CM_TraceThroughTree_100
	pxor xmm0, xmm0
	mov eax, [ebp+0xc]
	ucomiss xmm0, [eax]
	jp CM_TraceThroughTree_120
	jnz CM_TraceThroughTree_120
CM_TraceThroughTree_100:
	add esp, 0x5c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_TraceThroughTree_60:
	movss xmm2, dword [edi+0x9c]
	addss xmm2, [_float_0_12500000]
	jmp CM_TraceThroughTree_130
CM_TraceThroughTree_80:
	movss xmm6, dword [ebp-0x2c]
	mov eax, [ebp+0xc]
	ucomiss xmm6, [eax]
	jae CM_TraceThroughTree_100
	movaps xmm3, xmm4
	andps xmm3, [_data16_7fffffff]
	ucomiss xmm3, [_float_0_00000048]
	ja CM_TraceThroughTree_140
	pxor xmm5, xmm5
	movss xmm3, dword [_float_1_00000000]
	movaps xmm7, xmm3
	xor eax, eax
	pxor xmm0, xmm0
	mov dword [ebp-0x3c], 0x1
CM_TraceThroughTree_170:
	pxor xmm1, xmm1
	cmpss xmm1, xmm0, 0x2
	movaps xmm0, xmm1
	movaps xmm1, xmm3
	andps xmm1, xmm0
	movaps xmm3, xmm0
	andnps xmm3, xmm7
	orps xmm3, xmm1
	movss xmm1, dword [ebp-0x38]
	movss xmm0, dword [esi]
	subss xmm0, xmm1
	mulss xmm0, xmm3
	addss xmm1, xmm0
	movss [ebp-0x28], xmm1
	movss xmm1, dword [ebp-0x34]
	movss xmm0, dword [esi+0x4]
	subss xmm0, xmm1
	mulss xmm0, xmm3
	addss xmm1, xmm0
	movss [ebp-0x24], xmm1
	movss xmm1, dword [ebp-0x30]
	movss xmm0, dword [esi+0x8]
	subss xmm0, xmm1
	mulss xmm0, xmm3
	addss xmm1, xmm0
	movss [ebp-0x20], xmm1
	movss xmm0, dword [esi+0xc]
	subss xmm0, xmm6
	mulss xmm3, xmm0
	addss xmm6, xmm3
	movss [ebp-0x1c], xmm6
	movsx edx, word [ebx+eax*2+0x4]
	mov eax, [ebp+0xc]
	mov [esp+0x4], eax
	lea eax, [ebp-0x28]
	mov [esp], eax
	lea ecx, [ebp-0x38]
	mov eax, edi
	movss [ebp-0x58], xmm5
	call CM_TraceThroughTree_150
	movss xmm5, dword [ebp-0x58]
	pxor xmm0, xmm0
	cmpss xmm0, xmm5, 0x2
	andps xmm5, xmm0
	pxor xmm0, xmm0
	orps xmm5, xmm0
	movss xmm1, dword [ebp-0x38]
	movss xmm0, dword [esi]
	subss xmm0, xmm1
	mulss xmm0, xmm5
	addss xmm1, xmm0
	movss [ebp-0x38], xmm1
	movss xmm1, dword [ebp-0x34]
	movss xmm0, dword [esi+0x4]
	subss xmm0, xmm1
	mulss xmm0, xmm5
	addss xmm1, xmm0
	movss [ebp-0x34], xmm1
	movss xmm1, dword [ebp-0x30]
	movss xmm0, dword [esi+0x8]
	subss xmm0, xmm1
	mulss xmm0, xmm5
	addss xmm1, xmm0
	movss [ebp-0x30], xmm1
	movss xmm1, dword [ebp-0x2c]
	movss xmm0, dword [esi+0xc]
	subss xmm0, xmm1
	mulss xmm5, xmm0
	addss xmm1, xmm5
	movss [ebp-0x2c], xmm1
	mov eax, [ebp-0x3c]
	movsx edx, word [ebx+eax*2+0x4]
	mov ecx, [ebp-0x40]
	jmp CM_TraceThroughTree_160
CM_TraceThroughTree_140:
	movaps xmm1, xmm5
	xorps xmm1, [_data16_80000000]
	pxor xmm0, xmm0
	cmpss xmm0, xmm4, 0x2
	andps xmm1, xmm0
	andnps xmm0, xmm5
	orps xmm0, xmm1
	movss xmm7, dword [_float_1_00000000]
	movaps xmm1, xmm7
	divss xmm1, xmm3
	movaps xmm5, xmm0
	subss xmm5, xmm2
	mulss xmm5, xmm1
	movaps xmm3, xmm2
	addss xmm3, xmm0
	mulss xmm3, xmm1
	pxor xmm0, xmm0
	xor eax, eax
	ucomiss xmm4, xmm0
	setae al
	movaps xmm0, xmm7
	subss xmm0, xmm3
	mov edx, eax
	xor edx, 0x1
	mov [ebp-0x3c], edx
	jmp CM_TraceThroughTree_170
CM_TraceThroughTree_10:
	mov ecx, cm
	jmp CM_TraceThroughTree_40
CM_TraceThroughTree_110:
	mov ecx, edx
	mov edx, esi
	mov eax, edi
	call CM_TraceThroughLeafBrushNode
	test al, al
	jnz CM_TraceThroughTree_100
	mov eax, [edi+0x80]
	test [esi+0x8], eax
	jnz CM_TraceThroughTree_180
	jmp CM_TraceThroughTree_100
CM_TraceThroughTree_120:
	xor ebx, ebx
	mov edx, [ebp+0xc]
CM_TraceThroughTree_200:
	mov [esp+0x8], edx
	movzx eax, word [esi]
	lea eax, [ebx+eax]
	shl eax, 0x5
	mov edx, cm
	add eax, [edx+0x80]
	mov [esp+0x4], eax
	mov [esp], edi
	call CM_TraceThroughAabbTree
	add ebx, 0x1
	movzx eax, word [esi+0x2]
	cmp eax, ebx
	jle CM_TraceThroughTree_100
	pxor xmm0, xmm0
	mov eax, [ebp+0xc]
	ucomiss xmm0, [eax]
	jp CM_TraceThroughTree_190
	jz CM_TraceThroughTree_100
CM_TraceThroughTree_190:
	mov edx, eax
	jmp CM_TraceThroughTree_200
	nop


;CM_Trace(trace_t*, float const*, float const*, float const*, float const*, unsigned int, int)
CM_Trace:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0xa1c
	mov [ebp-0x9ac], eax
	mov ebx, edx
	mov esi, ecx
	mov eax, cm
	mov edx, [ebp+0x10]
	cmp edx, [eax+0x84]
	jae CM_Trace_10
	lea edx, [edx+edx*8]
	mov eax, [eax+0x88]
	lea edx, [eax+edx*8]
	mov [ebp-0x9a8], edx
CM_Trace_270:
	mov eax, [ebp+0x14]
	mov [ebp-0xf4], eax
	mov ecx, 0x1
	movss xmm4, dword [_float_0_50000000]
	movss xmm2, dword [_data16_7fffffff]
	mov edx, 0x4
	lea eax, [ebp-0x124]
CM_Trace_20:
	mov edi, [ebp+0xc]
	movss xmm1, dword [edx+edi-0x4]
	movaps xmm0, xmm1
	mov edi, [ebp+0x8]
	addss xmm0, [edx+edi-0x4]
	mulss xmm0, xmm4
	subss xmm1, xmm0
	movss [eax+0xc], xmm1
	movaps xmm1, xmm0
	addss xmm1, [edx+ebx-0x4]
	movss [eax-0x50], xmm1
	addss xmm0, [edx+esi-0x4]
	movss [eax-0x44], xmm0
	movaps xmm1, xmm0
	addss xmm1, [eax-0x50]
	mulss xmm1, xmm4
	movss [eax-0x18], xmm1
	subss xmm0, [eax-0x50]
	movss [edx+ebp-0x154], xmm0
	mulss xmm0, xmm4
	movss [edx+ebp-0x134], xmm0
	andps xmm0, xmm2
	movss [eax], xmm0
	add ecx, 0x1
	add edx, 0x4
	add eax, 0x4
	cmp ecx, 0x4
	jnz CM_Trace_20
	lea eax, [ebp-0x174]
	mov [esp], eax
	call CM_CalcTraceExtents
	movss xmm0, dword [ebp-0x150]
	movss xmm1, dword [ebp-0x14c]
	movss xmm2, dword [ebp-0x148]
	mulss xmm0, xmm0
	mulss xmm1, xmm1
	addss xmm0, xmm1
	mulss xmm2, xmm2
	addss xmm0, xmm2
	movss [ebp-0x140], xmm0
	sqrtss xmm0, xmm0
	movss [ebp-0x144], xmm0
	movss xmm4, dword [ebp-0x118]
	movss xmm2, dword [ebp-0x110]
	movaps xmm0, xmm2
	cmpss xmm0, xmm4, 0x5
	movaps xmm1, xmm4
	andps xmm1, xmm0
	movaps xmm3, xmm0
	andnps xmm3, xmm2
	orps xmm3, xmm1
	movss [ebp-0xec], xmm3
	movss xmm1, dword [ebp-0x114]
	movaps xmm0, xmm4
	mulss xmm0, xmm4
	mulss xmm1, xmm1
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, xmm2
	addss xmm0, xmm1
	sqrtss xmm0, xmm0
	movss [ebp-0xd8], xmm0
	subss xmm2, xmm3
	movss [ebp-0xe8], xmm2
	lea eax, [ebp-0x174]
	lea edx, [ebp-0x16c]
CM_Trace_40:
	movss xmm1, dword [eax]
	movss xmm0, dword [eax+0xc]
	ucomiss xmm0, xmm1
	jbe CM_Trace_30
	subss xmm1, xmm3
	movss [eax+0x68], xmm1
	addss xmm0, xmm3
	movss [eax+0x74], xmm0
CM_Trace_180:
	add eax, 0x4
	cmp edx, eax
	jnz CM_Trace_40
	movss xmm1, dword [ebp-0x16c]
	movss xmm0, dword [ebp-0x160]
	ucomiss xmm0, xmm1
	jbe CM_Trace_50
	subss xmm1, [ebp-0xe8]
	subss xmm1, [ebp-0xec]
	movss [ebp-0x104], xmm1
	addss xmm0, [ebp-0xe8]
	addss xmm0, [ebp-0xec]
	movss [ebp-0xf8], xmm0
	movaps xmm2, xmm0
CM_Trace_190:
	subss xmm2, [ebp-0x104]
	movss xmm1, dword [ebp-0x100]
	subss xmm1, [ebp-0x10c]
	movss xmm0, dword [ebp-0xfc]
	subss xmm0, [ebp-0x108]
	mulss xmm1, xmm0
	mulss xmm2, xmm1
	mulss xmm4, [ebp-0x114]
	mulss xmm4, [ebp-0x110]
	mulss xmm4, [_float_16_00000000]
	mulss xmm4, [ebp-0x144]
	ucomiss xmm4, xmm2
	seta byte [ebp-0xef]
	mov dword [esp], 0x3
	call Sys_GetValue
	mov edx, [eax]
	add edx, 0x1
	mov [eax], edx
	mov [ebp-0xd4], edx
	mov edx, [eax+0x4]
	mov [ebp-0xd0], edx
	mov edx, [eax+0x8]
	mov [ebp-0xcc], edx
	mov ecx, [eax+0xc]
	mov [ebp-0xc8], ecx
	movss xmm0, dword [ebx]
	ucomiss xmm0, [esi]
	jnz CM_Trace_60
	jp CM_Trace_60
	movss xmm0, dword [ebx+0x4]
	ucomiss xmm0, [esi+0x4]
	jz CM_Trace_70
CM_Trace_60:
	movss xmm0, dword [ebp-0x118]
	addss xmm0, [ebp-0x114]
	addss xmm0, [ebp-0x110]
	pxor xmm5, xmm5
	ucomiss xmm0, xmm5
	setz al
	setnp dl
	and al, dl
	mov [ebp-0xf0], al
	movss xmm3, dword [ebp-0xec]
	movss [ebp-0xe4], xmm3
	movss [ebp-0xe0], xmm3
	movaps xmm0, xmm3
	addss xmm0, [ebp-0xe8]
	movss [ebp-0xdc], xmm0
	mov eax, [ebp+0x10]
	test eax, eax
	jz CM_Trace_80
	cmp dword [ebp+0x10], 0xfff
	jz CM_Trace_90
	mov ebx, [ebp-0x9a8]
	add ebx, 0x1c
	pxor xmm0, xmm0
	mov edx, [ebp-0x9ac]
	ucomiss xmm0, [edx]
	jp CM_Trace_100
	jz CM_Trace_110
CM_Trace_100:
	mov eax, [ebp-0xf4]
	test [ebx+0x4], eax
	jnz CM_Trace_120
CM_Trace_340:
	test [ebx+0x8], eax
	jz CM_Trace_130
	cmp word [ebx+0x2], 0x0
	jz CM_Trace_130
	pxor xmm0, xmm0
	mov edx, [ebp-0x9ac]
	ucomiss xmm0, [edx]
	jp CM_Trace_140
	jz CM_Trace_110
CM_Trace_140:
	xor esi, esi
	mov edx, [ebp-0x9ac]
CM_Trace_170:
	mov [esp+0x8], edx
	movzx eax, word [ebx]
	lea eax, [esi+eax]
	shl eax, 0x5
	mov edx, cm
	add eax, [edx+0x80]
	mov [esp+0x4], eax
	lea ecx, [ebp-0x174]
	mov [esp], ecx
	call CM_TraceThroughAabbTree
	add esi, 0x1
	movzx eax, word [ebx+0x2]
	cmp esi, eax
	jge CM_Trace_130
	pxor xmm0, xmm0
	mov eax, [ebp-0x9ac]
	ucomiss xmm0, [eax]
	jp CM_Trace_150
	jz CM_Trace_160
CM_Trace_150:
	mov edx, eax
	jmp CM_Trace_170
CM_Trace_30:
	subss xmm0, xmm3
	movss [eax+0x68], xmm0
	addss xmm1, xmm3
	movss [eax+0x74], xmm1
	jmp CM_Trace_180
CM_Trace_50:
	subss xmm0, [ebp-0xe8]
	subss xmm0, [ebp-0xec]
	movss [ebp-0x104], xmm0
	addss xmm1, [ebp-0xe8]
	addss xmm1, [ebp-0xec]
	movss [ebp-0xf8], xmm1
	movaps xmm2, xmm1
	jmp CM_Trace_190
CM_Trace_70:
	jp CM_Trace_60
	movss xmm0, dword [ebx+0x8]
	ucomiss xmm0, [esi+0x8]
	jnz CM_Trace_60
	jp CM_Trace_60
	mov byte [ebp-0xf0], 0x0
	mov eax, [ebp+0x10]
	test eax, eax
	jz CM_Trace_200
	cmp dword [ebp+0x10], 0xfff
	jz CM_Trace_210
	mov edx, [ebp-0x9ac]
	cmp byte [edx+0x28], 0x0
	jnz CM_Trace_110
	mov esi, [ebp-0x9a8]
	add esi, 0x1c
	mov eax, [ebp-0xf4]
	test [esi+0x4], eax
	jz CM_Trace_220
	mov edx, esi
	xor ebx, ebx
	xor ecx, ecx
CM_Trace_230:
	movss xmm0, dword [edx+0xc]
	ucomiss xmm0, [ecx+ebp-0x100]
	jae CM_Trace_220
	movss xmm0, dword [ecx+ebp-0x10c]
	ucomiss xmm0, [edx+0x18]
	jae CM_Trace_220
	add ebx, 0x1
	add ecx, 0x4
	add edx, 0x4
	cmp ebx, 0x3
	jnz CM_Trace_230
	mov edx, [esi+0x24]
	lea edx, [edx+edx*4]
	mov eax, cm
	mov eax, [eax+0x44]
	lea edx, [eax+edx*4]
	mov ecx, [ebp-0x9ac]
	lea eax, [ebp-0x174]
	call CM_TestInLeafBrushNode_r
	mov ecx, [ebp-0x9ac]
	cmp byte [ecx+0x28], 0x0
	jnz CM_Trace_240
	mov eax, [ebp-0xf4]
CM_Trace_220:
	test [esi+0x8], eax
	jz CM_Trace_130
	mov edi, [ebp-0x9ac]
	mov [esp+0x8], edi
	mov [esp+0x4], esi
	lea eax, [ebp-0x174]
	mov [esp], eax
	call CM_MeshTestInLeaf
	mov eax, [ebp-0x9ac]
	jmp CM_Trace_160
CM_Trace_200:
	mov edx, [ebp-0x9ac]
	cmp byte [edx+0x28], 0x0
	jz CM_Trace_250
CM_Trace_110:
	mov eax, edx
CM_Trace_160:
	test dword [eax+0x28], 0xffff00
	jnz CM_Trace_260
	movss xmm0, dword [eax+0xc]
	ucomiss xmm0, [_float_0_69999999]
	setae byte [eax+0x2a]
CM_Trace_260:
	add esp, 0xa1c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_Trace_10:
	mov dword [esp], 0x3
	call Sys_GetValue
	mov eax, [eax+0xc]
	mov [ebp-0x9a8], eax
	jmp CM_Trace_270
CM_Trace_80:
	mov eax, [ebp-0x174]
	mov [ebp-0x98], eax
	mov eax, [ebp-0x170]
	mov [ebp-0x94], eax
	mov eax, [ebp-0x16c]
	mov [ebp-0x90], eax
	mov dword [ebp-0x8c], 0x0
	mov eax, [ebp-0x168]
	mov [ebp-0x88], eax
	mov eax, [ebp-0x164]
	mov [ebp-0x84], eax
	mov eax, [ebp-0x160]
	mov [ebp-0x80], eax
	mov edi, [ebp-0x9ac]
	mov eax, [edi]
	mov [ebp-0x7c], eax
	lea ecx, [ebp-0x98]
	mov [esp+0x4], edi
	lea eax, [ebp-0x88]
	mov [esp], eax
	xor edx, edx
	lea eax, [ebp-0x174]
	call CM_TraceThroughTree
CM_Trace_130:
	mov eax, [ebp-0x9ac]
	jmp CM_Trace_160
CM_Trace_90:
	mov eax, [ebp-0xcc]
	mov eax, [eax+0xc]
	test [ebp-0xf4], eax
	jz CM_Trace_130
	mov ecx, [ebp-0xc8]
	movss xmm2, dword [_float_1_00000000]
	movss xmm1, dword [ecx+0xc]
	addss xmm1, xmm2
	movss xmm0, dword [ebp-0x10c]
	ucomiss xmm0, xmm1
	ja CM_Trace_130
	movss xmm1, dword [ecx+0x10]
	addss xmm1, xmm2
	movss xmm0, dword [ebp-0x108]
	ucomiss xmm0, xmm1
	ja CM_Trace_130
	movss xmm1, dword [ecx+0x14]
	addss xmm1, xmm2
	movss xmm0, dword [ebp-0x104]
	ucomiss xmm0, xmm1
	ja CM_Trace_130
	movss xmm0, dword [ecx]
	subss xmm0, xmm2
	ucomiss xmm0, [ebp-0x100]
	ja CM_Trace_130
	movss xmm0, dword [ecx+0x4]
	subss xmm0, xmm2
	ucomiss xmm0, [ebp-0xfc]
	ja CM_Trace_130
	movss xmm0, dword [ecx+0x8]
	subss xmm0, xmm2
	ucomiss xmm0, [ebp-0xf8]
	ja CM_Trace_130
	movss xmm6, dword [ebp-0x174]
	movss [ebp-0x3c], xmm6
	movss xmm7, dword [ebp-0x170]
	movss [ebp-0x38], xmm7
	movss xmm0, dword [ebp-0x16c]
	movss [ebp-0x9b0], xmm0
	addss xmm0, [ebp-0xe8]
	movss [ebp-0x34], xmm0
	movss [ebp-0x48], xmm6
	movss [ebp-0x44], xmm7
	movss xmm0, dword [ebp-0x9b0]
	subss xmm0, [ebp-0xe8]
	movss [ebp-0x40], xmm0
	mov eax, [ebp-0x168]
	mov [ebp-0x54], eax
	mov edx, [ebp-0x164]
	mov [ebp-0x50], edx
	movss xmm1, dword [ebp-0x160]
	movaps xmm0, xmm1
	addss xmm0, [ebp-0xe8]
	movss [ebp-0x4c], xmm0
	mov [ebp-0x60], eax
	mov [ebp-0x5c], edx
	subss xmm1, [ebp-0xe8]
	movss [ebp-0x58], xmm1
	mov eax, ecx
	mov ebx, 0x1
	movss xmm4, dword [_float_0_50000000]
	lea ecx, [ebp-0xc4]
	lea esi, [ebp-0x6c]
	mov edx, 0x4
CM_Trace_280:
	movss xmm0, dword [eax]
	movss xmm2, dword [eax+0xc]
	movaps xmm1, xmm0
	addss xmm1, xmm2
	mulss xmm1, xmm4
	movss [edx+esi-0x4], xmm1
	subss xmm0, xmm1
	movss [edx+ecx-0x4], xmm0
	subss xmm2, xmm1
	movss [edx+ecx+0x8], xmm2
	add ebx, 0x1
	add edx, 0x4
	add eax, 0x4
	cmp ebx, 0x4
	jnz CM_Trace_280
	movss xmm0, dword [ebp-0xb0]
	movaps xmm1, xmm0
	minss xmm1, dword [ebp-0xb8]
	movss [ebp-0x994], xmm1
	subss xmm0, xmm1
	movss [ebp-0x990], xmm0
	movss xmm0, dword [ebp-0x6c]
	movss [ebp-0x9a0], xmm0
	movss [ebp-0x974], xmm0
	movss xmm1, dword [ebp-0x68]
	movss [ebp-0x99c], xmm1
	movss [ebp-0x970], xmm1
	movss xmm0, dword [ebp-0x64]
	movss [ebp-0x998], xmm0
	movss [ebp-0x96c], xmm0
	movss xmm0, dword [ebp-0x990]
	addss xmm0, [ebp-0x96c]
	movss [ebp-0x96c], xmm0
	movss xmm1, dword [ebp-0x9a0]
	movss [ebp-0x30], xmm1
	movss xmm0, dword [ebp-0x99c]
	movss [ebp-0x2c], xmm0
	movss xmm1, dword [ebp-0x998]
	subss xmm1, [ebp-0x990]
	movss [ebp-0x28], xmm1
	movss xmm0, dword [ebp-0x40]
	ucomiss xmm0, [ebp-0x96c]
	ja CM_Trace_290
	ucomiss xmm1, [ebp-0x34]
	ja CM_Trace_300
CM_Trace_480:
	subss xmm6, [ebp-0x9a0]
	movss [ebp-0x78], xmm6
	movaps xmm4, xmm7
	subss xmm4, [ebp-0x99c]
	movss [ebp-0x74], xmm4
	movss xmm7, dword [ebp-0x9b0]
	subss xmm7, [ebp-0x998]
	movss [ebp-0x70], xmm7
	movss xmm0, dword [ebp-0x994]
	addss xmm0, xmm3
	movaps xmm2, xmm6
	mulss xmm2, xmm6
	movaps xmm1, xmm4
	mulss xmm1, xmm4
	addss xmm2, xmm1
	mulss xmm0, xmm0
	subss xmm2, xmm0
	ucomiss xmm5, xmm2
	jae CM_Trace_310
	movss xmm1, dword [ebp-0x150]
	movss xmm0, dword [ebp-0x14c]
	movaps xmm3, xmm6
	mulss xmm3, xmm1
	mulss xmm4, xmm0
	addss xmm3, xmm4
	ucomiss xmm3, xmm5
	jb CM_Trace_320
CM_Trace_470:
	movss xmm1, dword [ebp-0x96c]
	movss xmm0, dword [ebp-0x58]
	ucomiss xmm0, xmm1
	jbe CM_Trace_330
	ucomiss xmm1, [ebp-0x40]
	jb CM_Trace_130
	lea ecx, [ebp-0x60]
	lea edx, [ebp-0x48]
	mov edi, [ebp-0x9ac]
	mov [esp+0x4], edi
	lea eax, [ebp-0x974]
CM_Trace_460:
	mov [esp], eax
	movss xmm0, dword [ebp-0x994]
	lea eax, [ebp-0x174]
	call CM_TraceSphereThroughSphere
	jmp CM_Trace_130
CM_Trace_120:
	mov ecx, edx
	mov edx, ebx
	lea eax, [ebp-0x174]
	call CM_TraceThroughLeafBrushNode
	test al, al
	jnz CM_Trace_130
	mov eax, [ebp-0xf4]
	jmp CM_Trace_340
CM_Trace_250:
	movss xmm3, dword [ebp-0x174]
	movaps xmm0, xmm3
	subss xmm0, [ebp-0x118]
	movss [ebp-0xb4], xmm0
	lea ecx, [ebp-0xc4]
	movss xmm2, dword [ebp-0x170]
	movaps xmm0, xmm2
	subss xmm0, [ebp-0x114]
	movss [ebp-0xb0], xmm0
	movss xmm1, dword [ebp-0x16c]
	movaps xmm0, xmm1
	subss xmm0, [ebp-0x110]
	movss [ebp-0xac], xmm0
	addss xmm3, [ebp-0x118]
	movss [ebp-0xa8], xmm3
	addss xmm2, [ebp-0x114]
	movss [ebp-0xa4], xmm2
	addss xmm1, [ebp-0x110]
	movss [ebp-0xa0], xmm1
	mov eax, ecx
	movss xmm1, dword [_float_1_00000000]
	lea edx, [ebp-0xb8]
CM_Trace_350:
	movss xmm0, dword [eax+0x10]
	subss xmm0, xmm1
	movss [eax+0x10], xmm0
	movss xmm0, dword [eax+0x1c]
	addss xmm0, xmm1
	movss [eax+0x1c], xmm0
	add eax, 0x4
	cmp edx, eax
	jnz CM_Trace_350
	mov dword [ebp-0xc4], 0x0
	mov dword [ebp-0xc0], 0x400
	lea eax, [ebp-0x974]
	mov [ebp-0xb8], eax
	mov dword [ebp-0x9c], 0x0
	mov dword [ebp-0xbc], 0x0
	mov dword [esp+0x4], 0x0
	mov [esp], ecx
	call CM_BoxLeafnums_r
	cmp dword [ebp-0xc4], 0x0
	jz CM_Trace_130
	jle CM_Trace_130
	mov eax, [ebp-0x9ac]
	cmp byte [eax+0x28], 0x0
	jnz CM_Trace_160
	xor edi, edi
CM_Trace_400:
	movzx eax, word [ebp+edi*2-0x974]
	lea edx, [eax+eax*4]
	lea edx, [eax+edx*2]
	mov ecx, cm
	mov eax, [ecx+0x3c]
	lea esi, [eax+edx*4]
	mov eax, [ebp-0xf4]
	test [esi+0x4], eax
	jz CM_Trace_360
	mov edx, esi
	xor ebx, ebx
	xor ecx, ecx
CM_Trace_370:
	movss xmm0, dword [edx+0xc]
	ucomiss xmm0, [ecx+ebp-0x100]
	jae CM_Trace_360
	movss xmm0, dword [ecx+ebp-0x10c]
	ucomiss xmm0, [edx+0x18]
	jae CM_Trace_360
	add ebx, 0x1
	add ecx, 0x4
	add edx, 0x4
	cmp ebx, 0x3
	jnz CM_Trace_370
	mov edx, [esi+0x24]
	lea edx, [edx+edx*4]
	mov ecx, cm
	mov eax, [ecx+0x44]
	lea edx, [eax+edx*4]
	mov ecx, [ebp-0x9ac]
	lea eax, [ebp-0x174]
	call CM_TestInLeafBrushNode_r
	mov eax, [ebp-0x9ac]
	cmp byte [eax+0x28], 0x0
	jnz CM_Trace_380
	mov eax, [ebp-0xf4]
CM_Trace_360:
	test [esi+0x8], eax
	jnz CM_Trace_390
CM_Trace_380:
	add edi, 0x1
	cmp [ebp-0xc4], edi
	jle CM_Trace_130
	mov ecx, [ebp-0x9ac]
	cmp byte [ecx+0x28], 0x0
	jz CM_Trace_400
CM_Trace_240:
	mov eax, ecx
	jmp CM_Trace_160
CM_Trace_210:
	mov eax, [edx+0xc]
	test [ebp-0xf4], eax
	jz CM_Trace_130
	movss xmm6, dword [ebp-0x174]
	movss xmm7, dword [ebp-0x170]
	movss xmm0, dword [ebp-0x16c]
	movss [ebp-0x9b0], xmm0
	movss xmm0, dword [ebp-0xe8]
	movss xmm1, dword [ebp-0x9b0]
	addss xmm1, xmm0
	movss [ebp-0x97c], xmm1
	movss xmm1, dword [ebp-0x9b0]
	subss xmm1, xmm0
	movss [ebp-0x98c], xmm1
	mov eax, ecx
	mov ecx, 0x1
	movss xmm4, dword [_float_0_50000000]
	lea esi, [ebp-0x78]
	lea ebx, [ebp-0x974]
	mov edx, 0x4
CM_Trace_410:
	movss xmm0, dword [eax]
	movss xmm2, dword [eax+0xc]
	movaps xmm1, xmm0
	addss xmm1, xmm2
	mulss xmm1, xmm4
	movss [edx+esi-0x4], xmm1
	subss xmm0, xmm1
	movss [edx+ebx-0x4], xmm0
	subss xmm2, xmm1
	movss [edx+ebx+0x8], xmm2
	add ecx, 0x1
	add edx, 0x4
	add eax, 0x4
	cmp ecx, 0x4
	jnz CM_Trace_410
	movss xmm0, dword [ebp-0x960]
	movaps xmm1, xmm0
	minss xmm1, dword [ebp-0x968]
	movaps xmm5, xmm0
	subss xmm5, xmm1
	movss xmm0, dword [ebp-0xec]
	movss [ebp-0x9a4], xmm0
	movaps xmm4, xmm0
	addss xmm4, xmm1
	mulss xmm4, xmm4
	movss xmm1, dword [ebp-0x78]
	movss [ebp-0x980], xmm1
	movss xmm0, dword [ebp-0x74]
	movss [ebp-0x984], xmm0
	movss xmm1, dword [ebp-0x70]
	movss [ebp-0x988], xmm1
	movaps xmm3, xmm1
	addss xmm3, xmm5
	movss xmm2, dword [ebp-0x980]
	subss xmm2, xmm6
	subss xmm0, xmm7
	movaps xmm1, xmm3
	subss xmm1, [ebp-0x97c]
	mulss xmm2, xmm2
	mulss xmm0, xmm0
	addss xmm2, xmm0
	mulss xmm1, xmm1
	addss xmm1, xmm2
	ucomiss xmm4, xmm1
	jbe CM_Trace_420
	mov eax, [ebp-0x9ac]
	mov byte [eax+0x29], 0x1
	mov byte [eax+0x28], 0x1
	mov dword [eax], 0x0
	mov dword [eax+0x10], 0x0
	jmp CM_Trace_130
CM_Trace_390:
	mov edx, [ebp-0x9ac]
	mov [esp+0x8], edx
	mov [esp+0x4], esi
	lea ecx, [ebp-0x174]
	mov [esp], ecx
	call CM_MeshTestInLeaf
	jmp CM_Trace_380
CM_Trace_420:
	subss xmm3, [ebp-0x98c]
	mulss xmm3, xmm3
	addss xmm3, xmm2
	ucomiss xmm4, xmm3
	jbe CM_Trace_430
	mov edx, [ebp-0x9ac]
	mov byte [edx+0x29], 0x1
	mov byte [edx+0x28], 0x1
	mov dword [edx], 0x0
	mov dword [edx+0x10], 0x0
	mov eax, [ebp-0x9ac]
	jmp CM_Trace_160
CM_Trace_430:
	movss xmm1, dword [ebp-0x988]
	subss xmm1, xmm5
	movaps xmm0, xmm1
	subss xmm0, [ebp-0x97c]
	mulss xmm0, xmm0
	addss xmm0, xmm2
	ucomiss xmm4, xmm0
	jbe CM_Trace_440
	mov ecx, [ebp-0x9ac]
	mov byte [ecx+0x29], 0x1
	mov byte [ecx+0x28], 0x1
	mov dword [ecx], 0x0
	mov dword [ecx+0x10], 0x0
	mov eax, [ebp-0x9ac]
	jmp CM_Trace_160
CM_Trace_440:
	subss xmm1, [ebp-0x98c]
	mulss xmm1, xmm1
	addss xmm2, xmm1
	ucomiss xmm4, xmm2
	jbe CM_Trace_450
	mov edi, [ebp-0x9ac]
	mov byte [edi+0x29], 0x1
	mov byte [edi+0x28], 0x1
	mov dword [edi], 0x0
	mov dword [edi+0x10], 0x0
	mov eax, [ebp-0x9ac]
	jmp CM_Trace_160
CM_Trace_450:
	addss xmm5, [ebp-0x110]
	subss xmm5, [ebp-0x9a4]
	movss xmm0, dword [ebp-0x9b0]
	subss xmm0, [ebp-0x70]
	movss [ebp-0x9b0], xmm0
	and dword [ebp-0x9b0], 0x7fffffff
	ucomiss xmm5, [ebp-0x9b0]
	jb CM_Trace_130
	subss xmm6, [ebp-0x980]
	subss xmm7, [ebp-0x984]
	mulss xmm6, xmm6
	mulss xmm7, xmm7
	addss xmm6, xmm7
	pxor xmm0, xmm0
	addss xmm6, xmm0
	ucomiss xmm4, xmm6
	jbe CM_Trace_130
	mov eax, [ebp-0x9ac]
	mov byte [eax+0x29], 0x1
	mov byte [eax+0x28], 0x1
	movss [eax], xmm0
	mov dword [eax+0x10], 0x0
	mov eax, [ebp-0x9ac]
	jmp CM_Trace_160
CM_Trace_330:
	movss xmm1, dword [ebp-0x28]
	ucomiss xmm1, [ebp-0x4c]
	jbe CM_Trace_130
	movss xmm0, dword [ebp-0x34]
	ucomiss xmm0, xmm1
	jb CM_Trace_130
	lea ecx, [ebp-0x54]
	lea edx, [ebp-0x3c]
	mov eax, [ebp-0x9ac]
	mov [esp+0x4], eax
	lea eax, [ebp-0x30]
	jmp CM_Trace_460
CM_Trace_310:
	movss xmm1, dword [ebp-0x110]
	subss xmm1, xmm3
	addss xmm1, [ebp-0x990]
	andps xmm7, [_data16_7fffffff]
	ucomiss xmm7, xmm1
	ja CM_Trace_470
	mov eax, [ebp-0x9ac]
	movss [eax], xmm5
	mov byte [eax+0x29], 0x1
	mov byte [eax+0x2a], 0x0
	movss [ebp-0x70], xmm5
	mov eax, [ebp-0x9ac]
	add eax, 0x4
	mov [esp+0x4], eax
	lea eax, [ebp-0x78]
	mov [esp], eax
	movss [ebp-0x9d8], xmm1
	call Vec3NormalizeTo
	fstp st0
	mov eax, [ebp-0xcc]
	mov eax, [eax+0xc]
	mov edx, [ebp-0x9ac]
	mov [edx+0x14], eax
	mov dword [edx+0x10], 0x0
	movss xmm0, dword [ebp-0x168]
	subss xmm0, [ebp-0x9a0]
	movss [ebp-0x78], xmm0
	movss xmm0, dword [ebp-0x164]
	subss xmm0, [ebp-0x99c]
	movss [ebp-0x74], xmm0
	movss xmm0, dword [ebp-0x160]
	subss xmm0, [ebp-0x998]
	movss [ebp-0x70], xmm0
	andps xmm0, [_data16_7fffffff]
	movss xmm1, dword [ebp-0x9d8]
	ucomiss xmm1, xmm0
	jb CM_Trace_130
	mov byte [edx+0x28], 0x1
	mov eax, [ebp-0x9ac]
	jmp CM_Trace_160
CM_Trace_300:
	lea ecx, [ebp-0x54]
	lea edx, [ebp-0x3c]
	mov eax, [ebp-0x9ac]
	mov [esp+0x4], eax
	lea eax, [ebp-0x30]
	mov [esp], eax
	movss xmm0, dword [ebp-0x994]
	lea eax, [ebp-0x174]
	call CM_TraceSphereThroughSphere
	test eax, eax
	jz CM_Trace_130
	pxor xmm5, xmm5
	ucomiss xmm5, [ebp-0x148]
	jae CM_Trace_130
CM_Trace_490:
	movss xmm0, dword [ebp-0x16c]
	movss [ebp-0x9b0], xmm0
	movss xmm6, dword [ebp-0x174]
	movss xmm7, dword [ebp-0x170]
	movss xmm3, dword [ebp-0xec]
	jmp CM_Trace_480
CM_Trace_290:
	lea ecx, [ebp-0x60]
	lea edx, [ebp-0x48]
	mov eax, [ebp-0x9ac]
	mov [esp+0x4], eax
	lea eax, [ebp-0x974]
	mov [esp], eax
	movss xmm0, dword [ebp-0x994]
	lea eax, [ebp-0x174]
	call CM_TraceSphereThroughSphere
	test eax, eax
	jz CM_Trace_130
	pxor xmm5, xmm5
	movss xmm0, dword [ebp-0x148]
	ucomiss xmm0, xmm5
	jae CM_Trace_130
	jmp CM_Trace_490
CM_Trace_320:
	movaps xmm4, xmm1
	mulss xmm4, xmm1
	mulss xmm0, xmm0
	addss xmm4, xmm0
	movaps xmm0, xmm3
	mulss xmm0, xmm3
	mulss xmm2, xmm4
	subss xmm0, xmm2
	ucomiss xmm5, xmm0
	ja CM_Trace_470
	movss [ebp-0x70], xmm5
	lea eax, [ebp-0x24]
	mov [esp+0x4], eax
	lea eax, [ebp-0x78]
	mov [esp], eax
	movss [ebp-0x9c8], xmm0
	movss [ebp-0x9e8], xmm3
	movss [ebp-0x9f8], xmm4
	movss [ebp-0xa08], xmm5
	call Vec3NormalizeTo
	fstp dword [ebp-0xa0c]
	movss xmm2, dword [ebp-0xa0c]
	mulss xmm2, [_float_0_12500000]
	movss xmm3, dword [ebp-0x9e8]
	divss xmm2, xmm3
	movaps xmm1, xmm3
	xorps xmm1, [_data16_80000000]
	movss xmm0, dword [ebp-0x9c8]
	sqrtss xmm0, xmm0
	subss xmm1, xmm0
	movss xmm4, dword [ebp-0x9f8]
	divss xmm1, xmm4
	addss xmm1, xmm2
	mov ecx, [ebp-0x9ac]
	movss xmm0, dword [ecx]
	ucomiss xmm0, xmm1
	movss xmm5, dword [ebp-0xa08]
	jbe CM_Trace_470
	movss xmm0, dword [ebp-0x110]
	subss xmm0, [ebp-0xec]
	addss xmm0, [ebp-0x990]
	movss [ebp-0x990], xmm0
	movaps xmm0, xmm1
	subss xmm0, xmm2
	mulss xmm0, [ebp-0x148]
	addss xmm0, [ebp-0x16c]
	subss xmm0, [ebp-0x998]
	andps xmm0, [_data16_7fffffff]
	ucomiss xmm0, [ebp-0x990]
	ja CM_Trace_470
	movaps xmm0, xmm5
	cmpss xmm0, xmm1, 0x2
	andps xmm1, xmm0
	movaps xmm0, xmm1
	orps xmm0, xmm5
	movss [ecx], xmm0
	mov edx, ecx
	add edx, 0x4
	mov eax, [ebp-0x24]
	mov [ecx+0x4], eax
	mov eax, [ebp-0x20]
	mov [edx+0x4], eax
	mov eax, [ebp-0x1c]
	mov [edx+0x8], eax
	mov eax, [ebp-0xcc]
	mov eax, [eax+0xc]
	mov [ecx+0x14], eax
	mov dword [ecx+0x10], 0x0
	mov byte [ecx+0x2a], 0x0
	jmp CM_Trace_130


;CM_BoxTrace(trace_t*, float const*, float const*, float const*, float const*, unsigned int, int)
CM_BoxTrace:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x8
	mov eax, [ebp+0x8]
	mov [ebp-0x10], eax
	mov edx, [ebp+0xc]
	mov ecx, [ebp+0x10]
	mov [ebp-0x14], ecx
	mov esi, [ebp+0x14]
	cld
	mov ebx, 0xb
	xor eax, eax
	mov edi, [ebp-0x10]
	mov ecx, ebx
	rep stosd
	mov eax, [ebp-0x10]
	mov dword [eax], 0x3f800000
	mov eax, [ebp+0x20]
	mov [ebp+0x14], eax
	mov eax, [ebp+0x1c]
	mov [ebp+0x10], eax
	mov eax, [ebp+0x18]
	mov [ebp+0xc], eax
	mov [ebp+0x8], esi
	mov ecx, [ebp-0x14]
	mov eax, [ebp-0x10]
	add esp, 0x8
	pop ebx
	pop esi
	pop edi
	pop ebp
	jmp CM_Trace


;CM_TempBoxModel(float const*, float const*, int)
CM_TempBoxModel:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x1c
	mov ebx, [ebp+0x8]
	mov edi, [ebp+0xc]
	mov dword [esp], 0x3
	call Sys_GetValue
	mov esi, [eax+0x8]
	mov edx, [eax+0xc]
	mov eax, [ebx]
	mov [edx], eax
	mov eax, [ebx+0x4]
	mov [edx+0x4], eax
	mov eax, [ebx+0x8]
	mov [edx+0x8], eax
	lea ecx, [edx+0xc]
	mov eax, [edi]
	mov [edx+0xc], eax
	mov eax, [edi+0x4]
	mov [ecx+0x4], eax
	mov eax, [edi+0x8]
	mov [ecx+0x8], eax
	mov eax, [ebx]
	mov [esi], eax
	mov eax, [ebx+0x4]
	mov [esi+0x4], eax
	mov eax, [ebx+0x8]
	mov [esi+0x8], eax
	lea edx, [esi+0x10]
	mov eax, [edi]
	mov [esi+0x10], eax
	mov eax, [edi+0x4]
	mov [edx+0x4], eax
	mov eax, [edi+0x8]
	mov [edx+0x8], eax
	mov eax, [ebp+0x10]
	mov [esi+0xc], eax
	mov eax, 0xfff
	add esp, 0x1c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


;CM_BoxSightTrace(int, float const*, float const*, float const*, float const*, unsigned int, int)
CM_BoxSightTrace:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x1cc
	mov edi, [ebp+0x10]
	mov esi, [ebp+0x14]
	mov eax, cm
	mov edx, [ebp+0x1c]
	cmp edx, [eax+0x84]
	jae CM_BoxSightTrace_10
	lea edx, [edx+edx*8]
	mov eax, [eax+0x88]
	lea edx, [eax+edx*8]
	mov [ebp-0x198], edx
CM_BoxSightTrace_200:
	mov dword [ebp-0xc8], 0x3f800000
	mov byte [ebp-0x9f], 0x0
	mov byte [ebp-0xa0], 0x0
	mov eax, [ebp+0x20]
	mov [ebp-0xf8], eax
	mov ecx, 0x1
	movss xmm3, dword [_float_0_50000000]
	movss xmm2, dword [_data16_7fffffff]
	mov edx, 0x4
	lea eax, [ebp-0x128]
CM_BoxSightTrace_20:
	mov ebx, [ebp+0x18]
	movss xmm1, dword [edx+ebx-0x4]
	movaps xmm0, xmm1
	addss xmm0, [edx+esi-0x4]
	mulss xmm0, xmm3
	subss xmm1, xmm0
	movss [eax+0xc], xmm1
	movaps xmm1, xmm0
	mov ebx, [ebp+0xc]
	addss xmm1, [edx+ebx-0x4]
	movss [eax-0x50], xmm1
	addss xmm0, [edx+edi-0x4]
	movss [eax-0x44], xmm0
	movaps xmm1, xmm0
	addss xmm1, [eax-0x50]
	mulss xmm1, xmm3
	movss [eax-0x18], xmm1
	subss xmm0, [eax-0x50]
	movss [edx+ebp-0x158], xmm0
	mulss xmm0, xmm3
	movss [edx+ebp-0x138], xmm0
	andps xmm0, xmm2
	movss [eax], xmm0
	add ecx, 0x1
	add edx, 0x4
	add eax, 0x4
	cmp ecx, 0x4
	jnz CM_BoxSightTrace_20
	lea eax, [ebp-0x178]
	mov [esp], eax
	call CM_CalcTraceExtents
	movss xmm0, dword [ebp-0x154]
	movss xmm1, dword [ebp-0x150]
	movss xmm2, dword [ebp-0x14c]
	mulss xmm0, xmm0
	mulss xmm1, xmm1
	addss xmm0, xmm1
	mulss xmm2, xmm2
	addss xmm0, xmm2
	movss [ebp-0x144], xmm0
	sqrtss xmm0, xmm0
	movss [ebp-0x148], xmm0
	movss xmm4, dword [ebp-0x11c]
	movss xmm2, dword [ebp-0x114]
	movaps xmm0, xmm2
	cmpss xmm0, xmm4, 0x5
	movaps xmm1, xmm4
	andps xmm1, xmm0
	movaps xmm3, xmm0
	andnps xmm3, xmm2
	orps xmm3, xmm1
	movss [ebp-0xf0], xmm3
	movss xmm1, dword [ebp-0x118]
	movaps xmm0, xmm4
	mulss xmm0, xmm4
	mulss xmm1, xmm1
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, xmm2
	addss xmm0, xmm1
	sqrtss xmm0, xmm0
	movss [ebp-0xdc], xmm0
	subss xmm2, xmm3
	movss [ebp-0xec], xmm2
	lea eax, [ebp-0x178]
	lea edx, [ebp-0x170]
CM_BoxSightTrace_40:
	movss xmm1, dword [eax]
	movss xmm0, dword [eax+0xc]
	ucomiss xmm0, xmm1
	jbe CM_BoxSightTrace_30
	subss xmm1, xmm3
	movss [eax+0x68], xmm1
	addss xmm0, xmm3
	movss [eax+0x74], xmm0
CM_BoxSightTrace_80:
	add eax, 0x4
	cmp edx, eax
	jnz CM_BoxSightTrace_40
	movss xmm1, dword [ebp-0x170]
	movss xmm0, dword [ebp-0x164]
	ucomiss xmm0, xmm1
	jbe CM_BoxSightTrace_50
	subss xmm1, [ebp-0xec]
	subss xmm1, [ebp-0xf0]
	movss [ebp-0x108], xmm1
	addss xmm0, [ebp-0xec]
	addss xmm0, [ebp-0xf0]
	movss [ebp-0xfc], xmm0
	movaps xmm2, xmm0
CM_BoxSightTrace_110:
	subss xmm2, [ebp-0x108]
	movss xmm1, dword [ebp-0x104]
	subss xmm1, [ebp-0x110]
	movss xmm0, dword [ebp-0x100]
	subss xmm0, [ebp-0x10c]
	mulss xmm1, xmm0
	mulss xmm2, xmm1
	movaps xmm0, xmm4
	mulss xmm0, [ebp-0x118]
	mulss xmm0, [ebp-0x114]
	mulss xmm0, [_float_16_00000000]
	mulss xmm0, [ebp-0x148]
	ucomiss xmm0, xmm2
	seta byte [ebp-0xf3]
	addss xmm4, [ebp-0x118]
	addss xmm4, [ebp-0x114]
	ucomiss xmm4, [_float_0_00000000]
	setz al
	setnp dl
	and al, dl
	mov [ebp-0xf4], al
	movss xmm0, dword [ebp-0xf0]
	movss [ebp-0xe8], xmm0
	movss [ebp-0xe4], xmm0
	addss xmm0, [ebp-0xec]
	movss [ebp-0xe0], xmm0
	mov dword [esp], 0x3
	call Sys_GetValue
	mov edx, [eax]
	add edx, 0x1
	mov [eax], edx
	mov [ebp-0xd8], edx
	mov edx, [eax+0x4]
	mov [ebp-0xd4], edx
	mov edx, [eax+0x8]
	mov [ebp-0xd0], edx
	mov ecx, [eax+0xc]
	mov [ebp-0xcc], ecx
	mov eax, [ebp+0x1c]
	test eax, eax
	jz CM_BoxSightTrace_60
	cmp dword [ebp+0x1c], 0xfff
	jz CM_BoxSightTrace_70
	lea ecx, [ebp-0xc8]
	mov edx, [ebp-0x198]
	add edx, 0x1c
	lea eax, [ebp-0x178]
	call CM_SightTraceThroughLeaf
	add esp, 0x1cc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_BoxSightTrace_30:
	subss xmm0, xmm3
	movss [eax+0x68], xmm0
	addss xmm1, xmm3
	movss [eax+0x74], xmm1
	jmp CM_BoxSightTrace_80
CM_BoxSightTrace_60:
	mov eax, [ebp+0x8]
	test eax, eax
	jle CM_BoxSightTrace_90
	mov edx, [ebp+0x8]
	sub edx, 0x1
	mov ecx, cm
	movzx eax, word [ecx+0x8c]
	cmp edx, eax
	jl CM_BoxSightTrace_100
CM_BoxSightTrace_90:
	lea eax, [ebp-0xc8]
	mov [esp+0x4], eax
	lea eax, [ebp-0x16c]
	mov [esp], eax
	lea ecx, [ebp-0x178]
	xor edx, edx
	mov eax, ecx
	call CM_SightTraceThroughTree
CM_BoxSightTrace_210:
	add esp, 0x1cc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_BoxSightTrace_50:
	subss xmm0, [ebp-0xec]
	subss xmm0, [ebp-0xf0]
	movss [ebp-0x108], xmm0
	addss xmm1, [ebp-0xec]
	addss xmm1, [ebp-0xf0]
	movss [ebp-0xfc], xmm1
	movaps xmm2, xmm1
	jmp CM_BoxSightTrace_110
CM_BoxSightTrace_70:
	mov eax, [edx+0xc]
	test [ebp-0xf8], eax
	jz CM_BoxSightTrace_120
	movss xmm2, dword [_float_1_00000000]
	movss xmm1, dword [ecx+0xc]
	addss xmm1, xmm2
	movss xmm0, dword [ebp-0x110]
	ucomiss xmm0, xmm1
	ja CM_BoxSightTrace_120
	movss xmm1, dword [ecx+0x10]
	addss xmm1, xmm2
	movss xmm0, dword [ebp-0x10c]
	ucomiss xmm0, xmm1
	ja CM_BoxSightTrace_120
	movss xmm1, dword [ecx+0x14]
	addss xmm1, xmm2
	movss xmm0, dword [ebp-0x108]
	ucomiss xmm0, xmm1
	ja CM_BoxSightTrace_120
	movss xmm0, dword [ecx]
	subss xmm0, xmm2
	ucomiss xmm0, [ebp-0x104]
	ja CM_BoxSightTrace_120
	movss xmm0, dword [ecx+0x4]
	subss xmm0, xmm2
	ucomiss xmm0, [ebp-0x100]
	ja CM_BoxSightTrace_120
	movss xmm0, dword [ecx+0x8]
	subss xmm0, xmm2
	ucomiss xmm0, [ebp-0xfc]
	ja CM_BoxSightTrace_120
	movss xmm4, dword [ebp-0x178]
	movss [ebp-0x6c], xmm4
	movss xmm5, dword [ebp-0x174]
	movss [ebp-0x68], xmm5
	movss xmm6, dword [ebp-0x170]
	movss xmm2, dword [ebp-0xec]
	movaps xmm0, xmm2
	addss xmm0, xmm6
	movss [ebp-0x194], xmm0
	movss [ebp-0x64], xmm0
	movss [ebp-0x78], xmm4
	movss [ebp-0x74], xmm5
	movaps xmm7, xmm6
	subss xmm7, xmm2
	movss [ebp-0x70], xmm7
	mov edx, [ebp-0x16c]
	mov [ebp-0x84], edx
	mov eax, [ebp-0x168]
	mov [ebp-0x80], eax
	movss xmm1, dword [ebp-0x164]
	movaps xmm0, xmm2
	addss xmm0, xmm1
	movss [ebp-0x7c], xmm0
	mov [ebp-0x30], edx
	mov [ebp-0x2c], eax
	subss xmm1, xmm2
	movss [ebp-0x28], xmm1
	mov eax, ecx
	mov ecx, 0x1
	movss xmm3, dword [_float_0_50000000]
	lea esi, [ebp-0x3c]
	lea ebx, [ebp-0x9c]
	mov edx, 0x4
CM_BoxSightTrace_130:
	movss xmm0, dword [eax]
	movss xmm2, dword [eax+0xc]
	movaps xmm1, xmm0
	addss xmm1, xmm2
	mulss xmm1, xmm3
	movss [edx+esi-0x4], xmm1
	subss xmm0, xmm1
	movss [edx+ebx-0x4], xmm0
	subss xmm2, xmm1
	movss [edx+ebx+0x8], xmm2
	add ecx, 0x1
	add edx, 0x4
	add eax, 0x4
	cmp ecx, 0x4
	jnz CM_BoxSightTrace_130
	movss xmm0, dword [ebp-0x88]
	movaps xmm1, xmm0
	minss xmm1, dword [ebp-0x90]
	movss [ebp-0x184], xmm1
	subss xmm0, xmm1
	movss [ebp-0x180], xmm0
	movss xmm0, dword [ebp-0x3c]
	movss [ebp-0x190], xmm0
	movss [ebp-0x54], xmm0
	movss xmm1, dword [ebp-0x38]
	movss [ebp-0x18c], xmm1
	movss [ebp-0x50], xmm1
	movss xmm0, dword [ebp-0x34]
	movss [ebp-0x188], xmm0
	movss [ebp-0x4c], xmm0
	movss xmm0, dword [ebp-0x180]
	addss xmm0, [ebp-0x4c]
	movss [ebp-0x4c], xmm0
	movss xmm1, dword [ebp-0x190]
	movss [ebp-0x60], xmm1
	movss xmm1, dword [ebp-0x18c]
	movss [ebp-0x5c], xmm1
	movss xmm1, dword [ebp-0x188]
	subss xmm1, [ebp-0x180]
	movss [ebp-0x58], xmm1
	ucomiss xmm7, xmm0
	ja CM_BoxSightTrace_140
	pxor xmm7, xmm7
	ucomiss xmm1, [ebp-0x194]
	ja CM_BoxSightTrace_150
CM_BoxSightTrace_250:
	subss xmm4, [ebp-0x190]
	movss [ebp-0x48], xmm4
	movaps xmm3, xmm5
	subss xmm3, [ebp-0x18c]
	movss [ebp-0x44], xmm3
	movaps xmm5, xmm6
	subss xmm5, [ebp-0x188]
	movss [ebp-0x40], xmm5
	movss xmm6, dword [ebp-0xf0]
	movss xmm0, dword [ebp-0x184]
	addss xmm0, xmm6
	movaps xmm2, xmm4
	mulss xmm2, xmm4
	movaps xmm1, xmm3
	mulss xmm1, xmm3
	addss xmm2, xmm1
	mulss xmm0, xmm0
	subss xmm2, xmm0
	ucomiss xmm7, xmm2
	jae CM_BoxSightTrace_160
	movss xmm1, dword [ebp-0x154]
	movss xmm0, dword [ebp-0x150]
	mulss xmm4, xmm1
	mulss xmm3, xmm0
	addss xmm4, xmm3
	ucomiss xmm4, xmm7
	jb CM_BoxSightTrace_170
CM_BoxSightTrace_220:
	movss xmm1, dword [ebp-0x4c]
	movss xmm0, dword [ebp-0x28]
	ucomiss xmm0, xmm1
	jbe CM_BoxSightTrace_180
	ucomiss xmm1, [ebp-0x70]
	jb CM_BoxSightTrace_120
	lea ecx, [ebp-0x30]
	lea edx, [ebp-0x78]
	lea eax, [ebp-0xc8]
	mov [esp+0x4], eax
	lea eax, [ebp-0x54]
CM_BoxSightTrace_230:
	mov [esp], eax
	movss xmm0, dword [ebp-0x184]
	lea eax, [ebp-0x178]
	call CM_SightTraceSphereThroughSphere
	test eax, eax
	jz CM_BoxSightTrace_190
CM_BoxSightTrace_120:
	xor eax, eax
CM_BoxSightTrace_270:
	add esp, 0x1cc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_BoxSightTrace_10:
	mov dword [esp], 0x3
	call Sys_GetValue
	mov eax, [eax+0xc]
	mov [ebp-0x198], eax
	jmp CM_BoxSightTrace_200
CM_BoxSightTrace_100:
	lea edx, [edx+edx*4]
	shl edx, 0x4
	add edx, [ecx+0x90]
	lea eax, [ebp-0x178]
	call CM_SightTraceThroughBrush
	test eax, eax
	jz CM_BoxSightTrace_90
	jmp CM_BoxSightTrace_210
CM_BoxSightTrace_160:
	movss xmm0, dword [ebp-0x114]
	subss xmm0, xmm6
	addss xmm0, [ebp-0x180]
	andps xmm5, [_data16_7fffffff]
	xor eax, eax
	ucomiss xmm5, xmm0
	seta al
CM_BoxSightTrace_240:
	test eax, eax
	jnz CM_BoxSightTrace_220
CM_BoxSightTrace_190:
	mov eax, 0xffffffff
	jmp CM_BoxSightTrace_210
CM_BoxSightTrace_180:
	movss xmm1, dword [ebp-0x58]
	ucomiss xmm1, [ebp-0x7c]
	jbe CM_BoxSightTrace_120
	movss xmm0, dword [ebp-0x64]
	ucomiss xmm0, xmm1
	jb CM_BoxSightTrace_120
	lea ecx, [ebp-0x84]
	lea edx, [ebp-0x6c]
	lea eax, [ebp-0xc8]
	mov [esp+0x4], eax
	lea eax, [ebp-0x60]
	jmp CM_BoxSightTrace_230
CM_BoxSightTrace_170:
	movaps xmm3, xmm1
	mulss xmm3, xmm1
	mulss xmm0, xmm0
	addss xmm3, xmm0
	movaps xmm0, xmm4
	mulss xmm0, xmm4
	mulss xmm2, xmm3
	subss xmm0, xmm2
	ucomiss xmm7, xmm0
	ja CM_BoxSightTrace_220
	movss [ebp-0x40], xmm7
	lea eax, [ebp-0x24]
	mov [esp+0x4], eax
	lea eax, [ebp-0x48]
	mov [esp], eax
	movss [ebp-0x1a8], xmm0
	movss [ebp-0x1b8], xmm3
	movss [ebp-0x1c8], xmm4
	call Vec3NormalizeTo
	fstp dword [ebp-0x17c]
	movss xmm4, dword [ebp-0x1c8]
	movaps xmm2, xmm4
	mulss xmm2, [_float_0_12500000]
	divss xmm2, dword [ebp-0x17c]
	movaps xmm1, xmm4
	xorps xmm1, [_data16_80000000]
	movss xmm0, dword [ebp-0x1a8]
	sqrtss xmm0, xmm0
	subss xmm1, xmm0
	movss xmm3, dword [ebp-0x1b8]
	divss xmm1, xmm3
	addss xmm1, xmm2
	ucomiss xmm1, [ebp-0xc8]
	jae CM_BoxSightTrace_220
	movss xmm0, dword [ebp-0x114]
	subss xmm0, [ebp-0xf0]
	addss xmm0, [ebp-0x180]
	subss xmm1, xmm2
	mulss xmm1, [ebp-0x14c]
	addss xmm1, [ebp-0x170]
	subss xmm1, [ebp-0x188]
	andps xmm1, [_data16_7fffffff]
	xor eax, eax
	ucomiss xmm1, xmm0
	seta al
	jmp CM_BoxSightTrace_240
CM_BoxSightTrace_150:
	lea ecx, [ebp-0x84]
	lea edx, [ebp-0x6c]
	lea eax, [ebp-0xc8]
	mov [esp+0x4], eax
	lea eax, [ebp-0x60]
	mov [esp], eax
	movss xmm0, dword [ebp-0x184]
	lea eax, [ebp-0x178]
	call CM_SightTraceSphereThroughSphere
	test eax, eax
	jz CM_BoxSightTrace_190
	pxor xmm7, xmm7
	ucomiss xmm7, [ebp-0x14c]
	jae CM_BoxSightTrace_120
CM_BoxSightTrace_260:
	movss xmm6, dword [ebp-0x170]
	movss xmm4, dword [ebp-0x178]
	movss xmm5, dword [ebp-0x174]
	jmp CM_BoxSightTrace_250
CM_BoxSightTrace_140:
	lea ecx, [ebp-0x30]
	lea edx, [ebp-0x78]
	lea eax, [ebp-0xc8]
	mov [esp+0x4], eax
	lea eax, [ebp-0x54]
	mov [esp], eax
	movss xmm0, dword [ebp-0x184]
	lea eax, [ebp-0x178]
	call CM_SightTraceSphereThroughSphere
	test eax, eax
	jz CM_BoxSightTrace_190
	pxor xmm7, xmm7
	movss xmm0, dword [ebp-0x14c]
	ucomiss xmm0, xmm7
	jb CM_BoxSightTrace_260
	xor eax, eax
	jmp CM_BoxSightTrace_270
	nop


;CM_ContentsOfModel(unsigned int)
CM_ContentsOfModel:
	push ebp
	mov ebp, esp
	sub esp, 0x18
	mov eax, [ebp+0x8]
	mov ecx, cm
	cmp eax, [ecx+0x84]
	jae CM_ContentsOfModel_10
	lea edx, [eax+eax*8]
	mov eax, [ecx+0x88]
	lea edx, [eax+edx*8]
	mov eax, [edx+0x20]
	or eax, [edx+0x24]
	leave
	ret
CM_ContentsOfModel_10:
	mov dword [esp], 0x3
	call Sys_GetValue
	mov edx, [eax+0xc]
	mov eax, [edx+0x20]
	or eax, [edx+0x24]
	leave
	ret


;CM_ClipHandleToModel(unsigned int)
CM_ClipHandleToModel:
	push ebp
	mov ebp, esp
	sub esp, 0x18
	mov eax, [ebp+0x8]
	mov ecx, cm
	cmp [ecx+0x84], eax
	jbe CM_ClipHandleToModel_10
	lea edx, [eax+eax*8]
	mov eax, [ecx+0x88]
	lea eax, [eax+edx*8]
	leave
	ret
CM_ClipHandleToModel_10:
	mov dword [esp], 0x3
	call Sys_GetValue
	mov eax, [eax+0xc]
	leave
	ret


;Trace_GetDynEntHitId(trace_t const*, DynEntityDrawType*)
Trace_GetDynEntHitId:
	push ebp
	mov ebp, esp
	mov eax, [ebp+0x8]
	mov edx, [eax+0x1c]
	cmp edx, 0x2
	jz Trace_GetDynEntHitId_10
	cmp edx, 0x3
	jz Trace_GetDynEntHitId_20
	mov eax, 0xffff
	pop ebp
	ret
Trace_GetDynEntHitId_20:
	mov edx, [ebp+0xc]
	mov dword [edx], 0x1
	movzx eax, word [eax+0x20]
	pop ebp
	ret
Trace_GetDynEntHitId_10:
	mov edx, [ebp+0xc]
	mov dword [edx], 0x0
	movzx eax, word [eax+0x20]
	pop ebp
	ret
	add [eax], al


;Trace_GetEntityHitId(trace_t const*)
Trace_GetEntityHitId:
	push ebp
	mov ebp, esp
	mov ecx, [ebp+0x8]
	mov edx, [ecx+0x1c]
	lea eax, [edx-0x2]
	cmp eax, 0x1
	jbe Trace_GetEntityHitId_10
	sub edx, 0x1
	jz Trace_GetEntityHitId_20
	mov eax, 0x3ff
	pop ebp
	ret
Trace_GetEntityHitId_20:
	movzx eax, word [ecx+0x20]
	pop ebp
	ret
Trace_GetEntityHitId_10:
	mov eax, 0x3fe
	pop ebp
	ret


;CM_TransformedBoxTrace(trace_t*, float const*, float const*, float const*, float const*, unsigned int, int, float const*, float const*)
CM_TransformedBoxTrace:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x9c
	mov edi, [ebp+0x18]
	mov esi, [ebp+0x24]
	mov eax, [ebp+0x28]
	pxor xmm0, xmm0
	ucomiss xmm0, [eax]
	jnz CM_TransformedBoxTrace_10
	jp CM_TransformedBoxTrace_10
	ucomiss xmm0, [eax+0x4]
	jnz CM_TransformedBoxTrace_10
	jp CM_TransformedBoxTrace_10
	ucomiss xmm0, [eax+0x8]
	jp CM_TransformedBoxTrace_10
	jnz CM_TransformedBoxTrace_10
	mov ebx, 0x1
	movss xmm2, dword [_float_0_50000000]
	lea edx, [ebp-0x48]
	mov eax, 0x4
CM_TransformedBoxTrace_20:
	mov ecx, [ebp+0x14]
	movss xmm0, dword [eax+ecx-0x4]
	movaps xmm1, xmm0
	addss xmm1, [eax+edi-0x4]
	mulss xmm1, xmm2
	subss xmm0, xmm1
	movss [eax+edx-0x4], xmm0
	movss xmm0, dword [eax+edi-0x4]
	subss xmm0, xmm1
	movss [eax+edx+0x8], xmm0
	movaps xmm0, xmm1
	mov ecx, [ebp+0xc]
	addss xmm0, [eax+ecx-0x4]
	movss [eax+ebp-0x28], xmm0
	mov ecx, [ebp+0x10]
	addss xmm1, [eax+ecx-0x4]
	movss [eax+ebp-0x34], xmm1
	add ebx, 0x1
	add eax, 0x4
	cmp ebx, 0x4
	jnz CM_TransformedBoxTrace_20
	movss xmm0, dword [ebp-0x24]
	subss xmm0, [esi]
	movss [ebp-0x24], xmm0
	movss xmm0, dword [ebp-0x20]
	subss xmm0, [esi+0x4]
	movss [ebp-0x20], xmm0
	movss xmm0, dword [ebp-0x1c]
	subss xmm0, [esi+0x8]
	movss [ebp-0x1c], xmm0
	movss xmm0, dword [ebp-0x30]
	subss xmm0, [esi]
	movss [ebp-0x30], xmm0
	movss xmm0, dword [ebp-0x2c]
	subss xmm0, [esi+0x4]
	movss [ebp-0x2c], xmm0
	movss xmm0, dword [ebp-0x28]
	subss xmm0, [esi+0x8]
	movss [ebp-0x28], xmm0
	mov eax, [ebp+0x20]
	mov [esp+0xc], eax
	mov ecx, [ebp+0x1c]
	mov [esp+0x8], ecx
	lea eax, [ebp-0x3c]
	mov [esp+0x4], eax
	mov [esp], edx
	lea ecx, [ebp-0x30]
	lea edx, [ebp-0x24]
	mov eax, [ebp+0x8]
	call CM_Trace
	add esp, 0x9c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_TransformedBoxTrace_10:
	lea ebx, [ebp-0x6c]
	mov [esp+0x4], ebx
	mov [esp], eax
	call AnglesToAxis
	mov [esp+0x20], ebx
	mov [esp+0x1c], esi
	mov eax, [ebp+0x20]
	mov [esp+0x18], eax
	mov ecx, [ebp+0x1c]
	mov [esp+0x14], ecx
	mov [esp+0x10], edi
	mov eax, [ebp+0x14]
	mov [esp+0xc], eax
	mov ecx, [ebp+0x10]
	mov [esp+0x8], ecx
	mov eax, [ebp+0xc]
	mov [esp+0x4], eax
	mov ecx, [ebp+0x8]
	mov [esp], ecx
	call CM_TransformedBoxTraceRotated
	add esp, 0x9c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


;CM_TransformedBoxSightTrace(int, float const*, float const*, float const*, float const*, unsigned int, int, float const*, float const*)
CM_TransformedBoxSightTrace:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0xac
	mov ebx, [ebp+0x18]
	mov ecx, [ebp+0x24]
	mov edx, 0x1
	movss xmm2, dword [_float_0_50000000]
	lea esi, [ebp-0x48]
	mov eax, 0x4
CM_TransformedBoxSightTrace_10:
	mov edi, [ebp+0x14]
	movss xmm0, dword [eax+edi-0x4]
	movaps xmm1, xmm0
	addss xmm1, [eax+ebx-0x4]
	mulss xmm1, xmm2
	subss xmm0, xmm1
	movss [eax+esi-0x4], xmm0
	movss xmm0, dword [eax+ebx-0x4]
	subss xmm0, xmm1
	movss [eax+esi+0x8], xmm0
	movaps xmm0, xmm1
	mov edi, [ebp+0xc]
	addss xmm0, [eax+edi-0x4]
	movss [eax+ebp-0x28], xmm0
	mov edi, [ebp+0x10]
	addss xmm1, [eax+edi-0x4]
	movss [eax+ebp-0x34], xmm1
	add edx, 0x1
	add eax, 0x4
	cmp edx, 0x4
	jnz CM_TransformedBoxSightTrace_10
	movss xmm0, dword [ebp-0x24]
	subss xmm0, [ecx]
	movss [ebp-0x24], xmm0
	movss xmm0, dword [ebp-0x20]
	subss xmm0, [ecx+0x4]
	movss [ebp-0x20], xmm0
	movss xmm0, dword [ebp-0x1c]
	subss xmm0, [ecx+0x8]
	movss [ebp-0x1c], xmm0
	movss xmm0, dword [ebp-0x30]
	subss xmm0, [ecx]
	movss [ebp-0x30], xmm0
	movss xmm0, dword [ebp-0x2c]
	subss xmm0, [ecx+0x4]
	movss [ebp-0x2c], xmm0
	movss xmm0, dword [ebp-0x28]
	subss xmm0, [ecx+0x8]
	movss [ebp-0x28], xmm0
	pxor xmm0, xmm0
	mov eax, [ebp+0x28]
	ucomiss xmm0, [eax]
	jnz CM_TransformedBoxSightTrace_20
	jp CM_TransformedBoxSightTrace_20
	ucomiss xmm0, [eax+0x4]
	jnz CM_TransformedBoxSightTrace_30
	jp CM_TransformedBoxSightTrace_30
	ucomiss xmm0, [eax+0x8]
	jp CM_TransformedBoxSightTrace_30
	jz CM_TransformedBoxSightTrace_40
CM_TransformedBoxSightTrace_30:
	mov edi, [ebp+0x28]
	jmp CM_TransformedBoxSightTrace_50
CM_TransformedBoxSightTrace_20:
	mov edi, eax
CM_TransformedBoxSightTrace_50:
	lea eax, [ebp-0x6c]
	mov [esp+0x4], eax
	mov [esp], edi
	call AnglesToAxis
	movss xmm2, dword [ebp-0x24]
	movss xmm5, dword [ebp-0x20]
	movss xmm6, dword [ebp-0x1c]
	movss xmm4, dword [ebp-0x6c]
	movss xmm0, dword [ebp-0x68]
	movss [ebp-0x8c], xmm0
	movss xmm1, dword [ebp-0x64]
	movss [ebp-0x88], xmm1
	movaps xmm0, xmm2
	mulss xmm0, xmm4
	movss xmm1, dword [ebp-0x8c]
	mulss xmm1, xmm5
	addss xmm0, xmm1
	movss xmm1, dword [ebp-0x88]
	mulss xmm1, xmm6
	addss xmm0, xmm1
	movss [ebp-0x24], xmm0
	movss xmm3, dword [ebp-0x60]
	movss xmm0, dword [ebp-0x5c]
	movss [ebp-0x84], xmm0
	movss xmm1, dword [ebp-0x58]
	movss [ebp-0x80], xmm1
	movaps xmm0, xmm2
	mulss xmm0, xmm3
	movss xmm1, dword [ebp-0x84]
	mulss xmm1, xmm5
	addss xmm0, xmm1
	movss xmm1, dword [ebp-0x80]
	mulss xmm1, xmm6
	addss xmm0, xmm1
	movss [ebp-0x20], xmm0
	movss xmm0, dword [ebp-0x54]
	movss xmm7, dword [ebp-0x50]
	movss xmm1, dword [ebp-0x4c]
	movss [ebp-0x7c], xmm1
	mulss xmm2, xmm0
	mulss xmm5, xmm7
	addss xmm2, xmm5
	mulss xmm6, xmm1
	addss xmm2, xmm6
	movss [ebp-0x1c], xmm2
	movss xmm1, dword [ebp-0x30]
	movss xmm2, dword [ebp-0x2c]
	movss xmm5, dword [ebp-0x28]
	mulss xmm4, xmm1
	movss xmm6, dword [ebp-0x8c]
	mulss xmm6, xmm2
	addss xmm4, xmm6
	movss xmm6, dword [ebp-0x88]
	mulss xmm6, xmm5
	addss xmm4, xmm6
	movss [ebp-0x30], xmm4
	mulss xmm3, xmm1
	movss xmm4, dword [ebp-0x84]
	mulss xmm4, xmm2
	addss xmm3, xmm4
	movss xmm6, dword [ebp-0x80]
	mulss xmm6, xmm5
	addss xmm3, xmm6
	movss [ebp-0x2c], xmm3
	mulss xmm0, xmm1
	mulss xmm7, xmm2
	addss xmm0, xmm7
	mulss xmm5, [ebp-0x7c]
	movss [ebp-0x7c], xmm5
	addss xmm0, xmm5
	movss [ebp-0x28], xmm0
CM_TransformedBoxSightTrace_40:
	mov eax, [ebp+0x20]
	mov [esp+0x18], eax
	mov eax, [ebp+0x1c]
	mov [esp+0x14], eax
	lea eax, [ebp-0x3c]
	mov [esp+0x10], eax
	mov [esp+0xc], esi
	lea eax, [ebp-0x30]
	mov [esp+0x8], eax
	lea edi, [ebp-0x24]
	mov [esp+0x4], edi
	mov eax, [ebp+0x8]
	mov [esp], eax
	call CM_BoxSightTrace
	add esp, 0xac
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	add [eax], al


;CM_TransformedBoxTraceRotated(trace_t*, float const*, float const*, float const*, float const*, unsigned int, int, float const*, float const (*) [3])
CM_TransformedBoxTraceRotated:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x8c
	mov edx, [ebp+0x18]
	mov edi, [ebp+0x28]
	mov ebx, 0x1
	movss xmm2, dword [_float_0_50000000]
	lea ecx, [ebp-0x48]
	mov eax, 0x4
CM_TransformedBoxTraceRotated_10:
	mov esi, [ebp+0x14]
	movss xmm0, dword [eax+esi-0x4]
	movaps xmm1, xmm0
	addss xmm1, [eax+edx-0x4]
	mulss xmm1, xmm2
	subss xmm0, xmm1
	movss [eax+ecx-0x4], xmm0
	movss xmm0, dword [eax+edx-0x4]
	subss xmm0, xmm1
	movss [eax+ecx+0x8], xmm0
	movaps xmm0, xmm1
	mov esi, [ebp+0xc]
	addss xmm0, [eax+esi-0x4]
	movss [eax+ebp-0x28], xmm0
	mov esi, [ebp+0x10]
	addss xmm1, [eax+esi-0x4]
	movss [eax+ebp-0x34], xmm1
	add ebx, 0x1
	add eax, 0x4
	cmp ebx, 0x4
	jnz CM_TransformedBoxTraceRotated_10
	movss xmm2, dword [ebp-0x24]
	mov eax, [ebp+0x24]
	subss xmm2, [eax]
	movss xmm3, dword [ebp-0x20]
	subss xmm3, [eax+0x4]
	movss xmm4, dword [ebp-0x1c]
	subss xmm4, [eax+0x8]
	movss xmm5, dword [ebp-0x30]
	subss xmm5, [eax]
	movss xmm6, dword [ebp-0x2c]
	subss xmm6, [eax+0x4]
	movss xmm7, dword [ebp-0x28]
	subss xmm7, [eax+0x8]
	movaps xmm0, xmm2
	mulss xmm0, [edi]
	movaps xmm1, xmm3
	mulss xmm1, [edi+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mulss xmm1, [edi+0x8]
	addss xmm0, xmm1
	movss [ebp-0x24], xmm0
	movaps xmm0, xmm2
	mulss xmm0, [edi+0xc]
	movaps xmm1, xmm3
	mulss xmm1, [edi+0x10]
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mulss xmm1, [edi+0x14]
	addss xmm0, xmm1
	movss [ebp-0x20], xmm0
	mulss xmm2, [edi+0x18]
	mulss xmm3, [edi+0x1c]
	addss xmm2, xmm3
	mulss xmm4, [edi+0x20]
	addss xmm2, xmm4
	movss [ebp-0x1c], xmm2
	movaps xmm0, xmm5
	mulss xmm0, [edi]
	movaps xmm1, xmm6
	mulss xmm1, [edi+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm7
	mulss xmm1, [edi+0x8]
	addss xmm0, xmm1
	movss [ebp-0x30], xmm0
	movaps xmm0, xmm5
	mulss xmm0, [edi+0xc]
	movaps xmm1, xmm6
	mulss xmm1, [edi+0x10]
	addss xmm0, xmm1
	movaps xmm1, xmm7
	mulss xmm1, [edi+0x14]
	addss xmm0, xmm1
	movss [ebp-0x2c], xmm0
	mulss xmm5, [edi+0x18]
	mulss xmm6, [edi+0x1c]
	addss xmm5, xmm6
	mulss xmm7, [edi+0x20]
	addss xmm5, xmm7
	movss [ebp-0x28], xmm5
	mov edx, [ebp+0x8]
	movss xmm0, dword [edx]
	movss [ebp-0x7c], xmm0
	mov eax, [ebp+0x20]
	mov [esp+0xc], eax
	mov eax, [ebp+0x1c]
	mov [esp+0x8], eax
	lea eax, [ebp-0x3c]
	mov [esp+0x4], eax
	mov [esp], ecx
	lea ecx, [ebp-0x30]
	lea edx, [ebp-0x24]
	mov eax, [ebp+0x8]
	call CM_Trace
	movss xmm0, dword [ebp-0x7c]
	mov eax, [ebp+0x8]
	ucomiss xmm0, [eax]
	jbe CM_TransformedBoxTraceRotated_20
	xor esi, esi
	lea eax, [ebp-0x6c]
CM_TransformedBoxTraceRotated_50:
	lea ecx, [edi+esi*4]
	mov edx, eax
	lea ebx, [eax+0xc]
CM_TransformedBoxTraceRotated_30:
	mov eax, [ecx]
	mov [edx], eax
	add ecx, 0xc
	add edx, 0x4
	cmp edx, ebx
	jnz CM_TransformedBoxTraceRotated_30
	add esi, 0x1
	cmp esi, 0x3
	jz CM_TransformedBoxTraceRotated_40
	mov eax, edx
	jmp CM_TransformedBoxTraceRotated_50
CM_TransformedBoxTraceRotated_40:
	mov eax, [ebp+0x8]
	add eax, 0x4
	mov edx, [ebp+0x8]
	movss xmm2, dword [edx+0x4]
	movss xmm3, dword [eax+0x4]
	movss xmm4, dword [eax+0x8]
	movaps xmm0, xmm2
	mulss xmm0, [ebp-0x6c]
	movaps xmm1, xmm3
	mulss xmm1, [ebp-0x68]
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mulss xmm1, [ebp-0x64]
	addss xmm0, xmm1
	movss [edx+0x4], xmm0
	movaps xmm0, xmm2
	mulss xmm0, [ebp-0x60]
	movaps xmm1, xmm3
	mulss xmm1, [ebp-0x5c]
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mulss xmm1, [ebp-0x58]
	addss xmm0, xmm1
	movss [eax+0x4], xmm0
	mulss xmm2, [ebp-0x54]
	mulss xmm3, [ebp-0x50]
	addss xmm2, xmm3
	mulss xmm4, [ebp-0x4c]
	addss xmm2, xmm4
	movss [eax+0x8], xmm2
CM_TransformedBoxTraceRotated_20:
	add esp, 0x8c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	nop


;CM_TransformedBoxTraceExternal(trace_t*, float const*, float const*, float const*, float const*, unsigned int, int, float const*, float const*)
CM_TransformedBoxTraceExternal:
	push ebp
	mov ebp, esp
	push edi
	mov edx, [ebp+0x8]
	cld
	mov ecx, 0xb
	xor eax, eax
	mov edi, edx
	rep stosd
	mov dword [edx], 0x3f800000
	mov [ebp+0x8], edx
	pop edi
	pop ebp
	jmp CM_TransformedBoxTrace
	nop


;Initialized global or static variables of cm_trace:
SECTION .data


;Initialized constant data of cm_trace:
SECTION .rdata


;Zero initialized global or static variables of cm_trace:
SECTION .bss


;All cstrings:
SECTION .rdata



;All constant floats and doubles:
SECTION .rdata
_data16_7fffffff:		dd 0x7fffffff, 0x0, 0x0, 0x0	; OWORD
_float_1_00000000:		dd 0x3f800000	; 1
_float__1_00000000:		dd 0xbf800000	; -1
_float_0_12500000:		dd 0x3e000000	; 0.125
_data16_80000000:		dd 0x80000000, 0x0, 0x0, 0x0	; OWORD
_float_0_00000048:		dd 0x35000000	; 4.76837e-07
_float_0_50000000:		dd 0x3f000000	; 0.5
_float_16_00000000:		dd 0x41800000	; 16
_float_0_69999999:		dd 0x3f333333	; 0.7
_float_0_00000000:		dd 0x0	; 0

