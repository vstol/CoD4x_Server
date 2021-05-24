;Imports of r_dpvs_dynmodel:
	extern rgp
	extern DynEnt_GetClientModelPoseList

;Exports of r_dpvs_dynmodel:
	global R_AddCellDynModelSurfacesInFrustumCmd


SECTION .text


;R_AddCellDynModelSurfacesInFrustumCmd(void*)
R_AddCellDynModelSurfacesInFrustumCmd:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x2c
	mov ecx, [ebp+0x8]
	mov eax, rgp
	mov eax, [eax+0x20a0]
	lea ebx, [eax+0x2ac]
	mov eax, [eax+0x2ac]
	mov [ebp-0x28], eax
	movzx eax, byte [ecx+0x8]
	mov [ebp-0x24], eax
	mov edx, [ebp-0x28]
	imul edx, [ecx+0x4]
	mov eax, [ebx+0x10]
	lea edx, [eax+edx*4]
	mov [ebp-0x2c], edx
	movzx eax, word [ecx+0xa]
	mov eax, [ebx+eax*4+0x18]
	mov [ebp-0x34], eax
	mov ecx, [ecx]
	mov [ebp-0x1c], ecx
	call DynEnt_GetClientModelPoseList
	mov [ebp-0x30], eax
	mov ebx, [ebp-0x28]
	test ebx, ebx
	jz R_AddCellDynModelSurfacesInFrustumCmd_10
	mov dword [ebp-0x20], 0x0
R_AddCellDynModelSurfacesInFrustumCmd_160:
	mov edx, [ebp-0x20]
	mov ecx, [ebp-0x2c]
	mov edi, [ecx+edx*4]
R_AddCellDynModelSurfacesInFrustumCmd_70:
	test edi, 0xffff0000
	jnz R_AddCellDynModelSurfacesInFrustumCmd_20
R_AddCellDynModelSurfacesInFrustumCmd_110:
	mov ecx, 0x10
	mov esi, 0x10
	mov edx, edi
	shl edx, cl
	test edx, 0xff000000
	jnz R_AddCellDynModelSurfacesInFrustumCmd_30
R_AddCellDynModelSurfacesInFrustumCmd_120:
	mov ebx, 0x8
	mov eax, 0x8
	add esi, eax
	mov ecx, ebx
	shl edx, cl
	test edx, 0xf0000000
	jnz R_AddCellDynModelSurfacesInFrustumCmd_40
R_AddCellDynModelSurfacesInFrustumCmd_130:
	mov ebx, 0x4
	mov eax, 0x4
	add esi, eax
	mov ecx, ebx
	shl edx, cl
	test edx, 0xc0000000
	jnz R_AddCellDynModelSurfacesInFrustumCmd_50
R_AddCellDynModelSurfacesInFrustumCmd_140:
	mov ebx, 0x2
	mov eax, 0x2
	lea eax, [esi+eax]
	mov ecx, ebx
	shl edx, cl
	mov ecx, edx
	not ecx
	shr ecx, 0x1f
	add eax, ecx
	shl edx, cl
	not edx
	shr edx, 0x1f
	lea ecx, [eax+edx]
	cmp ecx, 0x1f
	ja R_AddCellDynModelSurfacesInFrustumCmd_60
