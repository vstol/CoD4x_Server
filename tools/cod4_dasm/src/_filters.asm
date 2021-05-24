;Imports of filters:

;Exports of filters:
	global fir_mem_up
	global qmf_decomp
	global signal_div
	global signal_mul
	global comb_filter
	global compute_rms
	global filter_mem2
	global syn_percep_zero
	global residue_percep_zero
	global comb_filter_mem_init
	global compute_impulse_response
	global bw_lpc
	global fir_mem2
	global iir_mem2


SECTION .text


;fir_mem_up(float const*, float const*, float*, int, int, float*, char*)
fir_mem_up:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0xc
	mov eax, [ebp+0x20]
	mov edx, eax
	neg edx
	and edx, 0x3
	lea edx, [eax+edx]
	mov [ebp-0x18], edx
	mov eax, [ebp+0x14]
	shr eax, 0x1f
	mov edx, [ebp+0x14]
	lea ebx, [eax+edx]
	sar ebx, 1
	test ebx, ebx
	jle fir_mem_up_10
	mov ecx, [ebp+0x8]
	lea edx, [ecx+ebx*4]
	xor ecx, ecx
fir_mem_up_20:
	mov eax, [edx-0x4]
	mov esi, [ebp-0x18]
	mov [esi+ecx*8], eax
	add ecx, 0x1
	sub edx, 0x4
	cmp ebx, ecx
	jnz fir_mem_up_20
fir_mem_up_10:
	mov edi, [ebp+0x18]
	sub edi, 0x1
	test edi, edi
	jle fir_mem_up_30
	mov eax, [ebp+0x14]
	mov ecx, [ebp-0x18]
	lea edx, [ecx+eax*4]
	xor ecx, ecx
fir_mem_up_40:
	mov ebx, [ebp+0x1c]
	mov eax, [ebx+ecx*4+0x4]
	mov [edx], eax
	add ecx, 0x2
	add edx, 0x8
	cmp edi, ecx
	jg fir_mem_up_40
fir_mem_up_30:
	mov edx, [ebp+0x14]
	test edx, edx
	jle fir_mem_up_50
	mov eax, [ebp+0x14]
	mov edx, [ebp-0x18]
	lea esi, [edx+eax*4]
	mov dword [ebp-0x10], 0x0
	mov ebx, [ebp+0x10]
fir_mem_up_80:
	movss xmm4, dword [esi-0x10]
	mov eax, [ebp+0x18]
	test eax, eax
	jle fir_mem_up_60
	lea edx, [esi-0x8]
	xor ecx, ecx
	pxor xmm5, xmm5
	movss [ebp-0x14], xmm5
	movaps xmm7, xmm5
	movaps xmm6, xmm5
	mov eax, [ebp+0xc]
fir_mem_up_70:
	movss xmm1, dword [eax]
	movss xmm3, dword [eax+0x4]
	movss xmm2, dword [edx]
	movaps xmm0, xmm1
	mulss xmm0, xmm2
	addss xmm6, xmm0
	movaps xmm0, xmm3
	mulss xmm0, xmm2
	addss xmm7, xmm0
	mulss xmm1, xmm4
	addss xmm1, [ebp-0x14]
	movss [ebp-0x14], xmm1
	mulss xmm4, xmm3
	addss xmm5, xmm4
	movss xmm1, dword [eax+0x8]
	movss xmm3, dword [eax+0xc]
	movss xmm4, dword [edx+0x8]
	movaps xmm0, xmm1
	mulss xmm0, xmm4
	addss xmm6, xmm0
	movaps xmm0, xmm3
	mulss xmm0, xmm4
	addss xmm7, xmm0
	mulss xmm1, xmm2
	addss xmm1, [ebp-0x14]
	movss [ebp-0x14], xmm1
	mulss xmm2, xmm3
	addss xmm5, xmm2
	add ecx, 0x4
	add eax, 0x10
	add edx, 0x10
	cmp [ebp+0x18], ecx
	jg fir_mem_up_70
fir_mem_up_110:
	movss [ebx], xmm6
	movss [ebx+0x4], xmm7
	movss xmm0, dword [ebp-0x14]
	movss [ebx+0x8], xmm0
	movss [ebx+0xc], xmm5
	add dword [ebp-0x10], 0x4
	add ebx, 0x10
	sub esi, 0x10
	mov eax, [ebp-0x10]
	cmp [ebp+0x14], eax
	jg fir_mem_up_80
fir_mem_up_50:
	test edi, edi
	jle fir_mem_up_90
	xor ecx, ecx
fir_mem_up_100:
	lea edx, [ecx*4]
	mov ebx, [ebp-0x18]
	mov eax, [ebx+edx]
	mov esi, [ebp+0x1c]
	mov [esi+edx+0x4], eax
	add ecx, 0x2
	cmp ecx, edi
	jl fir_mem_up_100
fir_mem_up_90:
	add esp, 0xc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
fir_mem_up_60:
	pxor xmm5, xmm5
	movss [ebp-0x14], xmm5
	movaps xmm7, xmm5
	movaps xmm6, xmm5
	jmp fir_mem_up_110
	nop


;qmf_decomp(float const*, float const*, float*, float*, int, int, float*, char*)
qmf_decomp:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x30
	mov edi, [ebp+0x1c]
	mov eax, [ebp+0x24]
	mov ecx, 0x4
	mov edx, ecx
	sub edx, eax
	and edx, 0x3
	add eax, edx
	lea edx, [edi*4]
	mov [ebp-0x3c], edx
	add eax, edx
	mov ebx, eax
	sub ebx, edx
	mov [ebp-0x28], ebx
	sub ecx, eax
	and ecx, 0x3
	lea esi, [eax+ecx]
	add edx, esi
	mov [ebp-0x34], edx
	sub edx, 0x4
	mov [ebp-0x24], edx
	mov eax, edi
	sar eax, 1
	mov [ebp-0x2c], eax
	test edi, edi
	jle qmf_decomp_10
	mov edx, ebx
	add edx, [ebp-0x3c]
	xor ecx, ecx
