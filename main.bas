Include "gui.bas"
Include "Calamity3D/Calamity3D.bas"

MAIN_WINDOW_WIDTH = 1280
MAIN_WINDOW_HEIGHT = 720

win = Gui_WindowOpen("Calamity3D Editor", WINDOWPOS_CENTERED, WINDOWPOS_CENTERED, 1280, 720) 'open a window
SetWindowResizable(win, false)
'Panels
MainMenu_Panel = Gui_CreatePanel(1280, 30)

'Add Panels to Window
Gui_Window_AddPanel(win, MainMenu_Panel, 0, 0)


'MainMenu_Panel Widgets
NewStage_button = Gui_CreateButton("New Stage", 100, 20) 'Create a button
LoadStage_button = Gui_CreateButton("Load Stage", 100, 20) 'Create a button
SaveStage_button = Gui_CreateButton("Save Stage", 100, 20) 'Create a button

Gui_Panel_AddObject(MainMenu_Panel, NewStage_button, 5, 5)
Gui_Panel_AddObject(MainMenu_Panel, LoadStage_button, 110, 5)
Gui_Panel_AddObject(MainMenu_Panel, SaveStage_button, 215, 5)


'Main TabGroup
main_tabGroup = Gui_CreateTabGroup(Int(MAIN_WINDOW_WIDTH), 30)

main_tabGroup_stageTab = Gui_TabGroup_AddTab(main_tabGroup, "Stage")
main_tabGroup_meshTab = Gui_TabGroup_AddTab(main_tabGroup, "Mesh")
main_tabGroup_textureTab = Gui_TabGroup_AddTab(main_tabGroup, "Texture")

Gui_Window_AddTabGroup(win, main_tabGroup, 0, 35)


'Main TabGroup -> Stage Tab
stage_meshSelector_tabGroup = Gui_CreateTabGroup(300, 30)

stage_meshSelector_tabGroup_terrainTab = Gui_TabGroup_AddTab(stage_meshSelector_tabGroup, "Terrain")
stage_meshSelector_tabGroup_meshTab = Gui_TabGroup_AddTab(stage_meshSelector_tabGroup, "Mesh")
stage_meshSelector_tabGroup_geometryTab = Gui_TabGroup_AddTab(stage_meshSelector_tabGroup, "Geometry")

'stage_meshSelector_tabGroup -> Terrain Tab 
stage_meshSelector_tabGroup_terrainTab_selectionPanel = Gui_CreatePanel(300, 300)
Gui_Window_AddPanel(win, stage_meshSelector_tabGroup_terrainTab_selectionPanel, 5, 100)
Gui_TabGroup_Tab_AddObject(stage_meshSelector_tabGroup, stage_meshSelector_tabGroup_terrainTab, stage_meshSelector_tabGroup_terrainTab_selectionPanel)


'stage_meshSelector_tabGroup -> Mesh Tab 
stage_meshSelector_tabGroup_meshTab_selectionPanel = Gui_CreatePanel(300, 300)
Gui_Window_AddPanel(win, stage_meshSelector_tabGroup_meshTab_selectionPanel, 5, 100)
Gui_TabGroup_Tab_AddObject(stage_meshSelector_tabGroup, stage_meshSelector_tabGroup_meshTab, stage_meshSelector_tabGroup_meshTab_selectionPanel)

'stage_meshSelector_tabGroup -> Geometry Tab 
stage_meshSelector_tabGroup_geometryTab_selectionPanel = Gui_CreatePanel(300, 300)
Gui_Window_AddPanel(win, stage_meshSelector_tabGroup_geometryTab_selectionPanel, 5, 100)
Gui_TabGroup_Tab_AddObject(stage_meshSelector_tabGroup, stage_meshSelector_tabGroup_geometryTab, stage_meshSelector_tabGroup_geometryTab_selectionPanel)


'Stage Tab -> Mesh Selector Properties
stage_meshSelectorProperties_panel = Gui_CreatePanel(300, 310)
Gui_Window_AddPanel(win, stage_meshSelectorProperties_panel, 5, 405)
Gui_TabGroup_Tab_AddObject(main_tabGroup, main_tabGroup_stageTab, stage_meshSelectorProperties_panel)


