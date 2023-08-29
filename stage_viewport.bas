'---------------------------------START OF TESTING SETUP------------------------------------

test_level_map = C3D_LoadImage("Assets/plane1.bmp")
test_level_mesh = C3D_LoadMesh("Assets/terrain2.obj")
tree_mesh = C3D_LoadMesh("Assets/tree.obj")
tree_texture = C3D_LoadImage("Assets/tree.png")

C3D_SetMeshTexture(test_level_mesh, test_level_map)
C3D_SetMeshTexture(tree_mesh, tree_texture)

C3D_CreateActor(C3D_ACTOR_TYPE_MESH, test_level_mesh)

'Dim ground[5,5]
'
'For z = 0 to 4
'	For x = 0 to 4
'		ground[z,x] = C3D_CreateActor(C3D_ACTOR_TYPE_MESH, wall_mesh)
'		r = C3D_Mesh_Radius[wall_mesh]
'		d = r*2
'		print "d = ";d
'		C3D_ScaleActor(ground[z,x], 5)
'		C3D_SetActorPosition(ground[z,x], x*r*4.9, 0, z*r*4.9)
'	Next
'Next
		
		

tree = C3D_CreateActor(C3D_ACTOR_TYPE_MESH, tree_mesh)
C3D_SetActorPickable(tree, true)

tree2 = C3D_CreateActor(C3D_ACTOR_TYPE_MESH, tree_mesh)
C3D_ScaleActor(tree2, 10)
C3D_SetActorPosition(tree2, 1800, 0, 3000)
C3D_SetActorPickable(tree2, true)

tree2 = C3D_CreateActor(C3D_ACTOR_TYPE_MESH, tree_mesh)
C3D_ScaleActor(tree2, 10)
C3D_SetActorPosition(tree2, 3500, 0, 2250)
C3D_SetActorPickable(tree2, true)

tree2 = C3D_CreateActor(C3D_ACTOR_TYPE_MESH, tree_mesh)
C3D_ScaleActor(tree2, 10)
C3D_SetActorPosition(tree2, 2200, 0, 2300)
C3D_SetActorPickable(tree2, true)


'print "wall = ";wall
print ""
'test_level = C3D_CreateActor(C3D_ACTOR_TYPE_MESH, test_level_mesh)
'C3D_SetMeshTexture(test_level_mesh, test_level_map)



C3D_SetCameraPosition(0, 40, 0)


lf = C3D_LoadImage("Assets/bkg_lf.jpg")
rt = C3D_LoadImage("Assets/bkg_rt.jpg")
ft = C3D_LoadImage("Assets/bkg_ft.jpg")
bk = C3D_LoadImage("Assets/bkg_bk.jpg")
up = C3D_LoadImage("Assets/bkg_up.jpg")
dn = C3D_LoadImage("Assets/bkg_dn.jpg")
'C3D_SetSkyDome(lf, rt, ft, bk, up, dn)
C3D_GenerateBackground(lf, rt, bk, ft, up, dn)
C3D_ShowBackground(True)

'SetCanvasVisible(6, false)
'SetCanvasVisible(7, false)

'---------------------------------END OF TESTING SETUP------------------------------------






'EDITOR_STAGE_ACTION_STATE = 0
'
'EDITOR_STATE_ACTION_STATE_SELECT = 1
'EDITOR_STATE_ACTION_STATE_BOX = 2
'EDITOR_STATE_ACTION_STATE_MOVE = 3
'EDITOR_STATE_ACTION_STATE_ROTATE = 4
'EDITOR_STATE_ACTION_STATE_SCALE = 5
'
'EDITOR_X_AXIS_ON = TRUE
'EDITOR_Y_AXIS_ON = TRUE
'EDITOR_Z_AXIS_ON = TRUE






'Viewport Settings
VIEW_3D = 0
VIEW_FRONT = 1
VIEW_TOP = 2

Viewport_CurrentView = VIEW_3D

cam_rot_speed = 4
cam_speed = 32

v_scale = 1


Dim viewport_mx, viewport_my, viewport_prev_mx, viewport_prev_my, viewport_mb1, viewport_mb2, viewport_mb3

