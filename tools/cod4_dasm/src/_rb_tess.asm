;Imports of rb_tess:
	extern XSurfaceGetNumTris
	extern XSurfaceGetNumVerts
	extern R_SetIndexData
	extern gfxBuf
	extern R_SetVertexData
	extern R_DrawIndexedPrimitive
	extern DB_GetIndexBufferAndBase
	extern _ZN14MacOpenGLUtils13SetBufferHintEj
	extern _ZN14MacOpenGLUtils16ClearBufferHintsEv
	extern R_SetupPassPixelShaderArgs
	extern R_ChangeDepthHackNearClip
	extern R_UpdateVertexDecl
	extern R_ChangeDepthRange
	extern R_SetupPassPerObjectArgs
	extern R_ChangeObjectPlacement
	extern R_SetStreamsForBspSurface
	extern R_SetupPassPerPrimArgs
	extern rgp
	extern R_SetLightmap
	extern R_SetReflectionProbe
	extern sc_enable
	extern gfxRenderTargets
	extern rg
	extern R_SetMeshStream
	extern R_SetStaticModelLightingCoordsForSource
	extern R_SetModelLightingCoordsForSource
	extern R_DrawBspDrawSurfs
	extern R_DrawBspDrawSurfsLit
	extern VecNCompareCustomEpsilon
	extern Vec3RotateTranspose
	extern R_DrawBspDrawSurfsPreTess
	extern R_DrawBspDrawSurfsLitPreTess
	extern R_DrawStaticModelCachedSurf
	extern R_DrawStaticModelCachedSurfLit
	extern R_DrawStaticModelPreTessSurf
	extern R_DrawStaticModelPreTessSurfLit
	extern s_manualObjectPlacement
	extern R_UpdateMaterialTime
	extern R_DrawXModelRigidSurfLit
	extern R_DrawXModelRigidSurfCamera
	extern R_DrawXModelRigidSurf
	extern R_SetupPassVertexShaderArgs
	extern R_DrawStaticModelSurf
	extern strstr
	extern glIsEnabled
	extern glGetFloatv
	extern glEnable
	extern glPolygonOffset
	extern R_DrawStaticModelSurfLit
	extern glDisable
	extern R_DrawStaticModelSkinnedSurf
	extern R_DrawStaticModelSkinnedSurfLit

;Exports of rb_tess:
	global _GLOBAL__I__Z18R_TessCodeMeshListPK19GfxDrawSurfListArgs16GfxCmdBufContext
	global R_DrawXModelSkinnedUncached
	global _ZZ34R_TessStaticModelRigidDrawSurfListPK19GfxDrawSurfListArgs16GfxCmdBufContextE15sTreeTrunkUnits
	global _ZZ34R_TessStaticModelRigidDrawSurfListPK19GfxDrawSurfListArgs16GfxCmdBufContextE16sTreeTrunkFactor
	global R_DrawXModelSkinnedCached
	global R_TessBModel
	global R_TessCodeMeshList
	global R_TessMarkMeshList
	global R_TessTrianglesList
	global R_TessParticleCloudList
	global R_TessTrianglesPreTessList
	global R_TessStaticModelCachedList
	global R_TessStaticModelPreTessList
	global R_TessXModelRigidDrawSurfList
	global R_TessXModelSkinnedDrawSurfList
	global R_TessStaticModelRigidDrawSurfList
	global R_TessStaticModelSkinnedDrawSurfList
	global R_TessXModelRigidSkinnedDrawSurfList


SECTION .text


;global constructors keyed to R_TessCodeMeshList(GfxDrawSurfListArgs const*, GfxCmdBufContext)
_GLOBAL__I__Z18R_TessCodeMeshListPK19GfxDrawSurfListArgs16GfxCmdBufContext:
	push ebp
	mov ebp, esp
	mov edx, 0xffff
	mov eax, 0x1
	pop ebp
	jmp __static_initialization_and_destruction_0


;__static_initialization_and_destruction_0(int, int)
__static_initialization_and_destruction_0:
	push ebp
	mov ebp, esp
	cmp edx, 0xffff
	jz __static_initialization_and_destruction_0_10
__static_initialization_and_destruction_0_20:
	pop ebp
	ret
__static_initialization_and_destruction_0_10:
	sub eax, 0x1
	jnz __static_initialization_and_destruction_0_20
	mov eax, [g_fltMin__uint4]
	mov [g_fltMin], eax
	mov eax, [g_fltMin__uint4+0x4]
	mov [g_fltMin+0x4], eax
	mov eax, [g_fltMin__uint4+0x8]
	mov [g_fltMin+0x8], eax
	mov eax, [g_fltMin__uint4+0xc]
	mov [g_fltMin+0xc], eax
	mov eax, [g_negativeZero__uint4]
	mov [g_negativeZero], eax
	mov eax, [g_negativeZero__uint4+0x4]
	mov [g_negativeZero+0x4], eax
	mov eax, [g_negativeZero__uint4+0x8]
	mov [g_negativeZero+0x8], eax
	mov eax, [g_negativeZero__uint4+0xc]
	mov [g_negativeZero+0xc], eax
	mov eax, [g_inc__uint4]
	mov [g_inc], eax
	mov eax, [g_inc__uint4+0x4]
	mov [g_inc+0x4], eax
	mov eax, [g_inc__uint4+0x8]
	mov [g_inc+0x8], eax
	mov eax, [g_inc__uint4+0xc]
	mov [g_inc+0xc], eax
	mov eax, [g_swizzleXYZW__uint4]
	mov [g_swizzleXYZW], eax
	mov eax, [g_swizzleXYZW__uint4+0x4]
	mov [g_swizzleXYZW+0x4], eax
	mov eax, [g_swizzleXYZW__uint4+0x8]
	mov [g_swizzleXYZW+0x8], eax
	mov eax, [g_swizzleXYZW__uint4+0xc]
	mov [g_swizzleXYZW+0xc], eax
	mov eax, [g_swizzleYXZW__uint4]
	mov [g_swizzleYXZW], eax
	mov eax, [g_swizzleYXZW__uint4+0x4]
	mov [g_swizzleYXZW+0x4], eax
	mov eax, [g_swizzleYXZW__uint4+0x8]
	mov [g_swizzleYXZW+0x8], eax
	mov eax, [g_swizzleYXZW__uint4+0xc]
	mov [g_swizzleYXZW+0xc], eax
	mov eax, [g_swizzleXZYW__uint4]
	mov [g_swizzleXZYW], eax
	mov eax, [g_swizzleXZYW__uint4+0x4]
	mov [g_swizzleXZYW+0x4], eax
	mov eax, [g_swizzleXZYW__uint4+0x8]
	mov [g_swizzleXZYW+0x8], eax
	mov eax, [g_swizzleXZYW__uint4+0xc]
	mov [g_swizzleXZYW+0xc], eax
	mov eax, [g_swizzleYXWZ__uint4]
	mov [g_swizzleYXWZ], eax
	mov eax, [g_swizzleYXWZ__uint4+0x4]
	mov [g_swizzleYXWZ+0x4], eax
	mov eax, [g_swizzleYXWZ__uint4+0x8]
	mov [g_swizzleYXWZ+0x8], eax
	mov eax, [g_swizzleYXWZ__uint4+0xc]
	mov [g_swizzleYXWZ+0xc], eax
	mov eax, [g_swizzleXAZC__uint4]
	mov [g_swizzleXAZC], eax
	mov eax, [g_swizzleXAZC__uint4+0x4]
	mov [g_swizzleXAZC+0x4], eax
	mov eax, [g_swizzleXAZC__uint4+0x8]
	mov [g_swizzleXAZC+0x8], eax
	mov eax, [g_swizzleXAZC__uint4+0xc]
	mov [g_swizzleXAZC+0xc], eax
	mov eax, [g_swizzleYBWD__uint4]
	mov [g_swizzleYBWD], eax
	mov eax, [g_swizzleYBWD__uint4+0x4]
	mov [g_swizzleYBWD+0x4], eax
	mov eax, [g_swizzleYBWD__uint4+0x8]
	mov [g_swizzleYBWD+0x8], eax
	mov eax, [g_swizzleYBWD__uint4+0xc]
	mov [g_swizzleYBWD+0xc], eax
	mov eax, [g_swizzleXYAB__uint4]
	mov [g_swizzleXYAB], eax
	mov eax, [g_swizzleXYAB__uint4+0x4]
	mov [g_swizzleXYAB+0x4], eax
	mov eax, [g_swizzleXYAB__uint4+0x8]
	mov [g_swizzleXYAB+0x8], eax
	mov eax, [g_swizzleXYAB__uint4+0xc]
	mov [g_swizzleXYAB+0xc], eax
	mov eax, [g_swizzleZWCD__uint4]
	mov [g_swizzleZWCD], eax
	mov eax, [g_swizzleZWCD__uint4+0x4]
	mov [g_swizzleZWCD+0x4], eax
	mov eax, [g_swizzleZWCD__uint4+0x8]
	mov [g_swizzleZWCD+0x8], eax
	mov eax, [g_swizzleZWCD__uint4+0xc]
	mov [g_swizzleZWCD+0xc], eax
	mov eax, [g_swizzleXYZA__uint4]
	mov [g_swizzleXYZA], eax
	mov eax, [g_swizzleXYZA__uint4+0x4]
	mov [g_swizzleXYZA+0x4], eax
	mov eax, [g_swizzleXYZA__uint4+0x8]
	mov [g_swizzleXYZA+0x8], eax
	mov eax, [g_swizzleXYZA__uint4+0xc]
	mov [g_swizzleXYZA+0xc], eax
	mov eax, [g_swizzleYZXW__uint4]
	mov [g_swizzleYZXW], eax
	mov eax, [g_swizzleYZXW__uint4+0x4]
	mov [g_swizzleYZXW+0x4], eax
	mov eax, [g_swizzleYZXW__uint4+0x8]
	mov [g_swizzleYZXW+0x8], eax
	mov eax, [g_swizzleYZXW__uint4+0xc]
	mov [g_swizzleYZXW+0xc], eax
	mov eax, [g_swizzleZXYW__uint4]
	mov [g_swizzleZXYW], eax
	mov eax, [g_swizzleZXYW__uint4+0x4]
	mov [g_swizzleZXYW+0x4], eax
	mov eax, [g_swizzleZXYW__uint4+0x8]
	mov [g_swizzleZXYW+0x8], eax
	mov eax, [g_swizzleZXYW__uint4+0xc]
	mov [g_swizzleZXYW+0xc], eax
	mov eax, [g_swizzleWABW__uint4]
	mov [g_swizzleWABW], eax
	mov eax, [g_swizzleWABW__uint4+0x4]
	mov [g_swizzleWABW+0x4], eax
	mov eax, [g_swizzleWABW__uint4+0x8]
	mov [g_swizzleWABW+0x8], eax
	mov eax, [g_swizzleWABW__uint4+0xc]
	mov [g_swizzleWABW+0xc], eax
	mov eax, [g_swizzleZWAW__uint4]
	mov [g_swizzleZWAW], eax
	mov eax, [g_swizzleZWAW__uint4+0x4]
	mov [g_swizzleZWAW+0x4], eax
	mov eax, [g_swizzleZWAW__uint4+0x8]
	mov [g_swizzleZWAW+0x8], eax
	mov eax, [g_swizzleZWAW__uint4+0xc]
	mov [g_swizzleZWAW+0xc], eax
	mov eax, [g_swizzleYZWA__uint4]
	mov [g_swizzleYZWA], eax
	mov eax, [g_swizzleYZWA__uint4+0x4]
	mov [g_swizzleYZWA+0x4], eax
	mov eax, [g_swizzleYZWA__uint4+0x8]
	mov [g_swizzleYZWA+0x8], eax
	mov eax, [g_swizzleYZWA__uint4+0xc]
	mov [g_swizzleYZWA+0xc], eax
	mov eax, [g_swizzleXXXX__uint4]
	mov [g_swizzleXXXX], eax
	mov eax, [g_swizzleXXXX__uint4+0x4]
	mov [g_swizzleXXXX+0x4], eax
	mov eax, [g_swizzleXXXX__uint4+0x8]
	mov [g_swizzleXXXX+0x8], eax
	mov eax, [g_swizzleXXXX__uint4+0xc]
	mov [g_swizzleXXXX+0xc], eax
	mov eax, [g_swizzleYYYY__uint4]
	mov [g_swizzleYYYY], eax
	mov eax, [g_swizzleYYYY__uint4+0x4]
	mov [g_swizzleYYYY+0x4], eax
	mov eax, [g_swizzleYYYY__uint4+0x8]
	mov [g_swizzleYYYY+0x8], eax
	mov eax, [g_swizzleYYYY__uint4+0xc]
	mov [g_swizzleYYYY+0xc], eax
	mov eax, [g_swizzleZZZZ__uint4]
	mov [g_swizzleZZZZ], eax
	mov eax, [g_swizzleZZZZ__uint4+0x4]
	mov [g_swizzleZZZZ+0x4], eax
	mov eax, [g_swizzleZZZZ__uint4+0x8]
	mov [g_swizzleZZZZ+0x8], eax
	mov eax, [g_swizzleZZZZ__uint4+0xc]
	mov [g_swizzleZZZZ+0xc], eax
	mov eax, [g_swizzleWWWW__uint4]
	mov [g_swizzleWWWW], eax
	mov eax, [g_swizzleWWWW__uint4+0x4]
	mov [g_swizzleWWWW+0x4], eax
	mov eax, [g_swizzleWWWW__uint4+0x8]
	mov [g_swizzleWWWW+0x8], eax
	mov eax, [g_swizzleWWWW__uint4+0xc]
	mov [g_swizzleWWWW+0xc], eax
	mov eax, [g_selectX__uint4]
	mov [g_selectX], eax
	mov eax, [g_selectX__uint4+0x4]
	mov [g_selectX+0x4], eax
	mov eax, [g_selectX__uint4+0x8]
	mov [g_selectX+0x8], eax
	mov eax, [g_selectX__uint4+0xc]
	mov [g_selectX+0xc], eax
	mov eax, [g_selectY__uint4]
	mov [g_selectY], eax
	mov eax, [g_selectY__uint4+0x4]
	mov [g_selectY+0x4], eax
	mov eax, [g_selectY__uint4+0x8]
	mov [g_selectY+0x8], eax
	mov eax, [g_selectY__uint4+0xc]
	mov [g_selectY+0xc], eax
	mov eax, [g_selectZ__uint4]
	mov [g_selectZ], eax
	mov eax, [g_selectZ__uint4+0x4]
	mov [g_selectZ+0x4], eax
	mov eax, [g_selectZ__uint4+0x8]
	mov [g_selectZ+0x8], eax
	mov eax, [g_selectZ__uint4+0xc]
	mov [g_selectZ+0xc], eax
	mov eax, [g_selectW__uint4]
	mov [g_selectW], eax
	mov eax, [g_selectW__uint4+0x4]
	mov [g_selectW+0x4], eax
	mov eax, [g_selectW__uint4+0x8]
	mov [g_selectW+0x8], eax
	mov eax, [g_selectW__uint4+0xc]
	mov [g_selectW+0xc], eax
	mov eax, [g_keepYZW__uint4]
	mov [g_keepYZW], eax
	mov eax, [g_keepYZW__uint4+0x4]
	mov [g_keepYZW+0x4], eax
	mov eax, [g_keepYZW__uint4+0x8]
	mov [g_keepYZW+0x8], eax
	mov eax, [g_keepYZW__uint4+0xc]
	mov [g_keepYZW+0xc], eax
	mov eax, [g_keepXZW__uint4]
	mov [g_keepXZW], eax
	mov eax, [g_keepXZW__uint4+0x4]
	mov [g_keepXZW+0x4], eax
	mov eax, [g_keepXZW__uint4+0x8]
	mov [g_keepXZW+0x8], eax
	mov eax, [g_keepXZW__uint4+0xc]
	mov [g_keepXZW+0xc], eax
	mov eax, [g_keepXYW__uint4]
	mov [g_keepXYW], eax
	mov eax, [g_keepXYW__uint4+0x4]
	mov [g_keepXYW+0x4], eax
	mov eax, [g_keepXYW__uint4+0x8]
	mov [g_keepXYW+0x8], eax
	mov eax, [g_keepXYW__uint4+0xc]
	mov [g_keepXYW+0xc], eax
	mov eax, [g_keepXYZ__uint4]
	mov [g_keepXYZ], eax
	mov eax, [g_keepXYZ__uint4+0x4]
	mov [g_keepXYZ+0x4], eax
	mov eax, [g_keepXYZ__uint4+0x8]
	mov [g_keepXYZ+0x8], eax
	mov eax, [g_keepXYZ__uint4+0xc]
	mov [g_keepXYZ+0xc], eax
	mov eax, [g_keepXY__uint4]
	mov [g_keepXY], eax
	mov eax, [g_keepXY__uint4+0x4]
	mov [g_keepXY+0x4], eax
	mov eax, [g_keepXY__uint4+0x8]
	mov [g_keepXY+0x8], eax
	mov eax, [g_keepXY__uint4+0xc]
	mov [g_keepXY+0xc], eax
	mov eax, [g_keepZW__uint4]
	mov [g_keepZW], eax
	mov eax, [g_keepZW__uint4+0x4]
	mov [g_keepZW+0x4], eax
	mov eax, [g_keepZW__uint4+0x8]
	mov [g_keepZW+0x8], eax
	mov eax, [g_keepZW__uint4+0xc]
	mov [g_keepZW+0xc], eax
	mov eax, [g_keepX__uint4]
	mov [g_keepX], eax
	mov eax, [g_keepX__uint4+0x4]
	mov [g_keepX+0x4], eax
	mov eax, [g_keepX__uint4+0x8]
	mov [g_keepX+0x8], eax
	mov eax, [g_keepX__uint4+0xc]
	mov [g_keepX+0xc], eax
	mov eax, [g_keepZ__uint4]
	mov [g_keepZ], eax
	mov eax, [g_keepZ__uint4+0x4]
	mov [g_keepZ+0x4], eax
	mov eax, [g_keepZ__uint4+0x8]
	mov [g_keepZ+0x8], eax
	mov eax, [g_keepZ__uint4+0xc]
	mov [g_keepZ+0xc], eax
	pop ebp
	ret


;R_DrawXModelSkinnedUncached(GfxCmdBufContext, XSurface*, GfxPackedVertex*)
R_DrawXModelSkinnedUncached:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x4c
	mov [ebp-0x30], eax
	mov [ebp-0x2c], edx
	mov ebx, ecx
	mov esi, [ebp-0x2c]
	mov [esp], ecx
	call XSurfaceGetNumTris
	mov [ebp-0x20], eax
	mov [esp], ebx
	call XSurfaceGetNumVerts
	mov [ebp-0x24], eax
	add esi, 0x90
	mov eax, [ebp-0x20]
	mov [esp+0x8], eax
	mov eax, [ebx+0xc]
	mov [esp+0x4], eax
	mov [esp], esi
	call R_SetIndexData
	mov [ebp-0x1c], eax
	mov edi, gfxBuf
	mov ebx, [edi+0x70]
	mov edx, [ebx]
	mov ecx, [ebp-0x24]
	mov eax, ecx
	shl eax, 0x5
	add eax, edx
	cmp eax, [ebx+0x4]
	jle R_DrawXModelSkinnedUncached_10
	mov dword [ebx], 0x0
	mov ecx, [ebp-0x24]
