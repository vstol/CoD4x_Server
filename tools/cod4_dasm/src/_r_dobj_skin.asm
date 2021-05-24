;Imports of r_dobj_skin:
	extern DObjGetNumModels
	extern frontEndDataOut
	extern InterlockedExchangeAdd
	extern R_WarnOncePerFrame
	extern memcpy
	extern R_AddWorkerCmd
	extern DObjGetModel
	extern XModelNumBones
	extern XModelGetBasePose
	extern XModelGetSurfaces
	extern DObjGetHidePartBits
	extern useFastFile
	extern gfxBuf
	extern g_assetEntryPool
	extern DObjGetRotTransArray
	extern Vec4Normalize
	extern scene
	extern Z_VirtualCommitInternal
	extern CG_GetSkinCacheEntry
	extern InterlockedCompareExchange
	extern R_UpdateSceneEntBounds

;Exports of r_dobj_skin:
	global R_SkinSceneDObjModels
	global R_SkinSceneDObj
	global R_SkinGfxEntityCmd


SECTION .text


;R_SkinSceneDObjModels(GfxSceneEntity*, DObj_s const*, DObjAnimMat*)
R_SkinSceneDObjModels:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0xf6c
	mov [ebp-0xf20], eax
	mov [ebp-0xf24], edx
	mov [ebp-0xf28], ecx
	mov [esp], edx
	call DObjGetNumModels
	mov [ebp-0xf08], eax
	mov dword [ebp-0x58], 0x0
	mov dword [ebp-0x54], 0x0
	mov dword [ebp-0x50], 0x0
	mov dword [ebp-0x70], 0x0
	mov dword [ebp-0x6c], 0x0
	mov dword [ebp-0x68], 0x0
	mov dword [ebp-0x64], 0x0
	test eax, eax
	jnz R_SkinSceneDObjModels_10
	lea eax, [ebp-0xe78]
	mov [ebp-0xf18], eax
	mov dword [ebp-0xf1c], 0x0
	mov dword [ebp-0xf0c], 0x0
	mov esi, frontEndDataOut
	mov ebx, eax
R_SkinSceneDObjModels_260:
	lea ecx, [ebp-0xe78]
	sub ebx, ecx
	mov eax, [esi]
	add eax, 0x118258
	mov [esp+0x4], ebx
	mov [esp], eax
	call InterlockedExchangeAdd
	mov edx, eax
	lea eax, [ebx+eax]
	cmp eax, 0x20000
	jbe R_SkinSceneDObjModels_20
	mov dword [esp], 0x7
	call R_WarnOncePerFrame
R_SkinSceneDObjModels_180:
	mov dword [ebp-0xf1c], 0x0
R_SkinSceneDObjModels_30:
	mov eax, [ebp-0xf1c]
	add esp, 0xf6c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_SkinSceneDObjModels_20:
	mov esi, [esi]
	add esi, edx
	mov eax, [ebp-0xf20]
	mov [eax+0x68], esi
	mov [esp+0x8], ebx
	lea edx, [ebp-0xe78]
	mov [esp+0x4], edx
	mov [esp], esi
	call memcpy
	mov eax, [ebp-0xf0c]
	test eax, eax
	jz R_SkinSceneDObjModels_30
	mov [ebp-0x78], esi
	movzx ecx, word [ebp-0xf1c]
	mov [ebp-0x60], cx
	mov eax, [ebp-0xf28]
	mov [ebp-0x74], eax
	lea eax, [ebp-0x78]
	mov [esp+0x4], eax
	mov dword [esp], 0x10
	call R_AddWorkerCmd
	mov eax, [ebp-0xf1c]
	add esp, 0xf6c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_SkinSceneDObjModels_10:
	mov dword [ebp-0xf10], 0x0
	mov dword [ebp-0xf14], 0x0
	lea edx, [ebp-0xe78]
	mov [ebp-0xf18], edx
	mov dword [ebp-0xf1c], 0x0
	mov dword [ebp-0xf0c], 0x0
	mov ecx, [ebp-0xf14]
