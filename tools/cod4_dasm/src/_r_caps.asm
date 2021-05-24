;Imports of r_caps:
	extern Com_Printf
	extern Com_Error
	extern Com_PrintWarning

;Exports of r_caps:
	global s_capsCheckInt
	global s_capsCheckBits
	global R_CheckDxCaps


SECTION .text


;R_CheckDxCaps(_D3DCAPS9 const*)
R_CheckDxCaps:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x2c
	mov dword [ebp-0x24], 0x3
	mov esi, s_capsCheckBits
	jmp R_CheckDxCaps_10
R_CheckDxCaps_80:
	cmp ebx, 0x3
	jz R_CheckDxCaps_20
R_CheckDxCaps_50:
	add esi, 0x14
	cmp esi, s_capsCheckBits+0x294
	jz R_CheckDxCaps_30
R_CheckDxCaps_10:
	mov eax, [esi]
	mov edx, [ebp+0x8]
	mov ecx, [eax+edx]
	mov edx, [esi+0x8]
	test edx, edx
	jz R_CheckDxCaps_40
	mov eax, ecx
	not eax
	test eax, edx
	jz R_CheckDxCaps_50
R_CheckDxCaps_40:
	mov eax, [esi+0x4]
	test eax, eax
	jz R_CheckDxCaps_60
	test eax, ecx
	jz R_CheckDxCaps_50
R_CheckDxCaps_60:
	mov edi, [esi+0x10]
	mov ebx, [esi+0xc]
	cmp ebx, 0x1
	jz R_CheckDxCaps_70
	mov edx, Com_Printf
	mov [ebp-0x20], edx
R_CheckDxCaps_160:
	mov [esp+0x8], edi
	mov dword [esp+0x4], _cstring_video_card_or_dr
	mov dword [esp], 0x8
	call dword [ebp-0x20]
	test ebx, ebx
	jnz R_CheckDxCaps_80
	mov [esp+0x8], edi
	mov dword [esp+0x4], _cstring_video_card_or_dr
	mov dword [esp], 0x1
	call Com_Error
	add esi, 0x14
	cmp esi, s_capsCheckBits+0x294
	jnz R_CheckDxCaps_10
R_CheckDxCaps_30:
	mov esi, s_capsCheckInt
	jmp R_CheckDxCaps_90
R_CheckDxCaps_150:
	cmp ebx, 0x3
	jz R_CheckDxCaps_100
R_CheckDxCaps_130:
	add esi, 0x14
	mov eax, s_capsCheckInt+0xc8
	cmp eax, esi
	jz R_CheckDxCaps_110
R_CheckDxCaps_90:
	mov eax, [esi]
	mov edx, [ebp+0x8]
	mov eax, [eax+edx]
	cmp eax, [esi+0x4]
	jb R_CheckDxCaps_120
	cmp eax, [esi+0x8]
	jbe R_CheckDxCaps_130
R_CheckDxCaps_120:
	mov edi, [esi+0x10]
	mov ebx, [esi+0xc]
	cmp ebx, 0x1
	jz R_CheckDxCaps_140
	mov edx, Com_Printf
	mov [ebp-0x1c], edx
R_CheckDxCaps_170:
	mov [esp+0x8], edi
	mov dword [esp+0x4], _cstring_video_card_or_dr
	mov dword [esp], 0x8
	call dword [ebp-0x1c]
	test ebx, ebx
	jnz R_CheckDxCaps_150
	mov [esp+0x8], edi
	mov dword [esp+0x4], _cstring_video_card_or_dr
	mov dword [esp], 0x1
	call Com_Error
	add esi, 0x14
	mov eax, s_capsCheckInt+0xc8
	cmp eax, esi
	jnz R_CheckDxCaps_90
R_CheckDxCaps_110:
	mov eax, [ebp-0x24]
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_CheckDxCaps_70:
	mov eax, Com_PrintWarning
	mov [ebp-0x20], eax
	jmp R_CheckDxCaps_160
R_CheckDxCaps_20:
	and dword [ebp-0x24], 0xfffffffd
	mov dword [esp+0x4], _cstring___shader_model_3
	mov dword [esp], 0x8
	call dword [ebp-0x20]
	jmp R_CheckDxCaps_50
R_CheckDxCaps_140:
	mov eax, Com_PrintWarning
	mov [ebp-0x1c], eax
	jmp R_CheckDxCaps_170
