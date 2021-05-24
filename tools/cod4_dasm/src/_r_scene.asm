;Imports of r_scene:
	extern vidConfig
	extern memset
	extern MatrixForViewer
	extern InfinitePerspectiveMatrix
	extern r_znear_depthhack
	extern MatrixMultiply44
	extern MatrixInverse44
	extern r_znear
	extern Com_Memset
	extern rgp
	extern R_ClearDpvsScene
	extern R_FilterDynEntIntoCells
	extern R_LinkDynEntToPrimaryLights
	extern rg
	extern r_norefresh
	extern R_AllocViewParms
	extern r_lockPvs
	extern r_lodBiasRigid
	extern r_lodScaleRigid
	extern r_lodBiasSkinned
	extern r_lodScaleSkinned
	extern frontEndDataOut
	extern sm_enable
	extern r_rendererInUse
	extern sm_sunShadowScale
	extern floorf
	extern _ZN10MacDisplay10Is1900CardEv
	extern ceilf
	extern gfxCmdBufInput
	extern memcpy
	extern Com_Memcpy
	extern R_SetupDynamicModelLighting
	extern R_SetFrameFog
	extern r_specularColorScale
	extern r_dof_tweak
	extern r_dof_viewModelStart
	extern r_dof_viewModelEnd
	extern r_dof_nearStart
	extern r_dof_nearEnd
	extern r_dof_farStart
	extern r_dof_farEnd
	extern r_dof_nearBlur
	extern r_dof_farBlur
	extern R_UsingDepthOfField
	extern gfxRenderTargets
	extern com_statmon
	extern r_filmUseTweaks
	extern r_filmTweakEnable
	extern r_filmTweakContrast
	extern r_filmTweakBrightness
	extern r_filmTweakDesaturation
	extern r_filmTweakInvert
	extern r_filmTweakLightTint
	extern r_filmTweakDarkTint
	extern r_desaturation
	extern r_contrast
	extern r_brightness
	extern r_glowUseTweaks
	extern r_glowTweakEnable
	extern r_glowTweakRadius
	extern r_glowTweakBloomIntensity
	extern r_glowTweakBloomCutoff
	extern r_glowTweakBloomDesaturation
	extern R_UsingGlow
	extern gfxMeshGlob
	extern R_SyncRenderThread
	extern R_SetQuadMesh
	extern R_SetupWorldSurfacesDpvs
	extern R_SetViewFrustumPlanes
	extern R_CellForPoint
	extern PIXBeginNamedEvent
	extern R_FilterEntitiesIntoCells
	extern R_AddWorldSurfacesDpvs
	extern R_BeginAllStaticModelLighting
	extern r_dlightLimit
	extern gfxDrawMethod
	extern dx_ctx
	extern R_AddAllBspDrawSurfacesCameraNonlit
	extern R_AddAllStaticModelSurfacesCamera
	extern DynEntPieces_AddDrawSurfs
	extern R_DrawAllDynEnt
	extern R_DrawAllSceneEnt
	extern R_AddWorkerCmd
	extern R_SortAllStaticModelSurfacesCamera
	extern R_SetAllStaticModelLighting
	extern R_EmitShadowCookieSurfs
	extern R_InitDrawSurfListInfo
	extern R_MergeAndEmitDrawSurfLists
	extern FX_RunPhysics
	extern DynEntCl_ProcessEntities
	extern fx_marks
	extern fx_marks_smodels
	extern fx_marks_ents
	extern R_SortDrawSurfs
	extern sc_enable
	extern r_pretess
	extern R_BeginPreTess
	extern r_dof_enable
	extern R_Cinematic_IsStarted
	extern R_RegisterFont
	extern R_Cinematic_IsUnderrun
	extern colorRedFaded
	extern R_AddCmdDrawText
	extern R_CullDynamicPointLightsInCameraView
	extern R_GetPointLightPartitions
	extern R_GetBspLightSurfs
	extern R_GetStaticModelLightSurfs
	extern R_GetSceneEntLightSurfs
	extern R_CullDynamicSpotLightInCameraView
	extern R_AddDynamicShadowableLight
	extern _ZN10MacDisplay15SupportsShadowsEv
	extern CL_UpdateSound
	extern R_EndPreTess
	extern R_EmitPointLightPartitionSurfs
	extern R_AddAllBspDrawSurfacesCamera
	extern sm_sunEnable
	extern R_UpdateDrawMethod
	extern R_AddAllBspDrawSurfacesSunShadow
	extern R_AddAllStaticModelSurfacesSunShadow
	extern r_spotLightShadows
	extern comWorld
	extern Com_Error
	extern R_ChooseShadowedLights
	extern R_GenerateAllSortedSpotShadowDrawSurfs
	extern FX_GenerateMarkVertsForStaticModels
	extern FX_BeginGeneratingMarkVertsForEntModels
	extern gfxCfg
	extern CG_GetPoseLightingHandle
	extern FX_GenerateMarkVertsForEntDObj
	extern FX_GenerateMarkVertsForEntXModel
	extern FX_GenerateMarkVertsForEntBrush
	extern FX_EndGeneratingMarkVertsForEntModels
	extern R_AddAllSceneEntSurfacesSunShadow
	extern R_SortAllStaticModelSurfacesSunShadow
	extern R_MergeAndEmitSunShadowMapsSurfs
	extern R_SetupSunShadowMaps
	extern R_SunShadowMaps
	extern Sys_Sleep
	extern Sys_Milliseconds
	extern r_lightTweakSunDirection
	extern Cvar_ClearModified
	extern R_UnfilterDynEntFromCells
	extern R_UnlinkDynEntFromPrimaryLights
	extern R_UnfilterEntFromCells
	extern R_UnlinkEntityFromPrimaryLights
	extern InterlockedExchangeAdd
	extern DObjGetTree
	extern DObjGetRadius
	extern CG_GetPoseOrigin
	extern CG_GetPoseAngles
	extern AnglesToQuat
	extern CG_PredictiveSkinCEntity
	extern R_WarnOncePerFrame
	extern DObjGetNumModels
	extern DObjGetModel
	extern XModelGetRadius
	extern R_FilterDObjIntoCells
	extern R_LinkSphereEntityToPrimaryLights
	extern XModelGetSurfCount
	extern XModelGetSkins
	extern R_FilterBModelIntoCells
	extern R_LinkBoxEntityToPrimaryLights
	extern r_drawDecals
	extern r_spotLightEndRadius
	extern r_spotLightStartRadius
	extern atanf
	extern r_spotLightFovInnerFraction
	extern tanf
	extern r_spotLightBrightness
	extern cosf
	extern Cvar_SetFloat
	extern InterlockedIncrement
	extern InterlockedDecrement
	extern R_AddParticleCloudDrawSurf

;Exports of r_scene:
	global _GLOBAL__I_scene
	global lockPvsViewParms
	global g_allowShadowMaps
	global _ZZ20R_GetAllowShadowMapsvE19sDisableShadowsTest
	global R_SetSceneParms
	global R_SetViewParmsForScene
	global R_InitScene
	global R_ClearScene
	global R_LinkDynEnt
	global R_SetEndTime
	global R_RenderScene
	global R_WaitEndTime
	global R_SetLodOrigin
	global R_UnlinkDynEnt
	global R_UnlinkEntity
	global R_GetBrushModel
	global R_AddDObjToScene
	global R_LinkDObjEntity
	global R_AddDObjSurfaces
	global R_AllocSceneModel
	global R_LinkBModelEntity
	global R_AddBModelSurfaces
	global R_AddXModelSurfaces
	global R_GetLocalClientNum
	global R_AddOmniLightToScene
	global R_AddSpotLightToScene
	global R_AddDObjSurfacesCamera
	global R_AddBModelSurfacesCamera
	global R_AddParticleCloudToScene
	global R_AddXModelSurfacesCamera
	global R_SetupViewProjectionMatrices
	global R_AddBrushModelToSceneFromAngles
	global scene


SECTION .text


;global constructors keyed to scene
_GLOBAL__I_scene:
	push ebp
	mov ebp, esp
	mov edx, 0xffff
	mov eax, 0x1
	pop ebp
	jmp __static_initialization_and_destruction_0


;R_SetSceneParms(refdef_s const*, GfxSceneParms*)
R_SetSceneParms:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x10
	mov esi, eax
	mov edi, edx
	mov eax, [eax+0x4094]
	mov [edx], eax
	mov eax, [esi+0x5c]
	mov [edx+0x4], eax
	mov eax, [esi+0x60]
	mov [edx+0x8], eax
	mov eax, [esi+0x64]
	mov [edx+0xc], eax
	mov eax, [esi+0x68]
	mov [edx+0x10], eax
	mov eax, [esi+0x6c]
	mov [edx+0x14], eax
	mov eax, [esi+0x70]
	mov [edx+0x18], eax
	mov eax, [esi+0x74]
	mov [edx+0x1c], eax
	mov eax, [esi+0x78]
	mov [edx+0x20], eax
	mov eax, [esi+0x7c]
	mov [edx+0x24], eax
	mov eax, [esi+0x80]
	mov [edx+0x28], eax
	mov eax, [esi+0x84]
	mov [edx+0x2c], eax
	mov eax, [esi+0x88]
	mov [edx+0x30], eax
	mov eax, [esi+0x8c]
	mov [edx+0x34], eax
	mov eax, [esi+0x90]
	mov [edx+0x38], eax
	mov eax, [esi+0x94]
	mov [edx+0x3c], eax
	mov eax, [esi+0x98]
	mov [edx+0x40], eax
	mov eax, [esi+0x9c]
	mov [edx+0x44], eax
	mov eax, [esi+0xa0]
	mov [edx+0x48], eax
	mov eax, [esi+0xa4]
	mov [edx+0x4c], eax
	mov eax, [esi+0xa8]
	mov [edx+0x50], eax
	mov eax, [esi+0xac]
	mov [edx+0x54], eax
	mov eax, [esi+0xb0]
	mov [edx+0x58], eax
	mov eax, [esi+0xb4]
	mov [edx+0x5c], eax
	mov eax, [esi+0xb8]
	mov [edx+0x60], eax
	mov eax, [esi+0xbc]
	mov [edx+0x64], eax
	mov eax, [esi+0x8]
	mov edx, vidConfig
	cmp eax, [edx+0x8]
	jz R_SetSceneParms_10
R_SetSceneParms_30:
	xor eax, eax
R_SetSceneParms_40:
	mov [edi+0x68], al
	mov eax, [esi]
	mov [edi+0x7c], eax
	mov eax, [esi+0x4]
	mov [edi+0x80], eax
	mov eax, [esi+0x8]
	mov [edi+0x84], eax
	mov eax, [esi+0xc]
	mov [edi+0x88], eax
	mov eax, [esi]
	mov ecx, vidConfig
	imul eax, [ecx]
	xor edx, edx
	div dword [ecx+0x8]
	mov [ebp-0x10], eax
	mov [edi+0x6c], eax
	mov eax, [esi+0x4]
	imul eax, [ecx+0x4]
	xor edx, edx
	div dword [ecx+0xc]
	mov [ebp-0x1c], eax
	mov [edi+0x70], eax
	mov ecx, [esi]
	add ecx, [esi+0x8]
	mov ebx, vidConfig
	imul ecx, [ebx]
	mov eax, ecx
	xor edx, edx
	div dword [ebx+0x8]
	mov ecx, eax
	sub ecx, [ebp-0x10]
	mov [edi+0x74], ecx
	mov eax, [esi+0x4]
	add eax, [esi+0xc]
	imul eax, [ebx+0x4]
	xor edx, edx
	div dword [ebx+0xc]
	sub eax, [ebp-0x1c]
	mov [edi+0x78], eax
	cmp byte [esi+0x4090], 0x0
	jz R_SetSceneParms_20
	mov ecx, ebx
	mov ebx, [esi+0x4080]
	imul ebx, [ecx]
	mov eax, ebx
	xor edx, edx
	div dword [ecx+0x8]
	mov [ebp-0x14], eax
	mov [edi+0x8c], eax
	mov ecx, [esi+0x4084]
	mov ebx, vidConfig
	imul ecx, [ebx+0x4]
	mov eax, ecx
	xor edx, edx
	div dword [ebx+0xc]
	mov ecx, eax
	mov [edi+0x90], eax
	mov eax, [esi+0x4080]
	add eax, [esi+0x4088]
	imul eax, [ebx]
	xor edx, edx
	div dword [ebx+0x8]
	sub eax, [ebp-0x14]
	mov [edi+0x94], eax
	mov eax, [esi+0x4084]
	add eax, [esi+0x408c]
	imul eax, [ebx+0x4]
	xor edx, edx
	div dword [ebx+0xc]
	sub eax, ecx
	mov [edi+0x98], eax
	lea eax, [esi+0xc0]
	mov [edi+0x9c], eax
	add esp, 0x10
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_SetSceneParms_20:
	mov ebx, [ebp-0x10]
	mov [edi+0x8c], ebx
	mov edx, [ebp-0x1c]
	mov [edi+0x90], edx
	mov [edi+0x94], ecx
	mov [edi+0x98], eax
	lea eax, [esi+0xc0]
	mov [edi+0x9c], eax
	add esp, 0x10
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_SetSceneParms_10:
	mov eax, [esi+0xc]
	cmp eax, [edx+0xc]
	jnz R_SetSceneParms_30
	mov eax, 0x1
	jmp R_SetSceneParms_40
	nop


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


;R_SetViewParmsForScene(refdef_s const*, GfxViewParms*)
R_SetViewParmsForScene:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x3c
	mov [ebp-0x1c], eax
	mov edi, edx
	mov dword [esp+0x8], 0x140
	mov dword [esp+0x4], 0x0
	mov [esp], edx
	call memset
	lea esi, [edi+0x100]
	mov edx, [ebp-0x1c]
	add edx, 0x18
	mov ecx, [ebp-0x1c]
	mov eax, [ecx+0x18]
	mov [edi+0x100], eax
	mov eax, [edx+0x4]
	mov [esi+0x4], eax
	mov eax, [edx+0x8]
	mov [esi+0x8], eax
	mov dword [edi+0x10c], 0x3f800000
	lea ebx, [edi+0x110]
	mov edx, ecx
	add edx, 0x24
	mov eax, [ecx+0x24]
	mov [edi+0x110], eax
	mov eax, [edx+0x4]
	mov [ebx+0x4], eax
	mov eax, [edx+0x8]
	mov [ebx+0x8], eax
	lea ecx, [edi+0x11c]
	mov edx, [ebp-0x1c]
	add edx, 0x30
	mov eax, [ebp-0x1c]
	movss xmm0, dword [eax+0x30]
	movss [edi+0x11c], xmm0
	mov eax, [edx+0x4]
	mov [ecx+0x4], eax
	mov eax, [edx+0x8]
	mov [ecx+0x8], eax
	lea ecx, [edi+0x128]
	mov edx, [ebp-0x1c]
	add edx, 0x3c
	mov eax, [ebp-0x1c]
	movss xmm0, dword [eax+0x3c]
	movss [edi+0x128], xmm0
	mov eax, [edx+0x4]
	mov [ecx+0x4], eax
	mov eax, [edx+0x8]
	mov [ecx+0x8], eax
	mov [esp+0x8], ebx
	mov [esp+0x4], esi
	mov [esp], edi
	call MatrixForViewer
	mov eax, [ebp-0x1c]
	movss xmm3, dword [eax+0x58]
	pxor xmm0, xmm0
	ucomiss xmm3, xmm0
	jbe R_SetViewParmsForScene_10
	mov edx, eax
R_SetViewParmsForScene_20:
	movss [edi+0x138], xmm3
	lea esi, [edi+0x40]
	movss [esp+0xc], xmm3
	mov eax, [edx+0x14]
	mov [esp+0x8], eax
	mov eax, [edx+0x10]
	mov [esp+0x4], eax
	mov [esp], esi
	call InfinitePerspectiveMatrix
	mov eax, r_znear_depthhack
	mov eax, [eax]
	mov eax, [eax+0xc]
	xor eax, 0x80000000
	mov [edi+0x134], eax
	lea ebx, [edi+0x80]
	mov [esp+0x8], ebx
	mov [esp+0x4], esi
	mov [esp], edi
	call MatrixMultiply44
	lea eax, [edi+0xc0]
	mov [esp+0x4], eax
	mov [esp], ebx
	call MatrixInverse44
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_SetViewParmsForScene_10:
	mov eax, r_znear
	mov eax, [eax]
	movss xmm3, dword [eax+0xc]
	movss xmm2, dword [_float_0_01000000]
	movaps xmm1, xmm2
	subss xmm1, xmm3
	cmpss xmm0, xmm1, 0x6
	movaps xmm1, xmm3
	andps xmm1, xmm0
	movaps xmm3, xmm0
	andnps xmm3, xmm2
	orps xmm3, xmm1
	mov edx, [ebp-0x1c]
	jmp R_SetViewParmsForScene_20


;R_InitScene()
R_InitScene:
	push ebp
	mov ebp, esp
	mov dword [scene+0xe4190], scene
	mov dword [scene+0xe4194], scene+0x10000
	mov dword [scene+0xe4198], scene+0x20000
	mov dword [scene+0xe419c], scene+0x30000
	mov dword [scene+0xe41a0], scene+0x31000
	mov dword [scene+0xe41a4], scene+0x32000
	mov dword [scene+0xe41a8], scene+0xe4218
	mov dword [scene+0xe41ac], scene+0xf4218
	mov dword [scene+0xe41b0], scene+0x104218
	mov dword [scene+0xe41b4], scene+0x33000
	mov dword [scene+0xe41b8], scene+0x43000
	mov dword [scene+0xe41bc], scene+0x53000
	mov dword [scene+0xe41c0], scene+0x63000
	mov dword [scene+0xe41c4], scene+0x73000
	mov dword [scene+0xe41c8], scene+0x83000
	mov dword [scene+0xe41cc], scene+0x93000
	mov dword [scene+0xe41d0], scene+0x9b000
	mov dword [scene+0xe41d4], scene+0xa3000
	mov dword [scene+0xe41d8], scene+0xab000
	mov dword [scene+0xe41dc], scene+0xbb000
	mov dword [scene+0xe41e0], scene+0xcb000
	mov dword [scene+0xe41e4], scene+0xdb000
	mov dword [scene+0xe41e8], scene+0xdb800
	mov dword [scene+0xe41ec], scene+0xdc000
	mov dword [scene+0xe41f0], scene+0xdd000
	mov dword [scene+0xe41f4], scene+0xdd800
	mov dword [scene+0xe41f8], scene+0xde000
	mov dword [scene+0xe41fc], scene+0xdf000
	mov dword [scene+0xe4200], scene+0xdf800
	mov dword [scene+0xe4204], scene+0xe0000
	mov dword [scene+0xe4208], scene+0xe1000
	mov dword [scene+0xe420c], scene+0xe1800
	mov dword [scene+0xe4210], scene+0xe2000
	mov dword [scene+0xe4214], scene+0xe3000
	mov dword [scene+0xe4080], 0x2000
	mov dword [scene+0xe4084], 0x2000
	mov dword [scene+0xe4088], 0x2000
	mov dword [scene+0xe408c], 0x200
	mov dword [scene+0xe4090], 0x200
	mov dword [scene+0xe4094], 0x200
	mov dword [scene+0xe4098], 0x2000
	mov dword [scene+0xe409c], 0x2000
	mov dword [scene+0xe40a0], 0x2000
	mov dword [scene+0xe40a4], 0x2000
	mov dword [scene+0xe40a8], 0x2000
	mov dword [scene+0xe40ac], 0x2000
	mov dword [scene+0xe40b0], 0x2000
	mov dword [scene+0xe40b4], 0x2000
	mov dword [scene+0xe40b8], 0x2000
	mov dword [scene+0xe40bc], 0x1000
	mov dword [scene+0xe40c0], 0x1000
	mov dword [scene+0xe40c4], 0x1000
	mov dword [scene+0xe40c8], 0x2000
	mov dword [scene+0xe40cc], 0x2000
	mov dword [scene+0xe40d0], 0x2000
	mov dword [scene+0xe40d4], 0x100
	mov dword [scene+0xe40d8], 0x100
	mov dword [scene+0xe40dc], 0x200
	mov dword [scene+0xe40e0], 0x100
	mov dword [scene+0xe40e4], 0x100
	mov dword [scene+0xe40e8], 0x200
	mov dword [scene+0xe40ec], 0x100
	mov dword [scene+0xe40f0], 0x100
	mov dword [scene+0xe40f4], 0x200
	mov dword [scene+0xe40f8], 0x100
	mov dword [scene+0xe40fc], 0x100
	mov dword [scene+0xe4100], 0x200
	mov dword [scene+0xe4104], 0x200
	pop ebp
	ret
	nop