qmf_decomp_20:
	mov ebx, [ebp+0xc]
	mov eax, [ebx+ecx*4]
	mov [edx-0x4], eax
	add ecx, 0x1
	sub edx, 0x4
	cmp edi, ecx
	jnz qmf_decomp_20
qmf_decomp_10:
	sub edi, 0x1
	mov [ebp-0x30], edi
	test edi, edi
	jle qmf_decomp_30
	mov edx, [ebp+0x20]
	add edx, [ebp-0x3c]
	xor ecx, ecx
qmf_decomp_40:
	mov eax, [edx-0x8]
	mov [esi+ecx*4], eax
	add ecx, 0x1
	sub edx, 0x4
	cmp [ebp-0x30], ecx
	jnz qmf_decomp_40
qmf_decomp_30:
	mov eax, [ebp+0x18]
	test eax, eax
	jle qmf_decomp_50
	mov edx, [ebp-0x34]
	xor ecx, ecx
qmf_decomp_60:
	mov ebx, [ebp+0x8]
	mov eax, [ebx+ecx*4]
	mov [edx-0x4], eax
	add ecx, 0x1
	add edx, 0x4
	cmp [ebp+0x18], ecx
	jnz qmf_decomp_60
	mov eax, [ebp-0x24]
	mov [ebp-0x18], eax
	mov [ebp-0x14], esi
	mov dword [ebp-0x1c], 0x2
	mov eax, [ebp-0x1c]
qmf_decomp_100:
	add eax, eax
	mov edx, [ebp+0x10]
	add edx, eax
	lea ecx, [edx-0x4]
	mov [ebp-0x10], ecx
	mov dword [edx-0x4], 0x0
	add eax, [ebp+0x14]
	lea edi, [eax-0x4]
	mov dword [eax-0x4], 0x0
	mov eax, [ebp-0x2c]
	test eax, eax
	jle qmf_decomp_70
	mov esi, [ebp-0x14]
	mov ebx, [ebp-0x18]
	mov ecx, esi
	mov [ebp-0x38], ebx
	mov dword [ebp-0x20], 0x2
	mov eax, [ebp-0x28]
	add eax, 0x8
	jmp qmf_decomp_80
qmf_decomp_90:
	add dword [ebp-0x20], 0x2
	add eax, 0x8
qmf_decomp_80:
	movss xmm0, dword [esi]
	addss xmm0, [ebx]
	mulss xmm0, [eax-0x8]
	mov edx, [ebp-0x10]
	addss xmm0, [edx]
	movss [edx], xmm0
	movss xmm1, dword [esi]
	subss xmm1, [ebx]
	mulss xmm1, [eax-0x8]
	movss xmm0, dword [edi]
	subss xmm0, xmm1
	movss [edi], xmm0
	movss xmm0, dword [ecx+0x4]
	mov edx, [ebp-0x38]
	addss xmm0, [edx-0x4]
	mulss xmm0, [eax-0x4]
	mov edx, [ebp-0x10]
	addss xmm0, [edx]
	movss [edx], xmm0
	movss xmm0, dword [ecx+0x4]
	mov edx, [ebp-0x38]
	subss xmm0, [edx-0x4]
	mulss xmm0, [eax-0x4]
	addss xmm0, [edi]
	movss [edi], xmm0
	add esi, 0x8
	sub ebx, 0x8
	add ecx, 0x8
	sub edx, 0x8
	mov [ebp-0x38], edx
	mov edx, [ebp-0x20]
	cmp [ebp-0x2c], edx
	jg qmf_decomp_90
qmf_decomp_70:
	add dword [ebp-0x18], 0x8
	add dword [ebp-0x14], 0x8
	mov ecx, [ebp-0x1c]
	cmp [ebp+0x18], ecx
	jle qmf_decomp_50
	add ecx, 0x2
	mov [ebp-0x1c], ecx
	mov eax, ecx
	jmp qmf_decomp_100
qmf_decomp_50:
	mov eax, [ebp-0x30]
	test eax, eax
	jle qmf_decomp_110
	mov ebx, [ebp+0x18]
	mov eax, [ebp+0x8]
	lea edx, [eax+ebx*4]
	xor ecx, ecx
qmf_decomp_120:
	mov eax, [edx-0x4]
	mov ebx, [ebp+0x20]
	mov [ebx+ecx*4], eax
	add ecx, 0x1
	sub edx, 0x4
	cmp ecx, [ebp-0x30]
	jnz qmf_decomp_120
qmf_decomp_110:
	add esp, 0x30
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	nop


;signal_div(float const*, float*, float, int)
signal_div:
	push ebp
	mov ebp, esp
	push ebx
	mov ebx, [ebp+0x8]
	mov ecx, [ebp+0xc]
	mov edx, [ebp+0x14]
	movss xmm1, dword [_float_1_00000000]
	divss xmm1, dword [ebp+0x10]
	test edx, edx
	jle signal_div_10
	xor eax, eax
signal_div_20:
	movaps xmm0, xmm1
	mulss xmm0, [ebx+eax*4]
	movss [ecx+eax*4], xmm0
	add eax, 0x1
	cmp edx, eax
	jnz signal_div_20
signal_div_10:
	pop ebx
	pop ebp
	ret
	nop


