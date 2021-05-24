;Imports of r_dpvs:
	extern R_AddWorkerCmd
	extern rgp
	extern Com_ConvexHull
	extern memcpy
	extern Com_Error
	extern BoxOnPlaneSide
	extern gfxCfg
	extern scene
	extern Vec3ProjectionCoords
	extern ProjectedWindingContainsCoplanarPoint
	extern _ZN10LargeLocalC1Ei
	extern _ZN10LargeLocal6GetBufEv
	extern r_portalWalkLimit
	extern r_showPortals
	extern r_portalBevelsOnly
	extern r_portalBevels
	extern r_portalMinClipArea
	extern r_portalMinRecurseDepth
	extern _ZN10LargeLocalD1Ev
	extern colorMdCyan
	extern frontEndDataOut
	extern R_AddDebugLine
	extern colorLtCyan
	extern R_WarnOncePerFrame
	extern R_AddDebugPolygon
	extern _Unwind_Resume
	extern R_IsDynEntVisibleToAnyShadowedPrimaryLight
	extern DynEnt_GetClientPose
	extern DynEnt_GetEntityDef
	extern R_SkinXModel
	extern R_GetBrushModel
	extern r_drawDecals
	extern InterlockedExchangeAdd
	extern memset
	extern Com_Memset
	extern R_IsEntityVisibleToAnyShadowedPrimaryLight
	extern R_SkinAndBoundSceneEnt
	extern r_zfar
	extern R_AllocGlobalVariable
	extern rg
	extern r_skipPvs
	extern r_singleCell
	extern R_AddSkySurfacesDpvs
	extern r_vc_makelog
	extern R_ShowLightVisCachePoints
	extern R_FreeGlobalVariable
	extern XModelGetRadius
	extern R_AllocSceneModel
	extern sm_strictCull
	extern CG_GetPoseLightingHandle
	extern R_AllocModelLighting_Box
	extern R_AllocModelLighting_Sphere
	extern sc_enable
	extern DynEnt_GetClientEntity
	extern R_AllocModelLighting_PrimaryLight
	extern R_AddBModelSurfacesCamera
	extern PIXBeginNamedEvent
	extern R_SortDrawSurfs
	extern R_AddXModelSurfacesCamera
	extern R_AddDObjSurfacesCamera
	extern gfxMetrics
	extern R_AddDObjSurfaces
	extern R_AddXModelSurfaces
	extern R_AddBModelSurfaces
	extern R_IsDynEntVisibleToPrimaryLight
	extern R_IsEntityVisibleToPrimaryLight
	extern R_CullPointAndRadius

;Exports of r_dpvs:
	global _GLOBAL__I__Z19R_FrustumClipPlanesPK9GfxMatrixPA4_KfiP9DpvsPlane
	global dpvsGlob
	global g_viewIndex
	global standardFrustumSidePlanes
	global g_dpvsView
	global g_dynEntVisData
	global R_AddCellSurfacesAndCullGroupsInFrustumDelayed
	global R_ChopPortalWinding
	global R_AddVertToPortalHullPoints
	global R_FilterDynEntIntoCells_r
	global R_EnqueuePortal
	global R_FilterEntIntoCells_r
	global R_GetSidePlaneNormals
	global R_GetFurtherCellList_r
	global R_VisitPortalsForCellNoFrustum
	global R_VisitPortalsForCell
	global _ZZ14R_VisitPortalsPK7GfxCellPK9DpvsPlaneS4_iE5color
	global R_VisitPortals
	global R_SetVisData
	global R_AddSceneDObj
	global R_CellForPoint
	global R_DrawAllDynEnt
	global R_InitSceneData
	global R_ClearDpvsScene
	global R_DrawAllSceneEnt
	global R_GetFarPlaneDist
	global R_InitSceneBuffers
	global DynEntCl_InitFilter
	global R_FrustumClipPlanes
	global R_FilterDObjIntoCells
	global R_AddWorldSurfacesDpvs
	global R_SetViewFrustumPlanes
	global R_ShutdownSceneBuffers
	global R_UnfilterEntFromCells
	global R_FilterBModelIntoCells
	global R_FilterDynEntIntoCells
	global R_FilterXModelIntoScene
	global R_SetupWorldSurfacesDpvs
	global R_FilterEntitiesIntoCells
	global R_SetupShadowSurfacesDpvs
	global R_UnfilterDynEntFromCells
	global R_CalcReflectionProbeIndex
	global R_AddWorldSurfacesFrustumOnly
	global R_AddAllSceneEntSurfacesCamera
	global R_GenerateShadowMapCasterCells
	global R_AddAllSceneEntSurfacesSunShadow
	global R_AddAllSceneEntSurfacesSpotShadow
	global R_CullDynamicSpotLightInCameraView
	global R_CullDynamicPointLightsInCameraView
	global R_AddCellDynBrushSurfacesInFrustumCmd


SECTION .text


;global constructors keyed to R_FrustumClipPlanes(GfxMatrix const*, float const (*) [4], int, DpvsPlane*)
_GLOBAL__I__Z19R_FrustumClipPlanesPK9GfxMatrixPA4_KfiP9DpvsPlane:
	push ebp
	mov ebp, esp
	mov edx, 0xffff
	mov eax, 0x1
	pop ebp
	jmp __static_initialization_and_destruction_0


;R_AddCellSurfacesAndCullGroupsInFrustumDelayed(GfxCell const*, DpvsPlane const*, int, int)
R_AddCellSurfacesAndCullGroupsInFrustumDelayed:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x3c
	mov ebx, eax
	mov esi, edx
	mov edi, ecx
	mov [ebp-0x20], eax
	mov [ebp-0x24], edx
	mov [ebp-0x1c], cl
	movzx eax, byte [ebp+0x8]
	mov [ebp-0x1b], al
	mov eax, [g_viewIndex]
	mov [ebp-0x1a], ax
	lea eax, [ebp-0x24]
	mov [esp+0x4], eax
	mov dword [esp], 0x3
	call R_AddWorkerCmd
	mov eax, rgp
	mov eax, [eax+0x20a0]
	sub ebx, [eax+0x104]
	sar ebx, 0x3
	lea eax, [ebx+ebx*8]
	mov edx, eax
	shl edx, 0x6
	add eax, edx
	lea eax, [ebx+eax*8]
	mov edx, eax
	shl edx, 0xf
	add eax, edx
	lea eax, [ebx+eax*8]
	neg eax
	mov [ebp-0x2c], eax
	mov [ebp-0x30], esi
	mov eax, edi
	mov [ebp-0x28], al
	movzx eax, byte [ebp+0x8]
	mov [ebp-0x27], al
	mov eax, [g_viewIndex]
	mov [ebp-0x26], ax
	lea ebx, [ebp-0x30]
	mov [esp+0x4], ebx
	mov dword [esp], 0x5
	call R_AddWorkerCmd
	mov [esp+0x4], ebx
	mov dword [esp], 0x4
	call R_AddWorkerCmd
	mov [esp+0x4], ebx
	mov dword [esp], 0x6
	call R_AddWorkerCmd
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


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


;R_ChopPortalWinding(float const (*) [3], int*, DpvsPlane const*, float (*) [3])
R_ChopPortalWinding:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x2ac
	mov [ebp-0x2a8], eax
	mov [ebp-0x2ac], edx
	mov ebx, [edx]
	test ebx, ebx
	jle R_ChopPortalWinding_10
	movss xmm5, dword [ecx]
	movss xmm4, dword [ecx+0x4]
	movss xmm3, dword [ecx+0x8]
	movss xmm2, dword [ecx+0xc]
	mov edx, eax
	mov dword [ebp-0x2b4], 0x0
	xor esi, esi
	xor ecx, ecx
	movss xmm6, dword [_float_0_00100000]
	movss xmm7, dword [_float__0_00100000]
	jmp R_ChopPortalWinding_20
R_ChopPortalWinding_40:
	mov byte [eax], 0x1
	add esi, 0x1
R_ChopPortalWinding_50:
	add ecx, 0x1
	add edx, 0xc
	cmp ebx, ecx
	jz R_ChopPortalWinding_30
R_ChopPortalWinding_20:
	movaps xmm1, xmm5
	mulss xmm1, [edx]
	movaps xmm0, xmm4
	mulss xmm0, [edx+0x4]
	addss xmm1, xmm0
	movaps xmm0, xmm3
	mulss xmm0, [edx+0x8]
	addss xmm1, xmm0
	addss xmm1, xmm2
	subss xmm1, xmm6
	movss [ebp+ecx*4-0x298], xmm1
	lea edi, [ebp-0x91]
	lea eax, [ecx+edi]
	mov byte [eax], 0x2
	ucomiss xmm7, xmm1
	ja R_ChopPortalWinding_40
	ucomiss xmm1, [_float_0_00100000]
	jbe R_ChopPortalWinding_50
	mov byte [eax], 0x0
	add dword [ebp-0x2b4], 0x1
	add ecx, 0x1
	add edx, 0xc
	cmp ebx, ecx
	jnz R_ChopPortalWinding_20
R_ChopPortalWinding_30:
	mov eax, [ebp-0x2b4]
	test eax, eax
	jz R_ChopPortalWinding_60
	test esi, esi
	jz R_ChopPortalWinding_70
	movzx eax, byte [ebp-0x91]
	mov [ebp+ecx-0x91], al
	mov eax, [ebp-0x298]
	mov [ebp+ecx*4-0x298], eax
	xor edi, edi
	mov dword [ebp-0x2a4], 0x0
	mov esi, [ebp+0x8]
	jmp R_ChopPortalWinding_80
R_ChopPortalWinding_130:
	test bl, bl
	jnz R_ChopPortalWinding_90
	lea eax, [edi+edi*2]
	mov edx, [ebp-0x2a8]
	lea eax, [edx+eax*4]
	mov edx, [eax]
	mov [esi], edx
	mov edx, [eax+0x4]
	mov [esi+0x4], edx
	mov eax, [eax+0x8]
	mov [esi+0x8], eax
	add dword [ebp-0x2a4], 0x1
	add esi, 0xc
R_ChopPortalWinding_90:
	lea ecx, [edi+0x1]
	movzx eax, byte [ebp+ecx-0x91]
	cmp al, 0x2
	jz R_ChopPortalWinding_100
	cmp bl, al
	jz R_ChopPortalWinding_100
	movss xmm2, dword [ebp+edi*4-0x298]
	movaps xmm0, xmm2
	subss xmm0, [ebp+ecx*4-0x298]
	divss xmm2, xmm0
	mov eax, ecx
	mov ebx, [ebp-0x2ac]
	cdq
	idiv dword [ebx]
	lea edx, [edx+edx*2]
	mov eax, [ebp-0x2a8]
	lea edx, [eax+edx*4]
	lea eax, [edi+edi*2]
	mov ebx, [ebp-0x2a8]
	lea eax, [ebx+eax*4]
	movss xmm1, dword [eax]
	movss xmm0, dword [edx]
	subss xmm0, xmm1
	mulss xmm0, xmm2
	addss xmm1, xmm0
	movss [esi], xmm1
	movss xmm1, dword [eax+0x4]
	movss xmm0, dword [edx+0x4]
	subss xmm0, xmm1
	mulss xmm0, xmm2
	addss xmm1, xmm0
	movss [esi+0x4], xmm1
	movss xmm1, dword [eax+0x8]
	movss xmm0, dword [edx+0x8]
	subss xmm0, xmm1
	mulss xmm2, xmm0
	addss xmm1, xmm2
	movss [esi+0x8], xmm1
	add dword [ebp-0x2a4], 0x1
	add esi, 0xc
R_ChopPortalWinding_100:
	mov edi, [ebp-0x2ac]
	cmp ecx, [edi]
	jge R_ChopPortalWinding_110
	cmp dword [ebp-0x2a4], 0x7f
	jg R_ChopPortalWinding_120
	mov edi, ecx
R_ChopPortalWinding_80:
	movzx ebx, byte [ebp+edi-0x91]
	cmp bl, 0x2
	jnz R_ChopPortalWinding_130
	lea eax, [edi+edi*2]
	mov edx, [ebp-0x2a8]
	lea eax, [edx+eax*4]
	mov edx, [eax]
	mov [esi], edx
	mov edx, [eax+0x4]
	mov [esi+0x4], edx
	mov eax, [eax+0x8]
	mov [esi+0x8], eax
	add dword [ebp-0x2a4], 0x1
	add esi, 0xc
	lea ecx, [edi+0x1]
	jmp R_ChopPortalWinding_100
R_ChopPortalWinding_10:
	mov eax, edx
R_ChopPortalWinding_140:
	mov dword [eax], 0x0
	mov dword [ebp-0x2a8], 0x0
	mov eax, [ebp-0x2a8]
	add esp, 0x2ac
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_ChopPortalWinding_120:
	mov eax, [ebp-0x2ac]
R_ChopPortalWinding_150:
	mov edx, [ebp-0x2a4]
	mov [eax], edx
	mov ebx, [ebp+0x8]
	mov [ebp-0x2a8], ebx
	mov eax, ebx
	add esp, 0x2ac
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_ChopPortalWinding_60:
	mov eax, [ebp-0x2ac]
	jmp R_ChopPortalWinding_140
R_ChopPortalWinding_70:
	mov eax, [ebp-0x2a8]
	add esp, 0x2ac
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_ChopPortalWinding_110:
	mov eax, edi
	jmp R_ChopPortalWinding_150


;R_AddVertToPortalHullPoints(GfxPortal*, float const*)
R_AddVertToPortalHullPoints:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x21c
	mov ebx, eax
	mov esi, edx
	mov ecx, [eax+0x4]
	test ecx, ecx
	jz R_AddVertToPortalHullPoints_10
	cmp byte [eax+0x3], 0x40
	jz R_AddVertToPortalHullPoints_20
R_AddVertToPortalHullPoints_40:
	lea eax, [ebx+0x2c]
	movzx edx, byte [ebx+0x3]
	movss xmm1, dword [esi]
	mulss xmm1, [ebx+0x2c]
	movss xmm0, dword [esi+0x4]
	mulss xmm0, [eax+0x4]
	addss xmm1, xmm0
	movss xmm0, dword [esi+0x8]
	mulss xmm0, [eax+0x8]
	addss xmm1, xmm0
	movss [ecx+edx*8], xmm1
	lea eax, [ebx+0x38]
	movzx ecx, byte [ebx+0x3]
	mov edx, [ebx+0x4]
	movss xmm1, dword [esi]
	mulss xmm1, [ebx+0x38]
	movss xmm0, dword [esi+0x4]
	mulss xmm0, [eax+0x4]
	addss xmm1, xmm0
	movss xmm0, dword [esi+0x8]
	mulss xmm0, [eax+0x8]
	addss xmm1, xmm0
	movss [edx+ecx*8+0x4], xmm1
	add byte [ebx+0x3], 0x1
	add esp, 0x21c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_AddVertToPortalHullPoints_20:
	lea eax, [ebp-0x218]
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x40
	mov [esp], ecx
	call Com_ConvexHull
	mov edi, eax
	cmp eax, 0x40
	jz R_AddVertToPortalHullPoints_30
R_AddVertToPortalHullPoints_60:
	mov ecx, edi
	mov [ebx+0x3], cl
	mov edx, [ebx+0x4]
	movzx eax, cl
	shl eax, 0x3
	mov [esp+0x8], eax
	lea eax, [ebp-0x218]
	mov [esp+0x4], eax
	mov [esp], edx
	call memcpy
	mov ecx, [ebx+0x4]
	jmp R_AddVertToPortalHullPoints_40
R_AddVertToPortalHullPoints_10:
	mov edi, [dpvsGlob+0x54]
	test edi, edi
	jz R_AddVertToPortalHullPoints_50
R_AddVertToPortalHullPoints_70:
	mov eax, [edi]
	mov [dpvsGlob+0x54], eax
	mov ecx, edi
	mov [ebx+0x4], edi
	mov byte [ebx+0x3], 0x0
	jmp R_AddVertToPortalHullPoints_40
R_AddVertToPortalHullPoints_30:
	mov dword [esp+0x8], 0x40
	mov dword [esp+0x4], _cstring_more_than_i_poin
	mov dword [esp], 0x2
	call Com_Error
	jmp R_AddVertToPortalHullPoints_60
R_AddVertToPortalHullPoints_50:
	mov dword [esp+0x8], 0x100
	mov dword [esp+0x4], _cstring_more_than_i_queu
	mov dword [esp], 0x2
	call Com_Error
	jmp R_AddVertToPortalHullPoints_70


;R_FilterDynEntIntoCells_r(mnode_t*, unsigned int, DynEntityDrawType, float const*, float const*)
R_FilterDynEntIntoCells_r:
R_FilterDynEntIntoCells_r_80:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x6c
	mov esi, eax
	mov [ebp-0x50], edx
	mov [ebp-0x54], ecx
	mov edx, [ebp+0x8]
	mov ecx, [ebp+0xc]
	mov ebx, rgp
	mov eax, [ebx+0x20a0]
	mov edi, [eax+0xf0]
	add edi, 0x1
	mov eax, [edx]
	mov [ebp-0x24], eax
	mov eax, [edx+0x4]
	mov [ebp-0x20], eax
	mov eax, [edx+0x8]
	mov [ebp-0x1c], eax
	mov eax, [ecx]
	mov [ebp-0x30], eax
	mov eax, [ecx+0x4]
	mov [ebp-0x2c], eax
	mov eax, [ecx+0x8]
	mov [ebp-0x28], eax
	mov [ebp-0x58], ebx
	mov ecx, [ebp-0x50]
	and ecx, 0x1f
	mov dword [ebp-0x60], 0x80000000
	shr dword [ebp-0x60], cl
	mov eax, [ebp-0x50]
	shr eax, 0x5
	mov [ebp-0x5c], eax
R_FilterDynEntIntoCells_r_70:
	movzx eax, word [esi]
	movzx edx, ax
	mov ecx, edx
	sub ecx, edi
	js R_FilterDynEntIntoCells_r_10
R_FilterDynEntIntoCells_r_30:
	mov edx, [ebp-0x58]
	mov eax, [edx+0x20a0]
	lea edx, [ecx+ecx*4]
	mov eax, [eax+0xf4]
	lea ebx, [eax+edx*4]
	mov [esp+0x8], ebx
	lea ecx, [ebp-0x30]
	mov [esp+0x4], ecx
	lea eax, [ebp-0x24]
	mov [esp], eax
	call BoxOnPlaneSide
	cmp eax, 0x3
	jz R_FilterDynEntIntoCells_r_20
	lea edx, [eax-0x1]
	movzx eax, word [esi+0x2]
	lea eax, [eax+eax-0x4]
	imul edx, eax
	lea esi, [edx+esi+0x4]
	movzx eax, word [esi]
	movzx edx, ax
	mov ecx, edx
	sub ecx, edi
	jns R_FilterDynEntIntoCells_r_30
R_FilterDynEntIntoCells_r_10:
	test ax, ax
	jz R_FilterDynEntIntoCells_r_40
	mov ecx, [ebp-0x58]
	mov eax, [ecx+0x20a0]
	sub edx, 0x1
	mov ecx, [ebp-0x54]
	imul edx, [eax+ecx*4+0x2ac]
	add edx, [ebp-0x5c]
	mov eax, [eax+ecx*4+0x2bc]
	mov ecx, [ebp-0x60]
	or [eax+edx*4], ecx
R_FilterDynEntIntoCells_r_40:
	add esp, 0x6c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_FilterDynEntIntoCells_r_20:
	movzx edx, byte [ebx+0x10]
	movzx eax, word [esi+0x2]
	lea eax, [esi+eax*2]
	mov [ebp-0x4c], eax
	cmp edx, 0x2
	ja R_FilterDynEntIntoCells_r_50
	movss xmm1, dword [ebx+0xc]
	mov eax, [ebp-0x24]
	mov [ebp-0x3c], eax
	mov eax, [ebp-0x20]
	mov [ebp-0x38], eax
	mov eax, [ebp-0x1c]
	mov [ebp-0x34], eax
	movss [ebp+edx*4-0x3c], xmm1
	mov eax, [ebp-0x30]
	mov [ebp-0x48], eax
	mov eax, [ebp-0x2c]
	mov [ebp-0x44], eax
	mov eax, [ebp-0x28]
	mov [ebp-0x40], eax
	movss [ebp+edx*4-0x48], xmm1
	movss xmm0, dword [ebp+edx*4-0x30]
	ucomiss xmm0, xmm1
	ja R_FilterDynEntIntoCells_r_60
R_FilterDynEntIntoCells_r_90:
	mov eax, [ebp-0x48]
	mov [ebp-0x30], eax
	mov eax, [ebp-0x44]
	mov [ebp-0x2c], eax
	mov eax, [ebp-0x40]
	mov [ebp-0x28], eax
	mov esi, [ebp-0x4c]
	jmp R_FilterDynEntIntoCells_r_70
R_FilterDynEntIntoCells_r_50:
	lea eax, [esi+0x4]
	lea ecx, [ebp-0x30]
	mov [esp+0x4], ecx
	lea edx, [ebp-0x24]
	mov [esp], edx
	mov ecx, [ebp-0x54]
	mov edx, [ebp-0x50]
	call R_FilterDynEntIntoCells_r_80
	mov esi, [ebp-0x4c]
	jmp R_FilterDynEntIntoCells_r_70
R_FilterDynEntIntoCells_r_60:
	lea eax, [esi+0x4]
	lea edx, [ebp-0x30]
	mov [esp+0x4], edx
	lea edx, [ebp-0x3c]
	mov [esp], edx
	mov ecx, [ebp-0x54]
	mov edx, [ebp-0x50]
	call R_FilterDynEntIntoCells_r_80
	jmp R_FilterDynEntIntoCells_r_90
	nop


;R_EnqueuePortal(GfxPortal*)
R_EnqueuePortal:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x1c
	mov edi, eax
	cmp dword [dpvsGlob+0x4c], 0xff
	jg R_EnqueuePortal_10
R_EnqueuePortal_140:
	mov byte [edi], 0x1
	movzx ebx, byte [edi+0x28]
	mov ecx, [edi+0x24]
	movss xmm7, dword [dpvsGlob]
	movss xmm6, dword [dpvsGlob+0x4]
	movss xmm5, dword [dpvsGlob+0x8]
	movss xmm4, dword [dpvsGlob+0xc]
	movaps xmm3, xmm7
	mulss xmm3, [ecx]
	movaps xmm0, xmm6
	mulss xmm0, [ecx+0x4]
	addss xmm3, xmm0
	movaps xmm0, xmm5
	mulss xmm0, [ecx+0x8]
	addss xmm3, xmm0
	addss xmm3, xmm4
	lea eax, [ebx+ebx*2]
	lea eax, [ecx+eax*4]
	lea edx, [eax-0xc]
	movaps xmm1, xmm7
	mulss xmm1, [eax-0xc]
	movaps xmm0, xmm6
	mulss xmm0, [edx+0x4]
	addss xmm1, xmm0
	movaps xmm0, xmm5
	mulss xmm0, [edx+0x8]
	addss xmm1, xmm0
	addss xmm1, xmm4
	ucomiss xmm3, xmm1
	ja R_EnqueuePortal_20
	sub ebx, 0x2
	test ebx, ebx
	jle R_EnqueuePortal_30
	lea eax, [ebx+ebx*2]
	lea eax, [ecx+eax*4]
	movaps xmm3, xmm6
	mulss xmm3, [eax+0x4]
	movaps xmm0, xmm7
	mulss xmm0, [eax]
	addss xmm3, xmm0
	movaps xmm0, xmm5
	mulss xmm0, [eax+0x8]
	addss xmm3, xmm0
	addss xmm3, xmm4
	ucomiss xmm1, xmm3
	ja R_EnqueuePortal_30
	xor edx, edx
	lea ecx, [ebx-0x1]
	jmp R_EnqueuePortal_40
R_EnqueuePortal_60:
	movaps xmm3, xmm1
R_EnqueuePortal_40:
	cmp edx, ecx
	jz R_EnqueuePortal_50
	movaps xmm1, xmm6
	mulss xmm1, [eax-0x8]
	movaps xmm0, xmm7
	mulss xmm0, [eax-0xc]
	addss xmm1, xmm0
	movaps xmm0, xmm5
	mulss xmm0, [eax-0x4]
	addss xmm1, xmm0
	addss xmm1, xmm4
	add edx, 0x1
	sub eax, 0xc
	ucomiss xmm3, xmm1
	jbe R_EnqueuePortal_60
R_EnqueuePortal_50:
	mov esi, [dpvsGlob+0x4c]
	lea eax, [esi-0x1]
	mov ebx, eax
	sar ebx, 1
	js R_EnqueuePortal_70
R_EnqueuePortal_130:
	mov ecx, [dpvsGlob+0x50]
	lea eax, [ecx+ebx*8]
	ucomiss xmm3, [eax+0x4]
	jb R_EnqueuePortal_80
	lea edx, [esi*8]
	mov [ecx+edx], edi
	mov eax, [dpvsGlob+0x50]
	movss [edx+eax+0x4], xmm3
	add dword [dpvsGlob+0x4c], 0x1
	add esp, 0x1c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_EnqueuePortal_20:
	sub ebx, 0x1
	cmp ebx, 0x1
	jle R_EnqueuePortal_50
	lea eax, [ecx+0xc]
	movaps xmm2, xmm5
	mulss xmm2, [eax+0x8]
	movaps xmm0, xmm6
	mulss xmm0, [eax+0x4]
	movaps xmm1, xmm7
	mulss xmm1, [ecx+0xc]
	addss xmm0, xmm1
	addss xmm2, xmm0
	addss xmm2, xmm4
	ucomiss xmm3, xmm2
	ja R_EnqueuePortal_50
	mov eax, ecx
	movaps xmm3, xmm2
	mov edx, 0x1
	jmp R_EnqueuePortal_90
R_EnqueuePortal_100:
	movaps xmm3, xmm2
R_EnqueuePortal_90:
	add edx, 0x1
	cmp ebx, edx
	jz R_EnqueuePortal_50
	movaps xmm2, xmm5
	mulss xmm2, [eax+0x20]
	movaps xmm0, xmm6
	mulss xmm0, [eax+0x1c]
	movaps xmm1, xmm7
	mulss xmm1, [eax+0x18]
	addss xmm0, xmm1
	addss xmm2, xmm0
	addss xmm2, xmm4
	add eax, 0xc
	ucomiss xmm3, xmm2
	jbe R_EnqueuePortal_100
	jmp R_EnqueuePortal_50
R_EnqueuePortal_120:
	mov esi, ebx
	mov ebx, edx
R_EnqueuePortal_80:
	mov edx, [eax+0x4]
	mov eax, [eax]
	mov [ecx+esi*8], eax
	mov [ecx+esi*8+0x4], edx
	lea eax, [ebx-0x1]
	mov edx, eax
	sar edx, 1
	js R_EnqueuePortal_110
	mov ecx, [dpvsGlob+0x50]
	lea eax, [ecx+edx*8]
	ucomiss xmm3, [eax+0x4]
	jb R_EnqueuePortal_120
	mov esi, ebx
R_EnqueuePortal_150:
	lea edx, [esi*8]
	mov [ecx+edx], edi
	mov eax, [dpvsGlob+0x50]
	movss [edx+eax+0x4], xmm3
	add dword [dpvsGlob+0x4c], 0x1
	add esp, 0x1c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_EnqueuePortal_30:
	movaps xmm3, xmm1
	mov esi, [dpvsGlob+0x4c]
	lea eax, [esi-0x1]
	mov ebx, eax
	sar ebx, 1
	jns R_EnqueuePortal_130
R_EnqueuePortal_70:
	mov ecx, [dpvsGlob+0x50]
	lea edx, [esi*8]
	mov [ecx+edx], edi
	mov eax, [dpvsGlob+0x50]
	movss [edx+eax+0x4], xmm3
	add dword [dpvsGlob+0x4c], 0x1
	add esp, 0x1c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_EnqueuePortal_10:
	mov dword [esp+0x8], 0x100
	mov dword [esp+0x4], _cstring_more_than_i_queu1
	mov dword [esp], 0x2
	call Com_Error
	jmp R_EnqueuePortal_140
R_EnqueuePortal_110:
	mov ecx, [dpvsGlob+0x50]
	mov esi, ebx
	jmp R_EnqueuePortal_150
	nop


;R_FilterEntIntoCells_r(FilterEntInfo*, mnode_t*, float const*, float const*)
R_FilterEntIntoCells_r:
R_FilterEntIntoCells_r_80:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x6c
	mov [ebp-0x54], eax
	mov esi, edx
	mov edx, [ebp+0x8]
	mov ebx, rgp
	mov eax, [ebx+0x20a0]
	mov eax, [eax+0xf0]
	add eax, 0x1
	mov [ebp-0x50], eax
	mov eax, [ecx]
	mov [ebp-0x24], eax
	mov eax, [ecx+0x4]
	mov [ebp-0x20], eax
	mov eax, [ecx+0x8]
	mov [ebp-0x1c], eax
	mov eax, [edx]
	mov [ebp-0x30], eax
	mov eax, [edx+0x4]
	mov [ebp-0x2c], eax
	mov eax, [edx+0x8]
	mov [ebp-0x28], eax
	mov [ebp-0x58], ebx
R_FilterEntIntoCells_r_70:
	movzx eax, word [esi]
	movzx edi, ax
	mov edx, edi
	sub edx, [ebp-0x50]
	js R_FilterEntIntoCells_r_10
R_FilterEntIntoCells_r_30:
	mov ecx, [ebp-0x58]
	mov eax, [ecx+0x20a0]
	lea edx, [edx+edx*4]
	mov eax, [eax+0xf4]
	lea ebx, [eax+edx*4]
	mov [esp+0x8], ebx
	lea edi, [ebp-0x30]
	mov [esp+0x4], edi
	lea eax, [ebp-0x24]
	mov [esp], eax
	call BoxOnPlaneSide
	cmp eax, 0x3
	jz R_FilterEntIntoCells_r_20
	lea edx, [eax-0x1]
	movzx eax, word [esi+0x2]
	lea eax, [eax+eax-0x4]
	imul edx, eax
	lea esi, [edx+esi+0x4]
	movzx eax, word [esi]
	movzx edi, ax
	mov edx, edi
	sub edx, [ebp-0x50]
	jns R_FilterEntIntoCells_r_30
R_FilterEntIntoCells_r_10:
	test ax, ax
	jz R_FilterEntIntoCells_r_40
	mov eax, [ebp-0x54]
	mov esi, [eax]
	mov edx, [eax+0x4]
	mov [ebp-0x4c], edx
	mov ecx, edx
	and ecx, 0x1f
	mov ebx, 0x80000000
	shr ebx, cl
	mov ecx, edx
	shr ecx, 0x5
	shl ecx, 0x2
	mov eax, [ebp-0x58]
	mov eax, [eax+0x20a0]
	mov [ebp-0x5c], eax
	mov edx, [ebp-0x54]
	mov eax, [edx+0xc]
	lea edx, [edi+eax-0x1]
	shl edx, 0x7
	mov eax, gfxCfg
	mov eax, [eax+0x4]
	shr eax, 0x5
	imul eax, esi
	add edx, eax
	mov edi, [ebp-0x5c]
	mov eax, [edi+0xfc]
	lea edx, [eax+edx*4]
	or [edx+ecx], ebx
	add ecx, [esi*4+dpvsGlob+0xade4]
	or [ecx], ebx
	mov eax, scene
	mov edx, [eax+esi*4+0x154cb8]
	mov ecx, [ebp-0x54]
	mov eax, [ecx+0x8]
	mov edi, [ebp-0x4c]
	mov [edx+edi*4], eax
R_FilterEntIntoCells_r_40:
	add esp, 0x6c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_FilterEntIntoCells_r_20:
	movzx edx, byte [ebx+0x10]
	movzx eax, word [esi+0x2]
	lea edi, [esi+eax*2]
	cmp edx, 0x2
	ja R_FilterEntIntoCells_r_50
	movss xmm1, dword [ebx+0xc]
	mov eax, [ebp-0x24]
	mov [ebp-0x3c], eax
	mov eax, [ebp-0x20]
	mov [ebp-0x38], eax
	mov eax, [ebp-0x1c]
	mov [ebp-0x34], eax
	movss [ebp+edx*4-0x3c], xmm1
	mov eax, [ebp-0x30]
	mov [ebp-0x48], eax
	mov eax, [ebp-0x2c]
	mov [ebp-0x44], eax
	mov eax, [ebp-0x28]
	mov [ebp-0x40], eax
	movss [ebp+edx*4-0x48], xmm1
	movss xmm0, dword [ebp+edx*4-0x30]
	ucomiss xmm0, xmm1
	ja R_FilterEntIntoCells_r_60
R_FilterEntIntoCells_r_90:
	mov eax, [ebp-0x48]
	mov [ebp-0x30], eax
	mov eax, [ebp-0x44]
	mov [ebp-0x2c], eax
	mov eax, [ebp-0x40]
	mov [ebp-0x28], eax
	mov esi, edi
	jmp R_FilterEntIntoCells_r_70
R_FilterEntIntoCells_r_50:
	lea edx, [esi+0x4]
	lea eax, [ebp-0x30]
	mov [esp], eax
	lea ecx, [ebp-0x24]
	mov eax, [ebp-0x54]
	call R_FilterEntIntoCells_r_80
	mov esi, edi
	jmp R_FilterEntIntoCells_r_70
R_FilterEntIntoCells_r_60:
	lea edx, [esi+0x4]
	lea ecx, [ebp-0x30]
	mov [esp], ecx
	lea ecx, [ebp-0x3c]
	mov eax, [ebp-0x54]
	call R_FilterEntIntoCells_r_80
	jmp R_FilterEntIntoCells_r_90
	nop


;R_GetSidePlaneNormals(float const (*) [3], unsigned int, float (*) [3])
R_GetSidePlaneNormals:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x62c
	mov [ebp-0x62c], eax
	mov esi, edx
	mov [ebp-0x630], ecx
	mov ebx, [dpvsGlob+0x48]
	test ebx, ebx
	jz R_GetSidePlaneNormals_10
	lea edx, [edx-0x1]
	test esi, esi
	jnz R_GetSidePlaneNormals_20
R_GetSidePlaneNormals_50:
	add esp, 0x62c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_GetSidePlaneNormals_10:
	test edx, edx
	jz R_GetSidePlaneNormals_30
	movss xmm3, dword [dpvsGlob+0x38]
	movss xmm2, dword [dpvsGlob+0x3c]
	movss xmm1, dword [dpvsGlob+0x40]
	mov ecx, [ebp-0x62c]
	xor edx, edx
	lea edi, [ebp-0x624]
R_GetSidePlaneNormals_40:
	lea eax, [edx+edx*2]
	lea eax, [edi+eax*4]
	movss xmm0, dword [ecx]
	subss xmm0, xmm3
	movss [eax], xmm0
	movss xmm0, dword [ecx+0x4]
	subss xmm0, xmm2
	movss [eax+0x4], xmm0
	movss xmm0, dword [ecx+0x8]
	subss xmm0, xmm1
	movss [eax+0x8], xmm0
	add edx, 0x1
	add ecx, 0xc
	cmp esi, edx
	jnz R_GetSidePlaneNormals_40
	lea edx, [esi+esi*2]
	lea edx, [edi+edx*4]
	mov eax, [ebp-0x624]
	mov [edx], eax
	mov eax, [ebp-0x620]
	mov [edx+0x4], eax
	mov eax, [ebp-0x61c]
	mov [edx+0x8], eax
	test esi, esi
	jz R_GetSidePlaneNormals_50
R_GetSidePlaneNormals_90:
	xor ebx, ebx
	movss xmm5, dword [_data16_80000000]
	pxor xmm7, xmm7
	movss xmm6, dword [_float_1_00000000]
	mov edx, [ebp-0x630]
	add edx, 0x8
	mov eax, edi
	jmp R_GetSidePlaneNormals_60
R_GetSidePlaneNormals_70:
	movaps xmm1, xmm6
R_GetSidePlaneNormals_80:
	mulss xmm4, xmm1
	movss [edx-0x8], xmm4
	movaps xmm0, xmm1
	mulss xmm0, [edx-0x4]
	movss [edx-0x4], xmm0
	mulss xmm1, [edx]
	movss [edx], xmm1
	add edx, 0xc
	cmp esi, ebx
	jz R_GetSidePlaneNormals_50
R_GetSidePlaneNormals_60:
	add ebx, 0x1
	add eax, 0xc
	movss xmm3, dword [eax+0x4]
	movaps xmm4, xmm3
	mulss xmm4, [eax-0x4]
	movss xmm2, dword [eax+0x8]
	movaps xmm0, xmm2
	mulss xmm0, [eax-0x8]
	subss xmm4, xmm0
	movss [edx-0x8], xmm4
	mulss xmm2, [eax-0xc]
	movss xmm0, dword [eax]
	movaps xmm1, xmm0
	mulss xmm1, [eax-0x4]
	subss xmm2, xmm1
	movss [edx-0x4], xmm2
	mulss xmm0, [eax-0x8]
	mulss xmm3, [eax-0xc]
	subss xmm0, xmm3
	movss [edx], xmm0
	movaps xmm1, xmm4
	mulss xmm1, xmm4
	mulss xmm2, xmm2
	addss xmm1, xmm2
	mulss xmm0, xmm0
	addss xmm1, xmm0
	sqrtss xmm1, xmm1
	movaps xmm0, xmm1
	xorps xmm0, xmm5
	ucomiss xmm0, xmm7
	jae R_GetSidePlaneNormals_70
	movaps xmm0, xmm6
	divss xmm0, xmm1
	movaps xmm1, xmm0
	jmp R_GetSidePlaneNormals_80
