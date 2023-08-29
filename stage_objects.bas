'------------------------------START OF MESHES-------------------------------------------------
MAX_EDITOR_MESHES = 200
MAX_EDITOR_MESH_FRAMES = 1000
MAX_EDITOR_MESH_ANIMATIONS = 100

Dim editor_mesh_name$[MAX_EDITOR_MESHES]
Dim editor_mesh_file$[MAX_EDITOR_MESHES]
Dim editor_mesh_id[MAX_EDITOR_MESHES] 'C3D Mesh ID
Dim editor_mesh_texture[MAX_EDITOR_MESHES] 'This will be an index to an editor_texture
Dim editor_mesh_scale[MAX_EDITOR_MESHES]

Dim editor_mesh_type[MAX_EDITOR_MESHES]
EDITOR_MESH_TYPE_STATIC = 1
EDITOR_MESH_TYPE_ANIMATED = 2

Dim editor_mesh_HDMesh[MAX_EDITOR_MESHES] 'value will be index to another editor_mesh or -1 if none
Dim editor_mesh_HDMesh_distance[MAX_EDITOR_MESHES]

Dim editor_mesh_GeoMesh[MAX_EDITOR_MESHES]

'Very simple animation system that expects the translation, rotation, and scaling to be baked into each frame
'Each Frame will be a reference to an editor_mesh item
Dim editor_mesh_animation_frames[MAX_EDITOR_MESHES, MAX_EDITOR_MESH_ANIMATIONS, MAX_EDITOR_MESH_FRAMES]
Dim editor_mesh_animation_frame_times[MAX_EDITOR_MESHES, MAX_EDITOR_MESH_ANIMATIONS, MAX_EDITOR_MESH_FRAMES]


Function Editor_LoadMesh(mesh_file$)
	If DirExists(mesh_file$) Then
		'print "Directory"
		Return -1
	End If

	If Not FileExists(mesh_file$) Then
		Return -1
	End If
	
	id_index = -1
	For i = 0 to MAX_EDITOR_MESHES-1
		If editor_mesh_id[i] < 0 Then
			id_index = i
			Exit For
		End If
	Next
	
	If id_index < 0 Then
		Return -1
	End If
	
	editor_mesh_id[id_index] = C3D_LoadMesh(mesh_file$)
	
	If editor_mesh_id[id_index] < 0 Then
		Return -1
	End If
	
	editor_mesh_file$[id_index] = mesh_file$
	
	n = FindLastOf$(Gui_GetDirSeparator$(), mesh_file$)
	If n >= 0 Then
		mesh_file$ = Mid$(mesh_file$, n+1, Len(mesh_file$))+"_MESH"
	End If
	
	editor_mesh_name$[id_index] = Replace$(mesh_file$, " ", "_")
	editor_mesh_name$[id_index] = Replace$(editor_mesh_name$[id_index], ".obj", "")
	editor_mesh_name$[id_index] = Ucase$(editor_mesh_name$[id_index])
	
	editor_mesh_GeoMesh[id_index] = -1
	editor_mesh_HDMesh[id_index] = -1
	editor_mesh_HDMesh_distance[id_index] = -1
	
	editor_mesh_texture[id_index] = -1
	
	editor_mesh_scale[id_index] = 1
	
	Return id_index
End Function
			

'------------------------------END OF MESHES-------------------------------------------------


'------------------------------START OF TEXTURES-------------------------------------------------
MAX_EDITOR_TEXTURES = 500

Dim editor_texture_name$[MAX_EDITOR_TEXTURES]
Dim editor_texture_file$[MAX_EDITOR_TEXTURES]
Dim editor_texture_id[MAX_EDITOR_TEXTURES] 'C3D Texture ID

