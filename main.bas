Include "gui.bas"
Include "Calamity3D/Calamity3D.bas"

editor_base_dir$ = dir$

MAIN_WINDOW_WIDTH = 1280
MAIN_WINDOW_HEIGHT = 720

'C3D_CAMERA_LENS = 1000

EDITOR_STAGE_ACTION_STATE = 0

EDITOR_STATE_ACTION_STATE_SELECT = 1
EDITOR_STATE_ACTION_STATE_BOX = 2
EDITOR_STATE_ACTION_STATE_MOVE = 3
EDITOR_STATE_ACTION_STATE_ROTATE = 4
EDITOR_STATE_ACTION_STATE_SCALE = 5

EDITOR_X_AXIS_ON = TRUE
EDITOR_Y_AXIS_ON = TRUE
EDITOR_Z_AXIS_ON = TRUE


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


Include "UI_StageTab.bas"

Include "stage_objects.bas"
Include "UI_MeshTab.bas"




C3D_Init_CurrentWindow(640, 480)


Include "stage_tools.bas" 'UI and Logic for the tools panel
Include "stage_viewport.bas" 'UI and Logic for the stage viewport


Sub Editor_Init()
	ArrayFill(editor_actor_id, -1)
	ArrayFill(editor_geometry_id, -1)
	ArrayFill(editor_texture_id, -1)
	ArrayFill(editor_mesh_id, -1)
End Sub


Function OnAnimationFrameClicked(click)
	'EVENT_TYPE = IMAGECLIP_PRESSED
	'EVENT_ID = i
	
	If EVENT_TYPE = IMAGESLIDE_PRESSED Or EVENT_TYPE = IMAGESLIDE_RELEASED And EVENT_ID = mesh_animation_frame_slide Then
		If click Then
			'print "click = ";click
			Print "ImageClip Selected: "; Gui_ImageSlide_GetSelectedClip(mesh_animation_frame_slide)
		End If
	End If
End Function


Function Stage_Tab_Run(dbl_click)
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
End Function


