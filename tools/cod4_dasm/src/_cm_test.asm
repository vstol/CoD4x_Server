;Imports of cm_test:
	extern cm
	extern BoxOnPlaneSide
	extern CM_ClipHandleToModel
	extern AnglesToAxis

;Exports of cm_test:
	global CM_PointContentsLeafBrushNode_r
	global CM_ClusterPVS
	global CM_BoxLeafnums
	global CM_PointLeafnum
	global CM_BoxLeafnums_r
	global CM_PointContents
	global CM_TransformedPointContents


SECTION .text


;CM_PointContentsLeafBrushNode_r(float const*, cLeafBrushNode_s*)
CM_PointContentsLeafBrushNode_r:
CM_PointContentsLeafBrushNode_r_430:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0xcc
	mov edi, eax
	mov [ebp-0xd4], edx
	mov dword [ebp-0xc0], 0x0
CM_PointContentsLeafBrushNode_r_80:
	mov edx, [ebp-0xd4]
	movzx eax, word [edx+0x2]
	cmp ax, 0x0
	jz CM_PointContentsLeafBrushNode_r_10
	jg CM_PointContentsLeafBrushNode_r_20
	add edx, 0x14
	mov [ebp-0xbc], edx
	mov dword [ebp-0xa8], 0x0
CM_PointContentsLeafBrushNode_r_50:
	mov ecx, [ebp-0xbc]
	movzx eax, word [ecx+0x2]
	test ax, ax
	jnz CM_PointContentsLeafBrushNode_r_30
CM_PointContentsLeafBrushNode_r_1010:
	mov edx, [ebp-0xbc]
	movzx eax, byte [edx]
	movss xmm0, dword [edx+0x8]
	ucomiss xmm0, [edi+eax*4]
	jae CM_PointContentsLeafBrushNode_r_40
	xor eax, eax
CM_PointContentsLeafBrushNode_r_90:
	mov ecx, [ebp-0xbc]
	movzx eax, word [ecx+eax+0x10]
	lea eax, [eax+eax*4]
	lea ecx, [ecx+eax*4]
	mov [ebp-0xbc], ecx
	jmp CM_PointContentsLeafBrushNode_r_50
CM_PointContentsLeafBrushNode_r_840:
	mov eax, [ecx+0xc]
	or [ebp-0xa8], eax
CM_PointContentsLeafBrushNode_r_820:
	add dword [ebp-0xac], 0x1
	mov edx, [ebp-0xb8]
	cmp [ebp-0xac], edx
	jnz CM_PointContentsLeafBrushNode_r_60
CM_PointContentsLeafBrushNode_r_810:
	mov ecx, [ebp-0xa8]
	or [ebp-0xc0], ecx
CM_PointContentsLeafBrushNode_r_10:
	mov edx, [ebp-0xd4]
	movzx eax, byte [edx]
	movss xmm0, dword [edx+0x8]
	ucomiss xmm0, [edi+eax*4]
	jae CM_PointContentsLeafBrushNode_r_70
	xor eax, eax
CM_PointContentsLeafBrushNode_r_100:
	mov edx, [ebp-0xd4]
	movzx eax, word [edx+eax+0x10]
	lea eax, [eax+eax*4]
	lea edx, [edx+eax*4]
	mov [ebp-0xd4], edx
	jmp CM_PointContentsLeafBrushNode_r_80
CM_PointContentsLeafBrushNode_r_40:
	mov eax, 0x2
	jmp CM_PointContentsLeafBrushNode_r_90
CM_PointContentsLeafBrushNode_r_70:
	mov eax, 0x2
	jmp CM_PointContentsLeafBrushNode_r_100
CM_PointContentsLeafBrushNode_r_30:
	test ax, ax
	jg CM_PointContentsLeafBrushNode_r_110
	mov ecx, [ebp-0xbc]
	add ecx, 0x14
	mov [ebp-0xa4], ecx
	mov dword [ebp-0x90], 0x0
CM_PointContentsLeafBrushNode_r_140:
	mov edx, [ebp-0xa4]
	movzx eax, word [edx+0x2]
	test ax, ax
	jnz CM_PointContentsLeafBrushNode_r_120
CM_PointContentsLeafBrushNode_r_990:
	mov edx, [ebp-0xa4]
	movzx eax, byte [edx]
	movss xmm0, dword [edx+0x8]
	ucomiss xmm0, [edi+eax*4]
	jae CM_PointContentsLeafBrushNode_r_130
	xor eax, eax
CM_PointContentsLeafBrushNode_r_210:
	mov edx, [ebp-0xa4]
	movzx eax, word [edx+eax+0x10]
	lea eax, [eax+eax*4]
	lea edx, [edx+eax*4]
	mov [ebp-0xa4], edx
	jmp CM_PointContentsLeafBrushNode_r_140
CM_PointContentsLeafBrushNode_r_20:
	cwde
	mov [ebp-0xd0], eax
	test eax, eax
	jle CM_PointContentsLeafBrushNode_r_150
	mov ecx, [ebp-0xd4]
	mov ecx, [ecx+0x8]
	mov [ebp-0xcc], ecx
	mov eax, cm
	mov eax, [eax+0x90]
	mov [ebp-0xc8], eax
	mov dword [ebp-0xc4], 0x0
CM_PointContentsLeafBrushNode_r_200:
	mov edx, [ebp-0xc4]
	mov ecx, [ebp-0xcc]
	movzx eax, word [ecx+edx*2]
	lea eax, [eax+eax*4]
	shl eax, 0x4
	mov ebx, [ebp-0xc8]
	add ebx, eax
	mov eax, ebx
	mov ecx, 0x1
CM_PointContentsLeafBrushNode_r_170:
	movss xmm1, dword [edi+ecx*4-0x4]
	movss xmm0, dword [eax]
	ucomiss xmm0, xmm1
	ja CM_PointContentsLeafBrushNode_r_160
	ucomiss xmm1, [eax+0x10]
	ja CM_PointContentsLeafBrushNode_r_160
	add ecx, 0x1
	add eax, 0x4
	cmp ecx, 0x4
	jnz CM_PointContentsLeafBrushNode_r_170
	mov ecx, [ebx+0x20]
	mov edx, [ebx+0x1c]
	test edx, edx
	jz CM_PointContentsLeafBrushNode_r_180
	mov eax, [ecx]
	movss xmm4, dword [edi]
	movss xmm3, dword [edi+0x4]
	movss xmm2, dword [edi+0x8]
	movaps xmm0, xmm4
	mulss xmm0, [eax]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	ucomiss xmm0, [eax+0xc]
	ja CM_PointContentsLeafBrushNode_r_160
	add ecx, 0xc
	xor esi, esi
	sub edx, 0x1