Function Editor_LoadTexture(texture_file$)
	id_index = -1
	For i = 0 to MAX_EDITOR_TEXTURES-1
		If editor_texture_id[i] < 0 Then
			id_index = i
			Exit For
		End If
	Next
	
	If id_index < 0 Then
		Return -1
	End If
	
	editor_texture_id[id_index] = C3D_LoadImage(texture_file$)
	
	If editor_texture_id[id_index] < 0 Then
		Return -1
	End If
	
	editor_texture_file$[id_index] = texture_file$
	editor_texture_name$[id_index] = texture_file$
	
	Return id_index
End Function


Sub Editor_SetMeshTexture(editor_mesh, editor_texture)
	editor_mesh_texture[editor_mesh] = editor_texture
End Sub
'------------------------------END OF TEXTURES-------------------------------------------------


'------------------------------START OF GEOMETRY-------------------------------------------------
' Currently, since Calamity3D does not have a way of moving a geometry, the editor will have to clear all geometry and add them back
' each time a geometry is removed.

MAX_EDITOR_GEOMETRY = 1000

Dim editor_geometry_id[MAX_EDITOR_GEOMETRY]
Dim editor_geometry_data[MAX_EDITOR_GEOMETRY, 12]
Dim editor_geometry_type[MAX_EDITOR_GEOMETRY]

Function Editor_Stage_AddGeometry(type, x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4)
	resource_id = -1
	
	For i = 0 to MAX_EDITOR_GEOMETRY-1
		If editor_geometry_id[i] < 0 Then
			resource_id = i
			Exit For
		End If
	Next
	
	If resource_id < 0 Then
		Return -1
	End If
	
	editor_geometry_id[resource_id] = C3D_AddStageGeometry(type, x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4)
	
	editor_geometry_type[resource_id] = type
		
	editor_geometry_data[resource_id, 0] = x1
	editor_geometry_data[resource_id, 1] = y1
	editor_geometry_data[resource_id, 2] = z1
		
	editor_geometry_data[resource_id, 3] = x2
	editor_geometry_data[resource_id, 4] = y2
	editor_geometry_data[resource_id, 5] = z2
		
	editor_geometry_data[resource_id, 6] = x3
	editor_geometry_data[resource_id, 7] = y3
	editor_geometry_data[resource_id, 8] = z3
		
	editor_geometry_data[resource_id, 9] = x4
	editor_geometry_data[resource_id, 10] = y4
	editor_geometry_data[resource_id, 11] = z4
	
	Return resource_id
	
End Function

'------------------------------END OF GEOMETRY-------------------------------------------------



MAX_EDITOR_ACTORS = 200

EDITOR_ACTOR_TYPE_MESH = 1
EDITOR_ACTOR_TYPE_SPRITE = 2


Dim editor_actor_name$[MAX_EDITOR_ACTORS]
Dim editor_actor_id[MAX_EDITOR_ACTORS] 'C3D actor ID
Dim editor_actor_type[MAX_EDITOR_ACTORS]
Dim editor_actor_index[MAX_EDITOR_ACTORS] 'Index in Editor Structure

editor_actor_count = 0


Function Editor_Stage_AddActor(actor_name$, actor_type, resource_id)
	editor_actor_name$[editor_actor_count] = actor_name$
	
	
	Select Case actor_type
	Case EDITOR_ACTOR_TYPE_MESH
		editor_actor_id[editor_actor_count] = C3D_CreateActor(C3D_ACTOR_TYPE_MESH, editor_mesh_id[resource_id])
		editor_actor_type[editor_actor_count] = EDITOR_ACTOR_TYPE_MESH
		editor_actor_index[editor_actor_count] = resource_id
	Case EDITOR_ACTOR_TYPE_SPRITE
		editor_actor_id[editor_actor_count] = C3D_CreateActor(C3D_ACTOR_TYPE_SPRITE, editor_mesh_id[resource_id])
		editor_actor_type[editor_actor_count] = EDITOR_ACTOR_TYPE_SPRITE
		editor_actor_index[editor_actor_count] = resource_id
	End Select
	
	ret_val = editor_actor_count
	editor_actor_count = editor_actor_count + 1
	
	Return ret_val
End Function