R_SkinSceneDObjModels_140:
	mov [esp+0x4], ecx
	mov eax, [ebp-0xf24]
	mov [esp], eax
	call DObjGetModel
	mov ebx, eax
	mov [esp], eax
	call XModelNumBones
	mov [ebp-0xf04], eax
	mov edx, [ebp-0xf14]
	mov ecx, [ebp-0xf20]
	movsx esi, byte [edx+ecx+0x48]
	test esi, esi
	js R_SkinSceneDObjModels_40
	movzx eax, byte [ebp-0xf10]
	mov [ebp-0xe9d], al
	mov [esp], ebx
	call XModelGetBasePose
	mov [ebp-0xea4], eax
	movzx edx, byte [ebp-0xf04]
	mov [ebp-0xea5], dl
	mov ecx, [ebp-0xf20]
	movzx ecx, word [ecx+0x6c]
	mov [ebp-0xea8], cx
	mov [esp+0x8], esi
	lea eax, [ebp-0x1c]
	mov [esp+0x4], eax
	mov [esp], ebx
	call XModelGetSurfaces
	mov [ebp-0xefc], eax
	add [ebp-0xf1c], eax
	mov eax, [ebp-0xf10]
	shr eax, 0x5
	mov [ebp-0xef8], eax
	mov edx, [ebp-0xf10]
	and edx, 0x1f
	mov [ebp-0xef4], edx
	mov dword [ebp-0xef0], 0x20
	sub [ebp-0xef0], edx
	lea eax, [ebp-0x2c]
	mov [esp+0x4], eax
	mov ecx, [ebp-0xf24]
	mov [esp], ecx
	call DObjGetHidePartBits
	mov eax, [ebp-0x1c]
	mov edx, [ebp-0xefc]
	test edx, edx
	jz R_SkinSceneDObjModels_50
	movzx edx, byte [ebp-0xe9d]
	shl edx, 0x5
	mov [ebp-0xeec], edx
	mov [ebp-0xe80], eax
	mov dword [ebp-0xf00], 0x0
	mov dword [ebp-0xe7c], 0x0
	mov dword [ebp-0xf2c], 0x3
	mov ecx, [ebp-0xef8]
	sub [ebp-0xf2c], ecx
	mov dword [ebp-0xf30], 0x4
	sub [ebp-0xf30], ecx
	mov dword [ebp-0xf34], 0x5
	sub [ebp-0xf34], ecx
	mov edx, eax
	jmp R_SkinSceneDObjModels_60
R_SkinSceneDObjModels_80:
	mov eax, [ebp-0xf2c]
	mov edi, [ebp+eax*4-0x58]
	mov edx, [ebp-0xf30]
	mov esi, [ebp+edx*4-0x58]
	mov ecx, [ebp-0xf34]
	mov ecx, [ebp+ecx*4-0x58]
	mov [ebp-0xf60], ecx
	mov eax, 0x6
	sub eax, [ebp-0xef8]
	mov ebx, [ebp+eax*4-0x58]
	mov eax, edi
	and eax, [ebp-0x2c]
	mov edx, esi
	and edx, [ebp-0x28]
	or eax, edx
	mov edx, [ebp-0xf60]
	and edx, [ebp-0x24]
	or eax, edx
	mov edx, ebx
	and edx, [ebp-0x20]
	or eax, edx
	jz R_SkinSceneDObjModels_70
R_SkinSceneDObjModels_90:
	mov eax, [ebp-0xf18]
	mov dword [eax], 0xfffffffd
	add eax, 0x4
	mov [ebp-0xf18], eax
	add dword [ebp-0xf00], 0x1
	add dword [ebp-0xe80], 0x38
	add dword [ebp-0xe7c], 0x38
	mov edx, [ebp-0xf00]
	cmp [ebp-0xefc], edx
	jbe R_SkinSceneDObjModels_50
R_SkinSceneDObjModels_120:
	mov edx, [ebp-0xe80]