CM_PointContentsLeafBrushNode_r_190:
	cmp edx, esi
	jz CM_PointContentsLeafBrushNode_r_180
	mov eax, [ecx]
	add esi, 0x1
	add ecx, 0xc
	movaps xmm0, xmm4
	mulss xmm0, [eax]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	ucomiss xmm0, [eax+0xc]
	jbe CM_PointContentsLeafBrushNode_r_190
CM_PointContentsLeafBrushNode_r_160:
	add dword [ebp-0xc4], 0x1
	mov edx, [ebp-0xd0]
	cmp [ebp-0xc4], edx
	jnz CM_PointContentsLeafBrushNode_r_200
CM_PointContentsLeafBrushNode_r_150:
	mov eax, [ebp-0xc0]
	add esp, 0xcc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_PointContentsLeafBrushNode_r_130:
	mov eax, 0x2
	jmp CM_PointContentsLeafBrushNode_r_210
CM_PointContentsLeafBrushNode_r_120:
	test ax, ax
	jg CM_PointContentsLeafBrushNode_r_220
	mov eax, [ebp-0xa4]
	add eax, 0x14
	mov [ebp-0x8c], eax
	mov dword [ebp-0x78], 0x0
CM_PointContentsLeafBrushNode_r_250:
	mov edx, [ebp-0x8c]
	movzx eax, word [edx+0x2]
	test ax, ax
	jnz CM_PointContentsLeafBrushNode_r_230
CM_PointContentsLeafBrushNode_r_790:
	mov edx, [ebp-0x8c]
	movzx eax, byte [edx]
	movss xmm0, dword [edx+0x8]
	ucomiss xmm0, [edi+eax*4]
	jae CM_PointContentsLeafBrushNode_r_240
	xor eax, eax
CM_PointContentsLeafBrushNode_r_800:
	mov ecx, [ebp-0x8c]
	movzx eax, word [ecx+eax+0x10]
	lea eax, [eax+eax*4]
	lea ecx, [ecx+eax*4]
	mov [ebp-0x8c], ecx
	jmp CM_PointContentsLeafBrushNode_r_250
CM_PointContentsLeafBrushNode_r_230:
	test ax, ax
	jg CM_PointContentsLeafBrushNode_r_260
	mov ecx, [ebp-0x8c]
	add ecx, 0x14
	mov [ebp-0x74], ecx
	mov dword [ebp-0x60], 0x0
	mov edx, ecx
	jmp CM_PointContentsLeafBrushNode_r_270
CM_PointContentsLeafBrushNode_r_290:
	mov ecx, edx
CM_PointContentsLeafBrushNode_r_710:
	movzx eax, byte [ecx]
	movss xmm0, dword [ecx+0x8]
	ucomiss xmm0, [edi+eax*4]
	jae CM_PointContentsLeafBrushNode_r_280
	xor eax, eax
CM_PointContentsLeafBrushNode_r_630:
	mov edx, [ebp-0x74]
	movzx eax, word [edx+eax+0x10]
	lea eax, [eax+eax*4]
	lea edx, [edx+eax*4]
	mov [ebp-0x74], edx
CM_PointContentsLeafBrushNode_r_270:
	movzx eax, word [edx+0x2]
	test ax, ax
	jz CM_PointContentsLeafBrushNode_r_290
	test ax, ax
	jg CM_PointContentsLeafBrushNode_r_300
	mov ecx, [ebp-0x74]
	add ecx, 0x14
	mov [ebp-0x5c], ecx
	mov dword [ebp-0x48], 0x0
	mov edx, ecx
	jmp CM_PointContentsLeafBrushNode_r_310
CM_PointContentsLeafBrushNode_r_330:
	movzx eax, byte [edx]
	movss xmm0, dword [edx+0x8]
	ucomiss xmm0, [edi+eax*4]
	jae CM_PointContentsLeafBrushNode_r_320
	xor eax, eax
CM_PointContentsLeafBrushNode_r_550:
	mov ecx, [ebp-0x5c]
	movzx eax, word [ecx+eax+0x10]
	lea eax, [eax+eax*4]
	lea ecx, [ecx+eax*4]
	mov [ebp-0x5c], ecx
	mov edx, ecx
CM_PointContentsLeafBrushNode_r_310:
	movzx eax, word [edx+0x2]
	test ax, ax
	jz CM_PointContentsLeafBrushNode_r_330
	test ax, ax
	jg CM_PointContentsLeafBrushNode_r_340
	mov ecx, [ebp-0x5c]
	add ecx, 0x14
	mov [ebp-0x44], ecx
	mov dword [ebp-0x30], 0x0
	mov edx, ecx
	jmp CM_PointContentsLeafBrushNode_r_350
CM_PointContentsLeafBrushNode_r_370:
	mov ecx, edx
CM_PointContentsLeafBrushNode_r_540:
	movzx eax, byte [ecx]
	movss xmm0, dword [ecx+0x8]
	ucomiss xmm0, [edi+eax*4]
	jae CM_PointContentsLeafBrushNode_r_360
	xor eax, eax
CM_PointContentsLeafBrushNode_r_460:
	mov edx, [ebp-0x44]
	movzx eax, word [edx+eax+0x10]
	lea eax, [eax+eax*4]
	lea edx, [edx+eax*4]
	mov [ebp-0x44], edx
CM_PointContentsLeafBrushNode_r_350:
	movzx eax, word [edx+0x2]
	test ax, ax
	jz CM_PointContentsLeafBrushNode_r_370
	test ax, ax
	jg CM_PointContentsLeafBrushNode_r_380
	mov ebx, [ebp-0x44]
	add ebx, 0x14
	mov dword [ebp-0x1c], 0x0
	jmp CM_PointContentsLeafBrushNode_r_390
CM_PointContentsLeafBrushNode_r_410:
	movzx eax, byte [ebx]
	movss xmm0, dword [ebx+0x8]
	ucomiss xmm0, [edi+eax*4]
	jae CM_PointContentsLeafBrushNode_r_400
CM_PointContentsLeafBrushNode_r_440:
	xor eax, eax