;signal_mul(float const*, float*, float, int)
signal_mul:
	push ebp
	mov ebp, esp
	push ebx
	mov ebx, [ebp+0x8]
	mov ecx, [ebp+0xc]
	movss xmm1, dword [ebp+0x10]
	mov edx, [ebp+0x14]
	test edx, edx
	jle signal_mul_10
	xor eax, eax
signal_mul_20:
	movaps xmm0, xmm1
	mulss xmm0, [ebx+eax*4]
	movss [ecx+eax*4], xmm0
	add eax, 0x1
	cmp edx, eax
	jnz signal_mul_20
signal_mul_10:
	pop ebx
	pop ebp
	ret
	nop


;comb_filter(float*, float*, float*, int, int, int, float*, float, CombFilterMem*)
comb_filter:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x4c
	mov edi, [ebp+0x18]
	movss xmm1, dword [ebp+0x24]
	mov esi, [ebp+0x28]
	pxor xmm2, xmm2
	test edi, edi
	jle comb_filter_10
	xor eax, eax
	pxor xmm2, xmm2
	mov edx, [ebp+0x8]
comb_filter_20:
	movss xmm0, dword [edx+eax*4]
	mulss xmm0, xmm0
	addss xmm2, xmm0
	add eax, 0x1
	cmp edi, eax
	jnz comb_filter_20
comb_filter_10:
	cvtsi2ss xmm0, edi
	movss [ebp-0x24], xmm0
	divss xmm2, xmm0
	cvtss2sd xmm0, xmm2
	addsd xmm0, [_double_0_10000000]
	sqrtsd xmm0, xmm0
	cvtsd2ss xmm0, xmm0
	movss [ebp-0x2c], xmm0
	mov eax, [ebp+0x20]
	add eax, 0x4
	mov [ebp-0x34], eax
	mov edx, [ebp+0x20]
	movss xmm0, dword [edx+0x4]
	pxor xmm2, xmm2
	ucomiss xmm2, xmm0
	ja comb_filter_30
	mov eax, edx
	cvtss2sd xmm3, xmm0
	movss xmm2, dword [eax]
	pxor xmm0, xmm0
	ucomiss xmm2, xmm0
	jbe comb_filter_40
comb_filter_180:
	cvtss2sd xmm0, xmm2
	addsd xmm3, xmm0
	mov eax, [ebp+0x20]
	add eax, 0x8
	mov [ebp-0x30], eax
	mov edx, [ebp+0x20]
	movss xmm0, dword [edx+0x8]
	pxor xmm4, xmm4
	ucomiss xmm0, xmm4
	jbe comb_filter_50
comb_filter_190:
	cvtss2sd xmm0, xmm0
	addsd xmm3, xmm0
	movss xmm6, dword [esi+0x8]
	movaps xmm0, xmm6
	pxor xmm4, xmm4
	ucomiss xmm4, xmm6
	ja comb_filter_60
comb_filter_200:
	cvtss2sd xmm5, xmm0
	movss xmm4, dword [esi+0x4]
	pxor xmm0, xmm0
	ucomiss xmm4, xmm0
	jbe comb_filter_70
comb_filter_210:
	cvtss2sd xmm0, xmm4
	movapd xmm7, xmm0
	addsd xmm7, xmm5
	movss xmm5, dword [esi+0xc]
	pxor xmm0, xmm0
	ucomiss xmm5, xmm0
	jbe comb_filter_80
comb_filter_220:
	cvtss2sd xmm0, xmm5
comb_filter_230:
	addsd xmm0, xmm7
	addsd xmm3, xmm0
	mulsd xmm3, [_double_0_50000000]
	cvtsd2ss xmm7, xmm3
	cvtss2sd xmm3, xmm7
	movsd xmm0, qword [_double_1_30000000]
	ucomisd xmm3, xmm0
	jbe comb_filter_90
	cvtss2sd xmm1, xmm1
	divsd xmm0, xmm3
	mulsd xmm1, xmm0
	cvtsd2ss xmm1, xmm1
comb_filter_90:
	ucomiss xmm7, [_float_0_50000000]
	jae comb_filter_100
	jp comb_filter_100
	cvtss2sd xmm0, xmm1
	addsd xmm3, xmm3
	mulsd xmm0, xmm3
	cvtsd2ss xmm1, xmm0
comb_filter_100:
	cvtsi2sd xmm0, edi
	movsd xmm3, qword [_double_1_00000000]
	divsd xmm3, xmm0
	cvtsd2ss xmm0, xmm3
	movss [ebp-0x28], xmm0
	test edi, edi
	jle comb_filter_110
	cvtss2sd xmm1, xmm1
	movsd [ebp-0x20], xmm1
	mov eax, [ebp+0x1c]
	shl eax, 0x2
	mov edx, [ebp+0x8]
	sub edx, eax
	lea ecx, [edx+0x4]
	pxor xmm7, xmm7
	xor ebx, ebx
	jmp comb_filter_120
comb_filter_130:
	mov eax, [ebp+0x20]
	movss xmm2, dword [eax]
	movss xmm6, dword [esi+0x8]
	movss xmm4, dword [esi+0x4]
	movss xmm5, dword [esi+0xc]
