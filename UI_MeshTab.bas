'Main Mesh Tab

mesh_meshList_panel = Gui_CreatePanel(Int(MAIN_WINDOW_WIDTH/5), MAIN_WINDOW_HEIGHT-75)
Gui_Window_AddPanel(win, mesh_meshList_panel, 5, 70)
Gui_TabGroup_Tab_AddObject(main_tabGroup, main_tabGroup_meshTab, mesh_meshList_panel)

meshList_w = Int(MAIN_WINDOW_WIDTH/5)-10
meshList_h = (MAIN_WINDOW_HEIGHT-80) - 50

mesh_meshList_import_button = Gui_CreateButton("Import", 100, 30)
mesh_meshList_remove_button = Gui_CreateButton("Remove", 100, 30)

Gui_Panel_AddObject(mesh_meshList_panel, mesh_meshList_import_button, 5, 5)
Gui_Panel_AddObject(mesh_meshList_panel, mesh_meshList_remove_button, 110, 5)

mesh_meshList_listbox = Gui_CreateListBox(meshList_w, meshList_h)
Gui_Panel_AddObject(mesh_meshList_panel, mesh_meshList_listbox, 5, 40)





mesh_main_tabGroup = Gui_CreateTabGroup(Int(MAIN_WINDOW_WIDTH/5)*4-15, 30)
Gui_Window_AddTabGroup(win, mesh_main_tabGroup, Int(MAIN_WINDOW_WIDTH/5)+10, 70)
Gui_TabGroup_Tab_AddObject(main_tabGroup, main_tabGroup_meshTab, mesh_main_tabGroup)

mesh_main_tabGroup_propertiesTab = Gui_TabGroup_AddTab(mesh_main_tabGroup, "Properties")
mesh_main_tabGroup_animationTab = Gui_TabGroup_AddTab(mesh_main_tabGroup, "Animation")


'Properties Panel
mesh_properties_panel = Gui_CreatePanel(Int(MAIN_WINDOW_WIDTH/5)*4-15, MAIN_WINDOW_HEIGHT-105)
Gui_Window_AddPanel(win, mesh_properties_panel, Int(MAIN_WINDOW_WIDTH/5)+10, 100)
Gui_TabGroup_Tab_AddObject(mesh_main_tabGroup, mesh_main_tabGroup_propertiesTab, mesh_properties_panel)


mesh_properties_File_label = Gui_CreateLabel("Mesh File ", 90, 20)
Gui_Panel_AddObject(mesh_properties_panel, mesh_properties_File_label, 10, 10)

mesh_properties_File_field = Gui_CreateTextField(400, 20)
Gui_Panel_AddObject(mesh_properties_panel, mesh_properties_File_field, 100, 10)


mesh_properties_ID_label = Gui_CreateLabel("Mesh ID ", 90, 20)
Gui_Panel_AddObject(mesh_properties_panel, mesh_properties_ID_label, 10, 40)

mesh_properties_ID_field = Gui_CreateTextField(400, 20)
Gui_Panel_AddObject(mesh_properties_panel, mesh_properties_ID_field, 100, 40)


mesh_properties_HDMesh_label = Gui_CreateLabel("HD Mesh ", 90, 20)
Gui_Panel_AddObject(mesh_properties_panel, mesh_properties_HDMesh_label, 10, 70)

mesh_properties_HDMesh_field = Gui_CreateTextField(375, 20)
Gui_Panel_AddObject(mesh_properties_panel, mesh_properties_HDMesh_field, 100, 70)

mesh_properties_HDMesh_browse_button = Gui_CreateImageButton("gui_gfx/folder.png", 20, 20)
Gui_Panel_AddObject(mesh_properties_panel, mesh_properties_HDMesh_browse_button, 480, 70)


mesh_properties_HDDistance_label = Gui_CreateLabel("HD Distance ", 90, 20)
Gui_Panel_AddObject(mesh_properties_panel, mesh_properties_HDDistance_label, 10, 100)

mesh_properties_HDDistance_field = Gui_CreateTextField(400, 20)
Gui_Panel_AddObject(mesh_properties_panel, mesh_properties_HDDistance_field, 100, 100)