;R_ClearScene(int)
R_ClearScene:
	push ebp
	mov ebp, esp
	push esi
	push ebx
	sub esp, 0x10
	mov eax, [ebp+0x8]
	mov [scene+0x154c90], eax
	mov eax, [scene+0x12b42c]
	lea edx, [eax*4]
	shl eax, 0x7
	sub eax, edx
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x0
	mov dword [esp], scene+0x12b430
	call Com_Memset
	mov eax, [scene+0x13ba30]
	lea eax, [eax+eax*8]
	shl eax, 0x3
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x0
	mov dword [esp], scene+0x13ba34
	call Com_Memset
	mov eax, [scene+0x14f634]
	lea eax, [eax+eax*4]
	shl eax, 0x3
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x0
	mov dword [esp], scene+0x14f638
	call Com_Memset
	mov dword [scene+0x11422c], 0x0
	mov dword [esp+0x8], 0x88
	mov dword [esp+0x4], 0x0
	mov dword [esp], scene+0xe4108
	call memset
	xor esi, esi
	mov ebx, scene+0x14da34
R_ClearScene_10:
	mov eax, [scene+0x13ba30]
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x1
	mov [esp], ebx
	call Com_Memset
	add esi, 0x1
	add ebx, 0x400
	cmp esi, 0x7
	jnz R_ClearScene_10
	mov dword [scene+0x12b42c], 0x0
	mov dword [scene+0x13ba30], 0x0
	mov dword [scene+0x14f634], 0x0
	mov eax, rgp
	mov ebx, [eax+0x20a0]
	test ebx, ebx
	jz R_ClearScene_20
	add esp, 0x10
	pop ebx
	pop esi
	pop ebp
	jmp R_ClearDpvsScene
R_ClearScene_20:
	add esp, 0x10
	pop ebx
	pop esi
	pop ebp
	ret


;R_LinkDynEnt(unsigned int, DynEntityDrawType, float*, float*)
R_LinkDynEnt:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x2c
	mov eax, [ebp+0x8]
	mov [ebp-0x1c], eax
	mov edi, [ebp+0xc]
	mov esi, [ebp+0x10]
	mov ebx, [ebp+0x14]
	mov [esp+0xc], ebx
	mov [esp+0x8], esi
	mov [esp+0x4], edi
	mov [esp], eax
	call R_FilterDynEntIntoCells
	mov [ebp+0x14], ebx
	mov [ebp+0x10], esi
	mov [ebp+0xc], edi
	mov eax, [ebp-0x1c]
	mov [ebp+0x8], eax
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	jmp R_LinkDynEntToPrimaryLights
	nop


;R_SetEndTime(int)
R_SetEndTime:
	push ebp
	mov ebp, esp
	mov edx, [ebp+0x8]
	mov eax, rg
	mov [eax+0x2268], edx
	pop ebp
	ret
	nop


;R_RenderScene(refdef_s const*)
R_RenderScene:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x1cc
	mov esi, [ebp+0x8]
	mov ebx, rg
	cmp byte [ebx+0x140], 0x0
	jz R_RenderScene_10
	mov eax, r_norefresh
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jnz R_RenderScene_10
	mov eax, rgp
	mov edi, [eax+0x20a0]
	test edi, edi
	jz R_RenderScene_20
R_RenderScene_1020:
	mov eax, [esi+0x18]
	mov [ebx+0x144], eax
	mov eax, [esi+0x1c]
	mov [ebx+0x148], eax
	mov eax, [esi+0x20]
	mov [ebx+0x14c], eax
	lea edx, [esi+0x24]
	mov eax, [esi+0x24]
	mov [ebx+0x150], eax
	mov eax, [edx+0x4]
	mov [ebx+0x154], eax
	mov eax, [edx+0x8]
	mov [ebx+0x158], eax
	call R_AllocViewParms
	mov [ebp-0xec], eax
	mov edx, eax
	mov eax, esi
	call R_SetViewParmsForScene
	lea edx, [ebp-0xe0]
	mov eax, esi
	call R_SetSceneParms
	mov edx, r_lockPvs
	mov eax, [edx]
	cmp byte [eax+0xc], 0x0
	jz R_RenderScene_30
	mov eax, [lockPvsViewParms+0x100]
	mov [ebx+0x21f8], eax
	mov eax, [lockPvsViewParms+0x104]
	mov [ebx+0x21fc], eax
	mov eax, [lockPvsViewParms+0x108]
	mov [ebx+0x2200], eax
R_RenderScene_600:
	movss xmm1, dword [_float_2_11867309]
	mulss xmm1, [esi+0x14]
	mov eax, r_lodBiasRigid
	mov eax, [eax]
	movss xmm2, dword [eax+0xc]
	mov eax, r_lodScaleRigid
	mov eax, [eax]
	movaps xmm0, xmm1
	mulss xmm0, [eax+0xc]
	mov eax, rg
	movss [eax+0x2204], xmm0
	mulss xmm2, xmm1
	movss [eax+0x2208], xmm2
	mov eax, r_lodBiasSkinned
	mov eax, [eax]
	movss xmm2, dword [eax+0xc]
	mov eax, r_lodScaleSkinned
	mov eax, [eax]
	movaps xmm0, xmm1
	mulss xmm0, [eax+0xc]
	mov ecx, rg
	movss [ecx+0x220c], xmm0
	mulss xmm1, xmm2
	movss [ecx+0x2210], xmm1
	mov eax, [edx]
	mov dword [ebp-0x134], lockPvsViewParms
	cmp byte [eax+0xc], 0x0
	mov ebx, lockPvsViewParms
	cmovz ebx, [ebp-0xec]
	mov [ebp-0x134], ebx
	mov esi, [ecx+0x22dc]
	mov [ebp-0x11c], esi
	mov ecx, esi
	add ecx, 0x1
	mov eax, rg
	mov [eax+0x22dc], ecx
	mov edx, frontEndDataOut
	mov eax, [edx]
	mov [eax+0x11e6c4], ecx
	mov eax, [edx]
	mov [eax+0x11e6c0], esi
	mov ecx, [edx]
	lea eax, [esi+esi*2]
	lea eax, [esi+eax*4]
	shl eax, 0x4
	add eax, esi
	mov edx, eax
	shl edx, 0x7
	sub edx, eax
	add edx, esi
	mov [ebp-0x104], edx
	mov ebx, [ecx+0x11e6c8]
	add edx, ebx
	mov [ebp-0x104], edx
	cmp byte [_ZZ20R_GetAllowShadowMapsvE19sDisableShadowsTest], 0x0
	jnz R_RenderScene_40
R_RenderScene_790:
	mov eax, sm_enable
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_RenderScene_50
	cmp byte [g_allowShadowMaps], 0x0
	jnz R_RenderScene_60
R_RenderScene_50:
	xor eax, eax
R_RenderScene_620:
	test eax, eax
	jz R_RenderScene_70
	mov dword [ebp-0x128], 0x2
	mov eax, r_rendererInUse
	mov eax, [eax]
	cmp dword [eax+0xc], 0x1
	setz al
	movzx eax, al
	mov esi, rg
	mov [esi+0x22e0], eax
	test eax, eax
	jz R_RenderScene_80
R_RenderScene_580:
	mov eax, sm_sunShadowScale
	mov eax, [eax]
	movss xmm0, dword [eax+0xc]
	movss [ebp-0x130], xmm0
	mov edi, 0x1
	mov esi, 0x1
	movss xmm1, dword [_float_1_00000000]
	movss [ebp-0x124], xmm1
	mov ebx, 0x1
	jmp R_RenderScene_90
R_RenderScene_130:
	cvtsi2ss xmm3, ebx
R_RenderScene_140:
	movss xmm0, dword [ebp-0x130]
	mulss xmm0, xmm3
	addss xmm0, [_float_0_50000000]
	movss [esp], xmm0
	movss [ebp-0x1a8], xmm3
	call floorf
	fstp dword [ebp-0x148]
	movss xmm2, dword [ebp-0x148]
	movaps xmm0, xmm2
	xorps xmm1, xmm1
	maxss xmm0, xmm1
	movss xmm1, dword [_data16_4f000000]
	cmpss xmm1, xmm0, 0x2
	movss xmm6, dword [_data16_4f800000]
	cmpss xmm6, xmm0, 0x2
	movaps xmm2, xmm1
	andps xmm2, [_data16_4f000000]
	pslld xmm1, 0x1f
	subps xmm0, xmm2
	cvttps2dq xmm0, xmm0
	paddd xmm0, xmm1
	por xmm0, xmm6
	movdqa [ebp-0x168], xmm0
	mov ecx, [ebp-0x168]
	test ecx, ecx
	movss xmm3, dword [ebp-0x1a8]
	js R_RenderScene_100
	cvtsi2ss xmm0, ecx
R_RenderScene_570:
	divss xmm0, xmm3
	subss xmm0, [ebp-0x130]
	andps xmm0, [_data16_7fffffff]
	ucomiss xmm0, [ebp-0x124]
	jae R_RenderScene_110
	mov edi, ebx
	mov esi, ecx
	movss [ebp-0x124], xmm0
R_RenderScene_110:
	add ebx, 0x1
	cmp ebx, 0xb
	jz R_RenderScene_120
R_RenderScene_90:
	test ebx, ebx
	jns R_RenderScene_130
	mov eax, ebx
	shr eax, 1
	mov edx, ebx
	and edx, 0x1
	or eax, edx
	cvtsi2ss xmm3, eax
	addss xmm3, xmm3
	jmp R_RenderScene_140
R_RenderScene_120:
	test esi, esi
	js R_RenderScene_150
	cvtsi2ss xmm1, esi
R_RenderScene_970:
	test edi, edi
	js R_RenderScene_160
	cvtsi2ss xmm0, edi
R_RenderScene_960:
	movaps xmm2, xmm1
	divss xmm2, xmm0
	mov eax, rg
	movss [eax+0x22e4], xmm2
	movss [eax+0x22e8], xmm1
	call _ZN10MacDisplay10Is1900CardEv
	test al, al
	jz R_RenderScene_170
	movss xmm0, dword [_float_512_00000000]
R_RenderScene_610:
	mov edx, rg
	mulss xmm0, [edx+0x22e4]
	movss [esp], xmm0
	call ceilf
	fstp dword [ebp-0x178]
	movss xmm1, dword [ebp-0x178]
	movaps xmm0, xmm1
	xorps xmm1, xmm1
	maxss xmm0, xmm1
	movss xmm1, dword [_data16_4f000000]
	movaps xmm2, xmm1
	cmpss xmm2, xmm0, 0x2
	movss xmm3, dword [_data16_4f800000]
	cmpss xmm3, xmm0, 0x2
	andps xmm1, xmm2
	pslld xmm2, 0x1f
	subps xmm0, xmm1
	cvttps2dq xmm0, xmm0
	paddd xmm0, xmm2
	por xmm0, xmm3
	movdqa [ebp-0x188], xmm0
	mov edx, [ebp-0x188]
	mov eax, rg
	mov [eax+0x22ec], edx
	movss xmm0, dword [_float_4_00000000]
	divss xmm0, dword [eax+0x22e4]
	movss [eax+0x22f0], xmm0
	mov ebx, eax
R_RenderScene_590:
	mov dword [ebx+0x22f4], 0x0
	mov esi, [ebp-0x104]
	add esi, 0x6380
	mov [ebp-0x18c], esi
	mov dword [esp+0x8], 0x430
	mov eax, gfxCmdBufInput
	mov [esp+0x4], eax
	mov [esp], esi
	call memcpy
	mov eax, frontEndDataOut
	mov eax, [eax]
	mov edx, [ebp-0x104]
	mov [edx+0x67a8], eax
	mov eax, [scene+0x114218]
	mov [edx+0x140], eax
	mov eax, [scene+0x11421c]
	mov [edx+0x144], eax
	mov eax, [scene+0x114220]
	mov [edx+0x148], eax
	mov eax, [scene+0x114224]
	mov [edx+0x14c], eax
	mov eax, [scene+0x114228]
	mov [edx+0x150], eax
	mov dword [esp+0x8], 0x140
	mov ecx, [ebp-0xec]
	mov [esp+0x4], ecx
	mov [esp], edx
	call memcpy
	mov eax, [ebp-0x74]
	mov ebx, [ebp-0x104]
	mov [ebx+0x154], eax
	mov eax, [ebp-0x70]
	mov [ebx+0x158], eax
	mov eax, [ebp-0x6c]
	mov [ebx+0x15c], eax
	mov eax, [ebp-0x68]
	mov [ebx+0x160], eax
	mov eax, [ebp-0x64]
	mov [ebx+0x164], eax
	mov eax, [ebp-0x60]
	mov [ebx+0x168], eax
	mov eax, [ebp-0x5c]
	mov [ebx+0x16c], eax
	mov eax, [ebp-0x58]
	mov [ebx+0x170], eax
	mov eax, [ebp-0x54]
	mov [ebx+0x174], eax
	mov eax, [ebp-0x50]
	mov [ebx+0x178], eax
	mov eax, [ebp-0x4c]
	mov [ebx+0x17c], eax
	mov eax, [ebp-0x48]
	mov [ebx+0x180], eax
	mov esi, [ebp-0x128]
	mov [ebx+0x184], esi
	mov eax, [ebp-0xe0]
	mov [ebx+0x13a0], eax
	movzx eax, byte [ebp-0x78]
	mov [ebx+0x13a4], eax
	mov eax, [ebp-0xdc]
	mov [ebx+0x55e4], eax
	mov dword [ebx+0x5b30], 0x0
	mov byte [ebx+0x13a8], 0x0
	mov ebx, rgp
	mov eax, [ebx+0x20a0]
	mov eax, [eax+0xdc]
	shl eax, 0x6
	mov [esp+0x8], eax
	mov eax, [ebp-0x44]
	mov [esp+0x4], eax
	mov eax, [ebp-0x104]
	add eax, 0x13ac
	mov [esp], eax
	call Com_Memcpy
	mov eax, [ebx+0x20a0]
	mov eax, [eax+0xdc]
	mov edx, [ebp-0x104]
	mov [edx+0x536c], eax
	mov edi, scene+0xe4000
	cld
	mov ecx, 0x8
	xor eax, eax
	rep stosd
	mov edx, [ebp-0x18c]
	mov [esp], edx
	call R_SetupDynamicModelLighting
	mov ecx, [ebp-0x18c]
	mov [esp], ecx
	call R_SetFrameFog
	mov ebx, [ebp-0x18c]
	mov edx, [ebx+0x428]
	lea esi, [edx+0x11e6d0]
	mov eax, r_specularColorScale
	mov eax, [eax]
	movss xmm0, dword [eax+0xc]
	lea eax, [edx+0x11e6d4]
	movaps xmm1, xmm0
	mulss xmm1, [edx+0x11e6d4]
	movaps xmm2, xmm0
	mulss xmm2, [eax+0x4]
	mulss xmm0, [eax+0x8]
	lea ecx, [edx+0x11e6e0]
	mov ebx, [ebp-0x104]
	add ebx, 0x65b0
	mov eax, [edx+0x11e6e0]
	mov edx, [ebp-0x104]
	mov [edx+0x65b0], eax
	mov eax, [ecx+0x4]
	mov [ebx+0x4], eax
	mov eax, [ecx+0x8]
	mov [ebx+0x8], eax
	mov eax, [ecx+0xc]
	mov [ebx+0xc], eax
	mov ebx, [esi+0xc]
	mov ecx, [esi+0x8]
	mov edx, [ebp-0x104]
	add edx, 0x65c0
	mov eax, [esi+0x4]
	mov esi, [ebp-0x104]
	mov [esi+0x65c0], eax
	mov [edx+0x4], ecx
	mov [edx+0x8], ebx
	mov ecx, 0x3f800000
	mov [edx+0xc], ecx
	mov eax, esi
	add eax, 0x65d0
	movss [esi+0x65d0], xmm1
	movss [eax+0x4], xmm2
	movss [eax+0x8], xmm0
	mov [eax+0xc], ecx
	mov eax, r_dof_tweak
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_RenderScene_180
	mov eax, r_dof_viewModelStart
	mov eax, [eax]
	mov eax, [eax+0xc]
	mov [esi+0x5628], eax
	mov eax, r_dof_viewModelEnd
	mov eax, [eax]
	mov eax, [eax+0xc]
	mov [esi+0x562c], eax
	mov eax, r_dof_nearStart
	mov eax, [eax]
	mov eax, [eax+0xc]
	mov [esi+0x5630], eax
	mov eax, r_dof_nearEnd
	mov eax, [eax]
	mov eax, [eax+0xc]
	mov [esi+0x5634], eax
	mov eax, r_dof_farStart
	mov eax, [eax]
	mov eax, [eax+0xc]
	mov [esi+0x5638], eax
	mov eax, r_dof_farEnd
	mov eax, [eax]
	mov eax, [eax+0xc]
	mov [esi+0x563c], eax
	mov eax, r_dof_nearBlur
	mov eax, [eax]
	mov eax, [eax+0xc]
	mov [esi+0x5640], eax
	mov eax, r_dof_farBlur
	mov eax, [eax]
	mov eax, [eax+0xc]
	mov [esi+0x5644], eax
R_RenderScene_740:
	mov edx, [ebp-0x104]
	mov [esp], edx
	call R_UsingDepthOfField
	test al, al
	jz R_RenderScene_190
	mov eax, gfxRenderTargets
	mov esi, [eax+0x68]
	test esi, esi
	jz R_RenderScene_200
R_RenderScene_950:
	mov ecx, [ebp-0x104]
	mov byte [ecx+0x13a8], 0x1
	mov eax, com_statmon
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jnz R_RenderScene_210
R_RenderScene_190:
	mov eax, r_filmUseTweaks
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_RenderScene_220
	mov eax, r_filmTweakEnable
	mov eax, [eax]
	movzx eax, byte [eax+0xc]
	mov ebx, [ebp-0x104]
	mov [ebx+0x5648], al
	mov eax, r_filmTweakContrast
	mov eax, [eax]
	mov eax, [eax+0xc]
	mov [ebx+0x5650], eax
	mov eax, r_filmTweakBrightness
	mov eax, [eax]
	mov eax, [eax+0xc]
	mov [ebx+0x564c], eax
	mov eax, r_filmTweakDesaturation
	mov eax, [eax]
	mov eax, [eax+0xc]
	mov [ebx+0x5654], eax
	mov eax, r_filmTweakInvert
	mov eax, [eax]
	movzx eax, byte [eax+0xc]
	mov [ebx+0x5658], al
	mov ecx, ebx
	add ecx, 0x5668
	mov eax, r_filmTweakLightTint
	mov eax, [eax]
	lea edx, [eax+0xc]
	mov eax, [eax+0xc]
	mov [ebx+0x5668], eax
	mov eax, [edx+0x4]
	mov [ecx+0x4], eax
	mov eax, [edx+0x8]
	mov [ecx+0x8], eax
	sub ecx, 0xc
	mov eax, r_filmTweakDarkTint
	mov eax, [eax]
	lea edx, [eax+0xc]
	mov eax, [eax+0xc]
	mov [ebx+0x565c], eax
	mov eax, [edx+0x4]
	mov [ecx+0x4], eax
	mov eax, [edx+0x8]
	mov [ecx+0x8], eax