CM_PointContentsLeafBrushNode_r_450:
	movzx eax, word [ebx+eax+0x10]
	lea eax, [eax+eax*4]
	lea ebx, [ebx+eax*4]
CM_PointContentsLeafBrushNode_r_390:
	movzx eax, word [ebx+0x2]
	test ax, ax
	jz CM_PointContentsLeafBrushNode_r_410
	test ax, ax
	jg CM_PointContentsLeafBrushNode_r_420
	lea edx, [ebx+0x14]
	mov eax, edi
	call CM_PointContentsLeafBrushNode_r_430
	or [ebp-0x1c], eax
	movzx eax, byte [ebx]
	movss xmm0, dword [ebx+0x8]
	ucomiss xmm0, [edi+eax*4]
	jb CM_PointContentsLeafBrushNode_r_440
CM_PointContentsLeafBrushNode_r_400:
	mov eax, 0x2
	jmp CM_PointContentsLeafBrushNode_r_450
CM_PointContentsLeafBrushNode_r_360:
	mov eax, 0x2
	jmp CM_PointContentsLeafBrushNode_r_460
CM_PointContentsLeafBrushNode_r_420:
	cwde
	mov [ebp-0x2c], eax
	test eax, eax
	jle CM_PointContentsLeafBrushNode_r_470
	mov ebx, [ebx+0x8]
	mov [ebp-0x28], ebx
	mov eax, cm
	mov eax, [eax+0x90]
	mov [ebp-0x24], eax
	mov dword [ebp-0x20], 0x0
	mov edx, ebx
CM_PointContentsLeafBrushNode_r_520:
	mov ecx, [ebp-0x20]
	movzx eax, word [edx+ecx*2]
	lea eax, [eax+eax*4]
	shl eax, 0x4
	mov edx, [ebp-0x24]
	add edx, eax
	mov eax, edx
	mov ecx, 0x1
CM_PointContentsLeafBrushNode_r_490:
	movss xmm1, dword [edi+ecx*4-0x4]
	movss xmm0, dword [eax]
	ucomiss xmm0, xmm1
	ja CM_PointContentsLeafBrushNode_r_480
	ucomiss xmm1, [eax+0x10]
	ja CM_PointContentsLeafBrushNode_r_480
	add ecx, 0x1
	add eax, 0x4
	cmp ecx, 0x4
	jnz CM_PointContentsLeafBrushNode_r_490
	mov ecx, [edx+0x20]
	mov esi, [edx+0x1c]
	test esi, esi
	jz CM_PointContentsLeafBrushNode_r_500
	mov eax, [ecx]
	movss xmm5, dword [edi]
	movss xmm4, dword [edi+0x4]
	movss xmm3, dword [edi+0x8]
	movaps xmm2, xmm3
	mulss xmm2, [eax+0x8]
	movaps xmm0, xmm4
	mulss xmm0, [eax+0x4]
	movaps xmm1, xmm5
	mulss xmm1, [eax]
	addss xmm0, xmm1
	addss xmm2, xmm0
	ucomiss xmm2, [eax+0xc]
	ja CM_PointContentsLeafBrushNode_r_480
	add ecx, 0xc
	xor ebx, ebx
	sub esi, 0x1
CM_PointContentsLeafBrushNode_r_510:
	cmp esi, ebx
	jz CM_PointContentsLeafBrushNode_r_500
	mov eax, [ecx]
	add ebx, 0x1
	add ecx, 0xc
	movaps xmm2, xmm3
	mulss xmm2, [eax+0x8]
	movaps xmm0, xmm4
	mulss xmm0, [eax+0x4]
	movaps xmm1, xmm5
	mulss xmm1, [eax]
	addss xmm0, xmm1
	addss xmm2, xmm0
	ucomiss xmm2, [eax+0xc]
	jbe CM_PointContentsLeafBrushNode_r_510
CM_PointContentsLeafBrushNode_r_480:
	add dword [ebp-0x20], 0x1
	mov eax, [ebp-0x2c]
	cmp [ebp-0x20], eax
	jz CM_PointContentsLeafBrushNode_r_470
CM_PointContentsLeafBrushNode_r_530:
	mov edx, [ebp-0x28]
	jmp CM_PointContentsLeafBrushNode_r_520
CM_PointContentsLeafBrushNode_r_500:
	mov ecx, [edx+0xc]
	or [ebp-0x1c], ecx
	add dword [ebp-0x20], 0x1
	mov eax, [ebp-0x2c]
	cmp [ebp-0x20], eax
	jnz CM_PointContentsLeafBrushNode_r_530
CM_PointContentsLeafBrushNode_r_470:
	mov edx, [ebp-0x1c]
	or [ebp-0x30], edx
	mov ecx, [ebp-0x44]
	jmp CM_PointContentsLeafBrushNode_r_540
CM_PointContentsLeafBrushNode_r_320:
	mov eax, 0x2
	jmp CM_PointContentsLeafBrushNode_r_550
CM_PointContentsLeafBrushNode_r_380:
	cwde
	mov [ebp-0x40], eax
	test eax, eax
	jle CM_PointContentsLeafBrushNode_r_560
	mov ecx, [ebp-0x44]
	mov ecx, [ecx+0x8]
	mov [ebp-0x3c], ecx
	mov eax, cm
	mov eax, [eax+0x90]
	mov [ebp-0x38], eax
	mov dword [ebp-0x34], 0x0
	mov ebx, eax
CM_PointContentsLeafBrushNode_r_610:
	mov edx, [ebp-0x34]
	movzx eax, word [ecx+edx*2]
	lea eax, [eax+eax*4]
	shl eax, 0x4
	add ebx, eax
	mov eax, ebx
	mov edx, 0x1
CM_PointContentsLeafBrushNode_r_580:
	movss xmm1, dword [edi+edx*4-0x4]
	movss xmm0, dword [eax]
	ucomiss xmm0, xmm1
	ja CM_PointContentsLeafBrushNode_r_570
	ucomiss xmm1, [eax+0x10]
	ja CM_PointContentsLeafBrushNode_r_570
	add edx, 0x1
	add eax, 0x4
	cmp edx, 0x4
	jnz CM_PointContentsLeafBrushNode_r_580
	mov edx, [ebx+0x20]
	mov esi, [ebx+0x1c]
	test esi, esi
	jz CM_PointContentsLeafBrushNode_r_590
	mov eax, [edx]
	movss xmm4, dword [edi]
	movss xmm3, dword [edi+0x4]
	movss xmm2, dword [edi+0x8]
	movaps xmm0, xmm4
	mulss xmm0, [eax]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	ucomiss xmm0, [eax+0xc]
	ja CM_PointContentsLeafBrushNode_r_570
	add edx, 0xc
	xor ecx, ecx
	sub esi, 0x1