R_SkinSceneDObjModels_60:
	mov eax, [edx+0x28]
	mov [ebp-0x4c], eax
	mov eax, [edx+0x2c]
	mov [ebp-0x48], eax
	mov eax, [edx+0x30]
	mov [ebp-0x44], eax
	mov eax, [edx+0x34]
	mov [ebp-0x40], eax
	mov edi, [ebp-0xef4]
	test edi, edi
	jz R_SkinSceneDObjModels_80
	mov ecx, [ebp-0xf2c]
	mov eax, [ebp+ecx*4-0x58]
	mov edi, eax
	movzx ecx, byte [ebp-0xef4]
	shr edi, cl
	mov edx, [ebp-0xf30]
	mov ebx, [ebp+edx*4-0x58]
	mov esi, eax
	movzx ecx, byte [ebp-0xef0]
	shl esi, cl
	mov eax, ebx
	movzx ecx, byte [ebp-0xef4]
	shr eax, cl
	or esi, eax
	mov eax, [ebp-0xf34]
	mov edx, [ebp+eax*4-0x58]
	movzx ecx, byte [ebp-0xef0]
	shl ebx, cl
	mov [ebp-0xf60], ebx
	mov eax, edx
	movzx ecx, byte [ebp-0xef4]
	shr eax, cl
	or [ebp-0xf60], eax
	mov ebx, edx
	movzx ecx, byte [ebp-0xef0]
	shl ebx, cl
	mov eax, 0x6
	sub eax, [ebp-0xef8]
	mov eax, [ebp+eax*4-0x58]
	movzx ecx, byte [ebp-0xef4]
	shr eax, cl
	or ebx, eax
	mov eax, edi
	and eax, [ebp-0x2c]
	mov edx, esi
	and edx, [ebp-0x28]
	or eax, edx
	mov edx, [ebp-0xf60]
	and edx, [ebp-0x24]
	or eax, edx
	mov edx, ebx
	and edx, [ebp-0x20]
	or eax, edx
	jnz R_SkinSceneDObjModels_90
R_SkinSceneDObjModels_70:
	or [ebp-0x70], edi
	or [ebp-0x6c], esi
	mov edx, [ebp-0xf60]
	or [ebp-0x68], edx
	or [ebp-0x64], ebx
	mov ecx, [ebp-0xe80]
	cmp byte [ecx+0x1], 0x0
	jnz R_SkinSceneDObjModels_100
	mov eax, useFastFile
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_SkinSceneDObjModels_100
	cmp dword [ecx+0x20], 0x1
	jz R_SkinSceneDObjModels_110
R_SkinSceneDObjModels_100:
	mov edx, [ebp-0xf0c]
	mov eax, [ebp-0xf18]
	mov [eax], edx
	mov ecx, [ebp-0xe80]
	movzx eax, word [ecx+0x2]
	add edx, eax
	mov [ebp-0xf0c], edx
	mov edx, 0x18
R_SkinSceneDObjModels_250:
	mov eax, [ebp-0xe7c]
	add eax, [ebp-0x1c]
	mov ecx, [ebp-0xf18]
	mov [ecx+0x4], eax
	mov word [ecx+0x10], 0x0
	movzx eax, word [ebp-0xea8]
	mov [ecx+0xe], ax
	movzx eax, byte [ebp-0xea5]
	mov [ecx+0xd], al
	mov eax, [ebp-0xea4]
	mov [ecx+0x8], eax
	movzx eax, byte [ebp-0xe9d]
	mov [ecx+0xc], al
	add ecx, edx
	mov [ebp-0xf18], ecx
	add dword [ebp-0xf00], 0x1
	add dword [ebp-0xe80], 0x38
	add dword [ebp-0xe7c], 0x38
	mov edx, [ebp-0xf00]
	cmp [ebp-0xefc], edx
	ja R_SkinSceneDObjModels_120
R_SkinSceneDObjModels_50:
	mov ecx, [ebp-0xf04]
	add dword [ebp-0xf14], 0x1
	add [ebp-0xf10], ecx
	mov eax, [ebp-0xf14]
	cmp [ebp-0xf08], eax
	jbe R_SkinSceneDObjModels_130
R_SkinSceneDObjModels_150:
	mov ecx, eax
	jmp R_SkinSceneDObjModels_140
R_SkinSceneDObjModels_40:
	mov ecx, eax
	add dword [ebp-0xf14], 0x1
	add [ebp-0xf10], ecx
	mov eax, [ebp-0xf14]
	cmp [ebp-0xf08], eax
	ja R_SkinSceneDObjModels_150