R_RenderScene_760:
	mov eax, [ebp-0x104]
	movss xmm0, dword [eax+0x5654]
	mov eax, r_desaturation
	mov eax, [eax]
	movss xmm1, dword [_float_1_00000000]
	subss xmm1, xmm0
	mulss xmm1, [eax+0xc]
	addss xmm1, xmm0
	mulss xmm1, xmm0
	mov edx, [ebp-0x104]
	movss [edx+0x5654], xmm1
	mov eax, r_contrast
	mov eax, [eax]
	movss xmm4, dword [edx+0x5650]
	mulss xmm4, [eax+0xc]
	movss [edx+0x5650], xmm4
	mov eax, r_brightness
	mov eax, [eax]
	movss xmm6, dword [edx+0x564c]
	addss xmm6, [eax+0xc]
	movss [edx+0x564c], xmm6
	cmp byte [edx+0x5648], 0x0
	jnz R_RenderScene_230
	mov eax, [ebp-0x18c]
	add eax, 0x2d0
	mov ecx, [ebp-0x18c]
	mov dword [ecx+0x2d0], 0x0
	mov dword [eax+0x4], 0x0
	mov dword [eax+0x8], 0x0
	mov dword [eax+0xc], 0x457ff000
	mov edx, ecx
	add edx, 0x2e0
	mov eax, 0x39800000
	mov [ecx+0x2e0], eax
	mov [edx+0x4], eax
	mov [edx+0x8], eax
	mov dword [edx+0xc], 0x0
	mov eax, ecx
	add eax, 0x2f0
	mov dword [ecx+0x2f0], 0x0
	mov dword [eax+0x4], 0x0
	mov dword [eax+0x8], 0x0
	mov dword [eax+0xc], 0x0
R_RenderScene_710:
	mov eax, r_glowUseTweaks
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_RenderScene_240
	mov eax, r_glowTweakEnable
	mov eax, [eax]
	movzx eax, byte [eax+0xc]
	mov edx, [ebp-0x104]
	mov [edx+0x5674], al
	mov eax, r_glowTweakRadius
	mov eax, [eax]
	mov eax, [eax+0xc]
	mov [edx+0x5684], eax
	mov eax, r_glowTweakBloomIntensity
	mov eax, [eax]
	mov eax, [eax+0xc]
	mov [edx+0x5680], eax
	mov eax, r_glowTweakBloomCutoff
	mov eax, [eax]
	mov eax, [eax+0xc]
	mov [edx+0x5678], eax
	mov eax, r_glowTweakBloomDesaturation
	mov eax, [eax]
	mov eax, [eax+0xc]
	mov [edx+0x567c], eax
R_RenderScene_680:
	pxor xmm0, xmm0
	mov ebx, [ebp-0x104]
	ucomiss xmm0, [ebx+0x5680]
	jp R_RenderScene_250
	jz R_RenderScene_260
R_RenderScene_250:
	movss xmm0, dword [ebx+0x5678]
	mov edx, [ebx+0x567c]
	mov eax, [ebp-0x18c]
	add eax, 0x2b0
	mov ecx, [ebp-0x18c]
	movss [ecx+0x2b0], xmm0
	movss xmm1, dword [_float_1_00000000]
	subss xmm1, xmm0
	movss xmm0, dword [_float_1_00000000]
	divss xmm0, xmm1
	movss [eax+0x4], xmm0
	mov dword [eax+0x8], 0x0
	mov [eax+0xc], edx
	mov edx, [ebx+0x5680]
	mov eax, ecx
	add eax, 0x2c0
	mov dword [ecx+0x2c0], 0x0
	mov dword [eax+0x4], 0x0
	mov dword [eax+0x8], 0x0
	mov [eax+0xc], edx
	mov ebx, [ebp-0x104]
R_RenderScene_260:
	mov [esp], ebx
	call R_UsingGlow
	test al, al
	jz R_RenderScene_270
	mov ebx, com_statmon
	mov eax, [ebx]
	cmp byte [eax+0xc], 0x0
	jnz R_RenderScene_280
R_RenderScene_940:
	cmp byte [eax+0xc], 0x0
	jnz R_RenderScene_290
R_RenderScene_750:
	mov eax, [ebp-0x18c]
	add eax, 0x220
	movss xmm0, dword [_float_0_98437500]
	mov esi, [ebp-0xec]
	mulss xmm0, [esi+0x138]
	mov edx, [ebp-0x18c]
	movss [edx+0x220], xmm0
	xor edx, edx
	mov [eax+0x4], edx
	mov [eax+0x8], edx
	mov [eax+0xc], edx
	mov ecx, [ebp-0x11c]
	lea ebx, [ecx+ecx*2]
	shl ebx, 0x4
	add ebx, gfxMeshGlob
	mov esi, [ebp-0x104]
	mov [esi+0x6300], ebx
	cvtsi2ss xmm0, dword [esi+0x154]
	movss [ebp-0x118], xmm0
	cvtsi2ss xmm1, dword [esi+0x158]
	movss [ebp-0x114], xmm1
	cvtsi2ss xmm2, dword [esi+0x15c]
	movss [ebp-0x110], xmm2
	cvtsi2ss xmm3, dword [esi+0x160]
	movss [ebp-0x10c], xmm3
	ucomiss xmm0, [ebx]
	jnz R_RenderScene_300
	jp R_RenderScene_300
	ucomiss xmm1, [ebx+0x4]
	jnz R_RenderScene_300
	jp R_RenderScene_300
	ucomiss xmm2, [ebx+0x8]
	jnz R_RenderScene_300
	jp R_RenderScene_300
	ucomiss xmm3, [ebx+0xc]
	jp R_RenderScene_300
	jz R_RenderScene_310
R_RenderScene_300:
	call R_SyncRenderThread
	mov dword [esp+0x24], 0xffffffff
	mov eax, 0x3f800000
	mov [esp+0x20], eax
	mov [esp+0x1c], eax
	xor eax, eax
	mov [esp+0x18], eax
	mov [esp+0x14], eax
	movss xmm6, dword [ebp-0x10c]
	movss [esp+0x10], xmm6
	movss xmm0, dword [ebp-0x110]
	movss [esp+0xc], xmm0
	movss xmm1, dword [ebp-0x114]
	movss [esp+0x8], xmm1
	movss xmm2, dword [ebp-0x118]
	movss [esp+0x4], xmm2
	mov [esp], ebx
	call R_SetQuadMesh
R_RenderScene_310:
	mov eax, [ebp-0x134]
	mov [esp], eax
	call R_SetupWorldSurfacesDpvs
	mov edx, [ebp-0x104]
	mov [esp], edx
	call R_SetViewFrustumPlanes
	mov ecx, [ebp-0x134]
	add ecx, 0x100
	mov [ebp-0x12c], ecx
	mov [esp], ecx
	call R_CellForPoint
	mov ebx, eax
	mov dword [esp+0x4], _cstring_filter_entities
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov [esp], ebx
	call R_FilterEntitiesIntoCells
	mov dword [esp+0x4], _cstring_draw_surfs
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov [esp+0x4], ebx
	mov ebx, [ebp-0x134]
	mov [esp], ebx
	call R_AddWorldSurfacesDpvs
	call R_BeginAllStaticModelLighting
	mov esi, [ebp-0x104]
	mov dword [esi+0x55e0], 0x0
	mov eax, r_dlightLimit
	mov eax, [eax]
	mov ebx, [eax+0xc]
	test ebx, ebx
	jz R_RenderScene_320
	mov eax, gfxDrawMethod
	cmp dword [eax], 0x3
	jz R_RenderScene_330
R_RenderScene_320:
	xor eax, eax
R_RenderScene_650:
	test eax, eax
	jnz R_RenderScene_340
R_RenderScene_780:
	mov eax, dx_ctx
	cmp byte [eax+0x2c6c], 0x0
	jz R_RenderScene_350
	xor edi, edi
R_RenderScene_720:
	mov dword [esp+0x4], _cstring_bsp_surfaces
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov eax, gfxDrawMethod
	cmp dword [eax], 0x3
	jz R_RenderScene_360
	mov ebx, rgp
	mov edx, [ebx+0x20a0]
	mov dword [esp+0x8], 0x0
	mov eax, [edx+0x254]
	mov [esp+0x4], eax
	mov eax, [edx+0x250]
	mov [esp], eax
	call R_AddAllBspDrawSurfacesCameraNonlit
	mov edx, [ebx+0x20a0]
	mov dword [esp+0x8], 0x3
	mov eax, [edx+0x25c]
	mov [esp+0x4], eax
	mov eax, [edx+0x258]
	mov [esp], eax
	call R_AddAllBspDrawSurfacesCameraNonlit
	mov [ebp-0x190], ebx
	mov ecx, ebx
R_RenderScene_900:
	mov edx, [ecx+0x20a0]
	mov dword [esp+0x8], 0x9
	mov eax, [edx+0x264]
	mov [esp+0x4], eax
	mov eax, [edx+0x260]
	mov [esp], eax
	call R_AddAllBspDrawSurfacesCameraNonlit
	call R_AddAllStaticModelSurfacesCamera
	mov dword [esp+0x4], _cstring_pieces_surfs
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov ebx, [ebp-0x104]
	mov eax, [ebx+0x13a0]
	mov [esp], eax
	call DynEntPieces_AddDrawSurfs
	mov dword [esp+0x4], _cstring_draw_all_dyn_ent
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov [esp], ebx
	call R_DrawAllDynEnt
	mov eax, gfxDrawMethod
	cmp dword [eax], 0x3
	jz R_RenderScene_370
R_RenderScene_910:
	mov dword [esp+0x4], _cstring_waitfx
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov dword [esp+0x4], _cstring_draw_all_scene_e
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov eax, [ebp-0x104]
	mov [esp], eax
	call R_DrawAllSceneEnt
	mov edx, [ebp-0x104]
	mov [ebp-0x1c], edx
	lea eax, [ebp-0x1c]
	mov [esp+0x4], eax
	mov dword [esp], 0x8
	call R_AddWorkerCmd
	call R_SortAllStaticModelSurfacesCamera
	mov dword [esp+0x4], _cstring_r_getvisibledlig
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov eax, r_dlightLimit
	mov eax, [eax]
	mov ecx, [eax+0xc]
	test ecx, ecx
	jz R_RenderScene_380
	mov eax, gfxDrawMethod
	cmp dword [eax], 0x3
	jz R_RenderScene_390
R_RenderScene_380:
	xor eax, eax
R_RenderScene_640:
	test eax, eax
	jnz R_RenderScene_400
	mov dword [ebp-0x108], 0x0
R_RenderScene_770:
	mov eax, [ebp-0x104]
	mov edx, [eax+0x55e0]
	test edx, edx
	jz R_RenderScene_410
	mov edx, eax
	mov eax, [scene+0x11ca64]
	mov [edx+0x55d8], eax
	mov dword [edx+0x55dc], scene+0x11ca68
	mov ecx, [ebp-0x104]
	mov dword [ecx+0x1390], 0x0
	mov eax, gfxDrawMethod
	cmp dword [eax], 0x3
	jz R_RenderScene_420
R_RenderScene_660:
	call R_SetAllStaticModelLighting
	mov dword [esp+0x4], _cstring_emit_cookie_surf
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov esi, [ebp-0x104]
	mov [esp], esi
	call R_EmitShadowCookieSurfs
	mov eax, edi
	test al, al
	jnz R_RenderScene_430
R_RenderScene_810:
	mov esi, [ebp-0x104]
	add esi, 0x6304
	mov [esp], esi
	call R_InitDrawSurfListInfo
	mov edx, gfxDrawMethod
	mov eax, [edx+0x4]
	mov [esi+0x8], eax
	mov ecx, [ebp-0x104]
	mov [esi+0xc], ecx
	mov edx, ecx
	add edx, 0x6314
	mov ebx, [ebp-0xec]
	add ebx, 0x100
	mov [ebp-0x100], ebx
	mov ecx, [ebp-0xec]
	mov eax, [ecx+0x100]
	mov ebx, [ebp-0x104]
	mov [ebx+0x6314], eax
	add ecx, 0x104
	mov [ebp-0xfc], ecx
	mov ecx, [ebp-0xec]
	mov eax, [ecx+0x104]
	mov [edx+0x4], eax
	add ecx, 0x108
	mov [ebp-0xf8], ecx
	mov ebx, [ebp-0xec]
	mov eax, [ebx+0x108]
	mov [edx+0x8], eax
	add ebx, 0x10c
	mov [ebp-0xf4], ebx
	mov ecx, [ebp-0xec]
	mov eax, [ecx+0x10c]
	mov [edx+0xc], eax
	mov dword [esi+0x24], 0x1
	mov ebx, frontEndDataOut
	mov eax, [ebx]
	mov edi, [eax+0x118254]
	mov [esp+0x8], esi
	mov dword [esp+0x4], 0x3
	mov dword [esp], 0x0
	call R_MergeAndEmitDrawSurfLists
	mov eax, [ebx]
	lea eax, [eax+edi*8+0x70000]
	mov edx, [ebp-0x104]
	mov [edx+0x6304], eax
	mov eax, [ebx]
	mov eax, [eax+0x118254]
	sub eax, edi
	mov [esi+0x4], eax
	mov eax, r_dlightLimit
	mov eax, [eax]
	mov eax, [eax+0xc]
	test eax, eax
	jz R_RenderScene_440
	mov ecx, gfxDrawMethod
	cmp dword [ecx], 0x3
	jz R_RenderScene_450
R_RenderScene_440:
	xor eax, eax
R_RenderScene_630:
	test eax, eax
	jnz R_RenderScene_460
R_RenderScene_820:
	mov edx, [ebp-0x104]
	mov [edx+0x5590], eax
	mov eax, [edx+0x13a0]
	test eax, eax
	jz R_RenderScene_470
R_RenderScene_800:
	mov ecx, [ebp-0x104]
	mov eax, [ecx+0x13a0]
	mov [esp], eax
	call FX_RunPhysics
	mov ebx, [ebp-0x104]
	mov eax, [ebx+0x13a0]
	mov [esp], eax
	call DynEntCl_ProcessEntities
	mov eax, dx_ctx
	cmp byte [eax+0x2c6c], 0x0
	jnz R_RenderScene_480
	mov eax, fx_marks
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_RenderScene_480
	mov eax, fx_marks_smodels
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jnz R_RenderScene_490
R_RenderScene_1070:
	mov eax, fx_marks_ents
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jnz R_RenderScene_500
R_RenderScene_480:
	mov dword [esp+0x4], _cstring_sort_fx_surfs
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov eax, [scene+0xe4120]
	mov [esp+0x4], eax
	mov eax, [scene+0xe41a8]
	mov [esp], eax
	call R_SortDrawSurfs
	mov ebx, [ebp-0x104]
	add ebx, 0x632c
	mov [esp], ebx
	call R_InitDrawSurfListInfo
	mov edi, gfxDrawMethod
	mov eax, [edi+0x4]
	mov [ebx+0x8], eax
	mov edx, [ebp-0x104]
	mov [ebx+0xc], edx
	mov edx, [ebp-0x104]
	add edx, 0x633c
	mov ecx, [ebp-0x100]
	mov eax, [ecx]
	mov esi, [ebp-0x104]
	mov [esi+0x633c], eax
	mov ecx, [ebp-0xfc]
	mov eax, [ecx]
	mov [edx+0x4], eax
	mov esi, [ebp-0xf8]
	mov eax, [esi]
	mov [edx+0x8], eax
	mov ecx, [ebp-0xf4]
	mov eax, [ecx]
	mov [edx+0xc], eax
	mov dword [ebx+0x24], 0x1
	mov esi, frontEndDataOut
	mov eax, [esi]
	mov esi, [eax+0x118254]
	mov [esp+0x8], ebx
	mov dword [esp+0x4], 0x6
	mov dword [esp], 0x3
	call R_MergeAndEmitDrawSurfLists
	mov edx, frontEndDataOut
	mov eax, [edx]
	lea eax, [eax+esi*8+0x70000]
	mov ecx, [ebp-0x104]
	mov [ecx+0x632c], eax
	mov eax, [edx]
	mov eax, [eax+0x118254]
	sub eax, esi
	mov [ebx+0x4], eax
	mov dword [esp+0x4], _cstring_sort_fx_surfs
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov eax, [scene+0xe4138]
	mov [esp+0x4], eax
	mov eax, [scene+0xe41c0]
	mov [esp], eax
	call R_SortDrawSurfs
	mov ebx, [ebp-0x104]
	add ebx, 0x6354
	mov [ebp-0xf0], ebx
	mov [esp], ebx
	call R_InitDrawSurfListInfo
	mov eax, [edi+0x8]
	cmp eax, 0x5
	jz R_RenderScene_510
R_RenderScene_930:
	mov edx, [ebp-0xf0]
	mov [edx+0x8], eax
	mov ecx, [ebp-0x104]
	mov [edx+0xc], ecx
	mov edx, [ebp-0xf0]
	add edx, 0x10
	mov ebx, [ebp-0x100]
	mov eax, [ebx]
	mov esi, [ebp-0xf0]
	mov [esi+0x10], eax
	mov ecx, [ebp-0xfc]
	mov eax, [ecx]
	mov [edx+0x4], eax
	mov ebx, [ebp-0xf8]
	mov eax, [ebx]
	mov [edx+0x8], eax
	mov esi, [ebp-0xf4]
	mov eax, [esi]
	mov [edx+0xc], eax
	mov eax, [ebp-0xf0]
	mov dword [eax+0x24], 0x1
	mov edx, [ebp-0x104]
	mov eax, [edx+0x55e0]
	test eax, eax
	jz R_RenderScene_520
	mov eax, edx
	add eax, 0x5598
	mov ecx, [ebp-0xf0]
	mov [ecx+0x20], eax
R_RenderScene_520:
	mov ebx, frontEndDataOut
	mov eax, [ebx]
	mov esi, [eax+0x118254]
	mov eax, [ebp-0xf0]
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x6
	mov dword [esp], 0x9
	call R_MergeAndEmitDrawSurfLists
	mov eax, [ebx]
	lea edx, [eax+esi*8+0x70000]
	mov ecx, [ebp-0xf0]
	mov [ecx], edx
	mov eax, [ebx]
	mov edi, [eax+0x118254]
	sub edi, esi
	mov [ecx+0x4], edi
	mov ebx, [ebp-0x104]
	cmp byte [ebx+0x13a8], 0x0
	jnz R_RenderScene_10
	test edi, edi
	jz R_RenderScene_530
	mov ebx, [ebp-0xf0]
	mov esi, [ebx+0x8]
	mov ecx, edx
	xor ebx, ebx
	mov eax, rgp
	mov [ebp-0x190], eax
R_RenderScene_560:
	movzx edx, byte [ecx+0x3]
	shr dl, 0x5
	movzx edx, dl
	movzx eax, byte [ecx+0x4]
	shl eax, 0x3
	or eax, edx
	mov edx, [ebp-0x190]
	mov eax, [edx+eax*4]
	mov eax, [eax+0x40]
	mov eax, [eax+0x8]
	mov eax, [eax+esi*4+0xc]
	test eax, eax
	jz R_RenderScene_540
	test byte [eax+0x4], 0x20
	jnz R_RenderScene_550
