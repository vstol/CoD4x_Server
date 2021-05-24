;Imports of r_cmdbuf:
	extern dx_ctx

;Exports of r_cmdbuf:
	global R_InitContext


SECTION .text


;R_InitContext(GfxBackEndData const*, GfxCmdBuf*)
R_InitContext:
	push ebp
	mov ebp, esp
	mov eax, dx_ctx
	mov edx, [eax+0x8]
	mov eax, [ebp+0xc]
	mov [eax], edx
	pop ebp
	ret
	add [eax], al


;Initialized global or static variables of r_cmdbuf:
SECTION .data


;Initialized constant data of r_cmdbuf:
SECTION .rdata


;Zero initialized global or static variables of r_cmdbuf:
SECTION .bss


;All cstrings:
SECTION .rdata



;All constant floats and doubles:
SECTION .rdata