R_SkinSceneDObjModels_130:
	mov esi, [ebp-0xf0c]
	test esi, esi
	jz R_SkinSceneDObjModels_160
	mov esi, gfxBuf
	cmp byte [esi+0x24008d], 0x0
	jz R_SkinSceneDObjModels_170
	mov ebx, [esi+0x5c]
	test ebx, ebx
	jz R_SkinSceneDObjModels_180
	mov ebx, [ebp-0xf0c]
	shl ebx, 0x5
	mov eax, frontEndDataOut
	mov eax, [eax]
	mov eax, [eax+0x11e690]
	mov [esp+0x4], ebx
	mov [esp], eax
	call InterlockedExchangeAdd
	mov edi, eax
	add ebx, eax
	cmp ebx, g_assetEntryPool+0x48ec0
	ja R_SkinSceneDObjModels_190
	test eax, eax
	js R_SkinSceneDObjModels_180
	cmp byte [esi+0x24008c], 0x0
	jnz R_SkinSceneDObjModels_200
	mov dword [ebp-0xeb0], 0x80000001
R_SkinSceneDObjModels_350:
	mov ecx, [ebp-0xf1c]
	test ecx, ecx
	jz R_SkinSceneDObjModels_160
	lea esi, [ebp-0xe78]
	xor ebx, ebx
	jmp R_SkinSceneDObjModels_210
R_SkinSceneDObjModels_230:
	cmp eax, 0xfffffffd
	jz R_SkinSceneDObjModels_220
	add esi, 0x18
	mov eax, [ecx]
	shl eax, 0x5
	mov edx, [ebp-0xeb0]
	add edx, eax
	mov [ecx+0x14], edx
	add eax, edi
	mov [ecx], eax
R_SkinSceneDObjModels_240:
	add ebx, 0x1
	cmp [ebp-0xf1c], ebx
	jz R_SkinSceneDObjModels_160
R_SkinSceneDObjModels_210:
	mov ecx, esi
	mov eax, [esi]
	cmp eax, 0xfffffffe
	jnz R_SkinSceneDObjModels_230
	lea esi, [esi+0x38]
	jmp R_SkinSceneDObjModels_240