'Stage Tab -> Viewport Options
stage_viewportOptions_panel = Gui_CreatePanel(640, 30)
Gui_Window_AddPanel(win, stage_viewportOptions_panel, 310, 70)
Gui_TabGroup_Tab_AddObject(main_tabGroup, main_tabGroup_stageTab, stage_viewportOptions_panel)

stage_viewportOptions_frontView_button = Gui_CreateButton("Front", 80, 20)
stage_viewportOptions_topView_button = Gui_CreateButton("Top", 80, 20)
stage_viewportOptions_perspectiveView_button = Gui_CreateButton("3D View", 80, 20)

Gui_Panel_AddObject(stage_viewportOptions_panel, stage_viewportOptions_frontView_button, 5, 5)
Gui_Panel_AddObject(stage_viewportOptions_panel, stage_viewportOptions_topView_button, 90, 5)
Gui_Panel_AddObject(stage_viewportOptions_panel, stage_viewportOptions_perspectiveView_button, 175, 5)

'Stage Tab -> Viewport
stage_viewport_panel = Gui_CreatePanel(640, 480)
Gui_Window_AddPanel(win, stage_viewport_panel, 310, 105)

stage_viewport_surface = Gui_CreateSurface(640, 480)
Gui_Panel_AddObject(stage_viewport_panel, stage_viewport_surface, 0, 0)

Gui_TabGroup_Tab_AddObject(main_tabGroup, main_tabGroup_stageTab, stage_viewport_panel)


'Stage Tab -> Viewport Info
stage_viewportInfo_panel = Gui_CreatePanel(640, 125)
Gui_Window_AddPanel(win, stage_viewportInfo_panel, 310, 590)
Gui_TabGroup_Tab_AddObject(main_tabGroup, main_tabGroup_stageTab, stage_viewportInfo_panel)


'Stage Tab -> Layer Options
stage_layerOptions_panel = Gui_CreatePanel(320, 310)
Gui_Window_AddPanel(win, stage_layerOptions_panel, 955, 70)
Gui_TabGroup_Tab_AddObject(main_tabGroup, main_tabGroup_stageTab, stage_layerOptions_panel)


'Stage Tab -> Stage Properties
stage_stageProperties_panel = Gui_CreatePanel(320, 330)
Gui_Window_AddPanel(win, stage_stageProperties_panel, 955, 385)
Gui_TabGroup_Tab_AddObject(main_tabGroup, main_tabGroup_stageTab, stage_stageProperties_panel)


Gui_Window_AddTabGroup(win, stage_meshSelector_tabGroup, 5, 70)
Gui_TabGroup_Tab_AddObject(main_tabGroup, main_tabGroup_stageTab, stage_meshSelector_tabGroup)

C3D_Init_CurrentWindow(640, 480)

test_level_map = C3D_LoadImage("Assets/plane5_map.bmp")
'test_level_map = C3D_LoadImage("Assets/mz_cube_map1.bmp")
'test_level_map = C3D_LoadImage("Assets/test_hall_map.bmp")
squid_map = C3D_LoadImage("Assets/squid_map.bmp")
tree_map = C3D_LoadImage("Assets/tree.bmp")
hill_map = C3D_LoadImage("Assets/hill1_map.bmp")

'test_level_mesh = C3D_LoadMesh("Assets/test_scene_xp.obj")
test_level_mesh = C3D_LoadMesh("Assets/test_hall_mapped.obj")
'test_level_mesh = C3D_LoadMesh("Assets/plain3.obj")
v_mesh = C3D_LoadMesh("Assets/v.obj")
h_mesh = C3D_LoadMesh("Assets/h.obj")
wall_mesh = C3D_LoadMesh("Assets/plane5.obj")
tree_mesh = C3D_LoadMesh("Assets/tree_mapped.obj")
hill_mesh = C3D_LoadMesh("Assets/hill1_mapped.obj")
'v_obj = C3D_CreateActor(C3D_ACTOR_TYPE_MESH, v_mesh)
'h_obj = C3D_CreateActor(C3D_ACTOR_TYPE_MESH, h_mesh)
'wall = C3D_CreateActor(C3D_ACTOR_TYPE_MESH, wall_mesh)
hill = C3D_CreateActor(C3D_ACTOR_TYPE_MESH, hill_mesh)