CM_PointContentsLeafBrushNode_r_600:
	cmp esi, ecx
	jz CM_PointContentsLeafBrushNode_r_590
	mov eax, [edx]
	add ecx, 0x1
	add edx, 0xc
	movaps xmm0, xmm3
	mulss xmm0, [eax+0x4]
	movaps xmm1, xmm4
	mulss xmm1, [eax]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	ucomiss xmm0, [eax+0xc]
	jbe CM_PointContentsLeafBrushNode_r_600
CM_PointContentsLeafBrushNode_r_570:
	add dword [ebp-0x34], 0x1
	mov edx, [ebp-0x40]
	cmp [ebp-0x34], edx
	jz CM_PointContentsLeafBrushNode_r_560
CM_PointContentsLeafBrushNode_r_620:
	mov ecx, [ebp-0x3c]
	mov ebx, [ebp-0x38]
	jmp CM_PointContentsLeafBrushNode_r_610
CM_PointContentsLeafBrushNode_r_590:
	mov eax, [ebx+0xc]
	or [ebp-0x30], eax
	add dword [ebp-0x34], 0x1
	mov edx, [ebp-0x40]
	cmp [ebp-0x34], edx
	jnz CM_PointContentsLeafBrushNode_r_620
CM_PointContentsLeafBrushNode_r_560:
	mov ecx, [ebp-0x30]
	or [ebp-0x48], ecx
	mov edx, [ebp-0x5c]
	jmp CM_PointContentsLeafBrushNode_r_330
CM_PointContentsLeafBrushNode_r_280:
	mov eax, 0x2
	jmp CM_PointContentsLeafBrushNode_r_630
CM_PointContentsLeafBrushNode_r_340:
	cwde
	mov [ebp-0x58], eax
	test eax, eax
	jle CM_PointContentsLeafBrushNode_r_640
	mov ecx, [ebp-0x5c]
	mov ecx, [ecx+0x8]
	mov [ebp-0x54], ecx
	mov eax, cm
	mov eax, [eax+0x90]
	mov [ebp-0x50], eax
	mov dword [ebp-0x4c], 0x0
	mov ecx, [ebp-0x4c]
	mov ebx, eax
CM_PointContentsLeafBrushNode_r_690:
	mov edx, [ebp-0x54]
	movzx eax, word [edx+ecx*2]
	lea eax, [eax+eax*4]
	shl eax, 0x4
	add ebx, eax
	mov eax, ebx
	mov edx, 0x1
CM_PointContentsLeafBrushNode_r_660:
	movss xmm1, dword [edi+edx*4-0x4]
	movss xmm0, dword [eax]
	ucomiss xmm0, xmm1
	ja CM_PointContentsLeafBrushNode_r_650
	ucomiss xmm1, [eax+0x10]
	ja CM_PointContentsLeafBrushNode_r_650
	add edx, 0x1
	add eax, 0x4
	cmp edx, 0x4
	jnz CM_PointContentsLeafBrushNode_r_660
	mov edx, [ebx+0x20]
	mov esi, [ebx+0x1c]
	test esi, esi
	jz CM_PointContentsLeafBrushNode_r_670
	mov eax, [edx]
	movss xmm5, dword [edi]
	movss xmm4, dword [edi+0x4]
	movss xmm3, dword [edi+0x8]
	movaps xmm0, xmm5
	mulss xmm0, [eax]
	movaps xmm1, xmm4
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	ucomiss xmm0, [eax+0xc]
	ja CM_PointContentsLeafBrushNode_r_650
	add edx, 0xc
	xor ecx, ecx
	sub esi, 0x1
CM_PointContentsLeafBrushNode_r_680:
	cmp esi, ecx
	jz CM_PointContentsLeafBrushNode_r_670
	mov eax, [edx]
	add ecx, 0x1
	add edx, 0xc
	movaps xmm2, xmm3
	mulss xmm2, [eax+0x8]
	movaps xmm0, xmm4
	mulss xmm0, [eax+0x4]
	movaps xmm1, xmm5
	mulss xmm1, [eax]
	addss xmm0, xmm1
	addss xmm2, xmm0
	ucomiss xmm2, [eax+0xc]
	jbe CM_PointContentsLeafBrushNode_r_680
CM_PointContentsLeafBrushNode_r_650:
	add dword [ebp-0x4c], 0x1
	mov eax, [ebp-0x4c]
	cmp [ebp-0x58], eax
	jz CM_PointContentsLeafBrushNode_r_640
CM_PointContentsLeafBrushNode_r_700:
	mov ecx, eax
	mov ebx, [ebp-0x50]
	jmp CM_PointContentsLeafBrushNode_r_690
CM_PointContentsLeafBrushNode_r_670:
	mov ecx, [ebx+0xc]
	or [ebp-0x48], ecx
	add dword [ebp-0x4c], 0x1
	mov eax, [ebp-0x4c]
	cmp [ebp-0x58], eax
	jnz CM_PointContentsLeafBrushNode_r_700
CM_PointContentsLeafBrushNode_r_640:
	mov edx, [ebp-0x48]
	or [ebp-0x60], edx
	mov ecx, [ebp-0x74]
	jmp CM_PointContentsLeafBrushNode_r_710
CM_PointContentsLeafBrushNode_r_300:
	cwde
	mov [ebp-0x70], eax
	test eax, eax
	jle CM_PointContentsLeafBrushNode_r_720
	mov ecx, [ebp-0x74]
	mov ecx, [ecx+0x8]
	mov [ebp-0x6c], ecx
	mov eax, cm
	mov eax, [eax+0x90]
	mov [ebp-0x68], eax
	mov dword [ebp-0x64], 0x0
CM_PointContentsLeafBrushNode_r_780:
	mov edx, [ebp-0x64]
	mov ecx, [ebp-0x6c]
	movzx eax, word [ecx+edx*2]
	lea eax, [eax+eax*4]
	shl eax, 0x4
	mov ebx, [ebp-0x68]
	add ebx, eax
	mov eax, ebx
	mov edx, 0x1