R_SkinSceneDObjModels_110:
	mov eax, [ebp-0xf18]
	mov dword [eax], 0xfffffffe
	mov dword [eax+0x34], 0x3f800000
	mov edx, [ebp-0xf24]
	mov [esp], edx
	call DObjGetRotTransArray
	mov ecx, [ebp-0xe80]
	mov edx, [ecx+0x24]
	movzx ecx, word [edx]
	shr cx, 0x6
	movzx ecx, cx
	shl ecx, 0x5
	mov edx, [ebp-0xea4]
	add edx, ecx
	movss xmm1, dword [edx+0x1c]
	movss xmm0, dword [edx]
	movss [ebp-0xed8], xmm0
	movaps xmm2, xmm0
	mulss xmm2, xmm1
	movss xmm7, dword [edx+0x4]
	movss [ebp-0xed4], xmm7
	movaps xmm6, xmm7
	mulss xmm6, xmm1
	movss xmm0, dword [edx+0x8]
	movss [ebp-0xed0], xmm0
	mulss xmm1, xmm0
	movss xmm7, dword [ebp-0xed8]
	mulss xmm7, xmm2
	movss [ebp-0xee8], xmm7
	movss xmm0, dword [ebp-0xed4]
	mulss xmm0, xmm2
	movss [ebp-0xee4], xmm0
	movss xmm7, dword [ebp-0xed0]
	mulss xmm7, xmm2
	movss [ebp-0xee0], xmm7
	movss xmm3, dword [edx+0xc]
	mulss xmm2, xmm3
	movss xmm0, dword [ebp-0xed4]
	mulss xmm0, xmm6
	movss [ebp-0xedc], xmm0
	movss xmm5, dword [ebp-0xed0]
	mulss xmm5, xmm6
	mulss xmm6, xmm3
	movss xmm4, dword [ebp-0xed0]
	mulss xmm4, xmm1
	mulss xmm1, xmm3
	addss xmm0, xmm4
	movss xmm7, dword [_float_1_00000000]
	subss xmm7, xmm0
	movss [ebp-0xe94], xmm7
	mulss xmm7, [edx+0x10]
	movss xmm0, dword [ebp-0xee4]
	addss xmm0, xmm1
	mulss xmm0, [edx+0x14]
	addss xmm0, xmm7
	movss [ebp-0xe94], xmm0
	movss xmm0, dword [ebp-0xee0]
	subss xmm0, xmm6
	mulss xmm0, [edx+0x18]
	addss xmm0, [ebp-0xe94]
	movss [ebp-0xe94], xmm0
	xor dword [ebp-0xe94], 0x80000000
	movss xmm0, dword [ebp-0xee4]
	subss xmm0, xmm1
	movss [ebp-0xe98], xmm0
	mulss xmm0, [edx+0x10]
	movss [ebp-0xe98], xmm0
	addss xmm4, [ebp-0xee8]
	movss xmm0, dword [_float_1_00000000]
	subss xmm0, xmm4
	mulss xmm0, [edx+0x14]
	addss xmm0, [ebp-0xe98]
	movss [ebp-0xe98], xmm0
	movaps xmm0, xmm2
	addss xmm0, xmm5
	mulss xmm0, [edx+0x18]
	addss xmm0, [ebp-0xe98]
	movss [ebp-0xe98], xmm0
	xor dword [ebp-0xe98], 0x80000000
	addss xmm6, [ebp-0xee0]
	movaps xmm1, xmm6
	mulss xmm1, [edx+0x10]
	subss xmm5, xmm2
	mulss xmm5, [edx+0x14]
	addss xmm5, xmm1
	movss [ebp-0xe9c], xmm5
	movss xmm7, dword [ebp-0xee8]
	addss xmm7, [ebp-0xedc]
	movss xmm0, dword [_float_1_00000000]
	subss xmm0, xmm7
	mulss xmm0, [edx+0x18]
	addss xmm0, xmm5
	movss [ebp-0xe9c], xmm0
	xor dword [ebp-0xe9c], 0x80000000
	add eax, [ebp-0xeec]
	add eax, ecx
	movss xmm0, dword [eax+0x1c]
	movss xmm4, dword [eax]
	movaps xmm6, xmm0
	mulss xmm6, xmm4
	movss xmm2, dword [eax+0x4]
	movaps xmm1, xmm0
	mulss xmm1, xmm2
	movss [ebp-0xf5c], xmm1
	movss xmm1, dword [eax+0x8]
	mulss xmm0, xmm1
	movss [ebp-0xe84], xmm0
	movaps xmm7, xmm6
	mulss xmm7, xmm4
	movss [ebp-0xecc], xmm7
	movaps xmm5, xmm6
	mulss xmm5, xmm2
	movaps xmm0, xmm6
	mulss xmm0, xmm1
	movss [ebp-0xec8], xmm0
	movss xmm0, dword [eax+0xc]
	mulss xmm6, xmm0
	movss xmm7, dword [ebp-0xf5c]
	mulss xmm7, xmm2
	movss [ebp-0xec4], xmm7
	movss xmm7, dword [ebp-0xf5c]
	mulss xmm7, xmm1
	movss [ebp-0xec0], xmm7
	movss xmm7, dword [ebp-0xf5c]
	mulss xmm7, xmm0
	movss [ebp-0xebc], xmm7
	movss xmm7, dword [ebp-0xe84]
	mulss xmm7, xmm1
	movss [ebp-0xeb8], xmm7
	movss xmm7, dword [ebp-0xe84]
	mulss xmm7, xmm0
	movss [ebp-0xeb4], xmm7
	movss xmm7, dword [eax+0x10]
	movss [ebp-0xe88], xmm7
	movss xmm7, dword [eax+0x14]
	movss [ebp-0xe8c], xmm7
	movss xmm7, dword [eax+0x18]
	movss [ebp-0xe90], xmm7
	mulss xmm0, [ebp-0xed8]
	mulss xmm3, xmm4
	subss xmm3, xmm0
	mulss xmm2, [ebp-0xed0]
	movss [ebp-0xed0], xmm2
	subss xmm3, xmm2
	mulss xmm1, [ebp-0xed4]
	addss xmm3, xmm1
	movss [ebp-0x3c], xmm3
	movss xmm1, dword [edx+0x4]
	movss xmm0, dword [eax]
	movss xmm2, dword [eax+0x4]
	movss xmm3, dword [eax+0x8]
	mulss xmm1, [eax+0xc]
	mulss xmm0, [edx+0x8]
	subss xmm0, xmm1
	mulss xmm2, [edx+0xc]
	addss xmm0, xmm2
	mulss xmm3, [edx]
	subss xmm0, xmm3
	movss [ebp-0x38], xmm0
	movss xmm0, dword [edx+0x8]
	movss xmm1, dword [eax]
	movss xmm2, dword [eax+0x4]
	movss xmm3, dword [eax+0x8]
	xorps xmm0, [_data16_80000000]
	mulss xmm0, [eax+0xc]
	mulss xmm1, [edx+0x4]
	subss xmm0, xmm1
	mulss xmm2, [edx]
	addss xmm0, xmm2
	mulss xmm3, [edx+0xc]
	addss xmm0, xmm3
	movss [ebp-0x34], xmm0
	movss xmm0, dword [eax+0xc]
	movss xmm1, dword [eax]
	movss xmm2, dword [eax+0x4]
	movss xmm3, dword [eax+0x8]
	mulss xmm0, [edx+0xc]
	mulss xmm1, [edx]
	addss xmm0, xmm1
	mulss xmm2, [edx+0x4]
	addss xmm0, xmm2
	mulss xmm3, [edx+0x8]
	addss xmm0, xmm3
	movss [ebp-0x30], xmm0
	lea eax, [ebp-0x3c]
	mov [esp], eax
	movss [ebp-0xf48], xmm5
	movss [ebp-0xf58], xmm6
	call Vec4Normalize
	fstp st0
	mov eax, [ebp-0x3c]
	mov edx, [ebp-0xf18]
	mov [edx+0x18], eax
	mov eax, [ebp-0x38]
	mov [edx+0x1c], eax
	mov eax, [ebp-0x34]
	mov [edx+0x20], eax
	mov eax, [ebp-0x30]
	mov [edx+0x24], eax
	movss xmm0, dword [ebp-0xec4]
	addss xmm0, [ebp-0xeb8]
	movss xmm1, dword [_float_1_00000000]
	subss xmm1, xmm0
	mulss xmm1, [ebp-0xe94]
	movss xmm5, dword [ebp-0xf48]
	movaps xmm0, xmm5
	subss xmm0, [ebp-0xeb4]
	mulss xmm0, [ebp-0xe98]
	addss xmm1, xmm0
	movss xmm0, dword [ebp-0xec8]
	addss xmm0, [ebp-0xebc]
	mulss xmm0, [ebp-0xe9c]
	addss xmm1, xmm0
	addss xmm1, [ebp-0xe88]
	movss [ebp-0xe88], xmm1
	mov ecx, scene
	addss xmm1, [ecx+0x114220]
	movss [edx+0x28], xmm1
	addss xmm5, [ebp-0xeb4]
	mulss xmm5, [ebp-0xe94]
	movss xmm0, dword [ebp-0xecc]
	addss xmm0, [ebp-0xeb8]
	movss [ebp-0xeb8], xmm0
	movss xmm0, dword [_float_1_00000000]
	subss xmm0, [ebp-0xeb8]
	mulss xmm0, [ebp-0xe98]
	addss xmm5, xmm0
	movss xmm6, dword [ebp-0xf58]
	movss xmm0, dword [ebp-0xec0]
	subss xmm0, xmm6
	mulss xmm0, [ebp-0xe9c]
	addss xmm5, xmm0
	addss xmm5, [ebp-0xe8c]
	movaps xmm1, xmm5
	addss xmm1, [ecx+0x114224]
	movss [edx+0x2c], xmm1
	movss xmm7, dword [ebp-0xec8]
	subss xmm7, [ebp-0xebc]
	movss xmm0, dword [ebp-0xe94]
	mulss xmm0, xmm7
	addss xmm6, [ebp-0xec0]
	mulss xmm6, [ebp-0xe98]
	addss xmm6, xmm0
	movss [ebp-0xec8], xmm6
	movss xmm1, dword [ebp-0xecc]
	addss xmm1, [ebp-0xec4]
	movss xmm0, dword [_float_1_00000000]
	subss xmm0, xmm1
	mulss xmm0, [ebp-0xe9c]
	addss xmm0, xmm6
	movss xmm7, dword [ebp-0xe90]
	addss xmm7, xmm0
	movss [ebp-0xe90], xmm7
	addss xmm7, [ecx+0x114228]
	movss [edx+0x30], xmm7
	mov edx, 0x38
	jmp R_SkinSceneDObjModels_250