R_RenderScene_540:
	add ebx, 0x1
	add ecx, 0x8
	cmp edi, ebx
	jnz R_RenderScene_560
R_RenderScene_530:
	xor eax, eax
R_RenderScene_990:
	mov ecx, [ebp-0x104]
	mov [ecx+0x13a8], al
R_RenderScene_10:
	add esp, 0x1cc
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_RenderScene_100:
	mov eax, ecx
	shr eax, 1
	mov edx, ecx
	and edx, 0x1
	or eax, edx
	cvtsi2ss xmm0, eax
	addss xmm0, xmm0
	jmp R_RenderScene_570
R_RenderScene_70:
	mov eax, sc_enable
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	setnz al
	movzx eax, al
	mov [ebp-0x128], eax
	mov eax, r_rendererInUse
	mov eax, [eax]
	cmp dword [eax+0xc], 0x1
	setz al
	movzx eax, al
	mov esi, rg
	mov [esi+0x22e0], eax
	test eax, eax
	jnz R_RenderScene_580
R_RenderScene_80:
	call _ZN10MacDisplay10Is1900CardEv
	cmp al, 0x1
	sbb eax, eax
	and eax, 0x200
	add eax, 0x200
	mov ecx, rg
	mov [ecx+0x22ec], eax
	mov eax, 0x3f800000
	mov [ecx+0x22e4], eax
	mov [ecx+0x22e8], eax
	mov dword [ecx+0x22f0], 0x40800000
	mov ebx, ecx
	jmp R_RenderScene_590
R_RenderScene_30:
	mov eax, [esi+0x18]
	mov [ebx+0x21f8], eax
	mov eax, [esi+0x1c]
	mov [ebx+0x21fc], eax
	mov eax, [esi+0x20]
	mov [ebx+0x2200], eax
	jmp R_RenderScene_600
R_RenderScene_170:
	movss xmm0, dword [_float_1024_00000000]
	jmp R_RenderScene_610
R_RenderScene_60:
	mov eax, 0x1
	jmp R_RenderScene_620
R_RenderScene_450:
	mov eax, 0x1
	jmp R_RenderScene_630
R_RenderScene_390:
	mov eax, 0x1
	jmp R_RenderScene_640
R_RenderScene_330:
	mov eax, 0x1
	jmp R_RenderScene_650
R_RenderScene_410:
	mov ecx, eax
	mov dword [ecx+0x1390], 0x0
	mov eax, gfxDrawMethod
	cmp dword [eax], 0x3
	jnz R_RenderScene_660
R_RenderScene_420:
	cmp dword [ebp-0x128], 0x2
	jz R_RenderScene_670
	cmp dword [ebp-0x128], 0x1
	jnz R_RenderScene_660
	mov edx, [ebp-0x104]
	mov eax, [edx+0x13a0]
	mov [ebp-0x34], eax
	mov ecx, [ebp-0x134]
	mov [ebp-0x40], ecx
	mov ebx, [ebp-0xec]
	mov [ebp-0x3c], ebx
	mov eax, edx
	add eax, 0x190
	mov [ebp-0x38], eax
	lea eax, [ebp-0x40]
	mov [esp+0x4], eax
	mov dword [esp], 0xa
	call R_AddWorkerCmd
	jmp R_RenderScene_660
R_RenderScene_240:
	mov eax, [ebp-0x8c]
	mov ecx, [ebp-0x104]
	mov [ecx+0x5674], eax
	mov eax, [ebp-0x88]
	mov [ecx+0x5678], eax
	mov eax, [ebp-0x84]
	mov [ecx+0x567c], eax
	mov eax, [ebp-0x80]
	mov [ecx+0x5680], eax
	mov eax, [ebp-0x7c]
	mov [ecx+0x5684], eax
	jmp R_RenderScene_680
R_RenderScene_230:
	movss xmm2, dword [_float_0_00024414]
	movaps xmm0, xmm2
	subss xmm0, xmm1
	pxor xmm3, xmm3
	ucomiss xmm0, xmm3
	jb R_RenderScene_690
	movaps xmm1, xmm2
	movss xmm0, dword [_float_4096_00000000]
R_RenderScene_1010:
	subss xmm0, [_float_1_00000000]
	movss [ebp-0x120], xmm0
	movaps xmm7, xmm1
	mulss xmm7, xmm4
	addss xmm6, [_float_0_50000000]
	mulss xmm4, [_float__0_50000000]
	addss xmm6, xmm4
	mov eax, [ebp-0x104]
	cmp byte [eax+0x5658], 0x0
	jz R_RenderScene_700
	xorps xmm7, [_data16_80000000]
	addss xmm6, [_float_1_00000000]
	mov eax, [ebp-0x104]
R_RenderScene_700:
	add eax, 0x565c
	movaps xmm5, xmm7
	mov edx, [ebp-0x104]
	mulss xmm5, [edx+0x565c]
	movss xmm2, dword [eax+0x4]
	movss xmm3, dword [eax+0x8]
	mov eax, edx
	add eax, 0x5668
	movss xmm0, dword [edx+0x5668]
	subss xmm0, [edx+0x565c]
	movss xmm1, dword [eax+0x4]
	subss xmm1, xmm2
	movss xmm4, dword [eax+0x8]
	subss xmm4, xmm3
	mov eax, [ebp-0x18c]
	add eax, 0x2d0
	mov ecx, [ebp-0x18c]
	movss [ecx+0x2d0], xmm6
	movss [eax+0x4], xmm6
	movss [eax+0x8], xmm6
	movss xmm6, dword [ebp-0x120]
	movss [eax+0xc], xmm6
	mov eax, ecx
	add eax, 0x2e0
	movss [ecx+0x2e0], xmm5
	mulss xmm2, xmm7
	movss [eax+0x4], xmm2
	mulss xmm3, xmm7
	movss [eax+0x8], xmm3
	mov dword [eax+0xc], 0x0
	add eax, 0x10
	mulss xmm0, xmm7
	movss [ecx+0x2f0], xmm0
	mulss xmm1, xmm7
	movss [eax+0x4], xmm1
	mulss xmm7, xmm4
	movss [eax+0x8], xmm7
	mov dword [eax+0xc], 0x0
	jmp R_RenderScene_710
R_RenderScene_350:
	mov eax, r_pretess
	mov eax, [eax]
	movzx edi, byte [eax+0xc]
	mov ecx, edi
	test cl, cl
	jz R_RenderScene_720
	call R_BeginPreTess
	jmp R_RenderScene_720
R_RenderScene_180:
	mov eax, r_dof_enable
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_RenderScene_730
	mov eax, [ebp-0xd8]
	mov edx, [ebp-0x104]
	mov [edx+0x5628], eax
	mov eax, [ebp-0xd4]
	mov [edx+0x562c], eax
	mov eax, [ebp-0xd0]
	mov [edx+0x5630], eax
	mov eax, [ebp-0xcc]
	mov [edx+0x5634], eax
	mov eax, [ebp-0xc8]
	mov [edx+0x5638], eax
	mov eax, [ebp-0xc4]
	mov [edx+0x563c], eax
	mov eax, [ebp-0xc0]
	mov [edx+0x5640], eax
	mov eax, [ebp-0xbc]
	mov [edx+0x5644], eax
	jmp R_RenderScene_740
R_RenderScene_270:
	mov ebx, com_statmon
	mov eax, [ebx]
	cmp byte [eax+0xc], 0x0
	jz R_RenderScene_750
R_RenderScene_290:
	call R_Cinematic_IsStarted
	test al, al
	jz R_RenderScene_750
	mov dword [esp+0x4], 0x1
	mov dword [esp], _cstring_fontsconsolefont
	call R_RegisterFont
	mov ebx, eax
	call R_Cinematic_IsUnderrun
	mov edx, _cstring_cine_underrun
	test al, al
	mov eax, _cstring_cine
	cmovz edx, eax
	mov dword [esp+0x24], 0x0
	mov eax, colorRedFaded
	mov [esp+0x20], eax
	xor eax, eax
	mov [esp+0x1c], eax
	mov dword [esp+0x18], 0x40000000
	mov dword [esp+0x14], 0x3fc00000
	mov dword [esp+0x10], 0x43b40000
	mov [esp+0xc], eax
	mov [esp+0x8], ebx
	mov dword [esp+0x4], 0x7fffffff
	mov [esp], edx
	call R_AddCmdDrawText
	jmp R_RenderScene_750
R_RenderScene_220:
	mov eax, [ebp-0xb8]
	mov esi, [ebp-0x104]
	mov [esi+0x5648], eax
	mov eax, [ebp-0xb4]
	mov [esi+0x564c], eax
	mov eax, [ebp-0xb0]
	mov [esi+0x5650], eax
	mov eax, [ebp-0xac]
	mov [esi+0x5654], eax
	mov eax, [ebp-0xa8]
	mov [esi+0x5658], eax
	mov eax, [ebp-0xa4]
	mov [esi+0x565c], eax
	mov eax, [ebp-0xa0]
	mov [esi+0x5660], eax
	mov eax, [ebp-0x9c]
	mov [esi+0x5664], eax
	mov eax, [ebp-0x98]
	mov [esi+0x5668], eax
	mov eax, [ebp-0x94]
	mov [esi+0x566c], eax
	mov eax, [ebp-0x90]
	mov [esi+0x5670], eax
	jmp R_RenderScene_760
R_RenderScene_400:
	call R_CullDynamicPointLightsInCameraView
	mov dword [esp+0x4], _cstring_lights_partition
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	lea ebx, [ebp-0x30]
	mov [esp], ebx
	call R_GetPointLightPartitions
	mov [ebp-0x108], eax
	test eax, eax
	jz R_RenderScene_770
	mov dword [esp+0x4], _cstring_light_surfs_bsp
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov ecx, [ebp-0x108]
	mov [esp+0x4], ecx
	mov [esp], ebx
	call R_GetBspLightSurfs
	mov dword [esp+0x4], _cstring_light_surfs_smod
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov esi, [ebp-0x108]
	mov [esp+0x4], esi
	mov [esp], ebx
	call R_GetStaticModelLightSurfs
	mov dword [esp+0x4], _cstring_light_surfs_scen
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov [esp+0x4], esi
	mov [esp], ebx
	call R_GetSceneEntLightSurfs
	jmp R_RenderScene_770
R_RenderScene_340:
	call R_CullDynamicSpotLightInCameraView
	test al, al
	jnz R_RenderScene_780
	mov eax, [scene+0x114230]
	mov edx, [ebp-0x104]
	mov [edx+0x5598], eax
	mov eax, [scene+0x114234]
	mov [edx+0x559c], eax
	mov eax, [scene+0x114238]
	mov [edx+0x55a0], eax
	mov eax, [scene+0x11423c]
	mov [edx+0x55a4], eax
	mov eax, [scene+0x114240]
	mov [edx+0x55a8], eax
	mov eax, [scene+0x114244]
	mov [edx+0x55ac], eax
	mov eax, [scene+0x114248]
	mov [edx+0x55b0], eax
	mov eax, [scene+0x11424c]
	mov [edx+0x55b4], eax
	mov eax, [scene+0x114250]
	mov [edx+0x55b8], eax
	mov eax, [scene+0x114254]
	mov [edx+0x55bc], eax
	mov eax, [scene+0x114258]
	mov [edx+0x55c0], eax
	mov eax, [scene+0x11425c]
	mov [edx+0x55c4], eax
	mov eax, [scene+0x114260]
	mov [edx+0x55c8], eax
	mov eax, [scene+0x114264]
	mov [edx+0x55cc], eax
	mov eax, [scene+0x114268]
	mov [edx+0x55d0], eax
	mov eax, [scene+0x11426c]
	mov [edx+0x55d4], eax
	mov dword [edx+0x5594], 0x0
	mov dword [edx+0x55d8], 0x0
	mov dword [edx+0x55dc], 0x0
	mov dword [edx+0x55e0], 0x1
	cmp byte [scene+0x114231], 0x0
	jz R_RenderScene_780
	mov dword [esp+0x4], scene+0x114230
	mov [esp], edx
	call R_AddDynamicShadowableLight
	jmp R_RenderScene_780
R_RenderScene_40:
	mov byte [_ZZ20R_GetAllowShadowMapsvE19sDisableShadowsTest], 0x0
	call _ZN10MacDisplay15SupportsShadowsEv
	xor edx, edx
	test al, al
	movzx eax, byte [g_allowShadowMaps]
	cmovnz edx, eax
	mov [g_allowShadowMaps], dl
	jmp R_RenderScene_790
R_RenderScene_470:
	call CL_UpdateSound
	jmp R_RenderScene_800
R_RenderScene_430:
	call R_EndPreTess
	jmp R_RenderScene_810
R_RenderScene_460:
	mov dword [esp+0x4], _cstring_emit_light_surfs
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov ebx, [ebp-0x12c]
	mov [esp+0xc], ebx
	mov esi, [ebp-0x108]
	mov [esp+0x8], esi
	lea eax, [ebp-0x30]
	mov [esp+0x4], eax
	mov eax, [ebp-0x104]
	mov [esp], eax
	call R_EmitPointLightPartitionSurfs
	jmp R_RenderScene_820
R_RenderScene_360:
	call R_AddAllBspDrawSurfacesCamera
	mov eax, sm_sunEnable
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jnz R_RenderScene_830
	mov eax, rgp
	mov eax, [eax+0x20a0]
	mov ecx, [eax+0xd8]
	test ecx, ecx
	jnz R_RenderScene_840
R_RenderScene_830:
	mov dword [esp+0x8], 0x20
	mov dword [esp+0x4], 0x0
	mov eax, frontEndDataOut
	mov eax, [eax]
	add eax, 0x118230
	mov [esp], eax
	call Com_Memset
	cmp byte [_ZZ20R_GetAllowShadowMapsvE19sDisableShadowsTest], 0x0
	jnz R_RenderScene_850
R_RenderScene_1030:
	mov eax, sm_enable
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_RenderScene_860
	cmp byte [g_allowShadowMaps], 0x0
	jnz R_RenderScene_870
R_RenderScene_860:
	xor eax, eax
R_RenderScene_1000:
	test eax, eax
	jnz R_RenderScene_880
R_RenderScene_1040:
	mov esi, [ebp-0x104]
	mov [esp+0x4], esi
	mov esi, frontEndDataOut
	mov eax, [esi]
	mov [esp], eax
	call R_UpdateDrawMethod
	cmp dword [ebp-0x128], 0x2
	jz R_RenderScene_890
	mov eax, rgp
	mov [ebp-0x190], eax
	mov ecx, eax
	jmp R_RenderScene_900
R_RenderScene_370:
	cmp dword [ebp-0x128], 0x2
	jnz R_RenderScene_910
	mov esi, [ebp-0x190]
	mov eax, [esi+0x20a0]
	mov ecx, [eax+0xd8]
	mov ebx, ecx
	sar ebx, 0x5
	mov eax, frontEndDataOut
	mov edx, [eax]
	and ecx, 0x1f
	mov eax, 0x1
	shl eax, cl
	test [edx+ebx*4+0x118230], eax
	jz R_RenderScene_910
	mov dword [esp+0x4], _cstring_bsp_surfaces
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	call R_AddAllBspDrawSurfacesSunShadow
	mov dword [esp+0x4], _cstring_static_model_sur
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	call R_AddAllStaticModelSurfacesSunShadow
	jmp R_RenderScene_910
R_RenderScene_510:
	mov esi, [ebp-0x104]
	mov edx, [esi+0x55e0]
	test edx, edx
	jz R_RenderScene_920
	mov eax, r_spotLightShadows
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_RenderScene_920
	mov eax, comWorld
	mov ecx, [eax+0x8]
	mov ebx, ecx
	sar ebx, 0x5
	mov eax, frontEndDataOut
	mov edx, [eax]
	and ecx, 0x1f
	mov eax, 0x1
	shl eax, cl
	test [edx+ebx*4+0x118230], eax
	jz R_RenderScene_920
	mov eax, 0x6
	jmp R_RenderScene_930
R_RenderScene_920:
	mov eax, 0x5
	jmp R_RenderScene_930
R_RenderScene_280:
	mov dword [esp+0x4], 0x1
	mov dword [esp], _cstring_fontsconsolefont
	call R_RegisterFont
	mov dword [esp+0x24], 0x0
	mov edx, colorRedFaded
	mov [esp+0x20], edx
	xor edx, edx
	mov [esp+0x1c], edx
	mov dword [esp+0x18], 0x40000000
	mov dword [esp+0x14], 0x3fc00000
	mov dword [esp+0x10], 0x43aa0000
	mov [esp+0xc], edx
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x7fffffff
	mov dword [esp], _cstring_glow
	call R_AddCmdDrawText
	mov eax, [ebx]
	jmp R_RenderScene_940
R_RenderScene_730:
	mov edi, [ebp-0x104]
	add edi, 0x5628
	cld
	mov ecx, 0x8
	xor eax, eax
	rep stosd
	jmp R_RenderScene_740
R_RenderScene_210:
	mov dword [esp+0x4], 0x1
	mov dword [esp], _cstring_fontsconsolefont
	call R_RegisterFont
	mov dword [esp+0x24], 0x0
	mov edx, colorRedFaded
	mov [esp+0x20], edx
	xor edx, edx
	mov [esp+0x1c], edx
	mov dword [esp+0x18], 0x40000000
	mov dword [esp+0x14], 0x3fc00000
	mov dword [esp+0x10], 0x43a00000
	mov [esp+0xc], edx
	mov [esp+0x8], eax
	mov dword [esp+0x4], 0x7fffffff
	mov dword [esp], _cstring_dof
	call R_AddCmdDrawText
	jmp R_RenderScene_190
R_RenderScene_200:
	mov dword [esp+0x4], _cstring_depth_of_field_u
	mov dword [esp], 0x1
	call Com_Error
	jmp R_RenderScene_950
R_RenderScene_160:
	mov eax, edi
	shr eax, 1
	and edi, 0x1
	or eax, edi
	cvtsi2ss xmm0, eax
	addss xmm0, xmm0
	jmp R_RenderScene_960
R_RenderScene_150:
	mov eax, esi
	shr eax, 1
	and esi, 0x1
	or eax, esi
	cvtsi2ss xmm1, eax
	addss xmm1, xmm1
	jmp R_RenderScene_970
R_RenderScene_550:
	mov eax, gfxRenderTargets
	mov eax, [eax+0x68]
	test eax, eax
	jz R_RenderScene_980
	mov eax, 0x1
	jmp R_RenderScene_990
R_RenderScene_870:
	mov eax, 0x1
	jmp R_RenderScene_1000
R_RenderScene_840:
	mov edx, ecx
	sar edx, 0x5
	and ecx, 0x1f
	mov eax, 0xfffffffe
	rol eax, cl
	and [edx*4+scene+0xe4000], eax
	jmp R_RenderScene_830
R_RenderScene_980:
	mov dword [esp+0x4], _cstring_renderer_attempt
	mov dword [esp], 0x1
	call Com_Error
	mov eax, 0x1
	jmp R_RenderScene_990
R_RenderScene_690:
	movss xmm0, dword [_float_1_00000000]
	divss xmm0, xmm1
	jmp R_RenderScene_1010
R_RenderScene_20:
	mov dword [esp+0x4], _cstring_r_renderscene_nu
	mov dword [esp], 0x2
	call Com_Error
	jmp R_RenderScene_1020