mesh_properties_StaticGeometry_label = Gui_CreateLabel("Geometry ", 90, 20)
Gui_Panel_AddObject(mesh_properties_panel, mesh_properties_StaticGeometry_label, 10, 130)

mesh_properties_StaticGeometry_field = Gui_CreateTextField(375, 20)
Gui_Panel_AddObject(mesh_properties_panel, mesh_properties_StaticGeometry_field, 100, 130)

mesh_properties_StaticGeometry_browse_button = Gui_CreateImageButton("gui_gfx/folder.png", 20, 20)
Gui_Panel_AddObject(mesh_properties_panel, mesh_properties_StaticGeometry_browse_button, 480, 130)

mesh_properties_Texture_label = Gui_CreateLabel("Texture ", 90, 20)
Gui_Panel_AddObject(mesh_properties_panel, mesh_properties_Texture_label, 10, 160)

mesh_properties_Texture_field = Gui_CreateTextField(375, 20)
Gui_Panel_AddObject(mesh_properties_panel, mesh_properties_Texture_field, 100, 160)

mesh_properties_Texture_browse_button = Gui_CreateImageButton("gui_gfx/folder.png", 20, 20)
Gui_Panel_AddObject(mesh_properties_panel, mesh_properties_Texture_browse_button, 480, 160)

mesh_properties_Scale_label = Gui_CreateLabel("Mesh Scale ", 90, 20)
Gui_Panel_AddObject(mesh_properties_panel, mesh_properties_Scale_label, 10, 190)

mesh_properties_Scale_field = Gui_CreateTextField(400, 20)
Gui_Panel_AddObject(mesh_properties_panel, mesh_properties_Scale_field, 100, 190)


mesh_properties_preview_surface = Gui_CreateSurface(400, 400)
Gui_Panel_AddObject(mesh_properties_panel, mesh_properties_preview_surface, 520, 10)




'Animation Panel
mesh_animation_panel = Gui_CreatePanel(Int(MAIN_WINDOW_WIDTH/5)*4-15, MAIN_WINDOW_HEIGHT-105)
Gui_Window_AddPanel(win, mesh_animation_panel, Int(MAIN_WINDOW_WIDTH/5)+10, 100)
Gui_TabGroup_Tab_AddObject(mesh_main_tabGroup, mesh_main_tabGroup_animationTab, mesh_animation_panel)


mesh_animation_listbox = Gui_CreateListBox(200, 400)
Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_listbox, 5, 5)

mesh_animation_add_button = Gui_CreateButton("Add", 95, 30)
mesh_animation_remove_button = Gui_CreateButton("Remove", 95, 30)
mesh_animation_auto_button = Gui_CreateButton("         Auto", 195, 30)

Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_add_button, 5, 410)
Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_remove_button, 105, 410)
Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_auto_button, 5, 445)


mesh_animation_frame_slide = Gui_CreateImageSlide(Int(MAIN_WINDOW_WIDTH/5)*4-25-400, 100, 100, 100)
Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_frame_slide, 305, 500)


'test
'ic_img = Gui_LoadImage("gui_gfx/ramp.png")
'dim ic_w, ic_h
'GetImageSize(ic_img, ic_w, ic_h)
'ic = Gui_CreateImageClip(ic_img, 100, 100, ic_w, ic_h)

'Gui_ImageSlide_AddImageClip(mesh_animation_frame_slide, ic)


mesh_animation_addFrame_button = Gui_CreateImageButton("gui_gfx/plus.png", 45, 50)
mesh_animation_removeFrame_button = Gui_CreateImageButton("gui_gfx/minus.png", 45, 50)

mesh_animation_scrollRight_button = Gui_CreateImageButton("gui_gfx/right_arrow.png", 100, 100)
mesh_animation_scrollLeft_button = Gui_CreateImageButton("gui_gfx/left_arrow.png", 100, 100)

Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_addFrame_button, 155, 500)
Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_removeFrame_button, 155, 555)

Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_scrollLeft_button, 205, 500)
Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_scrollRight_button, 905, 500)



mesh_animation_Name_label = Gui_CreateLabel("Name ", 90, 20)
Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_Name_label, 210, 10)

mesh_animation_Name_field = Gui_CreateTextField(200, 20)
Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_Name_field, 260, 10)


