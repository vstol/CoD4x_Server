;Imports of huffman:
	extern ms_qsort
	extern Com_Memset

;Exports of huffman:
	global bloc
	global huffman_send
	global Huff_BuildFromData
	global Huff_offsetReceive
	global Huff_offsetTransmit
	global nodeCmp
	global Huff_Init


SECTION .text


;huffman_send(nodetype*, nodetype*, unsigned char*)
huffman_send:
huffman_send_20:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x1c
	mov ebx, [ebp+0x8]
	mov esi, [ebp+0xc]
	mov edi, [ebp+0x10]
	mov eax, [ebx+0x8]
	test eax, eax
	jz huffman_send_10
	mov [esp+0x8], edi
	mov [esp+0x4], ebx
	mov [esp], eax
	call huffman_send_20
huffman_send_10:
	test esi, esi
	jz huffman_send_30
	cmp esi, [ebx+0x4]
	jz huffman_send_40
	mov edx, [bloc]
	test dl, 0x7
	jz huffman_send_50
huffman_send_60:
	lea eax, [edx+0x1]
	mov [bloc], eax
huffman_send_30:
	add esp, 0x1c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
huffman_send_50:
	mov eax, edx
	sar eax, 0x3
	mov byte [edi+eax], 0x0
	jmp huffman_send_60
huffman_send_40:
	mov esi, [bloc]
	mov ebx, esi
	and ebx, 0x7
	jz huffman_send_70
	mov eax, esi
	sar eax, 0x3
	lea edx, [edi+eax]
huffman_send_80:
	mov eax, 0x1
	mov ecx, ebx
	shl eax, cl
	or [edx], al
	lea eax, [esi+0x1]
	mov [bloc], eax
	add esp, 0x1c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
huffman_send_70:
	mov eax, esi
	sar eax, 0x3
	lea edx, [edi+eax]
	mov byte [edx], 0x0
	jmp huffman_send_80
	nop


;Huff_BuildFromData(huff_t*, int const*)
Huff_BuildFromData:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x43c
	mov edi, [ebp+0x8]
	xor esi, esi
	mov edx, edi
	mov ebx, edi
	jmp Huff_BuildFromData_10
Huff_BuildFromData_20:
	mov edx, [ebp+0x8]
	mov ebx, [ebp+0x8]
Huff_BuildFromData_10:
	mov eax, [ebp+0xc]
	mov eax, [eax+esi*4]
	mov [ebp-0x42c], eax
	mov eax, [edx]
	lea ecx, [eax+eax*4]
	lea ecx, [edx+ecx*4+0x410]
	lea edx, [ecx+0x4]
	add eax, 0x1
	mov [ebx], eax
	mov [edx+0x10], esi
	mov eax, [ebp-0x42c]
	mov [edx+0xc], eax
	mov dword [ecx+0x4], 0x0
	mov dword [edx+0x4], 0x0
	mov dword [edx+0x8], 0x0
	mov [edi+0xc], edx
	mov [ebp+esi*4-0x418], edx
	add esi, 0x1
	add edi, 0x4
	cmp esi, 0x100
	jnz Huff_BuildFromData_20
	mov dword [esp+0xc], nodeCmp
	mov dword [esp+0x8], 0x4
	mov dword [esp+0x4], 0x100
	lea edx, [ebp-0x418]
	mov [esp], edx
	call ms_qsort
	mov eax, [ebx]
	lea ecx, [eax+eax*4]
	lea ecx, [ebx+ecx*4+0x410]
	lea edx, [ecx+0x4]
	add eax, 0x1
	mov [ebx], eax
	mov dword [edx+0x10], 0x101
	mov dword [edx+0xc], 0x1
	mov dword [ecx+0x4], 0x0
	mov dword [edx+0x4], 0x0
	mov dword [edx+0x8], 0x0
	mov [ebx+0x410], edx
	mov eax, [ebx+0x8]
	mov [ecx+0x4], eax
	mov ecx, [ebp-0x418]
	mov [edx+0x4], ecx
	mov [eax+0x8], edx
	mov [ecx+0x8], edx
	mov eax, [eax+0xc]
	add eax, [ecx+0xc]
	mov [edx+0xc], eax
	mov [ebp-0x418], edx
	xor edi, edi
	lea ebx, [ebp-0x418]
	add ebx, 0x4
	lea esi, [ebp-0x418]
	mov [ebp-0x430], esi