R_RenderScene_850:
	mov byte [_ZZ20R_GetAllowShadowMapsvE19sDisableShadowsTest], 0x0
	call _ZN10MacDisplay15SupportsShadowsEv
	xor edx, edx
	test al, al
	movzx eax, byte [g_allowShadowMaps]
	cmovnz edx, eax
	mov [g_allowShadowMaps], dl
	jmp R_RenderScene_1030
R_RenderScene_880:
	mov ebx, [ebp-0x104]
	mov [esp], ebx
	call R_ChooseShadowedLights
	jmp R_RenderScene_1040
R_RenderScene_890:
	mov eax, rgp
	mov [ebp-0x190], eax
	mov eax, [eax+0x20a0]
	mov ecx, [eax+0xd8]
	mov ebx, ecx
	sar ebx, 0x5
	mov edx, [esi]
	and ecx, 0x1f
	mov eax, 0x1
	shl eax, cl
	test [edx+ebx*4+0x118230], eax
	jnz R_RenderScene_1050
R_RenderScene_1180:
	mov ecx, [ebp-0x190]
	jmp R_RenderScene_900
R_RenderScene_670:
	mov eax, rgp
	mov eax, [eax+0x20a0]
	mov ecx, [eax+0xd8]
	mov ebx, ecx
	sar ebx, 0x5
	mov eax, frontEndDataOut
	mov edx, [eax]
	and ecx, 0x1f
	mov eax, 0x1
	shl eax, cl
	test [edx+ebx*4+0x118230], eax
	jnz R_RenderScene_1060
R_RenderScene_1170:
	mov esi, [ebp-0x104]
	mov [esp], esi
	call R_GenerateAllSortedSpotShadowDrawSurfs
	jmp R_RenderScene_660
R_RenderScene_490:
	mov eax, rgp
	mov edx, [eax+0x20a0]
	mov eax, [edx+0x270]
	mov [esp+0x8], eax
	mov eax, [edx+0x244]
	mov [esp+0x4], eax
	mov eax, [ebx+0x13a0]
	mov [esp], eax
	call FX_GenerateMarkVertsForStaticModels
	jmp R_RenderScene_1070
R_RenderScene_500:
	lea esi, [ebp-0x20]
	mov [esp+0x4], esi
	mov eax, [scene+0x154c90]
	mov [esp], eax
	call FX_BeginGeneratingMarkVertsForEntModels
	mov eax, [scene+0x12b42c]
	test eax, eax
	jz R_RenderScene_1080
	xor esi, esi
	mov ebx, scene+0x12b430
	jmp R_RenderScene_1090
R_RenderScene_1100:
	add esi, 0x1
	add ebx, 0x7c
	mov eax, [scene+0x12b42c]
	cmp esi, eax
	jz R_RenderScene_1080
R_RenderScene_1090:
	movzx edi, word [ebx+0x6e]
	mov eax, gfxCfg
	cmp edi, [eax+0xc]
	jae R_RenderScene_1100
	test byte [esi+scene+0x13ac30], 0x1
	jz R_RenderScene_1100
	mov eax, [ebx+0x74]
	mov [esp], eax
	call CG_GetPoseLightingHandle
	mov edx, [ebx+0x74]
	mov [esp+0x18], edx
	mov edx, [ebx+0x70]
	mov [esp+0x14], edx
	movzx edx, byte [ebx+0x78]
	mov [esp+0x10], edx
	movzx eax, word [eax]
	mov [esp+0xc], eax
	lea eax, [ebp-0x20]
	mov [esp+0x8], eax
	mov [esp+0x4], edi
	mov eax, [scene+0x154c90]
	mov [esp], eax
	call FX_GenerateMarkVertsForEntDObj
	jmp R_RenderScene_1100
R_RenderScene_1080:
	mov eax, [scene+0x13ba30]
	test eax, eax
	jz R_RenderScene_1110
	xor esi, esi
	mov ebx, scene+0x13ba00
	mov edi, gfxCfg
R_RenderScene_1130:
	movzx edx, word [ebx+0x62]
	cmp edx, [edi+0xc]
	jae R_RenderScene_1120
	test byte [esi+scene+0x14da34], 0x1
	jz R_RenderScene_1120
	movzx ecx, byte [ebx+0x78]
	mov eax, [ebx+0x3c]
	test eax, eax
	jz R_RenderScene_1120
	lea eax, [ebx+0x40]
	mov [esp+0x14], eax
	movzx eax, cl
	mov [esp+0x10], eax
	mov eax, [ebx+0x68]
	movzx eax, word [eax]
	mov [esp+0xc], eax
	lea ecx, [ebp-0x20]
	mov [esp+0x8], ecx
	mov [esp+0x4], edx
	mov eax, [scene+0x154c90]
	mov [esp], eax
	call FX_GenerateMarkVertsForEntXModel
R_RenderScene_1120:
	add esi, 0x1
	add ebx, 0x48
	mov eax, [scene+0x13ba30]
	cmp eax, esi
	jnz R_RenderScene_1130
R_RenderScene_1110:
	mov eax, [scene+0x14f634]
	test eax, eax
	jz R_RenderScene_1140
	xor esi, esi
	mov edi, gfxCfg
	mov ebx, scene+0x14f600
	jmp R_RenderScene_1150
R_RenderScene_1160:
	add esi, 0x1
	add ebx, 0x28
	mov eax, [scene+0x14f634]
	cmp eax, esi
	jz R_RenderScene_1140
R_RenderScene_1150:
	movzx edx, word [ebx+0x3a]
	cmp edx, [edi+0xc]
	jae R_RenderScene_1160
	test byte [esi+scene+0x154638], 0x1
	jz R_RenderScene_1160
	lea eax, [ebx+0x40]
	mov [esp+0x10], eax
	movzx eax, byte [ebx+0x5c]
	mov [esp+0xc], eax
	lea eax, [ebp-0x20]
	mov [esp+0x8], eax
	mov [esp+0x4], edx
	mov eax, [scene+0x154c90]
	mov [esp], eax
	call FX_GenerateMarkVertsForEntBrush
	jmp R_RenderScene_1160
R_RenderScene_1140:
	mov eax, [scene+0x154c90]
	mov [esp], eax
	call FX_EndGeneratingMarkVertsForEntModels
	jmp R_RenderScene_480
R_RenderScene_1060:
	mov dword [esp+0x4], _cstring_scene_ent_surfac
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	call R_AddAllSceneEntSurfacesSunShadow
	call R_SortAllStaticModelSurfacesSunShadow
	mov ebx, [ebp-0x104]
	mov [esp], ebx
	call R_MergeAndEmitSunShadowMapsSurfs
	jmp R_RenderScene_1170
R_RenderScene_1050:
	mov eax, rg
	mov dword [eax+0x22f4], 0x1
	mov ebx, [ebp-0x104]
	add ebx, 0x5690
	mov [esp+0x4], ebx
	mov ecx, [ebp-0x134]
	mov [esp], ecx
	call R_SetupSunShadowMaps
	mov edx, [ebp-0x104]
	add edx, 0x5710
	mov ecx, [ebp-0x18c]
	add ecx, 0x200
	mov esi, [ebp-0x104]
	mov eax, [esi+0x5710]
	mov esi, [ebp-0x18c]
	mov [esi+0x200], eax
	mov eax, [edx+0x4]
	mov [ecx+0x4], eax
	mov eax, [edx+0x8]
	mov [ecx+0x8], eax
	mov eax, [edx+0xc]
	mov [ecx+0xc], eax
	mov edx, [ebp-0x104]
	add edx, 0x5720
	mov ecx, esi
	add ecx, 0x210
	mov esi, [ebp-0x104]
	mov eax, [esi+0x5720]
	mov esi, [ebp-0x18c]
	mov [esi+0x210], eax
	mov eax, [edx+0x4]
	mov [ecx+0x4], eax
	mov eax, [edx+0x8]
	mov [ecx+0x8], eax
	mov eax, [edx+0xc]
	mov [ecx+0xc], eax
	mov [esp], ebx
	call R_SunShadowMaps
	jmp R_RenderScene_1180


;R_WaitEndTime()
R_WaitEndTime:
	push ebp
	mov ebp, esp
	push ebx
	sub esp, 0x14
	mov dword [esp+0x4], _cstring_max_fps_spin
	mov dword [esp], 0xffffffff
	call PIXBeginNamedEvent
	mov ebx, rg
	jmp R_WaitEndTime_10
R_WaitEndTime_20:
	mov dword [esp], 0x1
	call Sys_Sleep
R_WaitEndTime_10:
	call Sys_Milliseconds
	cmp eax, [ebx+0x2268]
	js R_WaitEndTime_20
	add esp, 0x14
	pop ebx
	pop ebp
	ret


;R_SetLodOrigin(refdef_s const*)
R_SetLodOrigin:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x3c
	mov ebx, [ebp+0x8]
	mov esi, r_lockPvs
	mov eax, [esi]
	cmp byte [eax+0xb], 0x0
	jnz R_SetLodOrigin_10
R_SetLodOrigin_200:
	cmp byte [eax+0xc], 0x0
	jz R_SetLodOrigin_20
	mov esi, rg
	mov eax, [lockPvsViewParms+0x100]
	mov [esi+0x21dc], eax
	mov eax, [lockPvsViewParms+0x104]
	mov [esi+0x21e0], eax
	mov eax, [lockPvsViewParms+0x108]
	mov [esi+0x21e4], eax
R_SetLodOrigin_160:
	movss xmm1, dword [_float_2_11867309]
	mulss xmm1, [ebx+0x14]
	mov eax, r_lodBiasRigid
	mov eax, [eax]
	movss xmm2, dword [eax+0xc]
	mov eax, r_lodScaleRigid
	mov eax, [eax]
	movaps xmm0, xmm1
	mulss xmm0, [eax+0xc]
	movss [esi+0x21e8], xmm0
	mulss xmm2, xmm1
	movss [esi+0x21ec], xmm2
	mov eax, r_lodBiasSkinned
	mov eax, [eax]
	movss xmm2, dword [eax+0xc]
	mov eax, r_lodScaleSkinned
	mov eax, [eax]
	movaps xmm0, xmm1
	mulss xmm0, [eax+0xc]
	movss [esi+0x21f0], xmm0
	mulss xmm1, xmm2
	movss [esi+0x21f4], xmm1
	lea edx, [ebx+0x48]
	mov eax, [ebx+0x48]
	mov [scene+0x114220], eax
	mov eax, [edx+0x4]
	mov [scene+0x114224], eax
	mov eax, [edx+0x8]
	mov [scene+0x114228], eax
	mov edx, [ebx+0x54]
	mov [scene+0x114218], edx
	cvtsi2ss xmm0, edx
	mulss xmm0, [_float_0_00100000]
	movss [scene+0x11421c], xmm0
	mov edi, frontEndDataOut
	mov eax, [edi]
	mov eax, [eax+0x11e6c4]
	test eax, eax
	jnz R_SetLodOrigin_30
	mov ecx, [esi+0x21b8]
	cmp edx, ecx
	jge R_SetLodOrigin_40
	mov ebx, [esi+0x21b4]
	mov eax, ecx
	sub eax, ebx
	test eax, eax
	jle R_SetLodOrigin_50
	cvtsi2ss xmm0, eax
	movss xmm6, dword [_float_1_00000000]
R_SetLodOrigin_210:
	sub edx, ebx
	cvtsi2ss xmm2, edx
	divss xmm2, xmm0
	minss xmm6, xmm2
	movaps xmm2, xmm6
	movss xmm1, dword [esi+0x21ac]
	movss xmm0, dword [esi+0x21c0]
	subss xmm0, xmm1
	mulss xmm0, xmm6
	addss xmm1, xmm0
	movss [esi+0x2198], xmm1
	movss xmm1, dword [esi+0x21b0]
	movss xmm0, dword [esi+0x21c4]
	subss xmm0, xmm1
	mulss xmm0, xmm6
	addss xmm1, xmm0
	movss [esi+0x219c], xmm1
	movzx edx, byte [esi+0x21a8]
	cvtsi2ss xmm1, edx
	movzx eax, byte [esi+0x21bc]
	sub eax, edx
	cvtsi2ss xmm0, eax
	mulss xmm0, xmm6
	addss xmm1, xmm0
	cvttss2si eax, xmm1
	mov [esi+0x2194], al
	movzx edx, byte [esi+0x21a9]
	cvtsi2ss xmm1, edx
	movzx eax, byte [esi+0x21bd]
	sub eax, edx
	cvtsi2ss xmm0, eax
	mulss xmm0, xmm6
	addss xmm1, xmm0
	cvttss2si eax, xmm1
	mov [esi+0x2195], al
	movzx edx, byte [esi+0x21aa]
	cvtsi2ss xmm1, edx
	movzx eax, byte [esi+0x21be]
	sub eax, edx
	cvtsi2ss xmm0, eax
	mulss xmm0, xmm6
	addss xmm1, xmm0
	cvttss2si eax, xmm1
	mov [esi+0x2196], al
	movzx edx, byte [esi+0x21ab]
	cvtsi2ss xmm1, edx
	movzx eax, byte [esi+0x21bf]
	sub eax, edx
	cvtsi2ss xmm0, eax
	mulss xmm2, xmm0
	addss xmm1, xmm2
	cvttss2si eax, xmm1
	mov [esi+0x2197], al
R_SetLodOrigin_30:
	mov eax, [esi+0x21c8]
	test eax, eax
	jz R_SetLodOrigin_60
R_SetLodOrigin_180:
	mov edx, [edi]
	mov eax, [esi+0x218c]
	mov [edx+0x11e6a8], eax
	mov eax, [esi+0x2190]
	mov [edx+0x11e6ac], eax
	mov eax, [esi+0x2194]
	mov [edx+0x11e6b0], eax
	mov eax, [esi+0x2198]
	mov [edx+0x11e6b4], eax
	mov eax, [esi+0x219c]
	mov [edx+0x11e6b8], eax
R_SetLodOrigin_190:
	mov ecx, [edi]
	mov eax, rgp
	mov eax, [eax+0x20a0]
	mov eax, [eax+0xc8]
	mov edx, [eax]
	mov [ecx+0x11e6d0], edx
	mov edx, [eax+0x4]
	mov [ecx+0x11e6d4], edx
	mov edx, [eax+0x8]
	mov [ecx+0x11e6d8], edx
	mov edx, [eax+0xc]
	mov [ecx+0x11e6dc], edx
	mov edx, [eax+0x10]
	mov [ecx+0x11e6e0], edx
	mov edx, [eax+0x14]
	mov [ecx+0x11e6e4], edx
	mov edx, [eax+0x18]
	mov [ecx+0x11e6e8], edx
	mov edx, [eax+0x1c]
	mov [ecx+0x11e6ec], edx
	mov edx, [eax+0x20]
	mov [ecx+0x11e6f0], edx
	mov edx, [eax+0x24]
	mov [ecx+0x11e6f4], edx
	mov edx, [eax+0x28]
	mov [ecx+0x11e6f8], edx
	mov edx, [eax+0x2c]
	mov [ecx+0x11e6fc], edx
	mov edx, [eax+0x30]
	mov [ecx+0x11e700], edx
	mov edx, [eax+0x34]
	mov [ecx+0x11e704], edx
	mov edx, [eax+0x38]
	mov [ecx+0x11e708], edx
	mov eax, [eax+0x3c]
	mov [ecx+0x11e70c], eax
	cmp byte [esi+0x2216], 0x0
	jz R_SetLodOrigin_70
	cmp byte [esi+0x2217], 0x0
	jnz R_SetLodOrigin_80
	mov edx, [edi]
	lea ecx, [edx+0x11e6e0]
	mov eax, [esi+0x2224]
	mov [edx+0x11e6e0], eax
	mov eax, [esi+0x2228]
	mov [ecx+0x4], eax
	mov eax, [esi+0x222c]
	mov [ecx+0x8], eax
R_SetLodOrigin_70:
	cmp byte [esi+0x2215], 0x0
	jz R_SetLodOrigin_90
	mov edx, [edi]
	lea ecx, [edx+0x11e6d4]
	mov eax, [esi+0x2218]
	mov [edx+0x11e6d4], eax
	mov eax, [esi+0x221c]
	mov [ecx+0x4], eax
	mov eax, [esi+0x2220]
	mov [ecx+0x8], eax
R_SetLodOrigin_90:
	mov edx, [edi]
	mov eax, sm_enable
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_SetLodOrigin_100
	cmp byte [esi+0x2216], 0x0
	jz R_SetLodOrigin_110
R_SetLodOrigin_130:
	mov eax, 0x1
	mov [edx+0x11822c], eax
	mov edi, [edi]
	cmp byte [esi+0x2216], 0x0
	jz R_SetLodOrigin_120
R_SetLodOrigin_140:
	mov eax, 0x1
R_SetLodOrigin_150:
	mov [edi+0x11e710], eax
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_SetLodOrigin_110:
	mov eax, r_lightTweakSunDirection
	mov eax, [eax]
	lea ebx, [eax+0x2c]
	lea ecx, [eax+0xc]
	movss xmm0, dword [eax+0xc]
	ucomiss xmm0, [eax+0x2c]
	jnz R_SetLodOrigin_130
	jp R_SetLodOrigin_130
	movss xmm0, dword [ecx+0x4]
	ucomiss xmm0, [ebx+0x4]
	jnz R_SetLodOrigin_130
	jp R_SetLodOrigin_130
	movss xmm0, dword [ecx+0x8]
	ucomiss xmm0, [ebx+0x8]
	jp R_SetLodOrigin_130
	jnz R_SetLodOrigin_130
R_SetLodOrigin_100:
	xor eax, eax
	mov [edx+0x11822c], eax
	mov edi, [edi]
	cmp byte [esi+0x2216], 0x0
	jnz R_SetLodOrigin_140
R_SetLodOrigin_120:
	mov eax, r_lightTweakSunDirection
	mov ebx, [eax]
	movss xmm0, dword [ebx+0xc]
	subss xmm0, [ebx+0x2c]
	mulss xmm0, [_float_0_00277778]
	movaps xmm1, xmm0
	addss xmm1, [_float_0_50000000]
	movss [esp], xmm1
	movss [ebp-0x38], xmm0
	call floorf
	fstp dword [ebp-0x1c]
	movss xmm0, dword [ebp-0x38]
	subss xmm0, [ebp-0x1c]
	mulss xmm0, [_float_360_00000000]
	ucomiss xmm0, [_float_5_00000000]
	ja R_SetLodOrigin_140
	movss xmm0, dword [ebx+0x10]
	subss xmm0, [ebx+0x30]
	mulss xmm0, [_float_0_00277778]
	movss xmm1, dword [_float_0_50000000]
	addss xmm1, xmm0
	movss [esp], xmm1
	movss [ebp-0x38], xmm0
	call floorf
	fstp dword [ebp-0x20]
	movss xmm0, dword [ebp-0x38]
	subss xmm0, [ebp-0x20]
	mulss xmm0, [_float_360_00000000]
	ucomiss xmm0, [_float_5_00000000]
	ja R_SetLodOrigin_140
	xor eax, eax
	jmp R_SetLodOrigin_150
R_SetLodOrigin_20:
	lea edx, [ebx+0x18]
	mov esi, rg
	mov eax, [ebx+0x18]
	mov [esi+0x21dc], eax
	mov eax, [edx+0x4]
	mov [esi+0x21e0], eax
	mov eax, [edx+0x8]
	mov [esi+0x21e4], eax
	jmp R_SetLodOrigin_160