CM_PointContentsLeafBrushNode_r_740:
	movss xmm1, dword [edi+edx*4-0x4]
	movss xmm0, dword [eax]
	ucomiss xmm0, xmm1
	ja CM_PointContentsLeafBrushNode_r_730
	ucomiss xmm1, [eax+0x10]
	ja CM_PointContentsLeafBrushNode_r_730
	add edx, 0x1
	add eax, 0x4
	cmp edx, 0x4
	jnz CM_PointContentsLeafBrushNode_r_740
	mov edx, [ebx+0x20]
	mov esi, [ebx+0x1c]
	test esi, esi
	jz CM_PointContentsLeafBrushNode_r_750
	mov eax, [edx]
	movss xmm4, dword [edi]
	movss xmm3, dword [edi+0x4]
	movss xmm2, dword [edi+0x8]
	movaps xmm0, xmm4
	mulss xmm0, [eax]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	ucomiss xmm0, [eax+0xc]
	ja CM_PointContentsLeafBrushNode_r_730
	add edx, 0xc
	xor ecx, ecx
	sub esi, 0x1
	jmp CM_PointContentsLeafBrushNode_r_760
CM_PointContentsLeafBrushNode_r_770:
	mov eax, [edx]
	add ecx, 0x1
	add edx, 0xc
	movaps xmm0, xmm4
	mulss xmm0, [eax]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	ucomiss xmm0, [eax+0xc]
	ja CM_PointContentsLeafBrushNode_r_730
CM_PointContentsLeafBrushNode_r_760:
	cmp esi, ecx
	jnz CM_PointContentsLeafBrushNode_r_770
CM_PointContentsLeafBrushNode_r_750:
	mov eax, [ebx+0xc]
	or [ebp-0x60], eax
CM_PointContentsLeafBrushNode_r_730:
	add dword [ebp-0x64], 0x1
	mov edx, [ebp-0x70]
	cmp [ebp-0x64], edx
	jnz CM_PointContentsLeafBrushNode_r_780
CM_PointContentsLeafBrushNode_r_720:
	mov ecx, [ebp-0x60]
	or [ebp-0x78], ecx
	jmp CM_PointContentsLeafBrushNode_r_790
CM_PointContentsLeafBrushNode_r_240:
	mov eax, 0x2
	jmp CM_PointContentsLeafBrushNode_r_800
CM_PointContentsLeafBrushNode_r_110:
	cwde
	mov [ebp-0xb8], eax
	test eax, eax
	jle CM_PointContentsLeafBrushNode_r_810
	mov ecx, [ebp-0xbc]
	mov ecx, [ecx+0x8]
	mov [ebp-0xb4], ecx
	mov eax, cm
	mov eax, [eax+0x90]
	mov [ebp-0xb0], eax
	mov dword [ebp-0xac], 0x0
CM_PointContentsLeafBrushNode_r_60:
	mov edx, [ebp-0xac]
	mov ecx, [ebp-0xb4]
	movzx eax, word [ecx+edx*2]
	lea eax, [eax+eax*4]
	shl eax, 0x4
	mov ecx, [ebp-0xb0]
	add ecx, eax
	mov eax, ecx
	mov edx, 0x1
CM_PointContentsLeafBrushNode_r_830:
	movss xmm1, dword [edi+edx*4-0x4]
	movss xmm0, dword [eax]
	ucomiss xmm0, xmm1
	ja CM_PointContentsLeafBrushNode_r_820
	ucomiss xmm1, [eax+0x10]
	ja CM_PointContentsLeafBrushNode_r_820
	add edx, 0x1
	add eax, 0x4
	cmp edx, 0x4
	jnz CM_PointContentsLeafBrushNode_r_830
	mov edx, [ecx+0x20]
	mov esi, [ecx+0x1c]
	test esi, esi
	jz CM_PointContentsLeafBrushNode_r_840
	mov eax, [edx]
	movss xmm4, dword [edi]
	movss xmm3, dword [edi+0x4]
	movss xmm2, dword [edi+0x8]
	movaps xmm0, xmm4
	mulss xmm0, [eax]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	ucomiss xmm0, [eax+0xc]
	ja CM_PointContentsLeafBrushNode_r_820
	add edx, 0xc
	xor ebx, ebx
	sub esi, 0x1
CM_PointContentsLeafBrushNode_r_850:
	cmp ebx, esi
	jz CM_PointContentsLeafBrushNode_r_840
	mov eax, [edx]
	add ebx, 0x1
	add edx, 0xc
	movaps xmm0, xmm4
	mulss xmm0, [eax]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	ucomiss xmm0, [eax+0xc]
	jbe CM_PointContentsLeafBrushNode_r_850
	jmp CM_PointContentsLeafBrushNode_r_820
CM_PointContentsLeafBrushNode_r_260:
	cwde
	mov [ebp-0x88], eax
	test eax, eax
	jle CM_PointContentsLeafBrushNode_r_860
	mov ecx, [ebp-0x8c]
	mov ecx, [ecx+0x8]
	mov [ebp-0x84], ecx
	mov eax, cm
	mov eax, [eax+0x90]
	mov [ebp-0x80], eax
	mov dword [ebp-0x7c], 0x0
CM_PointContentsLeafBrushNode_r_980:
	mov edx, [ebp-0x7c]
	mov ecx, [ebp-0x84]
	movzx eax, word [ecx+edx*2]
	lea eax, [eax+eax*4]
	shl eax, 0x4
	mov ebx, [ebp-0x80]
	add ebx, eax
	mov eax, ebx
	mov edx, 0x1
	jmp CM_PointContentsLeafBrushNode_r_870
CM_PointContentsLeafBrushNode_r_900:
	ucomiss xmm1, [eax+0x10]
	ja CM_PointContentsLeafBrushNode_r_880
	add edx, 0x1
	add eax, 0x4
	cmp edx, 0x4
	jz CM_PointContentsLeafBrushNode_r_890
CM_PointContentsLeafBrushNode_r_870:
	movss xmm1, dword [edi+edx*4-0x4]
	movss xmm0, dword [eax]
	ucomiss xmm0, xmm1
	jbe CM_PointContentsLeafBrushNode_r_900
	jmp CM_PointContentsLeafBrushNode_r_880