R_SkinSceneDObjModels_160:
	mov esi, frontEndDataOut
	mov ebx, [ebp-0xf18]
	jmp R_SkinSceneDObjModels_260
R_SkinSceneDObjModels_220:
	lea esi, [esi+0x4]
	jmp R_SkinSceneDObjModels_240
R_SkinSceneDObjModels_170:
	mov ebx, [ebp-0xf0c]
	shl ebx, 0x5
	mov esi, frontEndDataOut
	mov eax, [esi]
	add eax, 0x11e69c
	mov [esp+0x4], ebx
	mov [esp], eax
	call InterlockedExchangeAdd
	mov [ebp-0xeac], eax
	lea eax, [ebx+eax]
	cmp eax, g_assetEntryPool+0x48ec0
	ja R_SkinSceneDObjModels_270
	mov eax, [esi]
	mov eax, [eax+0x11e698]
	mov [esp+0x4], ebx
	add eax, [ebp-0xeac]
	mov [esp], eax
	call Z_VirtualCommitInternal
	mov edx, [ebp-0xf1c]
	test edx, edx
	jz R_SkinSceneDObjModels_280
	lea edi, [ebp-0xe78]
	xor ebx, ebx
	jmp R_SkinSceneDObjModels_290
R_SkinSceneDObjModels_310:
	cmp eax, 0xfffffffd
	jz R_SkinSceneDObjModels_300
	add edi, 0x18
	mov eax, [esi]
	mov edx, [ecx]
	mov eax, [eax+0x11e698]
	add eax, [ebp-0xeac]
	shl edx, 0x5
	add eax, edx
	mov [ecx+0x14], eax
	mov dword [ecx], 0xffffffff
