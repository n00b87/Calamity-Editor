Function FindFirstOf(item$, search_string$)
	For i = 0 to length(search_string$)-1
		If Mid(search_string$, i, length(item$)) = item$ Then
			Return i
		End If
	Next
	Return -1
End Function

Function FindFirstNotOf(item$, search_string$)
	For i = 0 to length(search_string$)-1
		If Mid(search_string$, i, length(item$)) <> item$ Then
			Return i
		End If
	Next
	Return -1
End Function

Function FindNextOf(item$, search_string$, start)
	If start >= length(search_string$) Then
		Return -1
	End If
	For i = start to length(search_string$) - 1
		If Mid(search_string$, i, length(item$)) = item$ Then
			Return i
		End If
	Next
	Return -1
End Function

Function FindLastOf(item$, search_string$)
	If length(search_string$) <= 0 Then
		Return -1
	End If
	last_index = -1
	For i = 0 to length(search_string$)-1
		If Mid$(search_string$, i, 1) = item$ Then
			last_index = i
		End If
	Next
	Return last_index
End Function

Function InList(ByRef list$, list_count, item$)
	For i = 0 to list_count-1
		If item$ = list$[i] Then
			Return False
		End If
	Next
	Return True
End Function