Sub Viewport_MouseDelta_FPS(ByRef dx, ByRef dy, lock_to_surface)
	move_mouse = false
	
	viewport_prev_mx = viewport_mx
	viewport_prev_my = viewport_my
	
	Gui_Surface_GetMouse(stage_viewport_surface, viewport_mx, viewport_my)
	
	viewport_mb1 = MouseButton(0)
	viewport_mb2 = MouseButton(1)
	viewport_mb3 = MouseButton(2)
	
	w = C3D_SCREEN_WIDTH-1
	h = C3D_SCREEN_HEIGHT-1
	
	If viewport_mx <= 0 And viewport_prev_mx > 0 Then
		viewport_mx = w
		move_mouse = True
	ElseIf viewport_mx >= w And viewport_prev_mx < w Then
		viewport_mx = 0
		move_mouse = True
	End If
    
  If viewport_my <= 0 And viewport_prev_my > 0 Then
		viewport_my = h
		move_mouse = True
	ElseIf viewport_my >= h And viewport_prev_my < h Then
		viewport_my = 0
		move_mouse = True
	End If
	
	If move_mouse Then
		If lock_to_surface Then
			px = Gui_Panel_X[Gui_Element_Index[stage_viewport_panel]]
			py = Gui_Panel_Y[Gui_Element_Index[stage_viewport_panel]]
			'Print "PP: ";px; ", ";py
			'print "Warp: "; px + viewport_mx; ", "; py + viewport_my
			WarpMouse(px + viewport_mx, py + viewport_my)
		End If
		dx = 0
		dy = 0
	Else
		dx = viewport_mx - viewport_prev_mx
		dy = viewport_my - viewport_prev_my
	End If

End Sub

Sub Viewport_Camera_Control()
		'RSHIFT NEEDS TO BE ADDED
	Dim dx, dy
	Viewport_MouseDelta_FPS(dx, dy, MouseButton(1))
	
	If MouseButton(1) Then
		GrabInput(1)
		HideMouse()
		
		dx = dx * sensitivity
		dy = dy * sensitivity
		
		C3D_RotateCamera(0, dx, 0)
		
		dim xr,yr,zr
		C3D_GetCameraRotation(xr,yr,zr)
		
		new_y = xr + dy
		If dy < 0 And (new_y < -25) Then
			dy = 0
		ElseIf dy > 0 And (new_y > 90) Then
			dy = 0
		End If
		
		C3D_RotateCamera(dy, 0, 0)
	Else
		GrabInput(0)
		ShowMouse()
	End If
	
	
	
	If Key(K_A) Then
		'C3D_MoveFPSCameraActor(cam_obj, -cam_speed, 0, 0)
		C3D_MoveCameraRelative(-cam_speed, 0, 0)
	ElseIf Key(K_D) Then
		'C3D_MoveFPSCameraActor(cam_obj, cam_speed, 0, 0)
		C3D_MoveCameraRelative(cam_speed, 0, 0)
	End If
	
	If Key(K_W) Then
		'C3D_MoveFPSCameraActor(cam_obj, 0, 0, -cam_speed)
		C3D_MoveCameraRelative(0, 0, -cam_speed)
	ElseIf Key(K_S) Then
		'C3D_MoveFPSCameraActor(cam_obj, 0, 0, cam_speed)
		C3D_MoveCameraRelative(0, 0, cam_speed)
	End If
	
	If Key(K_R) Then
		'C3D_MoveFPSCameraActor(cam_obj, 0, cam_speed, 0)
		C3D_MoveCamera(0, cam_speed, 0)
	ElseIf Key(K_F) Then
		'C3D_MoveFPSCameraActor(cam_obj, 0, -cam_speed, 0)
		C3D_MoveCamera(0, -cam_speed, 0)
	End If
End Sub


Function Viewport_Select(mx, my)
	p = C3D_PickActor(mx, my)
	Print "Pick(";mx;", ";my;") = "; p
	While MouseButton(0): Update: Wend
End Function


Sub Viewport_Control()
	Select Case Viewport_CurrentView
	Case VIEW_3D
		
		Viewport_Camera_Control()
		
		If Key(K_Z) Then
			C3D_MoveActor(tree, 0, -4, 0)
			'v_scale = v_scale - 0.01
			'C3D_SetActorScale(h_obj, v_scale)
		ElseIf Key(K_X) Then
			C3D_MoveActor(tree, 0, 4, 0)
			'v_scale = v_scale + 0.01
			'C3D_SetActorScale(h_obj, v_scale)
		End If
		
		
		If MouseButton(0) Then
			'While MouseButton(0): Update: Wend
			
			Dim mx, my
			Gui_Surface_GetMouse(stage_viewport_surface, mx, my)
			
			Select Case GetStageToolsState()
			Case STAGE_TOOLS_STATE_SELECT
				Viewport_Select(mx, my)
			Case STAGE_TOOLS_STATE_BOX
			Case STAGE_TOOLS_STATE_MOVE
			Case STAGE_TOOLS_STATE_ROTATE
			Case STAGE_TOOLS_STATE_SCALE
			End Select
			
			'p = C3D_PickActor(mx, my)
			'Print "Pick(";mx;", ";my;") = "; p
		End If
	
	Default
		GrabInput(0)
		ShowMouse()
	End Select
End Sub