R_AddCellDynModelSurfacesInFrustumCmd_150:
	mov eax, [ebp-0x20]
	shl eax, 0x5
	lea edx, [ecx+eax]
	mov eax, 0x80000000
	shr eax, cl
	not eax
	and edi, eax
	mov ebx, [ebp-0x34]
	add ebx, edx
	cmp byte [ebx], 0x0
	jnz R_AddCellDynModelSurfacesInFrustumCmd_70
	shl edx, 0x5
	mov eax, [ebp-0x30]
	add eax, edx
	movss xmm5, dword [eax+0x1c]
	lea edx, [eax+0x10]
	mov ecx, [ebp-0x24]
	test ecx, ecx
	jle R_AddCellDynModelSurfacesInFrustumCmd_80
	movss xmm6, dword [eax+0x10]
	movss xmm4, dword [edx+0x4]
	movss xmm3, dword [edx+0x8]
	movaps xmm0, xmm3
	mov edx, [ebp-0x1c]
	mulss xmm0, [edx+0x8]
	movaps xmm1, xmm4
	mulss xmm1, [edx+0x4]
	movaps xmm2, xmm6
	mulss xmm2, [edx]
	addss xmm1, xmm2
	addss xmm0, xmm1
	addss xmm0, [edx+0xc]
	addss xmm0, xmm5
	pxor xmm7, xmm7
	pxor xmm1, xmm1
	ucomiss xmm1, xmm0
	jae R_AddCellDynModelSurfacesInFrustumCmd_70
	mov ecx, edx
	add ecx, 0x14
	mov eax, edx
	mov edx, 0x1
	jmp R_AddCellDynModelSurfacesInFrustumCmd_90
R_AddCellDynModelSurfacesInFrustumCmd_100:
	movaps xmm0, xmm3
	mulss xmm0, [eax+0x8]
	movaps xmm1, xmm4
	mulss xmm1, [eax+0x4]
	movaps xmm2, xmm6
	mulss xmm2, [eax]
	addss xmm1, xmm2
	addss xmm0, xmm1
	addss xmm0, [ecx+0xc]
	addss xmm0, xmm5
	add edx, 0x1
	add ecx, 0x14
	ucomiss xmm7, xmm0
	jae R_AddCellDynModelSurfacesInFrustumCmd_70
R_AddCellDynModelSurfacesInFrustumCmd_90:
	add eax, 0x14
	cmp edx, [ebp-0x24]
	jnz R_AddCellDynModelSurfacesInFrustumCmd_100
R_AddCellDynModelSurfacesInFrustumCmd_80:
	mov byte [ebx], 0x1
	test edi, 0xffff0000
	jz R_AddCellDynModelSurfacesInFrustumCmd_110
R_AddCellDynModelSurfacesInFrustumCmd_20:
	xor ecx, ecx
	xor esi, esi
	mov edx, edi
	shl edx, cl
	test edx, 0xff000000
	jz R_AddCellDynModelSurfacesInFrustumCmd_120
R_AddCellDynModelSurfacesInFrustumCmd_30:
	xor ebx, ebx
	xor eax, eax
	add esi, eax
	mov ecx, ebx
	shl edx, cl
	test edx, 0xf0000000
	jz R_AddCellDynModelSurfacesInFrustumCmd_130
R_AddCellDynModelSurfacesInFrustumCmd_40:
	xor ebx, ebx
	xor eax, eax
	add esi, eax
	mov ecx, ebx
	shl edx, cl
	test edx, 0xc0000000
	jz R_AddCellDynModelSurfacesInFrustumCmd_140
R_AddCellDynModelSurfacesInFrustumCmd_50:
	xor ebx, ebx
	xor eax, eax
	lea eax, [esi+eax]
	mov ecx, ebx
	shl edx, cl
	mov ecx, edx
	not ecx
	shr ecx, 0x1f
	add eax, ecx
	shl edx, cl
	not edx
	shr edx, 0x1f
	lea ecx, [eax+edx]
	cmp ecx, 0x1f
	jbe R_AddCellDynModelSurfacesInFrustumCmd_150
R_AddCellDynModelSurfacesInFrustumCmd_60:
	add dword [ebp-0x20], 0x1
	mov eax, [ebp-0x20]
	cmp [ebp-0x28], eax
	jnz R_AddCellDynModelSurfacesInFrustumCmd_160
R_AddCellDynModelSurfacesInFrustumCmd_10:
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	add [eax], al


;Initialized global or static variables of r_dpvs_dynmodel:
SECTION .data


;Initialized constant data of r_dpvs_dynmodel:
SECTION .rdata


;Zero initialized global or static variables of r_dpvs_dynmodel:
SECTION .bss


;All cstrings:
SECTION .rdata



;All constant floats and doubles:
SECTION .rdata

