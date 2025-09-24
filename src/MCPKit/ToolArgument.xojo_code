#tag Class
Protected Class ToolArgument
	#tag Method, Flags = &h0
		Sub Constructor(name As String, type As MCPKit.ToolParameterTypes, value As Variant)
		  Self.Name = name
		  Self.Type = type
		  Self.Value = value
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 546865206E616D65206F66207468697320617267756D656E742E
		Name As String
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5468697320617267756D656E74277320747970652E
		Type As MCPKit.ToolParameterTypes
	#tag EndProperty

	#tag Property, Flags = &h0
		Value As Variant
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