Function Mesh_Tab_Run(dbl_click)
	OnAnimationFrameClicked(dbl_click) 'Check if a frame is double clicked on Mesh Animation Panel
	
	
	
	item = Gui_ListBox_GetSelectedItem(mesh_meshList_listBox)
	
	If item < 0 Then
		Return 0
	End If
	
	e_mesh = meshList_editor_mesh_index[item]
	
	If e_mesh < 0 Then
		Return 0
	End If

	'Check for Button Clicks
	If Gui_Button_Clicked(mesh_meshList_import_button) Then
		Mesh_Import_Dialog(Gui_AppendDir$(editor_base_dir$, "Assets"))
	End If
	
	'ListBox Changed
	If Gui_ListBox_ItemChanged(mesh_meshList_listBox) Then
		'Mesh File and ID/name
		Gui_TextField_SetValue(mesh_properties_File_field, editor_mesh_file$[e_mesh])
		Gui_TextField_SetValue(mesh_properties_ID_field, editor_mesh_name$[e_mesh])
		
		'HD Mesh and Distance
		hd_mesh = editor_mesh_HDMesh[e_mesh]
		hd_mesh_file$ = "N/A"
		hd_distance$ = "-1"
		If hd_mesh >= 0 Then
			hd_mesh_file$ = editor_mesh_name$[hd_mesh]
		End If
		Gui_TextField_SetValue(mesh_properties_HDMesh_field, hd_mesh_file$)
		Gui_TextField_SetValue(mesh_properties_HDDistance_field, Str$(editor_mesh_HDMesh_distance[e_mesh]))
		
		'Geometry Mesh
		g_mesh = editor_mesh_GeoMesh[e_mesh]
		g_mesh_name$ = "N/A"
		If g_mesh >= 0 Then
			g_mesh_name$ = editor_mesh_name$[g_mesh]
		End If
		Gui_TextField_SetValue(mesh_properties_StaticGeometry_field, g_mesh_name$)
		
		'Texture
		texture = editor_mesh_texture[e_mesh]
		texture_file$ = "N/A"
		If texture >= 0 Then
			texture_file$ = editor_texture_file$[texture]
		End If
		Gui_TextField_SetValue(mesh_properties_Texture_field, texture_file$)
		
		'Scale
		scale = editor_mesh_scale[e_mesh]
		Gui_TextField_SetValue(mesh_properties_Scale_field, Str$(scale))
	
	End If
	
	'TextField has changed
	If Gui_TextField_Return(mesh_properties_ID_field) Then
		editor_mesh_name$[e_mesh] = Gui_TextField_GetValue$(mesh_properties_ID_field)
	ElseIf Gui_TextField_Return(mesh_properties_HDMesh_field) Then
		
		hd_mesh_name$ = Trim$(Gui_TextField_GetValue$(mesh_properties_HDMesh_field))
		hd_mesh_index = -1
		For i = 0 to MAX_EDITOR_MESHES-1
			If editor_mesh_name$[i] = hd_mesh_name$ Then
				hd_mesh_index = i
				Exit For
			End If
		Next
		
		If hd_mesh_index < 0 Then
			Gui_TextField_SetValue(mesh_properties_HDMesh_field, "N/A")
		Else
			editor_mesh_HDMesh[e_mesh] = hd_mesh_index
			c_mesh_id = editor_mesh_id[e_mesh]
			c_hd_mesh_id = editor_mesh_id[hd_mesh_index]
			C3D_SetHDMesh(c_mesh_id, c_hd_mesh_id)
		End If
	
	ElseIf Gui_TextField_Return(mesh_properties_HDDistance_field) Then
		hd_mesh_name$ = Trim$(Gui_TextField_GetValue$(mesh_properties_HDMesh_field))
		hd_mesh_index = -1
		For i = 0 to MAX_EDITOR_MESHES-1
			If editor_mesh_name$[i] = hd_mesh_name$ Then
				hd_mesh_index = i
				Exit For
			End If
		Next
		
		If hd_mesh_index < 0 Then
			Gui_TextField_SetValue(mesh_properties_HDDistance_field, "-1")
		Else
			editor_mesh_HDMesh_distance[e_mesh] = Val(Gui_TextField_GetValue$(mesh_properties_HDDistance_field))
			c_mesh_id = editor_mesh_id[e_mesh]
			C3D_SetMeshHDDistance(c_mesh_id, editor_mesh_HDMesh_distance[e_mesh])
		End If
	
	ElseIf Gui_TextField_Return(mesh_properties_StaticGeometry_field) Then
		
		g_mesh_name$ = Trim$(Gui_TextField_GetValue$(mesh_properties_StaticGeometry_field))
		g_mesh_index = -1
		For i = 0 to MAX_EDITOR_MESHES-1
			If editor_mesh_name$[i] = g_mesh_name$ Then
				g_mesh_index = i
				Exit For
			End If
		Next
		
		If g_mesh_index < 0 Then
			Gui_TextField_SetValue(mesh_properties_StaticGeometry_field, "N/A")
		Else
			editor_mesh_GeoMesh[e_mesh] = g_mesh_index
		End If
		
	ElseIf Gui_TextField_Return(mesh_properties_Scale_field) Then
		editor_mesh_scale[e_mesh] = Val(Gui_TextField_GetValue$(mesh_properties_Scale_field))
		C3D_DeleteMesh(editor_mesh_id[e_mesh])
		editor_mesh_id[e_mesh] = C3D_LoadMesh(editor_mesh_file$[e_mesh]) 'Reloading mesh and applying new scale to it
		C3D_ScaleMesh(editor_mesh_id[e_mesh], editor_mesh_scale[e_mesh])
	End If
	
End Function

Editor_Init

click = 0

While Not Key(K_Q)
	click = Gui_DoubleClicked()
	
	Select Case Gui_TabGroup_GetActiveTab(main_tabGroup)
	Case main_tabGroup_stageTab
		Stage_Tab_Run(click)
	Case main_tabGroup_meshTab
		Mesh_Tab_Run(click)
	Case main_tabGroup_textureTab
	
	End Select
	
	'Update events and draw gui
	Gui_Update() 'update must be called at the end of the main loop
Wend

Gui_WindowClose(win) 'closes the window