mesh_animation_ID_label = Gui_CreateLabel("ID ", 90, 20)
Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_ID_label, 210, 40)

mesh_animation_ID_field = Gui_CreateTextField(200, 20)
Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_ID_field, 260, 40)


mesh_animation_FPS_label = Gui_CreateLabel("FPS ", 90, 20)
Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_FPS_label, 210, 70)

mesh_animation_FPS_field = Gui_CreateTextField(200, 20)
Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_FPS_field, 260, 70)


mesh_animation_Frames_label = Gui_CreateLabel("FRAMES:", 90, 20)
Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_Frames_label, 310, 470)

mesh_animation_Frames_field = Gui_CreateDynamicTextField(200, 20)
Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_Frames_field, 360, 470)



mesh_animation_preview_surface = Gui_CreateSurface(400, 400)
Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_preview_surface, 520, 10)

mesh_animation_play_button = Gui_CreateImageButton("gui_gfx/play.png", 50, 50)
Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_play_button, 520, 415)

mesh_animation_stop_button = Gui_CreateImageButton("gui_gfx/stop.png", 50, 50)
Gui_Panel_AddObject(mesh_animation_panel, mesh_animation_stop_button, 575, 415)


Gui_TabRefresh(main_tabGroup)

MAX_FILES_IN_LIST = 1000

Function Init_File_Dialog(start_dir$, dir_field, file_listbox, filter_type$)
	base_dir$ = Dir$()
	
	If Not DirExists$(start_dir$) Then
		Gui_TextField_SetValue(dir_field, base_dir$)
		Return False
	End If
	
	Dim f_type$[99]
	f_type_count = 0
	
	If Trim$(filter_type$) <> "" Then
		filter_type$ = filter_type$ + ","
		f_type$[0] = ""
		For i = 0 to Len(filter_type$)-1
			c$ = Mid$(filter_type$, i, 1)
			If c$ = "," Then
				If f_type$[f_type_count] <> "" Then
					f_type_count = f_type_count + 1
				End If
				f_type$[f_type_count] = ""
			Else
				f_type$[f_type_count] = f_type$[f_type_count] + c$
			End If
		Next
	End If
	
	
	If base_dir$ <> start_dir$ Then
		ChangeDir(start_dir$)
	End If
	
	f$ = DirFirst$()
	
	Dim f_list$[MAX_FILES_IN_LIST]
	f_list_count = 0
	
	'Get a list of all the files
	While Trim$(f$) <> ""
		If Trim$(f$) <> "." And Trim$(f$) <> ".." Then
			file_ext$ = Mid(Trim$(f$), FindLastOf(".", Trim(f$))+1, Len(f$))
			If Not InList(f_type$, f_type_count, file_ext$) Then
				f_list$[f_list_count] = f$
				f_list_count = f_list_count + 1
			End If
		End If
		
		If f_list_count >= MAX_FILES_IN_LIST Then
			MAX_FILES_IN_LIST = MAX_FILES_IN_LIST + 1000
			ReDim f_list$[MAX_FILES_IN_LIST]
		End If
		
		f$ = DirNext$()
	Wend
	
	'Sort the list
	For i = 0 to f_list_count-1
		For j = 0 to f_list_count-1
			If UCase$(f_list$[j]) > UCase$(f_list$[i]) Then
				tmp$ = f_list$[i]
				f_list$[i] = f_list$[j]
				f_list$[j] = tmp$
			End If
		Next
	Next
	
	'Add Sorted list
	Gui_ListBox_AddItem(file_listbox, "..")
	
	For i = 0 to f_list_count-1
		Gui_ListBox_AddItem(file_listbox, f_list$[i])
	Next
	
	Gui_TextField_SetValue(dir_field, start_dir$)
	
	ChangeDir(base_dir$)
	
	Return True
End Function

MAX_MESH_ITEMS = 1000
Dim meshList_editor_mesh_index[MAX_MESH_ITEMS] 'This will need to be adjusted to stay in alignment with the meshList_listBox
meshList_editor_mesh_count = 0