Huff_BuildFromData_30:
	mov dword [esp+0xc], nodeCmp
	mov dword [esp+0x8], 0x4
	mov eax, 0x100
	sub eax, edi
	mov [esp+0x4], eax
	mov eax, [ebp-0x430]
	mov [esp], eax
	call ms_qsort
	mov edx, [ebp+0x8]
	mov eax, [edx]
	lea ecx, [eax+eax*4]
	lea ecx, [edx+ecx*4+0x410]
	lea edx, [ecx+0x4]
	add eax, 0x1
	mov esi, [ebp+0x8]
	mov [esi], eax
	mov dword [edx+0x10], 0x101
	mov dword [edx+0xc], 0x1
	mov dword [ecx+0x4], 0x0
	mov dword [edx+0x4], 0x0
	mov dword [edx+0x8], 0x0
	mov [esi+0x410], edx
	mov eax, [ebx-0x4]
	mov [ecx+0x4], eax
	mov ecx, [ebx]
	mov [edx+0x4], ecx
	mov [eax+0x8], edx
	mov [ecx+0x8], edx
	mov eax, [eax+0xc]
	add eax, [ecx+0xc]
	mov [edx+0xc], eax
	mov [ebx], edx
	add edi, 0x1
	add dword [ebp-0x430], 0x4
	add ebx, 0x4
	cmp edi, 0xff
	jnz Huff_BuildFromData_30
	mov eax, [ebp-0x1c]
	mov [esi+0x8], eax
	add esp, 0x43c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


;Huff_offsetReceive(nodetype*, int*, unsigned char const*, int*)
Huff_offsetReceive:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	mov ebx, [ebp+0x8]
	mov esi, [ebp+0x10]
	mov edi, [ebp+0x14]
	mov edx, [edi]
	mov [bloc], edx
	test ebx, ebx
	jz Huff_offsetReceive_10
	mov eax, [ebx+0x10]
	cmp eax, 0x101
	jz Huff_offsetReceive_20
Huff_offsetReceive_70:
	mov edx, [ebp+0xc]
	mov [edx], eax
	mov eax, [bloc]
	mov [edi], eax
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
Huff_offsetReceive_50:
	mov ebx, [ebx+0x4]
Huff_offsetReceive_60:
	test ebx, ebx
	jz Huff_offsetReceive_30
	mov eax, [ebx+0x10]
	cmp eax, 0x101
	jnz Huff_offsetReceive_40
Huff_offsetReceive_20:
	mov eax, edx
	sar eax, 0x3
	movzx eax, byte [esi+eax]
	mov ecx, edx
	and ecx, 0x7
	sar eax, cl
	add edx, 0x1
	test al, 0x1
	jnz Huff_offsetReceive_50
	mov ebx, [ebx]
	jmp Huff_offsetReceive_60
Huff_offsetReceive_30:
	mov [bloc], edx
Huff_offsetReceive_10:
	mov eax, [ebp+0xc]
	mov dword [eax], 0x0
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
Huff_offsetReceive_40:
	mov [bloc], edx
	jmp Huff_offsetReceive_70


;Huff_offsetTransmit(huff_t*, int, unsigned char*, int*)
Huff_offsetTransmit:
	push ebp
	mov ebp, esp
	push ebx
	sub esp, 0x14
	mov ebx, [ebp+0x14]
	mov eax, [ebx]
	mov [bloc], eax
	mov eax, [ebp+0x10]
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x0
	mov edx, [ebp+0xc]
	mov eax, [ebp+0x8]
	mov eax, [eax+edx*4+0xc]
	mov [esp], eax
	call huffman_send
	mov eax, [bloc]
	mov [ebx], eax
	add esp, 0x14
	pop ebx
	pop ebp
	ret
	nop
	add [eax], al


;nodeCmp(void const*, void const*)
nodeCmp:
	push ebp
	mov ebp, esp
	mov eax, [ebp+0x8]
	mov ecx, [eax]
	mov eax, [ebp+0xc]
	mov edx, [eax]
	mov eax, [ecx+0xc]
	sub eax, [edx+0xc]
	pop ebp
	ret
	nop


;Huff_Init(huffman_t*)
Huff_Init:
	push ebp
	mov ebp, esp
	push ebx
	sub esp, 0x14
	mov ebx, [ebp+0x8]
	mov dword [esp+0x8], 0x4c14
	mov dword [esp+0x4], 0x0
	mov [esp], ebx
	call Com_Memset
	mov eax, [ebx]
	lea edx, [eax+eax*4]
	lea edx, [ebx+edx*4+0x414]
	mov [ebx+0x40c], edx
	add eax, 0x1
	mov [ebx], eax
	mov [ebx+0x8], edx
	mov dword [edx+0x10], 0x100
	mov eax, [ebx+0x8]
	mov dword [eax+0xc], 0x0
	mov eax, [ebx+0x8]
	mov dword [eax+0x8], 0x0
	mov eax, [ebx+0x8]
	mov dword [eax], 0x0
	mov eax, [ebx+0x8]
	mov dword [eax+0x4], 0x0
	add esp, 0x14
	pop ebx
	pop ebp
	ret
	add [eax], al


;Initialized global or static variables of huffman:
SECTION .data


;Initialized constant data of huffman:
SECTION .rdata


;Zero initialized global or static variables of huffman:
SECTION .bss
bloc: resb 0x80


;All cstrings:
SECTION .rdata



;All constant floats and doubles:
SECTION .rdata