comb_filter_120:
	addss xmm7, [ebp-0x28]
	mov eax, ebx
	sub eax, [esi]
	mov edx, [ebp+0x8]
	lea eax, [edx+eax*4]
	mov [ebp-0x4c], eax
	lea eax, [ebx*4]
	mov [ebp-0x3c], eax
	cvtss2sd xmm3, [edx+eax]
	mulss xmm2, [ecx]
	mov edx, [ebp-0x34]
	movss xmm0, dword [edx]
	mulss xmm0, [ecx-0x4]
	addss xmm2, xmm0
	mov eax, [ebp-0x30]
	movss xmm0, dword [eax]
	mulss xmm0, [ecx-0x8]
	addss xmm2, xmm0
	mulss xmm2, xmm7
	cvtss2sd xmm1, xmm2
	cvtss2sd xmm0, xmm7
	movsd xmm2, qword [_double_1_00000000]
	subsd xmm2, xmm0
	mov edx, [ebp-0x4c]
	mulss xmm4, [edx+0x4]
	mulss xmm6, [edx]
	addss xmm4, xmm6
	mulss xmm5, [edx-0x4]
	addss xmm4, xmm5
	cvtss2sd xmm0, xmm4
	mulsd xmm2, xmm0
	addsd xmm1, xmm2
	mulsd xmm1, [ebp-0x20]
	addsd xmm3, xmm1
	cvtsd2ss xmm0, xmm3
	mov eax, [ebp+0xc]
	mov edx, [ebp-0x3c]
	movss [eax+edx], xmm0
	add ebx, 0x1
	add ecx, 0x4
	cmp edi, ebx
	jnz comb_filter_130
	mov eax, [ebp+0x20]
	movss xmm2, dword [eax]
comb_filter_110:
	movss [esi+0x4], xmm2
	mov edx, [ebp-0x34]
	mov eax, [edx]
	mov [esi+0x8], eax
	mov edx, [ebp-0x30]
	mov eax, [edx]
	mov [esi+0xc], eax
	mov eax, [ebp+0x1c]
	mov [esi], eax
	pxor xmm1, xmm1
	test edi, edi
	jle comb_filter_140
	xor eax, eax
	pxor xmm1, xmm1
	mov edx, [ebp+0xc]
comb_filter_150:
	movss xmm0, dword [edx+eax*4]
	mulss xmm0, xmm0
	addss xmm1, xmm0
	add eax, 0x1
	cmp edi, eax
	jnz comb_filter_150
comb_filter_140:
	divss xmm1, dword [ebp-0x24]
	cvtss2sd xmm0, xmm1
	addsd xmm0, [_double_0_10000000]
	sqrtsd xmm0, xmm0
	cvtsd2ss xmm0, xmm0
	movaps xmm1, xmm0
	minss xmm1, dword [ebp-0x2c]
	addss xmm0, [_float_1_00000000]
	divss xmm1, xmm0
	movss xmm0, dword [_float_0_50000000]
	maxss xmm0, xmm1
	test edi, edi
	jle comb_filter_160
	cvtss2sd xmm1, xmm0
	mulsd xmm1, [_double_0_04000000]
	xor edx, edx
	movsd xmm2, qword [_double_0_96000000]
	mov eax, [ebp+0xc]
comb_filter_170:
	cvtss2sd xmm0, [esi+0x10]
	mulsd xmm0, xmm2
	addsd xmm0, xmm1
	cvtsd2ss xmm0, xmm0
	movss [esi+0x10], xmm0
	mulss xmm0, [eax]
	movss [eax], xmm0
	add edx, 0x1
	add eax, 0x4
	cmp edi, edx
	jnz comb_filter_170
comb_filter_160:
	add esp, 0x4c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
comb_filter_30:
	xorps xmm0, [_data16_80000000]
	mov eax, [ebp+0x20]
	cvtss2sd xmm3, xmm0
	movss xmm2, dword [eax]
	pxor xmm0, xmm0
	ucomiss xmm2, xmm0
	ja comb_filter_180
comb_filter_40:
	cvtss2sd xmm0, xmm2
	mulsd xmm0, [_double__0_50000000]
	addsd xmm3, xmm0
	mov eax, [ebp+0x20]
	add eax, 0x8
	mov [ebp-0x30], eax
	mov edx, [ebp+0x20]
	movss xmm0, dword [edx+0x8]
	pxor xmm4, xmm4
	ucomiss xmm0, xmm4
	ja comb_filter_190
comb_filter_50:
	cvtss2sd xmm0, xmm0
	mulsd xmm0, [_double__0_50000000]
	addsd xmm3, xmm0
	movss xmm6, dword [esi+0x8]
	movaps xmm0, xmm6
	pxor xmm4, xmm4
	ucomiss xmm4, xmm6
	jbe comb_filter_200
comb_filter_60:
	xorps xmm0, [_data16_80000000]
	cvtss2sd xmm5, xmm0
	movss xmm4, dword [esi+0x4]
	pxor xmm0, xmm0
	ucomiss xmm4, xmm0
	ja comb_filter_210
comb_filter_70:
	cvtss2sd xmm0, xmm4
	mulsd xmm0, [_double__0_50000000]
	movapd xmm7, xmm0
	addsd xmm7, xmm5
	movss xmm5, dword [esi+0xc]
	pxor xmm0, xmm0
	ucomiss xmm5, xmm0
	ja comb_filter_220
comb_filter_80:
	cvtss2sd xmm0, xmm5
	mulsd xmm0, [_double__0_50000000]
	jmp comb_filter_230


;compute_rms(float const*, int)
compute_rms:
	push ebp
	mov ebp, esp
	sub esp, 0x4
	mov ecx, [ebp+0x8]
	mov edx, [ebp+0xc]
	pxor xmm1, xmm1
	test edx, edx
	jle compute_rms_10
	xor eax, eax
	pxor xmm1, xmm1
compute_rms_20:
	movss xmm0, dword [ecx+eax*4]
	mulss xmm0, xmm0
	addss xmm1, xmm0
	add eax, 0x1
	cmp edx, eax
	jnz compute_rms_20
