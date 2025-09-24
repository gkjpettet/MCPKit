#tag Class
Protected Class ToolParameter
	#tag Method, Flags = &h0
		Sub Constructor(name As String, type As MCPKit.ToolParameterTypes, description As String, hasDefault As Boolean, default As Variant, required As Boolean)
		  #Pragma BreakOnExceptions False
		  
		  If name = "" Then
		    Raise New InvalidArgumentException("A tool parameter must have a name.")
		  Else
		    Self.Name = name
		  End If
		  
		  Self.Type = type
		  
		  If description = "" Then
		    Raise New InvalidArgumentException("A tool parameter must have a description.")
		  Else
		    Self.Description = description
		  End If
		  
		  Self.HasDefault = hasDefault
		  
		  If hasDefault Then
		    If Not DefaultValueIsValidType(default, type) Then
		      Raise New InvalidArgumentException("Invalid default value provided for tool parameter.")
		    Else
		      Self.Default = default
		    End If
		  End If
		  
		  Self.Required = required
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E7320547275652069662074686520706173736565642076616C756520697320612076616C69642064656661756C742076616C756520666F7220746865207370656369666965642070726F706572747920747970652E
		Protected Function DefaultValueIsValidType(value As Variant, type As MCPKit.ToolParameterTypes) As Boolean
		  /// Returns True if the passeed value is a valid default value for the specified property type.
		  
		  #Pragma BreakOnExceptions False
		  
		  If value Is Nil And type <> MCPKit.ToolParameterTypes.Object_ Then
		    Return False
		  End If
		  
		  Select Case type
		  Case MCPKit.ToolParameterTypes.Array_
		    Return value.IsArray
		    
		  Case MCPKit.ToolParameterTypes.Boolean_
		    Return value.Type = Variant.TypeBoolean
		    
		  Case MCPKit.ToolParameterTypes.Integer_
		    Return (value.Type = Variant.TypeInt32) Or (value.Type = Variant.TypeInt64)
		    
		  Case MCPKit.ToolParameterTypes.Number_
		    Return value.IsNumeric
		    
		  Case MCPKit.ToolParameterTypes.Object_
		    Return True
		    
		  Case MCPKit.ToolParameterTypes.String_
		    Return value.Type = Variant.TypeString
		    
		  Else
		    Raise New UnsupportedOperationException("Unsupported tool parameter type.")
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, Description = 52657475726E7320746869732070726F70657274792061732061204A534F4E206974656D2E
		Function ToJSONItem() As JSONItem
		  /// Returns this property as a JSON item.
		  
		  Var json As New JSONItem
		  
		  json.Value("type") = TypeAsString
		  json.Value("description") = Description
		  If HasDefault Then
		    json.Value("default") = If(Default = Nil, "null", Default.StringValue)
		  End If
		  
		  Return json
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, Description = 52657475726E73207468697320706172616D6574657227732074797065206173206120737472696E672E
		Protected Function TypeAsString() As String
		  /// Returns this parameter's type as a string.
		  
		  Select Case Type
		  Case MCPKit.ToolParameterTypes.Array_
		    Return "array"
		    
		  Case MCPKit.ToolParameterTypes.Boolean_
		    Return "boolean"
		    
		  Case MCPKit.ToolParameterTypes.Integer_
		    Return "integer"
		    
		  Case MCPKit.ToolParameterTypes.Number_
		    Return "number"
		    
		  Case MCPKit.ToolParameterTypes.Object_
		    Return "object"
		    
		  Case MCPKit.ToolParameterTypes.String_
		    Return "string"
		    
		  Else
		    // Just default to string type.
		    Return "string"
		  End Select
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0, Description = 5468652064656661756C742076616C756520666F7220746869732070726F70657274792028696620697420686173206F6E65292E
		Default As Variant
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 41206465736372697074696F6E206F6620746869732070726F70657274792E
		Description As String
	#tag EndProperty

	#tag Property, Flags = &h0
		HasDefault As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546865206E616D65206F6620746869732070726F70657274792E
		Name As String
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 5768657468657220746869732070726F7065727479206973207265717569726564206F72206E6F742E
		Required As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0, Description = 546869732070726F7065727479277320747970652E
		Type As MCPKit.ToolParameterTypes
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
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasDefault"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Required"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