CM_PointContentsLeafBrushNode_r_220:
	cwde
	mov [ebp-0xa0], eax
	test eax, eax
	jle CM_PointContentsLeafBrushNode_r_910
	mov eax, [ebp-0xa4]
	mov eax, [eax+0x8]
	mov [ebp-0x9c], eax
	mov eax, cm
	mov eax, [eax+0x90]
	mov [ebp-0x98], eax
	mov dword [ebp-0x94], 0x0
CM_PointContentsLeafBrushNode_r_1000:
	mov edx, [ebp-0x94]
	mov ecx, [ebp-0x9c]
	movzx eax, word [ecx+edx*2]
	lea eax, [eax+eax*4]
	shl eax, 0x4
	mov ebx, [ebp-0x98]
	add ebx, eax
	mov eax, ebx
	mov edx, 0x1
CM_PointContentsLeafBrushNode_r_930:
	movss xmm1, dword [edi+edx*4-0x4]
	movss xmm0, dword [eax]
	ucomiss xmm0, xmm1
	ja CM_PointContentsLeafBrushNode_r_920
	ucomiss xmm1, [eax+0x10]
	ja CM_PointContentsLeafBrushNode_r_920
	add edx, 0x1
	add eax, 0x4
	cmp edx, 0x4
	jnz CM_PointContentsLeafBrushNode_r_930
	mov edx, [ebx+0x20]
	mov esi, [ebx+0x1c]
	test esi, esi
	jz CM_PointContentsLeafBrushNode_r_940
	mov eax, [edx]
	movss xmm4, dword [edi]
	movss xmm3, dword [edi+0x4]
	movss xmm2, dword [edi+0x8]
	movaps xmm0, xmm4
	mulss xmm0, [eax]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	ucomiss xmm0, [eax+0xc]
	ja CM_PointContentsLeafBrushNode_r_920
	add edx, 0xc
	xor ecx, ecx
	sub esi, 0x1
CM_PointContentsLeafBrushNode_r_950:
	cmp ecx, esi
	jz CM_PointContentsLeafBrushNode_r_940
	mov eax, [edx]
	add ecx, 0x1
	add edx, 0xc
	movaps xmm0, xmm4
	mulss xmm0, [eax]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	ucomiss xmm0, [eax+0xc]
	jbe CM_PointContentsLeafBrushNode_r_950
	jmp CM_PointContentsLeafBrushNode_r_920
CM_PointContentsLeafBrushNode_r_890:
	mov edx, [ebx+0x20]
	mov esi, [ebx+0x1c]
	test esi, esi
	jz CM_PointContentsLeafBrushNode_r_960
	mov eax, [edx]
	movss xmm4, dword [edi]
	movss xmm3, dword [edi+0x4]
	movss xmm2, dword [edi+0x8]
	movaps xmm0, xmm4
	mulss xmm0, [eax]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	ucomiss xmm0, [eax+0xc]
	ja CM_PointContentsLeafBrushNode_r_880
	add edx, 0xc
	xor ecx, ecx
	sub esi, 0x1
CM_PointContentsLeafBrushNode_r_970:
	cmp ecx, esi
	jz CM_PointContentsLeafBrushNode_r_960
	mov eax, [edx]
	add ecx, 0x1
	add edx, 0xc
	movaps xmm0, xmm4
	mulss xmm0, [eax]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	ucomiss xmm0, [eax+0xc]
	jbe CM_PointContentsLeafBrushNode_r_970
	jmp CM_PointContentsLeafBrushNode_r_880
CM_PointContentsLeafBrushNode_r_960:
	mov eax, [ebx+0xc]
	or [ebp-0x78], eax
CM_PointContentsLeafBrushNode_r_880:
	add dword [ebp-0x7c], 0x1
	mov edx, [ebp-0x88]
	cmp [ebp-0x7c], edx
	jnz CM_PointContentsLeafBrushNode_r_980
CM_PointContentsLeafBrushNode_r_860:
	mov ecx, [ebp-0x78]
	or [ebp-0x90], ecx
	jmp CM_PointContentsLeafBrushNode_r_990
CM_PointContentsLeafBrushNode_r_940:
	mov eax, [ebx+0xc]
	or [ebp-0x90], eax
CM_PointContentsLeafBrushNode_r_920:
	add dword [ebp-0x94], 0x1
	mov edx, [ebp-0xa0]
	cmp [ebp-0x94], edx
	jnz CM_PointContentsLeafBrushNode_r_1000
CM_PointContentsLeafBrushNode_r_910:
	mov ecx, [ebp-0x90]
	or [ebp-0xa8], ecx
	jmp CM_PointContentsLeafBrushNode_r_1010
CM_PointContentsLeafBrushNode_r_180:
	mov eax, [ebx+0xc]
	or [ebp-0xc0], eax
	jmp CM_PointContentsLeafBrushNode_r_160
	nop


;CM_ClusterPVS(int)
CM_ClusterPVS:
	push ebp
	mov ebp, esp
	mov edx, cm
	mov eax, [edx+0xa0]
	test eax, eax
	jnz CM_ClusterPVS_10
	mov eax, [edx+0x9c]
	pop ebp
	ret
CM_ClusterPVS_10:
	mov eax, [ebp+0x8]
	imul eax, [edx+0x98]
	add eax, [edx+0x9c]
	pop ebp
	ret
	nop
	add [eax], al


;CM_BoxLeafnums(float const*, float const*, unsigned short*, int, int*)
CM_BoxLeafnums:
	push ebp
	mov ebp, esp
	push ebx
	sub esp, 0x44
	mov edx, [ebp+0x8]
	mov ecx, [ebp+0xc]
	mov eax, [edx]
	mov [ebp-0x24], eax
	lea ebx, [ebp-0x34]
	mov eax, [edx+0x4]
	mov [ebp-0x20], eax
	mov eax, [edx+0x8]
	mov [ebp-0x1c], eax
	mov eax, [ecx]
	mov [ebp-0x18], eax
	mov eax, [ecx+0x4]
	mov [ebp-0x14], eax
	mov eax, [ecx+0x8]
	mov [ebp-0x10], eax
	mov dword [ebp-0x34], 0x0
	mov eax, [ebp+0x14]
	mov [ebp-0x30], eax
	mov eax, [ebp+0x10]
	mov [ebp-0x28], eax
	mov dword [ebp-0xc], 0x0
	mov dword [ebp-0x2c], 0x0
	mov dword [esp+0x4], 0x0
	mov [esp], ebx
	call CM_BoxLeafnums_r
	mov edx, [ebp-0xc]
	mov eax, [ebp+0x18]
	mov [eax], edx
	mov eax, [ebp-0x34]
	add esp, 0x44
	pop ebx
	pop ebp
	ret