compute_rms_10:
	cvtsi2ss xmm0, edx
	divss xmm1, xmm0
	cvtss2sd xmm0, xmm1
	addsd xmm0, [_double_0_10000000]
	sqrtsd xmm0, xmm0
	cvtsd2ss xmm0, xmm0
	movss [ebp-0x4], xmm0
	fld dword [ebp-0x4]
	leave
	ret


;filter_mem2(float const*, float const*, float const*, float*, int, int, float*)
filter_mem2:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x2c
	mov eax, [ebp+0x1c]
	mov edi, [ebp+0x20]
	mov edx, [ebp+0x18]
	test edx, edx
	jle filter_mem2_10
	lea esi, [eax-0x1]
	shl eax, 0x2
	lea edx, [edi+eax-0x4]
	mov [ebp-0x24], edx
	mov ebx, [ebp+0xc]
	lea ebx, [eax+ebx-0x4]
	mov [ebp-0x20], ebx
	mov edx, [ebp+0x10]
	lea eax, [eax+edx-0x4]
	mov [ebp-0x1c], eax
	mov dword [ebp-0x2c], 0x0
	movss xmm5, dword [_data16_80000000]
	mov ebx, [ebp-0x2c]
filter_mem2_40:
	mov eax, [ebp+0x8]
	movss xmm2, dword [eax+ebx*4]
	movaps xmm3, xmm2
	addss xmm3, [edi]
	movaps xmm4, xmm3
	xorps xmm4, xmm5
	test esi, esi
	jle filter_mem2_20
	xor ecx, ecx
filter_mem2_30:
	lea eax, [ecx*4]
	lea edx, [edi+eax]
	movaps xmm0, xmm2
	mov ebx, [ebp+0xc]
	mulss xmm0, [eax+ebx]
	addss xmm0, [edx+0x4]
	movaps xmm1, xmm4
	mov ebx, [ebp+0x10]
	mulss xmm1, [eax+ebx]
	addss xmm0, xmm1
	movss [edx], xmm0
	add ecx, 0x1
	cmp ecx, esi
	jnz filter_mem2_30
filter_mem2_20:
	mov eax, [ebp-0x20]
	mulss xmm2, [eax]
	movaps xmm0, xmm3
	mov edx, [ebp-0x1c]
	mulss xmm0, [edx]
	subss xmm2, xmm0
	mov ebx, [ebp-0x24]
	movss [ebx], xmm2
	mov eax, [ebp-0x2c]
	mov edx, [ebp+0x14]
	movss [edx+eax*4], xmm3
	add eax, 0x1
	mov [ebp-0x2c], eax
	cmp [ebp+0x18], eax
	jz filter_mem2_10
	mov ebx, eax
	jmp filter_mem2_40
filter_mem2_10:
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	nop


;syn_percep_zero(float const*, float const*, float const*, float const*, float*, int, int, char*)
syn_percep_zero:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x3c
	mov edi, [ebp+0xc]
	mov edx, [ebp+0x24]
	mov eax, edx
	neg eax
	and eax, 0x3
	lea ebx, [edx+eax]
	mov eax, [ebp+0x20]
	test eax, eax
	jle syn_percep_zero_10
	xor eax, eax
syn_percep_zero_20:
	mov dword [ebx+eax*4], 0x0
	add eax, 0x1
	cmp [ebp+0x20], eax
	jnz syn_percep_zero_20
syn_percep_zero_10:
	mov eax, [ebp+0x1c]
	test eax, eax
	jle syn_percep_zero_30
	mov esi, [ebp+0x20]
	sub esi, 0x1
	mov eax, [ebp+0x20]
	shl eax, 0x2
	lea edx, [ebx+eax-0x4]
	mov [ebp-0x2c], edx
	lea eax, [edi+eax-0x4]
	mov [ebp-0x28], eax
	xor ecx, ecx
	movss xmm5, dword [_data16_80000000]
syn_percep_zero_60:
	mov eax, [ebp+0x8]
	movss xmm1, dword [eax+ecx*4]
	addss xmm1, [ebx]
	movaps xmm2, xmm1
	xorps xmm2, xmm5
	test esi, esi
	jle syn_percep_zero_40
	xor edx, edx
	mov eax, ebx
syn_percep_zero_50:
	movaps xmm0, xmm2
	mulss xmm0, [edi+edx*4]
	addss xmm0, [eax+0x4]
	movss [eax], xmm0
	add edx, 0x1
	add eax, 0x4
	cmp edx, esi
	jnz syn_percep_zero_50
syn_percep_zero_40:
	movaps xmm0, xmm2
	mov edx, [ebp-0x28]
	mulss xmm0, [edx]
	mov eax, [ebp-0x2c]
	movss [eax], xmm0
	mov edx, [ebp+0x18]
	movss [edx+ecx*4], xmm1
	add ecx, 0x1
	cmp [ebp+0x1c], ecx
	jnz syn_percep_zero_60
syn_percep_zero_30:
	mov esi, [ebp+0x20]
	test esi, esi
	jle syn_percep_zero_70
	xor eax, eax
syn_percep_zero_80:
	mov dword [ebx+eax*4], 0x0
	add eax, 0x1
	cmp [ebp+0x20], eax
	jnz syn_percep_zero_80