Function Mesh_Import_Dialog(start_dir$)
	base_dir$ = Dir$
	dialog_win = Gui_WindowOpen("Import Mesh", WINDOWPOS_CENTERED, WINDOWPOS_CENTERED, 640, 480) 'open a window
	Gui_SetWindowActive(dialog_win)
	SetWindowResizable(win, false)
	
	'Panels
	dialog_panel = Gui_CreatePanel(640, 480)

	'Add Panels to Window
	Gui_Window_AddPanel(dialog_win, dialog_panel, 0, 0)
	
	dialog_dir_label = Gui_CreateLabel("Dir", 60, 20)
	Gui_Panel_AddObject(dialog_panel, dialog_dir_label, 5, 5)
	
	dialog_dir_field = Gui_CreateTextField(550, 20)
	Gui_Panel_AddObject(dialog_panel, dialog_dir_field, 50, 5)
	
	dialog_files_listBox = Gui_CreateListBox(595, 360)
	Gui_Panel_AddObject(dialog_panel, dialog_files_listBox, 5, 30)
	
	dialog_animationFlag_checkBox = Gui_CreateCheckBox(20, 20)
	Gui_Panel_AddObject(dialog_panel, dialog_animationFlag_checkBox, 5, 400)
	
	dialog_animationFlag_label = Gui_CreateLabel("Import Animation with Mesh", 250, 20)
	Gui_Panel_AddObject(dialog_panel, dialog_animationFlag_label, 30, 400)
	
	dialog_importSelected_button = Gui_CreateButton("Import Selected", 200, 20)
	Gui_Panel_AddObject(dialog_panel, dialog_importSelected_button, 5, 440)
	
	dialog_importAll_button = Gui_CreateButton("Import All", 200, 20)
	Gui_Panel_AddObject(dialog_panel, dialog_importAll_button, 210, 440)
	
	dialog_cancel_button = Gui_CreateButton("Cancel", 200, 20)
	Gui_Panel_AddObject(dialog_panel, dialog_cancel_button, 415, 440)
	
	'Init Directory and File List
	Init_File_Dialog(start_dir$, dialog_dir_field, dialog_files_listBox, "obj")
	
	'Dialog Event Loop
	While WindowExists(dialog_win)
		If Gui_Button_Clicked(dialog_cancel_button) Then
			Exit While
		ElseIf Gui_Button_Clicked(dialog_importSelected_button) Then
			import_file$ = Gui_ListBox_GetValue$(dialog_files_listBox, Gui_ListBox_GetSelectedItem(dialog_files_listBox))
			import_dir$ = Gui_TextField_GetValue$(dialog_dir_field)
			import_file_full_path$ = Gui_AppendDir$(import_dir$, import_file$)
			import_mesh = Editor_LoadMesh(import_file_full_path$)
			
			If import_mesh >= 0 Then
				item = Gui_ListBox_AddItem(mesh_meshList_listbox, import_file$)
				meshList_editor_mesh_index[item] = import_mesh
				
				meshList_editor_mesh_count = meshList_editor_mesh_count + 1
				Gui_ListBox_SetSelectedItem(mesh_meshList_listbox, item)
				 'print "item added"
			'Else
				'print "Import Failed: ";import_file_full_path$
			End If
			
			Exit While
		
		ElseIf Gui_Button_Clicked(dialog_importAll_button) Then
			
			import_dir$ = Gui_TextField_GetValue$(dialog_dir_field)
			i_count = 0
			
			For i = 0 to Gui_ListBox_GetCount(dialog_files_listBox) -1
				import_file$ = Gui_ListBox_GetValue$(dialog_files_listBox, i)
				import_file_full_path$ = Gui_AppendDir$(import_dir$, import_file$)
				import_mesh = Editor_LoadMesh(import_file_full_path$)
				
				If import_mesh >= 0 Then
					item = Gui_ListBox_AddItem(mesh_meshList_listbox, import_file$)
					meshList_editor_mesh_index[item] = import_mesh
					meshList_editor_mesh_count = meshList_editor_mesh_count + 1
					i_count = i_count + 1
				'Else
					'Print "Failed: ";import_file_full_path$
				End If
			Next
			
			'print "--ICount: "; Gui_ListBox_Count[dialog_files_listBox]
			
			Exit While
		End If
		
		Gui_Update()
	Wend
	
	Gui_WindowClose(dialog_win)
	Gui_SetWindowActive(win)
	Gui_ListBox_Update(mesh_meshList_listbox)
	
End Function