R_CheckDxCaps_100:
	and dword [ebp-0x24], 0xfffffffd
	mov dword [esp+0x4], _cstring___shader_model_3
	mov dword [esp], 0x8
	call dword [ebp-0x1c]
	jmp R_CheckDxCaps_130
	add [eax], al


;Initialized global or static variables of r_caps:
SECTION .data


;Initialized constant data of r_caps:
SECTION .rdata
s_capsCheckInt: dd 0x58, 0x800, 0xffffffff, 0x0, _cstring_doesnt_support_l, 0x5c, 0x800, 0xffffffff, 0x0, _cstring_doesnt_support_l, 0x60, 0x100, 0xffffffff, 0x0, _cstring_doesnt_support_l1, 0x94, 0x8, 0xffffffff, 0x0, _cstring_doesnt_support_e, 0x98, 0x8, 0xffffffff, 0x0, _cstring_doesnt_support_e1, 0xbc, 0x1, 0xffffffff, 0x0, _cstring_is_not_a_directx, 0xc4, 0xfffe0200, 0xfffeffff, 0x0, _cstring_doesnt_support_v, 0xcc, 0xffff0200, 0xffffffff, 0x0, _cstring_doesnt_support_p, 0xc4, 0xfffe0300, 0xfffeffff, 0x3, _cstring_doesnt_support_v1, 0xcc, 0xffff0300, 0xffffffff, 0x3, _cstring_doesnt_support_p1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
s_capsCheckBits: dd 0xc, 0x0, 0x20000000, 0x0, _cstring_doesnt_support_d, 0xc, 0x0, 0x20000, 0x1, _cstring_doesnt_support_f, 0x10, 0x0, 0x20, 0x0, _cstring_doesnt_support_a, 0x10, 0x0, 0x100, 0x1, _cstring_doesnt_accelerat, 0x14, 0x0, 0x80000000, 0x1, _cstring_doesnt_support_i, 0x14, 0x0, 0x1, 0x1, _cstring_doesnt_support_v2, 0x1c, 0x0, 0x8000, 0x0, _cstring_is_not_at_least_, 0x1c, 0x0, 0x10400, 0x1, _cstring_doesnt_accelerat1, 0x1c, 0x0, 0x80000, 0x1, _cstring_doesnt_accelerat2, 0x20, 0x0, 0x2, 0x0, _cstring_cant_disable_dep, 0x20, 0x0, 0x80, 0x0, _cstring_cant_disable_ind, 0x20, 0x0, 0x800, 0x0, _cstring_doesnt_support_f1, 0x20, 0x0, 0x20000, 0x0, _cstring_doesnt_support_s, 0x20, 0x0, 0x70, 0x0, _cstring_doesnt_support_a1, 0x24, 0x0, 0x2000000, 0x2, _cstring_doesnt_support_h, 0x28, 0x0, 0x8d, 0x0, _cstring_doesnt_support_t, 0x2c, 0x0, 0x3ff, 0x0, _cstring_doesnt_support_t1, 0x30, 0x0, 0x3ff, 0x0, _cstring_doesnt_support_t2, 0x34, 0x0, 0xd2, 0x0, _cstring_doesnt_support_t3, 0x3c, 0x0, 0x4, 0x0, _cstring_doesnt_support_a2, 0x3c, 0x0, 0x800, 0x0, _cstring_doesnt_support_c, 0x3c, 0x0, 0x4000, 0x0, _cstring_doesnt_support_m, 0x3c, 0x2, 0x100, 0x0, _cstring_doesnt_support_r, 0x3c, 0x0, 0x1, 0x1, _cstring_doesnt_support_p2, 0x3c, 0x20, 0x0, 0x0, _cstring_doesnt_support_n, 0x40, 0x0, 0x3030300, 0x0, _cstring_doesnt_support_t4, 0x44, 0x0, 0x3000300, 0x0, _cstring_doesnt_support_t5, 0x4c, 0x0, 0x4, 0x0, _cstring_doesnt_support_t6, 0x4c, 0x0, 0x1, 0x0, _cstring_doesnt_support_t7, 0x88, 0x0, 0x1ff, 0x2, _cstring_doesnt_support_t8, 0xd4, 0x0, 0x1, 0x0, _cstring_doesnt_support_v3, 0xf4, 0x0, 0x200, 0x1, _cstring_doesnt_support_l2, 0xec, 0x0, 0x1, 0x0, _cstring_doesnt_support_u, 0x0, 0x0, 0x0


;Zero initialized global or static variables of r_caps:
SECTION .bss