syn_percep_zero_70:
	mov ecx, [ebp+0x1c]
	test ecx, ecx
	jle syn_percep_zero_90
	mov edi, [ebp+0x20]
	sub edi, 0x1
	mov eax, [ebp+0x20]
	shl eax, 0x2
	lea esi, [ebx+eax-0x4]
	mov [ebp-0x24], esi
	mov edx, [ebp+0x10]
	lea edx, [edx+eax-0x4]
	mov [ebp-0x20], edx
	mov esi, [ebp+0x14]
	lea eax, [esi+eax-0x4]
	mov [ebp-0x1c], eax
	mov dword [ebp-0x3c], 0x0
	movss xmm5, dword [_data16_80000000]
	mov eax, [ebp-0x3c]
syn_percep_zero_120:
	mov edx, [ebp+0x18]
	movss xmm2, dword [edx+eax*4]
	movaps xmm3, xmm2
	addss xmm3, [ebx]
	movaps xmm4, xmm3
	xorps xmm4, xmm5
	test edi, edi
	jle syn_percep_zero_100
	xor ecx, ecx
syn_percep_zero_110:
	lea eax, [ecx*4]
	lea edx, [ebx+eax]
	movaps xmm0, xmm2
	mov esi, [ebp+0x10]
	mulss xmm0, [esi+eax]
	addss xmm0, [edx+0x4]
	movaps xmm1, xmm4
	mov esi, [ebp+0x14]
	mulss xmm1, [esi+eax]
	addss xmm0, xmm1
	movss [edx], xmm0
	add ecx, 0x1
	cmp ecx, edi
	jnz syn_percep_zero_110
syn_percep_zero_100:
	mov eax, [ebp-0x20]
	mulss xmm2, [eax]
	movaps xmm0, xmm3
	mov edx, [ebp-0x1c]
	mulss xmm0, [edx]
	subss xmm2, xmm0
	mov esi, [ebp-0x24]
	movss [esi], xmm2
	mov eax, [ebp-0x3c]
	mov edx, [ebp+0x18]
	movss [edx+eax*4], xmm3
	add eax, 0x1
	mov [ebp-0x3c], eax
	cmp [ebp+0x1c], eax
	jnz syn_percep_zero_120
syn_percep_zero_90:
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	nop


;residue_percep_zero(float const*, float const*, float const*, float const*, float*, int, int, char*)
residue_percep_zero:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x2c
	mov edx, [ebp+0x24]
	mov eax, edx
	neg eax
	and eax, 0x3
	lea ebx, [edx+eax]
	mov eax, [ebp+0x20]
	test eax, eax
	jle residue_percep_zero_10
	xor eax, eax
residue_percep_zero_20:
	mov dword [ebx+eax*4], 0x0
	add eax, 0x1
	cmp [ebp+0x20], eax
	jnz residue_percep_zero_20
residue_percep_zero_10:
	mov eax, [ebp+0x1c]
	test eax, eax
	jle residue_percep_zero_30
	mov edi, [ebp+0x20]
	sub edi, 0x1
	mov eax, [ebp+0x20]
	shl eax, 0x2
	lea edx, [ebx+eax-0x4]
	mov [ebp-0x28], edx
	mov esi, [ebp+0xc]
	lea esi, [esi+eax-0x4]
	mov [ebp-0x24], esi
	mov edx, [ebp+0x10]
	lea eax, [edx+eax-0x4]
	mov [ebp-0x20], eax
	mov dword [ebp-0x30], 0x0
	movss xmm5, dword [_data16_80000000]
	mov esi, [ebp-0x30]
residue_percep_zero_60:
	mov eax, [ebp+0x8]
	movss xmm2, dword [eax+esi*4]
	movaps xmm3, xmm2
	addss xmm3, [ebx]
	movaps xmm4, xmm3
	xorps xmm4, xmm5
	test edi, edi
	jle residue_percep_zero_40
	xor ecx, ecx
residue_percep_zero_50:
	lea eax, [ecx*4]
	lea edx, [ebx+eax]
	movaps xmm0, xmm2
	mov esi, [ebp+0xc]
	mulss xmm0, [esi+eax]
	addss xmm0, [edx+0x4]
	movaps xmm1, xmm4
	mov esi, [ebp+0x10]
	mulss xmm1, [esi+eax]
	addss xmm0, xmm1
	movss [edx], xmm0
	add ecx, 0x1
	cmp ecx, edi
	jnz residue_percep_zero_50
residue_percep_zero_40:
	mov eax, [ebp-0x24]
	mulss xmm2, [eax]
	movaps xmm0, xmm3
	mov edx, [ebp-0x20]
	mulss xmm0, [edx]
	subss xmm2, xmm0
	mov esi, [ebp-0x28]
	movss [esi], xmm2
	mov eax, [ebp-0x30]
	mov edx, [ebp+0x18]
	movss [edx+eax*4], xmm3
	add eax, 0x1
	mov [ebp-0x30], eax
	cmp [ebp+0x1c], eax
	jz residue_percep_zero_30
	mov esi, eax
	jmp residue_percep_zero_60
residue_percep_zero_30:
	mov eax, [ebp+0x20]
	test eax, eax
	jle residue_percep_zero_70
	xor eax, eax
residue_percep_zero_80:
	mov dword [ebx+eax*4], 0x0
	add eax, 0x1
	cmp [ebp+0x20], eax
	jnz residue_percep_zero_80
residue_percep_zero_70:
	mov eax, [ebp+0x1c]
	test eax, eax
	jle residue_percep_zero_90
	mov esi, [ebp+0x20]
	sub esi, 0x1
	mov eax, [ebp+0x20]
	shl eax, 0x2
	lea edi, [ebx+eax-0x4]
	mov [ebp-0x1c], edi
	mov edx, [ebp+0x14]
	lea eax, [edx+eax-0x4]
	mov [ebp-0x2c], eax
	xor eax, eax
