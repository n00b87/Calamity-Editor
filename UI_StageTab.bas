stage_axis_panel = Gui_CreatePanel(300, 55)
Gui_Window_AddPanel(win, stage_axis_panel, 5, 70)
Gui_TabGroup_Tab_AddObject(main_tabGroup, main_tabGroup_stageTab, stage_axis_panel)

stage_tools_panel = Gui_CreatePanel(300, 65)
Gui_Window_AddPanel(win, stage_tools_panel, 5, 130)
Gui_TabGroup_Tab_AddObject(main_tabGroup, main_tabGroup_stageTab, stage_tools_panel)


'Main TabGroup -> Stage Tab
stage_object_tabGroup = Gui_CreateTabGroup(300, 30)

stage_object_tabGroup_primitiveTab = Gui_TabGroup_AddTab(stage_object_tabGroup, "Primitives")
stage_object_tabGroup_meshTab = Gui_TabGroup_AddTab(stage_object_tabGroup, "Mesh")
stage_object_tabGroup_geometryTab = Gui_TabGroup_AddTab(stage_object_tabGroup, "Geometry")


'stage_object_tabGroup -> Primitive Tab 
stage_object_tabGroup_primitiveTab_selectionPanel = Gui_CreatePanel(300, 200)
Gui_Window_AddPanel(win, stage_object_tabGroup_primitiveTab_selectionPanel, 5, 230)
Gui_TabGroup_Tab_AddObject(stage_object_tabGroup, stage_object_tabGroup_primitiveTab, stage_object_tabGroup_primitiveTab_selectionPanel)

'stage_object_tabGroup -> Mesh Tab 
stage_object_tabGroup_meshTab_selectionPanel = Gui_CreatePanel(300, 200)
Gui_Window_AddPanel(win, stage_object_tabGroup_meshTab_selectionPanel, 5, 230)
Gui_TabGroup_Tab_AddObject(stage_object_tabGroup, stage_object_tabGroup_meshTab, stage_object_tabGroup_meshTab_selectionPanel)

'stage_object_tabGroup -> Geometry Tab 
stage_object_tabGroup_geometryTab_selectionPanel = Gui_CreatePanel(300, 200)
Gui_Window_AddPanel(win, stage_object_tabGroup_geometryTab_selectionPanel, 5, 230)
Gui_TabGroup_Tab_AddObject(stage_object_tabGroup, stage_object_tabGroup_geometryTab, stage_object_tabGroup_geometryTab_selectionPanel)


Gui_Window_AddTabGroup(win, stage_object_tabGroup, 5, 200)
Gui_TabGroup_Tab_AddObject(main_tabGroup, main_tabGroup_stageTab, stage_object_tabGroup)



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

'------------------testing-------------------
'tst_button = Gui_CreateImageButton("gui_gfx/rcbasic.png", 30, 30)
'Gui_Panel_AddObject(stage_meshSelector_tabGroup_meshTab_selectionPanel, tst_button, 5, 5)
'--------------------------------------------

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