R_SkinSceneDObjModels_320:
	add ebx, 0x1
	cmp ebx, [ebp-0xf1c]
	jz R_SkinSceneDObjModels_280
R_SkinSceneDObjModels_290:
	mov ecx, edi
	mov eax, [edi]
	cmp eax, 0xfffffffe
	jnz R_SkinSceneDObjModels_310
	lea edi, [edi+0x38]
	jmp R_SkinSceneDObjModels_320
R_SkinSceneDObjModels_190:
	mov dword [esp], 0x6
	call R_WarnOncePerFrame
	mov dword [ebp-0xf1c], 0x0
	jmp R_SkinSceneDObjModels_30
R_SkinSceneDObjModels_270:
	mov dword [esp], 0x5
	call R_WarnOncePerFrame
	mov dword [ebp-0xf1c], 0x0
	jmp R_SkinSceneDObjModels_30
R_SkinSceneDObjModels_280:
	mov ebx, [ebp-0xf18]
	jmp R_SkinSceneDObjModels_260
R_SkinSceneDObjModels_300:
	lea edi, [edi+0x4]
	jmp R_SkinSceneDObjModels_320
R_SkinSceneDObjModels_200:
	mov edx, [ebp-0xf20]
	mov eax, [edx+0x74]
	mov [esp], eax
	call CG_GetSkinCacheEntry
	mov edx, eax
	movzx ecx, word [eax+0xa]
	cmp cx, 0x2
	ja R_SkinSceneDObjModels_330
	mov eax, [esi+0x240088]
	sub eax, 0x1
	cmp eax, [edx]
	jz R_SkinSceneDObjModels_340