;CM_PointLeafnum(float const*)
CM_PointLeafnum:
	push ebp
	mov ebp, esp
	push esi
	push ebx
	mov ebx, [ebp+0x8]
	mov eax, cm
	mov esi, [eax+0x34]
	xor eax, eax
	pxor xmm2, xmm2
	jmp CM_PointLeafnum_10
CM_PointLeafnum_40:
	movzx eax, al
	movss xmm1, dword [ebx+eax*4]
	subss xmm1, [edx+0xc]
	ucomiss xmm2, xmm1
	ja CM_PointLeafnum_20
CM_PointLeafnum_50:
	movsx eax, word [ecx+0x4]
	test eax, eax
	js CM_PointLeafnum_30
CM_PointLeafnum_10:
	lea ecx, [esi+eax*8]
	mov edx, [ecx]
	movzx eax, byte [edx+0x10]
	cmp al, 0x2
	jbe CM_PointLeafnum_40
	movss xmm1, dword [edx]
	mulss xmm1, [ebx]
	movss xmm0, dword [edx+0x4]
	mulss xmm0, [ebx+0x4]
	addss xmm1, xmm0
	movss xmm0, dword [edx+0x8]
	mulss xmm0, [ebx+0x8]
	addss xmm1, xmm0
	subss xmm1, [edx+0xc]
	ucomiss xmm2, xmm1
	jbe CM_PointLeafnum_50
CM_PointLeafnum_20:
	movsx eax, word [ecx+0x6]
	test eax, eax
	jns CM_PointLeafnum_10
CM_PointLeafnum_30:
	not eax
	pop ebx
	pop esi
	pop ebp
	ret
	nop
	add [eax], al


;CM_BoxLeafnums_r(leafList_s*, int)
CM_BoxLeafnums_r:
CM_BoxLeafnums_r_40:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x2c
	mov esi, [ebp+0x8]
	mov edx, [ebp+0xc]
	test edx, edx
	js CM_BoxLeafnums_r_10
	lea eax, [esi+0x1c]
	mov [ebp-0x1c], eax
	lea edi, [esi+0x10]
CM_BoxLeafnums_r_50:
	mov ecx, cm
	mov eax, [ecx+0x34]
	lea ebx, [eax+edx*8]
	mov eax, [ebx]
	mov [esp+0x8], eax
	mov eax, [ebp-0x1c]
	mov [esp+0x4], eax
	mov [esp], edi
	call BoxOnPlaneSide
	cmp eax, 0x1
	jz CM_BoxLeafnums_r_20
	cmp eax, 0x2
	jz CM_BoxLeafnums_r_30
	movsx eax, word [ebx+0x4]
	mov [esp+0x4], eax
	mov [esp], esi
	call CM_BoxLeafnums_r_40
CM_BoxLeafnums_r_30:
	movsx edx, word [ebx+0x6]
CM_BoxLeafnums_r_80:
	test edx, edx
	jns CM_BoxLeafnums_r_50
CM_BoxLeafnums_r_10:
	mov ecx, edx
	not ecx
	mov eax, cm
	mov edx, [eax+0x3c]
	lea eax, [ecx+ecx*4]
	lea eax, [ecx+eax*2]
	cmp word [edx+eax*4+0x28], 0xffff
	jz CM_BoxLeafnums_r_60
	mov [esi+0x28], ecx
CM_BoxLeafnums_r_60:
	mov edx, [esi]
	cmp edx, [esi+0x4]
	jl CM_BoxLeafnums_r_70
	mov dword [esi+0x8], 0x1
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_BoxLeafnums_r_20:
	movsx edx, word [ebx+0x4]
	jmp CM_BoxLeafnums_r_80
CM_BoxLeafnums_r_70:
	mov eax, [esi+0xc]
	mov [eax+edx*2], cx
	lea eax, [edx+0x1]
	mov [esi], eax
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


;CM_PointContents(float const*, unsigned int)
CM_PointContents:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x3c
	mov esi, [ebp+0x8]
	mov eax, [ebp+0xc]
	test eax, eax
	jnz CM_PointContents_10
	mov edi, cm
	mov ebx, [edi+0x34]
	xor eax, eax
	pxor xmm2, xmm2
	jmp CM_PointContents_20
CM_PointContents_50:
	movzx eax, al
	movss xmm1, dword [esi+eax*4]
	subss xmm1, [edx+0xc]
	ucomiss xmm2, xmm1
	ja CM_PointContents_30
CM_PointContents_60:
	movsx eax, word [ecx+0x4]
	test eax, eax
	js CM_PointContents_40
CM_PointContents_20:
	lea ecx, [ebx+eax*8]
	mov edx, [ecx]
	movzx eax, byte [edx+0x10]
	cmp al, 0x2
	jbe CM_PointContents_50
	movss xmm1, dword [edx]
	mulss xmm1, [esi]
	movss xmm0, dword [edx+0x4]
	mulss xmm0, [esi+0x4]
	addss xmm1, xmm0
	movss xmm0, dword [edx+0x8]
	mulss xmm0, [esi+0x8]
	addss xmm1, xmm0
	subss xmm1, [edx+0xc]
	ucomiss xmm2, xmm1
	jbe CM_PointContents_60
CM_PointContents_30:
	movsx eax, word [ecx+0x6]
	test eax, eax
	jns CM_PointContents_20
CM_PointContents_40:
	not eax
	lea edx, [eax+eax*4]
	lea edx, [eax+edx*2]
	mov eax, [edi+0x3c]
	lea eax, [eax+edx*4]
CM_PointContents_200:
	mov ecx, [eax+0x24]
	test ecx, ecx
	jz CM_PointContents_70
	mov edx, 0x1
CM_PointContents_80:
	movss xmm1, dword [esi+edx*4-0x4]
	movss xmm0, dword [eax+0xc]
	ucomiss xmm0, xmm1
	jae CM_PointContents_70
	ucomiss xmm1, [eax+0x18]
	jae CM_PointContents_70
	add edx, 0x1
	add eax, 0x4
	cmp edx, 0x4
	jnz CM_PointContents_80
	lea eax, [ecx+ecx*4]
	mov edx, cm
	mov edx, [edx+0x44]
	lea ebx, [edx+eax*4]
	mov dword [ebp-0x1c], 0x0
	jmp CM_PointContents_90