R_GetSidePlaneNormals_30:
	lea edi, [ebp-0x624]
	lea edx, [esi+esi*2]
	lea edx, [edi+edx*4]
	mov eax, [ebp-0x624]
	mov [edx], eax
	mov eax, [ebp-0x620]
	mov [edx+0x4], eax
	mov eax, [ebp-0x61c]
	mov [edx+0x8], eax
	test esi, esi
	jz R_GetSidePlaneNormals_50
	jmp R_GetSidePlaneNormals_90
R_GetSidePlaneNormals_20:
	mov ecx, [ebp-0x62c]
	xor edi, edi
	movss xmm5, dword [_data16_80000000]
	pxor xmm7, xmm7
	movss xmm6, dword [_float_1_00000000]
	mov ebx, ecx
	jmp R_GetSidePlaneNormals_100
R_GetSidePlaneNormals_110:
	movaps xmm1, xmm6
R_GetSidePlaneNormals_120:
	mulss xmm3, xmm1
	movss [eax], xmm3
	movaps xmm0, xmm1
	mulss xmm0, [ebx]
	movss [ebx], xmm0
	mulss xmm1, [edx]
	movss [edx], xmm1
	lea eax, [edi+0x1]
	add ecx, 0xc
	mov edx, edi
	cmp esi, eax
	jz R_GetSidePlaneNormals_50
	mov edi, eax
	mov ebx, [ebp-0x62c]
R_GetSidePlaneNormals_100:
	lea edx, [edx+edx*2]
	shl edx, 0x2
	lea eax, [edx+ebx]
	movss xmm0, dword [ecx]
	subss xmm0, [eax]
	movss [ebp-0x624], xmm0
	movss xmm0, dword [ecx+0x4]
	subss xmm0, [eax+0x4]
	movss [ebp-0x620], xmm0
	movss xmm0, dword [ecx+0x8]
	subss xmm0, [eax+0x8]
	movss [ebp-0x61c], xmm0
	mov ebx, [ebp-0x630]
	lea eax, [edx+ebx]
	movss xmm3, dword [dpvsGlob+0x3c]
	mulss xmm3, xmm0
	movss xmm0, dword [dpvsGlob+0x40]
	mulss xmm0, [ebp-0x620]
	subss xmm3, xmm0
	movss [eax], xmm3
	lea ebx, [eax+0x4]
	movss xmm2, dword [dpvsGlob+0x40]
	mulss xmm2, [ebp-0x624]
	movss xmm0, dword [dpvsGlob+0x38]
	mulss xmm0, [ebp-0x61c]
	subss xmm2, xmm0
	movss [eax+0x4], xmm2
	lea edx, [eax+0x8]
	movss xmm1, dword [dpvsGlob+0x38]
	mulss xmm1, [ebp-0x620]
	movss xmm0, dword [dpvsGlob+0x3c]
	mulss xmm0, [ebp-0x624]
	subss xmm1, xmm0
	movss [eax+0x8], xmm1
	movaps xmm0, xmm3
	mulss xmm0, xmm3
	mulss xmm2, xmm2
	addss xmm0, xmm2
	mulss xmm1, xmm1
	addss xmm0, xmm1
	sqrtss xmm1, xmm0
	movaps xmm0, xmm1
	xorps xmm0, xmm5
	ucomiss xmm0, xmm7
	jae R_GetSidePlaneNormals_110
	movaps xmm0, xmm6
	divss xmm0, xmm1
	movaps xmm1, xmm0
	jmp R_GetSidePlaneNormals_120
	nop


;R_GetFurtherCellList_r(GfxCell const*, DpvsPlane const*, DpvsPlane const*, int, float (*) [128][3], GfxCell const**, int)
R_GetFurtherCellList_r:
R_GetFurtherCellList_r_110:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x6c
	mov [ebp-0x5c], eax
	mov [ebp-0x60], edx
	mov [ebp-0x64], ecx
	mov edi, [ebp+0x10]
	mov ebx, [ebp+0x14]
	mov edx, [eax+0x20]
	test edx, edx
	jle R_GetFurtherCellList_r_10
	mov dword [ebp-0x58], 0x0
	mov dword [ebp-0x2c], 0x0
	mov eax, [ebp-0x5c]
R_GetFurtherCellList_r_50:
	mov esi, [ebp-0x2c]
	add esi, [eax+0x24]
	mov edx, [esi+0x20]
	test ebx, ebx
	jle R_GetFurtherCellList_r_20
	cmp edx, [edi]
	jz R_GetFurtherCellList_r_30
	xor eax, eax
R_GetFurtherCellList_r_40:
	add eax, 0x1
	cmp ebx, eax
	jz R_GetFurtherCellList_r_20
	cmp edx, [edi+eax*4]
	jnz R_GetFurtherCellList_r_40
R_GetFurtherCellList_r_30:
	add dword [ebp-0x58], 0x1
	add dword [ebp-0x2c], 0x44
	mov edx, [ebp-0x58]
	mov eax, [ebp-0x5c]
	cmp edx, [eax+0x20]
	jl R_GetFurtherCellList_r_50
R_GetFurtherCellList_r_10:
	mov eax, ebx
	add esp, 0x6c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_GetFurtherCellList_r_20:
	cmp byte [esi+0x1], 0x0
	jnz R_GetFurtherCellList_r_30
	lea eax, [esi+0xc]
	movss xmm1, dword [esi+0xc]
	mulss xmm1, [dpvsGlob+0x38]
	movss xmm0, dword [eax+0x4]
	mulss xmm0, [dpvsGlob+0x3c]
	addss xmm1, xmm0
	movss xmm0, dword [eax+0x8]
	mulss xmm0, [dpvsGlob+0x40]
	addss xmm1, xmm0
	movss xmm0, dword [eax+0xc]
	mulss xmm0, [dpvsGlob+0x44]
	addss xmm1, xmm0
	pxor xmm3, xmm3
	ucomiss xmm1, xmm3
	ja R_GetFurtherCellList_r_30
	mov eax, [ebp+0x8]
	test eax, eax
	jnz R_GetFurtherCellList_r_60
R_GetFurtherCellList_r_140:
	movzx eax, byte [esi+0x28]
	mov [ebp-0x1c], eax
	mov eax, [esi+0x24]
	mov edx, [ebp+0xc]
	mov [esp], edx
	mov ecx, [ebp-0x60]
	lea edx, [ebp-0x1c]
	call R_ChopPortalWinding
	mov [ebp-0x3c], eax
	mov eax, [ebp-0x1c]
	test eax, eax
	jz R_GetFurtherCellList_r_30
	mov ecx, [dpvsGlob+0x2c]
	test ecx, ecx
	jz R_GetFurtherCellList_r_70
	mov eax, 0x600
	mov edx, [ebp-0x3c]
	cmp [ebp+0xc], edx
	mov edx, 0x0
	cmovnz eax, edx
	add eax, [ebp+0xc]
	mov [esp], eax
	lea edx, [ebp-0x1c]
	mov eax, [ebp-0x3c]
	call R_ChopPortalWinding
	mov [ebp-0x3c], eax
	mov eax, [ebp-0x1c]
	test eax, eax
	jz R_GetFurtherCellList_r_30
R_GetFurtherCellList_r_70:
	mov eax, [ebp+0x8]
	test eax, eax
	jle R_GetFurtherCellList_r_80
	mov eax, [ebp-0x64]
	mov [ebp-0x38], eax
	mov dword [ebp-0x40], 0x0
	mov ecx, eax
	jmp R_GetFurtherCellList_r_90
R_GetFurtherCellList_r_100:
	mov ecx, [ebp-0x38]
R_GetFurtherCellList_r_90:
	mov eax, 0x600
	mov edx, [ebp+0xc]
	cmp [ebp-0x3c], edx
	mov edx, 0x0
	cmovnz eax, edx
	add eax, [ebp+0xc]
	mov [esp], eax
	lea edx, [ebp-0x1c]
	mov eax, [ebp-0x3c]
	call R_ChopPortalWinding
	mov [ebp-0x3c], eax
	mov eax, [ebp-0x1c]
	test eax, eax
	jz R_GetFurtherCellList_r_30
	add dword [ebp-0x40], 0x1
	add dword [ebp-0x38], 0x14
	mov eax, [ebp-0x40]
	cmp [ebp+0x8], eax
	jnz R_GetFurtherCellList_r_100
R_GetFurtherCellList_r_80:
	mov eax, [ebp-0x1c]
	test eax, eax
	jz R_GetFurtherCellList_r_30
	mov eax, [esi+0x20]
	mov [edi+ebx*4], eax
	lea edx, [ebx+0x1]
	mov eax, [esi+0x20]
	mov [esp+0xc], edx
	mov [esp+0x8], edi
	mov edx, [ebp+0xc]
	mov [esp+0x4], edx
	mov edx, [ebp+0x8]
	mov [esp], edx
	mov ecx, [ebp-0x64]
	mov edx, [ebp-0x60]
	call R_GetFurtherCellList_r_110
	mov ebx, eax
	jmp R_GetFurtherCellList_r_30
R_GetFurtherCellList_r_60:
	mov edx, [esi+0x24]
	mov [ebp-0x4c], edx
	movzx eax, byte [esi+0x28]
	mov [ebp-0x51], al
	movzx edx, al
	mov [ebp-0x50], edx
	mov eax, [ebp-0x4c]
	add eax, 0x4
	mov [ebp-0x48], eax
	mov edx, [ebp-0x4c]
	add edx, 0x8
	mov [ebp-0x44], edx
	mov ecx, [ebp-0x64]
	mov dword [ebp-0x30], 0x0
R_GetFurtherCellList_r_130:
	cmp byte [ebp-0x51], 0x0
	jz R_GetFurtherCellList_r_30
	movss xmm6, dword [ecx]
	movss xmm5, dword [ecx+0x4]
	movss xmm4, dword [ecx+0x8]
	movss xmm7, dword [ecx+0xc]
	movaps xmm0, xmm4
	mov eax, [ebp-0x44]
	mulss xmm0, [eax]
	movaps xmm1, xmm5
	mov edx, [ebp-0x48]
	mulss xmm1, [edx]
	movaps xmm2, xmm6
	mov eax, [ebp-0x4c]
	mulss xmm2, [eax]
	addss xmm1, xmm2
	addss xmm0, xmm1
	addss xmm0, xmm7
	ucomiss xmm0, xmm3
	jbe R_GetFurtherCellList_r_120
R_GetFurtherCellList_r_160:
	add ecx, 0x14
	add dword [ebp-0x30], 0x1
	mov edx, [ebp+0x8]
	cmp [ebp-0x30], edx
	jnz R_GetFurtherCellList_r_130
	jmp R_GetFurtherCellList_r_140
R_GetFurtherCellList_r_120:
	mov [ebp-0x34], eax
	xor edx, edx
	mov eax, [ebp-0x50]
	sub eax, 0x1
	mov [ebp-0x68], eax
	jmp R_GetFurtherCellList_r_150
R_GetFurtherCellList_r_170:
	mov eax, [ebp-0x34]
	add edx, 0x1
	add dword [ebp-0x34], 0xc
	movaps xmm1, xmm4
	mulss xmm1, [eax+0x14]
	movaps xmm0, xmm6
	mulss xmm0, [eax+0xc]
	movaps xmm2, xmm5
	mulss xmm2, [eax+0x10]
	addss xmm0, xmm2
	addss xmm1, xmm0
	addss xmm1, xmm7
	ucomiss xmm1, xmm3
	ja R_GetFurtherCellList_r_160
R_GetFurtherCellList_r_150:
	cmp edx, [ebp-0x68]
	jnz R_GetFurtherCellList_r_170
	jmp R_GetFurtherCellList_r_30
	nop


;R_VisitPortalsForCellNoFrustum(GfxCell const*, GfxPortal*, DpvsPlane const*, DpvsPlane const*, int, int, unsigned int)
R_VisitPortalsForCellNoFrustum:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0xc6c
	mov [ebp-0xc54], eax
	mov esi, edx
	mov [ebp-0xc58], ecx
	mov eax, rgp
	mov eax, [eax+0x20a0]
	mov edx, [ebp-0xc54]
	sub edx, [eax+0x104]
	sar edx, 0x3
	lea ecx, [edx+edx*8]
	mov eax, ecx
	shl eax, 0x6
	add ecx, eax
	lea ecx, [edx+ecx*8]
	mov eax, ecx
	shl eax, 0xf
	add ecx, eax
	lea ecx, [edx+ecx*8]
	neg ecx
	mov ebx, ecx
	shr ebx, 0x5
	mov edx, [dpvsGlob+0xadf4]
	and ecx, 0x1f
	mov eax, 0x1
	shl eax, cl
	or [edx+ebx*4], eax
	test esi, esi
	jz R_VisitPortalsForCellNoFrustum_10
	mov eax, esi
R_VisitPortalsForCellNoFrustum_20:
	mov byte [eax+0x1], 0x1
	mov eax, [eax+0x8]
	test eax, eax
	jnz R_VisitPortalsForCellNoFrustum_20
R_VisitPortalsForCellNoFrustum_10:
	mov eax, [ebp-0xc54]
	mov eax, [eax+0x20]
	test eax, eax
	jle R_VisitPortalsForCellNoFrustum_30
	mov dword [ebp-0xc50], 0x0
	mov dword [ebp-0xc2c], 0x0
	mov edx, [ebp-0xc54]
R_VisitPortalsForCellNoFrustum_60:
	mov ebx, [ebp-0xc2c]
	add ebx, [edx+0x24]
	cmp byte [ebx+0x1], 0x0
	jnz R_VisitPortalsForCellNoFrustum_40
	lea eax, [ebx+0xc]
	movss xmm1, dword [ebx+0xc]
	mulss xmm1, [dpvsGlob+0x38]
	movss xmm0, dword [eax+0x4]
	mulss xmm0, [dpvsGlob+0x3c]
	addss xmm1, xmm0
	movss xmm0, dword [eax+0x8]
	mulss xmm0, [dpvsGlob+0x40]
	addss xmm1, xmm0
	movss xmm0, dword [eax+0xc]
	mulss xmm0, [dpvsGlob+0x44]
	addss xmm1, xmm0
	pxor xmm3, xmm3
	ucomiss xmm1, xmm3
	jbe R_VisitPortalsForCellNoFrustum_50
R_VisitPortalsForCellNoFrustum_100:
	mov edx, [ebp-0xc54]
R_VisitPortalsForCellNoFrustum_40:
	add dword [ebp-0xc50], 0x1
	add dword [ebp-0xc2c], 0x44
	mov eax, [ebp-0xc50]
	cmp [edx+0x20], eax
	jg R_VisitPortalsForCellNoFrustum_60
	test esi, esi
	jz R_VisitPortalsForCellNoFrustum_70
R_VisitPortalsForCellNoFrustum_80:
	mov byte [esi+0x1], 0x0
	mov esi, [esi+0x8]
R_VisitPortalsForCellNoFrustum_30:
	test esi, esi
	jnz R_VisitPortalsForCellNoFrustum_80
R_VisitPortalsForCellNoFrustum_70:
	add esp, 0xc6c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_VisitPortalsForCellNoFrustum_50:
	mov edi, [ebp+0xc]
	test edi, edi
	jz R_VisitPortalsForCellNoFrustum_90
	mov eax, [ebx+0x24]
	mov [ebp-0xc48], eax
	movzx edx, byte [ebx+0x28]
	mov [ebp-0xc49], dl
	movzx eax, dl
	mov edx, [ebp-0xc48]
	add edx, 0x4
	mov [ebp-0xc44], edx
	mov edx, [ebp-0xc48]
	add edx, 0x8
	mov [ebp-0xc40], edx
	mov edi, [ebp+0x8]
	mov dword [ebp-0xc30], 0x0
	sub eax, 0x1
	mov [ebp-0xc5c], eax
R_VisitPortalsForCellNoFrustum_120:
	cmp byte [ebp-0xc49], 0x0
	jz R_VisitPortalsForCellNoFrustum_100
	movss xmm7, dword [edi]
	movss xmm6, dword [edi+0x4]
	movss xmm5, dword [edi+0x8]
	movss xmm4, dword [edi+0xc]
	movaps xmm0, xmm5
	mov eax, [ebp-0xc40]
	mulss xmm0, [eax]
	movaps xmm1, xmm6
	mov edx, [ebp-0xc44]
	mulss xmm1, [edx]
	movaps xmm2, xmm7
	mov eax, [ebp-0xc48]
	mulss xmm2, [eax]
	addss xmm1, xmm2
	addss xmm0, xmm1
	addss xmm0, xmm4
	ucomiss xmm0, xmm3
	jbe R_VisitPortalsForCellNoFrustum_110
R_VisitPortalsForCellNoFrustum_220:
	add edi, 0x14
	add dword [ebp-0xc30], 0x1
	mov edx, [ebp+0xc]
	cmp [ebp-0xc30], edx
	jnz R_VisitPortalsForCellNoFrustum_120
R_VisitPortalsForCellNoFrustum_90:
	mov ecx, [ebp-0xc58]
	test ecx, ecx
	jz R_VisitPortalsForCellNoFrustum_130
	movzx eax, byte [ebx+0x28]
	mov [ebp-0x1c], eax
	mov eax, [ebx+0x24]
	lea edx, [ebp-0xc1c]
	mov [esp], edx
	mov ecx, [ebp-0xc58]
	lea edx, [ebp-0x1c]
	call R_ChopPortalWinding
	mov edx, [ebp-0x1c]
	test edx, edx
	jz R_VisitPortalsForCellNoFrustum_100
	mov ecx, [dpvsGlob+0x2c]
	test ecx, ecx
	jz R_VisitPortalsForCellNoFrustum_140
	lea edx, [ebp-0xc1c]
	cmp edx, eax
	jz R_VisitPortalsForCellNoFrustum_150
R_VisitPortalsForCellNoFrustum_260:
	mov [esp], edx
	lea edx, [ebp-0x1c]
	call R_ChopPortalWinding
	mov edi, [ebp-0x1c]
	test edi, edi
	jz R_VisitPortalsForCellNoFrustum_100
R_VisitPortalsForCellNoFrustum_140:
	mov ecx, [ebp+0xc]
	test ecx, ecx
	jle R_VisitPortalsForCellNoFrustum_160
	mov edi, [ebp+0x8]
	mov dword [ebp-0xc34], 0x0
	jmp R_VisitPortalsForCellNoFrustum_170
R_VisitPortalsForCellNoFrustum_180:
	mov [esp], edx
	mov ecx, edi
	lea edx, [ebp-0x1c]
	call R_ChopPortalWinding
	mov edx, [ebp-0x1c]
	test edx, edx
	jz R_VisitPortalsForCellNoFrustum_100
	add dword [ebp-0xc34], 0x1
	add edi, 0x14
	mov edx, [ebp-0xc34]
	cmp [ebp+0xc], edx
	jz R_VisitPortalsForCellNoFrustum_160
R_VisitPortalsForCellNoFrustum_170:
	lea edx, [ebp-0xc1c]
	cmp eax, edx
	jnz R_VisitPortalsForCellNoFrustum_180
	lea edx, [ebp-0x61c]
	jmp R_VisitPortalsForCellNoFrustum_180
R_VisitPortalsForCellNoFrustum_130:
	movzx eax, byte [ebx+0x28]
	mov [ebp-0xc3c], eax
	mov eax, [ebx+0x24]
R_VisitPortalsForCellNoFrustum_230:
	mov edi, [ebp-0xc3c]
	test edi, edi
	jg R_VisitPortalsForCellNoFrustum_190
R_VisitPortalsForCellNoFrustum_250:
	cmp byte [ebx], 0x0
	jz R_VisitPortalsForCellNoFrustum_200
	movzx eax, byte [ebx+0x2]
	cmp eax, [ebp+0x14]
	cmovge eax, [ebp+0x14]
	mov [ebx+0x2], al
	cmp esi, [ebx+0x8]
	jz R_VisitPortalsForCellNoFrustum_100
	mov dword [ebx+0x8], 0x0
	mov edx, [ebp-0xc54]
	jmp R_VisitPortalsForCellNoFrustum_40
R_VisitPortalsForCellNoFrustum_110:
	mov ecx, eax
	xor edx, edx
R_VisitPortalsForCellNoFrustum_210:
	cmp [ebp-0xc5c], edx
	jz R_VisitPortalsForCellNoFrustum_100
	mov eax, ecx
	add edx, 0x1
	add ecx, 0xc
	movaps xmm0, xmm7
	mulss xmm0, [eax+0xc]
	movaps xmm1, xmm6
	mulss xmm1, [eax+0x10]
	addss xmm0, xmm1
	movaps xmm1, xmm5
	mulss xmm1, [eax+0x14]
	addss xmm0, xmm1
	addss xmm0, xmm4
	ucomiss xmm0, xmm3
	jbe R_VisitPortalsForCellNoFrustum_210
	jmp R_VisitPortalsForCellNoFrustum_220
R_VisitPortalsForCellNoFrustum_160:
	mov edx, [ebp-0x1c]
	mov [ebp-0xc3c], edx
	test edx, edx
	jz R_VisitPortalsForCellNoFrustum_100
	jmp R_VisitPortalsForCellNoFrustum_230
R_VisitPortalsForCellNoFrustum_200:
	movzx eax, byte [ebp+0x14]
	mov [ebx+0x2], al
	mov [ebx+0x8], esi
	mov eax, ebx
	call R_EnqueuePortal
	mov edx, [ebp-0xc54]
	jmp R_VisitPortalsForCellNoFrustum_40
R_VisitPortalsForCellNoFrustum_190:
	mov edi, eax
	mov dword [ebp-0xc38], 0x0
R_VisitPortalsForCellNoFrustum_240:
	mov edx, edi
	mov eax, ebx
	call R_AddVertToPortalHullPoints
	add dword [ebp-0xc38], 0x1
	add edi, 0xc
	mov edx, [ebp-0xc38]
	cmp [ebp-0xc3c], edx
	jnz R_VisitPortalsForCellNoFrustum_240
	jmp R_VisitPortalsForCellNoFrustum_250
R_VisitPortalsForCellNoFrustum_150:
	lea edx, [ebp-0x61c]
	jmp R_VisitPortalsForCellNoFrustum_260


;R_VisitPortalsForCell(GfxCell const*, GfxPortal*, DpvsPlane const*, DpvsPlane const*, int, int, unsigned int, DpvsClipChildren)
R_VisitPortalsForCell:
R_VisitPortalsForCell_120:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x1c8c
	mov [ebp-0x1c68], eax
	mov edi, edx
	mov [ebp-0x1c6c], ecx
	mov eax, [ebp+0x10]
	mov [esp], eax
	mov ecx, [ebp+0xc]
	mov edx, [ebp+0x8]
	mov eax, [ebp-0x1c68]
	call R_AddCellSurfacesAndCullGroupsInFrustumDelayed
	mov eax, rgp
	mov eax, [eax+0x20a0]
	mov edx, [ebp-0x1c68]
	sub edx, [eax+0x104]
	sar edx, 0x3
	lea ecx, [edx+edx*8]
	mov eax, ecx
	shl eax, 0x6
	add ecx, eax
	lea ecx, [edx+ecx*8]
	mov eax, ecx
	shl eax, 0xf
	add ecx, eax
	lea ecx, [edx+ecx*8]
	neg ecx
	mov ebx, ecx
	shr ebx, 0x5
	mov edx, [dpvsGlob+0xadf4]
	and ecx, 0x1f
	mov eax, 0x1
	shl eax, cl
	or [edx+ebx*4], eax
	test edi, edi
	jz R_VisitPortalsForCell_10
	mov eax, edi
R_VisitPortalsForCell_20:
	mov byte [eax+0x1], 0x1
	mov eax, [eax+0x8]
	test eax, eax
	jnz R_VisitPortalsForCell_20
R_VisitPortalsForCell_10:
	mov ebx, [ebp+0x18]
	test ebx, ebx
	jz R_VisitPortalsForCell_30
	mov eax, [ebp-0x1c68]
	mov eax, [eax+0x20]
	test eax, eax
	jle R_VisitPortalsForCell_40
	mov dword [ebp-0x1c60], 0x0
	mov dword [ebp-0x1c2c], 0x0
	mov eax, [ebp-0x1c68]
	jmp R_VisitPortalsForCell_50
R_VisitPortalsForCell_70:
	mov eax, [ebp-0x1c68]
R_VisitPortalsForCell_60:
	add dword [ebp-0x1c60], 0x1
	add dword [ebp-0x1c2c], 0x44
	mov edx, [ebp-0x1c60]
	cmp edx, [eax+0x20]
	jge R_VisitPortalsForCell_40
R_VisitPortalsForCell_50:
	mov esi, [ebp-0x1c2c]
	add esi, [eax+0x24]
	cmp byte [esi+0x1], 0x0
	jnz R_VisitPortalsForCell_60
	lea eax, [esi+0xc]
	movss xmm1, dword [esi+0xc]
	mulss xmm1, [dpvsGlob+0x38]
	movss xmm0, dword [eax+0x4]
	mulss xmm0, [dpvsGlob+0x3c]
	addss xmm1, xmm0
	movss xmm0, dword [eax+0x8]
	mulss xmm0, [dpvsGlob+0x40]
	addss xmm1, xmm0
	movss xmm0, dword [eax+0xc]
	mulss xmm0, [dpvsGlob+0x44]
	addss xmm1, xmm0
	pxor xmm2, xmm2
	ucomiss xmm1, xmm2
	ja R_VisitPortalsForCell_70
	mov ecx, [ebp+0xc]
	test ecx, ecx
	jz R_VisitPortalsForCell_80
	mov edx, [esi+0x24]
	mov [ebp-0x1c4c], edx
	movzx eax, byte [esi+0x28]
	mov [ebp-0x1c51], al
	movzx edx, al
	mov [ebp-0x1c50], edx
	mov eax, [ebp-0x1c4c]
	add eax, 0x4
	mov [ebp-0x1c48], eax
	mov edx, [ebp-0x1c4c]
	add edx, 0x8
	mov [ebp-0x1c44], edx
	mov ebx, [ebp+0x8]
	mov dword [ebp-0x1c30], 0x0
R_VisitPortalsForCell_100:
	cmp byte [ebp-0x1c51], 0x0
	jz R_VisitPortalsForCell_70
	movss xmm6, dword [ebx]
	movss xmm5, dword [ebx+0x4]
	movss xmm4, dword [ebx+0x8]
	movss xmm3, dword [ebx+0xc]
	movaps xmm0, xmm6
	mov eax, [ebp-0x1c4c]
	mulss xmm0, [eax]
	movaps xmm1, xmm5
	mov edx, [ebp-0x1c48]
	mulss xmm1, [edx]
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mov eax, [ebp-0x1c44]
	mulss xmm1, [eax]
	addss xmm0, xmm1
	addss xmm0, xmm3
	ucomiss xmm0, xmm2
	jbe R_VisitPortalsForCell_90
R_VisitPortalsForCell_240:
	add ebx, 0x14
	add dword [ebp-0x1c30], 0x1
	mov edx, [ebp+0xc]
	cmp [ebp-0x1c30], edx
	jnz R_VisitPortalsForCell_100
R_VisitPortalsForCell_80:
	lea eax, [esi+0xc]
	mov [ebp-0x1c64], eax
	movss xmm1, dword [esi+0xc]
	mulss xmm1, [dpvsGlob+0x38]
	movss xmm0, dword [eax+0x4]
	mulss xmm0, [dpvsGlob+0x3c]
	addss xmm1, xmm0
	movss xmm0, dword [eax+0x8]
	mulss xmm0, [dpvsGlob+0x40]
	addss xmm1, xmm0
	movss xmm0, dword [eax+0xc]
	mulss xmm0, [dpvsGlob+0x44]
	addss xmm1, xmm0
	ucomiss xmm1, [_float__0_12500000]
	jbe R_VisitPortalsForCell_110
	movzx ebx, byte [esi+0x28]
	mov edx, [esi+0x24]
	mov [ebp-0x1c40], edx
	lea eax, [ebp-0x20]
	mov [esp+0x8], eax
	lea eax, [ebp-0x1c]
	mov [esp+0x4], eax
	mov eax, [ebp-0x1c64]
	mov [esp], eax
	call Vec3ProjectionCoords
	mov dword [esp+0x10], dpvsGlob+0x38
	mov eax, [ebp-0x20]
	mov [esp+0xc], eax
	mov eax, [ebp-0x1c]
	mov [esp+0x8], eax
	mov [esp+0x4], ebx
	mov edx, [ebp-0x1c40]
	mov [esp], edx
	call ProjectedWindingContainsCoplanarPoint
	test eax, eax
	jz R_VisitPortalsForCell_70
	mov dword [esi+0x8], 0x0
	mov eax, [esi+0x20]
	mov edx, [ebp+0x18]
	mov [esp+0x10], edx
	movzx edx, byte [esi+0x2]
	add edx, 0x1
	mov [esp+0xc], edx
	mov edx, [ebp+0x10]
	mov [esp+0x8], edx
	mov edx, [ebp+0xc]
	mov [esp+0x4], edx
	mov edx, [ebp+0x8]
	mov [esp], edx
	mov ecx, [ebp-0x1c64]
	mov edx, esi
	call R_VisitPortalsForCell_120
	mov eax, [ebp-0x1c68]
	jmp R_VisitPortalsForCell_60
R_VisitPortalsForCell_130:
	mov byte [edi+0x1], 0x0
	mov edi, [edi+0x8]
R_VisitPortalsForCell_40:
	test edi, edi
	jnz R_VisitPortalsForCell_130
	add esp, 0x1c8c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_VisitPortalsForCell_30:
	mov dword [esp+0xc], 0x0
	lea ebx, [ebp-0x1c20]
	mov [esp+0x8], ebx
	lea eax, [ebp-0xc20]
	mov [esp+0x4], eax
	mov edx, [ebp+0xc]
	mov [esp], edx
	mov ecx, [ebp+0x8]
	mov edx, [ebp-0x1c6c]
	mov eax, [ebp-0x1c68]
	call R_GetFurtherCellList_r
	mov [ebp-0x1c5c], eax
	test eax, eax
	jle R_VisitPortalsForCell_140
	jmp R_VisitPortalsForCell_150
R_VisitPortalsForCell_160:
	mov byte [edi+0x1], 0x0
	mov edi, [edi+0x8]
R_VisitPortalsForCell_140:
	test edi, edi
	jnz R_VisitPortalsForCell_160
	add esp, 0x1c8c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_VisitPortalsForCell_110:
	movzx eax, byte [esi+0x28]
	mov [ebp-0x20], eax
	mov eax, [esi+0x24]
	lea edx, [ebp-0xc20]
	mov [esp], edx
	mov ecx, [ebp-0x1c6c]
	lea edx, [ebp-0x20]
	call R_ChopPortalWinding
	mov edx, [ebp-0x20]
	test edx, edx
	jz R_VisitPortalsForCell_70
	mov ecx, [dpvsGlob+0x2c]
	test ecx, ecx
	jz R_VisitPortalsForCell_170
	lea edx, [ebp-0xc20]
	cmp edx, eax
	jz R_VisitPortalsForCell_180
R_VisitPortalsForCell_270:
	mov [esp], edx
	lea edx, [ebp-0x20]
	call R_ChopPortalWinding
	mov ebx, [ebp-0x20]
	test ebx, ebx
	jz R_VisitPortalsForCell_70
R_VisitPortalsForCell_170:
	mov ecx, [ebp+0xc]
	test ecx, ecx
	jle R_VisitPortalsForCell_190
	mov ebx, [ebp+0x8]
	mov dword [ebp-0x1c34], 0x0
	jmp R_VisitPortalsForCell_200
R_VisitPortalsForCell_210:
	mov [esp], edx
	mov ecx, ebx
	lea edx, [ebp-0x20]
	call R_ChopPortalWinding
	mov edx, [ebp-0x20]
	test edx, edx
	jz R_VisitPortalsForCell_70
	add dword [ebp-0x1c34], 0x1
	add ebx, 0x14
	mov edx, [ebp-0x1c34]
	cmp [ebp+0xc], edx
	jz R_VisitPortalsForCell_190
R_VisitPortalsForCell_200:
	lea edx, [ebp-0xc20]
	cmp edx, eax
	jnz R_VisitPortalsForCell_210
	lea edx, [ebp-0x620]
	jmp R_VisitPortalsForCell_210
R_VisitPortalsForCell_150:
	mov dword [ebp-0x1c58], 0x0
	mov esi, ebx
R_VisitPortalsForCell_220:
	mov eax, [ebp+0x10]
	mov [esp], eax
	mov ecx, [ebp+0xc]
	mov edx, [ebp+0x8]
	mov eax, [esi]
	call R_AddCellSurfacesAndCullGroupsInFrustumDelayed
	mov eax, rgp
	mov edx, [eax+0x20a0]
	mov eax, [esi]
	sub eax, [edx+0x104]
	sar eax, 0x3
	lea ecx, [eax+eax*8]
	mov edx, ecx
	shl edx, 0x6
	add ecx, edx
	lea ecx, [eax+ecx*8]
	mov edx, ecx
	shl edx, 0xf
	add ecx, edx
	lea ecx, [eax+ecx*8]
	neg ecx
	mov ebx, ecx
	shr ebx, 0x5
	mov edx, [dpvsGlob+0xadf4]
	and ecx, 0x1f
	mov eax, 0x1
	shl eax, cl
	or [edx+ebx*4], eax
	add dword [ebp-0x1c58], 0x1
	add esi, 0x4
	mov edx, [ebp-0x1c58]
	cmp [ebp-0x1c5c], edx
	jnz R_VisitPortalsForCell_220
	jmp R_VisitPortalsForCell_140
R_VisitPortalsForCell_90:
	mov ecx, [ebp-0x1c4c]
	xor edx, edx
	mov eax, [ebp-0x1c50]
	sub eax, 0x1
	mov [ebp-0x1c70], eax
R_VisitPortalsForCell_230:
	cmp [ebp-0x1c70], edx
	jz R_VisitPortalsForCell_70
	mov eax, ecx
	add edx, 0x1
	add ecx, 0xc
	movaps xmm0, xmm6
	mulss xmm0, [eax+0xc]
	movaps xmm1, xmm5
	mulss xmm1, [eax+0x10]
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mulss xmm1, [eax+0x14]
	addss xmm0, xmm1
	addss xmm0, xmm3
	ucomiss xmm0, xmm2
	jbe R_VisitPortalsForCell_230
	jmp R_VisitPortalsForCell_240
R_VisitPortalsForCell_190:
	mov edx, [ebp-0x20]
	mov [ebp-0x1c3c], edx
	cmp edx, 0x0
	jz R_VisitPortalsForCell_70
	jg R_VisitPortalsForCell_250
R_VisitPortalsForCell_290:
	cmp byte [esi], 0x0
	jz R_VisitPortalsForCell_260
	movzx eax, byte [esi+0x2]
	cmp eax, [ebp+0x14]
	cmovge eax, [ebp+0x14]
	mov [esi+0x2], al
	cmp edi, [esi+0x8]
	jz R_VisitPortalsForCell_70
	mov dword [esi+0x8], 0x0
	mov eax, [ebp-0x1c68]
	jmp R_VisitPortalsForCell_60
R_VisitPortalsForCell_180:
	lea edx, [ebp-0x620]
	jmp R_VisitPortalsForCell_270
R_VisitPortalsForCell_260:
	movzx edx, byte [ebp+0x14]
	mov [esi+0x2], dl
	mov [esi+0x8], edi
	mov eax, esi
	call R_EnqueuePortal
	mov eax, [ebp-0x1c68]
	jmp R_VisitPortalsForCell_60
R_VisitPortalsForCell_250:
	mov ebx, eax
	mov dword [ebp-0x1c38], 0x0
R_VisitPortalsForCell_280:
	mov edx, ebx
	mov eax, esi
	call R_AddVertToPortalHullPoints
	add dword [ebp-0x1c38], 0x1
	add ebx, 0xc
	mov eax, [ebp-0x1c3c]
	cmp [ebp-0x1c38], eax
	jnz R_VisitPortalsForCell_280
	jmp R_VisitPortalsForCell_290


;R_VisitPortals(GfxCell const*, DpvsPlane const*, DpvsPlane const*, int)
R_VisitPortals:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x17dc
	mov esi, [ebp+0x14]
	mov dword [esp+0x4], 0x20000
	lea eax, [ebp-0x20]
	mov [esp], eax
	call _ZN10LargeLocalC1Ei
	lea edx, [ebp-0x20]
	mov [esp], edx
	call _ZN10LargeLocal6GetBufEv
	mov ecx, eax
	xor ebx, ebx
	mov edx, eax
R_VisitPortals_10:
	add ebx, 0x1
	add edx, 0x200
	mov [ecx], edx
	add ecx, 0x200
	cmp ebx, 0xff
	jnz R_VisitPortals_10
	mov dword [eax+0x1fe00], 0x0
	mov [dpvsGlob+0x54], eax
	lea ebx, [ebp-0x1770]
	mov [dpvsGlob+0x50], ebx
	mov dword [dpvsGlob+0x4c], 0x0
	mov dword [esp+0x10], 0x1
	mov dword [esp+0xc], 0x0
	mov [esp+0x8], esi
	mov [esp+0x4], esi
	mov eax, [ebp+0x10]
	mov [esp], eax
	mov ecx, [ebp+0xc]
	xor edx, edx
	mov eax, [ebp+0x8]
	call R_VisitPortalsForCell
	mov dword [ebp-0x179c], 0x0
	mov dword [ebp-0x17a4], 0x0