residue_percep_zero_120:
	mov edi, [ebp+0x18]
	movss xmm1, dword [edi+eax*4]
	movaps xmm2, xmm1
	addss xmm2, [ebx]
	test esi, esi
	jle residue_percep_zero_100
	xor ecx, ecx
	mov edx, ebx
residue_percep_zero_110:
	movaps xmm0, xmm1
	mov edi, [ebp+0x14]
	mulss xmm0, [edi+ecx*4]
	addss xmm0, [edx+0x4]
	movss [edx], xmm0
	add ecx, 0x1
	add edx, 0x4
	cmp ecx, esi
	jnz residue_percep_zero_110
residue_percep_zero_100:
	mov edx, [ebp-0x2c]
	mulss xmm1, [edx]
	mov edi, [ebp-0x1c]
	movss [edi], xmm1
	mov edx, [ebp+0x18]
	movss [edx+eax*4], xmm2
	add eax, 0x1
	cmp [ebp+0x1c], eax
	jnz residue_percep_zero_120
residue_percep_zero_90:
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


;comb_filter_mem_init(CombFilterMem*)
comb_filter_mem_init:
	push ebp
	mov ebp, esp
	mov edx, [ebp+0x8]
	mov dword [edx], 0x0
	xor eax, eax
	mov [edx+0xc], eax
	mov [edx+0x8], eax
	mov [edx+0x4], eax
	mov dword [edx+0x10], 0x3f800000
	pop ebp
	ret


;compute_impulse_response(float const*, float const*, float const*, float*, int, int, char*)
compute_impulse_response:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x3c
	mov ebx, [ebp+0x1c]
	mov edx, [ebp+0x20]
	mov ecx, 0x4
	mov eax, ecx
	sub eax, edx
	and eax, 0x3
	add edx, eax
	lea eax, [ebx*4]
	add edx, eax
	mov edi, edx
	sub edi, eax
	sub ecx, edx
	and ecx, 0x3
	lea esi, [edx+ecx]
	mov eax, [ebp+0x14]
	mov dword [eax], 0x3f800000
	test ebx, ebx
	jg compute_impulse_response_10
	mov dword [ebp-0x3c], 0x1
	mov edx, [ebp-0x3c]
compute_impulse_response_110:
	cmp [ebp+0x18], edx
	jle compute_impulse_response_20
	mov ecx, [ebp+0x14]
	lea eax, [ecx+edx*4]
	xor edx, edx
	mov ecx, [ebp+0x18]
	sub ecx, [ebp-0x3c]
	mov [ebp-0x3c], ecx
compute_impulse_response_30:
	mov dword [eax], 0x26901d7d
	add edx, 0x1
	add eax, 0x4
	cmp edx, [ebp-0x3c]
	jnz compute_impulse_response_30
compute_impulse_response_20:
	test ebx, ebx
	jle compute_impulse_response_40
	xor edx, edx
compute_impulse_response_50:
	lea eax, [edx*4]
	mov dword [esi+eax], 0x0
	mov dword [edi+eax], 0x0
	add edx, 0x1
	cmp ebx, edx
	jnz compute_impulse_response_50
compute_impulse_response_40:
	mov eax, [ebp+0x18]
	test eax, eax
	jle compute_impulse_response_60
	lea eax, [ebx-0x1]
	mov [ebp-0x20], eax
	lea eax, [ebx*4]
	lea edx, [edi+eax-0x4]
	mov [ebp-0x30], edx
	mov ecx, [ebp+0x10]
	lea ecx, [eax+ecx-0x4]
	mov [ebp-0x2c], ecx
	lea ebx, [esi+eax-0x4]
	mov [ebp-0x28], ebx
	mov edx, [ebp+0x8]
	lea eax, [eax+edx-0x4]
	mov [ebp-0x24], eax
	mov dword [ebp-0x1c], 0x0
	movss xmm3, dword [_data16_80000000]
	mov ecx, [ebp+0x14]
	mov [ebp-0x40], ecx
	mov ebx, ecx
compute_impulse_response_90:
	movss xmm0, dword [ebx]
	addss xmm0, [edi]
	movaps xmm2, xmm0
	xorps xmm2, xmm3
	addss xmm0, [esi]
	movss [ebx], xmm0
	movaps xmm1, xmm0
	xorps xmm1, xmm3
	mov eax, [ebp-0x20]
	test eax, eax
	jle compute_impulse_response_70
	xor ecx, ecx
compute_impulse_response_80:
	lea eax, [ecx*4]
	lea edx, [edi+eax]
	movaps xmm0, xmm2
	mov ebx, [ebp+0x10]
	mulss xmm0, [eax+ebx]
	addss xmm0, [edx+0x4]
	movss [edx], xmm0
	lea edx, [esi+eax]
	movaps xmm0, xmm1
	mov ebx, [ebp+0x8]
	mulss xmm0, [eax+ebx]
	addss xmm0, [edx+0x4]
	movss [edx], xmm0
	add ecx, 0x1
	cmp [ebp-0x20], ecx
	jnz compute_impulse_response_80
compute_impulse_response_70:
	movaps xmm0, xmm2
	mov eax, [ebp-0x2c]
	mulss xmm0, [eax]
	mov edx, [ebp-0x30]
	movss [edx], xmm0
	movaps xmm0, xmm1
	mov ecx, [ebp-0x24]
	mulss xmm0, [ecx]
	mov ebx, [ebp-0x28]
	movss [ebx], xmm0
	add dword [ebp-0x1c], 0x1
	add dword [ebp-0x40], 0x4
	mov eax, [ebp-0x1c]
	cmp [ebp+0x18], eax
	jz compute_impulse_response_60
	mov ebx, [ebp-0x40]
	jmp compute_impulse_response_90