R_DrawXModelSkinnedUncached_10:
	mov dword [esp+0xc], 0x20
	mov [esp+0x8], ecx
	mov eax, [ebp+0x8]
	mov [esp+0x4], eax
	mov eax, [ebp-0x2c]
	mov [esp], eax
	call R_SetVertexData
	mov ebx, eax
	mov eax, [edi+0x70]
	mov ecx, [eax+0x8]
	cmp ecx, [esi+0x10]
	jz R_DrawXModelSkinnedUncached_20
R_DrawXModelSkinnedUncached_40:
	mov [esi+0x10], ecx
	mov [esi+0x14], ebx
	mov dword [esi+0xc], 0x20
	mov eax, [esi]
	mov edx, [eax]
	mov dword [esp+0x10], 0x20
	mov [esp+0xc], ebx
	mov [esp+0x8], ecx
	mov dword [esp+0x4], 0x0
	mov [esp], eax
	call dword [edx+0x190]
R_DrawXModelSkinnedUncached_50:
	mov ecx, [esi+0x1c]
	test ecx, ecx
	jz R_DrawXModelSkinnedUncached_30
R_DrawXModelSkinnedUncached_60:
	mov dword [esi+0x1c], 0x0
	mov dword [esi+0x20], 0x0
	mov dword [esi+0x18], 0x0
	mov eax, [esi]
	mov edx, [eax]
	mov dword [esp+0x10], 0x0
	mov dword [esp+0xc], 0x0
	mov dword [esp+0x8], 0x0
	mov dword [esp+0x4], 0x1
	mov [esp], eax
	call dword [edx+0x190]
R_DrawXModelSkinnedUncached_70:
	lea eax, [ebp-0x24]
	mov [esp+0x4], eax
	mov [esp], esi
	call R_DrawIndexedPrimitive
	add esp, 0x4c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_DrawXModelSkinnedUncached_20:
	cmp ebx, [esi+0x14]
	jnz R_DrawXModelSkinnedUncached_40
	cmp dword [esi+0xc], 0x20
	jnz R_DrawXModelSkinnedUncached_40
	jmp R_DrawXModelSkinnedUncached_50
R_DrawXModelSkinnedUncached_30:
	mov edx, [esi+0x20]
	test edx, edx
	jnz R_DrawXModelSkinnedUncached_60
	mov eax, [esi+0x18]
	test eax, eax
	jnz R_DrawXModelSkinnedUncached_60
	jmp R_DrawXModelSkinnedUncached_70


;R_DrawXModelSkinnedCached(GfxCmdBufContext, GfxModelSkinnedSurface const*)
R_DrawXModelSkinnedCached:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x5c
	mov [ebp-0x3c], ecx
	mov esi, edx
	mov ebx, eax
	mov edx, [ecx+0x4]
	movzx eax, word [edx+0x2]
	mov [ebp-0x30], eax
	movzx eax, word [edx+0x4]
	mov [ebp-0x2c], eax
	lea eax, [ebp-0x28]
	mov [esp+0xc], eax
	lea eax, [ebp-0x24]
	mov [esp+0x8], eax
	mov eax, [edx+0xc]
	mov [esp+0x4], eax
	movzx eax, byte [edx+0x6]
	mov [esp], eax
	call DB_GetIndexBufferAndBase
	mov edi, [ebx+0xca8]
	mov ecx, [ebp-0x24]
	lea ebx, [esi+0x90]
	cmp ecx, [ebx+0x4]
	jz R_DrawXModelSkinnedCached_10
	mov [ebx+0x4], ecx
	mov eax, [esi+0x90]
	mov edx, [eax]
	mov [esp+0x4], ecx
	mov [esp], eax
	call dword [edx+0x1a0]
R_DrawXModelSkinnedCached_10:
	mov eax, [ebp-0x3c]
	mov esi, [eax]
	mov eax, [edi+0x11e690]
	mov ecx, [eax+0x8]
	cmp ecx, [ebx+0x10]
	jz R_DrawXModelSkinnedCached_20
R_DrawXModelSkinnedCached_50:
	mov [ebx+0x10], ecx
	mov [ebx+0x14], esi
	mov dword [ebx+0xc], 0x20
	mov eax, [ebx]
	mov edx, [eax]
	mov dword [esp+0x10], 0x20
	mov [esp+0xc], esi
	mov [esp+0x8], ecx
	mov dword [esp+0x4], 0x0
	mov [esp], eax
	call dword [edx+0x190]
R_DrawXModelSkinnedCached_60:
	mov esi, [ebx+0x1c]
	test esi, esi
	jz R_DrawXModelSkinnedCached_30
R_DrawXModelSkinnedCached_70:
	mov dword [ebx+0x1c], 0x0
	mov dword [ebx+0x20], 0x0
	mov dword [ebx+0x18], 0x0
	mov eax, [ebx]
	mov edx, [eax]
	mov dword [esp+0x10], 0x0
	mov dword [esp+0xc], 0x0
	mov dword [esp+0x8], 0x0
	mov dword [esp+0x4], 0x1
	mov [esp], eax
	call dword [edx+0x190]
R_DrawXModelSkinnedCached_80:
	mov eax, [edi+0x11e690]
	mov edx, [eax+0x4]
	mov [ebp-0x20], edx
	mov eax, [edi+0x11e690]
	mov eax, [eax]
	mov [ebp-0x1c], eax
	cmp edx, eax
	jge R_DrawXModelSkinnedCached_40
	lea eax, [ebp-0x20]
	mov eax, [eax]
	mov [esp], eax
	call _ZN14MacOpenGLUtils13SetBufferHintEj
	lea eax, [ebp-0x30]
	mov [esp+0x4], eax
	mov [esp], ebx
	call R_DrawIndexedPrimitive
	call _ZN14MacOpenGLUtils16ClearBufferHintsEv
	add esp, 0x5c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_DrawXModelSkinnedCached_20:
	cmp esi, [ebx+0x14]
	jnz R_DrawXModelSkinnedCached_50
	cmp dword [ebx+0xc], 0x20
	jnz R_DrawXModelSkinnedCached_50
	jmp R_DrawXModelSkinnedCached_60
R_DrawXModelSkinnedCached_30:
	mov ecx, [ebx+0x20]
	test ecx, ecx
	jnz R_DrawXModelSkinnedCached_70
	mov edx, [ebx+0x18]
	test edx, edx
	jz R_DrawXModelSkinnedCached_80
	jmp R_DrawXModelSkinnedCached_70
R_DrawXModelSkinnedCached_40:
	lea eax, [ebp-0x1c]
	mov eax, [eax]
	mov [esp], eax
	call _ZN14MacOpenGLUtils13SetBufferHintEj
	lea eax, [ebp-0x30]
	mov [esp+0x4], eax
	mov [esp], ebx
	call R_DrawIndexedPrimitive
	call _ZN14MacOpenGLUtils16ClearBufferHintsEv
	add esp, 0x5c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


;R_TessBModel(GfxDrawSurfListArgs const*, GfxCmdBufContext)
R_TessBModel:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0xcc
	mov dword [ebp-0x70], 0x0
	mov dword [ebp-0x6c], 0x0
	mov dword [ebp-0x78], 0x0
	mov dword [ebp-0x74], 0x0
	mov dword [ebp-0x80], 0x0
	mov dword [ebp-0x7c], 0x0
	mov dword [ebp-0x88], 0x0
	mov dword [ebp-0x84], 0x0
	mov dword [ebp-0x90], 0x0
	mov dword [ebp-0x8c], 0x0
	mov dword [ebp-0x98], 0x0
	mov dword [ebp-0x94], 0x0
	mov dword [ebp-0xa0], 0x0
	mov dword [ebp-0x9c], 0x0
	mov dword [ebp-0xa8], 0x0
	mov dword [ebp-0xa4], 0x0
	mov eax, [ebp+0x8]
	mov ebx, [ebp+0xc]
	mov [ebp-0x30], ebx
	mov esi, [ebp+0x10]
	mov [ebp-0x34], esi
	mov ebx, [eax]
	mov esi, [eax+0x4]
	mov [ebp-0xb0], ebx
	mov [ebp-0xac], esi
	mov [ebp-0x3c], esi
	mov [ebp-0x38], ebx
	mov esi, [eax+0xc]
	mov ebx, [eax+0x8]
	mov eax, [esi]
	lea eax, [eax+ebx*8]
	mov [ebp-0x64], eax
	mov eax, [esi+0x4]
	sub eax, ebx
	mov [ebp-0x60], eax
	mov ecx, [ebp-0xac]
	mov edx, [ebp-0xb0]
	mov [esp], edx
	mov [esp+0x4], ecx
	call R_SetupPassPixelShaderArgs
	mov edx, [ebp-0x38]
	mov edx, [edx+0xca8]
	mov [ebp-0x48], edx
	mov esi, [esi+0x8]
	mov [ebp-0x44], esi
	cmp esi, 0x7
	jz R_TessBModel_10
R_TessBModel_180:
	mov dword [esp+0x4], 0x0
	mov ebx, [ebp-0x38]
	mov [esp], ebx
	call R_ChangeDepthHackNearClip
	mov esi, [ebp-0x3c]
	mov eax, [esi+0xc0]
	test byte [eax+0x4], 0x8
	jnz R_TessBModel_20
	mov eax, 0x2
	mov ecx, [ebp-0x3c]
R_TessBModel_140:
	add ecx, 0x90
	mov [ebp-0x40], ecx
	mov [ecx+0x8], eax
	mov ebx, [ebp-0x3c]
	mov [esp], ebx
	call R_UpdateVertexDecl
	mov [ebp-0xac], ebx
	mov esi, [ebp-0x38]
	mov [ebp-0xb0], esi
	cmp dword [esi+0xf34], 0x1
	sbb edx, edx
	cmp edx, [ebx+0xcc]
	jz R_TessBModel_30
	mov [esp+0x4], edx
	mov [esp], ebx
	call R_ChangeDepthRange
R_TessBModel_30:
	mov eax, [ebp-0x34]
	test eax, eax
	jz R_TessBModel_40
	mov edx, [ebp-0x30]
	mov [ebp-0xa8], edx
	mov ecx, [ebp-0x34]
	mov [ebp-0xa4], ecx
	mov ebx, [ebp-0xa8]
	mov esi, [ebp-0xa4]
	mov [esp], ebx
	mov [esp+0x4], esi
	call R_SetupPassPixelShaderArgs
	mov esi, [ebp-0x34]
	mov eax, [esi+0xc0]
	test byte [eax+0x4], 0x8
	jnz R_TessBModel_50
	mov eax, 0x2
	mov ecx, [ebp-0x34]
R_TessBModel_150:
	mov [ecx+0x98], eax
	mov [esp], ecx
	call R_UpdateVertexDecl
	mov ebx, [ebp-0x30]
	mov [ebp+0xc], ebx
	mov esi, [ebp-0x34]
	mov [ebp+0x10], esi
	cmp dword [ebx+0xf34], 0x1
	sbb eax, eax
	cmp eax, [esi+0xcc]
	jz R_TessBModel_60
	mov [esp+0x4], eax
	mov [esp], esi
	call R_ChangeDepthRange
	mov eax, [ebp-0x30]
	mov edx, [ebp-0x34]
R_TessBModel_160:
	mov [ebp-0xa0], eax
	mov [ebp-0x9c], edx
	mov ecx, [ebp-0xa0]
	mov ebx, [ebp-0x9c]
	mov [esp], ecx
	mov [esp+0x4], ebx
	call R_SetupPassPerObjectArgs
R_TessBModel_40:
	mov eax, [ebp-0x64]
	mov ebx, [eax]
	mov esi, [eax+0x4]
	mov dword [ebp-0xb8], 0xffffffff
	mov dword [ebp-0xb4], 0xffffffff
	mov word [ebp-0xb8], 0x0
	and dword [ebp-0xb8], 0xff00ffff
	and dword [ebp-0xb8], 0xe0ffffff
	mov dword [ebp-0xc0], 0xffffffff
	mov dword [ebp-0xbc], 0xffffffff
	mov word [ebp-0xc0], 0x0
	cmp dword [ebp-0x44], 0x7
	jz R_TessBModel_70
	and dword [ebp-0xc0], 0xff00ffff
	and dword [ebp-0xc0], 0xe0ffffff
	mov edx, [ebp-0x3c]
	mov [ebp-0x94], edx
	mov ecx, [ebp-0x38]
	mov [ebp-0x98], ecx
	mov eax, [ebp-0x98]
	mov edx, [ebp-0x94]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerObjectArgs
R_TessBModel_70:
	mov edx, [ebp-0xb8]
	and edx, ebx
	mov [ebp-0x58], edx
	mov ecx, [ebp-0xb4]
	and ecx, esi
	mov [ebp-0x54], ecx
	mov dword [ebp-0x5c], 0x0
	mov eax, [ebp-0x34]
	add eax, 0x90
	mov [ebp-0xc8], eax
	cmp dword [ebp-0x44], 0x7
	jz R_TessBModel_80
R_TessBModel_130:
	mov edx, [ebp-0xc0]
	and edx, ebx
	mov [ebp-0x50], edx
	mov ecx, [ebp-0xbc]
	and ecx, esi
	mov [ebp-0x4c], ecx
	mov eax, [ebp-0x5c]
	mov edx, [ebp-0x64]
	lea edi, [edx+eax*8]
	mov [ebp-0x2c], eax
	mov ecx, [ebp-0x60]
	mov [ebp-0xc4], ecx
R_TessBModel_120:
	movzx eax, bx
	mov esi, [ebp-0x48]
	lea ebx, [esi+eax*4]
	mov eax, [ebx]
	mov edx, [ebp-0x38]
	cmp eax, [edx+0xf08]
	jz R_TessBModel_90
	mov [esp+0x4], eax
	mov [esp], edx
	call R_ChangeObjectPlacement