;All cstrings:
SECTION .rdata
_cstring_video_card_or_dr:		db "Video card or driver %s.",0ah,0
_cstring___shader_model_3:		db "  Shader model 3.0 rendering path will not be available.",0ah,0
_cstring_doesnt_support_l:		db "doesn",27h,"t support large enough 2D textures",0
_cstring_doesnt_support_l1:		db "doesn",27h,"t support large enough 3D textures",0
_cstring_doesnt_support_e:		db "doesn",27h,"t support enough texture coordinates for the DirectX 9 code path",0
_cstring_doesnt_support_e1:		db "doesn",27h,"t support enough textures for the DirectX 9 code path",0
_cstring_is_not_a_directx:		db "is not a DirectX 9 driver",0
_cstring_doesnt_support_v:		db "doesn",27h,"t support vertex shader 2.0 or better",0
_cstring_doesnt_support_p:		db "doesn",27h,"t support pixel shader 2.0 or better",0
_cstring_doesnt_support_v1:		db "doesn",27h,"t support vertex shader 3.0 or better",0
_cstring_doesnt_support_p1:		db "doesn",27h,"t support pixel shader 3.0 or better",0
_cstring_doesnt_support_d:		db "doesn",27h,"t support dynamic textures",0
_cstring_doesnt_support_f:		db "doesn",27h,"t support fullscreen gamma",0
_cstring_doesnt_support_a:		db "doesn",27h,"t support alpha blending",0
_cstring_doesnt_accelerat:		db "doesn",27h,"t accelerate dynamic textures",0
_cstring_doesnt_support_i:		db "doesn",27h,"t support immediate frame buffer swapping",0
_cstring_doesnt_support_v2:		db "doesn",27h,"t support vertical sync",0
_cstring_is_not_at_least_:		db "is not at least DirectX 7 compliant",0
_cstring_doesnt_accelerat1:		db "doesn",27h,"t accelerate transform and lighting",0
_cstring_doesnt_accelerat2:		db "doesn",27h,"t accelerate rasterization",0
_cstring_cant_disable_dep:		db "can",27h,"t disable depth buffer writes",0
_cstring_cant_disable_ind:		db "can",27h,"t disable individual color channel writes",0
_cstring_doesnt_support_f1:		db "doesn",27h,"t support frame buffer blending ops beside add",0
_cstring_doesnt_support_s:		db "doesn",27h,"t support separate alpha blend, glow will be disabled",0
_cstring_doesnt_support_a1:		db "doesn",27h,"t support all face culling modes",0
_cstring_doesnt_support_h:		db "doesn",27h,"t support high-quality polygon offset",0
_cstring_doesnt_support_t:		db "doesn",27h,"t support the required depth comparison modes",0
_cstring_doesnt_support_t1:		db "doesn",27h,"t support the required frame buffer source blend modes",0
_cstring_doesnt_support_t2:		db "doesn",27h,"t support the required frame buffer destination blend modes",0
_cstring_doesnt_support_t3:		db "doesn",27h,"t support the required alpha comparison modes",0
_cstring_doesnt_support_a2:		db "doesn",27h,"t support alpha in textures",0
_cstring_doesnt_support_c:		db "doesn",27h,"t support cubemap textures",0
_cstring_doesnt_support_m:		db "doesn",27h,"t support mipmapped textures",0
_cstring_doesnt_support_r:		db "doesn",27h,"t support restricted use of non-power-of-2 textures",0
_cstring_doesnt_support_p2:		db "doesn",27h,"t support perspective correct texturing",0
_cstring_doesnt_support_n:		db "doesn",27h,"t support non-square textures",0
_cstring_doesnt_support_t4:		db "doesn",27h,"t support the required texture filtering modes",0
_cstring_doesnt_support_t5:		db "doesn",27h,"t support the required cubemap texture filtering modes",0
_cstring_doesnt_support_t6:		db "doesn",27h,"t support texture clamping",0
_cstring_doesnt_support_t7:		db "doesn",27h,"t support texture wrapping",0
_cstring_doesnt_support_t8:		db "doesn",27h,"t support the required stencil operations",0
_cstring_doesnt_support_v3:		db "doesn",27h,"t support vertex stream offsets",0
_cstring_doesnt_support_l2:		db "doesn",27h,"t support linear filtering when copying and shrinking the frame buffer",0
_cstring_doesnt_support_u:		db "doesn",27h,"t support UBYTE4N vertex data",0



;All constant floats and doubles:
SECTION .rdata