R_VisitPortals_40:
	mov esi, [dpvsGlob+0x4c]
	test esi, esi
	jz R_VisitPortals_20
R_VisitPortals_290:
	mov eax, [dpvsGlob+0x50]
	mov eax, [eax]
	mov [ebp-0x17b0], eax
	mov byte [eax], 0x0
	mov eax, [dpvsGlob+0x4c]
	sub eax, 0x1
	mov [dpvsGlob+0x4c], eax
	test eax, eax
	jg R_VisitPortals_30
	lea edx, [eax*8]
	xor esi, esi
	mov ebx, [dpvsGlob+0x50]
R_VisitPortals_450:
	mov eax, [ebx+edx]
	mov edx, [ebx+edx+0x4]
	mov [ebx+esi], eax
	mov [ebx+esi+0x4], edx
	lea eax, [ebp-0x250]
	mov [esp+0x8], eax
	mov edx, [ebp-0x17b0]
	movzx eax, byte [edx+0x3]
	mov [esp+0x4], eax
	mov eax, [edx+0x4]
	mov [esp], eax
	call Com_ConvexHull
	mov [ebp-0x17ac], eax
	mov ecx, [ebp-0x17b0]
	mov edx, [ecx+0x4]
	mov eax, [dpvsGlob+0x54]
	mov [edx], eax
	mov [dpvsGlob+0x54], edx
	mov dword [ecx+0x4], 0x0
	mov edx, [ebp-0x17ac]
	test edx, edx
	jz R_VisitPortals_40
	add dword [ebp-0x17a4], 0x1
	mov eax, r_portalWalkLimit
	mov eax, [eax]
	mov ebx, [ebp-0x17a4]
	cmp ebx, [eax+0xc]
	jz R_VisitPortals_50
	movss xmm0, dword [ecx+0x18]
	xorps xmm0, [_data16_80000000]
	add ecx, 0xc
	mov [ebp-0x17b4], ecx
	movaps xmm4, xmm0
	mov edi, [ebp-0x17b0]
	mulss xmm4, [edi+0xc]
	movaps xmm3, xmm0
	mulss xmm3, [ecx+0x4]
	movaps xmm2, xmm0
	mulss xmm2, [ecx+0x8]
	xor ecx, ecx
	lea esi, [edi+0x2c]
	lea ebx, [edi+0x38]
	xor edx, edx
	lea eax, [ebp-0x550]
	jmp R_VisitPortals_60
R_VisitPortals_70:
	mov edi, [ebp-0x17b0]
R_VisitPortals_60:
	movss xmm1, dword [edx+ebp-0x250]
	movaps xmm0, xmm1
	mulss xmm0, [edi+0x2c]
	addss xmm0, xmm4
	movss [eax], xmm0
	movaps xmm0, xmm1
	mulss xmm0, [esi+0x4]
	addss xmm0, xmm3
	movss [eax+0x4], xmm0
	mulss xmm1, [esi+0x8]
	addss xmm1, xmm2
	movss [eax+0x8], xmm1
	movss xmm1, dword [edx+ebp-0x24c]
	movaps xmm0, xmm1
	mulss xmm0, [edi+0x38]
	addss xmm0, [eax]
	movss [eax], xmm0
	movaps xmm0, xmm1
	mulss xmm0, [ebx+0x4]
	addss xmm0, [eax+0x4]
	movss [eax+0x4], xmm0
	mulss xmm1, [ebx+0x8]
	addss xmm1, [eax+0x8]
	movss [eax+0x8], xmm1
	add ecx, 0x1
	add eax, 0xc
	add edx, 0x8
	cmp [ebp-0x17ac], ecx
	jnz R_VisitPortals_70
	mov eax, r_showPortals
	mov eax, [eax]
	mov eax, [eax+0xc]
	test eax, eax
	jz R_VisitPortals_80
	mov eax, r_portalBevelsOnly
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_VisitPortals_90
R_VisitPortals_80:
	mov eax, [ebp-0x179c]
	add eax, 0x10
	cmp eax, 0x800
	ja R_VisitPortals_100
R_VisitPortals_690:
	mov edx, [ebp-0x179c]
	lea eax, [edx+edx*4]
	lea eax, [eax*4+dpvsGlob+0x5c]
	mov [ebp-0x17a8], eax
	cmp dword [ebp-0x17ac], 0xa
	setbe byte [ebp-0x178d]
	cmp byte [ebp-0x178d], 0x0
	jz R_VisitPortals_110
	mov eax, r_portalBevelsOnly
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jnz R_VisitPortals_110
	mov eax, r_portalBevels
	mov eax, [eax]
	movss xmm0, dword [eax+0xc]
	ucomiss xmm0, [_float_0_00000000]
	jbe R_VisitPortals_120
	mov edi, 0x1
	mov dword [ebp-0x178c], 0x0
R_VisitPortals_460:
	lea ecx, [ebp-0xf70]
	mov edx, [ebp-0x17ac]
	lea eax, [ebp-0x550]
	call R_GetSidePlaneNormals
	mov ecx, edi
	test cl, cl
	jnz R_VisitPortals_130
	mov eax, r_portalMinClipArea
	mov eax, [eax]
	movss xmm0, dword [eax+0xc]
	pxor xmm1, xmm1
	ucomiss xmm0, xmm1
	jbe R_VisitPortals_140
R_VisitPortals_130:
	mov eax, [ebp-0x17ac]
	test eax, eax
	jg R_VisitPortals_150
	mov dword [ebp-0x1788], 0x3f800000
	mov dword [ebp-0x1780], 0x3f800000
	movss xmm6, dword [_float__1_00000000]
	movaps xmm7, xmm6
	movss xmm1, dword [_float__2_00000000]
	movaps xmm0, xmm1
R_VisitPortals_760:
	mulss xmm1, xmm0
	mulss xmm1, [_float_0_25000000]
	mov ebx, r_portalMinClipArea
	mov eax, [ebx]
	movss xmm0, dword [eax+0xc]
	ucomiss xmm0, xmm1
	jbe R_VisitPortals_160
	mov dword [ebp-0x17a0], 0x0
R_VisitPortals_720:
	mov eax, edi
	test al, al
	jnz R_VisitPortals_170
R_VisitPortals_500:
	mov dword [ebp-0x1794], 0x0
R_VisitPortals_590:
	cmp byte [ebp-0x178d], 0x0
	jz R_VisitPortals_180
	xor edi, edi
	lea esi, [ebp-0x550]
	movss xmm5, dword [_float_0_00100000]
	lea ecx, [ebp-0xf70]
	mov ebx, [ebp-0x1794]
	lea eax, [ebx+ebx*4]
	mov edx, [ebp-0x17a8]
	lea ebx, [edx+eax*4]
R_VisitPortals_210:
	movss xmm2, dword [ecx]
	movss xmm3, dword [ecx+0x4]
	movss xmm4, dword [ecx+0x8]
	movaps xmm0, xmm2
	mulss xmm0, xmm2
	movaps xmm1, xmm3
	mulss xmm1, xmm3
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mulss xmm1, xmm4
	addss xmm0, xmm1
	pxor xmm1, xmm1
	ucomiss xmm0, xmm1
	jp R_VisitPortals_190
	jz R_VisitPortals_200