R_TessBModel_90:
	mov ebx, [ebx+0x4]
	movzx eax, word [ebx+0x8]
	mov [ebp-0x24], eax
	movzx eax, word [ebx+0xa]
	mov [ebp-0x20], eax
	mov [esp+0x4], ebx
	mov ecx, [ebp-0x40]
	mov [esp], ecx
	call R_SetStreamsForBspSurface
	mov esi, [ebp-0x3c]
	mov [ebp-0x74], esi
	mov eax, [ebp-0x38]
	mov [ebp-0x78], eax
	mov edx, [ebp-0x78]
	mov ecx, [ebp-0x74]
	mov [esp], edx
	mov [esp+0x4], ecx
	call R_SetupPassPerPrimArgs
	mov eax, [ebp-0x20]
	mov [esp+0x8], eax
	mov ecx, rgp
	mov edx, [ecx+0x20a0]
	mov eax, [ebx+0xc]
	mov edx, [edx+0x14]
	lea eax, [edx+eax*2]
	mov [esp+0x4], eax
	mov esi, [ebp-0x40]
	mov [esp], esi
	call R_SetIndexData
	mov [ebp-0x1c], eax
	lea eax, [ebp-0x24]
	mov [esp+0x4], eax
	mov [esp], esi
	call R_DrawIndexedPrimitive
	mov eax, [ebp-0x34]
	test eax, eax
	jz R_TessBModel_100
	mov [esp+0x4], ebx
	mov edx, [ebp-0xc8]
	mov [esp], edx
	call R_SetStreamsForBspSurface
	mov ecx, [ebp-0x30]
	mov [ebp-0x70], ecx
	mov esi, [ebp-0x34]
	mov [ebp-0x6c], esi
	mov eax, [ebp-0x70]
	mov edx, [ebp-0x6c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerPrimArgs
	mov eax, [ebp-0x20]
	mov [esp+0x8], eax
	mov ecx, rgp
	mov edx, [ecx+0x20a0]
	mov eax, [ebx+0xc]
	mov edx, [edx+0x14]
	lea eax, [edx+eax*2]
	mov [esp+0x4], eax
	mov ebx, [ebp-0xc8]
	mov [esp], ebx
	call R_SetIndexData
	mov [ebp-0x1c], eax
	lea esi, [ebp-0x24]
	mov [esp+0x4], esi
	mov [esp], ebx
	call R_DrawIndexedPrimitive
R_TessBModel_100:
	mov dword [ebp-0x20], 0x0
	add dword [ebp-0x2c], 0x1
	mov eax, [ebp-0xc4]
	cmp [ebp-0x2c], eax
	jz R_TessBModel_110
	mov ebx, [edi+0x8]
	mov esi, [edi+0xc]
	add edi, 0x8
	mov eax, [ebp-0xc0]
	and eax, ebx
	mov edx, [ebp-0xbc]
	and edx, esi
	mov ecx, [ebp-0x4c]
	xor ecx, edx
	xor eax, [ebp-0x50]
	or ecx, eax
	jz R_TessBModel_120
	mov eax, [ebp-0xb8]
	and eax, ebx
	mov edx, [ebp-0xb4]
	and edx, esi
	mov ecx, [ebp-0x54]
	xor ecx, edx
	xor eax, [ebp-0x58]
	or ecx, eax
	jnz R_TessBModel_110
	mov edx, [ebp-0x2c]
	mov [ebp-0x5c], edx
	cmp dword [ebp-0x44], 0x7
	jnz R_TessBModel_130
R_TessBModel_80:
	mov eax, ebx
	shr eax, 0x18
	and eax, 0x1f
	mov ecx, [ebp-0x3c]
	mov [ebp-0x8c], ecx
	mov ecx, [ebp-0x38]
	mov [ebp-0x90], ecx
	mov [esp+0x8], eax
	mov eax, [ebp-0x90]
	mov edx, [ebp-0x8c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetLightmap
	mov ecx, ebx
	shr ecx, 0x10
	movzx eax, cl
	mov ecx, [ebp-0x3c]
	mov [ebp-0x84], ecx
	mov ecx, [ebp-0x38]
	mov [ebp-0x88], ecx
	mov [esp+0x8], eax
	mov eax, [ebp-0x88]
	mov edx, [ebp-0x84]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetReflectionProbe
	mov edx, [ebp-0x3c]
	mov [ebp-0x7c], edx
	mov ecx, [ebp-0x38]
	mov [ebp-0x80], ecx
	mov eax, [ebp-0x80]
	mov edx, [ebp-0x7c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerObjectArgs
	jmp R_TessBModel_130
R_TessBModel_110:
	mov eax, [ebp-0x2c]
	add esp, 0xcc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_TessBModel_20:
	mov eax, [esi+0xb8]
	mov eax, [eax+0x40]
	movzx eax, byte [eax+0x4]
	add eax, 0x2
	mov ecx, esi
	jmp R_TessBModel_140
R_TessBModel_50:
	mov eax, [esi+0xb8]
	mov eax, [eax+0x40]
	movzx eax, byte [eax+0x4]
	add eax, 0x2
	mov ecx, esi
	jmp R_TessBModel_150
R_TessBModel_60:
	mov eax, ebx
	mov edx, esi
	jmp R_TessBModel_160
R_TessBModel_10:
	mov eax, sc_enable
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_TessBModel_170
	mov eax, gfxRenderTargets
	mov eax, [eax+0x78]
R_TessBModel_190:
	mov ecx, [ebp-0x38]
	mov [ecx+0xc60], eax
	jmp R_TessBModel_180
R_TessBModel_170:
	mov eax, rgp
	mov eax, [eax+0x2008]
	jmp R_TessBModel_190


;R_TessCodeMeshList(GfxDrawSurfListArgs const*, GfxCmdBufContext)
R_TessCodeMeshList:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x9c
	mov dword [ebp-0x70], 0x0
	mov dword [ebp-0x6c], 0x0
	mov dword [ebp-0x78], 0x0
	mov dword [ebp-0x74], 0x0
	mov eax, [ebp+0x8]
	mov ebx, [eax]
	mov esi, [eax+0x4]
	mov [ebp-0x80], ebx
	mov [ebp-0x7c], esi
	mov [ebp-0x34], esi
	mov [ebp-0x2c], ebx
	mov ebx, [eax+0xc]
	mov esi, [eax+0x8]
	mov eax, [ebx+0x4]
	sub eax, esi
	mov [ebp-0x60], eax
	mov eax, [ebx]
	lea esi, [eax+esi*8]
	mov [ebp-0x64], esi
	mov ecx, [ebp-0x7c]
	mov edx, [ebp-0x80]
	mov [esp], edx
	mov [esp+0x4], ecx
	call R_SetupPassPixelShaderArgs
	mov edx, [ebp-0x64]
	mov esi, [edx]
	mov edi, [edx+0x4]
	mov eax, rg
	add eax, 0x2244
	mov ecx, [ebp-0x2c]
	cmp [ecx+0xf08], eax
	jz R_TessCodeMeshList_10
	mov [esp+0x4], eax
	mov ebx, [ebp-0x80]
	mov [esp], ebx
	call R_ChangeObjectPlacement
R_TessCodeMeshList_10:
	mov dword [esp+0x4], 0x0
	mov eax, [ebp-0x80]
	mov [esp], eax
	call R_ChangeDepthHackNearClip
	mov edx, [ebp-0x34]
	add edx, 0x90
	mov [ebp-0x40], edx
	mov dword [edx+0x8], 0x1
	mov ecx, [ebp-0x7c]
	mov [esp], ecx
	call R_UpdateVertexDecl
	mov ebx, [ebp-0x2c]
	cmp dword [ebx+0xf34], 0x1
	sbb eax, eax
	mov edx, [ebp-0x34]
	cmp eax, [edx+0xcc]
	jz R_TessCodeMeshList_20
	mov [esp+0x4], eax
	mov ecx, [ebp-0x7c]
	mov [esp], ecx
	call R_ChangeDepthRange
	mov ebx, [ebp-0x2c]
R_TessCodeMeshList_20:
	mov ebx, [ebx+0xca8]
	mov [ebp-0x4c], ebx
	mov eax, ebx
	add eax, 0xb0000
	mov [esp+0x4], eax
	mov eax, [ebp-0x7c]
	mov [esp], eax
	call R_SetMeshStream
	mov dword [ebp-0x1c], 0x0
	mov dword [ebp-0x24], 0x4000
	mov dword [ebp-0x20], 0x0
	mov dword [ebp-0x88], 0xffffffff
	mov dword [ebp-0x84], 0xffffffff
	mov word [ebp-0x88], 0x0
	and dword [ebp-0x88], 0xff00ffff
	and dword [ebp-0x88], 0xe0ffffff
	mov edx, [ebp-0x88]
	and edx, esi
	mov [ebp-0x58], edx
	mov ecx, [ebp-0x84]
	and ecx, edi
	mov [ebp-0x54], ecx
	mov dword [ebp-0x48], 0x0
	mov dword [ebp-0x44], 0x0
	mov dword [ebp-0x5c], 0x0
	xor ebx, ebx
	mov [ebp-0x8c], ebx
R_TessCodeMeshList_90:
	movzx eax, si
	shl eax, 0x4
	mov esi, [ebp-0x4c]
	lea eax, [eax+esi+0x20000]
	mov [ebp-0x68], eax
	mov edx, [ebp-0x44]
	test edx, edx
	jnz R_TessCodeMeshList_30
	cmp word [eax+0xa], 0x0
	jnz R_TessCodeMeshList_30
	mov edx, [ebp-0x8c]
	lea eax, [edx+edx*2]
	mov ecx, [ebp-0x48]
	lea eax, [ecx+eax*2]
	mov ebx, [ebp-0x68]
	cmp eax, [ebx+0x4]
	jz R_TessCodeMeshList_40
R_TessCodeMeshList_30:
	mov eax, [ebp-0x8c]
	test eax, eax
	jnz R_TessCodeMeshList_50
R_TessCodeMeshList_110:
	mov ebx, [ebp-0x68]
	mov ebx, [ebx+0x4]
	mov [ebp-0x48], ebx
	mov esi, [ebp-0x68]
	movzx edx, word [esi+0x8]
	movzx eax, word [esi+0xa]
	movzx ecx, ax
	mov [ebp-0x3c], ecx
	test ax, ax
	jz R_TessCodeMeshList_60
	mov ebx, [ebp-0x2c]
	mov [ebp-0x30], ebx
	mov dword [ebp-0x38], 0x0
	mov edi, ebx
	add edi, 0xbf0
	shl edx, 0x4
	mov eax, [ebp-0x4c]
	lea esi, [edx+eax+0x6b000]
R_TessCodeMeshList_70:
	mov ebx, [esi+0xc]
	mov ecx, [esi+0x8]
	mov edx, [esi+0x4]
	mov eax, [esi]
	mov [edi], eax
	mov [edi+0x4], edx
	mov [edi+0x8], ecx
	mov [edi+0xc], ebx
	mov edx, [ebp-0x30]
	add word [edx+0xe9e], 0x1
	add dword [ebp-0x38], 0x1
	add esi, 0x10
	add edi, 0x10
	add edx, 0x2
	mov [ebp-0x30], edx
	mov ecx, [ebp-0x38]
	cmp [ebp-0x3c], ecx
	jnz R_TessCodeMeshList_70
R_TessCodeMeshList_60:
	mov ebx, [ebp-0x34]
	mov [ebp-0x74], ebx
	mov esi, [ebp-0x2c]
	mov [ebp-0x78], esi
	mov eax, [ebp-0x78]
	mov edx, [ebp-0x74]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerObjectArgs
	mov [ebp-0x6c], ebx
	mov [ebp-0x70], esi
	mov edx, [ebp-0x70]
	mov ecx, [ebp-0x6c]
	mov [esp], edx
	mov [esp+0x4], ecx
	call R_SetupPassPerPrimArgs
	mov ecx, [ebp-0x20]
	mov [ebp-0x8c], ecx
	mov ebx, [ebp-0x68]
R_TessCodeMeshList_40:
	movzx ebx, word [ebx+0xa]
	mov [ebp-0x44], ebx
	mov ebx, [ebp-0x8c]
	mov esi, [ebp-0x68]
	add ebx, [esi]
	mov [ebp-0x8c], ebx
	mov [ebp-0x20], ebx
	add dword [ebp-0x5c], 0x1
	mov eax, [ebp-0x5c]
	cmp [ebp-0x60], eax
	jz R_TessCodeMeshList_80
	mov ecx, [ebp-0x64]
	mov esi, [ecx+eax*8]
	mov edi, [ecx+eax*8+0x4]
	mov eax, [ebp-0x88]
	and eax, esi
	mov edx, [ebp-0x84]
	and edx, edi
	mov ecx, [ebp-0x54]
	xor ecx, edx
	xor eax, [ebp-0x58]
	or ecx, eax
	jz R_TessCodeMeshList_90
R_TessCodeMeshList_80:
	test ebx, ebx
	jz R_TessCodeMeshList_100
	mov [esp+0x8], ebx
	mov ebx, [ebp-0x48]
	mov [esp+0x4], ebx
	mov esi, [ebp-0x40]
	mov [esp], esi
	call R_SetIndexData
	mov [ebp-0x1c], eax
	lea eax, [ebp-0x24]
	mov [esp+0x4], eax
	mov [esp], esi
	call R_DrawIndexedPrimitive
R_TessCodeMeshList_100:
	mov eax, [ebp-0x5c]
	add esp, 0x9c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_TessCodeMeshList_50:
	mov esi, [ebp-0x8c]
	mov [esp+0x8], esi
	mov eax, [ebp-0x48]
	mov [esp+0x4], eax
	mov edx, [ebp-0x40]
	mov [esp], edx
	call R_SetIndexData
	mov [ebp-0x1c], eax
	lea eax, [ebp-0x24]
	mov [esp+0x4], eax
	mov ecx, [ebp-0x40]
	mov [esp], ecx
	call R_DrawIndexedPrimitive
	mov dword [ebp-0x20], 0x0
	jmp R_TessCodeMeshList_110


;R_TessMarkMeshList(GfxDrawSurfListArgs const*, GfxCmdBufContext)
R_TessMarkMeshList:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0xbc
	mov dword [ebp-0x68], 0x0
	mov dword [ebp-0x64], 0x0
	mov dword [ebp-0x70], 0x0
	mov dword [ebp-0x6c], 0x0
	mov dword [ebp-0x78], 0x0
	mov dword [ebp-0x74], 0x0
	mov dword [ebp-0x80], 0x0
	mov dword [ebp-0x7c], 0x0
	mov dword [ebp-0x88], 0x0
	mov dword [ebp-0x84], 0x0
	mov dword [ebp-0x90], 0x0
	mov dword [ebp-0x8c], 0x0
	mov dword [ebp-0x98], 0x0
	mov dword [ebp-0x94], 0x0
	mov eax, [ebp+0x8]
	mov ebx, [eax]
	mov esi, [eax+0x4]
	mov [ebp-0xa0], ebx
	mov [ebp-0x9c], esi
	mov [ebp-0x38], esi
	mov [ebp-0x34], ebx
	mov ebx, [eax+0xc]
	mov esi, [eax+0x8]
	mov eax, [ebx+0x4]
	sub eax, esi
	mov [ebp-0x58], eax
	mov eax, [ebx]
	lea esi, [eax+esi*8]
	mov [ebp-0x5c], esi
	mov ecx, [ebp-0x9c]
	mov edx, [ebp-0xa0]
	mov [esp], edx
	mov [esp+0x4], ecx
	call R_SetupPassPixelShaderArgs
	mov ebx, [ebx+0x8]
	mov [ebp-0x40], ebx
	cmp ebx, 0x7
	jz R_TessMarkMeshList_10
R_TessMarkMeshList_200:
	mov ebx, [ebp-0x5c]
	mov ecx, [ebx]
	mov ebx, [ebx+0x4]
	mov [ebp-0xb8], ecx
	mov [ebp-0xb4], ebx
	mov eax, rg
	add eax, 0x2244
	mov esi, [ebp-0x34]
	cmp [esi+0xf08], eax
	jz R_TessMarkMeshList_20
	mov [esp+0x4], eax
	mov [esp], esi
	call R_ChangeObjectPlacement
	mov eax, [ebp-0x34]
R_TessMarkMeshList_180:
	mov dword [esp+0x4], 0x0
	mov [esp], eax
	call R_ChangeDepthHackNearClip
	mov edx, [ebp-0x34]
	mov edx, [edx+0xca8]
	mov [ebp-0x48], edx
	movzx edi, word [ebp-0xb8]
	mov eax, edi
	shl eax, 0x4
	movzx eax, byte [eax+edx+0x11867a]
	and eax, 0xc0
	cmp eax, 0x40
	jz R_TessMarkMeshList_30
	cmp eax, 0xc0
	jz R_TessMarkMeshList_30
	xor eax, eax
R_TessMarkMeshList_170:
	neg eax
	add eax, 0x2
	mov ecx, [ebp-0x38]
	add ecx, 0x90
	mov [ebp-0x3c], ecx
	mov [ecx+0x8], eax
	mov ebx, [ebp-0x38]
	mov [esp], ebx
	call R_UpdateVertexDecl
	mov [ebp-0x9c], ebx
	mov esi, [ebp-0x34]
	mov [ebp-0xa0], esi
	cmp dword [esi+0xf34], 0x1
	sbb edx, edx
	cmp edx, [ebx+0xcc]
	jz R_TessMarkMeshList_40
	mov [esp+0x4], edx
	mov [esp], ebx
	call R_ChangeDepthRange
R_TessMarkMeshList_40:
	mov eax, [ebp-0x48]
	add eax, 0x11e670
	mov [esp+0x4], eax
	mov edx, [ebp-0x38]
	mov [esp], edx
	call R_SetMeshStream
	mov dword [ebp-0x1c], 0x0
	mov dword [ebp-0x24], 0x1800
	mov dword [ebp-0x20], 0x0
	mov dword [ebp-0xa8], 0xffffffff
	mov dword [ebp-0xa4], 0xffffffff
	mov word [ebp-0xa8], 0x0
	and dword [ebp-0xa8], 0xff00ffff
	and dword [ebp-0xa8], 0xe0ffffff
	mov dword [ebp-0xb0], 0xffffffff
	mov dword [ebp-0xac], 0xffffffff
	mov word [ebp-0xb0], 0x0
	cmp dword [ebp-0x40], 0x7
	jz R_TessMarkMeshList_50
	and dword [ebp-0xb0], 0xff00ffff
	and dword [ebp-0xb0], 0xe0ffffff
	mov ecx, [ebp-0x38]
	mov [ebp-0x94], ecx
	mov ebx, [ebp-0x34]
	mov [ebp-0x98], ebx
	mov eax, [ebp-0x98]
	mov edx, [ebp-0x94]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerObjectArgs
R_TessMarkMeshList_50:
	mov edx, [ebp-0xb8]
	and edx, [ebp-0xa8]
	mov [ebp-0x50], edx
	mov ecx, [ebp-0xb4]
	and ecx, [ebp-0xa4]
	mov [ebp-0x4c], ecx
	mov dword [ebp-0x44], 0x0
	mov dword [ebp-0x54], 0x0
	cmp dword [ebp-0x40], 0x7
	jz R_TessMarkMeshList_60
R_TessMarkMeshList_120:
	mov ebx, [ebp-0xb8]
	and ebx, [ebp-0xb0]
	mov esi, [ebp-0xb4]
	and esi, [ebp-0xac]
	mov eax, [ebp-0x54]
	mov edx, [ebp-0x5c]
	lea eax, [edx+eax*8]
	mov [ebp-0x30], eax
	mov edx, [ebp-0x54]
	mov [ebp-0x2c], edx
	jmp R_TessMarkMeshList_70
R_TessMarkMeshList_110:
	mov ecx, [edi+0x4]
	mov [ebp-0x44], ecx
R_TessMarkMeshList_100:
	add edx, [edi]
	mov edi, edx
	mov [ebp-0x20], edx
	add dword [ebp-0x2c], 0x1
	mov eax, [ebp-0x58]
	cmp [ebp-0x2c], eax
	jz R_TessMarkMeshList_80
	mov ecx, [ebp-0x30]
	mov edx, [ecx+0x8]
	mov ecx, [ecx+0xc]
	mov [ebp-0xb8], edx
	mov [ebp-0xb4], ecx
	add dword [ebp-0x30], 0x8
	mov eax, [ebp-0xb0]
	and eax, [ebp-0xb8]
	mov edx, [ebp-0xac]
	and edx, ecx
	mov ecx, esi
	xor ecx, edx
	xor eax, ebx
	or ecx, eax
	jnz R_TessMarkMeshList_90
	movzx edi, word [ebp-0xb8]
R_TessMarkMeshList_70:
	shl edi, 0x4
	mov ecx, [ebp-0x48]
	lea edi, [edi+ecx+0x118670]
	mov edx, [ebp-0x20]
	lea eax, [edx+edx*2]
	mov ecx, [ebp-0x44]
	lea eax, [ecx+eax*2]
	cmp eax, [edi+0x4]
	jz R_TessMarkMeshList_100
	test edx, edx
	jz R_TessMarkMeshList_110
	mov eax, [ebp-0x38]
	mov [ebp-0x6c], eax
	mov edx, [ebp-0x34]
	mov [ebp-0x70], edx
	mov eax, [ebp-0x70]
	mov edx, [ebp-0x6c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerPrimArgs
	mov eax, [ebp-0x20]
	mov [esp+0x8], eax
	mov edx, [ebp-0x44]
	mov [esp+0x4], edx
	mov ecx, [ebp-0x3c]
	mov [esp], ecx
	call R_SetIndexData
	mov [ebp-0x1c], eax
	lea eax, [ebp-0x24]
	mov [esp+0x4], eax
	mov edx, [ebp-0x3c]
	mov [esp], edx
	call R_DrawIndexedPrimitive
	mov dword [ebp-0x20], 0x0
	xor edx, edx
	jmp R_TessMarkMeshList_110
R_TessMarkMeshList_90:
	mov eax, [ebp-0xa8]
	and eax, [ebp-0xb8]
	mov edx, [ebp-0xa4]
	and edx, [ebp-0xb4]
	mov ecx, [ebp-0x4c]
	xor ecx, edx
	xor eax, [ebp-0x50]
	or ecx, eax
	jnz R_TessMarkMeshList_80
	mov eax, [ebp-0x2c]
	mov [ebp-0x54], eax
	movzx edi, word [ebp-0xb8]
	cmp dword [ebp-0x40], 0x7
	jnz R_TessMarkMeshList_120
R_TessMarkMeshList_60:
	mov ecx, [ebp-0x20]
	test ecx, ecx
	jnz R_TessMarkMeshList_130
	mov eax, edi
	shl eax, 0x4
	mov ecx, [ebp-0x48]
	lea edx, [eax+ecx+0x118670]
	movzx eax, byte [edx+0xa]
	and eax, 0xc0
	cmp eax, 0x40
	jz R_TessMarkMeshList_140
R_TessMarkMeshList_210:
	cmp eax, 0xc0
	jz R_TessMarkMeshList_150
	mov eax, [ebp-0xb8]
	shr eax, 0x18
	and eax, 0x1f
	mov ebx, [ebp-0x38]
	mov [ebp-0x84], ebx
	mov esi, [ebp-0x34]
	mov [ebp-0x88], esi
	mov [esp+0x8], eax
	mov eax, [ebp-0x88]
	mov edx, [ebp-0x84]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetLightmap
R_TessMarkMeshList_220:
	mov ecx, [ebp-0xb8]
	shr ecx, 0x10
	movzx eax, cl
	mov ecx, [ebp-0x38]
	mov [ebp-0x7c], ecx
	mov ebx, [ebp-0x34]
	mov [ebp-0x80], ebx
	mov [esp+0x8], eax
	mov eax, [ebp-0x80]
	mov edx, [ebp-0x7c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetReflectionProbe
	mov edx, [ebp-0x38]
	mov [ebp-0x74], edx
	mov [ebp-0x78], ebx
	mov ecx, [ebp-0x78]
	mov ebx, [ebp-0x74]
	mov [esp], ecx
	mov [esp+0x4], ebx
	call R_SetupPassPerObjectArgs
	jmp R_TessMarkMeshList_120
R_TessMarkMeshList_80:
	test edi, edi
	jz R_TessMarkMeshList_160
	mov ebx, [ebp-0x38]
	mov [ebp-0x64], ebx
	mov esi, [ebp-0x34]
	mov [ebp-0x68], esi
	mov eax, [ebp-0x68]
	mov edx, [ebp-0x64]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerPrimArgs
	mov eax, [ebp-0x20]
	mov [esp+0x8], eax
	mov edx, [ebp-0x44]
	mov [esp+0x4], edx
	mov ecx, [ebp-0x3c]
	mov [esp], ecx
	call R_SetIndexData
	mov [ebp-0x1c], eax
	lea ebx, [ebp-0x24]
	mov [esp+0x4], ebx
	mov esi, [ebp-0x3c]
	mov [esp], esi
	call R_DrawIndexedPrimitive
R_TessMarkMeshList_160:
	mov eax, [ebp-0x2c]
	add esp, 0xbc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_TessMarkMeshList_30:
	mov eax, 0x1
	jmp R_TessMarkMeshList_170
R_TessMarkMeshList_20:
	mov eax, esi
	jmp R_TessMarkMeshList_180
R_TessMarkMeshList_10:
	mov eax, sc_enable
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_TessMarkMeshList_190
	mov eax, gfxRenderTargets
	mov eax, [eax+0x78]
R_TessMarkMeshList_230:
	mov edx, [ebp-0x34]
	mov [edx+0xc60], eax
	jmp R_TessMarkMeshList_200
R_TessMarkMeshList_130:
	mov ebx, [ebp-0x38]
	mov [ebp-0x8c], ebx
	mov esi, [ebp-0x34]
	mov [ebp-0x90], esi
	mov eax, [ebp-0x90]
	mov edx, [ebp-0x8c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerPrimArgs
	mov eax, [ebp-0x20]
	mov [esp+0x8], eax
	mov edx, [ebp-0x44]
	mov [esp+0x4], edx
	mov ecx, [ebp-0x3c]
	mov [esp], ecx
	call R_SetIndexData
	mov [ebp-0x1c], eax
	lea ebx, [ebp-0x24]
	mov [esp+0x4], ebx
	mov esi, [ebp-0x3c]
	mov [esp], esi
	call R_DrawIndexedPrimitive
	mov dword [ebp-0x20], 0x0
	mov dword [ebp-0x44], 0x0
	mov eax, edi
	shl eax, 0x4
	mov ecx, [ebp-0x48]
	lea edx, [eax+ecx+0x118670]
	movzx eax, byte [edx+0xa]
	and eax, 0xc0
	cmp eax, 0x40
	jnz R_TessMarkMeshList_210
R_TessMarkMeshList_140:
	mov ebx, [ebp-0x34]
	mov [esp+0x4], ebx
	movzx eax, word [edx+0x8]
	mov [esp], eax
	call R_SetStaticModelLightingCoordsForSource
	jmp R_TessMarkMeshList_220
R_TessMarkMeshList_150:
	mov esi, [ebp-0x34]
	mov [esp+0x4], esi
	movzx eax, word [edx+0x8]
	mov [esp], eax
	call R_SetModelLightingCoordsForSource
	jmp R_TessMarkMeshList_220
R_TessMarkMeshList_190:
	mov eax, rgp
	mov eax, [eax+0x2008]
	jmp R_TessMarkMeshList_230
	nop


;R_TessTrianglesList(GfxDrawSurfListArgs const*, GfxCmdBufContext)
R_TessTrianglesList:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x8c
	mov dword [ebp-0x38], 0x0
	mov dword [ebp-0x34], 0x0
	mov dword [ebp-0x40], 0x0
	mov dword [ebp-0x3c], 0x0
	mov dword [ebp-0x48], 0x0
	mov dword [ebp-0x44], 0x0
	mov dword [ebp-0x50], 0x0
	mov dword [ebp-0x4c], 0x0
	mov dword [ebp-0x58], 0x0
	mov dword [ebp-0x54], 0x0
	mov dword [ebp-0x60], 0x0
	mov dword [ebp-0x5c], 0x0
	mov dword [ebp-0x68], 0x0
	mov dword [ebp-0x64], 0x0
	mov dword [ebp-0x70], 0x0
	mov dword [ebp-0x6c], 0x0
	mov dword [ebp-0x78], 0x0
	mov dword [ebp-0x74], 0x0
	mov ecx, [ebp+0xc]
	mov [ebp-0x1c], ecx
	mov edi, [ebp+0x10]
	mov ecx, [ebp+0x8]
	mov ebx, [ecx]
	mov esi, [ecx+0x4]
	mov [ebp-0x24], esi
	mov [ebp-0x20], ebx
	mov ecx, [ecx+0xc]
	mov [ebp-0x28], ecx
	mov ecx, [ecx+0x8]
	mov [ebp-0x2c], ecx
	mov [esp], ebx
	mov [esp+0x4], esi
	call R_SetupPassPixelShaderArgs
	mov eax, rg
	add eax, 0x2244
	mov edx, [ebp-0x20]
	cmp [edx+0xf08], eax
	jz R_TessTrianglesList_10
	mov [esp+0x4], eax
	mov [esp], ebx
	call R_ChangeObjectPlacement
R_TessTrianglesList_10:
	mov dword [esp+0x4], 0x0
	mov [esp], ebx
	call R_ChangeDepthHackNearClip
	mov ecx, [ebp-0x24]
	mov eax, [ecx+0xc0]
	test byte [eax+0x4], 0x8
	jnz R_TessTrianglesList_20
	mov eax, 0x2
	mov ecx, [ebp-0x24]
R_TessTrianglesList_70:
	mov [ecx+0x98], eax
	mov [esp], ecx
	call R_UpdateVertexDecl
	mov esi, [ebp-0x24]
	mov ebx, [ebp-0x20]
	cmp dword [ebx+0xf34], 0x1
	sbb edx, edx
	cmp edx, [esi+0xcc]
	jz R_TessTrianglesList_30
	mov [esp+0x4], edx
	mov [esp], esi
	call R_ChangeDepthRange
R_TessTrianglesList_30:
	test edi, edi
	jz R_TessTrianglesList_40
	mov ecx, [ebp-0x1c]
	mov [ebp-0x78], ecx
	mov [ebp-0x74], edi
	mov eax, [ebp-0x78]
	mov edx, [ebp-0x74]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPixelShaderArgs
	mov eax, [edi+0xc0]
	test byte [eax+0x4], 0x8
	jnz R_TessTrianglesList_50
	mov eax, 0x2
R_TessTrianglesList_80:
	mov [edi+0x98], eax
	mov [esp], edi
	call R_UpdateVertexDecl
	mov edx, [ebp-0x1c]
	mov [ebp+0xc], edx
	mov [ebp+0x10], edi
	cmp dword [edx+0xf34], 0x1
	sbb eax, eax
	cmp eax, [edi+0xcc]
	jz R_TessTrianglesList_40
	mov [esp+0x4], eax
	mov [esp], edi
	call R_ChangeDepthRange
R_TessTrianglesList_40:
	mov ebx, [ebp-0x20]
	mov ecx, [ebx+0xca8]
	add ecx, 0x28000
	mov eax, [ebp+0x8]
	mov edx, [eax+0x8]
	mov ebx, [ebp-0x28]
	mov eax, [ebx]
	movzx eax, word [eax+edx*8]
	lea ebx, [ecx+eax*4]
	cmp dword [ebp-0x2c], 0x7
	jz R_TessTrianglesList_60
	mov ecx, [ebp-0x24]
	mov [ebp-0x3c], ecx
	mov eax, [ebp-0x20]
	mov [ebp-0x40], eax
	mov edx, [ebp-0x40]
	mov ecx, [ebp-0x3c]
	mov [esp], edx
	mov [esp+0x4], ecx
	call R_SetupPassPerObjectArgs
	mov ecx, [ebp-0x24]
	mov [ebp-0x34], ecx
	mov eax, [ebp-0x20]
	mov [ebp-0x38], eax
	mov edx, [ebp-0x38]
	mov ecx, [ebp-0x34]
	mov [esp], edx
	mov [esp+0x4], ecx
	call R_SetupPassPerPrimArgs
	mov ecx, [ebp-0x28]
	mov [esp+0x8], ecx
	mov eax, [ebp-0x24]
	mov [esp+0x4], eax
	mov [esp], ebx
	call R_DrawBspDrawSurfs
	mov eax, 0x1
	add esp, 0x8c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_TessTrianglesList_20:
	mov eax, [ecx+0xb8]
	mov eax, [eax+0x40]
	movzx eax, byte [eax+0x4]
	add eax, 0x2
	jmp R_TessTrianglesList_70
R_TessTrianglesList_50:
	mov eax, [edi+0xb8]
	mov eax, [eax+0x40]
	movzx eax, byte [eax+0x4]
	add eax, 0x2
	jmp R_TessTrianglesList_80
R_TessTrianglesList_60:
	mov eax, sc_enable
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_TessTrianglesList_90
	mov eax, gfxRenderTargets
	mov eax, [eax+0x78]
R_TessTrianglesList_110:
	mov edx, [ebp-0x20]
	mov [edx+0xc60], eax
	mov ecx, [ebp-0x24]
	mov [ebp-0x6c], ecx
	mov [ebp-0x70], edx
	mov eax, [ebp-0x70]
	mov edx, [ebp-0x6c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerObjectArgs
	mov edx, [ebp-0x24]
	mov [ebp-0x64], edx
	mov ecx, [ebp-0x20]
	mov [ebp-0x68], ecx
	mov eax, [ebp-0x68]
	mov edx, [ebp-0x64]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerPrimArgs
	test edi, edi
	jz R_TessTrianglesList_100
	mov edx, [ebp-0x1c]
	mov [ebp-0x60], edx
	mov [ebp-0x5c], edi
	mov eax, [ebp-0x60]
	mov edx, [ebp-0x5c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerObjectArgs
	mov edx, [ebp-0x1c]
	mov [ebp-0x58], edx
	mov [ebp-0x54], edi
	mov eax, [ebp-0x58]
	mov edx, [ebp-0x54]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerPrimArgs
R_TessTrianglesList_100:
	mov edx, [ebp-0x1c]
	mov [ebp-0x50], edx
	mov [ebp-0x4c], edi
	mov ecx, [ebp-0x24]
	mov [ebp-0x44], ecx
	mov eax, [ebp-0x20]
	mov [ebp-0x48], eax
	mov edx, [ebp-0x28]
	mov [esp+0x14], edx
	mov eax, [ebp-0x50]
	mov edx, [ebp-0x4c]
	mov [esp+0xc], eax
	mov [esp+0x10], edx
	mov edx, [ebp-0x48]
	mov ecx, [ebp-0x44]
	mov [esp+0x4], edx
	mov [esp+0x8], ecx
	mov [esp], ebx
	call R_DrawBspDrawSurfsLit
	mov eax, 0x1
	add esp, 0x8c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_TessTrianglesList_90:
	mov eax, rgp
	mov eax, [eax+0x2008]
	jmp R_TessTrianglesList_110


;R_TessParticleCloudList(GfxDrawSurfListArgs const*, GfxCmdBufContext)
R_TessParticleCloudList:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0xbc
	mov dword [ebp-0x88], 0x0
	mov dword [ebp-0x84], 0x0
	mov dword [ebp-0x90], 0x0
	mov dword [ebp-0x8c], 0x0
	mov dword [ebp-0x98], 0x0
	mov dword [ebp-0x94], 0x0
	mov eax, [ebp+0x8]
	mov edx, [eax]
	mov ecx, [eax+0x4]
	mov [ebp-0xa0], edx
	mov [ebp-0x9c], ecx
	mov [ebp-0x7c], ecx
	mov edi, edx
	mov edx, [eax+0xc]
	mov ecx, [eax+0x8]
	mov eax, [edx]
	movzx eax, word [eax+ecx*8]
	shl eax, 0x6
	mov edx, [edi+0xca8]
	lea eax, [eax+edx+0x6c000]
	mov [ebp-0x80], eax
	movss xmm0, dword [eax+0x30]
	ucomiss xmm0, [eax+0x34]
	jp R_TessParticleCloudList_10
	jnz R_TessParticleCloudList_10
	mov ecx, eax
R_TessParticleCloudList_160:
	movss [ebp-0x4c], xmm0
	xor eax, eax
	mov [ebp-0x48], eax
R_TessParticleCloudList_150:
	mov edx, [ecx+0x34]
	mov [ebp-0x44], eax
	mov [ebp-0x40], edx
	mov esi, edx
	mov ebx, eax
	mov ecx, eax
R_TessParticleCloudList_180:
	lea edx, [edi+0xbd0]
	mov eax, [ebp-0x4c]
	mov [edi+0xbd0], eax
	mov [edx+0x4], ecx
	mov [edx+0x8], ebx
	mov [edx+0xc], esi
	add word [edi+0xe9a], 0x1
	mov ecx, [ebp-0x80]
	add ecx, 0x2c
	movzx eax, byte [ecx+0x1]
	cvtsi2ss xmm4, eax
	movss xmm1, dword [_float_0_00392157]
	mulss xmm4, xmm1
	mov edx, [ebp-0x80]
	movzx eax, byte [edx+0x2c]
	cvtsi2ss xmm3, eax
	mulss xmm3, xmm1
	movzx eax, byte [ecx+0x3]
	cvtsi2ss xmm2, eax
	mulss xmm2, xmm1
	lea edx, [edi+0x990]
	movzx eax, byte [ecx+0x2]
	cvtsi2ss xmm0, eax
	mulss xmm0, xmm1
	movss [edi+0x990], xmm0
	movss [edx+0x4], xmm4
	movss [edx+0x8], xmm3
	movss [edx+0xc], xmm2
	add word [edi+0xe52], 0x1
	mov ecx, [ebp-0x7c]
	mov [ebp-0x94], ecx
	mov [ebp-0x98], edi
	mov eax, [ebp-0x98]
	mov edx, [ebp-0x94]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPixelShaderArgs
	mov dword [esp+0x4], 0x0
	mov [esp], edi
	call R_ChangeDepthHackNearClip
	mov ebx, [ebp-0x7c]
	add ebx, 0x90
	mov dword [ebx+0x8], 0xe
	mov edx, [ebp-0x7c]
	mov [esp], edx
	call R_UpdateVertexDecl
	mov ecx, [ebp-0x7c]
	mov [ebp-0x9c], ecx
	mov [ebp-0xa0], edi
	cmp dword [edi+0xf34], 0x1
	sbb edx, edx
	cmp edx, [ecx+0xcc]
	jz R_TessParticleCloudList_20
	mov [esp+0x4], edx
	mov [esp], ecx
	call R_ChangeDepthRange
R_TessParticleCloudList_20:
	mov esi, gfxBuf
	mov ecx, [esi+0x78]
	cmp ecx, [ebx+0x4]
	jz R_TessParticleCloudList_30
	mov [ebx+0x4], ecx
	mov edx, [ebp-0x7c]
	mov eax, [edx+0x90]
	mov edx, [eax]
	mov [esp+0x4], ecx
	mov [esp], eax
	call dword [edx+0x1a0]
R_TessParticleCloudList_30:
	mov ecx, [esi+0x74]
	cmp ecx, [ebx+0x10]
	jz R_TessParticleCloudList_40
R_TessParticleCloudList_70:
	mov [ebx+0x10], ecx
	mov dword [ebx+0x14], 0x0
	mov dword [ebx+0xc], 0x14
	mov eax, [ebx]
	mov edx, [eax]
	mov dword [esp+0x10], 0x14
	mov dword [esp+0xc], 0x0
	mov [esp+0x8], ecx
	mov dword [esp+0x4], 0x0
	mov [esp], eax
	call dword [edx+0x190]
R_TessParticleCloudList_80:
	mov eax, [ebx+0x1c]
	test eax, eax
	jz R_TessParticleCloudList_50
R_TessParticleCloudList_90:
	mov dword [ebx+0x1c], 0x0
	mov dword [ebx+0x20], 0x0
	mov dword [ebx+0x18], 0x0
	mov eax, [ebx]
	mov edx, [eax]
	mov dword [esp+0x10], 0x0
	mov dword [esp+0xc], 0x0
	mov dword [esp+0x8], 0x0
	mov dword [esp+0x4], 0x1
	mov [esp], eax
	call dword [edx+0x190]
R_TessParticleCloudList_100:
	mov ecx, [ebp-0x80]
	cmp ecx, [edi+0xf08]
	jz R_TessParticleCloudList_60
	mov [esp+0x4], ecx
	mov [esp], edi
	call R_ChangeObjectPlacement
R_TessParticleCloudList_60:
	mov edx, [ebp-0x7c]
	mov [ebp-0x8c], edx
	mov [ebp-0x90], edi
	mov eax, [ebp-0x90]
	mov edx, [ebp-0x8c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerObjectArgs
	mov edx, [ebp-0x7c]
	mov [ebp-0x84], edx
	mov [ebp-0x88], edi
	mov eax, [ebp-0x88]
	mov edx, [ebp-0x84]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerPrimArgs
	mov dword [ebp-0x1c], 0x0
	mov dword [ebp-0x24], 0x1000
	mov dword [ebp-0x20], 0x800
	lea eax, [ebp-0x24]
	mov [esp+0x4], eax
	mov [esp], ebx
	call R_DrawIndexedPrimitive
	mov eax, 0x1
	add esp, 0xbc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_TessParticleCloudList_40:
	mov eax, [ebx+0x14]
	test eax, eax
	jnz R_TessParticleCloudList_70
	cmp dword [ebx+0xc], 0x14
	jnz R_TessParticleCloudList_70
	jmp R_TessParticleCloudList_80
R_TessParticleCloudList_50:
	mov eax, [ebx+0x20]
	test eax, eax
	jnz R_TessParticleCloudList_90
	mov eax, [ebx+0x18]
	test eax, eax
	jz R_TessParticleCloudList_100
	jmp R_TessParticleCloudList_90
R_TessParticleCloudList_10:
	mov esi, eax
	add esi, 0x20
	mov ebx, eax
	add ebx, 0x10
	mov dword [esp+0xc], 0x3
	mov dword [esp+0x8], 0x3a83126f
	mov [esp+0x4], esi
	mov [esp], ebx
	call VecNCompareCustomEpsilon
	test eax, eax
	jnz R_TessParticleCloudList_110
	mov eax, [ebp-0x80]
	movss xmm2, dword [eax+0x20]
	subss xmm2, [eax+0x10]
	movss xmm3, dword [esi+0x4]
	subss xmm3, [ebx+0x4]
	movss xmm4, dword [esi+0x8]
	subss xmm4, [ebx+0x8]
	movaps xmm0, xmm2
	mulss xmm0, xmm2
	movaps xmm1, xmm3
	mulss xmm1, xmm3
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mulss xmm1, xmm4
	addss xmm0, xmm1
	sqrtss xmm1, xmm0
	movaps xmm0, xmm1
	xorps xmm0, [_data16_80000000]
	ucomiss xmm0, [_float_0_00000000]
	jb R_TessParticleCloudList_120
	movss xmm5, dword [_float_1_00000000]
R_TessParticleCloudList_190:
	mov eax, [ebp-0x80]
	movss xmm0, dword [eax+0x34]
	mulss xmm2, xmm5
	mulss xmm2, xmm0
	movss [ebp-0x30], xmm2
	mulss xmm3, xmm5
	mulss xmm3, xmm0
	movss [ebp-0x2c], xmm3
	mulss xmm4, xmm5
	mulss xmm4, xmm0
	movss [ebp-0x28], xmm4
	lea edx, [edi+0xcb0]
	mov ebx, [edx+0x8]
	mov ecx, [edx+0x4]
	mov eax, [edi+0xcb0]
	mov [ebp-0x70], eax
	lea esi, [ebp-0x70]
	mov [ebp-0x6c], ecx
	mov [ebp-0x68], ebx
	mov ebx, [edx+0x18]
	mov ecx, [edx+0x14]
	mov eax, [edx+0x10]
	mov [ebp-0x64], eax
	mov [ebp-0x60], ecx
	mov [ebp-0x5c], ebx
	mov ebx, [edx+0x28]
	mov ecx, [edx+0x24]
	mov eax, [edx+0x20]
	mov [ebp-0x58], eax
	mov [ebp-0x54], ecx
	mov [ebp-0x50], ebx
	lea eax, [ebp-0x3c]
	mov [esp+0x8], eax
	mov [esp+0x4], esi
	lea eax, [ebp-0x30]
	mov [esp], eax
	call Vec3RotateTranspose
	movss xmm2, dword [ebp-0x3c]
	ucomiss xmm2, [_float_0_00100000]
	jae R_TessParticleCloudList_130
	jp R_TessParticleCloudList_130
	movss xmm1, dword [ebp-0x38]
	movss xmm0, dword [_float_0_00100000]
	ucomiss xmm0, xmm1
	jbe R_TessParticleCloudList_140
	mov edx, [ebp-0x80]
	mov eax, [edx+0x30]
	mov [ebp-0x4c], eax
	xor eax, eax
	mov [ebp-0x48], eax
	mov ecx, edx
	jmp R_TessParticleCloudList_150
R_TessParticleCloudList_110:
	mov ecx, [ebp-0x80]
	movss xmm0, dword [ecx+0x30]
	jmp R_TessParticleCloudList_160
R_TessParticleCloudList_130:
	movss xmm1, dword [ebp-0x38]
R_TessParticleCloudList_140:
	movss [ebp-0x4c], xmm1
	movaps xmm0, xmm2
	xorps xmm0, [_data16_80000000]
	movss [ebp-0x48], xmm0
	movss [ebp-0x44], xmm2
	movss [ebp-0x40], xmm1
	mulss xmm1, xmm1
	mulss xmm0, xmm0
	addss xmm1, xmm0
	sqrtss xmm2, xmm1
	mov eax, [ebp-0x80]
	movss xmm0, dword [eax+0x30]
	divss xmm0, xmm2
	movaps xmm1, xmm0
	mulss xmm1, [ebp-0x4c]
	movss [ebp-0x4c], xmm1
	mulss xmm0, [ebp-0x48]
	movss [ebp-0x48], xmm0
	movss xmm0, dword [eax+0x30]
	ucomiss xmm0, xmm2
	ja R_TessParticleCloudList_170
	mov esi, [ebp-0x40]
	mov ebx, [ebp-0x44]
	mov ecx, [ebp-0x48]
	jmp R_TessParticleCloudList_180
R_TessParticleCloudList_170:
	divss xmm0, xmm2
	movaps xmm1, xmm0
	mulss xmm1, [ebp-0x44]
	movss [ebp-0x44], xmm1
	mulss xmm0, [ebp-0x40]
	movss [ebp-0x40], xmm0
	mov esi, [ebp-0x40]
	mov ebx, [ebp-0x44]
	mov ecx, [ebp-0x48]
	jmp R_TessParticleCloudList_180
R_TessParticleCloudList_120:
	movss xmm5, dword [_float_1_00000000]
	divss xmm5, xmm1
	jmp R_TessParticleCloudList_190


;R_TessTrianglesPreTessList(GfxDrawSurfListArgs const*, GfxCmdBufContext)
R_TessTrianglesPreTessList:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x3c
	mov dword [ebp-0x30], 0x0
	mov dword [ebp-0x2c], 0x0
	mov dword [ebp-0x38], 0x0
	mov dword [ebp-0x34], 0x0
	mov ecx, [ebp+0x8]
	mov ebx, [ecx]
	mov esi, [ecx+0x4]
	mov [ebp-0x20], esi
	mov [ebp-0x1c], ebx
	mov ecx, [ecx+0xc]
	mov [ebp-0x24], ecx
	mov [esp], ebx
	mov [esp+0x4], esi
	call R_SetupPassPixelShaderArgs
	mov eax, [ebp-0x24]
	mov eax, [eax+0x8]
	mov [ebp-0x28], eax
	mov eax, rg
	add eax, 0x2244
	mov edx, [ebp-0x1c]
	cmp [edx+0xf08], eax
	jz R_TessTrianglesPreTessList_10
	mov [esp+0x4], eax
	mov [esp], ebx
	call R_ChangeObjectPlacement
R_TessTrianglesPreTessList_10:
	mov dword [esp+0x4], 0x0
	mov [esp], ebx
	call R_ChangeDepthHackNearClip
	mov ecx, [ebp-0x20]
	mov eax, [ecx+0xc0]
	test byte [eax+0x4], 0x8
	jnz R_TessTrianglesPreTessList_20
	mov eax, 0x2
	mov edi, [ebp-0x20]
R_TessTrianglesPreTessList_60:
	add edi, 0x90
	mov [edi+0x8], eax
	mov ecx, [ebp-0x20]
	mov [esp], ecx
	call R_UpdateVertexDecl
	mov esi, [ebp-0x20]
	mov ebx, [ebp-0x1c]
	cmp dword [ebx+0xf34], 0x1
	sbb edx, edx
	cmp edx, [esi+0xcc]
	jz R_TessTrianglesPreTessList_30
	mov [esp+0x4], edx
	mov [esp], esi
	call R_ChangeDepthRange
	mov ecx, [ebp-0x1c]
R_TessTrianglesPreTessList_70:
	mov ebx, [ecx+0xca8]
	mov ecx, [ebx+0x11e6a0]
	cmp ecx, [edi+0x4]
	jz R_TessTrianglesPreTessList_40
	mov [edi+0x4], ecx
	mov edx, [ebp-0x20]
	mov eax, [edx+0x90]
	mov edx, [eax]
	mov [esp+0x4], ecx
	mov [esp], eax
	call dword [edx+0x1a0]
R_TessTrianglesPreTessList_40:
	mov ecx, [ebp+0x8]
	mov eax, [ecx+0x8]
	mov ecx, [ebp-0x24]
	mov edx, [ecx]
	movzx eax, word [edx+eax*8]
	lea eax, [ebx+eax*4+0x28000]
	cmp dword [ebp-0x28], 0x7
	jz R_TessTrianglesPreTessList_50
	mov ecx, [ebp-0x20]
	mov [ebp-0x2c], ecx
	mov edx, [ebp-0x1c]
	mov [ebp-0x30], edx
	mov edx, [ebp-0x30]
	mov ecx, [ebp-0x2c]
	mov [esp+0x4], edx
	mov [esp+0x8], ecx
	mov [esp], eax
	call R_DrawBspDrawSurfsPreTess
	mov eax, 0x1
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_TessTrianglesPreTessList_20:
	mov eax, [ecx+0xb8]
	mov eax, [eax+0x40]
	movzx eax, byte [eax+0x4]
	add eax, 0x2
	mov edi, ecx
	jmp R_TessTrianglesPreTessList_60
R_TessTrianglesPreTessList_30:
	mov ecx, ebx
	jmp R_TessTrianglesPreTessList_70
R_TessTrianglesPreTessList_50:
	mov edx, [ebp-0x20]
	mov [ebp-0x34], edx
	mov ecx, [ebp-0x1c]
	mov [ebp-0x38], ecx
	mov edx, [ebp-0x38]
	mov ecx, [ebp-0x34]
	mov [esp+0x4], edx
	mov [esp+0x8], ecx
	mov [esp], eax
	call R_DrawBspDrawSurfsLitPreTess
	mov eax, 0x1
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


;R_TessStaticModelCachedList(GfxDrawSurfListArgs const*, GfxCmdBufContext)
R_TessStaticModelCachedList:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x3c
	mov dword [ebp-0x30], 0x0
	mov dword [ebp-0x2c], 0x0
	mov dword [ebp-0x38], 0x0
	mov dword [ebp-0x34], 0x0
	mov ecx, [ebp+0x8]
	mov ebx, [ecx]
	mov esi, [ecx+0x4]
	mov [ebp-0x1c], esi
	mov edi, ebx
	mov ecx, [ecx+0xc]
	mov [ebp-0x20], ecx
	mov [esp], ebx
	mov [esp+0x4], esi
	call R_SetupPassPixelShaderArgs
	mov eax, [ebp-0x20]
	mov eax, [eax+0x8]
	mov [ebp-0x24], eax
	mov dword [esp+0x4], 0x0
	mov [esp], ebx
	call R_ChangeDepthHackNearClip
	mov eax, rg
	add eax, 0x2244
	cmp [ebx+0xf08], eax
	jz R_TessStaticModelCachedList_10
	mov [esp+0x4], eax
	mov [esp], ebx
	call R_ChangeObjectPlacement
R_TessStaticModelCachedList_10:
	mov edx, [ebp-0x1c]
	mov dword [edx+0x98], 0xf
	mov [esp], esi
	call R_UpdateVertexDecl
	cmp dword [edi+0xf34], 0x1
	sbb eax, eax
	mov ecx, [ebp-0x1c]
	cmp eax, [ecx+0xcc]
	jz R_TessStaticModelCachedList_20
	mov [esp+0x4], eax
	mov [esp], esi
	call R_ChangeDepthRange
R_TessStaticModelCachedList_20:
	mov ecx, [edi+0xca8]
	add ecx, 0x28000
	mov edi, [ebp+0x8]
	mov edx, [edi+0x8]
	mov edi, [ebp-0x20]
	mov eax, [edi]
	movzx eax, word [eax+edx*8]
	lea eax, [ecx+eax*4]
	cmp dword [ebp-0x24], 0x7
	jz R_TessStaticModelCachedList_30
	mov [ebp-0x2c], esi
	mov [ebp-0x30], ebx
	mov edx, [ebp-0x30]
	mov ecx, [ebp-0x2c]
	mov [esp+0x4], edx
	mov [esp+0x8], ecx
	mov [esp], eax
	call R_DrawStaticModelCachedSurf
	mov eax, 0x1
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_TessStaticModelCachedList_30:
	mov [ebp-0x34], esi
	mov [ebp-0x38], ebx
	mov edx, [ebp-0x38]
	mov ecx, [ebp-0x34]
	mov [esp+0x4], edx
	mov [esp+0x8], ecx
	mov [esp], eax
	call R_DrawStaticModelCachedSurfLit
	mov eax, 0x1
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


;R_TessStaticModelPreTessList(GfxDrawSurfListArgs const*, GfxCmdBufContext)
R_TessStaticModelPreTessList:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x3c
	mov dword [ebp-0x30], 0x0
	mov dword [ebp-0x2c], 0x0
	mov dword [ebp-0x38], 0x0
	mov dword [ebp-0x34], 0x0
	mov ecx, [ebp+0x8]
	mov ebx, [ecx]
	mov esi, [ecx+0x4]
	mov [ebp-0x1c], esi
	mov edi, ebx
	mov ecx, [ecx+0xc]
	mov [ebp-0x20], ecx
	mov [esp], ebx
	mov [esp+0x4], esi
	call R_SetupPassPixelShaderArgs
	mov eax, [ebp-0x20]
	mov eax, [eax+0x8]
	mov [ebp-0x24], eax
	mov dword [esp+0x4], 0x0
	mov [esp], ebx
	call R_ChangeDepthHackNearClip
	mov eax, rg
	add eax, 0x2244
	cmp [ebx+0xf08], eax
	jz R_TessStaticModelPreTessList_10
	mov [esp+0x4], eax
	mov [esp], ebx
	call R_ChangeObjectPlacement
R_TessStaticModelPreTessList_10:
	mov edx, [ebp-0x1c]
	mov dword [edx+0x98], 0xf
	mov [esp], esi
	call R_UpdateVertexDecl
	cmp dword [edi+0xf34], 0x1
	sbb eax, eax
	mov ecx, [ebp-0x1c]
	cmp eax, [ecx+0xcc]
	jz R_TessStaticModelPreTessList_20
	mov [esp+0x4], eax
	mov [esp], esi
	call R_ChangeDepthRange
R_TessStaticModelPreTessList_20:
	mov ecx, [edi+0xca8]
	add ecx, 0x28000
	mov edi, [ebp+0x8]
	mov edx, [edi+0x8]
	mov edi, [ebp-0x20]
	mov eax, [edi]
	movzx eax, word [eax+edx*8]
	lea eax, [ecx+eax*4]
	cmp dword [ebp-0x24], 0x7
	jz R_TessStaticModelPreTessList_30
	mov [ebp-0x2c], esi
	mov [ebp-0x30], ebx
	mov edx, [ebp-0x30]
	mov ecx, [ebp-0x2c]
	mov [esp+0x4], edx
	mov [esp+0x8], ecx
	mov [esp], eax
	call R_DrawStaticModelPreTessSurf
	mov eax, 0x1
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_TessStaticModelPreTessList_30:
	mov [ebp-0x34], esi
	mov [ebp-0x38], ebx
	mov edx, [ebp-0x38]
	mov ecx, [ebp-0x34]
	mov [esp+0x4], edx
	mov [esp+0x8], ecx
	mov [esp], eax
	call R_DrawStaticModelPreTessSurfLit
	mov eax, 0x1
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


;R_TessXModelRigidDrawSurfList(GfxDrawSurfListArgs const*, GfxCmdBufContext)
R_TessXModelRigidDrawSurfList:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0xcc
	mov dword [ebp-0x40], 0x0
	mov dword [ebp-0x3c], 0x0
	mov dword [ebp-0x48], 0x0
	mov dword [ebp-0x44], 0x0
	mov dword [ebp-0x50], 0x0
	mov dword [ebp-0x4c], 0x0
	mov dword [ebp-0x58], 0x0
	mov dword [ebp-0x54], 0x0
	mov dword [ebp-0x60], 0x0
	mov dword [ebp-0x5c], 0x0
	mov dword [ebp-0x68], 0x0
	mov dword [ebp-0x64], 0x0
	mov dword [ebp-0x70], 0x0
	mov dword [ebp-0x6c], 0x0
	mov dword [ebp-0x78], 0x0
	mov dword [ebp-0x74], 0x0
	mov dword [ebp-0x80], 0x0
	mov dword [ebp-0x7c], 0x0
	mov dword [ebp-0x88], 0x0
	mov dword [ebp-0x84], 0x0
	mov dword [ebp-0x90], 0x0
	mov dword [ebp-0x8c], 0x0
	mov dword [ebp-0x98], 0x0
	mov dword [ebp-0x94], 0x0
	mov dword [ebp-0xa0], 0x0
	mov dword [ebp-0x9c], 0x0
	mov eax, [ebp+0x8]
	mov edx, [ebp+0xc]
	mov [ebp-0x1c], edx
	mov ecx, [ebp+0x10]
	mov [ebp-0x20], ecx
	mov ebx, [eax]
	mov esi, [eax+0x4]
	mov [ebp-0x24], esi
	mov edi, ebx
	mov ecx, [ebx+0xca8]
	mov edx, [eax+0xc]
	mov [ebp-0x28], edx
	mov edx, [edx+0x8]
	mov [ebp-0x2c], edx
	mov edx, [eax+0x8]
	mov eax, [ebp-0x28]
	mov eax, [eax+0x4]
	sub eax, edx
	mov [ebp-0x30], eax
	mov eax, [ebp-0x28]
	mov eax, [eax]
	lea edx, [eax+edx*8]
	mov [ebp-0x34], edx
	mov eax, [edx]
	mov edx, [edx+0x4]
	mov [ebp-0xa8], eax
	mov [ebp-0xa4], edx
	mov eax, s_manualObjectPlacement
	mov [ebx+0xf08], eax
	mov eax, [ebp-0x28]
	mov eax, [eax+0x24]
	test eax, eax
	jz R_TessXModelRigidDrawSurfList_10
	movzx eax, word [ebp-0xa8]
	movzx eax, word [ecx+eax*4+0xe]
	movzx edx, ax
	test ax, ax
	jnz R_TessXModelRigidDrawSurfList_20
	xor ebx, ebx
	xor eax, eax
R_TessXModelRigidDrawSurfList_100:
	mov [esp+0x4], eax
	mov [esp], edi
	call R_UpdateMaterialTime
	mov esi, eax
	mov edx, [ebp-0x24]
	mov [ebp-0x9c], edx
	mov [ebp-0xa0], edi
	mov eax, [ebp-0xa0]
	mov edx, [ebp-0x9c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPixelShaderArgs
	test esi, esi
	jnz R_TessXModelRigidDrawSurfList_30
R_TessXModelRigidDrawSurfList_120:
	mov [esp+0x4], ebx
	mov [esp], edi
	call R_ChangeDepthHackNearClip
	mov edx, [ebp-0x24]
	mov dword [edx+0x98], 0x1
	mov [esp], edx
	call R_UpdateVertexDecl
	mov ecx, [ebp-0x24]
	cmp ebx, [ecx+0xcc]
	jz R_TessXModelRigidDrawSurfList_40
	mov [esp+0x4], ebx
	mov [esp], ecx
	call R_ChangeDepthRange
R_TessXModelRigidDrawSurfList_40:
	cmp dword [ebp-0x2c], 0x7
	jnz R_TessXModelRigidDrawSurfList_50
	mov eax, sc_enable
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jnz R_TessXModelRigidDrawSurfList_60
R_TessXModelRigidDrawSurfList_130:
	mov eax, rgp
	mov eax, [eax+0x2008]
R_TessXModelRigidDrawSurfList_140:
	mov [edi+0xc60], eax
	mov eax, [ebp-0x20]
	test eax, eax
	jz R_TessXModelRigidDrawSurfList_70
	mov eax, [ebp-0x1c]
	mov [ebp-0x90], eax
	mov edx, [ebp-0x20]
	mov [ebp-0x8c], edx
	mov eax, [ebp-0x90]
	mov edx, [ebp-0x8c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPixelShaderArgs
	test esi, esi
	jnz R_TessXModelRigidDrawSurfList_80
R_TessXModelRigidDrawSurfList_160:
	mov edx, [ebp-0x20]
	mov dword [edx+0x98], 0x1
	mov [esp], edx
	call R_UpdateVertexDecl
	mov ecx, [ebp-0x20]
	cmp ebx, [ecx+0xcc]
	jz R_TessXModelRigidDrawSurfList_90
	mov [esp+0x4], ebx
	mov [esp], ecx
	call R_ChangeDepthRange
	mov edx, [ebp-0x20]
R_TessXModelRigidDrawSurfList_150:
	mov eax, [ebp-0x1c]
	mov [ebp-0x80], eax
	mov [ebp-0x7c], edx
	mov eax, [ebp-0x80]
	mov edx, [ebp-0x7c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerObjectArgs
R_TessXModelRigidDrawSurfList_70:
	mov edx, [ebp-0x24]
	mov [ebp-0x74], edx
	mov [ebp-0x78], edi
	mov eax, [ebp-0x78]
	mov edx, [ebp-0x74]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerObjectArgs
	mov edx, [ebp-0x1c]
	mov [ebp-0x70], edx
	mov ecx, [ebp-0x20]
	mov [ebp-0x6c], ecx
	mov eax, [ebp-0x24]
	mov [ebp-0x64], eax
	mov [ebp-0x68], edi
	mov edx, [ebp-0x28]
	mov [esp+0x18], edx
	mov eax, [ebp-0x70]
	mov edx, [ebp-0x6c]
	mov [esp+0x10], eax
	mov [esp+0x14], edx
	mov edx, [ebp-0x68]
	mov ecx, [ebp-0x64]
	mov [esp+0x8], edx
	mov [esp+0xc], ecx
	mov ecx, [ebp-0x30]
	mov [esp+0x4], ecx
	mov eax, [ebp-0x34]
	mov [esp], eax
	call R_DrawXModelRigidSurfLit
	add esp, 0xcc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_TessXModelRigidDrawSurfList_20:
	lea eax, [ecx+edx*8+0x118260]
	mov ebx, [eax]
	and ebx, 0x2
	mov eax, [eax+0x4]
	jmp R_TessXModelRigidDrawSurfList_100
R_TessXModelRigidDrawSurfList_50:
	mov edx, [ebp-0x24]
	mov [ebp-0x5c], edx
	mov [ebp-0x60], edi
	mov eax, [ebp-0x60]
	mov edx, [ebp-0x5c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerObjectArgs
	mov edx, [ebp-0x24]
	mov [ebp-0x54], edx
	mov [ebp-0x58], edi
	mov ecx, [ebp-0x28]
	mov [esp+0x10], ecx
	mov eax, [ebp-0x58]
	mov edx, [ebp-0x54]
	mov [esp+0x8], eax
	mov [esp+0xc], edx
	mov edx, [ebp-0x30]
	mov [esp+0x4], edx
	mov ecx, [ebp-0x34]
	mov [esp], ecx
	call R_DrawXModelRigidSurfCamera
	add esp, 0xcc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_TessXModelRigidDrawSurfList_10:
	mov [ebp-0x4c], esi
	mov [ebp-0x50], ebx
	mov eax, [ebp-0x50]
	mov edx, [ebp-0x4c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPixelShaderArgs
	mov dword [esp+0x4], 0x0
	mov [esp], ebx
	call R_ChangeDepthHackNearClip
	mov edx, [ebp-0x24]
	mov dword [edx+0x98], 0x1
	mov [esp], esi
	call R_UpdateVertexDecl
	mov ecx, [ebp-0x24]
	cmp dword [ecx+0xcc], 0xffffffff
	jz R_TessXModelRigidDrawSurfList_110
	mov dword [esp+0x4], 0xffffffff
	mov [esp], esi
	call R_ChangeDepthRange
R_TessXModelRigidDrawSurfList_110:
	mov [ebp-0x44], esi
	mov [ebp-0x48], ebx
	mov eax, [ebp-0x48]
	mov edx, [ebp-0x44]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerObjectArgs
	mov [ebp-0x3c], esi
	mov [ebp-0x40], ebx
	mov edx, [ebp-0x28]
	mov [esp+0x10], edx
	mov eax, [ebp-0x40]
	mov edx, [ebp-0x3c]
	mov [esp+0x8], eax
	mov [esp+0xc], edx
	mov edx, [ebp-0x30]
	mov [esp+0x4], edx
	mov ecx, [ebp-0x34]
	mov [esp], ecx
	call R_DrawXModelRigidSurf
	add esp, 0xcc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_TessXModelRigidDrawSurfList_30:
	mov edx, [ebp-0x24]
	mov [ebp-0x94], edx
	mov [ebp-0x98], edi
	mov eax, [ebp-0x98]
	mov edx, [ebp-0x94]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassVertexShaderArgs
	jmp R_TessXModelRigidDrawSurfList_120
R_TessXModelRigidDrawSurfList_60:
	test dword [ebp-0xa8], 0x1f000000
	jz R_TessXModelRigidDrawSurfList_130
	mov eax, gfxRenderTargets
	mov eax, [eax+0x78]
	jmp R_TessXModelRigidDrawSurfList_140
R_TessXModelRigidDrawSurfList_90:
	mov edx, ecx
	jmp R_TessXModelRigidDrawSurfList_150
R_TessXModelRigidDrawSurfList_80:
	mov edx, [ebp-0x1c]
	mov [ebp-0x88], edx
	mov ecx, [ebp-0x20]
	mov [ebp-0x84], ecx
	mov eax, [ebp-0x88]
	mov edx, [ebp-0x84]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassVertexShaderArgs
	jmp R_TessXModelRigidDrawSurfList_160


;R_TessXModelSkinnedDrawSurfList(GfxDrawSurfListArgs const*, GfxCmdBufContext)
R_TessXModelSkinnedDrawSurfList:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x10c
	mov dword [ebp-0x80], 0x0
	mov dword [ebp-0x7c], 0x0
	mov dword [ebp-0x88], 0x0
	mov dword [ebp-0x84], 0x0
	mov dword [ebp-0x90], 0x0
	mov dword [ebp-0x8c], 0x0
	mov dword [ebp-0x98], 0x0
	mov dword [ebp-0x94], 0x0
	mov dword [ebp-0xa0], 0x0
	mov dword [ebp-0x9c], 0x0
	mov dword [ebp-0xa8], 0x0
	mov dword [ebp-0xa4], 0x0
	mov dword [ebp-0xb0], 0x0
	mov dword [ebp-0xac], 0x0
	mov dword [ebp-0xb8], 0x0
	mov dword [ebp-0xb4], 0x0
	mov dword [ebp-0xc0], 0x0
	mov dword [ebp-0xbc], 0x0
	mov dword [ebp-0xc8], 0x0
	mov dword [ebp-0xc4], 0x0
	mov dword [ebp-0xd0], 0x0
	mov dword [ebp-0xcc], 0x0
	mov dword [ebp-0xd8], 0x0
	mov dword [ebp-0xd4], 0x0
	mov dword [ebp-0xe0], 0x0
	mov dword [ebp-0xdc], 0x0
	mov dword [ebp-0xe8], 0x0
	mov dword [ebp-0xe4], 0x0
	mov dword [ebp-0xf0], 0x0
	mov dword [ebp-0xec], 0x0
	mov eax, [ebp+0x8]
	mov edx, [ebp+0xc]
	mov [ebp-0x3c], edx
	mov ecx, [ebp+0x10]
	mov [ebp-0x40], ecx
	mov edx, [eax]
	mov ecx, [eax+0x4]
	mov [ebp-0xf8], edx
	mov [ebp-0xf4], ecx
	mov [ebp-0x48], ecx
	mov [ebp-0x44], edx
	mov ecx, [edx+0xca8]
	mov [ebp-0x54], ecx
	mov ebx, [eax+0xc]
	mov edx, [ebx+0x8]
	mov [ebp-0x50], edx
	mov edx, [eax+0x8]
	mov ecx, [ebx+0x4]
	sub ecx, edx
	mov [ebp-0x70], ecx
	mov eax, [ebx]
	lea edx, [eax+edx*8]
	mov [ebp-0x74], edx
	mov esi, [edx]
	mov edi, [edx+0x4]
	mov eax, [ebp-0x44]
	add eax, 0xf14
	mov edx, [ebp-0x44]
	cmp eax, [edx+0xf08]
	jz R_TessXModelSkinnedDrawSurfList_10
	mov [esp+0x4], eax
	mov ecx, [ebp-0xf8]
	mov [esp], ecx
	call R_ChangeObjectPlacement
R_TessXModelSkinnedDrawSurfList_10:
	mov eax, [ebx+0x24]
	test eax, eax
	jz R_TessXModelSkinnedDrawSurfList_20
	movzx eax, si
	mov edx, [ebp-0x54]
	lea ebx, [edx+eax*4]
	movzx eax, word [ebx+0xe]
	movzx ecx, ax
	mov [ebp-0x20], ecx
	test ax, ax
	jnz R_TessXModelSkinnedDrawSurfList_30
	mov dword [ebp-0x5c], 0x0
	pxor xmm0, xmm0
	movss [ebp-0x58], xmm0
R_TessXModelSkinnedDrawSurfList_290:
	movss [esp+0x4], xmm0
	mov eax, [ebp-0x44]
	mov [esp], eax
	call R_UpdateMaterialTime
	mov [ebp-0x24], eax
	mov edx, [ebp-0x48]
	mov [ebp-0xec], edx
	mov ecx, [ebp-0x44]
	mov [ebp-0xf0], ecx
	mov eax, [ebp-0xf0]
	mov edx, [ebp-0xec]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPixelShaderArgs
	mov eax, [ebp-0x24]
	test eax, eax
	jnz R_TessXModelSkinnedDrawSurfList_40
R_TessXModelSkinnedDrawSurfList_410:
	mov edx, [ebp-0x5c]
	mov [esp+0x4], edx
	mov ecx, [ebp-0x44]
	mov [esp], ecx
	call R_ChangeDepthHackNearClip
	mov eax, [ebp-0x48]
	mov dword [eax+0x98], 0x1
	mov [esp], eax
	call R_UpdateVertexDecl
	mov ecx, [ebp-0x5c]
	mov edx, [ebp-0x48]
	cmp ecx, [edx+0xcc]
	jz R_TessXModelSkinnedDrawSurfList_50
	mov [esp+0x4], ecx
	mov [esp], edx
	call R_ChangeDepthRange
R_TessXModelSkinnedDrawSurfList_50:
	cmp dword [ebp-0x50], 0x7
	jnz R_TessXModelSkinnedDrawSurfList_60
	mov eax, sc_enable
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_TessXModelSkinnedDrawSurfList_70
	test esi, 0x1f000000
	jz R_TessXModelSkinnedDrawSurfList_80
	mov eax, gfxRenderTargets
	mov eax, [eax+0x78]
R_TessXModelSkinnedDrawSurfList_430:
	mov edx, [ebp-0x44]
	mov [edx+0xc60], eax
R_TessXModelSkinnedDrawSurfList_380:
	mov eax, [ebp-0x48]
	mov [ebp-0xdc], eax
	mov edx, [ebp-0x44]
	mov [ebp-0xe0], edx
	mov eax, [ebp-0xe0]
	mov edx, [ebp-0xdc]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerObjectArgs
	mov eax, [ebp-0x40]
	test eax, eax
	jz R_TessXModelSkinnedDrawSurfList_90
	mov edx, [ebp-0x3c]
	mov [ebp-0xd8], edx
	mov ecx, [ebp-0x40]
	mov [ebp-0xd4], ecx
	mov eax, [ebp-0xd8]
	mov edx, [ebp-0xd4]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPixelShaderArgs
	mov ecx, [ebp-0x24]
	test ecx, ecx
	jnz R_TessXModelSkinnedDrawSurfList_100
R_TessXModelSkinnedDrawSurfList_440:
	mov edx, [ebp-0x40]
	mov dword [edx+0x98], 0x1
	mov [esp], edx
	call R_UpdateVertexDecl
	mov eax, [ebp-0x5c]
	mov ecx, [ebp-0x40]
	cmp eax, [ecx+0xcc]
	jz R_TessXModelSkinnedDrawSurfList_110
	mov [esp+0x4], eax
	mov [esp], ecx
	call R_ChangeDepthRange
	mov ecx, [ebp-0x40]
R_TessXModelSkinnedDrawSurfList_110:
	mov edx, [ebp-0x3c]
	mov [ebp-0xc8], edx
	mov [ebp-0xc4], ecx
	mov eax, [ebp-0xc8]
	mov edx, [ebp-0xc4]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerObjectArgs
	mov edx, [ebp-0x3c]
	mov [ebp-0xc0], edx
	mov ecx, [ebp-0x40]
	mov [ebp-0xbc], ecx
	mov eax, [ebp-0xc0]
	mov edx, [ebp-0xbc]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerPrimArgs
R_TessXModelSkinnedDrawSurfList_90:
	mov dword [ebp-0x100], 0xffffffff
	mov dword [ebp-0xfc], 0xffffffff
	mov word [ebp-0x100], 0x0
	and dword [ebp-0x100], 0xff00ffff
	mov edx, [ebp-0x100]
	and edx, esi
	mov [ebp-0x30], edx
	mov ecx, [ebp-0xfc]
	and ecx, edi
	mov [ebp-0x2c], ecx
	mov dword [ebp-0x6c], 0x0
R_TessXModelSkinnedDrawSurfList_170:
	mov edx, [ebp-0x40]
	test edx, edx
	jz R_TessXModelSkinnedDrawSurfList_120
	mov eax, [ebp-0x3c]
	mov [ebp+0xc], eax
	mov edx, [ebp-0x40]
	mov [ebp+0x10], edx
	mov eax, [ebx]
	test eax, eax
	js R_TessXModelSkinnedDrawSurfList_130
	mov ecx, ebx
	mov eax, [ebp+0xc]
	mov edx, [ebp+0x10]
	call R_DrawXModelSkinnedCached
R_TessXModelSkinnedDrawSurfList_120:
	mov ecx, [ebp-0x44]
	mov [esp+0x4], ecx
	movzx eax, word [ebx+0x10]
	mov [esp], eax
	call R_SetModelLightingCoordsForSource
	mov ecx, esi
	shr ecx, 0x10
	movzx eax, cl
	mov ecx, [ebp-0x48]
	mov [ebp-0xb4], ecx
	mov ecx, [ebp-0x44]
	mov [ebp-0xb8], ecx
	mov [esp+0x8], eax
	mov eax, [ebp-0xb8]
	mov edx, [ebp-0xb4]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetReflectionProbe
	mov edx, [ebp-0x48]
	mov [ebp-0xac], edx
	mov ecx, [ebp-0x44]
	mov [ebp-0xb0], ecx
	mov eax, [ebp-0xb0]
	mov edx, [ebp-0xac]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerPrimArgs
	mov edx, [ebp-0x48]
	mov [ebp-0xf4], edx
	mov ecx, [ebp-0x44]
	mov [ebp-0xf8], ecx
	mov eax, [ebx]
	test eax, eax
	js R_TessXModelSkinnedDrawSurfList_140
	mov ecx, ebx
	mov eax, [ebp-0xf8]
	mov edx, [ebp-0xf4]
	call R_DrawXModelSkinnedCached
R_TessXModelSkinnedDrawSurfList_400:
	add dword [ebp-0x6c], 0x1
	mov eax, [ebp-0x6c]
	cmp [ebp-0x70], eax
	jz R_TessXModelSkinnedDrawSurfList_150
	mov ecx, [ebp-0x74]
	mov esi, [ecx+eax*8]
	mov edi, [ecx+eax*8+0x4]
	mov eax, [ebp-0x100]
	and eax, esi
	mov edx, [ebp-0xfc]
	and edx, edi
	mov ecx, [ebp-0x2c]
	xor ecx, edx
	xor eax, [ebp-0x30]
	or ecx, eax
	jnz R_TessXModelSkinnedDrawSurfList_160
	movzx eax, si
	mov edx, [ebp-0x54]
	lea ebx, [edx+eax*4]
	movzx eax, word [ebx+0xe]
	movzx edx, ax
	cmp [ebp-0x20], edx
	jz R_TessXModelSkinnedDrawSurfList_170
	test ax, ax
	jz R_TessXModelSkinnedDrawSurfList_180
	mov ecx, [ebp-0x54]
	lea edx, [ecx+edx*8+0x118260]
	mov eax, [edx]
	and eax, 0x2
	cmp [ebp-0x5c], eax
	jnz R_TessXModelSkinnedDrawSurfList_160
	movss xmm0, dword [ebp-0x58]
	ucomiss xmm0, [edx+0x4]
	jp R_TessXModelSkinnedDrawSurfList_160
R_TessXModelSkinnedDrawSurfList_390:
	jz R_TessXModelSkinnedDrawSurfList_170
R_TessXModelSkinnedDrawSurfList_160:
	mov eax, [ebp-0x6c]
R_TessXModelSkinnedDrawSurfList_150:
	add esp, 0x10c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_TessXModelSkinnedDrawSurfList_20:
	movzx eax, si
	mov edx, [ebp-0x54]
	lea ebx, [edx+eax*4]
	movzx eax, word [ebx+0xe]
	movzx ecx, ax
	mov [ebp-0x60], ecx
	test ax, ax
	jnz R_TessXModelSkinnedDrawSurfList_190
	pxor xmm0, xmm0
	movss [ebp-0x1c], xmm0
R_TessXModelSkinnedDrawSurfList_280:
	movss [esp+0x4], xmm0
	mov eax, [ebp-0x44]
	mov [esp], eax
	call R_UpdateMaterialTime
	mov [ebp-0x4c], eax
	mov edx, [ebp-0x48]
	mov [ebp-0x94], edx
	mov ecx, [ebp-0x44]
	mov [ebp-0x98], ecx
	mov eax, [ebp-0x98]
	mov edx, [ebp-0x94]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPixelShaderArgs
	mov eax, [ebp-0x4c]
	test eax, eax
	jnz R_TessXModelSkinnedDrawSurfList_200
R_TessXModelSkinnedDrawSurfList_420:
	mov dword [esp+0x4], 0x0
	mov edx, [ebp-0x44]
	mov [esp], edx
	call R_ChangeDepthHackNearClip
	mov ecx, [ebp-0x48]
	mov dword [ecx+0x98], 0x1
	mov [esp], ecx
	call R_UpdateVertexDecl
	mov eax, [ebp-0x48]
	cmp dword [eax+0xcc], 0xffffffff
	jz R_TessXModelSkinnedDrawSurfList_210
	mov dword [esp+0x4], 0xffffffff
	mov [esp], eax
	call R_ChangeDepthRange
	mov edx, [ebp-0x48]
R_TessXModelSkinnedDrawSurfList_370:
	mov [ebp-0x84], edx
	mov ecx, [ebp-0x44]
	mov [ebp-0x88], ecx
	mov eax, [ebp-0x88]
	mov edx, [ebp-0x84]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerObjectArgs
	mov edx, [ebp-0x48]
	mov [ebp-0x7c], edx
	mov ecx, [ebp-0x44]
	mov [ebp-0x80], ecx
	mov eax, [ebp-0x80]
	mov edx, [ebp-0x7c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerPrimArgs
	mov dword [ebp-0x100], 0xffffffff
	mov dword [ebp-0xfc], 0xffffffff
	mov word [ebp-0x100], 0x0
	and dword [ebp-0x100], 0xff00ffff
	and dword [ebp-0x100], 0xe0ffffff
	mov edx, [ebp-0x100]
	and edx, esi
	mov [ebp-0x68], edx
	mov ecx, [ebp-0xfc]
	and ecx, edi
	mov [ebp-0x64], ecx
	mov dword [ebp-0x6c], 0x0
R_TessXModelSkinnedDrawSurfList_240:
	mov eax, [ebp-0x48]
	mov [ebp-0xf4], eax
	mov edx, [ebp-0x44]
	mov [ebp-0xf8], edx
	mov edi, [ebx]
	test edi, edi
	js R_TessXModelSkinnedDrawSurfList_220
R_TessXModelSkinnedDrawSurfList_260:
	mov ecx, ebx
	mov eax, [ebp-0xf8]
	mov edx, [ebp-0xf4]
	call R_DrawXModelSkinnedCached
	add dword [ebp-0x6c], 0x1
	mov ecx, [ebp-0x6c]
	cmp [ebp-0x70], ecx
	jz R_TessXModelSkinnedDrawSurfList_230
R_TessXModelSkinnedDrawSurfList_270:
	mov edx, [ebp-0x74]
	mov esi, [edx+ecx*8]
	mov edi, [edx+ecx*8+0x4]
	mov eax, [ebp-0x100]
	and eax, esi
	mov edx, [ebp-0xfc]
	and edx, edi
	mov ecx, [ebp-0x64]
	xor ecx, edx
	xor eax, [ebp-0x68]
	or ecx, eax
	jnz R_TessXModelSkinnedDrawSurfList_160
	movzx eax, si
	mov ecx, [ebp-0x54]
	lea ebx, [ecx+eax*4]
	movzx eax, word [ebx+0xe]
	movzx edx, ax
	cmp [ebp-0x60], edx
	jz R_TessXModelSkinnedDrawSurfList_240
	test ax, ax
	jz R_TessXModelSkinnedDrawSurfList_250
	movss xmm0, dword [ebp-0x1c]
	ucomiss xmm0, [ecx+edx*8+0x118264]
	jp R_TessXModelSkinnedDrawSurfList_160
R_TessXModelSkinnedDrawSurfList_300:
	jnz R_TessXModelSkinnedDrawSurfList_160
	mov eax, [ebp-0x48]
	mov [ebp-0xf4], eax
	mov edx, [ebp-0x44]
	mov [ebp-0xf8], edx
	mov edi, [ebx]
	test edi, edi
	jns R_TessXModelSkinnedDrawSurfList_260
R_TessXModelSkinnedDrawSurfList_220:
	mov eax, [ebx+0x14]
	mov ecx, [ebx+0x4]
	mov [esp], eax
	mov eax, [ebp-0xf8]
	mov edx, [ebp-0xf4]
	call R_DrawXModelSkinnedUncached
	add dword [ebp-0x6c], 0x1
	mov ecx, [ebp-0x6c]
	cmp [ebp-0x70], ecx
	jnz R_TessXModelSkinnedDrawSurfList_270
R_TessXModelSkinnedDrawSurfList_230:
	mov eax, ecx
	add esp, 0x10c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_TessXModelSkinnedDrawSurfList_190:
	movss xmm0, dword [edx+ecx*8+0x118264]
	movss [ebp-0x1c], xmm0
	jmp R_TessXModelSkinnedDrawSurfList_280
R_TessXModelSkinnedDrawSurfList_30:
	mov edx, ecx
	mov ecx, [ebp-0x54]
	lea eax, [ecx+edx*8+0x118260]
	mov edx, [eax]
	and edx, 0x2
	mov [ebp-0x5c], edx
	movss xmm0, dword [eax+0x4]
	movss [ebp-0x58], xmm0
	jmp R_TessXModelSkinnedDrawSurfList_290
R_TessXModelSkinnedDrawSurfList_250:
	movss xmm0, dword [ebp-0x1c]
	ucomiss xmm0, [_float_0_00000000]
	jnp R_TessXModelSkinnedDrawSurfList_300
	jmp R_TessXModelSkinnedDrawSurfList_160
R_TessXModelSkinnedDrawSurfList_60:
	mov eax, [ebp-0x48]
	mov [ebp-0xa4], eax
	mov edx, [ebp-0x44]
	mov [ebp-0xa8], edx
	mov eax, [ebp-0xa8]
	mov edx, [ebp-0xa4]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerObjectArgs
	mov edx, [ebp-0x48]
	mov [ebp-0x9c], edx
	mov ecx, [ebp-0x44]
	mov [ebp-0xa0], ecx
	mov eax, [ebp-0xa0]
	mov edx, [ebp-0x9c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerPrimArgs
	mov dword [ebp-0x100], 0xffffffff
	mov dword [ebp-0xfc], 0xffffffff
	mov word [ebp-0x100], 0x0
	and dword [ebp-0x100], 0xff00ffff
	and dword [ebp-0x100], 0xe0ffffff
	mov edx, [ebp-0x100]
	and edx, esi
	mov [ebp-0x38], edx
	mov ecx, [ebp-0xfc]
	and ecx, edi
	mov [ebp-0x34], ecx
	mov dword [ebp-0x6c], 0x0
R_TessXModelSkinnedDrawSurfList_320:
	mov eax, [ebp-0x48]
	mov [ebp-0xf4], eax
	mov edx, [ebp-0x44]
	mov [ebp-0xf8], edx
	mov eax, [ebx]
	test eax, eax
	js R_TessXModelSkinnedDrawSurfList_310
R_TessXModelSkinnedDrawSurfList_340:
	mov ecx, ebx
	mov eax, [ebp-0xf8]
	mov edx, [ebp-0xf4]
	call R_DrawXModelSkinnedCached
R_TessXModelSkinnedDrawSurfList_350:
	add dword [ebp-0x6c], 0x1
	mov ecx, [ebp-0x6c]
	cmp [ebp-0x70], ecx
	jz R_TessXModelSkinnedDrawSurfList_230
	mov edx, [ebp-0x74]
	mov esi, [edx+ecx*8]
	mov edi, [edx+ecx*8+0x4]
	mov eax, [ebp-0x100]
	and eax, esi
	mov edx, [ebp-0xfc]
	and edx, edi
	mov ecx, [ebp-0x34]
	xor ecx, edx
	xor eax, [ebp-0x38]
	or ecx, eax
	jnz R_TessXModelSkinnedDrawSurfList_160
	movzx eax, si
	mov ecx, [ebp-0x54]
	lea ebx, [ecx+eax*4]
	movzx eax, word [ebx+0xe]
	movzx edx, ax
	cmp [ebp-0x20], edx
	jz R_TessXModelSkinnedDrawSurfList_320
	test ax, ax
	jz R_TessXModelSkinnedDrawSurfList_330
	lea edx, [ecx+edx*8+0x118260]
	mov eax, [edx]
	and eax, 0x2
	cmp [ebp-0x5c], eax
	jnz R_TessXModelSkinnedDrawSurfList_160
	movss xmm0, dword [ebp-0x58]
	ucomiss xmm0, [edx+0x4]
	jp R_TessXModelSkinnedDrawSurfList_160
R_TessXModelSkinnedDrawSurfList_360:
	jnz R_TessXModelSkinnedDrawSurfList_160
	mov eax, [ebp-0x48]
	mov [ebp-0xf4], eax
	mov edx, [ebp-0x44]
	mov [ebp-0xf8], edx
	mov eax, [ebx]
	test eax, eax
	jns R_TessXModelSkinnedDrawSurfList_340
R_TessXModelSkinnedDrawSurfList_310:
	mov eax, [ebx+0x14]
	mov ecx, [ebx+0x4]
	mov [esp], eax
	mov eax, [ebp-0xf8]
	mov edx, [ebp-0xf4]
	call R_DrawXModelSkinnedUncached
	jmp R_TessXModelSkinnedDrawSurfList_350
R_TessXModelSkinnedDrawSurfList_330:
	mov eax, [ebp-0x5c]
	test eax, eax
	jnz R_TessXModelSkinnedDrawSurfList_160
	movss xmm0, dword [ebp-0x58]
	ucomiss xmm0, [_float_0_00000000]
	jnp R_TessXModelSkinnedDrawSurfList_360
	jmp R_TessXModelSkinnedDrawSurfList_160
R_TessXModelSkinnedDrawSurfList_210:
	mov edx, eax
	jmp R_TessXModelSkinnedDrawSurfList_370
R_TessXModelSkinnedDrawSurfList_70:
	mov eax, rgp
	mov eax, [eax+0x2008]
	mov ecx, [ebp-0x44]
	mov [ecx+0xc60], eax
	jmp R_TessXModelSkinnedDrawSurfList_380
R_TessXModelSkinnedDrawSurfList_180:
	mov eax, [ebp-0x5c]
	test eax, eax
	jnz R_TessXModelSkinnedDrawSurfList_160
	movss xmm0, dword [ebp-0x58]
	ucomiss xmm0, [_float_0_00000000]
	jnp R_TessXModelSkinnedDrawSurfList_390
	jmp R_TessXModelSkinnedDrawSurfList_160
R_TessXModelSkinnedDrawSurfList_140:
	mov eax, [ebx+0x14]
	mov ecx, [ebx+0x4]
	mov [esp], eax
	mov eax, [ebp-0xf8]
	mov edx, [ebp-0xf4]
	call R_DrawXModelSkinnedUncached
	jmp R_TessXModelSkinnedDrawSurfList_400
R_TessXModelSkinnedDrawSurfList_130:
	mov eax, [ebx+0x14]
	mov ecx, [ebx+0x4]
	mov [esp], eax
	mov eax, [ebp+0xc]
	mov edx, [ebp+0x10]
	call R_DrawXModelSkinnedUncached
	jmp R_TessXModelSkinnedDrawSurfList_120
R_TessXModelSkinnedDrawSurfList_40:
	mov edx, [ebp-0x48]
	mov [ebp-0xe4], edx
	mov ecx, [ebp-0x44]
	mov [ebp-0xe8], ecx
	mov eax, [ebp-0xe8]
	mov edx, [ebp-0xe4]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassVertexShaderArgs
	jmp R_TessXModelSkinnedDrawSurfList_410
R_TessXModelSkinnedDrawSurfList_200:
	mov edx, [ebp-0x48]
	mov [ebp-0x8c], edx
	mov ecx, [ebp-0x44]
	mov [ebp-0x90], ecx
	mov eax, [ebp-0x90]
	mov edx, [ebp-0x8c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassVertexShaderArgs
	jmp R_TessXModelSkinnedDrawSurfList_420
R_TessXModelSkinnedDrawSurfList_80:
	mov eax, rgp
	mov eax, [eax+0x2008]
	jmp R_TessXModelSkinnedDrawSurfList_430
R_TessXModelSkinnedDrawSurfList_100:
	mov edx, [ebp-0x3c]
	mov [ebp-0xd0], edx
	mov ecx, [ebp-0x40]
	mov [ebp-0xcc], ecx
	mov eax, [ebp-0xd0]
	mov edx, [ebp-0xcc]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassVertexShaderArgs
	jmp R_TessXModelSkinnedDrawSurfList_440
	add [eax], al


;R_TessStaticModelRigidDrawSurfList(GfxDrawSurfListArgs const*, GfxCmdBufContext)
R_TessStaticModelRigidDrawSurfList:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0xac
	mov dword [ebp-0x48], 0x0
	mov dword [ebp-0x44], 0x0
	mov dword [ebp-0x50], 0x0
	mov dword [ebp-0x4c], 0x0
	mov dword [ebp-0x58], 0x0
	mov dword [ebp-0x54], 0x0
	mov dword [ebp-0x60], 0x0
	mov dword [ebp-0x5c], 0x0
	mov dword [ebp-0x68], 0x0
	mov dword [ebp-0x64], 0x0
	mov dword [ebp-0x70], 0x0
	mov dword [ebp-0x6c], 0x0
	mov dword [ebp-0x78], 0x0
	mov dword [ebp-0x74], 0x0
	mov dword [ebp-0x80], 0x0
	mov dword [ebp-0x7c], 0x0
	mov dword [ebp-0x88], 0x0
	mov dword [ebp-0x84], 0x0
	mov ecx, [ebp+0xc]
	mov [ebp-0x2c], ecx
	mov ebx, [ebp+0x10]
	mov [ebp-0x30], ebx
	mov ecx, [ebp+0x8]
	mov ebx, [ecx]
	mov esi, [ecx+0x4]
	mov [ebp-0x90], ebx
	mov [ebp-0x8c], esi
	mov [ebp-0x34], esi
	mov edi, ebx
	mov ecx, [ecx+0xc]
	mov [ebp-0x38], ecx
	mov ecx, [ecx+0x8]
	mov [ebp-0x3c], ecx
	mov [esp], ebx
	mov [esp+0x4], esi
	call R_SetupPassPixelShaderArgs
	mov eax, s_manualObjectPlacement
	mov [ebx+0xf08], eax
	mov dword [esp+0x4], 0x0
	mov [esp], ebx
	call R_ChangeDepthHackNearClip
	mov eax, [ebp-0x34]
	mov dword [eax+0x98], 0x1
	mov [esp], esi
	call R_UpdateVertexDecl
	mov [ebp-0x8c], esi
	mov [ebp-0x90], ebx
	cmp dword [ebx+0xf34], 0x1
	sbb edx, edx
	cmp edx, [esi+0xcc]
	jz R_TessStaticModelRigidDrawSurfList_10
	mov [esp+0x4], edx
	mov [esp], esi
	call R_ChangeDepthRange
R_TessStaticModelRigidDrawSurfList_10:
	mov esi, [ebp-0x30]
	test esi, esi
	jz R_TessStaticModelRigidDrawSurfList_20
	mov ecx, [ebp+0xc]
	mov [ebp-0x88], ecx
	mov ebx, [ebp+0x10]
	mov [ebp-0x84], ebx
	mov eax, [ebp-0x88]
	mov edx, [ebp-0x84]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPixelShaderArgs
	mov edx, [ebp-0x30]
	mov dword [edx+0x98], 0x1
	mov ecx, [ebp+0x10]
	mov [esp], ecx
	call R_UpdateVertexDecl
	mov ebx, [ebp-0x84]
	mov [ebp+0x10], ebx
	mov eax, [ebp+0xc]
	cmp dword [eax+0xf34], 0x1
	sbb eax, eax
	mov edx, [ebp-0x30]
	cmp eax, [edx+0xcc]
	jz R_TessStaticModelRigidDrawSurfList_20
	mov [esp+0x4], eax
	mov [esp], ebx
	call R_ChangeDepthRange
R_TessStaticModelRigidDrawSurfList_20:
	mov ecx, [edi+0xca8]
	add ecx, 0x28000
	mov ebx, [ebp+0x8]
	mov edx, [ebx+0x8]
	mov ebx, [ebp-0x38]
	mov eax, [ebx]
	movzx eax, word [eax+edx*8]
	lea esi, [ecx+eax*4]
	cmp dword [ebp-0x3c], 0x7
	jz R_TessStaticModelRigidDrawSurfList_30
	mov edx, [ebp-0x34]
	mov [ebp-0x4c], edx
	mov [ebp-0x50], edi
	mov ecx, [ebp-0x50]
	mov ebx, [ebp-0x4c]
	mov [esp], ecx
	mov [esp+0x4], ebx
	call R_SetupPassPerObjectArgs
	mov ebx, [ebp-0x34]
	mov [ebp-0x44], ebx
	mov [ebp-0x48], edi
	mov eax, [ebp-0x38]
	mov [esp+0xc], eax
	mov edx, [ebp-0x48]
	mov ecx, [ebp-0x44]
	mov [esp+0x4], edx
	mov [esp+0x8], ecx
	mov [esp], esi
	call R_DrawStaticModelSurf
R_TessStaticModelRigidDrawSurfList_70:
	mov eax, 0x1
	add esp, 0xac
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_TessStaticModelRigidDrawSurfList_30:
	mov eax, rgp
	mov eax, [eax+0x2008]
	mov [edi+0xc60], eax
	mov ebx, [ebp-0x30]
	test ebx, ebx
	jz R_TessStaticModelRigidDrawSurfList_40
	mov eax, [ebp-0x2c]
	mov [ebp-0x80], eax
	mov edx, [ebp-0x30]
	mov [ebp-0x7c], edx
	mov ecx, [ebp-0x80]
	mov ebx, [ebp-0x7c]
	mov [esp], ecx
	mov [esp+0x4], ebx
	call R_SetupPassPerObjectArgs
R_TessStaticModelRigidDrawSurfList_40:
	mov ebx, [ebp-0x34]
	mov [ebp-0x74], ebx
	mov [ebp-0x78], edi
	mov eax, [ebp-0x78]
	mov edx, [ebp-0x74]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerObjectArgs
	mov eax, [ebx+0xb8]
	mov eax, [eax+0x44]
	mov eax, [eax+0x8]
	mov dword [esp+0x4], _cstring_tree_chechnya_tr
	mov eax, [eax+0x20]
	mov [esp], eax
	call strstr
	test eax, eax
	jz R_TessStaticModelRigidDrawSurfList_50
	mov dword [esp], 0x8037
	call glIsEnabled
	mov ebx, eax
	lea eax, [ebp-0x1c]
	mov [esp+0x4], eax
	mov dword [esp], 0x8038
	call glGetFloatv
	lea eax, [ebp-0x20]
	mov [esp+0x4], eax
	mov dword [esp], 0x2a00
	call glGetFloatv
	mov dword [esp], 0x8037
	call glEnable
	mov eax, [_ZZ34R_TessStaticModelRigidDrawSurfListPK19GfxDrawSurfListArgs16GfxCmdBufContextE15sTreeTrunkUnits]
	mov [esp+0x4], eax
	mov eax, [_ZZ34R_TessStaticModelRigidDrawSurfListPK19GfxDrawSurfListArgs16GfxCmdBufContextE16sTreeTrunkFactor]
	mov [esp], eax
	call glPolygonOffset
	mov edx, [ebp-0x2c]
	mov [ebp-0x70], edx
	mov ecx, [ebp-0x30]
	mov [ebp-0x6c], ecx
	mov eax, [ebp-0x34]
	mov [ebp-0x64], eax
	mov [ebp-0x68], edi
	mov edx, [ebp-0x38]
	mov [esp+0x14], edx
	mov eax, [ebp-0x70]
	mov edx, [ebp-0x6c]
	mov [esp+0xc], eax
	mov [esp+0x10], edx
	mov edx, [ebp-0x68]
	mov ecx, [ebp-0x64]
	mov [esp+0x4], edx
	mov [esp+0x8], ecx
	mov [esp], esi
	call R_DrawStaticModelSurfLit
	mov eax, [ebp-0x20]
	mov [esp+0x4], eax
	mov eax, [ebp-0x1c]
	mov [esp], eax
	call glPolygonOffset
	test bl, bl
	jnz R_TessStaticModelRigidDrawSurfList_60
	mov dword [esp], 0x8037
	call glDisable
	mov eax, 0x1
	add esp, 0xac
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_TessStaticModelRigidDrawSurfList_60:
	mov dword [esp], 0x8037
	call glEnable
	mov eax, 0x1
	add esp, 0xac
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_TessStaticModelRigidDrawSurfList_50:
	mov ecx, [ebp-0x2c]
	mov [ebp-0x60], ecx
	mov ebx, [ebp-0x30]
	mov [ebp-0x5c], ebx
	mov eax, [ebp-0x34]
	mov [ebp-0x54], eax
	mov [ebp-0x58], edi
	mov edx, [ebp-0x38]
	mov [esp+0x14], edx
	mov ecx, [ebp-0x60]
	mov ebx, [ebp-0x5c]
	mov [esp+0xc], ecx
	mov [esp+0x10], ebx
	mov eax, [ebp-0x58]
	mov edx, [ebp-0x54]
	mov [esp+0x4], eax
	mov [esp+0x8], edx
	mov [esp], esi
	call R_DrawStaticModelSurfLit
	jmp R_TessStaticModelRigidDrawSurfList_70
	nop


;R_TessStaticModelSkinnedDrawSurfList(GfxDrawSurfListArgs const*, GfxCmdBufContext)
R_TessStaticModelSkinnedDrawSurfList:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x4c
	mov dword [ebp-0x30], 0x0
	mov dword [ebp-0x2c], 0x0
	mov dword [ebp-0x38], 0x0
	mov dword [ebp-0x34], 0x0
	mov ecx, [ebp+0x8]
	mov esi, [ecx]
	mov edi, [ecx+0x4]
	mov [ebp-0x40], esi
	mov [ebp-0x3c], edi
	mov [ebp-0x1c], edi
	mov ebx, esi
	mov ecx, [ecx+0xc]
	mov [ebp-0x20], ecx
	mov [esp], esi
	mov [esp+0x4], edi
	call R_SetupPassPixelShaderArgs
	mov eax, [ebp-0x20]
	mov eax, [eax+0x8]
	mov [ebp-0x24], eax
	mov eax, s_manualObjectPlacement
	mov [esi+0xf08], eax
	mov dword [esp+0x4], 0x0
	mov [esp], esi
	call R_ChangeDepthHackNearClip
	mov edx, [ebp-0x1c]
	mov dword [edx+0x98], 0x1
	mov [esp], edi
	call R_UpdateVertexDecl
	mov [ebp-0x3c], edi
	mov [ebp-0x40], esi
	cmp dword [esi+0xf34], 0x1
	sbb edx, edx
	cmp edx, [edi+0xcc]
	jz R_TessStaticModelSkinnedDrawSurfList_10
	mov [esp+0x4], edx
	mov [esp], edi
	call R_ChangeDepthRange
R_TessStaticModelSkinnedDrawSurfList_10:
	mov ecx, [ebx+0xca8]
	add ecx, 0x28000
	mov ebx, [ebp+0x8]
	mov edx, [ebx+0x8]
	mov ebx, [ebp-0x20]
	mov eax, [ebx]
	movzx eax, word [eax+edx*8]
	lea eax, [ecx+eax*4]
	cmp dword [ebp-0x24], 0x7
	jz R_TessStaticModelSkinnedDrawSurfList_20
	mov [ebp-0x2c], edi
	mov [ebp-0x30], esi
	mov ecx, [ebp-0x30]
	mov ebx, [ebp-0x2c]
	mov [esp+0x4], ecx
	mov [esp+0x8], ebx
	mov [esp], eax
	call R_DrawStaticModelSkinnedSurf
	mov eax, 0x1
	add esp, 0x4c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_TessStaticModelSkinnedDrawSurfList_20:
	mov [ebp-0x34], edi
	mov [ebp-0x38], esi
	mov edx, [ebp-0x38]
	mov ecx, [ebp-0x34]
	mov [esp+0x4], edx
	mov [esp+0x8], ecx
	mov [esp], eax
	call R_DrawStaticModelSkinnedSurfLit
	mov eax, 0x1
	add esp, 0x4c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


;R_TessXModelRigidSkinnedDrawSurfList(GfxDrawSurfListArgs const*, GfxCmdBufContext)
R_TessXModelRigidSkinnedDrawSurfList:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0xbc
	mov dword [ebp-0x68], 0x0
	mov dword [ebp-0x64], 0x0
	mov dword [ebp-0x70], 0x0
	mov dword [ebp-0x6c], 0x0
	mov dword [ebp-0x78], 0x0
	mov dword [ebp-0x74], 0x0
	mov dword [ebp-0x80], 0x0
	mov dword [ebp-0x7c], 0x0
	mov dword [ebp-0x88], 0x0
	mov dword [ebp-0x84], 0x0
	mov dword [ebp-0x90], 0x0
	mov dword [ebp-0x8c], 0x0
	mov dword [ebp-0x98], 0x0
	mov dword [ebp-0x94], 0x0
	mov eax, [ebp+0x8]
	mov ebx, [eax]
	mov esi, [eax+0x4]
	mov [ebp-0x28], esi
	mov [ebp-0x24], ebx
	mov edx, [ebx+0xca8]
	mov [ebp-0x38], edx
	mov ecx, [eax+0xc]
	mov [ebp-0x2c], ecx
	mov edx, [ecx+0x8]
	mov [ebp-0x34], edx
	mov edx, [eax+0x8]
	mov ecx, [ecx+0x4]
	sub ecx, edx
	mov [ebp-0x54], ecx
	mov ecx, [ebp-0x2c]
	mov eax, [ecx]
	lea edx, [eax+edx*8]
	mov [ebp-0x58], edx
	mov eax, [ecx+0x24]
	test eax, eax
	jz R_TessXModelRigidSkinnedDrawSurfList_10
	mov ecx, esi
R_TessXModelRigidSkinnedDrawSurfList_230:
	mov dword [ecx+0x98], 0x1
	mov [esp], ecx
	call R_UpdateVertexDecl
	mov dword [ebp-0xa0], 0xffffffff
	mov dword [ebp-0x9c], 0xffffffff
	mov word [ebp-0xa0], 0x0
	and dword [ebp-0xa0], 0xff00ffff
	and dword [ebp-0xa0], 0xe0ffffff
	mov dword [ebp-0xa8], 0xffffffff
	mov dword [ebp-0xa4], 0xffffffff
	mov word [ebp-0xa8], 0x0
	cmp dword [ebp-0x34], 0x7
	jz R_TessXModelRigidSkinnedDrawSurfList_20
	and dword [ebp-0xa8], 0xff00ffff
	and dword [ebp-0xa8], 0xe0ffffff
R_TessXModelRigidSkinnedDrawSurfList_20:
	mov eax, [ebp-0x58]
	mov ebx, [eax]
	mov esi, [eax+0x4]
	mov edx, [ebp-0xa0]
	and edx, ebx
	mov [ebp-0x50], edx
	mov ecx, [ebp-0x9c]
	and ecx, esi
	mov [ebp-0x4c], ecx
	mov dword [ebp-0x30], 0x1
	xor edx, edx
	cmp dword [ebp-0x34], 0x7
	jz R_TessXModelRigidSkinnedDrawSurfList_30
R_TessXModelRigidSkinnedDrawSurfList_180:
	mov eax, [ebp-0xa8]
	and eax, ebx
	mov [ebp-0x48], eax
	mov ecx, [ebp-0xa4]
	and ecx, esi
	mov [ebp-0x44], ecx
	mov eax, [ebp-0x58]
	lea eax, [eax+edx*8]
	mov [ebp-0x20], eax
	mov [ebp-0x1c], edx
	mov edx, [ebp-0x54]
	mov [ebp-0xac], edx
	jmp R_TessXModelRigidSkinnedDrawSurfList_40
R_TessXModelRigidSkinnedDrawSurfList_130:
	mov [esp+0x4], eax
	mov [esp], ecx
	call R_ChangeObjectPlacement
	mov edx, [ebp-0x24]
R_TessXModelRigidSkinnedDrawSurfList_140:
	mov eax, [ebp-0x28]
	mov [ebp-0x74], eax
	mov [ebp-0x78], edx
	mov eax, [ebp-0x78]
	mov edx, [ebp-0x74]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerObjectArgs
	mov edx, [ebp-0x28]
	mov [ebp-0x6c], edx
	mov ecx, [ebp-0x24]
	mov [ebp-0x70], ecx
	mov eax, [ebp-0x70]
	mov edx, [ebp-0x6c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPerPrimArgs
	mov edx, [ebp-0x5c]
	mov ecx, [edx+0x4]
	mov eax, [ecx+0x1c]
	mov edx, [ebp-0x28]
	mov [ebp-0x64], edx
	mov edx, [ebp-0x24]
	mov [ebp-0x68], edx
	mov [esp], eax
	mov eax, [ebp-0x68]
	mov edx, [ebp-0x64]
	call R_DrawXModelSkinnedUncached
	add dword [ebp-0x1c], 0x1
	mov ecx, [ebp-0xac]
	cmp [ebp-0x1c], ecx
	jz R_TessXModelRigidSkinnedDrawSurfList_50
	mov eax, [ebp-0x20]
	mov ebx, [eax+0x8]
	mov esi, [eax+0xc]
	add eax, 0x8
	mov [ebp-0x20], eax
	mov eax, [ebp-0xa8]
	and eax, ebx
	mov edx, [ebp-0xa4]
	and edx, esi
	mov ecx, [ebp-0x44]
	xor ecx, edx
	xor eax, [ebp-0x48]
	or ecx, eax
	jnz R_TessXModelRigidSkinnedDrawSurfList_60
R_TessXModelRigidSkinnedDrawSurfList_40:
	movzx eax, bx
	mov ecx, [ebp-0x38]
	lea eax, [ecx+eax*4]
	mov [ebp-0x5c], eax
	mov eax, [ebp-0x2c]
	mov eax, [eax+0x24]
	test eax, eax
	jz R_TessXModelRigidSkinnedDrawSurfList_70
	mov edx, [ebp-0x5c]
	movzx eax, word [edx+0xe]
	movzx edx, ax
	test ax, ax
	jnz R_TessXModelRigidSkinnedDrawSurfList_80
	mov dword [ebp-0x3c], 0x0
	xor eax, eax
	mov [esp+0x4], eax
	mov ecx, [ebp-0x24]
	mov [esp], ecx
	call R_UpdateMaterialTime
	mov edi, eax
	mov eax, [ebp-0x30]
	or eax, edi
	jnz R_TessXModelRigidSkinnedDrawSurfList_90
R_TessXModelRigidSkinnedDrawSurfList_150:
	test edi, edi
	jnz R_TessXModelRigidSkinnedDrawSurfList_100
R_TessXModelRigidSkinnedDrawSurfList_160:
	mov edx, [ebp-0x3c]
	mov [esp+0x4], edx
	mov ecx, [ebp-0x24]
	mov [esp], ecx
	call R_ChangeDepthHackNearClip
	cmp dword [ebp-0x34], 0x7
	jz R_TessXModelRigidSkinnedDrawSurfList_110
R_TessXModelRigidSkinnedDrawSurfList_170:
	mov ecx, [ebp-0x3c]
	mov edx, [ebp-0x28]
	cmp ecx, [edx+0xcc]
	jz R_TessXModelRigidSkinnedDrawSurfList_120
	mov [esp+0x4], ecx
	mov [esp], edx
	call R_ChangeDepthRange
R_TessXModelRigidSkinnedDrawSurfList_120:
	mov dword [ebp-0x30], 0x0
R_TessXModelRigidSkinnedDrawSurfList_70:
	mov eax, [ebp-0x5c]
	add eax, 0x18
	mov ecx, [ebp-0x24]
	cmp eax, [ecx+0xf08]
	jnz R_TessXModelRigidSkinnedDrawSurfList_130
	mov edx, ecx
	jmp R_TessXModelRigidSkinnedDrawSurfList_140
R_TessXModelRigidSkinnedDrawSurfList_80:
	mov ecx, [ebp-0x38]
	lea eax, [ecx+edx*8+0x118260]
	mov edx, [eax]
	and edx, 0x2
	mov [ebp-0x3c], edx
	mov eax, [eax+0x4]
	mov [esp+0x4], eax
	mov ecx, [ebp-0x24]
	mov [esp], ecx
	call R_UpdateMaterialTime
	mov edi, eax
	mov eax, [ebp-0x30]
	or eax, edi
	jz R_TessXModelRigidSkinnedDrawSurfList_150
R_TessXModelRigidSkinnedDrawSurfList_90:
	mov edx, [ebp-0x28]
	mov [ebp-0x8c], edx
	mov ecx, [ebp-0x24]
	mov [ebp-0x90], ecx
	mov eax, [ebp-0x90]
	mov edx, [ebp-0x8c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPixelShaderArgs
	test edi, edi
	jz R_TessXModelRigidSkinnedDrawSurfList_160
R_TessXModelRigidSkinnedDrawSurfList_100:
	mov edx, [ebp-0x28]
	mov [ebp-0x84], edx
	mov ecx, [ebp-0x24]
	mov [ebp-0x88], ecx
	mov eax, [ebp-0x88]
	mov edx, [ebp-0x84]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassVertexShaderArgs
	mov edx, [ebp-0x3c]
	mov [esp+0x4], edx
	mov ecx, [ebp-0x24]
	mov [esp], ecx
	call R_ChangeDepthHackNearClip
	cmp dword [ebp-0x34], 0x7
	jnz R_TessXModelRigidSkinnedDrawSurfList_170
R_TessXModelRigidSkinnedDrawSurfList_110:
	mov eax, [ebp-0x24]
	mov [esp+0x4], eax
	mov edx, [ebp-0x5c]
	movzx eax, word [edx+0x10]
	mov [esp], eax
	call R_SetModelLightingCoordsForSource
	mov ecx, ebx
	shr ecx, 0x10
	movzx eax, cl
	mov ecx, [ebp-0x28]
	mov [ebp-0x7c], ecx
	mov ecx, [ebp-0x24]
	mov [ebp-0x80], ecx
	mov [esp+0x8], eax
	mov eax, [ebp-0x80]
	mov edx, [ebp-0x7c]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetReflectionProbe
	jmp R_TessXModelRigidSkinnedDrawSurfList_170
R_TessXModelRigidSkinnedDrawSurfList_60:
	mov eax, [ebp-0xa0]
	and eax, ebx
	mov edx, [ebp-0x9c]
	and edx, esi
	mov ecx, [ebp-0x4c]
	xor ecx, edx
	xor eax, [ebp-0x50]
	or ecx, eax
	jnz R_TessXModelRigidSkinnedDrawSurfList_50
	mov edx, [ebp-0x1c]
	cmp dword [ebp-0x34], 0x7
	jnz R_TessXModelRigidSkinnedDrawSurfList_180
R_TessXModelRigidSkinnedDrawSurfList_30:
	mov eax, sc_enable
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jnz R_TessXModelRigidSkinnedDrawSurfList_190
R_TessXModelRigidSkinnedDrawSurfList_200:
	mov eax, rgp
	mov eax, [eax+0x2008]
R_TessXModelRigidSkinnedDrawSurfList_210:
	mov ecx, [ebp-0x24]
	mov [ecx+0xc60], eax
	jmp R_TessXModelRigidSkinnedDrawSurfList_180
R_TessXModelRigidSkinnedDrawSurfList_50:
	mov eax, [ebp-0x1c]
	add esp, 0xbc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_TessXModelRigidSkinnedDrawSurfList_190:
	test ebx, 0x1f000000
	jz R_TessXModelRigidSkinnedDrawSurfList_200
	mov eax, gfxRenderTargets
	mov eax, [eax+0x78]
	jmp R_TessXModelRigidSkinnedDrawSurfList_210
R_TessXModelRigidSkinnedDrawSurfList_10:
	mov [ebp-0x94], esi
	mov [ebp-0x98], ebx
	mov eax, [ebp-0x98]
	mov edx, [ebp-0x94]
	mov [esp], eax
	mov [esp+0x4], edx
	call R_SetupPassPixelShaderArgs
	mov dword [esp+0x4], 0x0
	mov [esp], ebx
	call R_ChangeDepthHackNearClip
	mov edx, [ebp-0x28]
	cmp dword [edx+0xcc], 0xffffffff
	jz R_TessXModelRigidSkinnedDrawSurfList_220
	mov dword [esp+0x4], 0xffffffff
	mov [esp], esi
	call R_ChangeDepthRange
	mov ecx, [ebp-0x28]
	jmp R_TessXModelRigidSkinnedDrawSurfList_230
R_TessXModelRigidSkinnedDrawSurfList_220:
	mov ecx, edx
	jmp R_TessXModelRigidSkinnedDrawSurfList_230
	nop


;Initialized global or static variables of rb_tess:
SECTION .data
_ZZ34R_TessStaticModelRigidDrawSurfListPK19GfxDrawSurfListArgs16GfxCmdBufContextE16sTreeTrunkFactor: dd 0xbf800000, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0


;Initialized constant data of rb_tess:
SECTION .rdata
g_keepZ__uint4: dd 0x0, 0x0, 0xffffffff, 0x0
g_keepX__uint4: dd 0xffffffff, 0x0, 0x0, 0x0
g_keepZW__uint4: dd 0x0, 0x0, 0xffffffff, 0xffffffff
g_keepXY__uint4: dd 0xffffffff, 0xffffffff, 0x0, 0x0
g_keepXYZ__uint4: dd 0xffffffff, 0xffffffff, 0xffffffff, 0x0
g_keepXYW__uint4: dd 0xffffffff, 0xffffffff, 0x0, 0xffffffff
g_keepXZW__uint4: dd 0xffffffff, 0x0, 0xffffffff, 0xffffffff
g_keepYZW__uint4: dd 0x0, 0xffffffff, 0xffffffff, 0xffffffff
g_selectW__uint4: dd 0x10203, 0x4050607, 0x8090a0b, 0x1c1d1e1f
g_selectZ__uint4: dd 0x10203, 0x4050607, 0x18191a1b, 0xc0d0e0f
g_selectY__uint4: dd 0x10203, 0x14151617, 0x8090a0b, 0xc0d0e0f
g_selectX__uint4: dd 0x10111213, 0x4050607, 0x8090a0b, 0xc0d0e0f
g_swizzleWWWW__uint4: dd 0xc0d0e0f, 0xc0d0e0f, 0xc0d0e0f, 0xc0d0e0f
g_swizzleZZZZ__uint4: dd 0x8090a0b, 0x8090a0b, 0x8090a0b, 0x8090a0b
g_swizzleYYYY__uint4: dd 0x4050607, 0x4050607, 0x4050607, 0x4050607
g_swizzleXXXX__uint4: dd 0x10203, 0x10203, 0x10203, 0x10203
g_swizzleYZWA__uint4: dd 0x4050607, 0x8090a0b, 0xc0d0e0f, 0x10111213
g_swizzleZWAW__uint4: dd 0x8090a0b, 0xc0d0e0f, 0x10111213, 0xc0d0e0f
g_swizzleWABW__uint4: dd 0xc0d0e0f, 0x10111213, 0x14151617, 0xc0d0e0f
g_swizzleZXYW__uint4: dd 0x8090a0b, 0x10203, 0x4050607, 0xc0d0e0f
g_swizzleYZXW__uint4: dd 0x4050607, 0x8090a0b, 0x10203, 0xc0d0e0f
g_swizzleXYZA__uint4: dd 0x10203, 0x4050607, 0x8090a0b, 0x10111213
g_swizzleZWCD__uint4: dd 0x8090a0b, 0xc0d0e0f, 0x18191a1b, 0x1c1d1e1f
g_swizzleXYAB__uint4: dd 0x10203, 0x4050607, 0x10111213, 0x14151617
g_swizzleYBWD__uint4: dd 0x4050607, 0x14151617, 0xc0d0e0f, 0x1c1d1e1f
g_swizzleXAZC__uint4: dd 0x10203, 0x10111213, 0x8090a0b, 0x18191a1b
g_swizzleYXWZ__uint4: dd 0x4050607, 0x10203, 0xc0d0e0f, 0x8090a0b
g_swizzleXZYW__uint4: dd 0x10203, 0x8090a0b, 0x4050607, 0xc0d0e0f
g_swizzleYXZW__uint4: dd 0x4050607, 0x10203, 0x8090a0b, 0xc0d0e0f
g_swizzleXYZW__uint4: dd 0x10203, 0x4050607, 0x8090a0b, 0xc0d0e0f
g_inc__uint4: dd 0x1, 0x1, 0x1, 0x1
g_negativeZero__uint4: dd 0x80000000, 0x80000000, 0x80000000, 0x80000000
g_fltMin__uint4: dd 0x800000, 0x800000, 0x800000, 0x800000, 0x80000000, 0x0, 0x0, 0x0, 0x80000000, 0x0, 0x0, 0x0, 0x80000000, 0x0, 0x0, 0x0


;Zero initialized global or static variables of rb_tess:
SECTION .bss
g_keepZ: resb 0x10
g_keepX: resb 0x10
g_keepZW: resb 0x10
g_keepXY: resb 0x10
g_keepXYZ: resb 0x10
g_keepXYW: resb 0x10
g_keepXZW: resb 0x10
g_keepYZW: resb 0x10
g_selectW: resb 0x10
g_selectZ: resb 0x10
g_selectY: resb 0x10
g_selectX: resb 0x10
g_swizzleWWWW: resb 0x10
g_swizzleZZZZ: resb 0x10
g_swizzleYYYY: resb 0x10
g_swizzleXXXX: resb 0x10
g_swizzleYZWA: resb 0x10
g_swizzleZWAW: resb 0x10
g_swizzleWABW: resb 0x10
g_swizzleZXYW: resb 0x10
g_swizzleYZXW: resb 0x10
g_swizzleXYZA: resb 0x10
g_swizzleZWCD: resb 0x10
g_swizzleXYAB: resb 0x10
g_swizzleYBWD: resb 0x10
g_swizzleXAZC: resb 0x10
g_swizzleYXWZ: resb 0x10
g_swizzleXZYW: resb 0x10
g_swizzleYXZW: resb 0x10
g_swizzleXYZW: resb 0x10
g_inc: resb 0x10
g_negativeZero: resb 0x10
g_fltMin: resb 0x10
_ZZ34R_TessStaticModelRigidDrawSurfListPK19GfxDrawSurfListArgs16GfxCmdBufContextE15sTreeTrunkUnits: resb 0x70


;All cstrings:
SECTION .rdata
_cstring_tree_chechnya_tr:		db "tree_chechnya_trunk_nml",0



;All constant floats and doubles:
SECTION .rdata
_float_0_00392157:		dd 0x3b808081	; 0.00392157
_data16_80000000:		dd 0x80000000, 0x0, 0x0, 0x0	; OWORD
_float_0_00000000:		dd 0x0	; 0
_float_1_00000000:		dd 0x3f800000	; 1
_float_0_00100000:		dd 0x3a83126f	; 0.001