R_SetLodOrigin_80:
	mov ecx, [edi]
	lea ebx, [ecx+0x11e6e0]
	mov edx, [esi+0x223c]
	mov eax, [scene+0x114218]
	sub eax, edx
	cvtsi2ss xmm1, eax
	mov eax, [esi+0x2240]
	sub eax, edx
	cvtsi2ss xmm0, eax
	divss xmm1, xmm0
	movss xmm6, dword [_float_1_00000000]
	movaps xmm0, xmm1
	subss xmm0, xmm6
	pxor xmm4, xmm4
	movaps xmm2, xmm4
	cmpss xmm2, xmm0, 0x6
	movaps xmm0, xmm1
	andps xmm0, xmm2
	andnps xmm2, xmm6
	orps xmm2, xmm0
	movaps xmm0, xmm4
	subss xmm0, xmm1
	movaps xmm1, xmm4
	cmpss xmm1, xmm0, 0x6
	andps xmm2, xmm1
	orps xmm2, xmm4
	movss xmm0, dword [esi+0x2224]
	movss xmm5, dword [esi+0x2230]
	subss xmm5, xmm0
	mulss xmm5, xmm2
	addss xmm5, xmm0
	movss [ecx+0x11e6e0], xmm5
	lea edx, [ecx+0x11e6e4]
	movss xmm0, dword [esi+0x2228]
	movss xmm1, dword [esi+0x2234]
	subss xmm1, xmm0
	mulss xmm1, xmm2
	addss xmm1, xmm0
	movss [ebx+0x4], xmm1
	lea eax, [ecx+0x11e6e8]
	movss xmm3, dword [esi+0x222c]
	movss xmm0, dword [esi+0x2238]
	subss xmm0, xmm3
	mulss xmm0, xmm2
	addss xmm0, xmm3
	movss [ebx+0x8], xmm0
	movaps xmm2, xmm5
	mulss xmm2, xmm5
	mulss xmm1, xmm1
	addss xmm2, xmm1
	mulss xmm0, xmm0
	addss xmm2, xmm0
	sqrtss xmm2, xmm2
	movaps xmm0, xmm2
	xorps xmm0, [_data16_80000000]
	ucomiss xmm0, xmm4
	jb R_SetLodOrigin_170
R_SetLodOrigin_220:
	movaps xmm2, xmm6
	mulss xmm5, xmm6
	movss [ebx], xmm5
	movaps xmm0, xmm6
	mulss xmm0, [edx]
	movss [edx], xmm0
	mulss xmm2, [eax]
	movss [eax], xmm2
	jmp R_SetLodOrigin_70
R_SetLodOrigin_40:
	mov eax, [esi+0x21b4]
	mov [esi+0x218c], eax
	mov [esi+0x2190], ecx
	mov eax, [esi+0x21bc]
	mov [esi+0x2194], eax
	mov eax, [esi+0x21c0]
	mov [esi+0x2198], eax
	mov eax, [esi+0x21c4]
	mov [esi+0x219c], eax
	mov eax, [esi+0x21c8]
	test eax, eax
	jnz R_SetLodOrigin_180
R_SetLodOrigin_60:
	mov edx, [edi]
	lea eax, [edx+0x11e6a8]
	mov dword [edx+0x11e6a8], 0x0
	mov dword [eax+0x4], 0x0
	mov dword [eax+0x8], 0x0
	mov dword [eax+0xc], 0x0
	mov dword [eax+0x10], 0x0
	jmp R_SetLodOrigin_190
R_SetLodOrigin_10:
	mov [esp], eax
	call Cvar_ClearModified
	mov edx, lockPvsViewParms
	mov eax, ebx
	call R_SetViewParmsForScene
	mov eax, [esi]
	jmp R_SetLodOrigin_200
R_SetLodOrigin_50:
	movss xmm6, dword [_float_1_00000000]
	movaps xmm0, xmm6
	jmp R_SetLodOrigin_210
R_SetLodOrigin_170:
	divss xmm6, xmm2
	jmp R_SetLodOrigin_220
	nop


;R_UnlinkDynEnt(unsigned int, DynEntityDrawType)
R_UnlinkDynEnt:
	push ebp
	mov ebp, esp
	push esi
	push ebx
	sub esp, 0x10
	mov esi, [ebp+0x8]
	mov ebx, [ebp+0xc]
	mov [esp+0x4], ebx
	mov [esp], esi
	call R_UnfilterDynEntFromCells
	mov [ebp+0xc], ebx
	mov [ebp+0x8], esi
	add esp, 0x10
	pop ebx
	pop esi
	pop ebp
	jmp R_UnlinkDynEntFromPrimaryLights
	nop


;R_UnlinkEntity(unsigned int, unsigned int)
R_UnlinkEntity:
	push ebp
	mov ebp, esp
	push esi
	push ebx
	sub esp, 0x10
	mov esi, [ebp+0x8]
	mov ebx, [ebp+0xc]
	mov [esp+0x4], ebx
	mov [esp], esi
	call R_UnfilterEntFromCells
	mov [ebp+0xc], ebx
	mov [ebp+0x8], esi
	add esp, 0x10
	pop ebx
	pop esi
	pop ebp
	jmp R_UnlinkEntityFromPrimaryLights
	nop


;R_GetBrushModel(unsigned int)
R_GetBrushModel:
	push ebp
	mov ebp, esp
	mov eax, [ebp+0x8]
	mov edx, rgp
	mov ecx, [edx+0x20a0]
	lea edx, [eax*8]
	shl eax, 0x6
	sub eax, edx
	add eax, [ecx+0x154]
	pop ebp
	ret


;R_AddDObjToScene(DObj_s const*, cpose_t const*, unsigned int, unsigned int, float*, float)
R_AddDObjToScene:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x3c
	mov esi, [ebp+0x14]
	movss xmm0, dword [ebp+0x1c]
	ucomiss xmm0, [_float_0_00000000]
	jnz R_AddDObjToScene_10
	jp R_AddDObjToScene_10
	test esi, esi
	jz R_AddDObjToScene_20
R_AddDObjToScene_10:
	mov ebx, frontEndDataOut
	mov eax, [ebx]
	add eax, 0x11825c
	mov dword [esp+0x4], 0x1
	mov [esp], eax
	call InterlockedExchangeAdd
	mov [ebp-0x34], eax
	cmp eax, 0x7f
	ja R_AddDObjToScene_30
	lea eax, [eax*8+0x118260]
	add eax, [ebx]
	movss xmm0, dword [ebp+0x1c]
	movss [eax+0x4], xmm0
	mov [eax], esi
R_AddDObjToScene_70:
	and esi, 0x4
	jnz R_AddDObjToScene_40
	mov eax, [ebp+0x8]
	mov [esp], eax
	call DObjGetTree
	test eax, eax
	jz R_AddDObjToScene_50
R_AddDObjToScene_40:
	mov dword [esp+0x4], 0x1
	mov dword [esp], scene+0x12b42c
	call InterlockedExchangeAdd
	mov edx, eax
	cmp eax, 0x1ff
	ja R_AddDObjToScene_60
	lea eax, [eax*4]
	mov ebx, edx
	shl ebx, 0x7
	sub ebx, eax
	add ebx, scene+0x12b400
	lea edi, [ebx+0x30]
	mov ecx, [ebp+0x8]
	mov [edi+0x70], ecx
	movzx eax, word [ebp+0x10]
	mov [edi+0x6e], ax
	mov eax, [scene+0x154cb4]
	mov ecx, [ebp+0x10]
	mov [eax+ecx*2], dx
	mov eax, [ebp+0xc]
	mov [edi+0x74], eax
	mov edx, [ebp+0x8]
	mov [esp], edx
	call DObjGetRadius
	fstp dword [ebp-0x38]
	lea eax, [ebx+0x4c]
	mov [esp+0x4], eax
	mov ecx, [ebp+0xc]
	mov [esp], ecx
	call CG_GetPoseOrigin
	lea esi, [ebp-0x24]
	mov [esp+0x4], esi
	mov eax, [ebp+0xc]
	mov [esp], eax
	call CG_GetPoseAngles
	lea eax, [ebx+0x3c]
	mov [esp+0x4], eax
	mov [esp], esi
	call AnglesToQuat
	mov dword [edi+0x28], 0x3f800000
	movss xmm1, dword [ebp-0x38]
	xorps xmm1, [_data16_80000000]
	movss xmm3, dword [ebx+0x4c]
	movaps xmm0, xmm1
	addss xmm0, xmm3
	movss [ebx+0x60], xmm0
	movss xmm2, dword [ebx+0x50]
	movaps xmm0, xmm1
	addss xmm0, xmm2
	movss [ebx+0x64], xmm0
	movss xmm0, dword [ebx+0x54]
	addss xmm1, xmm0
	movss [ebx+0x68], xmm1
	addss xmm3, [ebp-0x38]
	movss [ebx+0x6c], xmm3
	addss xmm2, [ebp-0x38]
	movss [ebx+0x70], xmm2
	addss xmm0, [ebp-0x38]
	movss [ebx+0x74], xmm0
	mov edx, [ebp+0x18]
	mov eax, [edx]
	mov [ebx+0x30], eax
	mov eax, [edx+0x4]
	mov [ebx+0x34], eax
	mov eax, [edx+0x8]
	mov [ebx+0x38], eax
	movzx ecx, word [ebp-0x34]
	mov [edi+0x6c], cx
	mov [esp], edi
	call CG_PredictiveSkinCEntity
R_AddDObjToScene_90:
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_AddDObjToScene_20:
	mov dword [ebp-0x34], 0x0
	jmp R_AddDObjToScene_70
R_AddDObjToScene_60:
	mov dword [scene+0x12b42c], 0x200
	mov dword [esp+0x4], 0x200
	mov dword [esp], 0x1
	call R_WarnOncePerFrame
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_AddDObjToScene_30:
	mov eax, [ebx]
	mov dword [eax+0x11825c], 0x80
	mov dword [esp+0x4], 0x80
	mov dword [esp], 0x2
	call R_WarnOncePerFrame
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_AddDObjToScene_50:
	mov edx, [ebp+0x8]
	mov [esp], edx
	call DObjGetNumModels
	sub eax, 0x1
	jnz R_AddDObjToScene_40
	mov dword [esp+0x4], 0x1
	mov dword [esp], scene+0x13ba30
	call InterlockedExchangeAdd
	mov [ebp-0x2c], eax
	cmp eax, 0x3ff
	ja R_AddDObjToScene_80
	lea ebx, [eax+eax*8]
	lea ebx, [ebx*8+scene+0x13ba00]
	lea esi, [ebx+0x34]
	mov dword [esp+0x4], 0x0
	mov edx, [ebp+0x8]
	mov [esp], edx
	call DObjGetModel
	mov edi, eax
	mov [esi+0x4], eax
	mov ecx, [ebp+0x8]
	mov [esi+0x8], ecx
	movzx eax, word [ebp+0x10]
	mov [esi+0x2e], ax
	mov eax, [scene+0x154cb0]
	movzx ecx, word [ebp-0x2c]
	mov edx, [ebp+0x10]
	mov [eax+edx*2], cx
	mov eax, [ebp+0xc]
	mov [esp], eax
	call CG_GetPoseLightingHandle
	mov [esi+0x34], eax
	mov [esp], edi
	call XModelGetRadius
	fstp dword [ebp-0x30]
	lea eax, [ebx+0x50]
	mov [esp+0x4], eax
	mov edx, [ebp+0xc]
	mov [esp], edx
	call CG_GetPoseOrigin
	lea edi, [ebp-0x24]
	mov [esp+0x4], edi
	mov ecx, [ebp+0xc]
	mov [esp], ecx
	call CG_GetPoseAngles
	lea eax, [ebx+0x40]
	mov [esp+0x4], eax
	mov [esp], edi
	call AnglesToQuat
	mov dword [esi+0x28], 0x3f800000
	movss xmm0, dword [ebp-0x30]
	movss [esi+0x30], xmm0
	mov edx, [ebp+0x18]
	mov eax, [edx]
	mov [ebx+0x6c], eax
	mov eax, [edx+0x4]
	mov [ebx+0x70], eax
	mov eax, [edx+0x8]
	mov [ebx+0x74], eax
	movzx ecx, word [ebp-0x34]
	mov [esi+0x2c], cx
	jmp R_AddDObjToScene_90
R_AddDObjToScene_80:
	mov dword [scene+0x13ba30], 0x400
	mov dword [esp+0x4], 0x400
	mov dword [esp], 0x1
	call R_WarnOncePerFrame
	jmp R_AddDObjToScene_90


;R_LinkDObjEntity(unsigned int, unsigned int, float*, float)
R_LinkDObjEntity:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x2c
	mov eax, [ebp+0x8]
	mov [ebp-0x1c], eax
	mov edi, [ebp+0xc]
	mov esi, [ebp+0x10]
	mov ebx, [ebp+0x14]
	mov [esp+0xc], ebx
	mov [esp+0x8], esi
	mov [esp+0x4], edi
	mov [esp], eax
	call R_FilterDObjIntoCells
	mov [ebp+0x14], ebx
	mov [ebp+0x10], esi
	mov [ebp+0xc], edi
	mov eax, [ebp-0x1c]
	mov [ebp+0x8], eax
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	jmp R_LinkSphereEntityToPrimaryLights
	nop


;R_AddDObjSurfaces(GfxSceneEntity*, MaterialTechniqueType, GfxDrawSurf*, GfxDrawSurf*)
R_AddDObjSurfaces:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x4c
	mov ebx, [ebp+0x8]
	mov eax, [ebx+0x68]
	mov [ebp-0x44], eax
	test eax, eax
	jz R_AddDObjSurfaces_10
	mov edx, [ebx+0x70]
	mov [ebp-0x30], edx
	mov [esp], edx
	call DObjGetNumModels
	mov [ebp-0x3c], eax
	movzx eax, word [ebx+0x6c]
	movzx edx, ax
	test ax, ax
	jnz R_AddDObjSurfaces_20
R_AddDObjSurfaces_120:
	mov dword [ebp-0x20], 0x0
R_AddDObjSurfaces_130:
	mov edi, [ebp-0x3c]
	test edi, edi
	jz R_AddDObjSurfaces_10
	mov [ebp-0x1c], ebx
	mov dword [ebp-0x40], 0x0
	mov ecx, ebx
R_AddDObjSurfaces_90:
	movsx esi, byte [ecx+0x48]
	test esi, esi
	js R_AddDObjSurfaces_30
	mov eax, [ebp-0x40]
	mov [esp+0x4], eax
	mov edx, [ebp-0x30]
	mov [esp], edx
	call DObjGetModel
	mov ebx, eax
	mov [esp+0x4], esi
	mov [esp], eax
	call XModelGetSurfCount
	mov [ebp-0x34], eax
	mov [esp+0x4], esi
	mov [esp], ebx
	call XModelGetSkins
	mov [ebp-0x48], eax
	mov esi, [ebp-0x34]
	test esi, esi
	jz R_AddDObjSurfaces_30
	mov dword [ebp-0x38], 0x0
R_AddDObjSurfaces_80:
	mov ecx, [ebp-0x44]
	mov eax, [ecx]
	cmp eax, 0xfffffffe
	jz R_AddDObjSurfaces_40
	cmp eax, 0xfffffffd
	jz R_AddDObjSurfaces_50
	mov dword [ebp-0x28], 0x18
	mov dword [ebp-0x2c], 0x9
R_AddDObjSurfaces_100:
	mov eax, [ebp-0x38]
	mov ecx, [ebp-0x48]
	mov edx, [ecx+eax*4]
	mov eax, [edx+0x40]
	mov eax, [eax+0x8]
	mov ecx, [ebp+0xc]
	mov ebx, [eax+ecx*4+0xc]
	test ebx, ebx
	jz R_AddDObjSurfaces_60
	mov eax, [ebp+0x14]
	cmp [ebp+0x10], eax
	jae R_AddDObjSurfaces_70
	mov eax, frontEndDataOut
	mov ecx, [ebp-0x44]
	sub ecx, [eax]
	mov [ebp-0x24], ecx
	mov esi, [edx+0x8]
	mov edi, [edx+0xc]
	mov ecx, esi
	mov eax, edi
	shr eax, 0x16
	and eax, 0x3f
	sub eax, [ebp-0x20]
	and eax, 0x3f
	shl eax, 0x16
	mov ebx, edi
	and ebx, 0xf03fffff
	or ebx, eax
	shl dword [ebp-0x2c], 0x12
	and ebx, 0xffc3ffff
	or ebx, [ebp-0x2c]
	shr dword [ebp-0x24], 0x2
	mov cx, [ebp-0x24]
	mov eax, [ebp+0x10]
	mov [eax], ecx
	mov [eax+0x4], ebx
	add eax, 0x8
	mov [ebp+0x10], eax
R_AddDObjSurfaces_60:
	mov eax, [ebp-0x28]
R_AddDObjSurfaces_110:
	add dword [ebp-0x38], 0x1
	add [ebp-0x44], eax
	mov edx, [ebp-0x38]
	cmp [ebp-0x34], edx
	jnz R_AddDObjSurfaces_80
R_AddDObjSurfaces_30:
	add dword [ebp-0x40], 0x1
	add dword [ebp-0x1c], 0x1
	mov ecx, [ebp-0x40]
	cmp [ebp-0x3c], ecx
	jbe R_AddDObjSurfaces_10
	mov ecx, [ebp-0x1c]
	jmp R_AddDObjSurfaces_90
R_AddDObjSurfaces_40:
	mov dword [ebp-0x28], 0x38
	mov dword [ebp-0x2c], 0x7
	jmp R_AddDObjSurfaces_100
R_AddDObjSurfaces_50:
	mov eax, 0x4
	jmp R_AddDObjSurfaces_110
R_AddDObjSurfaces_10:
	mov eax, [ebp+0x10]
	add esp, 0x4c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_AddDObjSurfaces_20:
	mov eax, frontEndDataOut
	mov eax, [eax]
	test byte [eax+edx*8+0x118260], 0x2
	jz R_AddDObjSurfaces_120
	mov dword [ebp-0x20], 0x1
	jmp R_AddDObjSurfaces_130
R_AddDObjSurfaces_70:
	mov dword [esp+0x4], _cstring_r_adddobjsurface
	mov dword [esp], 0xf
	call R_WarnOncePerFrame
	jmp R_AddDObjSurfaces_30
	nop


;R_AllocSceneModel()
R_AllocSceneModel:
	push ebp
	mov ebp, esp
	push ebx
	sub esp, 0x14
	mov dword [esp+0x4], 0x1
	mov dword [esp], scene+0x13ba30
	call InterlockedExchangeAdd
	mov ebx, eax
	cmp eax, 0x3ff
	jbe R_AllocSceneModel_10
	mov dword [scene+0x13ba30], 0x400
	mov dword [esp+0x4], 0x400
	mov dword [esp], 0x1
	call R_WarnOncePerFrame
R_AllocSceneModel_10:
	mov eax, ebx
	add esp, 0x14
	pop ebx
	pop ebp
	ret
	add [eax], al


;R_LinkBModelEntity(unsigned int, unsigned int, GfxBrushModel*)
R_LinkBModelEntity:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x1c
	mov edi, [ebp+0x8]
	mov esi, [ebp+0xc]
	mov ebx, [ebp+0x10]
	mov [esp+0x8], ebx
	mov [esp+0x4], esi
	mov [esp], edi
	call R_FilterBModelIntoCells
	lea eax, [ebx+0xc]
	mov [esp+0xc], eax
	mov [esp+0x8], ebx
	mov [esp+0x4], esi
	mov [esp], edi
	call R_LinkBoxEntityToPrimaryLights
	add esp, 0x1c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
	nop