compute_impulse_response_60:
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
compute_impulse_response_10:
	xor edx, edx
compute_impulse_response_100:
	mov ecx, [ebp+0xc]
	mov eax, [ecx+edx*4]
	mov ecx, [ebp+0x14]
	mov [ecx+edx*4+0x4], eax
	add edx, 0x1
	cmp ebx, edx
	jnz compute_impulse_response_100
	lea eax, [ebx+0x1]
	mov [ebp-0x3c], eax
	mov edx, eax
	jmp compute_impulse_response_110


;bw_lpc(float, float const*, float*, int)
bw_lpc:
	push ebp
	mov ebp, esp
	push ebx
	movss xmm2, dword [ebp+0x8]
	mov ebx, [ebp+0xc]
	mov ecx, [ebp+0x10]
	mov edx, [ebp+0x14]
	test edx, edx
	jle bw_lpc_10
	movaps xmm1, xmm2
	xor eax, eax
bw_lpc_20:
	movaps xmm0, xmm1
	mulss xmm0, [ebx+eax*4]
	movss [ecx+eax*4], xmm0
	mulss xmm1, xmm2
	add eax, 0x1
	cmp edx, eax
	jnz bw_lpc_20
bw_lpc_10:
	pop ebx
	pop ebp
	ret


;fir_mem2(float const*, float const*, float*, int, int, float*)
fir_mem2:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x8
	mov esi, [ebp+0xc]
	mov eax, [ebp+0x18]
	mov edi, [ebp+0x1c]
	mov ebx, [ebp+0x14]
	test ebx, ebx
	jle fir_mem2_10
	lea ebx, [eax-0x1]
	shl eax, 0x2
	lea edx, [edi+eax-0x4]
	mov [ebp-0x14], edx
	lea eax, [eax+esi-0x4]
	mov [ebp-0x10], eax
	xor eax, eax
fir_mem2_40:
	mov edx, [ebp+0x8]
	movss xmm1, dword [edx+eax*4]
	movaps xmm2, xmm1
	addss xmm2, [edi]
	test ebx, ebx
	jle fir_mem2_20
	xor ecx, ecx
	mov edx, edi
fir_mem2_30:
	movaps xmm0, xmm1
	mulss xmm0, [esi+ecx*4]
	addss xmm0, [edx+0x4]
	movss [edx], xmm0
	add ecx, 0x1
	add edx, 0x4
	cmp ecx, ebx
	jnz fir_mem2_30
fir_mem2_20:
	mov edx, [ebp-0x10]
	mulss xmm1, [edx]
	mov edx, [ebp-0x14]
	movss [edx], xmm1
	mov edx, [ebp+0x10]
	movss [edx+eax*4], xmm2
	add eax, 0x1
	cmp [ebp+0x14], eax
	jnz fir_mem2_40
fir_mem2_10:
	add esp, 0x8
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	nop


;iir_mem2(float const*, float const*, float*, int, int, float*)
iir_mem2:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x1c
	mov esi, [ebp+0xc]
	mov eax, [ebp+0x18]
	mov edi, [ebp+0x1c]
	mov ecx, [ebp+0x14]
	test ecx, ecx
	jle iir_mem2_10
	lea ebx, [eax-0x1]
	shl eax, 0x2
	lea edx, [edi+eax-0x4]
	mov [ebp-0x20], edx
	lea eax, [eax+esi-0x4]
	mov [ebp-0x1c], eax
	xor eax, eax
	movss xmm3, dword [_data16_80000000]
iir_mem2_40:
	mov edx, [ebp+0x8]
	movss xmm1, dword [edx+eax*4]
	addss xmm1, [edi]
	movaps xmm2, xmm1
	xorps xmm2, xmm3
	test ebx, ebx
	jle iir_mem2_20
	xor ecx, ecx
	mov edx, edi
iir_mem2_30:
	movaps xmm0, xmm2
	mulss xmm0, [esi+ecx*4]
	addss xmm0, [edx+0x4]
	movss [edx], xmm0
	add ecx, 0x1
	add edx, 0x4
	cmp ecx, ebx
	jnz iir_mem2_30
iir_mem2_20:
	movaps xmm0, xmm2
	mov edx, [ebp-0x1c]
	mulss xmm0, [edx]
	mov edx, [ebp-0x20]
	movss [edx], xmm0
	mov edx, [ebp+0x10]
	movss [edx+eax*4], xmm1
	add eax, 0x1
	cmp [ebp+0x14], eax
	jnz iir_mem2_40
iir_mem2_10:
	add esp, 0x1c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	nop


;Initialized global or static variables of filters:
SECTION .data


;Initialized constant data of filters:
SECTION .rdata


;Zero initialized global or static variables of filters:
SECTION .bss


;All cstrings:
SECTION .rdata



;All constant floats and doubles:
SECTION .rdata
_float_1_00000000:		dd 0x3f800000	; 1
_double_0_10000000:		dq 0x3fb999999999999a	; 0.1
_double_0_50000000:		dq 0x3fe0000000000000	; 0.5
_double_1_30000000:		dq 0x3ff4cccccccccccd	; 1.3
_float_0_50000000:		dd 0x3f000000	; 0.5
_double_1_00000000:		dq 0x3ff0000000000000	; 1
_double_0_04000000:		dq 0x3fa47ae147ae147b	; 0.04
_double_0_96000000:		dq 0x3feeb851eb851eb8	; 0.96
_data16_80000000:		dd 0x80000000, 0x0, 0x0, 0x0	; OWORD
_double__0_50000000:		dq 0xbfe0000000000000	; -0.5