Dim ground[5,5]

For z = 0 to 4
	For x = 0 to 4
		ground[z,x] = C3D_CreateActor(C3D_ACTOR_TYPE_MESH, wall_mesh)
		r = C3D_Mesh_Radius[wall_mesh]
		d = r*2
		print "d = ";d
		C3D_ScaleActor(ground[z,x], 5)
		C3D_SetActorPosition(ground[z,x], x*r*4.9, 0, z*r*4.9)
	Next
Next
		
		

tree = C3D_CreateActor(C3D_ACTOR_TYPE_MESH, tree_mesh)

tree2 = C3D_CreateActor(C3D_ACTOR_TYPE_MESH, tree_mesh)
C3D_ScaleActor(tree2, 10)
C3D_SetActorPosition(tree2, 1800, 0, 3000)

tree2 = C3D_CreateActor(C3D_ACTOR_TYPE_MESH, tree_mesh)
C3D_ScaleActor(tree2, 10)
C3D_SetActorPosition(tree2, 3500, 0, 2250)

tree2 = C3D_CreateActor(C3D_ACTOR_TYPE_MESH, tree_mesh)
C3D_ScaleActor(tree2, 10)
C3D_SetActorPosition(tree2, 2200, 0, 2300)


'print "wall = ";wall
print ""
'test_level = C3D_CreateActor(C3D_ACTOR_TYPE_MESH, test_level_mesh)
'C3D_SetMeshTexture(test_level_mesh, test_level_map)

C3D_SetMeshTexture(tree_mesh, tree_map)
C3D_SetMeshTexture(hill_mesh, hill_map)
C3D_SetMeshTexture(wall_mesh, test_level_map)

'C3D_ScaleActor(test_level, 5)
C3D_ScaleActor(tree, 10)
C3D_SetActorPosition(tree, 200, 534, 0)
C3D_ScaleActor(hill, 0.5)
C3D_SetActorPosition(hill, 319, 284, 0)
'C3D_ScaleActor(wall, 5)

C3D_SetCameraPosition(0, 40, 0)


lf = C3D_LoadImage("Assets/skydome/irrlicht2_lf.jpg")
rt = C3D_LoadImage("Assets/skydome/irrlicht2_rt.jpg")
ft = C3D_LoadImage("Assets/skydome/irrlicht2_ft.jpg")
bk = C3D_LoadImage("Assets/skydome/irrlicht2_bk.jpg")
up = C3D_LoadImage("Assets/skydome/irrlicht2_up.jpg")
dn = C3D_LoadImage("Assets/skydome/irrlicht2_dn.jpg")
'C3D_SetSkyDome(lf, rt, ft, bk, up, dn)
C3D_GenerateBackground(lf, rt, bk, ft, up, dn)
C3D_ShowBackground(True)

SetCanvasVisible(6, false)
SetCanvasVisible(7, false)


'Viewport Settings
VIEW_3D = 0
VIEW_FRONT = 1
VIEW_TOP = 2

Viewport_CurrentView = VIEW_3D

cam_rot_speed = 4
cam_speed = 32

v_scale = 1