;R_AddBModelSurfaces(BModelDrawInfo*, GfxBrushModel const*, MaterialTechniqueType, GfxDrawSurf*, GfxDrawSurf*)
R_AddBModelSurfaces:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x5c
	mov edi, [ebp+0x14]
	mov eax, [ebp+0x8]
	movzx esi, word [eax]
	mov eax, frontEndDataOut
	mov eax, [eax]
	lea ebx, [eax+esi*4]
	mov eax, r_drawDecals
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_AddBModelSurfaces_10
	mov eax, [ebp+0xc]
	movzx eax, word [eax+0x30]
	mov [ebp-0x1c], eax
R_AddBModelSurfaces_60:
	mov eax, [ebp-0x1c]
	test eax, eax
	jz R_AddBModelSurfaces_20
	cmp edi, [ebp+0x18]
	jae R_AddBModelSurfaces_30
	mov dword [ebp-0x4c], 0x0
R_AddBModelSurfaces_50:
	mov eax, [ebx+0x4]
	mov eax, [eax+0x10]
	mov [ebp-0x3c], eax
	mov ecx, eax
	mov eax, [eax+0x40]
	mov eax, [eax+0x8]
	mov [ebp-0x2c], eax
	mov edx, [ebp+0x10]
	mov eax, [eax+edx*4+0xc]
	test eax, eax
	jz R_AddBModelSurfaces_40
	mov eax, [ecx+0x8]
	mov edx, [ecx+0xc]
	mov ax, si
	and edx, 0xffc3ffff
	or edx, 0x180000
	mov [edi], eax
	mov [edi+0x4], edx
	add edi, 0x8
R_AddBModelSurfaces_40:
	add dword [ebp-0x4c], 0x1
	add ebx, 0x8
	add esi, 0x2
	mov eax, [ebp-0x4c]
	cmp [ebp-0x1c], eax
	jz R_AddBModelSurfaces_20
	cmp edi, [ebp+0x18]
	jb R_AddBModelSurfaces_50
R_AddBModelSurfaces_30:
	mov dword [esp+0x4], _cstring_r_addbmodelsurfa
	mov dword [esp], 0xf
	call R_WarnOncePerFrame
R_AddBModelSurfaces_20:
	mov eax, edi
	add esp, 0x5c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_AddBModelSurfaces_10:
	mov edx, [ebp+0xc]
	movzx edx, word [edx+0x34]
	mov [ebp-0x1c], edx
	jmp R_AddBModelSurfaces_60


;R_AddXModelSurfaces(XModelDrawInfo*, XModel const*, MaterialTechniqueType, GfxDrawSurf*, GfxDrawSurf*)
R_AddXModelSurfaces:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x3c
	mov edx, [ebp+0x8]
	mov esi, [ebp+0xc]
	movzx eax, word [edx+0x2]
	mov [ebp-0x24], eax
	mov eax, frontEndDataOut
	mov eax, [eax]
	mov ecx, [ebp-0x24]
	lea edi, [eax+ecx*4]
	movzx ebx, word [edx]
	mov [esp+0x4], ebx
	mov [esp], esi
	call XModelGetSurfCount
	mov [ebp-0x28], eax
	mov [esp+0x4], ebx
	mov [esp], esi
	call XModelGetSkins
	mov [ebp-0x30], eax
	mov eax, [ebp-0x28]
	test eax, eax
	jz R_AddXModelSurfaces_10
	mov dword [ebp-0x2c], 0x0
	jmp R_AddXModelSurfaces_20
R_AddXModelSurfaces_60:
	mov ebx, [ebp-0x2c]
	mov eax, [ebp-0x30]
	mov ecx, [eax+ebx*4]
	mov eax, [ecx+0x40]
	mov eax, [eax+0x8]
	mov ebx, [ebp+0x10]
	mov eax, [eax+ebx*4+0xc]
	test eax, eax
	jz R_AddXModelSurfaces_30
	mov eax, [ebp+0x14]
	cmp [ebp+0x18], eax
	jbe R_AddXModelSurfaces_40
	cmp edx, 0xfffffffe
	jz R_AddXModelSurfaces_50
	mov dword [ebp-0x20], 0x8
	mov dword [ebp-0x1c], 0x0
R_AddXModelSurfaces_70:
	mov eax, [ecx+0x8]
	mov edx, [ecx+0xc]
	mov ecx, eax
	mov esi, [ebp-0x20]
	and esi, 0xf
	shl esi, 0x12
	mov ebx, edx
	and ebx, 0xffc3ffff
	or ebx, esi
	mov cx, [ebp-0x24]
	mov eax, [ebp+0x14]
	mov [eax], ecx
	mov [eax+0x4], ebx
	add eax, 0x8
	mov [ebp+0x14], eax
R_AddXModelSurfaces_30:
	add dword [ebp-0x24], 0xe
	add edi, 0x38
	add dword [ebp-0x2c], 0x1
	mov ecx, [ebp-0x2c]
	cmp [ebp-0x28], ecx
	jz R_AddXModelSurfaces_10
R_AddXModelSurfaces_20:
	mov edx, [edi]
	cmp edx, 0xfffffffd
	jnz R_AddXModelSurfaces_60
	add dword [ebp-0x24], 0x1
	add edi, 0x4
	add dword [ebp-0x2c], 0x1
	mov ecx, [ebp-0x2c]
	cmp [ebp-0x28], ecx
	jnz R_AddXModelSurfaces_20
R_AddXModelSurfaces_10:
	mov eax, [ebp+0x14]
	add esp, 0x3c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_AddXModelSurfaces_50:
	mov dword [ebp-0x20], 0x7
	mov dword [ebp-0x1c], 0x0
	jmp R_AddXModelSurfaces_70
R_AddXModelSurfaces_40:
	mov dword [esp+0x4], _cstring_r_addxmodelsurfa
	mov dword [esp], 0xf
	call R_WarnOncePerFrame
	jmp R_AddXModelSurfaces_10
	add [eax], al


;R_GetLocalClientNum()
R_GetLocalClientNum:
	push ebp
	mov ebp, esp
	mov eax, [scene+0x154c90]
	pop ebp
	ret


;R_AddOmniLightToScene(float const*, float, float, float, float)
R_AddOmniLightToScene:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x10
	mov ebx, [ebp+0x8]
	movss xmm0, dword [ebp+0xc]
	movss xmm1, dword [ebp+0x10]
	movss [ebp-0x10], xmm1
	movss xmm1, dword [ebp+0x14]
	movss [ebp-0x14], xmm1
	movss xmm1, dword [ebp+0x18]
	movss [ebp-0x18], xmm1
	mov eax, rg
	cmp byte [eax+0x140], 0x0
	jz R_AddOmniLightToScene_10
	mov esi, rgp
	mov ecx, [esi+0x20a0]
	test ecx, ecx
	jz R_AddOmniLightToScene_10
	ucomiss xmm0, [_float_0_00000000]
	jp R_AddOmniLightToScene_20
	jbe R_AddOmniLightToScene_10
R_AddOmniLightToScene_20:
	mov eax, [scene+0x11422c]
	cmp eax, 0x1f
	jg R_AddOmniLightToScene_30
	mov edx, eax
	shl edx, 0x6
	add edx, scene+0x114200
	lea ecx, [edx+0x30]
	mov [ebp-0x1c], ecx
	add eax, 0x1
	mov [scene+0x11422c], eax
	cld
	mov ecx, 0x10
	xor eax, eax
	mov edi, [ebp-0x1c]
	rep stosd
	mov eax, [esi+0x202c]
	mov ecx, [ebp-0x1c]
	mov [ecx+0x3c], eax
	mov byte [edx+0x30], 0x3
	lea ecx, [edx+0x4c]
	mov eax, [ebx]
	mov [edx+0x4c], eax
	mov eax, [ebx+0x4]
	mov [ecx+0x4], eax
	mov eax, [ebx+0x8]
	mov [ecx+0x8], eax
	mov edi, [ebp-0x1c]
	movss [edi+0x28], xmm0
	lea eax, [edx+0x34]
	movss xmm0, dword [ebp-0x10]
	movss [edx+0x34], xmm0
	movss xmm1, dword [ebp-0x14]
	movss [eax+0x4], xmm1
	movss xmm0, dword [ebp-0x18]
	movss [eax+0x8], xmm0
	mov byte [edi+0x1], 0x0
	mov dword [edi+0x38], 0xffffffff
R_AddOmniLightToScene_10:
	add esp, 0x10
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_AddOmniLightToScene_30:
	mov dword [ebp+0x8], 0xa
	add esp, 0x10
	pop ebx
	pop esi
	pop edi
	pop ebp
	jmp R_WarnOncePerFrame
	nop
	add [eax], al


;R_AddSpotLightToScene(float const*, float const*, float, float, float, float)
R_AddSpotLightToScene:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x5c
	mov esi, [ebp+0x8]
	mov eax, [ebp+0xc]
	mov [ebp-0x20], eax
	movss xmm0, dword [ebp+0x10]
	movss [ebp-0x24], xmm0
	movss xmm0, dword [ebp+0x14]
	movss [ebp-0x28], xmm0
	movss xmm0, dword [ebp+0x18]
	movss [ebp-0x2c], xmm0
	movss xmm0, dword [ebp+0x1c]
	movss [ebp-0x30], xmm0
	mov eax, rg
	cmp byte [eax+0x140], 0x0
	jz R_AddSpotLightToScene_10
	mov eax, rgp
	mov edi, [eax+0x20a0]
	test edi, edi
	jz R_AddSpotLightToScene_10
	movss xmm0, dword [ebp-0x24]
	ucomiss xmm0, [_float_0_00000000]
	jp R_AddSpotLightToScene_20
	jbe R_AddSpotLightToScene_10
R_AddSpotLightToScene_20:
	cmp dword [scene+0x11422c], 0x1f
	jg R_AddSpotLightToScene_30
	mov edi, r_spotLightEndRadius
	mov edx, [edi]
	mov ebx, r_spotLightStartRadius
	mov ecx, [ebx]
	movss xmm0, dword [ecx+0xc]
	ucomiss xmm0, [edx+0xc]
	jae R_AddSpotLightToScene_40
R_AddSpotLightToScene_70:
	movss xmm1, dword [ebp-0x24]
	addss xmm1, [ecx+0xc]
	movss xmm0, dword [edx+0xc]
	ucomiss xmm0, xmm1
	jae R_AddSpotLightToScene_50
R_AddSpotLightToScene_60:
	mov eax, [scene+0x11422c]
	mov ebx, eax
	shl ebx, 0x6
	add ebx, scene+0x114200
	lea edi, [ebx+0x30]
	mov [ebp-0x4c], edi
	add eax, 0x1
	mov [scene+0x11422c], eax
	movss xmm2, dword [ecx+0xc]
	movss xmm0, dword [edx+0xc]
	subss xmm0, xmm2
	divss xmm0, dword [ebp-0x24]
	movss [esp], xmm0
	movss [ebp-0x48], xmm2
	call atanf
	fstp dword [ebp-0x34]
	mov eax, r_spotLightFovInnerFraction
	mov eax, [eax]
	movss xmm0, dword [ebp-0x34]
	mulss xmm0, [eax+0xc]
	movss [ebp-0x1c], xmm0
	movss xmm0, dword [ebp-0x34]
	movss [esp], xmm0
	call tanf
	fstp dword [ebp-0x38]
	movss xmm2, dword [ebp-0x48]
	divss xmm2, dword [ebp-0x38]
	cld
	mov ecx, 0x10
	xor eax, eax
	rep stosd
	mov edx, rgp
	mov eax, [edx+0x202c]
	mov ecx, [ebp-0x4c]
	mov [ecx+0x3c], eax
	mov byte [ebx+0x30], 0x2
	lea edx, [ebx+0x4c]
	mov eax, [esi]
	mov [ebx+0x4c], eax
	mov eax, [esi+0x4]
	mov [ebx+0x50], eax
	mov eax, [esi+0x8]
	mov [ebx+0x54], eax
	lea eax, [ebx+0x40]
	movss xmm1, dword [_data16_80000000]
	mov edi, [ebp-0x20]
	movss xmm0, dword [edi]
	xorps xmm0, xmm1
	movss [ebx+0x40], xmm0
	movss xmm0, dword [edi+0x4]
	xorps xmm0, xmm1
	movss [eax+0x4], xmm0
	movss xmm0, dword [edi+0x8]
	xorps xmm0, xmm1
	movss [eax+0x8], xmm0
	movaps xmm0, xmm2
	mulss xmm0, [ebx+0x40]
	addss xmm0, [ebx+0x4c]
	movss [ebx+0x4c], xmm0
	movaps xmm0, xmm2
	mulss xmm0, [eax+0x4]
	addss xmm0, [edx+0x4]
	movss [ebx+0x50], xmm0
	movaps xmm0, xmm2
	mulss xmm0, [eax+0x8]
	addss xmm0, [edx+0x8]
	movss [ebx+0x54], xmm0
	movss xmm0, dword [ebp-0x24]
	addss xmm0, xmm2
	movss [ecx+0x28], xmm0
	lea edx, [ebx+0x34]
	movss xmm0, dword [ebp-0x28]
	movss [ebx+0x34], xmm0
	movss xmm0, dword [ebp-0x2c]
	movss [ebx+0x38], xmm0
	movss xmm0, dword [ebp-0x30]
	movss [ebx+0x3c], xmm0
	mov eax, r_spotLightBrightness
	mov eax, [eax]
	movss xmm0, dword [eax+0xc]
	movaps xmm1, xmm0
	mulss xmm1, [ebx+0x34]
	movss [ebx+0x34], xmm1
	movaps xmm1, xmm0
	mulss xmm1, [edx+0x4]
	movss [ebx+0x38], xmm1
	mulss xmm0, [edx+0x8]
	movss [ebx+0x3c], xmm0
	movss [scene+0x114a50], xmm2
	mov dword [ecx+0x34], 0x1
	movss xmm0, dword [ebp-0x1c]
	movss [esp], xmm0
	call cosf
	mov eax, [ebp-0x4c]
	fstp dword [eax+0x30]
	movss xmm0, dword [ebp-0x34]
	movss [esp], xmm0
	call cosf
	mov eax, [ebp-0x4c]
	fstp dword [eax+0x2c]
	mov eax, r_spotLightShadows
	mov eax, [eax]
	movzx eax, byte [eax+0xc]
	mov edx, [ebp-0x4c]
	mov [edx+0x1], al
	mov dword [edx+0x38], 0xffffffff
R_AddSpotLightToScene_10:
	add esp, 0x5c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_AddSpotLightToScene_30:
	mov dword [ebp+0x8], 0xa
	add esp, 0x5c
	pop ebx
	pop esi
	pop edi
	pop ebp
	jmp R_WarnOncePerFrame
R_AddSpotLightToScene_50:
	subss xmm1, [_float_0_10000000]
	movss [esp+0x4], xmm1
	mov [esp], edx
	call Cvar_SetFloat
	mov edx, [edi]
	mov ecx, [ebx]
	jmp R_AddSpotLightToScene_60
R_AddSpotLightToScene_40:
	addss xmm0, [_float_0_10000000]
	movss [esp+0x4], xmm0
	mov [esp], edx
	call Cvar_SetFloat
	mov edx, [edi]
	mov ecx, [ebx]
	jmp R_AddSpotLightToScene_70
	nop


;R_AddDObjSurfacesCamera(GfxSceneEntity*, unsigned int, unsigned int, GfxDrawSurf**, GfxDrawSurf**)
R_AddDObjSurfacesCamera:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x5c
	mov eax, [ebp+0x8]
	mov eax, [eax+0x68]
	mov [ebp-0x48], eax
	test eax, eax
	jz R_AddDObjSurfacesCamera_10
	mov edx, [ebp+0x8]
	mov edx, [edx+0x70]
	mov [ebp-0x34], edx
	mov [esp], edx
	call DObjGetNumModels
	mov [ebp-0x40], eax
	mov ecx, [ebp+0x8]
	movzx eax, word [ecx+0x6c]
	movzx ebx, ax
	mov [ebp-0x24], ebx
	test ax, ax
	jnz R_AddDObjSurfacesCamera_20
	xor edx, edx
	mov dword [ebp-0x20], 0x0
R_AddDObjSurfacesCamera_110:
	mov ecx, [ebp-0x40]
	test ecx, ecx
	jz R_AddDObjSurfacesCamera_10
	mov ecx, [ebp+0x8]
	mov [ebp-0x1c], ecx
	mov dword [ebp-0x44], 0x0
	movzx ebx, byte [ebp+0x10]
	shl edx, 0x18
	mov [ebp-0x54], edx
	shl ebx, 0xa
	mov [ebp-0x58], ebx
	mov eax, ecx
R_AddDObjSurfacesCamera_90:
	movsx esi, byte [eax+0x48]
	test esi, esi
	js R_AddDObjSurfacesCamera_30
	mov edx, [ebp-0x44]
	mov [esp+0x4], edx
	mov ecx, [ebp-0x34]
	mov [esp], ecx
	call DObjGetModel
	mov ebx, eax
	mov [esp+0x4], esi
	mov [esp], eax
	call XModelGetSurfCount
	mov [ebp-0x38], eax
	mov [esp+0x4], esi
	mov [esp], ebx
	call XModelGetSkins
	mov edx, [ebp-0x38]
	test edx, edx
	jz R_AddDObjSurfacesCamera_30
	mov dword [ebp-0x3c], 0x0
	mov [ebp-0x50], eax
R_AddDObjSurfacesCamera_80:
	mov ebx, [ebp-0x48]
	mov eax, [ebx]
	cmp eax, 0xfffffffe
	jz R_AddDObjSurfacesCamera_40
	cmp eax, 0xfffffffd
	jz R_AddDObjSurfacesCamera_50
	mov dword [ebp-0x2c], 0x18
	mov dword [ebp-0x30], 0x9
R_AddDObjSurfacesCamera_120:
	mov edx, [ebp-0x50]
	mov eax, [edx]
	movzx eax, byte [eax+0x3e]
	movzx edx, al
	cmp al, 0x3
	jz R_AddDObjSurfacesCamera_60
	shl edx, 0x2
	mov ecx, [ebp+0x14]
	add ecx, edx
	mov [ebp-0x4c], ecx
	mov eax, [ecx]
	mov ebx, [ebp+0x18]
	cmp eax, [edx+ebx]
	jae R_AddDObjSurfacesCamera_70
	movzx edx, word [ebp-0x24]
	mov eax, [ebp-0x48]
	mov [eax+0xe], dx
	movzx ecx, word [ebp+0xc]
	mov [eax+0x10], cx
	mov eax, frontEndDataOut
	mov ebx, [ebp-0x48]
	sub ebx, [eax]
	mov [ebp-0x28], ebx
	mov edx, [ebp-0x50]
	mov eax, [edx]
	mov esi, [eax+0x8]
	mov edi, [eax+0xc]
	mov eax, esi
	mov ecx, edi
	shr ecx, 0x16
	and ecx, 0x3f
	sub ecx, [ebp-0x20]
	and ecx, 0x3f
	shl ecx, 0x16
	mov edx, edi
	and edx, 0xf03fffff
	or edx, ecx
	shl dword [ebp-0x30], 0x12
	and edx, 0xffc3ffff
	or edx, [ebp-0x30]
	shr dword [ebp-0x28], 0x2
	mov ax, [ebp-0x28]
	mov ebx, [ebp+0x8]
	movzx ecx, byte [ebx+0x78]
	shl ecx, 0x10
	and eax, 0xff00ffff
	or eax, ecx
	and eax, 0xe0ffffff
	or eax, [ebp-0x54]
	and edx, 0xfffc03ff
	or edx, [ebp-0x58]
	mov ebx, [ebp-0x4c]
	mov ecx, [ebx]
	mov [ecx], eax
	mov [ecx+0x4], edx
	add dword [ebx], 0x8
R_AddDObjSurfacesCamera_60:
	mov eax, [ebp-0x2c]
