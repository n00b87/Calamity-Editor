stage_axis_label = Gui_CreateLabel("AXIS", 100, 20)
stage_axis_x_button = Gui_CreateImageButton("gui_gfx/x_axis.png", 20, 20)
stage_axis_y_button = Gui_CreateImageButton("gui_gfx/y_axis.png", 20, 20)
stage_axis_z_button = Gui_CreateImageButton("gui_gfx/z_axis.png", 20, 20)

For i = stage_axis_x_button to stage_axis_x_button+2
	Gui_Button_SetToggleFlag(i, true)
	Gui_Button_SetValue(i, true)
Next

Gui_Panel_AddObject(stage_axis_panel, stage_axis_label, 5, 5)
Gui_Panel_AddObject(stage_axis_panel, stage_axis_x_button, 5, 30)
Gui_Panel_AddObject(stage_axis_panel, stage_axis_y_button, 30, 30)
Gui_Panel_AddObject(stage_axis_panel, stage_axis_z_button, 55, 30)


stage_tools_label = Gui_CreateLabel("TOOLS", 100, 20)
stage_tools_select_button = Gui_CreateImageButton("gui_gfx/select.png", 30, 30)
stage_tools_box_select_button = Gui_CreateImageButton("gui_gfx/box_select.png", 30, 30)
stage_tools_move_button = Gui_CreateImageButton("gui_gfx/move.png", 30, 30)
stage_tools_rotate_button = Gui_CreateImageButton("gui_gfx/rotate.png", 30, 30)
stage_tools_scale_button = Gui_CreateImageButton("gui_gfx/scale.png", 30, 30)

stage_tools_toggleGroup = Gui_CreateButtonToggleGroup()

Gui_Panel_AddObject(stage_tools_panel, stage_tools_label, 5, 5)

For i = stage_tools_select_button to stage_tools_select_button+4
	x = i - stage_tools_select_button
	Gui_Button_SetToggleFlag(i, true)
	Gui_ButtonToggleGroup_AddButton(stage_tools_toggleGroup, i)
	Gui_Panel_AddObject(stage_tools_panel, i, 5 + (x*30) + (x*5), 30)
Next


SELECTED_ITEM_TYPE_NONE = 0
SELECTED_ITEM_TYPE_OBJECT = 1
SELECTED_ITEM_TYPE_GEOMETRY = 2
SELECTED_ITEM_TYPE_POINT = 3
SELECTED_ITEM_TYPE_EDGE = 4
SELECTED_ITEM_TYPE_FACE = 5

Dim Selected_Items[999]
Selected_Items_Count = 0

STAGE_TOOLS_STATE_SELECT = 1
STAGE_TOOLS_STATE_BOX = 2
STAGE_TOOLS_STATE_MOVE = 3
STAGE_TOOLS_STATE_ROTATE = 4
STAGE_TOOLS_STATE_SCALE = 5

Function GetStageToolsState()
	Select Case Gui_ButtonToggleGroup_GetActiveButton(stage_tools_toggleGroup)
	Case stage_tools_select_button
		Return STAGE_TOOLS_STATE_SELECT
	Case stage_tools_box_select_button
		Return STAGE_TOOLS_STATE_BOX
	Case stage_tools_move_button
		Return STAGE_TOOLS_STATE_MOVE
	Case stage_tools_rotate_button
		Return STAGE_TOOLS_STATE_ROTATE
	Case stage_tools_scale_button
		Return STAGE_TOOLS_STATE_SCALE
	End Select
	Return -1
End Function

Sub Stage_Select(x, y)

End Sub