CM_PointContents_120:
	xor eax, eax
CM_PointContents_130:
	movzx eax, word [ebx+eax+0x10]
	lea eax, [eax+eax*4]
	lea ebx, [ebx+eax*4]
CM_PointContents_90:
	movzx eax, word [ebx+0x2]
	cmp ax, 0x0
	jz CM_PointContents_100
	jg CM_PointContents_110
	lea edx, [ebx+0x14]
	mov eax, esi
	call CM_PointContentsLeafBrushNode_r
	or [ebp-0x1c], eax
CM_PointContents_100:
	movzx eax, byte [ebx]
	movss xmm0, dword [ebx+0x8]
	ucomiss xmm0, [esi+eax*4]
	jb CM_PointContents_120
	mov eax, 0x2
	jmp CM_PointContents_130
CM_PointContents_110:
	cwde
	mov [ebp-0x2c], eax
	test eax, eax
	jle CM_PointContents_140
	mov ebx, [ebx+0x8]
	mov [ebp-0x28], ebx
	mov eax, cm
	mov eax, [eax+0x90]
	mov [ebp-0x24], eax
	xor edi, edi
	mov edx, ebx
CM_PointContents_190:
	movzx eax, word [edx+edi*2]
	lea eax, [eax+eax*4]
	shl eax, 0x4
	mov edx, [ebp-0x24]
	add edx, eax
	mov eax, edx
	mov ecx, 0x1
CM_PointContents_160:
	movss xmm1, dword [esi+ecx*4-0x4]
	movss xmm0, dword [eax]
	ucomiss xmm0, xmm1
	ja CM_PointContents_150
	ucomiss xmm1, [eax+0x10]
	ja CM_PointContents_150
	add ecx, 0x1
	add eax, 0x4
	cmp ecx, 0x4
	jnz CM_PointContents_160
	mov ecx, [edx+0x20]
	mov eax, [edx+0x1c]
	mov [ebp-0x20], eax
	test eax, eax
	jz CM_PointContents_170
	mov eax, [ecx]
	movss xmm4, dword [esi]
	movss xmm3, dword [esi+0x4]
	movss xmm2, dword [esi+0x8]
	movaps xmm0, xmm3
	mulss xmm0, [eax+0x4]
	movaps xmm1, xmm4
	mulss xmm1, [eax]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	ucomiss xmm0, [eax+0xc]
	ja CM_PointContents_150
	add ecx, 0xc
	xor ebx, ebx
	mov eax, [ebp-0x20]
	sub eax, 0x1
	mov [ebp-0x30], eax
CM_PointContents_180:
	cmp ebx, [ebp-0x30]
	jz CM_PointContents_170
	mov eax, [ecx]
	add ebx, 0x1
	add ecx, 0xc
	movaps xmm0, xmm4
	mulss xmm0, [eax]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	ucomiss xmm0, [eax+0xc]
	jbe CM_PointContents_180
CM_PointContents_150:
	add edi, 0x1
	cmp [ebp-0x2c], edi
	jz CM_PointContents_140
	mov edx, [ebp-0x28]
	jmp CM_PointContents_190
CM_PointContents_70:
	mov dword [ebp-0x1c], 0x0
CM_PointContents_140:
	mov eax, [ebp-0x1c]
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
CM_PointContents_170:
	mov eax, [edx+0xc]
	or [ebp-0x1c], eax
	jmp CM_PointContents_150
CM_PointContents_10:
	mov [esp], eax
	call CM_ClipHandleToModel
	add eax, 0x1c
	jmp CM_PointContents_200
	nop


;CM_TransformedPointContents(float const*, unsigned int, float const*, float const*)
CM_TransformedPointContents:
	push ebp
	mov ebp, esp
	sub esp, 0x48
	mov eax, [ebp+0x8]
	mov edx, [ebp+0x10]
	mov ecx, [ebp+0x14]
	movss xmm0, dword [eax]
	subss xmm0, [edx]
	movss [ebp-0x14], xmm0
	movss xmm0, dword [eax+0x4]
	subss xmm0, [edx+0x4]
	movss [ebp-0x10], xmm0
	movss xmm0, dword [eax+0x8]
	subss xmm0, [edx+0x8]
	movss [ebp-0xc], xmm0
	pxor xmm0, xmm0
	ucomiss xmm0, [ecx]
	jnz CM_TransformedPointContents_10
	jp CM_TransformedPointContents_10
	ucomiss xmm0, [ecx+0x4]
	jnz CM_TransformedPointContents_10
	jp CM_TransformedPointContents_10
	ucomiss xmm0, [ecx+0x8]
	jp CM_TransformedPointContents_10
	jz CM_TransformedPointContents_20
CM_TransformedPointContents_10:
	lea eax, [ebp-0x38]
	mov [esp+0x4], eax
	mov [esp], ecx
	call AnglesToAxis
	movss xmm2, dword [ebp-0x14]
	movss xmm3, dword [ebp-0x10]
	movss xmm4, dword [ebp-0xc]
	movaps xmm0, xmm2
	mulss xmm0, [ebp-0x38]
	movaps xmm1, xmm3
	mulss xmm1, [ebp-0x34]
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mulss xmm1, [ebp-0x30]
	addss xmm0, xmm1
	movss [ebp-0x14], xmm0
	movaps xmm0, xmm2
	mulss xmm0, [ebp-0x2c]
	movaps xmm1, xmm3
	mulss xmm1, [ebp-0x28]
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mulss xmm1, [ebp-0x24]
	addss xmm0, xmm1
	movss [ebp-0x10], xmm0
	mulss xmm2, [ebp-0x20]
	mulss xmm3, [ebp-0x1c]
	addss xmm2, xmm3
	mulss xmm4, [ebp-0x18]
	addss xmm2, xmm4
	movss [ebp-0xc], xmm2
CM_TransformedPointContents_20:
	mov eax, [ebp+0xc]
	mov [esp+0x4], eax
	lea eax, [ebp-0x14]
	mov [esp], eax
	call CM_PointContents
	leave
	ret
	add [eax], al


;Initialized global or static variables of cm_test:
SECTION .data


;Initialized constant data of cm_test:
SECTION .rdata


;Zero initialized global or static variables of cm_test:
SECTION .bss


;All cstrings:
SECTION .rdata



;All constant floats and doubles:
SECTION .rdata