R_VisitPortals_190:
	movss [ebx], xmm2
	movss [ebx+0x4], xmm3
	movss [ebx+0x8], xmm4
	movaps xmm0, xmm2
	mulss xmm0, [esi]
	movaps xmm1, xmm3
	mulss xmm1, [esi+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mulss xmm1, [esi+0x8]
	addss xmm0, xmm1
	movaps xmm1, xmm5
	subss xmm1, xmm0
	movss [ebx+0xc], xmm1
	movss [ebp-0x17bc], xmm2
	mov edx, [ebp-0x17bc]
	mov eax, 0xc
	test edx, edx
	mov edx, 0x0
	cmovle eax, edx
	mov [ebx+0x10], al
	movss [ebp-0x17bc], xmm3
	mov edx, [ebp-0x17bc]
	mov eax, 0x10
	test edx, edx
	mov edx, 0x4
	cmovle eax, edx
	mov [ebx+0x11], al
	movss [ebp-0x17bc], xmm4
	mov edx, [ebp-0x17bc]
	mov eax, 0x14
	test edx, edx
	mov edx, 0x8
	cmovle eax, edx
	mov [ebx+0x12], al
	add dword [ebp-0x1794], 0x1
	add ebx, 0x14
R_VisitPortals_200:
	add edi, 0x1
	add ecx, 0xc
	add esi, 0xc
	cmp [ebp-0x17ac], edi
	jnz R_VisitPortals_210
R_VisitPortals_180:
	mov edx, [ebp-0x1794]
	lea eax, [edx+edx*4]
	mov ecx, [ebp-0x17a8]
	lea esi, [ecx+eax*4]
	mov edx, [dpvsGlob+0x28]
	mov eax, [edx]
	mov [esi], eax
	mov eax, [edx+0x4]
	mov [esi+0x4], eax
	mov eax, [edx+0x8]
	mov [esi+0x8], eax
	mov eax, [edx+0xc]
	mov [esi+0xc], eax
	mov eax, [edx+0x10]
	mov [esi+0x10], eax
	movss xmm7, dword [esi]
	movss xmm6, dword [esi+0x4]
	movss xmm5, dword [esi+0x8]
	movss xmm4, dword [esi+0xc]
	movaps xmm3, xmm7
	mulss xmm3, [ebp-0x550]
	movaps xmm0, xmm6
	mulss xmm0, [ebp-0x54c]
	addss xmm3, xmm0
	movaps xmm0, xmm5
	mulss xmm0, [ebp-0x548]
	addss xmm3, xmm0
	addss xmm3, xmm4
	mov ebx, [ebp-0x17ac]
	lea eax, [ebx+ebx*2]
	lea eax, [ebp+eax*4-0x550]
	lea edx, [eax-0xc]
	movaps xmm2, xmm7
	mulss xmm2, [eax-0xc]
	movaps xmm0, xmm6
	mulss xmm0, [edx+0x4]
	addss xmm2, xmm0
	movaps xmm0, xmm5
	mulss xmm0, [edx+0x8]
	addss xmm2, xmm0
	addss xmm2, xmm4
	ucomiss xmm2, xmm3
	ja R_VisitPortals_220
	mov eax, ebx
	sub eax, 0x2
	test eax, eax
	jle R_VisitPortals_230
	lea eax, [eax+eax*2]
	lea edx, [eax*4]
	lea eax, [ebp-0x550]
	add eax, edx
	movaps xmm3, xmm5
	mulss xmm3, [eax+0x8]
	movaps xmm0, xmm6
	mulss xmm0, [eax+0x4]
	movaps xmm1, xmm7
	mulss xmm1, [eax]
	addss xmm0, xmm1
	addss xmm3, xmm0
	addss xmm3, xmm4
	ucomiss xmm3, xmm2
	ja R_VisitPortals_230
	lea ebx, [edx-0xc]
	xor ecx, ecx
	mov edi, [ebp-0x17ac]
	lea edx, [edi-0x3]
	jmp R_VisitPortals_240
R_VisitPortals_260:
	movaps xmm3, xmm2
R_VisitPortals_240:
	cmp edx, ecx
	jz R_VisitPortals_250
	lea eax, [ebp-0x550]
	add eax, ebx
	movaps xmm2, xmm5
	mulss xmm2, [eax+0x8]
	movaps xmm0, xmm7
	mulss xmm0, [eax]
	movaps xmm1, xmm6
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	addss xmm2, xmm0
	addss xmm2, xmm4
	add ecx, 0x1
	sub ebx, 0xc
	ucomiss xmm2, xmm3
	jbe R_VisitPortals_260
R_VisitPortals_250:
	pxor xmm0, xmm0
	ucomiss xmm3, xmm0
	jbe R_VisitPortals_270
	subss xmm4, xmm3
	movss [esi+0xc], xmm4
R_VisitPortals_270:
	mov ebx, [ebp-0x1794]
	add ebx, 0x1
	mov ecx, [dpvsGlob+0x2c]
	test ecx, ecx
	jz R_VisitPortals_280
	lea eax, [ebx+ebx*4]
	shl eax, 0x2
	mov edx, [ecx]
	mov ebx, [ebp-0x17a8]
	mov [eax+ebx], edx
	mov edx, [ecx+0x4]
	mov [eax+ebx+0x4], edx
	mov edx, [ecx+0x8]
	mov [eax+ebx+0x8], edx
	mov edx, [ecx+0xc]
	mov [eax+ebx+0xc], edx
	mov edx, [ecx+0x10]
	mov [eax+ebx+0x10], edx
	mov ebx, [ebp-0x1794]
	add ebx, 0x2
R_VisitPortals_280:
	add [ebp-0x179c], ebx
	mov edi, [ebp-0x17b0]
	movzx edx, byte [edi+0x2]
	mov eax, r_portalMinRecurseDepth
	mov eax, [eax]
	cmp edx, [eax+0xc]
	mov eax, 0x1
	cmovge eax, [ebp-0x17a0]
	mov [ebp-0x17a0], eax
	mov eax, [edi+0x20]
	mov ecx, [ebp-0x17a0]
	mov [esp+0x10], ecx
	add edx, 0x1
	mov [esp+0xc], edx
	mov dword [esp+0x8], 0x0
	mov [esp+0x4], ebx
	mov ebx, [ebp-0x17a8]
	mov [esp], ebx
	mov ecx, [ebp-0x17b4]
	mov edx, edi
	call R_VisitPortalsForCell
	mov esi, [dpvsGlob+0x4c]
	test esi, esi
	jnz R_VisitPortals_290
R_VisitPortals_20:
	lea edi, [ebp-0x20]
	mov [esp], edi
	call _ZN10LargeLocalD1Ev
	add esp, 0x17dc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_VisitPortals_310:
	lea edx, [eax*8]
	xor esi, esi
	mov ebx, [dpvsGlob+0x50]
R_VisitPortals_380:
	mov eax, [edx+ebx]
	mov edx, [edx+ebx+0x4]
	mov [esi+ebx], eax
	mov [esi+ebx+0x4], edx
	mov eax, [ebp-0x177c]
	mov edx, [eax+0x4]
	mov eax, [dpvsGlob+0x54]
	mov [edx], eax
	mov [dpvsGlob+0x54], edx
	mov edx, [ebp-0x177c]
	mov dword [edx+0x4], 0x0
R_VisitPortals_50:
	mov eax, [dpvsGlob+0x4c]
	test eax, eax
	jz R_VisitPortals_300
	mov eax, [dpvsGlob+0x50]
	mov eax, [eax]
	mov [ebp-0x177c], eax
	mov byte [eax], 0x0
	mov eax, [dpvsGlob+0x4c]
	sub eax, 0x1
	mov [dpvsGlob+0x4c], eax
	test eax, eax
	jle R_VisitPortals_310
	mov dword [ebp-0x1798], 0x0
	xor edi, edi
	mov ecx, 0x1
	jmp R_VisitPortals_320
R_VisitPortals_350:
	lea esi, [ecx*8]
	mov ebx, [dpvsGlob+0x50]
R_VisitPortals_360:
	lea edx, [eax*8]
	lea eax, [esi+ebx]
	movss xmm0, dword [eax+0x4]
	ucomiss xmm0, [ebx+edx+0x4]
	jae R_VisitPortals_330
R_VisitPortals_370:
	mov edx, [eax+0x4]
	mov eax, [eax]
	mov edi, [ebp-0x1798]
	mov [ebx+edi*8], eax
	mov [ebx+edi*8+0x4], edx
	lea edi, [ecx+ecx]
	lea edx, [edi+0x1]
	mov eax, [dpvsGlob+0x4c]
	cmp edx, eax
	jg R_VisitPortals_340
	mov [ebp-0x1798], ecx
	mov ecx, edx
R_VisitPortals_320:
	cmp eax, ecx
	jle R_VisitPortals_350
	mov ebx, [dpvsGlob+0x50]
	lea esi, [ecx*8]
	movss xmm0, dword [ebx+esi+0x4]
	ucomiss xmm0, [ebx+esi+0xc]
	jbe R_VisitPortals_360
	lea ecx, [edi+0x2]
	lea esi, [ecx*8]
	lea edx, [eax*8]
	lea eax, [esi+ebx]
	movss xmm0, dword [eax+0x4]
	ucomiss xmm0, [ebx+edx+0x4]
	jb R_VisitPortals_370
R_VisitPortals_330:
	mov esi, [ebp-0x1798]
	shl esi, 0x3
	jmp R_VisitPortals_380
R_VisitPortals_30:
	xor edi, edi
	mov ecx, 0x1
	mov dword [ebp-0x1784], 0x0
	jmp R_VisitPortals_390
R_VisitPortals_420:
	lea esi, [ecx*8]
	mov ebx, [dpvsGlob+0x50]
R_VisitPortals_430:
	lea edx, [eax*8]
	lea eax, [esi+ebx]
	movss xmm0, dword [eax+0x4]
	ucomiss xmm0, [ebx+edx+0x4]
	jae R_VisitPortals_400
R_VisitPortals_440:
	mov edx, [eax+0x4]
	mov eax, [eax]
	mov edi, [ebp-0x1784]
	mov [ebx+edi*8], eax
	mov [ebx+edi*8+0x4], edx
	lea edi, [ecx+ecx]
	lea edx, [edi+0x1]
	mov eax, [dpvsGlob+0x4c]
	cmp eax, edx
	jl R_VisitPortals_410
	mov [ebp-0x1784], ecx
	mov ecx, edx
R_VisitPortals_390:
	cmp ecx, eax
	jge R_VisitPortals_420
	mov ebx, [dpvsGlob+0x50]
	lea esi, [ecx*8]
	movss xmm0, dword [ebx+esi+0x4]
	ucomiss xmm0, [ebx+esi+0xc]
	jbe R_VisitPortals_430
	lea ecx, [edi+0x2]
	lea esi, [ecx*8]
	lea edx, [eax*8]
	lea eax, [esi+ebx]
	movss xmm0, dword [eax+0x4]
	ucomiss xmm0, [ebx+edx+0x4]
	jb R_VisitPortals_440
R_VisitPortals_400:
	mov esi, [ebp-0x1784]
	shl esi, 0x3
	jmp R_VisitPortals_450
R_VisitPortals_110:
	mov edi, 0x1
	mov dword [ebp-0x178c], 0x1
	jmp R_VisitPortals_460
R_VisitPortals_410:
	lea edx, [eax*8]
	mov ebx, [dpvsGlob+0x50]
	jmp R_VisitPortals_450
R_VisitPortals_220:
	mov edx, ebx
	sub edx, 0x1
	cmp edx, 0x1
	jle R_VisitPortals_250
	movaps xmm2, xmm5
	mulss xmm2, [ebp-0x53c]
	movaps xmm0, xmm7
	mulss xmm0, [ebp-0x544]
	movaps xmm1, xmm6
	mulss xmm1, [ebp-0x540]
	addss xmm0, xmm1
	addss xmm2, xmm0
	addss xmm2, xmm4
	ucomiss xmm2, xmm3
	ja R_VisitPortals_250
	movaps xmm3, xmm2
	mov ecx, 0x1
	lea eax, [ebp-0x550]
	jmp R_VisitPortals_470
R_VisitPortals_480:
	movaps xmm3, xmm2
R_VisitPortals_470:
	add ecx, 0x1
	cmp ecx, edx
	jz R_VisitPortals_250
	movaps xmm2, xmm5
	mulss xmm2, [eax+0x20]
	movaps xmm0, xmm7
	mulss xmm0, [eax+0x18]
	movaps xmm1, xmm6
	mulss xmm1, [eax+0x1c]
	addss xmm0, xmm1
	addss xmm2, xmm0
	addss xmm2, xmm4
	add eax, 0xc
	ucomiss xmm2, xmm3
	jbe R_VisitPortals_480
	jmp R_VisitPortals_250
R_VisitPortals_150:
	movss xmm5, dword [ebp-0x550]
	mov ecx, [dpvsGlob+0x30]
	movss xmm4, dword [ebp-0x54c]
	movss xmm3, dword [ebp-0x548]
	movaps xmm2, xmm3
	mulss xmm2, [ecx+0x2c]
	movaps xmm0, xmm5
	mulss xmm0, [ecx+0xc]
	movaps xmm1, xmm4
	mulss xmm1, [ecx+0x1c]
	addss xmm0, xmm1
	addss xmm2, xmm0
	addss xmm2, [ecx+0x3c]
	ucomiss xmm2, [_float_0_12500000]
	jp R_VisitPortals_490
	jae R_VisitPortals_490
R_VisitPortals_740:
	mov dword [ebp-0x17a0], 0x1
	mov dword [ebp-0x1788], 0xbf800000
	movss xmm1, dword [ebp-0x1788]
	movss [ebp-0x1780], xmm1
	movss xmm6, dword [_float_1_00000000]
	movaps xmm7, xmm6
	mov eax, edi
	test al, al
	jz R_VisitPortals_500
R_VisitPortals_170:
	xor ebx, ebx
	mov edx, [dpvsGlob+0x34]
R_VisitPortals_530:
	lea eax, [ebx+ebx*2]
	lea ecx, [ebp+eax*4-0x970]
	movss xmm4, dword [ebp-0x1780]
	jmp R_VisitPortals_510
R_VisitPortals_540:
	movaps xmm5, xmm6
R_VisitPortals_550:
	movaps xmm3, xmm4
	mulss xmm3, [edx+0x4]
	movaps xmm0, xmm5
	mulss xmm0, [edx+0x14]
	addss xmm3, xmm0
	addss xmm3, [edx+0x34]
	movaps xmm2, xmm4
	mulss xmm2, [edx+0x8]
	movaps xmm0, xmm5
	mulss xmm0, [edx+0x18]
	addss xmm2, xmm0
	addss xmm2, [edx+0x38]
	movaps xmm0, xmm4
	mulss xmm0, [edx+0xc]
	movaps xmm1, xmm5
	mulss xmm1, [edx+0x1c]
	addss xmm0, xmm1
	addss xmm0, [edx+0x3c]
	movss xmm1, dword [_float_1_00000000]
	divss xmm1, xmm0
	mulss xmm4, [edx]
	mulss xmm5, [edx+0x10]
	addss xmm4, xmm5
	addss xmm4, [edx+0x30]
	mulss xmm4, xmm1
	movss [ecx], xmm4
	mulss xmm3, xmm1
	movss [ecx+0x4], xmm3
	mulss xmm2, xmm1
	movss [ecx+0x8], xmm2
	add ebx, 0x1
	cmp ebx, 0x3
	ja R_VisitPortals_520
	add ecx, 0xc
	movaps xmm4, xmm7
	cmp ebx, 0x1
	jbe R_VisitPortals_530
R_VisitPortals_510:
	lea eax, [ebx-0x1]
	cmp eax, 0x1
	ja R_VisitPortals_540
	movss xmm5, dword [ebp-0x1788]
	jmp R_VisitPortals_550
R_VisitPortals_520:
	mov eax, [ebp-0x970]
	mov [ebp-0x940], eax
	mov eax, [ebp-0x96c]
	mov [ebp-0x93c], eax
	mov eax, [ebp-0x968]
	mov [ebp-0x938], eax
	lea ecx, [ebp-0x50]
	mov edx, 0x4
	lea eax, [ebp-0x970]
	call R_GetSidePlaneNormals
	xor edi, edi
	mov dword [ebp-0x1794], 0x0
	mov esi, [ebp-0x17a8]
R_VisitPortals_600:
	lea eax, [edi+edi*2]
	lea eax, [ebp+eax*4-0x50]
	movss xmm2, dword [eax]
	movss [esi], xmm2
	movss xmm4, dword [eax+0x4]
	movss [esi+0x4], xmm4
	movss xmm3, dword [eax+0x8]
	movss [esi+0x8], xmm3
	mov eax, [ebp-0x178c]
	test eax, eax
	jnz R_VisitPortals_560
	mov eax, r_portalBevels
	mov eax, [eax]
	movss xmm5, dword [eax+0xc]
	movaps xmm1, xmm3
	mulss xmm1, [ebp-0xf68]
	mulss xmm2, [ebp-0xf70]
	movaps xmm0, xmm4
	mulss xmm0, [ebp-0xf6c]
	addss xmm2, xmm0
	addss xmm1, xmm2
	ucomiss xmm1, xmm5
	jbe R_VisitPortals_570
R_VisitPortals_630:
	mov eax, r_showPortals
	mov eax, [eax]
	test byte [eax+0xc], 0x2
	jnz R_VisitPortals_580
R_VisitPortals_670:
	lea ebx, [edi+0x1]
R_VisitPortals_610:
	cmp ebx, 0x3
	ja R_VisitPortals_590
	mov edi, ebx
	jmp R_VisitPortals_600
R_VisitPortals_580:
	lea ebx, [edi+0x1]
	mov eax, colorMdCyan
	mov [esp+0xc], eax
	lea eax, [ebx+ebx*2]
	lea eax, [ebp+eax*4-0x970]
	mov [esp+0x8], eax
	lea eax, [edi+edi*2]
	lea eax, [ebp+eax*4-0x970]
	mov [esp+0x4], eax
	mov eax, frontEndDataOut
	mov eax, [eax]
	add eax, 0x11e71c
	mov [esp], eax
	call R_AddDebugLine
	jmp R_VisitPortals_610
R_VisitPortals_570:
	xor ecx, ecx
	lea edx, [ebp-0xf70]
	jmp R_VisitPortals_620
R_VisitPortals_640:
	mov eax, edx
	add edx, 0xc
	movaps xmm2, xmm3
	mulss xmm2, [eax+0x14]
	movss xmm0, dword [esi]
	mulss xmm0, [eax+0xc]
	movaps xmm1, xmm4
	mulss xmm1, [eax+0x10]
	addss xmm0, xmm1
	addss xmm2, xmm0
	ucomiss xmm2, xmm5
	ja R_VisitPortals_630
R_VisitPortals_620:
	add ecx, 0x1
	cmp [ebp-0x17ac], ecx
	jnz R_VisitPortals_640
R_VisitPortals_560:
	mov eax, r_showPortals
	mov eax, [eax]
	mov eax, [eax+0xc]
	test eax, eax
	jnz R_VisitPortals_650
R_VisitPortals_680:
	lea eax, [edi+edi*2]
	lea eax, [ebp+eax*4-0x970]
	movss xmm2, dword [esi]
	movaps xmm1, xmm2
	mulss xmm1, [eax]
	movss xmm3, dword [esi+0x4]
	movaps xmm0, xmm3
	mulss xmm0, [eax+0x4]
	addss xmm1, xmm0
	movss xmm4, dword [esi+0x8]
	movaps xmm0, xmm4
	mulss xmm0, [eax+0x8]
	addss xmm1, xmm0
	movss xmm0, dword [_float_0_00100000]
	subss xmm0, xmm1
	movss [esi+0xc], xmm0
	movss [ebp-0x17bc], xmm2
	mov edx, [ebp-0x17bc]
	mov eax, 0xc
	test edx, edx
	mov edx, 0x0
	cmovle eax, edx
	mov [esi+0x10], al
	movss [ebp-0x17bc], xmm3
	mov edx, [ebp-0x17bc]
	mov eax, 0x10
	test edx, edx
	mov edx, 0x4
	cmovle eax, edx
	mov [esi+0x11], al
	movss [ebp-0x17bc], xmm4
	mov edx, [ebp-0x17bc]
	test edx, edx
	jle R_VisitPortals_660
	mov eax, 0x14
R_VisitPortals_770:
	mov [esi+0x12], al
	add dword [ebp-0x1794], 0x1
	add esi, 0x14
	jmp R_VisitPortals_670
R_VisitPortals_650:
	mov eax, colorLtCyan
	mov [esp+0xc], eax
	lea eax, [edi+edi*2]
	shl eax, 0x2
	lea edx, [eax+ebp-0x964]
	mov [esp+0x8], edx
	lea edx, [ebp-0x970]
	lea eax, [edx+eax]
	mov [esp+0x4], eax
	mov eax, frontEndDataOut
	mov eax, [eax]
	add eax, 0x11e71c
	mov [esp], eax
	call R_AddDebugLine
	jmp R_VisitPortals_680
R_VisitPortals_230:
	movaps xmm3, xmm2
	jmp R_VisitPortals_250
R_VisitPortals_100:
	mov dword [esp], 0x8
	call R_WarnOncePerFrame
	mov dword [ebp-0x179c], 0x0
	jmp R_VisitPortals_690
R_VisitPortals_160:
	mov edx, [ebp-0x17ac]
	shl edx, 0x3
	lea ecx, [ebp-0x970]
	add ecx, edx
	mov eax, [ebp-0x970]
	mov [ecx], eax
	mov eax, [ebp-0x96c]
	mov [ecx+0x4], eax
	lea edx, [edx+ebp-0x968]
	mov eax, [ebp-0x968]
	mov [edx], eax
	mov eax, [ebp-0x964]
	mov [edx+0x4], eax
	mov eax, [ebp-0x17ac]
	pxor xmm1, xmm1
	test eax, eax
	jle R_VisitPortals_700
	mov edx, 0x1
	pxor xmm2, xmm2
	mov eax, 0x8
R_VisitPortals_710:
	movss xmm1, dword [eax+ebp-0x970]
	add edx, 0x1
	add eax, 0x8
	movss xmm0, dword [eax+ebp-0x96c]
	subss xmm0, [eax+ebp-0x97c]
	mulss xmm1, xmm0
	addss xmm2, xmm1
	cmp [ebp-0x17ac], edx
	jge R_VisitPortals_710
	movaps xmm1, xmm2
	mulss xmm1, [_float_0_12500000]
R_VisitPortals_700:
	mov eax, [ebx]
	movss xmm0, dword [eax+0xc]
	xor eax, eax
	ucomiss xmm0, xmm1
	setbe al
	mov [ebp-0x17a0], eax
	jmp R_VisitPortals_720
R_VisitPortals_490:
	xor esi, esi
	mov dword [ebp-0x1788], 0x3f800000
	mov dword [ebp-0x1780], 0x3f800000
	movss xmm6, dword [_float__1_00000000]
	movaps xmm7, xmm6
	lea ebx, [ebp-0x550]
	jmp R_VisitPortals_730
R_VisitPortals_750:
	movss xmm5, dword [ebx+0xc]
	movss xmm4, dword [ebx+0x10]
	movss xmm3, dword [ebx+0x14]
	movaps xmm2, xmm3
	mulss xmm2, [ecx+0x2c]
	movaps xmm0, xmm4
	mulss xmm0, [ecx+0x1c]
	movaps xmm1, xmm5
	mulss xmm1, [ecx+0xc]
	addss xmm0, xmm1
	addss xmm2, xmm0
	addss xmm2, [ecx+0x3c]
	add ebx, 0xc
	movss xmm0, dword [_float_0_12500000]
	ucomiss xmm0, xmm2
	ja R_VisitPortals_740
R_VisitPortals_730:
	movss xmm0, dword [_float_1_00000000]
	divss xmm0, xmm2
	movaps xmm2, xmm0
	movaps xmm1, xmm5
	mulss xmm1, [ecx+0x4]
	movaps xmm0, xmm4
	mulss xmm0, [ecx+0x14]
	addss xmm1, xmm0
	movaps xmm0, xmm3
	mulss xmm0, [ecx+0x24]
	addss xmm1, xmm0
	addss xmm1, [ecx+0x34]
	mulss xmm1, xmm2
	lea edx, [esi*8]
	lea eax, [ebp-0x970]
	add eax, edx
	movaps xmm0, xmm5
	mulss xmm0, [ecx]
	mulss xmm4, [ecx+0x10]
	addss xmm0, xmm4
	mulss xmm3, [ecx+0x20]
	addss xmm0, xmm3
	addss xmm0, [ecx+0x30]
	mulss xmm0, xmm2
	movss [eax], xmm0
	movss [eax+0x4], xmm1
	movaps xmm1, xmm0
	minss xmm1, dword [ebp-0x1780]
	movss [ebp-0x1780], xmm1
	maxss xmm0, xmm7
	movaps xmm7, xmm0
	movss xmm0, dword [edx+ebp-0x96c]
	movaps xmm1, xmm0
	minss xmm1, dword [ebp-0x1788]
	movss [ebp-0x1788], xmm1
	maxss xmm0, xmm6
	movaps xmm6, xmm0
	add esi, 0x1
	cmp [ebp-0x17ac], esi
	jnz R_VisitPortals_750
	movaps xmm1, xmm7
	subss xmm1, [ebp-0x1780]
	subss xmm0, [ebp-0x1788]
	jmp R_VisitPortals_760
R_VisitPortals_660:
	mov eax, 0x8
	jmp R_VisitPortals_770
R_VisitPortals_90:
	lea ebx, [ebp-0x550]
	mov [esp+0xc], ebx
	mov edi, [ebp-0x17ac]
	mov [esp+0x8], edi
	mov dword [esp+0x4], _ZZ14R_VisitPortalsPK7GfxCellPK9DpvsPlaneS4_iE5color
	mov eax, frontEndDataOut
	mov eax, [eax]
	add eax, 0x11e71c
	mov [esp], eax
	call R_AddDebugPolygon
	jmp R_VisitPortals_80
R_VisitPortals_140:
	mov dword [ebp-0x1794], 0x0
	mov dword [ebp-0x17a0], 0x1
	jmp R_VisitPortals_590
R_VisitPortals_120:
	xor edi, edi
	mov dword [ebp-0x178c], 0x0
	jmp R_VisitPortals_460
R_VisitPortals_340:
	lea edx, [eax*8]
	mov ebx, [dpvsGlob+0x50]
	jmp R_VisitPortals_380
R_VisitPortals_300:
	lea ecx, [ebp-0x20]
	mov [esp], ecx
	call _ZN10LargeLocalD1Ev
	add esp, 0x17dc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	mov ebx, eax
	lea eax, [ebp-0x20]
	mov [esp], eax
	call _ZN10LargeLocalD1Ev
	mov [esp], ebx
	call _Unwind_Resume
	nop


;R_SetVisData(unsigned int)
R_SetVisData:
	push ebp
	mov ebp, esp
	push esi
	push ebx
	mov ebx, [ebp+0x8]
	mov esi, [g_viewIndex]
	mov [g_viewIndex], ebx
	mov eax, rgp
	mov eax, [eax+0x20a0]
	lea edx, [eax+ebx*4+0x2c4]
	mov ecx, g_dynEntVisData
R_SetVisData_10:
	mov eax, [edx]
	mov [ecx], eax
	add edx, 0xc
	add ecx, 0x4
	cmp ecx, g_dynEntVisData+0x8
	jnz R_SetVisData_10
	lea edx, [ebx+ebx*8]
	mov eax, scene
	mov eax, [eax+0x154c90]
	lea eax, [eax+eax*2]
	lea eax, [eax+eax*8]
	add eax, edx
	shl eax, 0x5
	add eax, dpvsGlob+0xa05c
	mov [g_dpvsView], eax
	mov eax, esi
	pop ebx
	pop esi
	pop ebp
	ret


;R_AddSceneDObj(unsigned int, unsigned int)
R_AddSceneDObj:
	push ebp
	mov ebp, esp
	mov edx, [ebp+0xc]
	mov eax, scene
	mov edx, [eax+edx*4+0x154c94]
	mov eax, [ebp+0x8]
	mov byte [edx+eax], 0x1
	pop ebp
	ret
	nop


;R_CellForPoint(float const*)
R_CellForPoint:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	mov edi, [ebp+0x8]
	mov eax, rgp
	mov esi, [eax+0x20a0]
	mov ecx, [esi+0xf8]
	mov ebx, [esi+0xf0]
	add ebx, 0x1
	movzx eax, word [ecx]
	mov edx, eax
	sub edx, ebx
	js R_CellForPoint_10
	mov esi, [esi+0xf4]
	movss xmm4, dword [edi]
	movss xmm3, dword [edi+0x4]
	movss xmm2, dword [edi+0x8]
	pxor xmm5, xmm5
R_CellForPoint_20:
	lea eax, [edx+edx*4]
	lea eax, [esi+eax*4]
	movaps xmm0, xmm4
	mulss xmm0, [eax]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	subss xmm0, [eax+0xc]
	xor edx, edx
	ucomiss xmm5, xmm0
	setae dl
	movzx eax, word [ecx+0x2]
	lea eax, [eax+eax-0x4]
	imul edx, eax
	add edx, ecx
	lea ecx, [edx+0x4]
	movzx eax, word [edx+0x4]
	mov edx, eax
	sub edx, ebx
	jns R_CellForPoint_20
R_CellForPoint_10:
	sub eax, 0x1
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	add [eax], al


;R_DrawAllDynEnt(GfxViewInfo const*)
R_DrawAllDynEnt:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x8c
	mov ebx, rgp
	mov ecx, [ebx+0x20a0]
	xor edx, edx
R_DrawAllDynEnt_10:
	mov eax, [ecx+edx*4+0x2c4]
	mov [ebp+edx*4-0x24], eax
	add edx, 0x1
	cmp edx, 0x3
	jnz R_DrawAllDynEnt_10
	mov ecx, [ecx+0x2b4]
	mov [ebp-0x54], ecx
	test ecx, ecx
	jz R_DrawAllDynEnt_20
	mov eax, [ebp-0x24]
	mov [ebp-0x30], eax
	mov edx, [ebp-0x20]
	mov [ebp-0x34], edx
	mov ecx, [ebp-0x1c]
	mov [ebp-0x38], ecx
	xor edi, edi
	mov ebx, eax
	mov edx, ecx
	jmp R_DrawAllDynEnt_30
R_DrawAllDynEnt_70:
	mov [ebx+0x4], di
	mov eax, scene
	add dword [eax+0x154c38], 0x1
R_DrawAllDynEnt_60:
	add edi, 0x1
	cmp [ebp-0x54], edi
	jz R_DrawAllDynEnt_40
R_DrawAllDynEnt_80:
	mov ebx, [ebp-0x30]
	mov edx, [ebp-0x38]
R_DrawAllDynEnt_30:
	add ebx, edi
	mov [ebp-0x6c], ebx
	mov eax, [ebp-0x34]
	add eax, edi
	mov [ebp-0x64], eax
	add edx, edi
	mov [ebp-0x3c], edx
	movzx eax, byte [ebx]
	mov ecx, [ebp-0x64]
	movzx edx, byte [ecx]
	or eax, edx
	mov ebx, [ebp-0x3c]
	movzx edx, byte [ebx]
	or eax, edx
	test al, 0x1
	jnz R_DrawAllDynEnt_50
	mov dword [esp+0x8], 0x0
	mov [esp+0x4], edi
	mov eax, [ebp+0x8]
	mov [esp], eax
	call R_IsDynEntVisibleToAnyShadowedPrimaryLight
	test eax, eax
	jz R_DrawAllDynEnt_60
R_DrawAllDynEnt_50:
	movzx ebx, di
	mov dword [esp+0x4], 0x0
	mov [esp], ebx
	call DynEnt_GetClientPose
	mov esi, eax
	mov dword [esp+0x4], 0x0
	mov [esp], ebx
	call DynEnt_GetEntityDef
	mov edx, rgp
	mov ecx, [edx+0x20a0]
	mov ebx, scene
	mov edx, [ebx+0x154c38]
	lea edx, [edx+edx*2]
	lea ebx, [edx+edx]
	add ebx, [ecx+0x224]
	mov eax, [eax+0x20]
	mov dword [esp+0x14], 0x0
	mov dword [esp+0x10], 0x3f800000
	mov [esp+0xc], esi
	mov dword [esp+0x8], 0x0
	mov [esp+0x4], eax
	mov [esp], ebx
	call R_SkinXModel
	test eax, eax
	jnz R_DrawAllDynEnt_70
	mov edx, [ebp-0x6c]
	mov byte [edx], 0x0
	mov ecx, [ebp-0x64]
	mov byte [ecx], 0x0
	mov ebx, [ebp-0x3c]
	mov byte [ebx], 0x0
	add edi, 0x1
	cmp [ebp-0x54], edi
	jnz R_DrawAllDynEnt_80
R_DrawAllDynEnt_40:
	mov ebx, rgp
R_DrawAllDynEnt_20:
	mov ecx, [ebx+0x20a0]
	xor edx, edx
R_DrawAllDynEnt_90:
	mov eax, [ecx+edx*4+0x2d0]
	mov [ebp+edx*4-0x24], eax
	add edx, 0x1
	cmp edx, 0x3
	jnz R_DrawAllDynEnt_90
	mov ecx, [ecx+0x2b8]
	mov [ebp-0x2c], ecx
	test ecx, ecx
	jz R_DrawAllDynEnt_100
	mov edi, [ebp-0x24]
	mov [ebp-0x70], edi
	mov eax, [ebp-0x20]
	mov [ebp-0x68], eax
	mov edx, [ebp-0x1c]
	mov [ebp-0x60], edx
	xor esi, esi
	mov ecx, edi
	mov ebx, eax
	jmp R_DrawAllDynEnt_110
R_DrawAllDynEnt_120:
	add esi, 0x1
	cmp [ebp-0x2c], esi
	jz R_DrawAllDynEnt_100
R_DrawAllDynEnt_190:
	mov ecx, [ebp-0x70]
	mov ebx, [ebp-0x68]
R_DrawAllDynEnt_110:
	add ecx, esi
	mov [ebp-0x44], ecx
	add ebx, esi
	mov [ebp-0x40], ebx
	mov edi, [ebp-0x60]
	add edi, esi
	mov [ebp-0x5c], edi
	movzx eax, byte [ecx]
	movzx edx, byte [ebx]
	or eax, edx
	movzx edx, byte [edi]
	or eax, edx
	test al, 0x1
	jz R_DrawAllDynEnt_120
	mov [ebp-0x56], si
	movzx ebx, si
	mov dword [esp+0x4], 0x1
	mov [esp], ebx
	call DynEnt_GetClientPose
	mov edi, eax
	mov dword [esp+0x4], 0x1
	mov [esp], ebx
	call DynEnt_GetEntityDef
	movzx eax, word [eax+0x24]
	mov [esp], eax
	call R_GetBrushModel
	mov [ebp-0x50], eax
	movzx ecx, word [eax+0x30]
	test cx, cx
	jz R_DrawAllDynEnt_120
	mov eax, rgp
	mov edx, [eax+0x20a0]
	mov ebx, scene
	mov eax, [ebx+0x154c3c]
	shl eax, 0x2
	mov [ebp-0x4c], eax
	mov ebx, [edx+0x228]
	add eax, ebx
	mov [ebp-0x4c], eax
	mov eax, r_drawDecals
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_DrawAllDynEnt_130
	movzx eax, cx
R_DrawAllDynEnt_200:
	lea ebx, [eax*8+0x20]
	mov edx, frontEndDataOut
	mov eax, [edx]
	add eax, 0x118258
	mov [esp+0x4], ebx
	mov [esp], eax
	call InterlockedExchangeAdd
	add ebx, eax
	cmp ebx, 0x20000
	ja R_DrawAllDynEnt_140
	mov edx, frontEndDataOut
	add eax, [edx]
	mov [ebp-0x48], eax
	mov eax, [edi]
	mov ecx, [ebp-0x48]
	mov [ecx], eax
	mov eax, [edi+0x4]
	mov [ecx+0x4], eax
	mov eax, [edi+0x8]
	mov [ecx+0x8], eax
	mov eax, [edi+0xc]
	mov [ecx+0xc], eax
	mov eax, [edi+0x10]
	mov [ecx+0x10], eax
	mov eax, [edi+0x14]
	mov [ecx+0x14], eax
	mov eax, [edi+0x18]
	mov [ecx+0x18], eax
	mov dword [ecx+0x1c], 0x3f800000
	mov ebx, ecx
	add ebx, 0x20
	mov eax, ebx
	sub eax, [edx]
	shr eax, 0x2
	mov edi, [ebp-0x4c]
	mov [edi], ax
	mov eax, r_drawDecals
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jnz R_DrawAllDynEnt_150
	mov eax, rgp
	mov edx, [eax+0x20a0]
	mov ecx, [ebp-0x50]
	movzx eax, word [ecx+0x32]
	lea ecx, [eax+eax*2]
	shl ecx, 0x4
	add ecx, [edx+0x294]
	mov edi, [ebp-0x50]
	movzx edx, word [edi+0x30]
	test dx, dx
	jz R_DrawAllDynEnt_160
	xor edi, edi
R_DrawAllDynEnt_180:
	test byte [ecx+0x17], 0x2
	jnz R_DrawAllDynEnt_170
	mov eax, [ebp-0x48]
	mov [ebx], eax
	mov [ebx+0x4], ecx
	add ebx, 0x8
	mov eax, [ebp-0x50]
	movzx edx, word [eax+0x30]
R_DrawAllDynEnt_170:
	add edi, 0x1
	add ecx, 0x30
	movzx eax, dx
	cmp edi, eax
	jb R_DrawAllDynEnt_180
R_DrawAllDynEnt_160:
	movzx edx, word [ebp-0x56]
	mov eax, [ebp-0x4c]
	mov [eax+0x2], dx
	mov ecx, scene
	add dword [ecx+0x154c3c], 0x1
R_DrawAllDynEnt_220:
	add esi, 0x1
	cmp [ebp-0x2c], esi
	jnz R_DrawAllDynEnt_190
R_DrawAllDynEnt_100:
	add esp, 0x8c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_DrawAllDynEnt_130:
	mov ebx, [ebp-0x50]
	movzx eax, word [ebx+0x34]
	jmp R_DrawAllDynEnt_200
R_DrawAllDynEnt_150:
	mov eax, rgp
	mov edx, [eax+0x20a0]
	mov ecx, [ebp-0x50]
	movzx eax, word [ecx+0x32]
	lea ecx, [eax+eax*2]
	shl ecx, 0x4
	add ecx, [edx+0x294]
	mov edi, [ebp-0x50]
	cmp word [edi+0x30], 0x0
	jz R_DrawAllDynEnt_160
	xor edx, edx
R_DrawAllDynEnt_210:
	mov edi, [ebp-0x48]
	mov [ebx], edi
	mov [ebx+0x4], ecx
	add ebx, 0x8
	add edx, 0x1
	add ecx, 0x30
	mov edi, [ebp-0x50]
	movzx eax, word [edi+0x30]
	cmp eax, edx
	ja R_DrawAllDynEnt_210
	movzx edx, word [ebp-0x56]
	mov eax, [ebp-0x4c]
	mov [eax+0x2], dx
	mov ecx, scene
	add dword [ecx+0x154c3c], 0x1
	jmp R_DrawAllDynEnt_220
R_DrawAllDynEnt_140:
	mov dword [esp], 0x7
	call R_WarnOncePerFrame
	mov ecx, [ebp-0x44]
	mov byte [ecx], 0x0
	mov ebx, [ebp-0x40]
	mov byte [ebx], 0x0
	mov edi, [ebp-0x5c]
	mov byte [edi], 0x0
	jmp R_DrawAllDynEnt_120
	add [eax], al


;R_InitSceneData(int)
R_InitSceneData:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x1c
	mov eax, gfxCfg
	mov edx, [eax+0x4]
	shr edx, 0x5
	imul edx, [ebp+0x8]
	mov ecx, rgp
	mov eax, [ecx+0x20a0]
	mov eax, [eax+0xf0]
	mov edi, eax
	add edi, edi
	jnz R_InitSceneData_10
R_InitSceneData_40:
	mov edx, gfxCfg
	mov eax, [edx+0x4]
	shr eax, 0x5
	shl eax, 0x2
	mov ecx, [ebp+0x8]
	mov edx, [ecx*4+dpvsGlob+0xade4]
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x0
	mov [esp], edx
	call memset
	mov edx, gfxCfg
	mov eax, [edx+0x4]
	shl eax, 0x2
	mov edx, scene
	mov ecx, [ebp+0x8]
	mov edx, [edx+ecx*4+0x154cb8]
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x0
	mov [esp], edx
	call memset
	add esp, 0x1c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_InitSceneData_10:
	lea ebx, [edx*4]
	xor esi, esi
	jmp R_InitSceneData_20
R_InitSceneData_30:
	mov ecx, rgp
R_InitSceneData_20:
	mov edx, gfxCfg
	mov eax, [edx+0x4]
	shr eax, 0x5
	shl eax, 0x2
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x0
	mov eax, [ecx+0x20a0]
	mov ecx, [eax+0xfc]
	lea eax, [ebx+ecx]
	mov [esp], eax
	call Com_Memset
	add esi, 0x1
	add ebx, 0x200
	cmp esi, edi
	jnz R_InitSceneData_30
	jmp R_InitSceneData_40


;R_ClearDpvsScene()
R_ClearDpvsScene:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x2c
	mov esi, gfxCfg
	mov eax, [esi+0x4]
	add eax, eax
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0xff
	mov ebx, scene
	mov eax, [ebx+0x154cb0]
	mov [esp], eax
	call Com_Memset
	mov eax, [esi+0x4]
	add eax, eax
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0xff
	mov eax, [ebx+0x154cb4]
	mov [esp], eax
	call Com_Memset
	mov eax, [esi+0x4]
	shr eax, 0x3
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x0
	mov eax, [ebx+0x12b428]
	mov [esp], eax
	call Com_Memset
	lea edi, [ebx+0x154c94]
	add ebx, 0x154cb0
R_ClearDpvsScene_10:
	mov eax, [esi+0x4]
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x0
	mov eax, [edi]
	mov [esp], eax
	call Com_Memset
	add edi, 0x4
	cmp edi, ebx
	jnz R_ClearDpvsScene_10
	xor edi, edi
	mov eax, rgp
	mov [ebp-0x1c], eax
R_ClearDpvsScene_40:
	mov edx, [eax+0x20a0]
	mov eax, [edx+0x244]
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x0
	mov eax, [edx+edi*4+0x270]
	mov [esp], eax
	call Com_Memset
	mov eax, [ebp-0x1c]
	mov edx, [eax+0x20a0]
	mov eax, [edx+0x154]
	movzx eax, word [eax+0x30]
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x0
	mov eax, [edx+edi*4+0x27c]
	mov [esp], eax
	call Com_Memset
	xor esi, esi
	mov ebx, edi
R_ClearDpvsScene_20:
	mov edx, rgp
	mov eax, [edx+0x20a0]
	mov edx, [eax+esi*4+0x2b4]
	mov [esp+0x8], edx
	mov dword [esp+0x4], 0x0
	mov eax, [eax+ebx*4+0x2c4]
	mov [esp], eax
	call Com_Memset
	add esi, 0x1
	add ebx, 0x3
	cmp esi, 0x2
	jnz R_ClearDpvsScene_20
	add edi, 0x1
	cmp edi, 0x3
	jz R_ClearDpvsScene_30
	mov eax, [ebp-0x1c]
	jmp R_ClearDpvsScene_40
R_ClearDpvsScene_30:
	mov ebx, scene
	mov eax, [ebx+0x154c38]
	lea eax, [eax+eax*2]
	add eax, eax
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x0
	mov edx, rgp
	mov eax, [edx+0x20a0]
	mov eax, [eax+0x224]
	mov [esp], eax
	call Com_Memset
	mov dword [ebx+0x154c38], 0x0
	mov eax, [ebx+0x154c3c]
	shl eax, 0x2
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x0
	mov edx, rgp
	mov eax, [edx+0x20a0]
	mov eax, [eax+0x228]
	mov [esp], eax
	call Com_Memset
	mov dword [ebx+0x154c3c], 0x0
	mov dword [g_viewIndex], 0x0
	mov eax, rgp
	mov edx, [eax+0x20a0]
	mov ecx, g_dynEntVisData
R_ClearDpvsScene_50:
	mov eax, [edx+0x2c4]
	mov [ecx], eax
	add edx, 0xc
	add ecx, 0x4
	cmp ecx, g_dynEntVisData+0x8
	jnz R_ClearDpvsScene_50
	mov eax, scene
	mov eax, [eax+0x154c90]
	lea eax, [eax+eax*2]
	lea eax, [eax+eax*8]
	shl eax, 0x5
	add eax, dpvsGlob+0xa05c
	mov [g_dpvsView], eax
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	nop


;R_DrawAllSceneEnt(GfxViewInfo const*)
R_DrawAllSceneEnt:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0xcc
	mov eax, scene
	mov [ebp-0x94], eax
	mov ecx, [eax+0x154c90]
	mov edx, [ecx*4+dpvsGlob+0xade4]
	mov [ebp-0x70], edx
	xor edx, edx
	add eax, 0x13ac30
R_DrawAllSceneEnt_10:
	mov [ebp+edx*4-0x34], eax
	add edx, 0x1
	add eax, 0x200
	cmp edx, 0x7
	jnz R_DrawAllSceneEnt_10
	mov ebx, [ebp-0x94]
	mov ebx, [ebx+0x12b42c]
	mov [ebp-0x84], ebx
	lea eax, [ecx+ecx*2]
	lea eax, [eax+eax*8]
	shl eax, 0x5
	add eax, dpvsGlob+0xa05c
	mov [ebp-0x68], eax
	test ebx, ebx
	jz R_DrawAllSceneEnt_20
	mov dword [ebp-0x88], 0x0
	mov esi, scene
	mov [ebp-0x8c], esi
	mov dword [ebp-0x9c], 0x12b400
	mov [ebp-0xa4], esi
R_DrawAllSceneEnt_90:
	mov eax, [ebp-0x9c]
	mov edx, [ebp-0x94]
	lea eax, [eax+edx+0x30]
	mov [ebp-0x80], eax
	movzx edi, word [eax+0x6e]
	movzx eax, word [eax+0x6c]
	movzx edx, ax
	test ax, ax
	jz R_DrawAllSceneEnt_30
	lea edx, [edx*8+0x118260]
	mov eax, frontEndDataOut
	mov ecx, [eax]
	add edx, ecx
	mov [ebp-0x50], edx
	mov eax, gfxCfg
	cmp edi, [eax+0x8]
	jz R_DrawAllSceneEnt_40
	mov edx, edi
	shr edx, 0x5
	mov ecx, edi
	and ecx, 0x1f
	mov eax, 0x80000000
	shr eax, cl
	mov ebx, [ebp-0x70]
	test [ebx+edx*4], eax
	jz R_DrawAllSceneEnt_50
	mov edx, [ebp-0x68]
	xor ecx, ecx
	mov eax, [ebp-0x94]
	lea esi, [eax+0x154c94]
R_DrawAllSceneEnt_70:
	mov ebx, [ebp-0x88]
	add ebx, [ebp+ecx*4-0x34]
	mov [ebp-0xac], ebx
	mov ebx, [edx]
	mov eax, [ebp-0x50]
	test [eax], ebx
	jz R_DrawAllSceneEnt_60
	xor eax, eax
R_DrawAllSceneEnt_490:
	mov ebx, [ebp-0xac]
	mov [ebx], al
	add ecx, 0x1
	add edx, 0x120
	add esi, 0x4
	cmp ecx, 0x3
	jnz R_DrawAllSceneEnt_70
	lea ebx, [ebp-0x34]
	add ebx, 0xc
	mov ecx, [ebp-0x94]
	add ecx, 0x154ca0
	mov esi, 0x4
R_DrawAllSceneEnt_80:
	mov eax, [ebp-0x88]
	add eax, [ebx]
	mov edx, edi
	add edx, [ecx]
	movzx edx, byte [edx]
	mov [eax], dl
	add ebx, 0x4
	add ecx, 0x4
	sub esi, 0x1
	jnz R_DrawAllSceneEnt_80
R_DrawAllSceneEnt_560:
	add dword [ebp-0x88], 0x1
	add dword [ebp-0x9c], 0x7c
	mov esi, [ebp-0x88]
	cmp [ebp-0x84], esi
	ja R_DrawAllSceneEnt_90
R_DrawAllSceneEnt_20:
	xor edx, edx
	mov eax, [ebp-0x94]
	add eax, 0x14da34
R_DrawAllSceneEnt_100:
	mov [ebp+edx*4-0x34], eax
	add edx, 0x1
	add eax, 0x400
	cmp edx, 0x7
	jnz R_DrawAllSceneEnt_100
	mov eax, [ebp-0x94]
	mov eax, [eax+0x13ba30]
	mov [ebp-0x48], eax
	test eax, eax
	jz R_DrawAllSceneEnt_110
	mov dword [ebp-0x40], 0x0
	mov edx, scene
	mov [ebp-0x90], edx
	mov dword [ebp-0x98], 0x13ba00
	mov [ebp-0xa0], edx
R_DrawAllSceneEnt_190:
	mov ecx, [ebp-0x98]
	mov ebx, [ebp-0x94]
	lea ecx, [ecx+ebx+0x34]
	mov [ebp-0x7c], ecx
	movzx ebx, word [ecx+0x2e]
	mov [ebp-0x4c], ebx
	movzx eax, word [ecx+0x2c]
	movzx edx, ax
	test ax, ax
	jz R_DrawAllSceneEnt_120
	lea edx, [edx*8+0x118260]
	mov eax, frontEndDataOut
	mov esi, [eax]
	add edx, esi
	mov [ebp-0x6c], edx
	mov eax, gfxCfg
	cmp ebx, [eax+0x8]
	jz R_DrawAllSceneEnt_130
	mov edx, ebx
	shr edx, 0x5
	mov ecx, ebx
	and ecx, 0x1f
	mov eax, 0x80000000
	shr eax, cl
	mov ecx, [ebp-0x70]
	test [ecx+edx*4], eax
	jz R_DrawAllSceneEnt_140
	mov edx, [ebp-0x68]
	xor ebx, ebx
	xor edi, edi
	mov eax, [ebp-0x94]
	lea esi, [eax+0x154c94]
R_DrawAllSceneEnt_160:
	mov ecx, [ebp-0x40]
	add ecx, [ebp+ebx*4-0x34]
	mov [ebp-0xb0], ecx
	mov ecx, [edx]
	mov eax, [ebp-0x6c]
	test [eax], ecx
	jz R_DrawAllSceneEnt_150
	xor eax, eax
R_DrawAllSceneEnt_500:
	mov ecx, [ebp-0xb0]
	mov [ecx], al
	movzx eax, al
	or edi, eax
	add ebx, 0x1
	add edx, 0x120
	add esi, 0x4
	cmp ebx, 0x3
	jnz R_DrawAllSceneEnt_160
R_DrawAllSceneEnt_520:
	lea esi, [ebp-0x28]
	mov eax, [ebp-0x94]
	lea ebx, [eax+0x154ca0]
	mov ecx, 0x4
R_DrawAllSceneEnt_170:
	mov edx, [ebp-0x40]
	add edx, [esi]
	mov eax, [ebp-0x4c]
	add eax, [ebx]
	movzx eax, byte [eax]
	mov [edx], al
	movzx eax, al
	or edi, eax
	add esi, 0x4
	add ebx, 0x4
	sub ecx, 0x1
	jnz R_DrawAllSceneEnt_170
	and edi, 0x1
	jnz R_DrawAllSceneEnt_180
R_DrawAllSceneEnt_400:
	add dword [ebp-0x40], 0x1
	add dword [ebp-0x98], 0x48
	mov eax, [ebp-0x40]
	cmp [ebp-0x48], eax
	ja R_DrawAllSceneEnt_190
R_DrawAllSceneEnt_110:
	xor edx, edx
	mov eax, [ebp-0x94]
	add eax, 0x154638
R_DrawAllSceneEnt_200:
	mov [ebp+edx*4-0x34], eax
	add edx, 0x1
	add eax, 0x200
	cmp edx, 0x3
	jnz R_DrawAllSceneEnt_200
	mov edx, [ebp-0x94]
	mov edx, [edx+0x14f634]
	mov [ebp-0x44], edx
	test edx, edx
	jz R_DrawAllSceneEnt_210
	mov dword [ebp-0x3c], 0x0
	mov esi, [ebp-0x94]
R_DrawAllSceneEnt_310:
	mov ebx, [ebp-0x3c]
	lea eax, [ebx+ebx*4]
	lea eax, [esi+eax*8+0x14f638]
	mov [ebp-0x78], eax
	movzx ebx, word [eax+0x2]
	mov edx, ebx
	shr edx, 0x5
	mov ecx, ebx
	and ecx, 0x1f
	mov eax, 0x80000000
	shr eax, cl
	mov ecx, [ebp-0x70]
	test [ecx+edx*4], eax
	jz R_DrawAllSceneEnt_220
	xor esi, esi
	xor ecx, ecx
	mov edi, scene
	add edi, 0x154c94
R_DrawAllSceneEnt_230:
	mov edx, [ebp-0x3c]
	add edx, [ecx+ebp-0x34]
	mov eax, ebx
	add eax, [ecx+edi]
	movzx eax, byte [eax]
	mov [edx], al
	movzx eax, al
	or esi, eax
	add ecx, 0x4
	cmp ecx, 0xc
	jnz R_DrawAllSceneEnt_230
	and esi, 0x1
	jz R_DrawAllSceneEnt_240
R_DrawAllSceneEnt_330:
	mov esi, [ebp-0x78]
	mov esi, [esi+0x4]
	mov [ebp-0x64], esi
	mov esi, [ebp-0x78]
	add esi, 0x8
	mov eax, r_drawDecals
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_DrawAllSceneEnt_250
	mov edx, [ebp-0x64]
	movzx eax, word [edx+0x30]
R_DrawAllSceneEnt_350:
	lea ebx, [eax*8+0x20]
	mov edx, frontEndDataOut
	mov eax, [edx]
	add eax, 0x118258
	mov [esp+0x4], ebx
	mov [esp], eax
	call InterlockedExchangeAdd
	add ebx, eax
	cmp ebx, 0x20000
	ja R_DrawAllSceneEnt_260
	mov edx, frontEndDataOut
	mov edi, [edx]
	add edi, eax
	mov eax, [esi]
	mov [edi], eax
	mov eax, [esi+0x4]
	mov [edi+0x4], eax
	mov eax, [esi+0x8]
	mov [edi+0x8], eax
	mov eax, [esi+0xc]
	mov [edi+0xc], eax
	mov eax, [esi+0x10]
	mov [edi+0x10], eax
	mov eax, [esi+0x14]
	mov [edi+0x14], eax
	mov eax, [esi+0x18]
	mov [edi+0x18], eax
	mov dword [edi+0x1c], 0x3f800000
	lea ebx, [edi+0x20]
	mov eax, ebx
	sub eax, [edx]
	shr eax, 0x2
	mov ecx, [ebp-0x78]
	mov [ecx], ax
	mov eax, r_drawDecals
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jnz R_DrawAllSceneEnt_270
	mov eax, rgp
	mov edx, [eax+0x20a0]
	mov esi, [ebp-0x64]
	movzx eax, word [esi+0x32]
	lea ecx, [eax+eax*2]
	shl ecx, 0x4
	add ecx, [edx+0x294]
	movzx edx, word [esi+0x30]
	test dx, dx
	jz R_DrawAllSceneEnt_280
	xor esi, esi
R_DrawAllSceneEnt_300:
	test byte [ecx+0x17], 0x2
	jnz R_DrawAllSceneEnt_290
	mov [ebx], edi
	mov [ebx+0x4], ecx
	add ebx, 0x8
	mov eax, [ebp-0x64]
	movzx edx, word [eax+0x30]
R_DrawAllSceneEnt_290:
	add esi, 0x1
	add ecx, 0x30
	movzx eax, dx
	cmp esi, eax
	jb R_DrawAllSceneEnt_300
R_DrawAllSceneEnt_280:
	add dword [ebp-0x3c], 0x1
	mov eax, [ebp-0x3c]
	cmp [ebp-0x44], eax
	jbe R_DrawAllSceneEnt_210
R_DrawAllSceneEnt_340:
	mov ecx, scene
	mov [ebp-0x94], ecx
	mov esi, ecx
	jmp R_DrawAllSceneEnt_310
R_DrawAllSceneEnt_220:
	xor esi, esi
	xor ecx, ecx
	mov edi, scene
	add edi, 0x154c94
R_DrawAllSceneEnt_320:
	mov eax, ebx
	add eax, [ecx+edi]
	movzx eax, byte [eax]
	test al, al
	mov edx, 0x1
	cmovz eax, edx
	mov edx, [ebp-0x3c]
	add edx, [ecx+ebp-0x34]
	mov [edx], al
	movzx eax, al
	or esi, eax
	add ecx, 0x4
	cmp ecx, 0xc
	jnz R_DrawAllSceneEnt_320
	and esi, 0x1
	jnz R_DrawAllSceneEnt_330
R_DrawAllSceneEnt_240:
	mov [esp+0x4], ebx
	mov ebx, [ebp+0x8]
	mov [esp], ebx
	call R_IsEntityVisibleToAnyShadowedPrimaryLight
	test eax, eax
	jnz R_DrawAllSceneEnt_330
	add dword [ebp-0x3c], 0x1
	mov eax, [ebp-0x3c]
	cmp [ebp-0x44], eax
	ja R_DrawAllSceneEnt_340
R_DrawAllSceneEnt_210:
	add esp, 0xcc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_DrawAllSceneEnt_250:
	mov ecx, [ebp-0x64]
	movzx eax, word [ecx+0x34]
	jmp R_DrawAllSceneEnt_350
R_DrawAllSceneEnt_120:
	mov edx, ebx
	mov eax, gfxCfg
	cmp ebx, [eax+0x8]
	jz R_DrawAllSceneEnt_360
	mov ecx, ebx
	shr edx, 0x5
	and ecx, 0x1f
	mov eax, 0x80000000
	shr eax, cl
	mov ecx, [ebp-0x70]
	test [ecx+edx*4], eax
	jz R_DrawAllSceneEnt_370
	xor ecx, ecx
	xor edi, edi
	mov esi, [ebp-0x90]
	lea ebx, [esi+0x154c94]
R_DrawAllSceneEnt_380:
	mov edx, [ebp-0x40]
	add edx, [ebp+ecx*4-0x34]
	mov eax, [ebp-0x4c]
	add eax, [ebx]
	movzx eax, byte [eax]
	mov [edx], al
	movzx eax, al
	or edi, eax
	add ecx, 0x1
	add ebx, 0x4
	cmp ecx, 0x3
	jnz R_DrawAllSceneEnt_380
R_DrawAllSceneEnt_600:
	lea esi, [ebp-0x28]
	mov edx, [ebp-0x94]
	lea ebx, [edx+0x154ca0]
	mov ecx, 0x4
R_DrawAllSceneEnt_390:
	mov edx, [ebp-0x40]
	add edx, [esi]
	mov eax, [ebp-0x4c]
	add eax, [ebx]
	movzx eax, byte [eax]
	mov [edx], al
	movzx eax, al
	or edi, eax
	add esi, 0x4
	add ebx, 0x4
	sub ecx, 0x1
	jnz R_DrawAllSceneEnt_390
	and edi, 0x1
	jz R_DrawAllSceneEnt_400
R_DrawAllSceneEnt_180:
	mov ecx, [ebp-0x7c]
	movzx eax, word [ecx+0x2c]
	mov [esp+0x14], eax
	mov eax, [ecx+0x28]
	mov [esp+0x10], eax
	mov eax, ecx
	add eax, 0xc
	mov [esp+0xc], eax
	mov eax, [ecx+0x8]
	mov [esp+0x8], eax
	mov eax, [ecx+0x4]
	mov [esp+0x4], eax
	mov [esp], ecx
	call R_SkinXModel
	test eax, eax
	jnz R_DrawAllSceneEnt_410
	mov edx, 0x1
R_DrawAllSceneEnt_420:
	mov eax, [ebp-0x40]
	add eax, [ebp+edx*4-0x38]
	mov byte [eax], 0x0
	add edx, 0x1
	cmp edx, 0x8
	jnz R_DrawAllSceneEnt_420
	mov ebx, [ebp-0xa0]
	mov [ebp-0x94], ebx
	jmp R_DrawAllSceneEnt_400
R_DrawAllSceneEnt_30:
	mov eax, gfxCfg
	cmp edi, [eax+0x8]
	jz R_DrawAllSceneEnt_430
	mov edx, edi
	shr edx, 0x5
	mov ecx, edi
	and ecx, 0x1f
	mov eax, 0x80000000
	shr eax, cl
	mov ecx, [ebp-0x70]
	test [ecx+edx*4], eax
	jz R_DrawAllSceneEnt_440
	xor ecx, ecx
	mov esi, [ebp-0x8c]
	lea ebx, [esi+0x154c94]
R_DrawAllSceneEnt_450:
	mov eax, [ebp-0x88]
	add eax, [ebp+ecx*4-0x34]
	mov edx, edi
	add edx, [ebx]
	movzx edx, byte [edx]
	mov [eax], dl
	add ecx, 0x1
	add ebx, 0x4
	cmp ecx, 0x3
	jnz R_DrawAllSceneEnt_450
	lea ebx, [ebp-0x34]
	add ebx, 0xc
	mov ecx, [ebp-0x94]
	add ecx, 0x154ca0
	mov esi, 0x4
R_DrawAllSceneEnt_460:
	mov eax, [ebp-0x88]
	add eax, [ebx]
	mov edx, edi
	add edx, [ecx]
	movzx edx, byte [edx]
	mov [eax], dl
	add ebx, 0x4
	add ecx, 0x4
	sub esi, 0x1
	jnz R_DrawAllSceneEnt_460
	add dword [ebp-0x88], 0x1
	add dword [ebp-0x9c], 0x7c
	mov esi, [ebp-0x88]
	cmp [ebp-0x84], esi
	ja R_DrawAllSceneEnt_90
	jmp R_DrawAllSceneEnt_20
R_DrawAllSceneEnt_270:
	mov eax, rgp
	mov edx, [eax+0x20a0]
	mov ecx, [ebp-0x64]
	movzx eax, word [ecx+0x32]
	lea ecx, [eax+eax*2]
	shl ecx, 0x4
	add ecx, [edx+0x294]
	mov esi, [ebp-0x64]
	cmp word [esi+0x30], 0x0
	jz R_DrawAllSceneEnt_280
	xor edx, edx
R_DrawAllSceneEnt_470:
	mov [ebx], edi
	mov [ebx+0x4], ecx
	add ebx, 0x8
	add edx, 0x1
	add ecx, 0x30
	mov esi, [ebp-0x64]
	movzx eax, word [esi+0x30]
	cmp edx, eax
	jb R_DrawAllSceneEnt_470
	jmp R_DrawAllSceneEnt_280
R_DrawAllSceneEnt_260:
	mov dword [esp], 0x7
	call R_WarnOncePerFrame
	mov ebx, [ebp-0x78]
	movzx ecx, word [ebx+0x2]
	mov esi, scene
	mov [ebp-0x94], esi
	mov ebx, ecx
	sar ebx, 0x5
	mov edx, [esi+0x12b428]
	and ecx, 0x1f
	mov eax, 0x1
	shl eax, cl
	or [edx+ebx*4], eax
	mov edx, 0x1
R_DrawAllSceneEnt_480:
	mov eax, [ebp-0x3c]
	add eax, [ebp+edx*4-0x38]
	mov byte [eax], 0x0
	add edx, 0x1
	cmp edx, 0x4
	jnz R_DrawAllSceneEnt_480
	jmp R_DrawAllSceneEnt_280
R_DrawAllSceneEnt_60:
	mov eax, edi
	add eax, [esi]
	movzx eax, byte [eax]
	jmp R_DrawAllSceneEnt_490
R_DrawAllSceneEnt_150:
	mov eax, [ebp-0x4c]
	add eax, [esi]
	movzx eax, byte [eax]
	jmp R_DrawAllSceneEnt_500
R_DrawAllSceneEnt_140:
	mov ebx, [ebp-0x68]
	mov dword [ebp-0x54], 0x0
	xor edi, edi
	mov esi, [ebp-0x90]
	add esi, 0x154c94
	mov [ebp-0x60], esi
	mov edx, esi
	mov eax, [ebp-0x4c]
	add eax, [edx]
	movzx eax, byte [eax]
	movzx esi, al
	test al, al
	jnz R_DrawAllSceneEnt_510
R_DrawAllSceneEnt_530:
	mov esi, 0x1
R_DrawAllSceneEnt_510:
	mov eax, [ebp-0x40]
	mov ecx, [ebp-0x54]
	add eax, [ebp+ecx*4-0x34]
	mov [ebp-0xb0], eax
	xor eax, eax
	mov ecx, [ebx]
	mov edx, [ebp-0x6c]
	test [edx], ecx
	cmovz eax, esi
	mov esi, [ebp-0xb0]
	mov [esi], al
	movzx eax, al
	or edi, eax
	add dword [ebp-0x54], 0x1
	add dword [ebp-0x60], 0x4
	add ebx, 0x120
	cmp dword [ebp-0x54], 0x3
	jz R_DrawAllSceneEnt_520
	mov edx, [ebp-0x60]
	mov eax, [ebp-0x4c]
	add eax, [edx]
	movzx eax, byte [eax]
	movzx esi, al
	test al, al
	jnz R_DrawAllSceneEnt_510
	jmp R_DrawAllSceneEnt_530
R_DrawAllSceneEnt_440:
	xor ecx, ecx
	mov dword [ebp-0x74], 0x0
	mov eax, [ebp-0x8c]
	lea ebx, [eax+0x154c94]
R_DrawAllSceneEnt_540:
	mov eax, edi
	add eax, [ebx]
	movzx eax, byte [eax]
	test al, al
	mov edx, 0x1
	cmovz eax, edx
	mov edx, [ebp-0x88]
	add edx, [ebp+ecx*4-0x34]
	mov [edx], al
	movzx eax, al
	or [ebp-0x74], eax
	add ecx, 0x1
	add ebx, 0x4
	cmp ecx, 0x3
	jnz R_DrawAllSceneEnt_540
	lea ebx, [ebp-0x34]
	add ebx, 0xc
	mov ecx, [ebp-0x94]
	add ecx, 0x154ca0
	mov esi, 0x4
R_DrawAllSceneEnt_550:
	mov edx, [ebp-0x88]
	add edx, [ebx]
	mov eax, edi
	add eax, [ecx]
	movzx eax, byte [eax]
	mov [edx], al
	movzx eax, al
	or [ebp-0x74], eax
	add ebx, 0x4
	add ecx, 0x4
	sub esi, 0x1
	jnz R_DrawAllSceneEnt_550
	test byte [ebp-0x74], 0x1
	jz R_DrawAllSceneEnt_560
R_DrawAllSceneEnt_650:
	mov edx, [ebp-0x80]
	mov [esp], edx
	call R_SkinAndBoundSceneEnt
	test eax, eax
	jnz R_DrawAllSceneEnt_570
	mov edx, 0x1
R_DrawAllSceneEnt_580:
	mov eax, [ebp-0x88]
	add eax, [ebp+edx*4-0x38]
	mov byte [eax], 0x0
	add edx, 0x1
	cmp edx, 0x8
	jnz R_DrawAllSceneEnt_580
	mov ecx, [ebp-0xa4]
	mov [ebp-0x94], ecx
	add dword [ebp-0x88], 0x1
	add dword [ebp-0x9c], 0x7c
	mov esi, [ebp-0x88]
	cmp [ebp-0x84], esi
	ja R_DrawAllSceneEnt_90
	jmp R_DrawAllSceneEnt_20
R_DrawAllSceneEnt_370:
	xor ecx, ecx
	xor edi, edi
	mov eax, [ebp-0x90]
	lea ebx, [eax+0x154c94]
R_DrawAllSceneEnt_590:
	mov eax, [ebp-0x4c]
	add eax, [ebx]
	movzx eax, byte [eax]
	test al, al
	mov edx, 0x1
	cmovz eax, edx
	mov edx, [ebp-0x40]
	add edx, [ebp+ecx*4-0x34]
	mov [edx], al
	movzx eax, al
	or edi, eax
	add ecx, 0x1
	add ebx, 0x4
	cmp ecx, 0x3
	jnz R_DrawAllSceneEnt_590
	jmp R_DrawAllSceneEnt_600
R_DrawAllSceneEnt_50:
	mov ebx, [ebp-0x68]
	mov dword [ebp-0x58], 0x0
	mov dword [ebp-0x74], 0x0
	mov esi, [ebp-0x8c]
	add esi, 0x154c94
	mov [ebp-0x5c], esi
	mov edx, esi
	mov eax, edi
	add eax, [edx]
	movzx eax, byte [eax]
	movzx esi, al
	test al, al
	jnz R_DrawAllSceneEnt_610
R_DrawAllSceneEnt_630:
	mov esi, 0x1
R_DrawAllSceneEnt_610:
	mov eax, [ebp-0x88]
	mov ecx, [ebp-0x58]
	add eax, [ebp+ecx*4-0x34]
	mov [ebp-0xb0], eax
	xor eax, eax
	mov ecx, [ebx]
	mov edx, [ebp-0x50]
	test [edx], ecx
	cmovz eax, esi
	mov esi, [ebp-0xb0]
	mov [esi], al
	movzx eax, al
	or [ebp-0x74], eax
	add dword [ebp-0x58], 0x1
	add dword [ebp-0x5c], 0x4
	add ebx, 0x120
	cmp dword [ebp-0x58], 0x3
	jz R_DrawAllSceneEnt_620
	mov edx, [ebp-0x5c]
	mov eax, edi
	add eax, [edx]
	movzx eax, byte [eax]
	movzx esi, al
	test al, al
	jnz R_DrawAllSceneEnt_610
	jmp R_DrawAllSceneEnt_630
R_DrawAllSceneEnt_620:
	lea ebx, [ebp-0x34]
	add ebx, 0xc
	mov ecx, [ebp-0x94]
	add ecx, 0x154ca0
	mov esi, 0x4
R_DrawAllSceneEnt_640:
	mov edx, [ebp-0x88]
	add edx, [ebx]
	mov eax, edi
	add eax, [ecx]
	movzx eax, byte [eax]
	mov [edx], al
	movzx eax, al
	or [ebp-0x74], eax
	add ebx, 0x4
	add ecx, 0x4
	sub esi, 0x1
	jnz R_DrawAllSceneEnt_640
	test byte [ebp-0x74], 0x1
	jz R_DrawAllSceneEnt_560
	jmp R_DrawAllSceneEnt_650
R_DrawAllSceneEnt_410:
	mov esi, scene
	mov [ebp-0x94], esi
	jmp R_DrawAllSceneEnt_400
R_DrawAllSceneEnt_40:
	mov ecx, [ebp-0x68]
	xor ebx, ebx
	mov dword [ebp-0x74], 0x0
R_DrawAllSceneEnt_660:
	mov edx, [ebp-0x88]
	add edx, [ebp+ebx*4-0x34]
	mov eax, [ecx]
	mov esi, [ebp-0x50]
	test [esi], eax
	setz al
	mov [edx], al
	movzx eax, al
	or [ebp-0x74], eax
	add ebx, 0x1
	add ecx, 0x120
	cmp ebx, 0x3
	jnz R_DrawAllSceneEnt_660
	lea ebx, [ebp-0x34]
	add ebx, 0xc
	mov ecx, [ebp-0x94]
	add ecx, 0x154ca0
	mov esi, 0x4
R_DrawAllSceneEnt_670:
	mov edx, [ebp-0x88]
	add edx, [ebx]
	mov eax, edi
	add eax, [ecx]
	movzx eax, byte [eax]
	mov [edx], al
	movzx eax, al
	or [ebp-0x74], eax
	add ebx, 0x4
	add ecx, 0x4
	sub esi, 0x1
	jnz R_DrawAllSceneEnt_670
	test byte [ebp-0x74], 0x1
	jz R_DrawAllSceneEnt_560
	jmp R_DrawAllSceneEnt_650
R_DrawAllSceneEnt_430:
	xor edx, edx
	mov dword [ebp-0x74], 0x0
R_DrawAllSceneEnt_680:
	mov eax, [ebp-0x88]
	add eax, [ebp+edx*4-0x34]
	mov byte [eax], 0x1
	or dword [ebp-0x74], 0x1
	add edx, 0x1
	cmp edx, 0x3
	jnz R_DrawAllSceneEnt_680
	lea ebx, [ebp-0x34]
	add ebx, 0xc
	mov ecx, [ebp-0x94]
	add ecx, 0x154ca0
	mov esi, 0x4
R_DrawAllSceneEnt_690:
	mov edx, [ebp-0x88]
	add edx, [ebx]
	mov eax, edi
	add eax, [ecx]
	movzx eax, byte [eax]
	mov [edx], al
	movzx eax, al
	or [ebp-0x74], eax
	add ebx, 0x4
	add ecx, 0x4
	sub esi, 0x1
	jnz R_DrawAllSceneEnt_690
	test byte [ebp-0x74], 0x1
	jz R_DrawAllSceneEnt_560
	jmp R_DrawAllSceneEnt_650
R_DrawAllSceneEnt_130:
	mov edx, [ebp-0x68]
	xor ebx, ebx
	xor edi, edi
	xor ecx, ecx
	mov eax, [edx]
	mov esi, [ebp-0x6c]
	test [esi], eax
	jnz R_DrawAllSceneEnt_700
R_DrawAllSceneEnt_710:
	mov eax, [ebp-0x40]
	add eax, [ecx+ebp-0x34]
	movzx eax, byte [eax]
	or edi, eax
R_DrawAllSceneEnt_720:
	add ebx, 0x1
	add ecx, 0x4
	add edx, 0x120
	cmp ebx, 0x3
	jz R_DrawAllSceneEnt_520
	mov eax, [edx]
	mov esi, [ebp-0x6c]
	test [esi], eax
	jz R_DrawAllSceneEnt_710
R_DrawAllSceneEnt_700:
	mov eax, [ebp-0x40]
	add eax, [ecx+ebp-0x34]
	mov byte [eax], 0x0
	jmp R_DrawAllSceneEnt_720
R_DrawAllSceneEnt_360:
	xor edx, edx
	xor edi, edi
R_DrawAllSceneEnt_730:
	mov eax, [ebp-0x40]
	add eax, [ebp+edx*4-0x34]
	movzx eax, byte [eax]
	or edi, eax
	add edx, 0x1
	cmp edx, 0x3
	jnz R_DrawAllSceneEnt_730
	jmp R_DrawAllSceneEnt_600
R_DrawAllSceneEnt_570:
	mov ebx, scene
	mov [ebp-0x94], ebx
	add dword [ebp-0x88], 0x1
	add dword [ebp-0x9c], 0x7c
	mov esi, [ebp-0x88]
	cmp [ebp-0x84], esi
	ja R_DrawAllSceneEnt_90
	jmp R_DrawAllSceneEnt_20
	nop


;R_GetFarPlaneDist()
R_GetFarPlaneDist:
	push ebp
	mov ebp, esp
	sub esp, 0x4
	mov eax, r_zfar
	mov eax, [eax]
	movss xmm2, dword [eax+0xc]
	movss xmm1, dword [dpvsGlob+0x58]
	movaps xmm0, xmm2
	cmpss xmm0, [_float_0_00000000], 0x0
	andps xmm1, xmm0
	andnps xmm0, xmm2
	orps xmm0, xmm1
	movss [ebp-0x4], xmm0
	fld dword [ebp-0x4]
	leave
	ret
	nop


;R_InitSceneBuffers()
R_InitSceneBuffers:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x2c
	mov dword [esp+0x4], _cstring_r_initscenebuffe
	mov ebx, gfxCfg
	mov eax, [ebx+0x4]
	shr eax, 0x3
	mov [esp], eax
	call R_AllocGlobalVariable
	mov edx, scene
	mov [edx+0x12b428], eax
	lea esi, [edx+0x154c94]
	lea edi, [edx+0x154cb0]
R_InitSceneBuffers_10:
	mov dword [esp+0x4], _cstring_r_initscenebuffe
	mov eax, [ebx+0x4]
	mov [esp], eax
	call R_AllocGlobalVariable
	mov [esi], eax
	add esi, 0x4
	cmp esi, edi
	jnz R_InitSceneBuffers_10
	mov dword [esp+0x4], _cstring_r_initscenebuffe
	mov eax, [ebx+0x4]
	add eax, eax
	mov [esp], eax
	call R_AllocGlobalVariable
	mov esi, scene
	mov [esi+0x154cb0], eax
	mov dword [esp+0x4], _cstring_r_initscenebuffe
	mov eax, [ebx+0x4]
	add eax, eax
	mov [esp], eax
	call R_AllocGlobalVariable
	mov [esi+0x154cb4], eax
	mov edx, [ebx]
	test edx, edx
	jnz R_InitSceneBuffers_20
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_InitSceneBuffers_20:
	mov dword [ebp-0x1c], 0x0
	mov edi, dpvsGlob
	add esi, 0x154cb8
	mov ebx, gfxCfg
R_InitSceneBuffers_30:
	mov dword [esp+0x4], _cstring_r_initscenebuffe
	mov eax, [ebx+0x4]
	shr eax, 0x5
	shl eax, 0x2
	mov [esp], eax
	call R_AllocGlobalVariable
	mov [edi+0xade4], eax
	mov dword [esp+0x4], _cstring_r_initscenebuffe
	mov eax, [ebx+0x4]
	shl eax, 0x2
	mov [esp], eax
	call R_AllocGlobalVariable
	mov [esi], eax
	add dword [ebp-0x1c], 0x1
	add edi, 0x4
	add esi, 0x4
	mov eax, [ebp-0x1c]
	cmp eax, [ebx]
	jb R_InitSceneBuffers_30
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	nop


;DynEntCl_InitFilter()
DynEntCl_InitFilter:
	push ebp
	mov ebp, esp
	push esi
	push ebx
	sub esp, 0x10
	mov eax, scene
	mov dword [eax+0x154c38], 0x0
	mov dword [eax+0x154c3c], 0x0
	xor ebx, ebx
	mov esi, rgp
DynEntCl_InitFilter_10:
	mov eax, [esi+0x20a0]
	mov edx, [eax+ebx*4+0x2ac]
	imul edx, [eax+0xf0]
	shl edx, 0x2
	mov [esp+0x8], edx
	mov dword [esp+0x4], 0x0
	mov eax, [eax+ebx*4+0x2bc]
	mov [esp], eax
	call Com_Memset
	add ebx, 0x1
	cmp ebx, 0x2
	jnz DynEntCl_InitFilter_10
	add esp, 0x10
	pop ebx
	pop esi
	pop ebp
	ret


;R_FrustumClipPlanes(GfxMatrix const*, float const (*) [4], int, DpvsPlane*)
R_FrustumClipPlanes:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x4
	mov eax, [ebp+0x10]
	test eax, eax
	jle R_FrustumClipPlanes_10
	mov ecx, [ebp+0x14]
	mov esi, [ebp+0xc]
	xor edi, edi
	movss xmm4, dword [_float_1_00000000]
R_FrustumClipPlanes_30:
	mov edx, ecx
	xor ebx, ebx
	mov eax, [ebp+0x8]
R_FrustumClipPlanes_20:
	movss xmm1, dword [esi]
	mulss xmm1, [eax]
	movss xmm0, dword [esi+0x4]
	mulss xmm0, [eax+0x4]
	addss xmm1, xmm0
	movss xmm0, dword [esi+0x8]
	mulss xmm0, [eax+0x8]
	addss xmm1, xmm0
	movss xmm0, dword [esi+0xc]
	mulss xmm0, [eax+0xc]
	addss xmm1, xmm0
	movss [edx], xmm1
	add ebx, 0x1
	add eax, 0x10
	add edx, 0x4
	cmp ebx, 0x4
	jnz R_FrustumClipPlanes_20
	movss xmm0, dword [ecx]
	movss xmm1, dword [ecx+0x4]
	movss xmm2, dword [ecx+0x8]
	mulss xmm0, xmm0
	mulss xmm1, xmm1
	addss xmm0, xmm1
	mulss xmm2, xmm2
	addss xmm0, xmm2
	sqrtss xmm0, xmm0
	movaps xmm1, xmm4
	divss xmm1, xmm0
	movaps xmm0, xmm1
	mulss xmm1, [ecx]
	movss [ecx], xmm1
	movaps xmm2, xmm0
	mulss xmm2, [ecx+0x4]
	movss [ecx+0x4], xmm2
	movaps xmm3, xmm0
	mulss xmm3, [ecx+0x8]
	movss [ecx+0x8], xmm3
	mulss xmm0, [ecx+0xc]
	movss [ecx+0xc], xmm0
	movss [ebp-0x10], xmm1
	mov edx, [ebp-0x10]
	mov eax, 0xc
	test edx, edx
	mov edx, 0x0
	cmovle eax, edx
	mov [ecx+0x10], al
	movss [ebp-0x10], xmm2
	mov edx, [ebp-0x10]
	mov eax, 0x10
	test edx, edx
	mov edx, 0x4
	cmovle eax, edx
	mov [ecx+0x11], al
	movss [ebp-0x10], xmm3
	mov edx, [ebp-0x10]
	mov eax, 0x14
	test edx, edx
	mov edx, 0x8
	cmovle eax, edx
	mov [ecx+0x12], al
	add edi, 0x1
	add ecx, 0x14
	add esi, 0x10
	cmp [ebp+0x10], edi
	jnz R_FrustumClipPlanes_30
R_FrustumClipPlanes_10:
	add esp, 0x4
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	nop


;R_FilterDObjIntoCells(unsigned int, unsigned int, float*, float)
R_FilterDObjIntoCells:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x5c
	mov edi, [ebp+0x10]
	movss xmm2, dword [ebp+0x14]
	mov eax, rgp
	mov edx, [eax+0x20a0]
	mov ebx, [edx+0xf0]
	mov eax, gfxCfg
	mov eax, [eax+0x4]
	shr eax, 0x5
	imul eax, [ebp+0x8]
	mov edx, [edx+0xfc]
	lea eax, [edx+eax*4]
	mov [ebp-0x4c], eax
	mov ecx, [ebp+0xc]
	and ecx, 0x1f
	mov esi, 0x80000000
	shr esi, cl
	not esi
	mov eax, [ebp+0xc]
	shr eax, 0x5
	lea edx, [eax*4]
	mov eax, edx
	mov ecx, [ebp+0x8]
	add eax, [ecx*4+dpvsGlob+0xade4]
	and [eax], esi
	mov ecx, ebx
	add ecx, ecx
	jz R_FilterDObjIntoCells_10
	mov eax, [ebp-0x4c]
	add eax, edx
	xor edx, edx
R_FilterDObjIntoCells_20:
	and [eax], esi
	add edx, 0x1
	add eax, 0x200
	cmp ecx, edx
	jnz R_FilterDObjIntoCells_20
R_FilterDObjIntoCells_10:
	movaps xmm0, xmm2
	xorps xmm0, [_data16_80000000]
	movaps xmm1, xmm0
	addss xmm1, [edi]
	movss [ebp-0x24], xmm1
	movaps xmm1, xmm0
	addss xmm1, [edi+0x4]
	movss [ebp-0x20], xmm1
	addss xmm0, [edi+0x8]
	movss [ebp-0x1c], xmm0
	movaps xmm0, xmm2
	addss xmm0, [edi]
	movss [ebp-0x30], xmm0
	movaps xmm0, xmm2
	addss xmm0, [edi+0x4]
	movss [ebp-0x2c], xmm0
	movaps xmm0, xmm2
	addss xmm0, [edi+0x8]
	movss [ebp-0x28], xmm0
	mov eax, [ebp+0x8]
	mov [ebp-0x40], eax
	mov edx, [ebp+0xc]
	mov [ebp-0x3c], edx
	movss [ebp-0x38], xmm2
	mov dword [ebp-0x34], 0x0
	lea ecx, [ebp-0x24]
	mov edx, rgp
	mov eax, [edx+0x20a0]
	mov edx, [eax+0xf8]
	lea eax, [ebp-0x40]
	lea ebx, [ebp-0x30]
	mov [esp], ebx
	call R_FilterEntIntoCells_r
	add esp, 0x5c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


;R_AddWorldSurfacesDpvs(GfxViewParms const*, int)
R_AddWorldSurfacesDpvs:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x2c
	mov ebx, [ebp+0xc]
	mov eax, rg
	mov edx, [ebp+0x8]
	mov [eax+0x2264], edx
	mov edi, rgp
	mov eax, [edi+0x20a0]
	mov eax, [eax+0xf0]
	add eax, 0x1f
	sar eax, 0x5
	shl eax, 0x2
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x0
	mov dword [esp], dpvsGlob+0xadf8
	call memset
	mov dword [dpvsGlob+0xadf4], dpvsGlob+0xadf8
	mov eax, r_skipPvs
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jnz R_AddWorldSurfacesDpvs_10
	mov edx, scene
	mov eax, [edx+0x154c90]
	lea eax, [eax+eax*2]
	lea eax, [eax+eax*8]
	shl eax, 0x5
	lea esi, [eax+dpvsGlob+0xa050]
	lea eax, [esi+0xc]
	mov [ebp-0x1c], eax
	test ebx, ebx
	js R_AddWorldSurfacesDpvs_20
	mov edx, [edi+0x20a0]
	lea eax, [ebx*8]
	shl ebx, 0x6
	sub ebx, eax
	add ebx, [edx+0x104]
	mov eax, r_singleCell
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jnz R_AddWorldSurfacesDpvs_30
	mov edx, [ebp-0x1c]
	mov eax, [edx+0x11c]
	mov [esp+0xc], eax
	lea eax, [esi+0x10]
	mov [esp+0x8], eax
	mov dword [esp+0x4], dpvsGlob
	mov [esp], ebx
	call R_VisitPortals
R_AddWorldSurfacesDpvs_10:
	mov edx, scene
	mov eax, [edx+0x154c90]
	lea eax, [eax+eax*2]
	lea eax, [eax+eax*8]
	shl eax, 0x5
	lea ebx, [eax+dpvsGlob+0xa050]
	lea esi, [ebx+0xc]
	mov eax, [dpvsGlob+0x2c]
	test eax, eax
	jz R_AddWorldSurfacesDpvs_40
	mov eax, [esi+0x11c]
	sub eax, 0x1
	mov [esp+0x4], eax
	lea eax, [ebx+0x10]
	mov [esp], eax
	call R_AddSkySurfacesDpvs
R_AddWorldSurfacesDpvs_40:
	mov eax, r_vc_makelog
	mov eax, [eax]
	mov edi, [eax+0xc]
	test edi, edi
	jz R_AddWorldSurfacesDpvs_50
	mov eax, [esi+0x11c]
	mov [esp+0x8], eax
	lea eax, [ebx+0x10]
	mov [esp+0x4], eax
	mov eax, [ebp+0x8]
	add eax, 0x100
	mov [esp], eax
	call R_ShowLightVisCachePoints
R_AddWorldSurfacesDpvs_50:
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_AddWorldSurfacesDpvs_30:
	mov dword [dpvsGlob+0x2c], 0x0
	mov edx, [ebp-0x1c]
	mov ecx, [edx+0x11c]
	lea edx, [esi+0x10]
	mov [esp], ecx
	mov eax, ebx
	call R_AddCellSurfacesAndCullGroupsInFrustumDelayed
	mov eax, [edi+0x20a0]
	mov edx, ebx
	sub edx, [eax+0x104]
	sar edx, 0x3
	lea ecx, [edx+edx*8]
	mov eax, ecx
	shl eax, 0x6
	add ecx, eax
	lea ecx, [edx+ecx*8]
	mov eax, ecx
	shl eax, 0xf
	add ecx, eax
	lea ecx, [edx+ecx*8]
	neg ecx
	mov ebx, ecx
	shr ebx, 0x5
	mov edx, [dpvsGlob+0xadf4]
	and ecx, 0x1f
	mov eax, 0x1
	shl eax, cl
	or [edx+ebx*4], eax
	jmp R_AddWorldSurfacesDpvs_10
R_AddWorldSurfacesDpvs_20:
	mov eax, [edi+0x20a0]
	mov ecx, [eax+0xf0]
	test ecx, ecx
	jle R_AddWorldSurfacesDpvs_10
	mov dword [ebp-0x20], 0x0
	xor edi, edi
	add esi, 0x10
R_AddWorldSurfacesDpvs_60:
	mov edx, [ebp-0x1c]
	mov ecx, [edx+0x11c]
	mov edx, [eax+0x104]
	lea eax, [edi+edx]
	mov [esp], ecx
	mov edx, esi
	call R_AddCellSurfacesAndCullGroupsInFrustumDelayed
	mov edx, edi
	sar edx, 0x3
	lea ecx, [edx+edx*8]
	mov eax, ecx
	shl eax, 0x6
	add ecx, eax
	lea ecx, [edx+ecx*8]
	mov eax, ecx
	shl eax, 0xf
	add ecx, eax
	lea ecx, [edx+ecx*8]
	neg ecx
	mov ebx, ecx
	shr ebx, 0x5
	mov edx, [dpvsGlob+0xadf4]
	and ecx, 0x1f
	mov eax, 0x1
	shl eax, cl
	or [edx+ebx*4], eax
	add dword [ebp-0x20], 0x1
	mov eax, rgp
	mov eax, [eax+0x20a0]
	add edi, 0x38
	mov edx, [ebp-0x20]
	cmp [eax+0xf0], edx
	jg R_AddWorldSurfacesDpvs_60
	jmp R_AddWorldSurfacesDpvs_10


;R_SetViewFrustumPlanes(GfxViewInfo*)
R_SetViewFrustumPlanes:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	xor esi, esi
	mov edi, scene
	xor ebx, ebx
	mov ecx, [ebp+0x8]
	add ecx, 0x55e0
R_SetViewFrustumPlanes_10:
	mov eax, [edi+0x154c90]
	lea eax, [eax+eax*2]
	lea eax, [eax+eax*8]
	shl eax, 0x5
	lea eax, [ebx+eax+dpvsGlob+0xa050]
	lea edx, [eax+0x10]
	mov eax, [eax+0x10]
	mov [ecx+0x8], eax
	mov eax, [edx+0x4]
	mov [ecx+0xc], eax
	mov eax, [edx+0x8]
	mov [ecx+0x10], eax
	mov eax, [edx+0xc]
	mov [ecx+0x14], eax
	add esi, 0x1
	add ecx, 0x10
	add ebx, 0x14
	cmp esi, 0x4
	jnz R_SetViewFrustumPlanes_10
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	nop


;R_ShutdownSceneBuffers()
R_ShutdownSceneBuffers:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x2c
	mov ebx, scene
	add ebx, 0x154c94
	mov eax, scene
	lea esi, [eax+0x154cb0]
R_ShutdownSceneBuffers_10:
	mov eax, [ebx]
	mov [esp], eax
	call R_FreeGlobalVariable
	add ebx, 0x4
	cmp ebx, esi
	jnz R_ShutdownSceneBuffers_10
	mov edx, scene
	mov eax, [edx+0x154cb0]
	mov [esp], eax
	call R_FreeGlobalVariable
	mov edx, scene
	mov eax, [edx+0x154cb4]
	mov [esp], eax
	call R_FreeGlobalVariable
	mov eax, gfxCfg
	mov ecx, [eax]
	test ecx, ecx
	jnz R_ShutdownSceneBuffers_20
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_ShutdownSceneBuffers_20:
	xor edi, edi
	mov esi, dpvsGlob
	mov edx, scene
	lea ebx, [edx+0x154cb8]
	mov [ebp-0x1c], eax
R_ShutdownSceneBuffers_30:
	mov eax, [esi+0xade4]
	mov [esp], eax
	call R_FreeGlobalVariable
	mov eax, [ebx]
	mov [esp], eax
	call R_FreeGlobalVariable
	add edi, 0x1
	add esi, 0x4
	add ebx, 0x4
	mov eax, [ebp-0x1c]
	cmp edi, [eax]
	jb R_ShutdownSceneBuffers_30
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


;R_UnfilterEntFromCells(unsigned int, unsigned int)
R_UnfilterEntFromCells:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x4
	mov ebx, [ebp+0xc]
	mov eax, rgp
	mov edx, [eax+0x20a0]
	mov esi, [edx+0xf0]
	mov eax, gfxCfg
	mov eax, [eax+0x4]
	shr eax, 0x5
	imul eax, [ebp+0x8]
	mov edx, [edx+0xfc]
	lea eax, [edx+eax*4]
	mov [ebp-0x10], eax
	mov ecx, ebx
	and ecx, 0x1f
	mov edi, 0x80000000
	shr edi, cl
	not edi
	shr ebx, 0x5
	lea edx, [ebx*4]
	mov eax, edx
	mov ecx, [ebp+0x8]
	add eax, [ecx*4+dpvsGlob+0xade4]
	and [eax], edi
	mov ecx, esi
	add ecx, ecx
	jz R_UnfilterEntFromCells_10
	mov eax, [ebp-0x10]
	add eax, edx
	xor edx, edx
R_UnfilterEntFromCells_20:
	and [eax], edi
	add edx, 0x1
	add eax, 0x200
	cmp ecx, edx
	jnz R_UnfilterEntFromCells_20
R_UnfilterEntFromCells_10:
	add esp, 0x4
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	nop


;R_FilterBModelIntoCells(unsigned int, unsigned int, GfxBrushModel*)
R_FilterBModelIntoCells:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x3c
	mov edi, [ebp+0x10]
	mov eax, rgp
	mov edx, [eax+0x20a0]
	mov ebx, [edx+0xf0]
	mov eax, gfxCfg
	mov eax, [eax+0x4]
	shr eax, 0x5
	imul eax, [ebp+0x8]
	mov edx, [edx+0xfc]
	lea eax, [edx+eax*4]
	mov [ebp-0x2c], eax
	mov ecx, [ebp+0xc]
	and ecx, 0x1f
	mov esi, 0x80000000
	shr esi, cl
	not esi
	mov eax, [ebp+0xc]
	shr eax, 0x5
	lea edx, [eax*4]
	mov eax, edx
	mov ecx, [ebp+0x8]
	add eax, [ecx*4+dpvsGlob+0xade4]
	and [eax], esi
	mov ecx, ebx
	add ecx, ecx
	jz R_FilterBModelIntoCells_10
	mov eax, [ebp-0x2c]
	add eax, edx
	xor edx, edx
R_FilterBModelIntoCells_20:
	and [eax], esi
	add edx, 0x1
	add eax, 0x200
	cmp ecx, edx
	jnz R_FilterBModelIntoCells_20
R_FilterBModelIntoCells_10:
	mov eax, [ebp+0x8]
	mov [ebp-0x28], eax
	mov ecx, [ebp+0xc]
	mov [ebp-0x24], ecx
	mov [ebp-0x20], edi
	mov eax, rgp
	mov edx, [eax+0x20a0]
	mov eax, [edx+0xf0]
	mov [ebp-0x1c], eax
	mov edx, [edx+0xf8]
	lea eax, [ebp-0x28]
	lea ecx, [edi+0xc]
	mov [esp], ecx
	mov ecx, edi
	call R_FilterEntIntoCells_r
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


;R_FilterDynEntIntoCells(unsigned int, DynEntityDrawType, float*, float*)
R_FilterDynEntIntoCells:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x10
	mov eax, [ebp+0x8]
	mov [ebp-0x10], eax
	mov edx, [ebp+0xc]
	mov [ebp-0x14], edx
	mov eax, [ebp+0x10]
	mov [ebp-0x18], eax
	mov edx, [ebp+0x14]
	mov [ebp-0x1c], edx
	mov edx, rgp
	mov eax, [edx+0x20a0]
	mov edx, [ebp-0x14]
	mov ebx, [eax+edx*4+0x2bc]
	mov edi, [eax+edx*4+0x2ac]
	mov esi, [eax+0xf0]
	mov eax, [ebp-0x10]
	shr eax, 0x5
	mov ecx, [ebp-0x10]
	and ecx, 0x1f
	mov edx, 0x80000000
	shr edx, cl
	not edx
	test esi, esi
	jz R_FilterDynEntIntoCells_10
	xor ecx, ecx
R_FilterDynEntIntoCells_20:
	and [ebx+eax*4], edx
	add ecx, 0x1
	add eax, edi
	cmp esi, ecx
	ja R_FilterDynEntIntoCells_20
R_FilterDynEntIntoCells_10:
	mov edx, rgp
	mov eax, [edx+0x20a0]
	mov eax, [eax+0xf8]
	mov edx, [ebp-0x1c]
	mov [ebp+0xc], edx
	mov edx, [ebp-0x18]
	mov [ebp+0x8], edx
	mov ecx, [ebp-0x14]
	mov edx, [ebp-0x10]
	add esp, 0x10
	pop ebx
	pop esi
	pop edi
	pop ebp
	jmp R_FilterDynEntIntoCells_r
	nop


;R_FilterXModelIntoScene(XModel const*, GfxScaledPlacement const*, unsigned short, unsigned short*)
R_FilterXModelIntoScene:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x6c
	mov eax, [ebp+0x8]
	mov [ebp-0x3c], eax
	mov esi, [ebp+0xc]
	mov edx, [ebp+0x14]
	mov [ebp-0x44], edx
	movzx edi, word [ebp+0x10]
	mov [ebp-0x3e], di
	movss xmm0, dword [esi+0x1c]
	movss [ebp-0x30], xmm0
	mov [esp], eax
	call XModelGetRadius
	fstp dword [ebp-0x38]
	movss xmm0, dword [ebp-0x30]
	mulss xmm0, [ebp-0x38]
	movss [ebp-0x30], xmm0
	mov eax, scene
	mov eax, [eax+0x154c90]
	lea eax, [eax+eax*2]
	lea eax, [eax+eax*8]
	shl eax, 0x5
	add eax, dpvsGlob+0xa05c
	mov dword [ebp-0x34], 0x0
	mov dword [ebp-0x5c], 0x1
	lea edx, [esi+0x10]
	mov [ebp-0x48], edx
	lea edi, [esi+0x14]
	mov [ebp-0x4c], edi
	lea edx, [esi+0x18]
	mov [ebp-0x50], edx
	pxor xmm4, xmm4
R_FilterXModelIntoScene_20:
	mov ebx, [eax+0x11c]
	lea edx, [eax+0x4]
	test ebx, ebx
	jg R_FilterXModelIntoScene_10
R_FilterXModelIntoScene_70:
	mov edi, [ebp-0x5c]
	mov byte [edi+ebp-0x1c], 0x1
R_FilterXModelIntoScene_90:
	add dword [ebp-0x5c], 0x1
	add eax, 0x120
	cmp dword [ebp-0x5c], 0x4
	jnz R_FilterXModelIntoScene_20
	cmp dword [ebp-0x34], 0x3
	jz R_FilterXModelIntoScene_30
	cmp word [ebp-0x3e], 0x0
	jnz R_FilterXModelIntoScene_40
	mov dword [ebp-0x2c], 0x0
R_FilterXModelIntoScene_110:
	call R_AllocSceneModel
	mov edi, eax
	cmp eax, 0x3ff
	ja R_FilterXModelIntoScene_30
	lea ecx, [eax+eax*8]
	mov ebx, scene
	lea ecx, [ebx+ecx*8+0x13ba00]
	lea eax, [ecx+0x34]
	mov edx, [ebp-0x3c]
	mov [eax+0x4], edx
	movzx edx, word [ebp-0x2c]
	mov [eax+0x2c], dx
	mov edx, [esi]
	mov [eax+0xc], edx
	mov edx, [esi+0x4]
	mov [eax+0x10], edx
	mov edx, [esi+0x8]
	mov [eax+0x14], edx
	mov edx, [esi+0xc]
	mov [eax+0x18], edx
	mov edx, [esi+0x10]
	mov [eax+0x1c], edx
	mov edx, [esi+0x14]
	mov [eax+0x20], edx
	mov edx, [esi+0x18]
	mov [eax+0x24], edx
	mov edx, [esi+0x1c]
	mov [eax+0x28], edx
	mov edx, gfxCfg
	mov edx, [edx+0x8]
	mov [eax+0x2e], dx
	mov edx, [ebp-0x44]
	mov [eax+0x34], edx
	movss xmm0, dword [ebp-0x30]
	movss [eax+0x30], xmm0
	mov edx, [ecx+0x50]
	mov [ecx+0x6c], edx
	mov edx, [ecx+0x54]
	mov [ecx+0x70], edx
	mov edx, [ecx+0x58]
	mov [ecx+0x74], edx
	movss xmm0, dword [_float_4_00000000]
	addss xmm0, [eax+0x40]
	movss [eax+0x40], xmm0
	lea edx, [edi+ebx+0x14da34]
	mov ecx, 0x1
R_FilterXModelIntoScene_50:
	movzx eax, byte [ecx+ebp-0x1c]
	mov [edx], al
	add ecx, 0x1
	add edx, 0x400
	cmp ecx, 0x4
	jnz R_FilterXModelIntoScene_50
R_FilterXModelIntoScene_30:
	add esp, 0x6c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_FilterXModelIntoScene_10:
	movss xmm0, dword [esi+0x10]
	movss xmm2, dword [esi+0x14]
	movss xmm1, dword [esi+0x18]
	mulss xmm1, [eax+0xc]
	mulss xmm0, [eax+0x4]
	mulss xmm2, [eax+0x8]
	addss xmm0, xmm2
	addss xmm1, xmm0
	addss xmm1, [edx+0xc]
	addss xmm1, [ebp-0x30]
	movaps xmm3, xmm4
	ucomiss xmm4, xmm1
	jae R_FilterXModelIntoScene_60
	mov ecx, 0x1
R_FilterXModelIntoScene_80:
	add edx, 0x14
	cmp ecx, ebx
	jz R_FilterXModelIntoScene_70
	mov edi, [ebp-0x48]
	movss xmm0, dword [edi]
	mov edi, [ebp-0x4c]
	movss xmm1, dword [edi]
	mov edi, [ebp-0x50]
	movss xmm2, dword [edi]
	add ecx, 0x1
	mulss xmm0, [edx]
	mulss xmm1, [edx+0x4]
	addss xmm0, xmm1
	mulss xmm2, [edx+0x8]
	addss xmm0, xmm2
	addss xmm0, [edx+0xc]
	addss xmm0, [ebp-0x30]
	ucomiss xmm3, xmm0
	jb R_FilterXModelIntoScene_80
R_FilterXModelIntoScene_60:
	add dword [ebp-0x34], 0x1
	mov edx, [ebp-0x5c]
	mov byte [edx+ebp-0x1c], 0x2
	jmp R_FilterXModelIntoScene_90
R_FilterXModelIntoScene_40:
	mov ebx, frontEndDataOut
	mov eax, [ebx]
	add eax, 0x11825c
	mov dword [esp+0x4], 0x1
	mov [esp], eax
	call InterlockedExchangeAdd
	mov [ebp-0x2c], eax
	cmp eax, 0x7f
	ja R_FilterXModelIntoScene_100
	lea eax, [eax*8+0x118260]
	add eax, [ebx]
	mov dword [eax+0x4], 0x0
	movzx edx, word [ebp-0x3e]
	mov [eax], edx
	jmp R_FilterXModelIntoScene_110
R_FilterXModelIntoScene_100:
	mov eax, [ebx]
	mov dword [eax+0x11825c], 0x80
	mov dword [ebp+0xc], 0x80
	mov dword [ebp+0x8], 0x2
	add esp, 0x6c
	pop ebx
	pop esi
	pop edi
	pop ebp
	jmp R_WarnOncePerFrame
	nop


;R_SetupWorldSurfacesDpvs(GfxViewParms const*)
R_SetupWorldSurfacesDpvs:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x3c
	mov esi, [ebp+0x8]
	mov eax, scene
	mov eax, [eax+0x154c90]
	lea eax, [eax+eax*2]
	lea eax, [eax+eax*8]
	shl eax, 0x5
	add eax, dpvsGlob+0xa050
	lea edx, [eax+0xc]
	mov [ebp-0x1c], edx
	mov dword [eax+0xc], 0x0
	lea ecx, [esi+0x80]
	mov [dpvsGlob+0x30], ecx
	lea edx, [esi+0xc0]
	mov [dpvsGlob+0x34], edx
	lea ebx, [eax+0x10]
	mov [esp+0xc], ebx
	mov dword [esp+0x8], 0x4
	mov dword [esp+0x4], standardFrustumSidePlanes
	mov [esp], ecx
	call R_FrustumClipPlanes
	lea edx, [esi+0x100]
	mov eax, [esi+0x100]
	mov [dpvsGlob+0x38], eax
	mov eax, [edx+0x4]
	mov [dpvsGlob+0x3c], eax
	mov eax, [edx+0x8]
	mov [dpvsGlob+0x40], eax
	mov dword [dpvsGlob+0x44], 0x3f800000
	mov dword [dpvsGlob+0x48], 0x0
	movss xmm2, dword [esi+0x110]
	movss [dpvsGlob], xmm2
	movss xmm3, dword [esi+0x114]
	movss [dpvsGlob+0x4], xmm3
	movss xmm4, dword [esi+0x118]
	movss [dpvsGlob+0x8], xmm4
	movaps xmm1, xmm2
	mulss xmm1, [dpvsGlob+0x38]
	movaps xmm0, xmm3
	mulss xmm0, [dpvsGlob+0x3c]
	addss xmm1, xmm0
	movaps xmm0, xmm4
	mulss xmm0, [dpvsGlob+0x40]
	addss xmm1, xmm0
	movss xmm0, dword [_float_0_10000000]
	subss xmm0, xmm1
	movss [dpvsGlob+0xc], xmm0
	movss [ebp-0x2c], xmm2
	mov eax, [ebp-0x2c]
	mov edi, 0xc
	test eax, eax
	mov eax, 0x0
	cmovg eax, edi
	mov [dpvsGlob+0x10], al
	movss [ebp-0x2c], xmm3
	mov eax, [ebp-0x2c]
	mov ecx, 0x10
	test eax, eax
	mov eax, 0x4
	cmovg eax, ecx
	mov [dpvsGlob+0x11], al
	movss [ebp-0x2c], xmm4
	mov eax, [ebp-0x2c]
	mov edx, 0x14
	test eax, eax
	mov eax, 0x8
	cmovg eax, edx
	mov [dpvsGlob+0x12], al
	mov dword [dpvsGlob+0x28], dpvsGlob
	mov eax, r_zfar
	mov eax, [eax]
	movss xmm5, dword [eax+0xc]
	pxor xmm2, xmm2
	movss xmm0, dword [dpvsGlob+0x58]
	movaps xmm1, xmm5
	cmpss xmm1, xmm2, 0x0
	andps xmm0, xmm1
	andnps xmm1, xmm5
	movaps xmm5, xmm1
	orps xmm5, xmm0
	ucomiss xmm2, xmm5
	jae R_SetupWorldSurfacesDpvs_10
	movss xmm0, dword [_data16_80000000]
	movss xmm2, dword [esi+0x110]
	xorps xmm2, xmm0
	movss [dpvsGlob+0x14], xmm2
	movss xmm3, dword [esi+0x114]
	xorps xmm3, xmm0
	movss [dpvsGlob+0x18], xmm3
	movss xmm4, dword [esi+0x118]
	xorps xmm4, xmm0
	movss [dpvsGlob+0x1c], xmm4
	movaps xmm0, xmm2
	mulss xmm0, [dpvsGlob+0x38]
	movaps xmm1, xmm3
	mulss xmm1, [dpvsGlob+0x3c]
	addss xmm0, xmm1
	movaps xmm1, xmm4
	mulss xmm1, [dpvsGlob+0x40]
	addss xmm0, xmm1
	subss xmm5, xmm0
	movss [dpvsGlob+0x20], xmm5
	movss [ebp-0x2c], xmm2
	mov eax, [ebp-0x2c]
	test eax, eax
	mov eax, 0x0
	cmovle edi, eax
	mov eax, edi
	mov [dpvsGlob+0x24], al
	movss [ebp-0x2c], xmm3
	mov eax, [ebp-0x2c]
	test eax, eax
	mov eax, 0x4
	cmovle ecx, eax
	mov [dpvsGlob+0x25], cl
	movss [ebp-0x2c], xmm4
	mov eax, [ebp-0x2c]
	test eax, eax
	mov eax, 0x8
	cmovle edx, eax
	mov [dpvsGlob+0x26], dl
	mov dword [dpvsGlob+0x2c], dpvsGlob+0x14
R_SetupWorldSurfacesDpvs_30:
	mov [dpvsGlob+0xade0], ebx
	mov edx, [dpvsGlob+0x28]
	mov eax, [edx]
	mov [ebx+0x50], eax
	mov eax, [edx+0x4]
	mov [ebx+0x54], eax
	mov eax, [edx+0x8]
	mov [ebx+0x58], eax
	mov eax, [edx+0xc]
	mov [ebx+0x5c], eax
	mov eax, [edx+0x10]
	mov [ebx+0x60], eax
	mov edx, [dpvsGlob+0x2c]
	test edx, edx
	jz R_SetupWorldSurfacesDpvs_20
	mov eax, [edx]
	mov [ebx+0x64], eax
	mov eax, [edx+0x4]
	mov [ebx+0x68], eax
	mov eax, [edx+0x8]
	mov [ebx+0x6c], eax
	mov eax, [edx+0xc]
	mov [ebx+0x70], eax
	mov eax, [edx+0x10]
	mov [ebx+0x74], eax
	mov eax, 0x6
	mov edx, [ebp-0x1c]
	mov [edx+0x11c], eax
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_SetupWorldSurfacesDpvs_10:
	mov dword [dpvsGlob+0x2c], 0x0
	jmp R_SetupWorldSurfacesDpvs_30
R_SetupWorldSurfacesDpvs_20:
	mov eax, 0x5
	mov edx, [ebp-0x1c]
	mov [edx+0x11c], eax
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	nop


;R_FilterEntitiesIntoCells(int)
R_FilterEntitiesIntoCells:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x4c
	mov edx, [ebp+0x8]
	xor eax, eax
	test edx, edx
	cmovns eax, edx
	mov [dpvsGlob+0xaddc], eax
	mov edx, scene
	mov eax, [edx+0x154c90]
	lea eax, [eax+eax*2]
	lea eax, [eax+eax*8]
	shl eax, 0x5
	add eax, dpvsGlob+0xa05c
	mov [ebp-0x40], eax
	mov eax, [edx+0x12b42c]
	test eax, eax
	jle R_FilterEntitiesIntoCells_10
	mov dword [ebp-0x4c], 0x0
	lea ecx, [edx+0x154ca0]
	mov [ebp-0x54], ecx
	add edx, 0x12b400
	mov [ebp-0x58], edx
	mov eax, edx
R_FilterEntitiesIntoCells_70:
	add eax, 0x30
	mov [ebp-0x48], eax
	mov eax, [eax+0x2c]
	cmp eax, 0x4
	jz R_FilterEntitiesIntoCells_20
	mov ecx, [ebp-0x58]
	movzx ecx, word [ecx+0x9e]
	mov [ebp-0x18], ecx
	mov edi, [ebp-0x40]
	mov eax, scene
	add eax, 0x154c94
	mov [ebp-0x24], eax
	mov edx, [ebp-0x58]
	lea esi, [edx+0x60]
	pxor xmm2, xmm2
	mov ecx, [ebp-0x54]
	mov [ebp-0x20], ecx
R_FilterEntitiesIntoCells_60:
	mov eax, [edi+0x11c]
	mov [ebp-0x3c], eax
	lea edx, [edi+0x4]
	test eax, eax
	jle R_FilterEntitiesIntoCells_30
	movzx eax, byte [edx+0x10]
	movss xmm1, dword [edi+0x4]
	mulss xmm1, [eax+esi]
	addss xmm1, [edx+0xc]
	movzx eax, byte [edx+0x11]
	movss xmm0, dword [edx+0x4]
	mov ecx, [ebp-0x48]
	mulss xmm0, [ecx+eax+0x30]
	addss xmm1, xmm0
	movzx eax, byte [edx+0x12]
	movss xmm0, dword [edx+0x8]
	mulss xmm0, [ecx+eax+0x30]
	addss xmm1, xmm0
	movaps xmm6, xmm2
	ucomiss xmm2, xmm1
	jae R_FilterEntitiesIntoCells_40
	lea ecx, [edi+0x24]
	mov ebx, 0x1
R_FilterEntitiesIntoCells_50:
	cmp ebx, [ebp-0x3c]
	jz R_FilterEntitiesIntoCells_30
	mov eax, ecx
	add ebx, 0x1
	add ecx, 0x14
	movzx edx, byte [eax+0x4]
	movss xmm1, dword [eax-0xc]
	mulss xmm1, [edx+esi]
	addss xmm1, [eax]
	movzx edx, byte [eax+0x5]
	movss xmm0, dword [eax-0x8]
	mulss xmm0, [edx+esi]
	addss xmm1, xmm0
	movzx edx, byte [eax+0x6]
	movss xmm0, dword [eax-0x4]
	mulss xmm0, [edx+esi]
	addss xmm1, xmm0
	ucomiss xmm6, xmm1
	jb R_FilterEntitiesIntoCells_50
R_FilterEntitiesIntoCells_40:
	mov edx, [ebp-0x24]
	mov eax, [edx]
	mov ecx, [ebp-0x18]
	mov byte [eax+ecx], 0x2
R_FilterEntitiesIntoCells_30:
	add edi, 0x120
	add dword [ebp-0x24], 0x4
	mov eax, [ebp-0x24]
	cmp [ebp-0x20], eax
	jnz R_FilterEntitiesIntoCells_60
R_FilterEntitiesIntoCells_20:
	add dword [ebp-0x4c], 0x1
	add dword [ebp-0x58], 0x7c
	mov edx, scene
	mov eax, [edx+0x12b42c]
	cmp [ebp-0x4c], eax
	jge R_FilterEntitiesIntoCells_10
	mov eax, [ebp-0x58]
	jmp R_FilterEntitiesIntoCells_70
R_FilterEntitiesIntoCells_10:
	mov ecx, edx
	mov eax, [edx+0x13ba30]
	test eax, eax
	jle R_FilterEntitiesIntoCells_80
	mov dword [ebp-0x14], 0x0
	mov eax, edx
	add eax, 0x154ca0
	mov [ebp-0x28], eax
	mov esi, edx
	add esi, 0x13ba00
	pxor xmm7, xmm7
	mov ecx, scene
R_FilterEntitiesIntoCells_140:
	movzx edx, word [esi+0x62]
	mov [ebp-0x1c], edx
	mov ebx, [ebp-0x40]
	add ecx, 0x154c94
	mov [ebp-0x2c], ecx
R_FilterEntitiesIntoCells_120:
	mov edi, [ebx+0x11c]
	movss xmm4, dword [esi+0x64]
	lea eax, [ebx+0x4]
	test edi, edi
	jle R_FilterEntitiesIntoCells_90
	movss xmm5, dword [esi+0x50]
	movss xmm3, dword [esi+0x54]
	movss xmm2, dword [esi+0x58]
	movaps xmm0, xmm5
	mulss xmm0, [ebx+0x4]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	addss xmm0, [eax+0xc]
	addss xmm0, xmm4
	movaps xmm6, xmm7
	ucomiss xmm7, xmm0
	jae R_FilterEntitiesIntoCells_100
	lea edx, [ebx+0x18]
	mov ecx, 0x1
R_FilterEntitiesIntoCells_110:
	add eax, 0x14
	cmp edi, ecx
	jz R_FilterEntitiesIntoCells_90
	movaps xmm0, xmm5
	mulss xmm0, [eax]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	addss xmm0, [edx+0xc]
	addss xmm0, xmm4
	add ecx, 0x1
	add edx, 0x14
	ucomiss xmm6, xmm0
	jb R_FilterEntitiesIntoCells_110
R_FilterEntitiesIntoCells_100:
	mov edx, [ebp-0x2c]
	mov eax, [edx]
	mov ecx, [ebp-0x1c]
	mov byte [eax+ecx], 0x2
R_FilterEntitiesIntoCells_90:
	add ebx, 0x120
	add dword [ebp-0x2c], 0x4
	mov eax, [ebp-0x2c]
	cmp [ebp-0x28], eax
	jnz R_FilterEntitiesIntoCells_120
	add dword [ebp-0x14], 0x1
	add esi, 0x48
	mov edx, scene
	mov eax, [edx+0x13ba30]
	cmp [ebp-0x14], eax
	jge R_FilterEntitiesIntoCells_130
	mov ecx, edx
	jmp R_FilterEntitiesIntoCells_140
R_FilterEntitiesIntoCells_130:
	mov ecx, edx
R_FilterEntitiesIntoCells_80:
	mov eax, [ecx+0x14f634]
	test eax, eax
	jle R_FilterEntitiesIntoCells_150
	mov dword [ebp-0x10], 0x0
	mov eax, ecx
	add eax, 0x154ca0
	mov [ebp-0x30], eax
	add ecx, 0x14f638
	mov [ebp-0x50], ecx
	pxor xmm2, xmm2
	mov edx, ecx
R_FilterEntitiesIntoCells_200:
	movzx edx, word [edx+0x2]
	mov [ebp-0x44], edx
	mov ecx, [ebp-0x50]
	mov ebx, [ecx+0x4]
	mov edi, [ebp-0x40]
	mov eax, scene
	add eax, 0x154c94
	mov [ebp-0x34], eax
R_FilterEntitiesIntoCells_190:
	mov edx, [edi+0x11c]
	mov [ebp-0x38], edx
	lea edx, [edi+0x4]
	mov eax, [ebp-0x38]
	test eax, eax
	jle R_FilterEntitiesIntoCells_160
	movzx eax, byte [edx+0x11]
	movss xmm1, dword [eax+ebx]
	mulss xmm1, [edx+0x4]
	movzx eax, byte [edx+0x10]
	movss xmm0, dword [ebx+eax]
	mulss xmm0, [edi+0x4]
	addss xmm0, [edx+0xc]
	addss xmm1, xmm0
	movzx eax, byte [edx+0x12]
	movss xmm0, dword [edx+0x8]
	mulss xmm0, [ebx+eax]
	addss xmm1, xmm0
	movaps xmm6, xmm2
	ucomiss xmm2, xmm1
	jae R_FilterEntitiesIntoCells_170
	lea ecx, [edi+0x24]
	mov esi, 0x1
R_FilterEntitiesIntoCells_180:
	cmp [ebp-0x38], esi
	jz R_FilterEntitiesIntoCells_160
	mov eax, ecx
	add esi, 0x1
	add ecx, 0x14
	movzx edx, byte [eax+0x5]
	movss xmm1, dword [edx+ebx]
	mulss xmm1, [eax-0x8]
	movzx edx, byte [eax+0x4]
	movss xmm0, dword [eax-0xc]
	mulss xmm0, [edx+ebx]
	addss xmm0, [eax]
	addss xmm1, xmm0
	movzx edx, byte [eax+0x6]
	movss xmm0, dword [eax-0x4]
	mulss xmm0, [edx+ebx]
	addss xmm1, xmm0
	ucomiss xmm6, xmm1
	jb R_FilterEntitiesIntoCells_180
R_FilterEntitiesIntoCells_170:
	mov ecx, [ebp-0x34]
	mov eax, [ecx]
	mov edx, [ebp-0x44]
	mov byte [eax+edx], 0x2
R_FilterEntitiesIntoCells_160:
	add edi, 0x120
	add dword [ebp-0x34], 0x4
	mov ecx, [ebp-0x30]
	cmp [ebp-0x34], ecx
	jnz R_FilterEntitiesIntoCells_190
	add dword [ebp-0x10], 0x1
	add dword [ebp-0x50], 0x28
	mov edx, scene
	mov eax, [edx+0x14f634]
	cmp [ebp-0x10], eax
	jge R_FilterEntitiesIntoCells_150
	mov edx, [ebp-0x50]
	jmp R_FilterEntitiesIntoCells_200
R_FilterEntitiesIntoCells_150:
	add esp, 0x4c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	nop


;R_SetupShadowSurfacesDpvs(GfxViewParms const*, float const (*) [4], unsigned int, int)
R_SetupShadowSurfacesDpvs:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x3c
	mov edi, [ebp+0x8]
	mov eax, [ebp+0x14]
	lea edx, [eax+eax*8]
	mov ecx, scene
	mov eax, [ecx+0x154c90]
	lea eax, [eax+eax*2]
	lea eax, [eax+eax*8]
	add eax, edx
	shl eax, 0x5
	add eax, dpvsGlob+0xa170
	lea esi, [eax+0xc]
	mov dword [eax+0xc], 0x1
	add eax, 0x10
	mov [esp+0xc], eax
	mov ebx, [ebp+0x10]
	mov [esp+0x8], ebx
	mov eax, [ebp+0xc]
	mov [esp+0x4], eax
	lea eax, [edi+0x80]
	mov [esp], eax
	call R_FrustumClipPlanes
	lea eax, [edi+0x110]
	mov [ebp-0x24], eax
	mov edx, [ebp+0x14]
	lea eax, [edx+edx*4]
	shl eax, 0x2
	mov [ebp-0x28], eax
	mov ecx, scene
	lea ebx, [eax+ecx+0x154c00]
	lea eax, [ebx+0x68]
	lea edx, [edi+0x114]
	mov [ebp-0x20], edx
	lea ecx, [edi+0x118]
	mov [ebp-0x1c], ecx
	movss xmm1, dword [edi+0x110]
	mulss xmm1, [ebx+0x68]
	movss xmm0, dword [edi+0x114]
	mulss xmm0, [eax+0x4]
	addss xmm1, xmm0
	movss xmm0, dword [edi+0x118]
	mulss xmm0, [eax+0x8]
	addss xmm1, xmm0
	pxor xmm2, xmm2
	ucomiss xmm2, xmm1
	ja R_SetupShadowSurfacesDpvs_10
R_SetupShadowSurfacesDpvs_70:
	mov ecx, [ebp+0x14]
	test ecx, ecx
	jz R_SetupShadowSurfacesDpvs_20
	mov eax, rg
	mov edx, [eax+0x22e0]
	test edx, edx
	jz R_SetupShadowSurfacesDpvs_20
R_SetupShadowSurfacesDpvs_50:
	xor ebx, ebx
	mov ecx, [ebp+0x10]
	lea eax, [ecx+ecx*4]
	lea ecx, [eax*4]
R_SetupShadowSurfacesDpvs_40:
	mov edx, ebx
	add edx, [dpvsGlob+0xade0]
	mov eax, [ebp-0x24]
	movss xmm0, dword [eax]
	mulss xmm0, [edx]
	mov eax, [ebp-0x20]
	movss xmm1, dword [eax]
	mulss xmm1, [edx+0x4]
	addss xmm0, xmm1
	mov eax, [ebp-0x1c]
	movss xmm1, dword [eax]
	mulss xmm1, [edx+0x8]
	addss xmm0, xmm1
	ucomiss xmm2, xmm0
	ja R_SetupShadowSurfacesDpvs_30
R_SetupShadowSurfacesDpvs_60:
	add ebx, 0x14
	cmp ebx, 0x50
	jnz R_SetupShadowSurfacesDpvs_40
	mov edx, [ebp+0x10]
	mov [esi+0x11c], edx
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_SetupShadowSurfacesDpvs_20:
	lea eax, [ebx+0x40]
	movss xmm1, dword [edi+0x110]
	mulss xmm1, [ebx+0x40]
	movss xmm0, dword [edi+0x114]
	mulss xmm0, [eax+0x4]
	addss xmm1, xmm0
	movss xmm0, dword [edi+0x118]
	mulss xmm0, [eax+0x8]
	addss xmm1, xmm0
	ucomiss xmm2, xmm1
	jbe R_SetupShadowSurfacesDpvs_50
	mov edx, [ebp+0x10]
	lea eax, [edx+edx*4]
	shl eax, 0x2
	mov ebx, [ebp-0x28]
	mov edx, scene
	lea ecx, [ebx+edx+0x154c00]
	mov edx, [ecx+0x40]
	mov [eax+esi+0x4], edx
	mov edx, [ecx+0x44]
	mov [eax+esi+0x8], edx
	mov edx, [ecx+0x48]
	mov [eax+esi+0xc], edx
	mov edx, [ecx+0x4c]
	mov [eax+esi+0x10], edx
	mov edx, [ecx+0x50]
	mov [eax+esi+0x14], edx
	add dword [ebp+0x10], 0x1
	jmp R_SetupShadowSurfacesDpvs_50
R_SetupShadowSurfacesDpvs_30:
	mov eax, [edx]
	mov [ecx+esi+0x4], eax
	mov eax, [edx+0x4]
	mov [ecx+esi+0x8], eax
	mov eax, [edx+0x8]
	mov [ecx+esi+0xc], eax
	mov eax, [edx+0xc]
	mov [ecx+esi+0x10], eax
	mov eax, [edx+0x10]
	mov [ecx+esi+0x14], eax
	add dword [ebp+0x10], 0x1
	add ecx, 0x14
	jmp R_SetupShadowSurfacesDpvs_60
R_SetupShadowSurfacesDpvs_10:
	mov edx, [ebp+0x10]
	lea eax, [edx+edx*4]
	shl eax, 0x2
	mov [ebp-0x2c], eax
	mov edx, [ebx+0x68]
	mov eax, [ebp-0x2c]
	mov [eax+esi+0x4], edx
	mov edx, [ebx+0x6c]
	mov [eax+esi+0x8], edx
	mov edx, [ebx+0x70]
	mov [eax+esi+0xc], edx
	mov edx, [ebx+0x74]
	mov [eax+esi+0x10], edx
	mov edx, [ebx+0x78]
	mov [eax+esi+0x14], edx
	add dword [ebp+0x10], 0x1
	jmp R_SetupShadowSurfacesDpvs_70
	nop


;R_UnfilterDynEntFromCells(unsigned int, DynEntityDrawType)
R_UnfilterDynEntFromCells:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x4
	mov ecx, [ebp+0x8]
	mov edx, [ebp+0xc]
	mov eax, rgp
	mov eax, [eax+0x20a0]
	mov esi, [eax+edx*4+0x2bc]
	mov edx, [eax+edx*4+0x2ac]
	mov [ebp-0x10], edx
	mov edi, [eax+0xf0]
	mov eax, ecx
	shr eax, 0x5
	and ecx, 0x1f
	mov ebx, 0x80000000
	shr ebx, cl
	not ebx
	test edi, edi
	jz R_UnfilterDynEntFromCells_10
	xor edx, edx
R_UnfilterDynEntFromCells_20:
	and [esi+eax*4], ebx
	add edx, 0x1
	add eax, [ebp-0x10]
	cmp edi, edx
	ja R_UnfilterDynEntFromCells_20
R_UnfilterDynEntFromCells_10:
	add esp, 0x4
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	nop


;R_CalcReflectionProbeIndex(float const*)
R_CalcReflectionProbeIndex:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x4
	mov eax, rgp
	mov esi, [eax+0x20a0]
	mov ecx, [esi+0xf8]
	mov ebx, [esi+0xf0]
	add ebx, 0x1
	movzx eax, word [ecx]
	mov edx, eax
	sub edx, ebx
	js R_CalcReflectionProbeIndex_10
	mov edi, [esi+0xf4]
	mov eax, [ebp+0x8]
	movss xmm4, dword [eax]
	movss xmm3, dword [eax+0x4]
	movss xmm2, dword [eax+0x8]
	pxor xmm5, xmm5
R_CalcReflectionProbeIndex_20:
	lea eax, [edx+edx*4]
	lea eax, [edi+eax*4]
	movaps xmm0, xmm4
	mulss xmm0, [eax]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	subss xmm0, [eax+0xc]
	xor edx, edx
	ucomiss xmm5, xmm0
	setae dl
	movzx eax, word [ecx+0x2]
	lea eax, [eax+eax-0x4]
	imul edx, eax
	add edx, ecx
	lea ecx, [edx+0x4]
	movzx eax, word [edx+0x4]
	mov edx, eax
	sub edx, ebx
	jns R_CalcReflectionProbeIndex_20
R_CalcReflectionProbeIndex_10:
	lea edx, [eax-0x1]
	cmp edx, 0xffffffff
	jz R_CalcReflectionProbeIndex_30
	lea eax, [edx*8]
	shl edx, 0x6
	sub edx, eax
	add edx, [esi+0x104]
	movzx eax, byte [edx+0x30]
	movzx ecx, al
	mov [ebp-0x10], ecx
	test al, al
	jz R_CalcReflectionProbeIndex_40
	mov edi, [edx+0x34]
	mov ebx, [esi+0xe8]
	mov eax, [ebp+0x8]
	movss xmm5, dword [eax]
	movss xmm4, dword [eax+0x4]
	movss xmm3, dword [eax+0x8]
	movss xmm6, dword [_float_34028234663852885_float_3]
	xor edx, edx
	xor esi, esi
R_CalcReflectionProbeIndex_60:
	movzx ecx, byte [edi+edx]
	movzx eax, cl
	shl eax, 0x4
	lea eax, [ebx+eax]
	movaps xmm2, xmm5
	subss xmm2, [eax]
	movaps xmm0, xmm4
	subss xmm0, [eax+0x4]
	movaps xmm1, xmm3
	subss xmm1, [eax+0x8]
	mulss xmm2, xmm2
	mulss xmm0, xmm0
	addss xmm2, xmm0
	mulss xmm1, xmm1
	addss xmm2, xmm1
	ucomiss xmm6, xmm2
	jbe R_CalcReflectionProbeIndex_50
	mov esi, ecx
	movaps xmm6, xmm2
R_CalcReflectionProbeIndex_50:
	add edx, 0x1
	cmp [ebp-0x10], edx
	ja R_CalcReflectionProbeIndex_60
	mov edx, esi
	movzx eax, dl
	add esp, 0x4
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_CalcReflectionProbeIndex_30:
	mov ecx, [esi+0xe4]
	cmp ecx, 0x1
	ja R_CalcReflectionProbeIndex_70
R_CalcReflectionProbeIndex_40:
	xor eax, eax
	add esp, 0x4
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_CalcReflectionProbeIndex_70:
	mov ebx, [esi+0xe8]
	mov edx, [ebp+0x8]
	movss xmm5, dword [edx]
	movss xmm4, dword [edx+0x4]
	movss xmm3, dword [edx+0x8]
	movss xmm6, dword [_float_34028234663852885_float_3]
	mov edx, 0x1
	xor esi, esi
	mov eax, 0x1
R_CalcReflectionProbeIndex_90:
	shl eax, 0x4
	lea eax, [ebx+eax]
	movaps xmm2, xmm5
	subss xmm2, [eax]
	movaps xmm0, xmm4
	subss xmm0, [eax+0x4]
	movaps xmm1, xmm3
	subss xmm1, [eax+0x8]
	mulss xmm2, xmm2
	mulss xmm0, xmm0
	addss xmm2, xmm0
	mulss xmm1, xmm1
	addss xmm2, xmm1
	ucomiss xmm6, xmm2
	jbe R_CalcReflectionProbeIndex_80
	mov esi, edx
	movaps xmm6, xmm2
R_CalcReflectionProbeIndex_80:
	add dl, 0x1
	movzx eax, dl
	cmp ecx, eax
	ja R_CalcReflectionProbeIndex_90
	mov ecx, esi
	movzx eax, cl
	add esp, 0x4
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


;R_AddWorldSurfacesFrustumOnly()
R_AddWorldSurfacesFrustumOnly:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0xcc
	mov ebx, rgp
	mov eax, [ebx+0x20a0]
	mov eax, [eax+0xf0]
	mov [ebp-0xb8], eax
	mov eax, sm_strictCull
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jnz R_AddWorldSurfacesFrustumOnly_10
	mov esi, [ebp-0xb8]
	test esi, esi
	jz R_AddWorldSurfacesFrustumOnly_20
	mov dword [ebp-0x9c], 0x0
	mov dword [ebp-0xa8], 0x0
	jmp R_AddWorldSurfacesFrustumOnly_30
R_AddWorldSurfacesFrustumOnly_40:
	mov edx, eax
R_AddWorldSurfacesFrustumOnly_80:
	mov [esp], edx
	mov ecx, edx
	mov edx, edi
	mov eax, ebx
	call R_AddCellSurfacesAndCullGroupsInFrustumDelayed
R_AddWorldSurfacesFrustumOnly_50:
	add dword [ebp-0x9c], 0x1
	add dword [ebp-0xa8], 0x38
	mov ebx, [ebp-0x9c]
	cmp [ebp-0xb8], ebx
	jbe R_AddWorldSurfacesFrustumOnly_20
	mov ebx, rgp
R_AddWorldSurfacesFrustumOnly_30:
	mov eax, [ebx+0x20a0]
	mov ebx, [ebp-0xa8]
	add ebx, [eax+0x104]
	mov edx, [g_dpvsView]
	mov eax, [edx+0x11c]
	mov [ebp-0xb0], eax
	lea edi, [edx+0x4]
	test eax, eax
	jle R_AddWorldSurfacesFrustumOnly_40
	movzx eax, byte [edi+0x10]
	movss xmm1, dword [edx+0x4]
	mulss xmm1, [eax+ebx]
	addss xmm1, [edi+0xc]
	movzx eax, byte [edi+0x11]
	movss xmm0, dword [edi+0x4]
	mulss xmm0, [ebx+eax]
	addss xmm1, xmm0
	movzx eax, byte [edi+0x12]
	movss xmm0, dword [edi+0x8]
	mulss xmm0, [ebx+eax]
	addss xmm1, xmm0
	pxor xmm2, xmm2
	ucomiss xmm2, xmm1
	jae R_AddWorldSurfacesFrustumOnly_50
	lea ecx, [edx+0x24]
	mov esi, 0x1
	jmp R_AddWorldSurfacesFrustumOnly_60
R_AddWorldSurfacesFrustumOnly_70:
	mov eax, ecx
	add esi, 0x1
	add ecx, 0x14
	movzx edx, byte [eax+0x5]
	movss xmm1, dword [edx+ebx]
	mulss xmm1, [eax-0x8]
	movzx edx, byte [eax+0x4]
	movss xmm0, dword [eax-0xc]
	mulss xmm0, [edx+ebx]
	addss xmm0, [eax]
	addss xmm1, xmm0
	movzx edx, byte [eax+0x6]
	movss xmm0, dword [eax-0x4]
	mulss xmm0, [edx+ebx]
	addss xmm1, xmm0
	ucomiss xmm2, xmm1
	jae R_AddWorldSurfacesFrustumOnly_50
R_AddWorldSurfacesFrustumOnly_60:
	cmp esi, [ebp-0xb0]
	jnz R_AddWorldSurfacesFrustumOnly_70
	mov edx, [ebp-0xb0]
	jmp R_AddWorldSurfacesFrustumOnly_80
R_AddWorldSurfacesFrustumOnly_10:
	mov esi, [ebp-0xb8]
	add esi, 0x1f
	shr esi, 0x5
	lea eax, [esi*4]
	mov [ebp-0xbc], eax
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x0
	lea edx, [ebp-0x98]
	mov [esp], edx
	call memset
	mov edi, [ebp-0xb8]
	test edi, edi
	jnz R_AddWorldSurfacesFrustumOnly_90
R_AddWorldSurfacesFrustumOnly_20:
	add esp, 0xcc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_AddWorldSurfacesFrustumOnly_90:
	mov ebx, [ebx+0x20a0]
	mov [ebp-0xa4], ebx
	xor edi, edi
	mov dword [ebp-0xc0], 0x0
	mov ebx, [ebp-0xbc]
	mov [ebp-0xc4], ebx
R_AddWorldSurfacesFrustumOnly_120:
	mov eax, edi
	shr eax, 0x5
	mov ecx, edi
	and ecx, 0x1f
	mov edx, 0x1
	shl edx, cl
	test [eax*4+dpvsGlob+0xadf8], edx
	jz R_AddWorldSurfacesFrustumOnly_100
	mov ebx, [ebp-0xc0]
	mov eax, [ebp-0xa4]
	add ebx, [eax+0x220]
	test esi, esi
	jz R_AddWorldSurfacesFrustumOnly_100
	xor ecx, ecx
	lea edx, [ebp-0x98]
R_AddWorldSurfacesFrustumOnly_110:
	mov eax, [edx]
	or eax, [ebx+ecx*4]
	mov [edx], eax
	add ecx, 0x1
	add edx, 0x4
	cmp esi, ecx
	jnz R_AddWorldSurfacesFrustumOnly_110
R_AddWorldSurfacesFrustumOnly_100:
	add edi, 0x1
	mov edx, [ebp-0xc4]
	add [ebp-0xc0], edx
	cmp [ebp-0xb8], edi
	ja R_AddWorldSurfacesFrustumOnly_120
	mov dword [ebp-0xb4], 0x0
	mov dword [ebp-0xac], 0x0
	jmp R_AddWorldSurfacesFrustumOnly_130
R_AddWorldSurfacesFrustumOnly_150:
	mov edx, ebx
R_AddWorldSurfacesFrustumOnly_180:
	mov [esp], ecx
	mov eax, esi
	call R_AddCellSurfacesAndCullGroupsInFrustumDelayed
R_AddWorldSurfacesFrustumOnly_140:
	add dword [ebp-0xb4], 0x1
	add dword [ebp-0xac], 0x38
	mov eax, [ebp-0xb4]
	cmp [ebp-0xb8], eax
	jbe R_AddWorldSurfacesFrustumOnly_20
R_AddWorldSurfacesFrustumOnly_130:
	mov edx, [ebp-0xb4]
	shr edx, 0x5
	mov ecx, [ebp-0xb4]
	and ecx, 0x1f
	mov eax, 0x1
	shl eax, cl
	test [ebp+edx*4-0x98], eax
	jz R_AddWorldSurfacesFrustumOnly_140
	mov eax, rgp
	mov eax, [eax+0x20a0]
	mov esi, [ebp-0xac]
	add esi, [eax+0x104]
	mov edx, [g_dpvsView]
	mov ecx, [edx+0x11c]
	lea ebx, [edx+0x4]
	mov [ebp-0xa0], ebx
	test ecx, ecx
	jle R_AddWorldSurfacesFrustumOnly_150
	movzx eax, byte [ebx+0x10]
	movss xmm1, dword [edx+0x4]
	mulss xmm1, [eax+esi]
	addss xmm1, [ebx+0xc]
	movzx eax, byte [ebx+0x11]
	movss xmm0, dword [ebx+0x4]
	mulss xmm0, [esi+eax]
	addss xmm1, xmm0
	movzx eax, byte [ebx+0x12]
	movss xmm0, dword [ebx+0x8]
	mulss xmm0, [esi+eax]
	addss xmm1, xmm0
	pxor xmm2, xmm2
	ucomiss xmm2, xmm1
	jae R_AddWorldSurfacesFrustumOnly_140
	lea ebx, [edx+0x24]
	mov edi, 0x1
	jmp R_AddWorldSurfacesFrustumOnly_160
R_AddWorldSurfacesFrustumOnly_170:
	mov eax, ebx
	add edi, 0x1
	add ebx, 0x14
	movzx edx, byte [eax+0x4]
	movss xmm1, dword [eax-0xc]
	mulss xmm1, [edx+esi]
	addss xmm1, [eax]
	movzx edx, byte [eax+0x5]
	movss xmm0, dword [eax-0x8]
	mulss xmm0, [edx+esi]
	addss xmm1, xmm0
	movzx edx, byte [eax+0x6]
	movss xmm0, dword [eax-0x4]
	mulss xmm0, [edx+esi]
	addss xmm1, xmm0
	ucomiss xmm2, xmm1
	jae R_AddWorldSurfacesFrustumOnly_140
R_AddWorldSurfacesFrustumOnly_160:
	cmp ecx, edi
	jnz R_AddWorldSurfacesFrustumOnly_170
	mov edx, [ebp-0xa0]
	jmp R_AddWorldSurfacesFrustumOnly_180


;R_AddAllSceneEntSurfacesCamera(GfxViewInfo const*)
R_AddAllSceneEntSurfacesCamera:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0xec
	mov eax, scene
	mov [ebp-0xa0], eax
	mov edx, [eax+0xe4198]
	mov [ebp-0x28], edx
	mov ecx, eax
	mov eax, [eax+0xe4088]
	lea eax, [edx+eax*8]
	mov [ebp-0x34], eax
	mov edx, [ecx+0xe41a4]
	mov [ebp-0x24], edx
	mov eax, [ecx+0xe4094]
	lea eax, [edx+eax*8]
	mov [ebp-0x30], eax
	mov edx, [ecx+0xe41bc]
	mov [ebp-0x20], edx
	mov eax, [ecx+0xe40ac]
	lea eax, [edx+eax*8]
	mov [ebp-0x2c], eax
	mov eax, [ecx+0x12b42c]
	mov [ebp-0x8c], eax
	test eax, eax
	jz R_AddAllSceneEntSurfacesCamera_10
	xor edi, edi
	lea esi, [ecx+0x13ac30]
	mov dword [ebp-0xac], 0x12b400
	jmp R_AddAllSceneEntSurfacesCamera_20
R_AddAllSceneEntSurfacesCamera_30:
	add edi, 0x1
	add dword [ebp-0xac], 0x7c
	add esi, 0x1
	cmp [ebp-0x8c], edi
	jbe R_AddAllSceneEntSurfacesCamera_10
R_AddAllSceneEntSurfacesCamera_20:
	cmp byte [esi], 0x1
	jnz R_AddAllSceneEntSurfacesCamera_30
	mov ebx, [ebp-0xac]
	add ebx, [ebp-0xa0]
	lea edx, [ebx+0x30]
	mov [ebp-0x84], edx
	mov eax, [edx+0x74]
	mov [esp], eax
	call CG_GetPoseLightingHandle
	lea edx, [ebp-0x1a]
	mov [esp+0x14], edx
	mov [esp+0x10], eax
	lea eax, [ebx+0x6c]
	mov [esp+0xc], eax
	add ebx, 0x60
	mov [esp+0x8], ebx
	mov ecx, [ebp-0x84]
	mov [esp+0x4], ecx
	mov eax, [ebp+0x8]
	mov [esp], eax
	call R_AllocModelLighting_Box
	mov edx, eax
	test eax, eax
	jnz R_AddAllSceneEntSurfacesCamera_40
	mov byte [esi], 0x0
	mov edx, scene
	mov [ebp-0xa0], edx
	add edi, 0x1
	add dword [ebp-0xac], 0x7c
	add esi, 0x1
	cmp [ebp-0x8c], edi
	ja R_AddAllSceneEntSurfacesCamera_20
R_AddAllSceneEntSurfacesCamera_10:
	mov edx, [ebp-0xa0]
	mov edx, [edx+0x13ba30]
	mov [ebp-0x50], edx
	test edx, edx
	jz R_AddAllSceneEntSurfacesCamera_50
	xor edi, edi
	mov ecx, [ebp-0xa0]
	lea ebx, [ecx+0x14da34]
	mov dword [ebp-0xa8], 0x13ba00
	jmp R_AddAllSceneEntSurfacesCamera_60
R_AddAllSceneEntSurfacesCamera_70:
	add edi, 0x1
	add dword [ebp-0xa8], 0x48
	add ebx, 0x1
	cmp [ebp-0x50], edi
	jbe R_AddAllSceneEntSurfacesCamera_50
R_AddAllSceneEntSurfacesCamera_60:
	cmp byte [ebx], 0x1
	jnz R_AddAllSceneEntSurfacesCamera_70
	mov edx, [ebp-0xa8]
	add edx, [ebp-0xa0]
	lea esi, [edx+0x34]
	lea eax, [edx+0x50]
	mov [ebp-0x98], eax
	lea eax, [ebp-0x1a]
	mov [esp+0x14], eax
	mov eax, [esi+0x34]
	mov [esp+0x10], eax
	mov eax, [esi+0x30]
	mov [esp+0xc], eax
	mov ecx, [ebp-0x98]
	mov [esp+0x8], ecx
	add edx, 0x6c
	mov [esp+0x4], edx
	mov eax, [ebp+0x8]
	mov [esp], eax
	call R_AllocModelLighting_Sphere
	mov ecx, eax
	test eax, eax
	jz R_AddAllSceneEntSurfacesCamera_80
	movzx eax, word [esi+0x2c]
	movzx edx, ax
	test ax, ax
	jz R_AddAllSceneEntSurfacesCamera_90
	mov eax, frontEndDataOut
	mov eax, [eax]
	lea edx, [eax+edx*8+0x118260]
	mov eax, sc_enable
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_AddAllSceneEntSurfacesCamera_100
	mov eax, [edx]
	test ah, 0x1
	jnz R_AddAllSceneEntSurfacesCamera_110
R_AddAllSceneEntSurfacesCamera_470:
	xor edx, edx
R_AddAllSceneEntSurfacesCamera_480:
	test al, 0x2
	setnz al
	movzx eax, al
	mov [ebp-0x7c], eax
	jmp R_AddAllSceneEntSurfacesCamera_120
R_AddAllSceneEntSurfacesCamera_50:
	mov eax, [ebp-0xa0]
	mov eax, [eax+0x154c38]
	mov [ebp-0x4c], eax
	mov edx, rgp
	mov [ebp-0x9c], edx
	mov eax, [edx+0x20a0]
	mov eax, [eax+0x2c4]
	mov [ebp-0x88], eax
	mov ebx, [ebp-0x4c]
	test ebx, ebx
	jz R_AddAllSceneEntSurfacesCamera_130
	xor edi, edi
	mov dword [ebp-0x5c], 0x0
	jmp R_AddAllSceneEntSurfacesCamera_140
R_AddAllSceneEntSurfacesCamera_160:
	add edi, 0x1
	add dword [ebp-0x5c], 0x6
	cmp [ebp-0x4c], edi
	jz R_AddAllSceneEntSurfacesCamera_150
R_AddAllSceneEntSurfacesCamera_140:
	mov ecx, [ebp-0x9c]
	mov eax, [ecx+0x20a0]
	mov edx, [ebp-0x5c]
	add edx, [eax+0x224]
	mov [ebp-0x78], edx
	movzx esi, word [edx+0x4]
	mov ecx, [ebp-0x88]
	cmp byte [ecx+esi], 0x1
	jnz R_AddAllSceneEntSurfacesCamera_160
	mov dword [esp+0x4], 0x0
	mov [esp], esi
	call DynEnt_GetClientPose
	mov ebx, eax
	mov dword [esp+0x4], 0x0
	mov [esp], esi
	call DynEnt_GetClientEntity
	add ebx, 0x10
	mov [ebp-0x58], ebx
	lea edx, [ebp-0x1a]
	mov [esp+0xc], edx
	add eax, 0x6
	mov [esp+0x8], eax
	mov [esp+0x4], esi
	mov [esp], ebx
	call R_AllocModelLighting_PrimaryLight
	mov ebx, eax
	test eax, eax
	jnz R_AddAllSceneEntSurfacesCamera_170
	mov edx, [ebp-0x88]
	mov byte [edx+edi], 0x0
	mov ecx, rgp
	mov [ebp-0x9c], ecx
	add edi, 0x1
	add dword [ebp-0x5c], 0x6
	cmp [ebp-0x4c], edi
	jnz R_AddAllSceneEntSurfacesCamera_140
R_AddAllSceneEntSurfacesCamera_150:
	mov edx, scene
	mov [ebp-0xa0], edx
	mov ecx, edx
	mov ecx, [ecx+0x14f634]
	mov [ebp-0x48], ecx
	test ecx, ecx
	jnz R_AddAllSceneEntSurfacesCamera_180
R_AddAllSceneEntSurfacesCamera_300:
	mov eax, [ebp-0xa0]
	mov eax, [eax+0x154c3c]
	mov [ebp-0x44], eax
	mov edx, [ebp-0x9c]
	mov eax, [edx+0x20a0]
	mov eax, [eax+0x2d0]
	mov [ebp-0x54], eax
	mov ecx, [ebp-0x44]
	test ecx, ecx
	jz R_AddAllSceneEntSurfacesCamera_190
	mov dword [ebp-0x3c], 0x0
	mov edx, [ebp-0x9c]
	jmp R_AddAllSceneEntSurfacesCamera_200
R_AddAllSceneEntSurfacesCamera_220:
	add dword [ebp-0x3c], 0x1
	mov edx, [ebp-0x3c]
	cmp [ebp-0x44], edx
	jz R_AddAllSceneEntSurfacesCamera_210
	mov ecx, rgp
	mov [ebp-0x9c], ecx
	mov edx, ecx
R_AddAllSceneEntSurfacesCamera_200:
	mov eax, [edx+0x20a0]
	mov eax, [eax+0x228]
	mov ecx, [ebp-0x3c]
	lea eax, [eax+ecx*4]
	mov [ebp-0x74], eax
	movzx ebx, word [eax+0x2]
	mov eax, [ebp-0x54]
	cmp byte [eax+ebx], 0x1
	jnz R_AddAllSceneEntSurfacesCamera_220
	mov dword [esp+0x4], 0x1
	mov [esp], ebx
	call DynEnt_GetClientPose
	mov [ebp-0x70], eax
	mov dword [esp+0x4], 0x1
	mov [esp], ebx
	call DynEnt_GetEntityDef
	movzx eax, word [eax+0x24]
	mov [esp], eax
	call R_GetBrushModel
	mov [ebp-0x6c], eax
	mov edx, [ebp-0x70]
	add edx, 0x10
	mov [ebp-0x94], edx
	mov ecx, [ebp-0x9c]
	mov esi, [ecx+0x20a0]
	mov ecx, [esi+0xf8]
	mov ebx, [esi+0xf0]
	add ebx, 0x1
	movzx eax, word [ecx]
	mov edx, eax
	sub edx, ebx
	js R_AddAllSceneEntSurfacesCamera_230
	mov edi, [esi+0xf4]
	mov eax, [ebp-0x70]
	movss xmm4, dword [eax+0x10]
	mov eax, [ebp-0x94]
	movss xmm3, dword [eax+0x4]
	movss xmm2, dword [eax+0x8]
	pxor xmm5, xmm5
R_AddAllSceneEntSurfacesCamera_240:
	lea eax, [edx+edx*4]
	lea eax, [edi+eax*4]
	movaps xmm0, xmm4
	mulss xmm0, [eax]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	subss xmm0, [eax+0xc]
	xor edx, edx
	ucomiss xmm5, xmm0
	setae dl
	movzx eax, word [ecx+0x2]
	lea eax, [eax+eax-0x4]
	imul edx, eax
	add edx, ecx
	lea ecx, [edx+0x4]
	movzx eax, word [edx+0x4]
	mov edx, eax
	sub edx, ebx
	jns R_AddAllSceneEntSurfacesCamera_240
R_AddAllSceneEntSurfacesCamera_230:
	lea edx, [eax-0x1]
	cmp edx, 0xffffffff
	jz R_AddAllSceneEntSurfacesCamera_250
	lea eax, [edx*8]
	shl edx, 0x6
	sub edx, eax
	add edx, [esi+0x104]
	movzx eax, byte [edx+0x30]
	movzx ecx, al
	mov [ebp-0x60], ecx
	test al, al
	jz R_AddAllSceneEntSurfacesCamera_260
	mov edi, [edx+0x34]
	mov ebx, [esi+0xe8]
	mov eax, [ebp-0x94]
	movss xmm5, dword [eax]
	movss xmm4, dword [eax+0x4]
	movss xmm3, dword [eax+0x8]
	movss xmm6, dword [_float_34028234663852885_float_3]
	xor edx, edx
	xor esi, esi
R_AddAllSceneEntSurfacesCamera_280:
	movzx ecx, byte [edi+edx]
	movzx eax, cl
	shl eax, 0x4
	lea eax, [ebx+eax]
	movaps xmm2, xmm5
	subss xmm2, [eax]
	movaps xmm0, xmm4
	subss xmm0, [eax+0x4]
	movaps xmm1, xmm3
	subss xmm1, [eax+0x8]
	mulss xmm2, xmm2
	mulss xmm0, xmm0
	addss xmm2, xmm0
	mulss xmm1, xmm1
	addss xmm2, xmm1
	ucomiss xmm6, xmm2
	jbe R_AddAllSceneEntSurfacesCamera_270
	mov esi, ecx
	movaps xmm6, xmm2
R_AddAllSceneEntSurfacesCamera_270:
	add edx, 0x1
	cmp edx, [ebp-0x60]
	jb R_AddAllSceneEntSurfacesCamera_280
	mov edx, esi
	movzx eax, dl
	jmp R_AddAllSceneEntSurfacesCamera_290
R_AddAllSceneEntSurfacesCamera_130:
	mov ecx, [ebp-0xa0]
	mov ecx, [ecx+0x14f634]
	mov [ebp-0x48], ecx
	test ecx, ecx
	jz R_AddAllSceneEntSurfacesCamera_300
R_AddAllSceneEntSurfacesCamera_180:
	mov dword [ebp-0x40], 0x0
	mov dword [ebp-0xa4], 0x14f600
	mov edx, [ebp-0x40]
	jmp R_AddAllSceneEntSurfacesCamera_310
R_AddAllSceneEntSurfacesCamera_320:
	add dword [ebp-0x40], 0x1
	add dword [ebp-0xa4], 0x28
	mov ecx, [ebp-0x40]
	cmp [ebp-0x48], ecx
	jbe R_AddAllSceneEntSurfacesCamera_300
	mov edx, ecx
R_AddAllSceneEntSurfacesCamera_310:
	mov eax, [ebp-0xa0]
	cmp byte [eax+edx+0x154638], 0x1
	jnz R_AddAllSceneEntSurfacesCamera_320
	mov esi, [ebp-0xa4]
	add esi, eax
	lea ecx, [esi+0x38]
	mov [ebp-0x80], ecx
	lea eax, [esi+0x50]
	mov [ebp-0x90], eax
	mov edx, [ebp-0x9c]
	mov edi, [edx+0x20a0]
	mov ecx, [edi+0xf8]
	mov ebx, [edi+0xf0]
	add ebx, 0x1
	movzx eax, word [ecx]
	mov edx, eax
	sub edx, ebx
	js R_AddAllSceneEntSurfacesCamera_330
	mov eax, [edi+0xf4]
	mov [ebp-0x68], eax
	movss xmm4, dword [esi+0x50]
	mov eax, [ebp-0x90]
	movss xmm3, dword [eax+0x4]
	movss xmm2, dword [eax+0x8]
	pxor xmm5, xmm5
R_AddAllSceneEntSurfacesCamera_340:
	lea eax, [edx+edx*4]
	mov edx, [ebp-0x68]
	lea eax, [edx+eax*4]
	movaps xmm0, xmm4
	mulss xmm0, [eax]
	movaps xmm1, xmm3
	mulss xmm1, [eax+0x4]
	addss xmm0, xmm1
	movaps xmm1, xmm2
	mulss xmm1, [eax+0x8]
	addss xmm0, xmm1
	subss xmm0, [eax+0xc]
	xor edx, edx
	ucomiss xmm5, xmm0
	setae dl
	movzx eax, word [ecx+0x2]
	lea eax, [eax+eax-0x4]
	imul edx, eax
	add edx, ecx
	lea ecx, [edx+0x4]
	movzx eax, word [edx+0x4]
	mov edx, eax
	sub edx, ebx
	jns R_AddAllSceneEntSurfacesCamera_340
R_AddAllSceneEntSurfacesCamera_330:
	lea edx, [eax-0x1]
	cmp edx, 0xffffffff
	jz R_AddAllSceneEntSurfacesCamera_350
	lea eax, [edx*8]
	shl edx, 0x6
	sub edx, eax
	add edx, [edi+0x104]
	movzx eax, byte [edx+0x30]
	movzx ecx, al
	mov [ebp-0x64], ecx
	test al, al
	jz R_AddAllSceneEntSurfacesCamera_360
	mov esi, [edx+0x34]
	mov ebx, [edi+0xe8]
	mov eax, [ebp-0x90]
	movss xmm5, dword [eax]
	movss xmm4, dword [eax+0x4]
	movss xmm3, dword [eax+0x8]
	movss xmm6, dword [_float_34028234663852885_float_3]
	xor edx, edx
	xor edi, edi
R_AddAllSceneEntSurfacesCamera_380:
	movzx ecx, byte [edx+esi]
	movzx eax, cl
	shl eax, 0x4
	lea eax, [ebx+eax]
	movaps xmm2, xmm5
	subss xmm2, [eax]
	movaps xmm0, xmm4
	subss xmm0, [eax+0x4]
	movaps xmm1, xmm3
	subss xmm1, [eax+0x8]
	mulss xmm2, xmm2
	mulss xmm0, xmm0
	addss xmm2, xmm0
	mulss xmm1, xmm1
	addss xmm2, xmm1
	ucomiss xmm6, xmm2
	jbe R_AddAllSceneEntSurfacesCamera_370
	mov edi, ecx
	movaps xmm6, xmm2
R_AddAllSceneEntSurfacesCamera_370:
	add edx, 0x1
	cmp edx, [ebp-0x64]
	jb R_AddAllSceneEntSurfacesCamera_380
	mov edx, edi
	movzx eax, dl
	jmp R_AddAllSceneEntSurfacesCamera_390
R_AddAllSceneEntSurfacesCamera_350:
	mov ecx, [edi+0xe4]
	cmp ecx, 0x1
	ja R_AddAllSceneEntSurfacesCamera_400
R_AddAllSceneEntSurfacesCamera_360:
	xor eax, eax
R_AddAllSceneEntSurfacesCamera_390:
	mov ecx, [ebp-0x80]
	mov [ecx+0x24], al
	mov [esp+0x10], eax
	lea eax, [ebp-0x34]
	mov [esp+0xc], eax
	lea eax, [ebp-0x28]
	mov [esp+0x8], eax
	mov eax, [ecx+0x4]
	mov [esp+0x4], eax
	mov [esp], ecx
	call R_AddBModelSurfacesCamera
	mov eax, scene
	mov [ebp-0xa0], eax
	mov edx, rgp
	mov [ebp-0x9c], edx
	jmp R_AddAllSceneEntSurfacesCamera_320
R_AddAllSceneEntSurfacesCamera_210:
	mov ecx, scene
	mov [ebp-0xa0], ecx
	mov eax, ecx
R_AddAllSceneEntSurfacesCamera_420:
	mov ebx, [ebp-0x28]
	sub ebx, [eax+0xe4198]
	sar ebx, 0x3
	mov [eax+0xe4110], ebx
	mov dword [esp+0x4], _cstring_sort_surfs
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov [esp+0x4], ebx
	mov edx, [ebp-0xa0]
	mov eax, [edx+0xe4198]
	mov [esp], eax
	call R_SortDrawSurfs
	mov ebx, [ebp-0x24]
	mov ecx, [ebp-0xa0]
	sub ebx, [ecx+0xe41a4]
	sar ebx, 0x3
	mov [ecx+0xe411c], ebx
	mov dword [esp+0x4], _cstring_sort_surfs
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov [esp+0x4], ebx
	mov edx, [ebp-0xa0]
	mov eax, [edx+0xe41a4]
	mov [esp], eax
	call R_SortDrawSurfs
	mov ebx, [ebp-0x20]
	mov ecx, [ebp-0xa0]
	sub ebx, [ecx+0xe41bc]
	sar ebx, 0x3
	mov [ecx+0xe4134], ebx
	mov dword [esp+0x4], _cstring_sort_surfs
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov [esp+0x4], ebx
	mov edx, [ebp-0xa0]
	mov eax, [edx+0xe41bc]
	mov [esp], eax
	call R_SortDrawSurfs
	add esp, 0xec
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_AddAllSceneEntSurfacesCamera_80:
	mov byte [ebx], 0x0
	mov edx, scene
	mov [ebp-0xa0], edx
	jmp R_AddAllSceneEntSurfacesCamera_70
R_AddAllSceneEntSurfacesCamera_250:
	mov ecx, [esi+0xe4]
	cmp ecx, 0x1
	ja R_AddAllSceneEntSurfacesCamera_410
R_AddAllSceneEntSurfacesCamera_260:
	xor eax, eax
R_AddAllSceneEntSurfacesCamera_290:
	mov [esp+0x10], eax
	lea eax, [ebp-0x34]
	mov [esp+0xc], eax
	lea eax, [ebp-0x28]
	mov [esp+0x8], eax
	mov ecx, [ebp-0x6c]
	mov [esp+0x4], ecx
	mov eax, [ebp-0x74]
	mov [esp], eax
	call R_AddBModelSurfacesCamera
	jmp R_AddAllSceneEntSurfacesCamera_220
R_AddAllSceneEntSurfacesCamera_170:
	mov dword [esp+0x4], 0x0
	mov [esp], esi
	call DynEnt_GetEntityDef
	movzx edx, byte [ebp-0x19]
	mov [esp+0x28], edx
	lea edx, [ebp-0x34]
	mov [esp+0x24], edx
	lea edx, [ebp-0x28]
	mov [esp+0x20], edx
	mov dword [esp+0x1c], 0x0
	mov dword [esp+0x18], 0x0
	movzx edx, byte [ebp-0x1a]
	mov [esp+0x14], edx
	mov [esp+0x10], ebx
	mov dword [esp+0xc], 0x0
	mov edx, [ebp-0x58]
	mov [esp+0x8], edx
	mov eax, [eax+0x20]
	mov [esp+0x4], eax
	mov ecx, [ebp-0x78]
	mov [esp], ecx
	call R_AddXModelSurfacesCamera
	mov eax, rgp
	mov [ebp-0x9c], eax
	jmp R_AddAllSceneEntSurfacesCamera_160
R_AddAllSceneEntSurfacesCamera_40:
	movzx eax, byte [ebp-0x19]
	mov ecx, [ebp-0x84]
	mov [ecx+0x78], al
	lea eax, [ebp-0x34]
	mov [esp+0x10], eax
	lea eax, [ebp-0x28]
	mov [esp+0xc], eax
	movzx eax, byte [ebp-0x1a]
	mov [esp+0x8], eax
	mov [esp+0x4], edx
	mov [esp], ecx
	call R_AddDObjSurfacesCamera
	mov eax, scene
	mov [ebp-0xa0], eax
	jmp R_AddAllSceneEntSurfacesCamera_30
R_AddAllSceneEntSurfacesCamera_190:
	mov eax, [ebp-0xa0]
	jmp R_AddAllSceneEntSurfacesCamera_420
R_AddAllSceneEntSurfacesCamera_400:
	mov ebx, [edi+0xe8]
	mov eax, [ebp-0x90]
	movss xmm5, dword [eax]
	movss xmm4, dword [eax+0x4]
	movss xmm3, dword [eax+0x8]
	movss xmm6, dword [_float_34028234663852885_float_3]
	mov edx, 0x1
	xor esi, esi
	mov eax, 0x1
R_AddAllSceneEntSurfacesCamera_440:
	shl eax, 0x4
	lea eax, [ebx+eax]
	movaps xmm2, xmm5
	subss xmm2, [eax]
	movaps xmm0, xmm4
	subss xmm0, [eax+0x4]
	movaps xmm1, xmm3
	subss xmm1, [eax+0x8]
	mulss xmm2, xmm2
	mulss xmm0, xmm0
	addss xmm2, xmm0
	mulss xmm1, xmm1
	addss xmm2, xmm1
	ucomiss xmm6, xmm2
	jbe R_AddAllSceneEntSurfacesCamera_430
	mov esi, edx
	movaps xmm6, xmm2
R_AddAllSceneEntSurfacesCamera_430:
	add dl, 0x1
	movzx eax, dl
	cmp eax, ecx
	jb R_AddAllSceneEntSurfacesCamera_440
	mov edx, esi
	movzx eax, dl
	jmp R_AddAllSceneEntSurfacesCamera_390
R_AddAllSceneEntSurfacesCamera_90:
	xor edx, edx
	mov dword [ebp-0x7c], 0x0
R_AddAllSceneEntSurfacesCamera_120:
	movzx eax, byte [ebp-0x19]
	mov [esi+0x44], al
	movzx eax, byte [ebp-0x19]
	mov [esp+0x28], eax
	lea eax, [ebp-0x34]
	mov [esp+0x24], eax
	lea eax, [ebp-0x28]
	mov [esp+0x20], eax
	mov eax, [ebp-0x7c]
	mov [esp+0x1c], eax
	mov [esp+0x18], edx
	movzx eax, byte [ebp-0x1a]
	mov [esp+0x14], eax
	mov [esp+0x10], ecx
	movzx eax, word [esi+0x2c]
	mov [esp+0xc], eax
	mov edx, [ebp-0x98]
	mov [esp+0x8], edx
	mov eax, [esi+0x4]
	mov [esp+0x4], eax
	mov [esp], esi
	call R_AddXModelSurfacesCamera
	mov ecx, scene
	mov [ebp-0xa0], ecx
	jmp R_AddAllSceneEntSurfacesCamera_70
R_AddAllSceneEntSurfacesCamera_410:
	mov ebx, [esi+0xe8]
	mov edx, [ebp-0x94]
	movss xmm5, dword [edx]
	movss xmm4, dword [edx+0x4]
	movss xmm3, dword [edx+0x8]
	movss xmm6, dword [_float_34028234663852885_float_3]
	mov edx, 0x1
	mov eax, 0x1
	xor esi, esi
R_AddAllSceneEntSurfacesCamera_460:
	shl eax, 0x4
	lea eax, [ebx+eax]
	movaps xmm2, xmm5
	subss xmm2, [eax]
	movaps xmm0, xmm4
	subss xmm0, [eax+0x4]
	movaps xmm1, xmm3
	subss xmm1, [eax+0x8]
	mulss xmm2, xmm2
	mulss xmm0, xmm0
	addss xmm2, xmm0
	mulss xmm1, xmm1
	addss xmm2, xmm1
	ucomiss xmm6, xmm2
	jbe R_AddAllSceneEntSurfacesCamera_450
	mov esi, edx
	movaps xmm6, xmm2
R_AddAllSceneEntSurfacesCamera_450:
	add dl, 0x1
	movzx eax, dl
	cmp eax, ecx
	jb R_AddAllSceneEntSurfacesCamera_460
	mov ecx, esi
	movzx eax, cl
	jmp R_AddAllSceneEntSurfacesCamera_290
R_AddAllSceneEntSurfacesCamera_100:
	mov eax, [edx]
	jmp R_AddAllSceneEntSurfacesCamera_470
R_AddAllSceneEntSurfacesCamera_110:
	mov edx, 0x1
	jmp R_AddAllSceneEntSurfacesCamera_480


;R_GenerateShadowMapCasterCells()
R_GenerateShadowMapCasterCells:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x138c
	mov ebx, rgp
	mov edx, [ebx+0x20a0]
	mov eax, [edx+0xf0]
	lea ecx, [eax+0x1f]
	sar ecx, 0x5
	mov [ebp-0x1348], ecx
	imul eax, ecx
	shl eax, 0x2
	mov edx, [edx+0x220]
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x0
	mov [esp], edx
	call memset
	mov ecx, [ebx+0x20a0]
	mov esi, [ecx+0xd8]
	test esi, esi
	jz R_GenerateShadowMapCasterCells_10
	mov eax, [ecx+0xc8]
	lea edx, [eax+0x10]
	movss xmm1, dword [_data16_80000000]
	movss xmm0, dword [eax+0x10]
	xorps xmm0, xmm1
	movss [dpvsGlob+0x38], xmm0
	movss xmm0, dword [edx+0x4]
	xorps xmm0, xmm1
	movss [dpvsGlob+0x3c], xmm0
	movss xmm0, dword [edx+0x8]
	xorps xmm0, xmm1
	movss [dpvsGlob+0x40], xmm0
	xor edx, edx
	mov [dpvsGlob+0x44], edx
	mov dword [dpvsGlob+0x48], 0x1
	mov dword [dpvsGlob+0x2c], 0x0
	mov dword [dpvsGlob+0x28], 0x0
	mov eax, ecx
	mov ebx, [ecx+0xf0]
	test ebx, ebx
	jg R_GenerateShadowMapCasterCells_20
R_GenerateShadowMapCasterCells_10:
	add esp, 0x138c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_GenerateShadowMapCasterCells_20:
	mov dword [ebp-0x134c], 0x0
	mov dword [ebp-0x132c], 0x0
	mov dword [ebp-0x1354], 0x0
R_GenerateShadowMapCasterCells_100:
	mov esi, [ebp-0x132c]
	add esi, [eax+0x104]
	mov eax, [eax+0x220]
	add eax, [ebp-0x1354]
	mov [dpvsGlob+0xadf4], eax
	mov dword [esp+0x4], 0x20000
	lea ebx, [ebp-0x20]
	mov [esp], ebx
	call _ZN10LargeLocalC1Ei
	mov [esp], ebx
	call _ZN10LargeLocal6GetBufEv
	mov ecx, eax
	xor ebx, ebx
	mov edx, eax
R_GenerateShadowMapCasterCells_30:
	add ebx, 0x1
	add edx, 0x200
	mov [ecx], edx
	add ecx, 0x200
	cmp ebx, 0xff
	jnz R_GenerateShadowMapCasterCells_30
	mov dword [eax+0x1fe00], 0x0
	mov [dpvsGlob+0x54], eax
	lea ecx, [ebp-0x1320]
	mov [dpvsGlob+0x50], ecx
	mov dword [dpvsGlob+0x4c], 0x0
	mov dword [esp+0xc], 0x0
	mov dword [esp+0x8], 0x0
	mov dword [esp+0x4], 0x0
	mov dword [esp], 0x0
	xor ecx, ecx
	xor edx, edx
	mov eax, esi
	call R_VisitPortalsForCellNoFrustum
R_GenerateShadowMapCasterCells_60:
	mov eax, [dpvsGlob+0x4c]
	test eax, eax
	jz R_GenerateShadowMapCasterCells_40
R_GenerateShadowMapCasterCells_90:
	mov eax, [dpvsGlob+0x50]
	mov edi, [eax]
	mov byte [edi], 0x0
	mov eax, [dpvsGlob+0x4c]
	sub eax, 0x1
	mov [dpvsGlob+0x4c], eax
	test eax, eax
	jg R_GenerateShadowMapCasterCells_50
	lea edx, [eax*8]
	mov dword [ebp-0x137c], 0x0
	mov ecx, [dpvsGlob+0x50]
	mov ebx, [ebp-0x137c]
R_GenerateShadowMapCasterCells_170:
	mov eax, [ecx+edx]
	mov edx, [ecx+edx+0x4]
	mov [ecx+ebx], eax
	mov [ecx+ebx+0x4], edx
	lea eax, [ebp-0x220]
	mov [esp+0x8], eax
	movzx eax, byte [edi+0x3]
	mov [esp+0x4], eax
	mov eax, [edi+0x4]
	mov [esp], eax
	call Com_ConvexHull
	mov [ebp-0x133c], eax
	mov edx, [edi+0x4]
	mov eax, [dpvsGlob+0x54]
	mov [edx], eax
	mov [dpvsGlob+0x54], edx
	mov dword [edi+0x4], 0x0
	mov ecx, [ebp-0x133c]
	test ecx, ecx
	jz R_GenerateShadowMapCasterCells_60
	movss xmm0, dword [edi+0x18]
	xorps xmm0, [_data16_80000000]
	lea esi, [edi+0xc]
	mov [ebp-0x1350], esi
	movaps xmm4, xmm0
	mulss xmm4, [edi+0xc]
	movaps xmm3, xmm0
	mulss xmm3, [esi+0x4]
	movaps xmm2, xmm0
	mulss xmm2, [esi+0x8]
	xor ecx, ecx
	lea esi, [edi+0x2c]
	lea ebx, [edi+0x38]
	xor edx, edx
	lea eax, [ebp-0x520]
R_GenerateShadowMapCasterCells_70:
	movss xmm1, dword [edx+ebp-0x220]
	movaps xmm0, xmm1
	mulss xmm0, [edi+0x2c]
	addss xmm0, xmm4
	movss [eax], xmm0
	movaps xmm0, xmm1
	mulss xmm0, [esi+0x4]
	addss xmm0, xmm3
	movss [eax+0x4], xmm0
	mulss xmm1, [esi+0x8]
	addss xmm1, xmm2
	movss [eax+0x8], xmm1
	movss xmm1, dword [edx+ebp-0x21c]
	movaps xmm0, xmm1
	mulss xmm0, [edi+0x38]
	addss xmm0, [eax]
	movss [eax], xmm0
	movaps xmm0, xmm1
	mulss xmm0, [ebx+0x4]
	addss xmm0, [eax+0x4]
	movss [eax+0x4], xmm0
	mulss xmm1, [ebx+0x8]
	addss xmm1, [eax+0x8]
	movss [eax+0x8], xmm1
	add ecx, 0x1
	add eax, 0xc
	add edx, 0x8
	cmp [ebp-0x133c], ecx
	jnz R_GenerateShadowMapCasterCells_70
	lea ecx, [ebp-0xb20]
	mov edx, [ebp-0x133c]
	lea eax, [ebp-0x520]
	call R_GetSidePlaneNormals
	cmp dword [ebp-0x133c], 0xa
	jbe R_GenerateShadowMapCasterCells_80
	xor ecx, ecx
R_GenerateShadowMapCasterCells_210:
	mov eax, [edi+0x20]
	movzx edx, byte [edi+0x2]
	add edx, 0x1
	mov [esp+0xc], edx
	mov dword [esp+0x8], 0x0
	mov [esp+0x4], ecx
	mov dword [esp], dpvsGlob+0x5c
	mov ecx, [ebp-0x1350]
	mov edx, edi
	call R_VisitPortalsForCellNoFrustum
	mov eax, [dpvsGlob+0x4c]
	test eax, eax
	jnz R_GenerateShadowMapCasterCells_90
R_GenerateShadowMapCasterCells_40:
	lea edx, [ebp-0x20]
	mov [esp], edx
	call _ZN10LargeLocalD1Ev
	add dword [ebp-0x134c], 0x1
	mov ebx, [ebp-0x1354]
	mov ecx, [ebp-0x1348]
	lea ebx, [ebx+ecx*4]
	mov [ebp-0x1354], ebx
	mov eax, rgp
	mov eax, [eax+0x20a0]
	add dword [ebp-0x132c], 0x38
	mov esi, [ebp-0x134c]
	cmp esi, [eax+0xf0]
	jl R_GenerateShadowMapCasterCells_100
	add esp, 0x138c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_GenerateShadowMapCasterCells_50:
	mov dword [ebp-0x1340], 0x0
	mov ebx, 0x1
	mov dword [ebp-0x1344], 0x0
	jmp R_GenerateShadowMapCasterCells_110
R_GenerateShadowMapCasterCells_140:
	lea esi, [ebx*8]
	mov [ebp-0x137c], esi
	mov ecx, [dpvsGlob+0x50]
R_GenerateShadowMapCasterCells_150:
	lea edx, [eax*8]
	mov eax, [ebp-0x137c]
	add eax, ecx
	mov [ebp-0x1380], eax
	movss xmm0, dword [eax+0x4]
	ucomiss xmm0, [ecx+edx+0x4]
	jae R_GenerateShadowMapCasterCells_120
R_GenerateShadowMapCasterCells_160:
	mov edx, eax
	mov eax, [eax]
	mov edx, [edx+0x4]
	mov esi, [ebp-0x1344]
	mov [ecx+esi*8], eax
	mov [ecx+esi*8+0x4], edx
	lea eax, [ebx+ebx]
	mov [ebp-0x1340], eax
	mov edx, eax
	add edx, 0x1
	mov eax, [dpvsGlob+0x4c]
	cmp eax, edx
	jl R_GenerateShadowMapCasterCells_130
	mov [ebp-0x1344], ebx
	mov ebx, edx
R_GenerateShadowMapCasterCells_110:
	cmp ebx, eax
	jge R_GenerateShadowMapCasterCells_140
	mov ecx, [dpvsGlob+0x50]
	lea edx, [ebx*8]
	mov [ebp-0x137c], edx
	movss xmm0, dword [ecx+edx+0x4]
	ucomiss xmm0, [ecx+edx+0xc]
	jbe R_GenerateShadowMapCasterCells_150
	mov ebx, [ebp-0x1340]
	add ebx, 0x2
	lea esi, [ebx*8]
	mov [ebp-0x137c], esi
	lea edx, [eax*8]
	mov eax, [ebp-0x137c]
	add eax, ecx
	mov [ebp-0x1380], eax
	movss xmm0, dword [eax+0x4]
	ucomiss xmm0, [ecx+edx+0x4]
	jb R_GenerateShadowMapCasterCells_160
R_GenerateShadowMapCasterCells_120:
	mov ebx, [ebp-0x1344]
	shl ebx, 0x3
	mov [ebp-0x137c], ebx
	jmp R_GenerateShadowMapCasterCells_170
R_GenerateShadowMapCasterCells_130:
	lea edx, [eax*8]
	mov ecx, [dpvsGlob+0x50]
	mov ebx, [ebp-0x137c]
	jmp R_GenerateShadowMapCasterCells_170
R_GenerateShadowMapCasterCells_80:
	mov dword [ebp-0x1334], 0x0
	mov dword [ebp-0x1338], 0x0
	lea eax, [ebp-0x520]
	mov [ebp-0x1330], eax
	pxor xmm5, xmm5
	movss xmm6, dword [_float_0_00100000]
	lea ebx, [ebp-0xb20]
	xor esi, esi
R_GenerateShadowMapCasterCells_200:
	movss xmm4, dword [ebx]
	movss xmm2, dword [ebx+0x4]
	movss xmm3, dword [ebx+0x8]
	movaps xmm0, xmm4
	mulss xmm0, xmm4
	movaps xmm1, xmm2
	mulss xmm1, xmm2
	addss xmm0, xmm1
	movaps xmm1, xmm3
	mulss xmm1, xmm3
	addss xmm0, xmm1
	ucomiss xmm0, xmm5
	jp R_GenerateShadowMapCasterCells_180
	jz R_GenerateShadowMapCasterCells_190
R_GenerateShadowMapCasterCells_180:
	lea ecx, [esi+dpvsGlob+0x5c]
	movss [esi+dpvsGlob+0x5c], xmm4
	movss [esi+dpvsGlob+0x60], xmm2
	movss [esi+dpvsGlob+0x64], xmm3
	movaps xmm0, xmm4
	mov edx, [ebp-0x1330]
	mulss xmm0, [edx]
	mulss xmm2, [edx+0x4]
	addss xmm0, xmm2
	mulss xmm3, [edx+0x8]
	addss xmm0, xmm3
	movaps xmm1, xmm6
	subss xmm1, xmm0
	movss [esi+dpvsGlob+0x68], xmm1
	movss [ebp-0x135c], xmm4
	mov edx, [ebp-0x135c]
	mov eax, 0xc
	test edx, edx
	mov edx, 0x0
	cmovle eax, edx
	mov [ecx+0x10], al
	mov eax, 0x10
	mov edx, [ecx+0x4]
	test edx, edx
	mov edx, 0x4
	cmovle eax, edx
	mov [ecx+0x11], al
	mov eax, 0x14
	mov edx, [ecx+0x8]
	test edx, edx
	mov edx, 0x8
	cmovle eax, edx
	mov [ecx+0x12], al
	add dword [ebp-0x1334], 0x1
	add esi, 0x14
R_GenerateShadowMapCasterCells_190:
	add dword [ebp-0x1338], 0x1
	add ebx, 0xc
	add dword [ebp-0x1330], 0xc
	mov eax, [ebp-0x1338]
	cmp [ebp-0x133c], eax
	jnz R_GenerateShadowMapCasterCells_200
	mov ecx, [ebp-0x1334]
	jmp R_GenerateShadowMapCasterCells_210
	mov ebx, eax
	lea eax, [ebp-0x20]
	mov [esp], eax
	call _ZN10LargeLocalD1Ev
	mov [esp], ebx
	call _Unwind_Resume


;R_AddAllSceneEntSurfacesSunShadow()
R_AddAllSceneEntSurfacesSunShadow:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x6c
	mov dword [ebp-0x4c], 0x0
	mov eax, scene
	mov [ebp-0x38], eax
	mov edx, eax
	mov dword [ebp-0x34], 0x11
	mov ecx, eax
	mov ebx, eax
R_AddAllSceneEntSurfacesSunShadow_220:
	add ecx, 0xe41d4
	mov [ebp-0x30], ecx
	mov ebx, [ebx+0xe41d4]
	mov [ebp-0x44], ebx
	mov ecx, [ebp-0x38]
	mov eax, [ecx+0xe40c4]
	lea eax, [ebx+eax*8]
	mov [ebp-0x40], eax
	mov eax, gfxMetrics
	mov eax, [eax+0x20]
	mov [ebp-0x3c], eax
	mov edi, [edx+0x12b42c]
	add dword [ebp-0x4c], 0x1
	mov eax, [ebp-0x4c]
	shl eax, 0x9
	lea eax, [eax+edx+0x13ac30]
	mov [ebp-0x48], eax
	test edi, edi
	jz R_AddAllSceneEntSurfacesSunShadow_10
	xor ebx, ebx
	mov esi, 0x12b400
	jmp R_AddAllSceneEntSurfacesSunShadow_20
R_AddAllSceneEntSurfacesSunShadow_30:
	add ebx, 0x1
	add esi, 0x7c
	cmp edi, ebx
	jbe R_AddAllSceneEntSurfacesSunShadow_10
R_AddAllSceneEntSurfacesSunShadow_20:
	mov eax, [ebp-0x48]
	cmp byte [eax+ebx], 0x1
	jnz R_AddAllSceneEntSurfacesSunShadow_30
	mov ecx, [ebp-0x40]
	mov [esp+0xc], ecx
	mov eax, [ebp-0x44]
	mov [esp+0x8], eax
	mov ecx, [ebp-0x3c]
	mov [esp+0x4], ecx
	lea eax, [esi+edx+0x30]
	mov [esp], eax
	call R_AddDObjSurfaces
	mov [ebp-0x44], eax
	mov edx, scene
	add ebx, 0x1
	add esi, 0x7c
	cmp edi, ebx
	ja R_AddAllSceneEntSurfacesSunShadow_20
R_AddAllSceneEntSurfacesSunShadow_10:
	mov edi, [edx+0x13ba30]
	mov eax, [ebp-0x4c]
	shl eax, 0xa
	lea eax, [eax+edx+0x14da34]
	mov [ebp-0x2c], eax
	test edi, edi
	jz R_AddAllSceneEntSurfacesSunShadow_40
	xor ebx, ebx
	mov esi, 0x13ba00
	jmp R_AddAllSceneEntSurfacesSunShadow_50
R_AddAllSceneEntSurfacesSunShadow_60:
	add ebx, 0x1
	add esi, 0x48
	cmp edi, ebx
	jbe R_AddAllSceneEntSurfacesSunShadow_40
R_AddAllSceneEntSurfacesSunShadow_50:
	mov eax, [ebp-0x2c]
	cmp byte [eax+ebx], 0x1
	jnz R_AddAllSceneEntSurfacesSunShadow_60
	lea edx, [esi+edx+0x34]
	mov ecx, [ebp-0x40]
	mov [esp+0x10], ecx
	mov eax, [ebp-0x44]
	mov [esp+0xc], eax
	mov ecx, [ebp-0x3c]
	mov [esp+0x8], ecx
	mov eax, [edx+0x4]
	mov [esp+0x4], eax
	mov [esp], edx
	call R_AddXModelSurfaces
	mov [ebp-0x44], eax
	mov edx, scene
	add ebx, 0x1
	add esi, 0x48
	cmp edi, ebx
	ja R_AddAllSceneEntSurfacesSunShadow_50
R_AddAllSceneEntSurfacesSunShadow_40:
	mov ebx, [edx+0x154c38]
	mov [ebp-0x1c], ebx
	mov ecx, rgp
	mov eax, [ecx+0x20a0]
	mov ebx, [ebp-0x4c]
	mov eax, [eax+ebx*4+0x2c4]
	mov [ebp-0x28], eax
	mov eax, [ebp-0x1c]
	test eax, eax
	jz R_AddAllSceneEntSurfacesSunShadow_70
	xor edi, edi
	xor esi, esi
	jmp R_AddAllSceneEntSurfacesSunShadow_80
R_AddAllSceneEntSurfacesSunShadow_100:
	add edi, 0x1
	add esi, 0x6
	cmp [ebp-0x1c], edi
	jz R_AddAllSceneEntSurfacesSunShadow_90
R_AddAllSceneEntSurfacesSunShadow_110:
	mov ecx, rgp
R_AddAllSceneEntSurfacesSunShadow_80:
	mov eax, [ecx+0x20a0]
	mov ebx, esi
	add ebx, [eax+0x224]
	movzx eax, word [ebx+0x4]
	mov edx, [ebp-0x28]
	cmp byte [edx+eax], 0x1
	jnz R_AddAllSceneEntSurfacesSunShadow_100
	mov dword [esp+0x4], 0x0
	mov [esp], eax
	call DynEnt_GetEntityDef
	mov ecx, [ebp-0x40]
	mov [esp+0x10], ecx
	mov edx, [ebp-0x44]
	mov [esp+0xc], edx
	mov ecx, [ebp-0x3c]
	mov [esp+0x8], ecx
	mov eax, [eax+0x20]
	mov [esp+0x4], eax
	mov [esp], ebx
	call R_AddXModelSurfaces
	mov [ebp-0x44], eax
	add edi, 0x1
	add esi, 0x6
	cmp [ebp-0x1c], edi
	jnz R_AddAllSceneEntSurfacesSunShadow_110
R_AddAllSceneEntSurfacesSunShadow_90:
	mov edx, scene
	mov eax, [ebp-0x4c]
	mov edi, [edx+0x14f634]
	shl eax, 0x9
	lea eax, [eax+edx+0x154638]
	mov [ebp-0x24], eax
	test edi, edi
	jnz R_AddAllSceneEntSurfacesSunShadow_120
R_AddAllSceneEntSurfacesSunShadow_190:
	mov edi, [edx+0x154c3c]
	mov ecx, rgp
	mov eax, [ecx+0x20a0]
	mov ebx, [ebp-0x4c]
	mov eax, [eax+ebx*4+0x2d0]
	mov [ebp-0x20], eax
	test edi, edi
	jz R_AddAllSceneEntSurfacesSunShadow_130
	xor ebx, ebx
	jmp R_AddAllSceneEntSurfacesSunShadow_140
R_AddAllSceneEntSurfacesSunShadow_160:
	add ebx, 0x1
	cmp edi, ebx
	jz R_AddAllSceneEntSurfacesSunShadow_150
R_AddAllSceneEntSurfacesSunShadow_170:
	mov ecx, rgp
R_AddAllSceneEntSurfacesSunShadow_140:
	mov eax, [ecx+0x20a0]
	mov eax, [eax+0x228]
	lea esi, [eax+ebx*4]
	movzx eax, word [esi+0x2]
	mov edx, [ebp-0x20]
	cmp byte [edx+eax], 0x1
	jnz R_AddAllSceneEntSurfacesSunShadow_160
	mov dword [esp+0x4], 0x1
	mov [esp], eax
	call DynEnt_GetEntityDef
	movzx eax, word [eax+0x24]
	mov [esp], eax
	call R_GetBrushModel
	mov ecx, [ebp-0x40]
	mov [esp+0x10], ecx
	mov edx, [ebp-0x44]
	mov [esp+0xc], edx
	mov ecx, [ebp-0x3c]
	mov [esp+0x8], ecx
	mov [esp+0x4], eax
	mov [esp], esi
	call R_AddBModelSurfaces
	add ebx, 0x1
	cmp edi, ebx
	jnz R_AddAllSceneEntSurfacesSunShadow_170
R_AddAllSceneEntSurfacesSunShadow_150:
	mov edx, scene
R_AddAllSceneEntSurfacesSunShadow_130:
	mov ebx, [ebp-0x44]
	mov eax, [ebp-0x30]
	sub ebx, [eax]
	sar ebx, 0x3
	mov ecx, [ebp-0x34]
	mov [edx+ecx*4+0xe4108], ebx
	mov dword [esp+0x4], _cstring_sort_surfs
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov [esp+0x4], ebx
	mov ebx, [ebp-0x30]
	mov eax, [ebx]
	mov [esp], eax
	call R_SortDrawSurfs
	add dword [ebp-0x38], 0xc
	add dword [ebp-0x34], 0x3
	cmp dword [ebp-0x4c], 0x2
	jnz R_AddAllSceneEntSurfacesSunShadow_180
	add esp, 0x6c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_AddAllSceneEntSurfacesSunShadow_70:
	mov eax, ebx
	mov edi, [edx+0x14f634]
	shl eax, 0x9
	lea eax, [eax+edx+0x154638]
	mov [ebp-0x24], eax
	test edi, edi
	jz R_AddAllSceneEntSurfacesSunShadow_190
R_AddAllSceneEntSurfacesSunShadow_120:
	xor ebx, ebx
	mov esi, 0x14f600
	jmp R_AddAllSceneEntSurfacesSunShadow_200
R_AddAllSceneEntSurfacesSunShadow_210:
	add ebx, 0x1
	add esi, 0x28
	cmp edi, ebx
	jbe R_AddAllSceneEntSurfacesSunShadow_190
R_AddAllSceneEntSurfacesSunShadow_200:
	mov eax, [ebp-0x24]
	cmp byte [eax+ebx], 0x1
	jnz R_AddAllSceneEntSurfacesSunShadow_210
	lea edx, [esi+edx+0x38]
	mov ecx, [ebp-0x40]
	mov [esp+0x10], ecx
	mov eax, [ebp-0x44]
	mov [esp+0xc], eax
	mov ecx, [ebp-0x3c]
	mov [esp+0x8], ecx
	mov eax, [edx+0x4]
	mov [esp+0x4], eax
	mov [esp], edx
	call R_AddBModelSurfaces
	mov [ebp-0x44], eax
	mov edx, scene
	jmp R_AddAllSceneEntSurfacesSunShadow_210
R_AddAllSceneEntSurfacesSunShadow_180:
	mov edx, scene
	mov ecx, [ebp-0x38]
	mov ebx, [ebp-0x38]
	jmp R_AddAllSceneEntSurfacesSunShadow_220


;R_AddAllSceneEntSurfacesSpotShadow(GfxViewInfo const*, unsigned int, unsigned int)
R_AddAllSceneEntSurfacesSpotShadow:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x7c
	mov eax, [ebp+0x8]
	mov [ebp-0x54], eax
	mov edx, [ebp+0xc]
	mov ecx, [ebp+0x10]
	mov [ebp-0x58], ecx
	lea eax, [edx+edx*2+0x17]
	mov [ebp-0x4c], eax
	mov edi, scene
	mov ecx, [edi+eax*4+0xe4190]
	mov [ebp-0x40], ecx
	mov eax, [edi+eax*4+0xe4080]
	mov ecx, [ebp-0x40]
	lea eax, [ecx+eax*8]
	mov [ebp-0x3c], eax
	mov eax, gfxMetrics
	mov eax, [eax+0x20]
	mov [ebp-0x38], eax
	mov eax, [edi+0x12b42c]
	mov [ebp-0x48], eax
	add edx, 0x3
	mov [ebp-0x50], edx
	mov eax, edx
	shl eax, 0x9
	lea eax, [eax+edi+0x13ac30]
	mov [ebp-0x44], eax
	mov eax, [ebp-0x48]
	test eax, eax
	jz R_AddAllSceneEntSurfacesSpotShadow_10
	xor ebx, ebx
	mov [ebp-0x5c], edi
	mov esi, 0x12b400
	jmp R_AddAllSceneEntSurfacesSpotShadow_20
R_AddAllSceneEntSurfacesSpotShadow_30:
	add ebx, 0x1
	add esi, 0x7c
	cmp [ebp-0x48], ebx
	jbe R_AddAllSceneEntSurfacesSpotShadow_10
R_AddAllSceneEntSurfacesSpotShadow_20:
	mov edx, [ebp-0x44]
	cmp byte [edx+ebx], 0x1
	jnz R_AddAllSceneEntSurfacesSpotShadow_30
	mov ecx, [ebp-0x3c]
	mov [esp+0xc], ecx
	mov eax, [ebp-0x40]
	mov [esp+0x8], eax
	mov edx, [ebp-0x38]
	mov [esp+0x4], edx
	lea eax, [esi+edi+0x30]
	mov [esp], eax
	call R_AddDObjSurfaces
	mov [ebp-0x40], eax
	mov edi, [ebp-0x5c]
	add ebx, 0x1
	add esi, 0x7c
	cmp [ebp-0x48], ebx
	ja R_AddAllSceneEntSurfacesSpotShadow_20
R_AddAllSceneEntSurfacesSpotShadow_10:
	mov ecx, [edi+0x13ba30]
	mov [ebp-0x34], ecx
	shl dword [ebp-0x50], 0xa
	mov eax, [ebp-0x50]
	lea eax, [eax+edi+0x14da34]
	mov [ebp-0x24], eax
	test ecx, ecx
	jz R_AddAllSceneEntSurfacesSpotShadow_40
	xor ebx, ebx
	mov esi, 0x13ba00
	jmp R_AddAllSceneEntSurfacesSpotShadow_50
R_AddAllSceneEntSurfacesSpotShadow_60:
	add ebx, 0x1
	add esi, 0x48
	cmp [ebp-0x34], ebx
	jbe R_AddAllSceneEntSurfacesSpotShadow_40
R_AddAllSceneEntSurfacesSpotShadow_50:
	mov edx, [ebp-0x24]
	cmp byte [edx+ebx], 0x1
	jnz R_AddAllSceneEntSurfacesSpotShadow_60
	lea edx, [esi+edi+0x34]
	mov ecx, [ebp-0x3c]
	mov [esp+0x10], ecx
	mov eax, [ebp-0x40]
	mov [esp+0xc], eax
	mov ecx, [ebp-0x38]
	mov [esp+0x8], ecx
	mov eax, [edx+0x4]
	mov [esp+0x4], eax
	mov [esp], edx
	call R_AddXModelSurfaces
	mov [ebp-0x40], eax
	mov edi, scene
	add ebx, 0x1
	add esi, 0x48
	cmp [ebp-0x34], ebx
	ja R_AddAllSceneEntSurfacesSpotShadow_50
R_AddAllSceneEntSurfacesSpotShadow_40:
	mov eax, [edi+0x154c38]
	mov [ebp-0x30], eax
	test eax, eax
	jnz R_AddAllSceneEntSurfacesSpotShadow_70
	mov eax, [edi+0x14f634]
	mov [ebp-0x2c], eax
	test eax, eax
	jnz R_AddAllSceneEntSurfacesSpotShadow_80
R_AddAllSceneEntSurfacesSpotShadow_130:
	mov eax, [edi+0x154c3c]
	mov [ebp-0x28], eax
	test eax, eax
	jnz R_AddAllSceneEntSurfacesSpotShadow_90
R_AddAllSceneEntSurfacesSpotShadow_180:
	mov ebx, [ebp-0x40]
	mov ecx, [ebp-0x4c]
	sub ebx, [edi+ecx*4+0xe4190]
	sar ebx, 0x3
	mov [edi+ecx*4+0xe4108], ebx
	mov dword [esp+0x4], _cstring_sort_surfs
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov [ebp+0xc], ebx
	mov edx, [ebp-0x4c]
	mov eax, [edi+edx*4+0xe4190]
	mov [ebp+0x8], eax
	add esp, 0x7c
	pop ebx
	pop esi
	pop edi
	pop ebp
	jmp R_SortDrawSurfs
R_AddAllSceneEntSurfacesSpotShadow_70:
	mov dword [ebp-0x20], 0x0
	xor edi, edi
	jmp R_AddAllSceneEntSurfacesSpotShadow_100
R_AddAllSceneEntSurfacesSpotShadow_120:
	add dword [ebp-0x20], 0x1
	add edi, 0x6
	mov ecx, [ebp-0x20]
	cmp [ebp-0x30], ecx
	jz R_AddAllSceneEntSurfacesSpotShadow_110
R_AddAllSceneEntSurfacesSpotShadow_100:
	mov edx, rgp
	mov eax, [edx+0x20a0]
	mov esi, edi
	add esi, [eax+0x224]
	movzx eax, word [esi+0x4]
	mov ecx, [ebp-0x58]
	mov [esp+0x8], ecx
	mov dword [esp+0x4], 0x0
	mov ebx, eax
	mov [esp], eax
	call R_IsDynEntVisibleToPrimaryLight
	test eax, eax
	jz R_AddAllSceneEntSurfacesSpotShadow_120
	mov dword [esp+0x4], 0x0
	mov [esp], ebx
	call DynEnt_GetEntityDef
	mov edx, [ebp-0x3c]
	mov [esp+0x10], edx
	mov ecx, [ebp-0x40]
	mov [esp+0xc], ecx
	mov edx, [ebp-0x38]
	mov [esp+0x8], edx
	mov eax, [eax+0x20]
	mov [esp+0x4], eax
	mov [esp], esi
	call R_AddXModelSurfaces
	mov [ebp-0x40], eax
	add dword [ebp-0x20], 0x1
	add edi, 0x6
	mov ecx, [ebp-0x20]
	cmp [ebp-0x30], ecx
	jnz R_AddAllSceneEntSurfacesSpotShadow_100
R_AddAllSceneEntSurfacesSpotShadow_110:
	mov edi, scene
	mov eax, [edi+0x14f634]
	mov [ebp-0x2c], eax
	test eax, eax
	jz R_AddAllSceneEntSurfacesSpotShadow_130
R_AddAllSceneEntSurfacesSpotShadow_80:
	mov dword [ebp-0x1c], 0x0
	jmp R_AddAllSceneEntSurfacesSpotShadow_140
R_AddAllSceneEntSurfacesSpotShadow_160:
	add dword [ebp-0x1c], 0x1
	mov ecx, [ebp-0x1c]
	cmp [ebp-0x2c], ecx
	jbe R_AddAllSceneEntSurfacesSpotShadow_150
R_AddAllSceneEntSurfacesSpotShadow_170:
	mov edi, scene
R_AddAllSceneEntSurfacesSpotShadow_140:
	mov edx, [ebp-0x1c]
	lea eax, [edx+edx*4]
	lea esi, [edi+eax*8+0x14f638]
	mov ecx, [ebp-0x58]
	mov [esp+0x8], ecx
	movzx eax, word [esi+0x2]
	mov [esp+0x4], eax
	mov edx, [ebp-0x54]
	mov eax, [edx+0x13a0]
	mov [esp], eax
	call R_IsEntityVisibleToPrimaryLight
	test eax, eax
	jz R_AddAllSceneEntSurfacesSpotShadow_160
	movzx ecx, word [esi+0x2]
	mov ebx, ecx
	sar ebx, 0x5
	mov edx, [edi+0x12b428]
	and ecx, 0x1f
	mov eax, 0x1
	shl eax, cl
	test [edx+ebx*4], eax
	jnz R_AddAllSceneEntSurfacesSpotShadow_160
	mov ecx, [ebp-0x3c]
	mov [esp+0x10], ecx
	mov eax, [ebp-0x40]
	mov [esp+0xc], eax
	mov edx, [ebp-0x38]
	mov [esp+0x8], edx
	mov eax, [esi+0x4]
	mov [esp+0x4], eax
	mov [esp], esi
	call R_AddBModelSurfaces
	mov [ebp-0x40], eax
	add dword [ebp-0x1c], 0x1
	mov ecx, [ebp-0x1c]
	cmp [ebp-0x2c], ecx
	ja R_AddAllSceneEntSurfacesSpotShadow_170
R_AddAllSceneEntSurfacesSpotShadow_150:
	mov edi, scene
	mov eax, [edi+0x154c3c]
	mov [ebp-0x28], eax
	test eax, eax
	jz R_AddAllSceneEntSurfacesSpotShadow_180
R_AddAllSceneEntSurfacesSpotShadow_90:
	xor esi, esi
	jmp R_AddAllSceneEntSurfacesSpotShadow_190
R_AddAllSceneEntSurfacesSpotShadow_210:
	add esi, 0x1
	cmp [ebp-0x28], esi
	jz R_AddAllSceneEntSurfacesSpotShadow_200
R_AddAllSceneEntSurfacesSpotShadow_190:
	mov edx, rgp
	mov eax, [edx+0x20a0]
	mov eax, [eax+0x228]
	lea edi, [eax+esi*4]
	movzx eax, word [edi+0x2]
	mov ecx, [ebp-0x58]
	mov [esp+0x8], ecx
	mov dword [esp+0x4], 0x1
	mov ebx, eax
	mov [esp], eax
	call R_IsDynEntVisibleToPrimaryLight
	test eax, eax
	jz R_AddAllSceneEntSurfacesSpotShadow_210
	mov dword [esp+0x4], 0x1
	mov [esp], ebx
	call DynEnt_GetEntityDef
	movzx eax, word [eax+0x24]
	mov [esp], eax
	call R_GetBrushModel
	mov edx, [ebp-0x3c]
	mov [esp+0x10], edx
	mov ecx, [ebp-0x40]
	mov [esp+0xc], ecx
	mov edx, [ebp-0x38]
	mov [esp+0x8], edx
	mov [esp+0x4], eax
	mov [esp], edi
	call R_AddBModelSurfaces
	add esi, 0x1
	cmp [ebp-0x28], esi
	jnz R_AddAllSceneEntSurfacesSpotShadow_190
R_AddAllSceneEntSurfacesSpotShadow_200:
	mov edi, scene
	jmp R_AddAllSceneEntSurfacesSpotShadow_180


;R_CullDynamicSpotLightInCameraView()
R_CullDynamicSpotLightInCameraView:
	push ebp
	mov ebp, esp
	push ebx
	sub esp, 0x14
	mov ebx, scene
	mov eax, [ebx+0x154c90]
	lea eax, [eax+eax*2]
	lea eax, [eax+eax*8]
	shl eax, 0x5
	lea edx, [eax+dpvsGlob+0xa060]
	mov eax, [eax+dpvsGlob+0xa178]
	mov ecx, [ebx+0x11422c]
	test ecx, ecx
	jz R_CullDynamicSpotLightInCameraView_10
	cmp byte [ebx+0x114230], 0x2
	jz R_CullDynamicSpotLightInCameraView_20
R_CullDynamicSpotLightInCameraView_10:
	mov eax, 0x1
	add esp, 0x14
	pop ebx
	pop ebp
	ret
R_CullDynamicSpotLightInCameraView_20:
	mov [esp+0xc], eax
	mov [esp+0x8], edx
	mov eax, [ebx+0x114258]
	mov [esp+0x4], eax
	lea eax, [ebx+0x11424c]
	mov [esp], eax
	call R_CullPointAndRadius
	mov [ebx+0x114a30], al
	movzx eax, al
	add esp, 0x14
	pop ebx
	pop ebp
	ret
	nop


;R_CullDynamicPointLightsInCameraView()
R_CullDynamicPointLightsInCameraView:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x2c
	mov ecx, scene
	mov eax, [ecx+0x154c90]
	lea eax, [eax+eax*2]
	lea eax, [eax+eax*8]
	shl eax, 0x5
	lea edx, [eax+dpvsGlob+0xa060]
	mov [ebp-0x20], edx
	mov eax, [eax+dpvsGlob+0xa178]
	mov [ebp-0x1c], eax
	mov ebx, [ecx+0x11422c]
	test ebx, ebx
	jle R_CullDynamicPointLightsInCameraView_10
	xor ebx, ebx
	lea eax, [ecx+0x114a30]
	mov [ebp-0x24], eax
	mov edi, ecx
	mov esi, 0x114200
R_CullDynamicPointLightsInCameraView_40:
	lea edx, [esi+ecx]
	lea eax, [edx+0x30]
	cmp byte [edx+0x30], 0x2
	jnz R_CullDynamicPointLightsInCameraView_20
	test ebx, ebx
	jz R_CullDynamicPointLightsInCameraView_30
R_CullDynamicPointLightsInCameraView_20:
	mov ecx, [ebp-0x1c]
	mov [esp+0xc], ecx
	mov ecx, [ebp-0x20]
	mov [esp+0x8], ecx
	mov eax, [eax+0x28]
	mov [esp+0x4], eax
	lea eax, [edx+0x4c]
	mov [esp], eax
	call R_CullPointAndRadius
	mov edx, [ebp-0x24]
	mov [ebx+edx], al
	mov ecx, edi
R_CullDynamicPointLightsInCameraView_30:
	add ebx, 0x1
	add esi, 0x40
	cmp [ecx+0x11422c], ebx
	jg R_CullDynamicPointLightsInCameraView_40
R_CullDynamicPointLightsInCameraView_10:
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret


;R_AddCellDynBrushSurfacesInFrustumCmd(void*)
R_AddCellDynBrushSurfacesInFrustumCmd:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x4c
	mov eax, [ebp+0x8]
	movzx ebx, word [eax+0xa]
	mov edx, [g_viewIndex]
	mov [ebp-0x38], edx
	mov [g_viewIndex], ebx
	mov ecx, rgp
	mov esi, [ecx+0x20a0]
	lea edx, [esi+ebx*4+0x2c4]
	mov ecx, g_dynEntVisData
	mov edi, g_dynEntVisData+0x8
R_AddCellDynBrushSurfacesInFrustumCmd_10:
	mov eax, [edx]
	mov [ecx], eax
	add edx, 0xc
	add ecx, 0x4
	cmp edi, ecx
	jnz R_AddCellDynBrushSurfacesInFrustumCmd_10
	lea edx, [ebx+ebx*8]
	mov ebx, scene
	mov eax, [ebx+0x154c90]
	lea eax, [eax+eax*2]
	lea eax, [eax+eax*8]
	add eax, edx
	shl eax, 0x5
	add eax, dpvsGlob+0xa05c
	mov [g_dpvsView], eax
	mov eax, [ebp+0x8]
	movzx eax, byte [eax+0x8]
	mov [ebp-0x20], eax
	mov edx, [ebp+0x8]
	mov edx, [edx]
	mov [ebp-0x1c], edx
	mov ecx, [g_dynEntVisData+0x4]
	mov [ebp-0x30], ecx
	mov eax, [esi+0x2b0]
	mov [ebp-0x2c], eax
	mov edx, eax
	mov ecx, [ebp+0x8]
	imul edx, [ecx+0x4]
	mov eax, [esi+0x2c0]
	lea edx, [eax+edx*4]
	mov [ebp-0x28], edx
	mov eax, [ebp-0x2c]
	test eax, eax
	jz R_AddCellDynBrushSurfacesInFrustumCmd_20
	mov dword [ebp-0x24], 0x0
	mov eax, [ebp-0x24]
R_AddCellDynBrushSurfacesInFrustumCmd_130:
	mov edx, [ebp-0x28]
	mov edi, [edx+eax*4]
	mov ecx, eax
R_AddCellDynBrushSurfacesInFrustumCmd_100:
	shl ecx, 0x5
	mov [ebp-0x3c], ecx
R_AddCellDynBrushSurfacesInFrustumCmd_80:
	test edi, 0xffff0000
	jnz R_AddCellDynBrushSurfacesInFrustumCmd_30
	mov ecx, 0x10
	mov esi, 0x10
R_AddCellDynBrushSurfacesInFrustumCmd_160:
	mov edx, edi
	shl edx, cl
	test edx, 0xff000000
	jnz R_AddCellDynBrushSurfacesInFrustumCmd_40
	mov ebx, 0x8
	mov eax, 0x8
R_AddCellDynBrushSurfacesInFrustumCmd_150:
	add esi, eax
	mov ecx, ebx
	shl edx, cl
	test edx, 0xf0000000
	jnz R_AddCellDynBrushSurfacesInFrustumCmd_50
	mov ebx, 0x4
	mov eax, 0x4
R_AddCellDynBrushSurfacesInFrustumCmd_140:
	add esi, eax
	mov ecx, ebx
	shl edx, cl
	test edx, 0xc0000000
	jnz R_AddCellDynBrushSurfacesInFrustumCmd_60
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
	ja R_AddCellDynBrushSurfacesInFrustumCmd_70
R_AddCellDynBrushSurfacesInFrustumCmd_110:
	mov eax, [ebp-0x3c]
	lea edx, [ecx+eax]
	mov eax, 0x80000000
	shr eax, cl
	not eax
	and edi, eax
	mov ecx, [ebp-0x30]
	add ecx, edx
	mov [ebp-0x34], ecx
	cmp byte [ecx], 0x0
	jnz R_AddCellDynBrushSurfacesInFrustumCmd_80
	mov dword [esp+0x4], 0x1
	movzx eax, dx
	mov [esp], eax
	call DynEnt_GetEntityDef
	movzx eax, word [eax+0x24]
	mov [esp], eax
	call R_GetBrushModel
	mov esi, eax
	mov eax, [ebp-0x20]
	test eax, eax
	jg R_AddCellDynBrushSurfacesInFrustumCmd_90
R_AddCellDynBrushSurfacesInFrustumCmd_180:
	mov eax, [ebp-0x34]
	mov byte [eax], 0x1
	mov ecx, [ebp-0x24]
	jmp R_AddCellDynBrushSurfacesInFrustumCmd_100
R_AddCellDynBrushSurfacesInFrustumCmd_60:
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
	jbe R_AddCellDynBrushSurfacesInFrustumCmd_110
R_AddCellDynBrushSurfacesInFrustumCmd_70:
	add dword [ebp-0x24], 0x1
	mov edx, [ebp-0x24]
	cmp [ebp-0x2c], edx
	jz R_AddCellDynBrushSurfacesInFrustumCmd_120
	mov eax, edx
	jmp R_AddCellDynBrushSurfacesInFrustumCmd_130
R_AddCellDynBrushSurfacesInFrustumCmd_50:
	xor ebx, ebx
	xor eax, eax
	jmp R_AddCellDynBrushSurfacesInFrustumCmd_140
R_AddCellDynBrushSurfacesInFrustumCmd_40:
	xor ebx, ebx
	xor eax, eax
	jmp R_AddCellDynBrushSurfacesInFrustumCmd_150
R_AddCellDynBrushSurfacesInFrustumCmd_30:
	xor ecx, ecx
	xor esi, esi
	jmp R_AddCellDynBrushSurfacesInFrustumCmd_160
R_AddCellDynBrushSurfacesInFrustumCmd_90:
	mov edx, [ebp-0x1c]
	movzx eax, byte [edx+0x10]
	movss xmm1, dword [edx]
	mulss xmm1, [esi+eax]
	addss xmm1, [edx+0xc]
	movzx eax, byte [edx+0x11]
	movss xmm0, dword [edx+0x4]
	mulss xmm0, [esi+eax]
	addss xmm1, xmm0
	movzx eax, byte [edx+0x12]
	movss xmm0, dword [edx+0x8]
	mulss xmm0, [esi+eax]
	addss xmm1, xmm0
	pxor xmm2, xmm2
	ucomiss xmm2, xmm1
	jae R_AddCellDynBrushSurfacesInFrustumCmd_170
	mov ebx, edx
	add ebx, 0x20
	mov ecx, 0x1
R_AddCellDynBrushSurfacesInFrustumCmd_190:
	cmp ecx, [ebp-0x20]
	jz R_AddCellDynBrushSurfacesInFrustumCmd_180
	mov eax, ebx
	add ecx, 0x1
	add ebx, 0x14
	movzx edx, byte [eax+0x5]
	movss xmm1, dword [esi+edx]
	mulss xmm1, [eax-0x8]
	movzx edx, byte [eax+0x4]
	movss xmm0, dword [eax-0xc]
	mulss xmm0, [esi+edx]
	addss xmm0, [eax]
	addss xmm1, xmm0
	movzx edx, byte [eax+0x6]
	movss xmm0, dword [eax-0x4]
	mulss xmm0, [esi+edx]
	addss xmm1, xmm0
	ucomiss xmm2, xmm1
	jb R_AddCellDynBrushSurfacesInFrustumCmd_190
R_AddCellDynBrushSurfacesInFrustumCmd_170:
	mov ecx, [ebp-0x24]
	jmp R_AddCellDynBrushSurfacesInFrustumCmd_100
R_AddCellDynBrushSurfacesInFrustumCmd_120:
	mov ebx, scene
R_AddCellDynBrushSurfacesInFrustumCmd_20:
	mov ecx, [ebp-0x38]
	mov [g_viewIndex], ecx
	mov edx, rgp
	mov eax, [edx+0x20a0]
	lea edx, [eax+ecx*4+0x2c4]
	mov ecx, g_dynEntVisData
R_AddCellDynBrushSurfacesInFrustumCmd_200:
	mov eax, [edx]
	mov [ecx], eax
	add edx, 0xc
	add ecx, 0x4
	mov eax, g_dynEntVisData+0x8
	cmp eax, ecx
	jnz R_AddCellDynBrushSurfacesInFrustumCmd_200
	mov ecx, [ebp-0x38]
	lea edx, [ecx+ecx*8]
	mov eax, [ebx+0x154c90]
	lea eax, [eax+eax*2]
	lea eax, [eax+eax*8]
	add eax, edx
	shl eax, 0x5
	add eax, dpvsGlob+0xa05c
	mov [g_dpvsView], eax
	add esp, 0x4c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	nop


;Initialized global or static variables of r_dpvs:
SECTION .data


;Initialized constant data of r_dpvs:
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
g_fltMin__uint4: dd 0x800000, 0x800000, 0x800000, 0x800000, 0x0, 0x0, 0x0, 0x0
standardFrustumSidePlanes: dd 0xbf800000, 0x0, 0x0, 0x3f800000, 0x3f800000, 0x0, 0x0, 0x3f800000, 0x0, 0xbf800000, 0x0, 0x3f800000, 0x0, 0x3f800000, 0x0, 0x3f800000, 0x80000000, 0x0, 0x0, 0x0, 0x80000000, 0x0, 0x0, 0x0, 0x80000000, 0x0, 0x0, 0x0, 0x80000000, 0x0, 0x0, 0x0
_ZZ14R_VisitPortalsPK7GfxCellPK9DpvsPlaneS4_iE5color: dd 0x0, 0x3f800000, 0x3f800000, 0x3e800000, 0x80000000, 0x0, 0x0, 0x0


;Zero initialized global or static variables of r_dpvs:
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
g_fltMin: resb 0x20
dpvsGlob: resb 0xae78
g_viewIndex: resb 0x4
g_dpvsView: resb 0x4
g_dynEntVisData: resb 0x60


;All cstrings:
SECTION .rdata
_cstring_more_than_i_poin:		db "More than %i points on a clipped portal",27h,"s convex hull",0ah,0
_cstring_more_than_i_queu:		db "more than %i queued portals",0
_cstring_more_than_i_queu1:		db "More than %i queued portals",0
_cstring_r_initscenebuffe:		db "R_InitSceneBuffers",0
_cstring_sort_surfs:		db "sort surfs",0



;All constant floats and doubles:
SECTION .rdata
_float_0_00100000:		dd 0x3a83126f	; 0.001
_float__0_00100000:		dd 0xba83126f	; -0.001
_data16_80000000:		dd 0x80000000, 0x0, 0x0, 0x0	; OWORD
_float_1_00000000:		dd 0x3f800000	; 1
_float__0_12500000:		dd 0xbe000000	; -0.125
_float_0_00000000:		dd 0x0	; 0
_float__1_00000000:		dd 0xbf800000	; -1
_float__2_00000000:		dd 0xc0000000	; -2
_float_0_25000000:		dd 0x3e800000	; 0.25
_float_0_12500000:		dd 0x3e000000	; 0.125
_float_4_00000000:		dd 0x40800000	; 4
_float_0_10000000:		dd 0x3dcccccd	; 0.1
_float_34028234663852885_float_3:		dd 0x7f7fffff	; 3.40282e+38