R_AddDObjSurfacesCamera_130:
	add dword [ebp-0x3c], 0x1
	add dword [ebp-0x50], 0x4
	add [ebp-0x48], eax
	mov eax, [ebp-0x3c]
	cmp [ebp-0x38], eax
	jnz R_AddDObjSurfacesCamera_80
R_AddDObjSurfacesCamera_30:
	add dword [ebp-0x44], 0x1
	add dword [ebp-0x1c], 0x1
	mov edx, [ebp-0x44]
	cmp [ebp-0x40], edx
	jbe R_AddDObjSurfacesCamera_10
	mov eax, [ebp-0x1c]
	jmp R_AddDObjSurfacesCamera_90
R_AddDObjSurfacesCamera_10:
	add esp, 0x5c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_AddDObjSurfacesCamera_20:
	mov eax, frontEndDataOut
	mov eax, [eax]
	mov ecx, [eax+ebx*8+0x118260]
	mov eax, sc_enable
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jnz R_AddDObjSurfacesCamera_100
R_AddDObjSurfacesCamera_140:
	xor edx, edx
R_AddDObjSurfacesCamera_150:
	xor eax, eax
	test cl, 0x2
	setnz al
	mov [ebp-0x20], eax
	jmp R_AddDObjSurfacesCamera_110
R_AddDObjSurfacesCamera_40:
	mov dword [ebp-0x2c], 0x38
	mov dword [ebp-0x30], 0x7
	jmp R_AddDObjSurfacesCamera_120
R_AddDObjSurfacesCamera_50:
	mov eax, 0x4
	jmp R_AddDObjSurfacesCamera_130
R_AddDObjSurfacesCamera_70:
	mov dword [esp+0x4], _cstring_r_adddobjsurface1
	mov dword [esp], 0xf
	call R_WarnOncePerFrame
	jmp R_AddDObjSurfacesCamera_30
R_AddDObjSurfacesCamera_100:
	test ch, 0x1
	jz R_AddDObjSurfacesCamera_140
	mov edx, 0x1
	jmp R_AddDObjSurfacesCamera_150


;R_AddBModelSurfacesCamera(BModelDrawInfo*, GfxBrushModel const*, GfxDrawSurf**, GfxDrawSurf**, unsigned int)
R_AddBModelSurfacesCamera:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x20
	mov ecx, [ebp+0xc]
	mov eax, [ebp+0x10]
	mov [ebp-0x24], eax
	mov edx, [ebp+0x14]
	mov [ebp-0x28], edx
	mov edx, [ebp+0x18]
	mov eax, [ebp+0x8]
	movzx eax, word [eax]
	mov [ebp-0x10], eax
	mov eax, frontEndDataOut
	mov eax, [eax]
	mov ebx, [ebp-0x10]
	lea eax, [eax+ebx*4]
	mov [ebp-0x14], eax
	mov eax, r_drawDecals
	mov eax, [eax]
	cmp byte [eax+0xc], 0x0
	jz R_AddBModelSurfacesCamera_10
	movzx ecx, word [ecx+0x30]
	mov [ebp-0x18], ecx
R_AddBModelSurfacesCamera_60:
	mov eax, [ebp-0x18]
	test eax, eax
	jz R_AddBModelSurfacesCamera_20
	mov dword [ebp-0x1c], 0x0
	movzx edx, dl
	shl edx, 0x10
	mov [ebp-0x2c], edx
R_AddBModelSurfacesCamera_50:
	mov eax, [ebp-0x14]
	mov esi, [eax+0x4]
	mov ecx, [esi+0x10]
	movzx eax, byte [ecx+0x3e]
	movzx edx, al
	cmp al, 0x3
	jz R_AddBModelSurfacesCamera_30
	lea eax, [edx*4]
	mov edx, [ebp-0x24]
	lea edi, [eax+edx]
	mov ebx, [edi]
	mov [ebp-0x20], ebx
	mov edx, [ebp-0x28]
	cmp ebx, [eax+edx]
	jae R_AddBModelSurfacesCamera_40
	mov eax, [ecx+0x8]
	mov edx, [ecx+0xc]
	mov ax, [ebp-0x10]
	and edx, 0xffc3ffff
	or edx, 0x180000
	movzx ecx, byte [esi+0x14]
	and ecx, 0x1f
	shl ecx, 0x18
	and eax, 0xe0ffffff
	or eax, ecx
	and eax, 0xff00ffff
	or eax, [ebp-0x2c]
	movzx ecx, byte [esi+0x16]
	shl ecx, 0xa
	and ecx, 0x3fc00
	and edx, 0xfffc03ff
	or edx, ecx
	mov ecx, [ebp-0x20]
	mov [ecx], eax
	mov [ecx+0x4], edx
	add dword [edi], 0x8
R_AddBModelSurfacesCamera_30:
	add dword [ebp-0x1c], 0x1
	add dword [ebp-0x14], 0x8
	add dword [ebp-0x10], 0x2
	mov ebx, [ebp-0x1c]
	cmp [ebp-0x18], ebx
	jnz R_AddBModelSurfacesCamera_50
R_AddBModelSurfacesCamera_20:
	add esp, 0x20
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_AddBModelSurfacesCamera_10:
	movzx ecx, word [ecx+0x34]
	mov [ebp-0x18], ecx
	jmp R_AddBModelSurfacesCamera_60
R_AddBModelSurfacesCamera_40:
	mov dword [ebp+0xc], _cstring_r_addbmodelsurfa1
	mov dword [ebp+0x8], 0xf
	add esp, 0x20
	pop ebx
	pop esi
	pop edi
	pop ebp
	jmp R_WarnOncePerFrame


;R_AddParticleCloudToScene(Material*)
R_AddParticleCloudToScene:
	push ebp
	mov ebp, esp
	push esi
	push ebx
	sub esp, 0x10
	mov esi, frontEndDataOut
	mov eax, [esi]
	add eax, 0x118660
	mov [esp], eax
	call InterlockedIncrement
	lea ebx, [eax-0x1]
	cmp ebx, 0xff
	jbe R_AddParticleCloudToScene_10
	mov eax, [esi]
	add eax, 0x118660
	mov [esp], eax
	call InterlockedDecrement
	mov dword [esp], 0x9
	call R_WarnOncePerFrame
	xor eax, eax
	add esp, 0x10
	pop ebx
	pop esi
	pop ebp
	ret
R_AddParticleCloudToScene_10:
	mov eax, [ebp+0x8]
	mov [esp+0x4], eax
	mov [esp], ebx
	call R_AddParticleCloudDrawSurf
	test al, al
	jz R_AddParticleCloudToScene_20
	shl ebx, 0x6
	lea eax, [ebx+0x6c000]
	add eax, [esi]
	add esp, 0x10
	pop ebx
	pop esi
	pop ebp
	ret
R_AddParticleCloudToScene_20:
	xor eax, eax
	add esp, 0x10
	pop ebx
	pop esi
	pop ebp
	ret


;R_AddXModelSurfacesCamera(XModelDrawInfo*, XModel const*, float*, unsigned int, unsigned int, unsigned int, int, int, GfxDrawSurf**, GfxDrawSurf**, unsigned int)
R_AddXModelSurfacesCamera:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x6c
	mov edx, [ebp+0x8]
	mov esi, [ebp+0xc]
	mov eax, [ebp+0x14]
	mov [ebp-0x38], eax
	mov ecx, [ebp+0x18]
	mov [ebp-0x3c], ecx
	mov ebx, [ebp+0x1c]
	mov [ebp-0x40], ebx
	mov eax, [ebp+0x20]
	mov [ebp-0x44], eax
	mov ecx, [ebp+0x24]
	mov [ebp-0x48], ecx
	mov ebx, [ebp+0x28]
	mov [ebp-0x4c], ebx
	mov eax, [ebp+0x2c]
	mov [ebp-0x50], eax
	mov edi, [ebp+0x30]
	movzx ecx, word [edx+0x2]
	mov [ebp-0x24], ecx
	mov eax, frontEndDataOut
	mov eax, [eax]
	lea eax, [eax+ecx*4]
	mov [ebp-0x28], eax
	movzx ebx, word [edx]
	mov [esp+0x4], ebx
	mov [esp], esi
	call XModelGetSurfCount
	mov [ebp-0x2c], eax
	mov [esp+0x4], ebx
	mov [esp], esi
	call XModelGetSkins
	mov edx, [ebp-0x2c]
	test edx, edx
	jz R_AddXModelSurfacesCamera_10
	mov dword [ebp-0x30], 0x0
	mov ebx, edi
	movzx edi, bl
	mov [ebp-0x54], edi
	shl dword [ebp-0x54], 0x10
	mov edx, [ebp-0x44]
	and edx, 0x1f
	shl edx, 0x18
	mov [ebp-0x58], edx
	movzx ecx, byte [ebp-0x40]
	shl ecx, 0xa
	mov [ebp-0x5c], ecx
	mov [ebp-0x60], eax
	jmp R_AddXModelSurfacesCamera_20
R_AddXModelSurfacesCamera_60:
	mov edx, [ebp-0x60]
	mov eax, [edx]
	movzx eax, byte [eax+0x3e]
	movzx edx, al
	cmp al, 0x3
	jz R_AddXModelSurfacesCamera_30
	shl edx, 0x2
	mov ebx, [ebp-0x4c]
	add ebx, edx
	mov [ebp-0x34], ebx
	mov eax, [ebx]
	mov ebx, [ebp-0x50]
	cmp eax, [edx+ebx]
	jae R_AddXModelSurfacesCamera_40
	cmp ecx, 0xfffffffe
	jz R_AddXModelSurfacesCamera_50
	mov dword [ebp-0x20], 0x8
	mov dword [ebp-0x1c], 0x0
R_AddXModelSurfacesCamera_70:
	movzx edx, word [ebp-0x38]
	mov eax, [ebp-0x28]
	mov [eax+0xe], dx
	movzx ecx, word [ebp-0x3c]
	mov [eax+0x10], cx
	mov ebx, [ebp-0x60]
	mov eax, [ebx]
	mov esi, [eax+0x8]
	mov edi, [eax+0xc]
	mov eax, esi
	mov ecx, edi
	shr ecx, 0x16
	and ecx, 0x3f
	sub ecx, [ebp-0x48]
	and ecx, 0x3f
	shl ecx, 0x16
	mov edx, edi
	and edx, 0xf03fffff
	or edx, ecx
	mov ecx, [ebp-0x20]
	and ecx, 0xf
	shl ecx, 0x12
	and edx, 0xffc3ffff
	or edx, ecx
	mov ax, [ebp-0x24]
	and eax, 0xff00ffff
	or eax, [ebp-0x54]
	and eax, 0xe0ffffff
	or eax, [ebp-0x58]
	and edx, 0xfffc03ff
	or edx, [ebp-0x5c]
	mov ebx, [ebp-0x34]
	mov ecx, [ebx]
	mov [ecx], eax
	mov [ecx+0x4], edx
	add dword [ebx], 0x8
R_AddXModelSurfacesCamera_30:
	add dword [ebp-0x24], 0xe
	add dword [ebp-0x28], 0x38
	add dword [ebp-0x30], 0x1
	add dword [ebp-0x60], 0x4
	mov eax, [ebp-0x30]
	cmp [ebp-0x2c], eax
	jz R_AddXModelSurfacesCamera_10
R_AddXModelSurfacesCamera_20:
	mov ebx, [ebp-0x28]
	mov ecx, [ebx]
	cmp ecx, 0xfffffffd
	jnz R_AddXModelSurfacesCamera_60
	add dword [ebp-0x24], 0x1
	add ebx, 0x4
	mov [ebp-0x28], ebx
	add dword [ebp-0x30], 0x1
	add dword [ebp-0x60], 0x4
	mov eax, [ebp-0x30]
	cmp [ebp-0x2c], eax
	jnz R_AddXModelSurfacesCamera_20
R_AddXModelSurfacesCamera_10:
	add esp, 0x6c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_AddXModelSurfacesCamera_50:
	mov dword [ebp-0x20], 0x7
	mov dword [ebp-0x1c], 0x0
	jmp R_AddXModelSurfacesCamera_70
R_AddXModelSurfacesCamera_40:
	mov dword [ebp+0xc], _cstring_r_addxmodelsurfa1
	mov dword [ebp+0x8], 0xf
	add esp, 0x6c
	pop ebx
	pop esi
	pop edi
	pop ebp
	jmp R_WarnOncePerFrame
	nop
	add [eax], al


;R_SetupViewProjectionMatrices(GfxViewParms*)
R_SetupViewProjectionMatrices:
	push ebp
	mov ebp, esp
	push esi
	push ebx
	sub esp, 0x10
	mov ebx, [ebp+0x8]
	lea esi, [ebx+0x80]
	mov [esp+0x8], esi
	lea eax, [ebx+0x40]
	mov [esp+0x4], eax
	mov [esp], ebx
	call MatrixMultiply44
	add ebx, 0xc0
	mov [esp+0x4], ebx
	mov [esp], esi
	call MatrixInverse44
	add esp, 0x10
	pop ebx
	pop esi
	pop ebp
	ret
	nop
	add [eax], al


;R_AddBrushModelToSceneFromAngles(GfxBrushModel const*, float const*, float const*, unsigned int)
R_AddBrushModelToSceneFromAngles:
	push ebp
	mov ebp, esp
	push edi
	push esi
	push ebx
	sub esp, 0x2c
	mov esi, [ebp+0x8]
	mov ebx, [ebp+0xc]
	mov eax, [ebp+0x10]
	mov [ebp-0x1c], eax
	mov edi, [ebp+0x14]
	cmp word [esi+0x30], 0x0
	jnz R_AddBrushModelToSceneFromAngles_10
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	ret
R_AddBrushModelToSceneFromAngles_10:
	mov dword [esp+0x4], 0x1
	mov dword [esp], scene+0x14f634
	call InterlockedExchangeAdd
	cmp eax, 0x1ff
	ja R_AddBrushModelToSceneFromAngles_20
	lea eax, [eax+eax*4]
	lea eax, [eax*8+scene+0x14f600]
	lea edx, [eax+0x38]
	mov [edx+0x4], esi
	mov [edx+0x2], di
	mov edx, [ebx]
	mov [eax+0x50], edx
	mov edx, [ebx+0x4]
	mov [eax+0x54], edx
	mov edx, [ebx+0x8]
	mov [eax+0x58], edx
	add eax, 0x40
	mov [ebp+0xc], eax
	mov eax, [ebp-0x1c]
	mov [ebp+0x8], eax
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	jmp AnglesToQuat
R_AddBrushModelToSceneFromAngles_20:
	mov dword [scene+0x14f634], 0x200
	mov dword [ebp+0xc], 0x200
	mov dword [ebp+0x8], 0x1
	add esp, 0x2c
	pop ebx
	pop esi
	pop edi
	pop ebp
	jmp R_WarnOncePerFrame


;Initialized global or static variables of r_scene:
SECTION .data
g_allowShadowMaps: db 0x1
_ZZ20R_GetAllowShadowMapsvE19sDisableShadowsTest: dd 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
		db 0x0, 0x0, 0x0


;Initialized constant data of r_scene:
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
g_fltMin__uint4: dd 0x800000, 0x800000, 0x800000, 0x800000, 0x80000000, 0x0, 0x0, 0x0, 0x4f000000, 0x0, 0x0, 0x0, 0x4f800000, 0x0, 0x0, 0x0, 0x7fffffff, 0x0, 0x0, 0x0, 0x80000000, 0x0, 0x0, 0x0, 0x80000000, 0x0, 0x0, 0x0, 0x80000000, 0x0, 0x0, 0x0


;Zero initialized global or static variables of r_scene:
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
lockPvsViewParms: resb 0x160
scene: resb 0x154d04


;All cstrings:
SECTION .rdata
_cstring_filter_entities:		db "filter entities",0
_cstring_draw_surfs:		db "draw surfs",0
_cstring_bsp_surfaces:		db "bsp surfaces",0
_cstring_pieces_surfs:		db "pieces surfs",0
_cstring_draw_all_dyn_ent:		db "draw all dyn ent",0
_cstring_waitfx:		db "WaitFX",0
_cstring_draw_all_scene_e:		db "draw all scene ent",0
_cstring_r_getvisibledlig:		db "R_GetVisibleDLights",0
_cstring_emit_cookie_surf:		db "emit cookie surfs",0
_cstring_sort_fx_surfs:		db "sort fx surfs",0
_cstring_fontsconsolefont:		db "fonts/consoleFont",0
_cstring_cine_underrun:		db "CINE UNDERRUN!",0
_cstring_cine:		db "CINE",0
_cstring_lights_partition:		db "lights partition",0
_cstring_light_surfs_bsp:		db "light surfs bsp",0
_cstring_light_surfs_smod:		db "light surfs smodel",0
_cstring_light_surfs_scen:		db "light surfs scene ent",0
_cstring_emit_light_surfs:		db "emit light surfs",0
_cstring_static_model_sur:		db "static model surfaces",0
_cstring_glow:		db "GLOW",0
_cstring_dof:		db "DOF",0
_cstring_depth_of_field_u:		db "Depth of field used (enabled via r_dof_enable or r_dof_tweak) with no float-z buffer (r_floatz wasn",27h,"t enabled when the renderer was started.)",0ah,0
_cstring_renderer_attempt:		db "Renderer attempted to use technique that uses floatz buffer, but it wasn",27h,"t created.",0ah,0
_cstring_r_renderscene_nu:		db 015h,"R_RenderScene: NULL worldmodel",0
_cstring_scene_ent_surfac:		db "scene ent surfaces",0
_cstring_max_fps_spin:		db "max fps spin",0
_cstring_r_adddobjsurface:		db "R_AddDObjSurfaces",0
_cstring_r_addbmodelsurfa:		db "R_AddBModelSurfaces",0
_cstring_r_addxmodelsurfa:		db "R_AddXModelSurfaces",0
_cstring_r_adddobjsurface1:		db "R_AddDObjSurfacesCamera",0
_cstring_r_addbmodelsurfa1:		db "R_AddBModelSurfacesCamera",0
_cstring_r_addxmodelsurfa1:		db "R_AddXModelSurfacesCamera",0



;All constant floats and doubles:
SECTION .rdata
_float_0_01000000:		dd 0x3c23d70a	; 0.01
_float_2_11867309:		dd 0x40079857	; 2.11867
_float_1_00000000:		dd 0x3f800000	; 1
_float_0_50000000:		dd 0x3f000000	; 0.5
_data16_4f000000:		dd 0x4f000000, 0x0, 0x0, 0x0	; OWORD
_data16_4f800000:		dd 0x4f800000, 0x0, 0x0, 0x0	; OWORD
_data16_7fffffff:		dd 0x7fffffff, 0x0, 0x0, 0x0	; OWORD
_float_512_00000000:		dd 0x44000000	; 512
_float_4_00000000:		dd 0x40800000	; 4
_float_0_98437500:		dd 0x3f7c0000	; 0.984375
_float_1024_00000000:		dd 0x44800000	; 1024
_float_0_00024414:		dd 0x39800000	; 0.000244141
_float_4096_00000000:		dd 0x45800000	; 4096
_float__0_50000000:		dd 0xbf000000	; -0.5
_data16_80000000:		dd 0x80000000, 0x0, 0x0, 0x0	; OWORD
_float_0_00100000:		dd 0x3a83126f	; 0.001
_float_0_00277778:		dd 0x3b360b61	; 0.00277778
_float_360_00000000:		dd 0x43b40000	; 360
_float_5_00000000:		dd 0x40a00000	; 5
_float_0_00000000:		dd 0x0	; 0
_float_0_10000000:		dd 0x3dcccccd	; 0.1