R_SkinSceneDObjModels_330:
	mov word [edx+0xa], 0x0
	mov dword [ebp-0xeb0], 0x80000001
R_SkinSceneDObjModels_360:
	mov eax, gfxBuf
	mov eax, [eax+0x240088]
	mov [edx], eax
	movzx ecx, word [ebp-0xf0c]
	mov [edx+0x8], cx
	mov [edx+0x4], edi
	jmp R_SkinSceneDObjModels_350
R_SkinSceneDObjModels_340:
	movzx eax, word [edx+0x8]
	cmp eax, [ebp-0xf0c]
	jnz R_SkinSceneDObjModels_330
	mov eax, [edx+0x4]
	mov [ebp-0xeb0], eax
	lea eax, [ecx+0x1]
	mov [edx+0xa], ax
	jmp R_SkinSceneDObjModels_360
	nop


;R_SkinSceneDObj(GfxSceneEntity*, GfxSceneEntity*, DObj_s const*, DObjAnimMat*, int)
R_SkinSceneDObj:
	push ebp
	mov ebp, esp
	push esi
	push ebx
	sub esp, 0x10
	mov esi, [ebp+0x8]
	mov ebx, [ebp+0xc]
	mov eax, [ebx+0x2c]
	cmp eax, 0x3
	jbe R_SkinSceneDObj_10
R_SkinSceneDObj_30:
	add esp, 0x10
	pop ebx
	pop esi
	pop ebp
	ret
R_SkinSceneDObj_10:
	lea eax, [esi+0x2c]
	mov dword [esp+0x8], 0x2
	mov dword [esp+0x4], 0x3
	mov [esp], eax
	call InterlockedCompareExchange
	cmp eax, 0x2
	jz R_SkinSceneDObj_20
	mov ecx, [ebp+0x18]
	test ecx, ecx
	jz R_SkinSceneDObj_30
R_SkinSceneDObj_40:
	mov eax, [esi+0x2c]
	cmp eax, 0x3
	jz R_SkinSceneDObj_40
	add esp, 0x10
	pop ebx
	pop esi
	pop ebp
	ret
R_SkinSceneDObj_20:
	mov ecx, [ebp+0x14]
	mov edx, [ebp+0x10]
	mov eax, ebx
	call R_SkinSceneDObjModels
	add eax, 0x4
	mov [ebx+0x2c], eax
	jmp R_SkinSceneDObj_30


;R_SkinGfxEntityCmd(void*)
R_SkinGfxEntityCmd:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x3c
	mov eax, [ebp+0x8]
	mov esi, [eax]
	mov dword [esp+0xc], 0x0
	lea eax, [ebp-0x20]
	mov [esp+0x8], eax
	lea eax, [ebp-0x1c]
	mov [esp+0x4], eax
	mov [esp], esi
	call R_UpdateSceneEntBounds
	mov edi, eax
	test eax, eax
	jz R_SkinGfxEntityCmd_10
	mov eax, [ebp-0x20]
	mov [ebp-0x2c], eax
	mov ebx, [ebp-0x1c]
	mov eax, [ebx+0x2c]
	cmp eax, 0x3
	jbe R_SkinGfxEntityCmd_20
R_SkinGfxEntityCmd_10:
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_SkinGfxEntityCmd_20:
	lea eax, [esi+0x2c]
	mov dword [esp+0x8], 0x2
	mov dword [esp+0x4], 0x3
	mov [esp], eax
	call InterlockedCompareExchange
	cmp eax, 0x2
	jnz R_SkinGfxEntityCmd_10
	mov ecx, edi
	mov edx, [ebp-0x2c]
	mov eax, ebx
	call R_SkinSceneDObjModels
	add eax, 0x4
	mov [ebx+0x2c], eax
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


;Initialized global or static variables of r_dobj_skin:
SECTION .data


;Initialized constant data of r_dobj_skin:
SECTION .rdata


;Zero initialized global or static variables of r_dobj_skin:
SECTION .bss


;All cstrings:
SECTION .rdata



;All constant floats and doubles:
SECTION .rdata
_float_1_00000000:		dd 0x3f800000	; 1
_data16_80000000:		dd 0x80000000, 0x0, 0x0, 0x0	; OWORD