Sub Viewport_Control()
	Select Case Viewport_CurrentView
	Case VIEW_3D
		If Key(K_LEFT) Then
			C3D_RotateCamera(0, -cam_rot_speed, 0)
		ElseIf Key(K_RIGHT) Then
			C3D_RotateCamera(0, cam_rot_speed, 0)
		End If
		
		If Key(K_UP) Then
			C3D_RotateCamera(-cam_rot_speed, 0, 0)
		ElseIf Key(K_DOWN) Then
			C3D_RotateCamera(cam_rot_speed, 0, 0)
		End If
		
		If Key(K_A) Then
			C3D_MoveCamera(-cam_speed, 0, 0)
		ElseIf Key(K_D) Then
			C3D_MoveCamera(cam_speed, 0, 0)
		End If
		
		If Key(K_W) Then
			C3D_MoveCamera(0, 0, -cam_speed)
			'C3D_MoveActor(v_obj, 0, 0, -cam_speed)
			'C3D_MoveActor(h_obj, 0, 0, -cam_speed)
		ElseIf Key(K_S) Then
			C3D_MoveCamera(0, 0, cam_speed)
			'C3D_MoveActor(v_obj, 0, 0, cam_speed)
			'C3D_MoveActor(h_obj, 0, 0, cam_speed)
		End If
		
		If Key(K_R) Then
			C3D_MoveCamera(0, cam_speed, 0)
		ElseIf Key(K_F) Then
			C3D_MoveCamera(0, -cam_speed, 0)
		End If
		
		If Key(K_Z) Then
			C3D_MoveActor(tree, 0, -4, 0)
			'v_scale = v_scale - 0.01
			'C3D_SetActorScale(h_obj, v_scale)
		ElseIf Key(K_X) Then
			C3D_MoveActor(tree, 0, 4, 0)
			'v_scale = v_scale + 0.01
			'C3D_SetActorScale(h_obj, v_scale)
		End If
		
		If Key(K_C) Then
			C3D_MoveActor(hill, 0, -4, 0)
		ElseIf Key(K_V) Then
			C3D_MoveActor(hill, 1, 4, 0)
		End If
		
		If Key(K_SPACE) Then
			C3D_SetCameraPosition(0,0,500)
			C3D_SetCameraRotation(0,0,0)
		End If
		
		If Key(K_M) Then
			Dim x, y, z, rx, ry, rz
			Dim scale
			'C3D_GetActorScale(v_obj, scale)
			'C3D_GetActorPosition(v_obj,x,y,z)
			'C3D_GetActorRotation(v_obj,rx,ry,rz)
			'Print "V POS(";x;", ";y;", ";z;") SCALE = ";scale
			
			'C3D_GetActorScale(h_obj, scale)
			'C3D_GetActorPosition(h_obj,x,y,z)
			'C3D_GetActorRotation(h_obj,rx,ry,rz)
			'Print "H POS(";x;", ";y;", ";z;") SCALE = ";scale
			
			C3D_GetActorPosition(hill, x, y, z)
			Print "Hill: "; x;", ";y;", ";z
			
			C3D_GetActorPosition(tree, x, y, z)
			Print "Tree: "; x;", ";y;", ";z
			
			'Print ""
			'Print ""
		End If
		
		If Key(K_1) Then
			dbg = 1
			Print "NEW GFX MODE: ON"
		End If
		
		If Key(K_2) Then
			dbg = 0
			Print "NEW GFX MODE: OFF"
		End If
		
		If MouseButton(0) Then
			While MouseButton(0): Update: Wend
			Dim mx, my
			Gui_Surface_GetMouse(stage_viewport_surface, mx, my)
			p = C3D_PickActor(mx, my)
			Print "Pick(";mx;", ";my;") = "; p
		End If
		
	End Select
End Sub

While Not Key(K_Q)
	
	If Gui_Surface_MouseOver(stage_viewport_surface) Then
		C3D_RenderScene()
		Canvas(C3D_CANVAS_RENDER)
		img = Gui_GetFreeImage()
		CanvasClip(img, 0, 0, 640, 480, 1)
		Gui_Surface_Clear(stage_viewport_surface)
		Gui_Surface_DrawImage_Blit_Ex(stage_viewport_surface, img, 0, 0, 640, 480, 0, 0, 640, 480)
		Gui_Surface_Update(stage_viewport_surface)
		DeleteImage(img)
		
		Viewport_Control()
	End If
	'Check for Events
	'If Gui_Button_Clicked(NewStage_button) Then
	'	Exit While
	'End If
	
	'Update events and draw gui
	Gui_Update() 'update must be called at the end of the main loop
Wend

Gui_WindowClose(win) 'closes the window