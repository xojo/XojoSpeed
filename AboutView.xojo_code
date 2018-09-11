#tag IOSView
Begin iosView AboutView
   BackButtonTitle =   ""
   Compatibility   =   ""
   LargeTitleMode  =   "1"
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "About Xojo Speed"
   Top             =   0
   Begin iOSLabel AboutLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   AboutLabel, 8, , 0, False, +1.00, 4, 1, 170, , True
      AutoLayout      =   AboutLabel, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   AboutLabel, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   AboutLabel, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      Enabled         =   True
      Height          =   170.0
      Left            =   20
      LineBreakMode   =   "0"
      LockedInPosition=   False
      Scope           =   2
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   73
      Visible         =   True
      Width           =   280.0
   End
   Begin iOSToolButton GitHubButton
      Caption         =   "GitHub"
      Enabled         =   True
      Height          =   22
      Image           =   "0"
      Image           =   "0"
      Left            =   8
      LockedInPosition=   False
      Scope           =   2
      Top             =   446
      Type            =   "1001"
      Width           =   53.0
   End
   Begin iOSImageView LogoImage
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   LogoImage, 8, , 0, False, +1.00, 4, 1, 160, , True
      AutoLayout      =   LogoImage, 1, AboutLabel, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   LogoImage, 2, AboutLabel, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   LogoImage, 3, AboutLabel, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      ContentMode     =   "1"
      Height          =   160.0
      Image           =   "489998335"
      Image           =   "489998335"
      Left            =   20
      LockedInPosition=   False
      Scope           =   2
      Top             =   251
      Visible         =   True
      Width           =   280.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub ToolbarPressed(button As iOSToolButton)
		  Select Case button
		  Case GitHubButton
		    Call ShowURL("https://github.com/xojo/XojoSpeed")
		  End Select
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function ShowURL(url As Text) As Boolean
		  // NSString* launchUrl = @"http://www.xojo.com/";
		  // [[UIApplication sharedApplication] openURL:[NSURL URLWithString: launchUrl]];
		  
		  Declare Function NSClassFromString Lib "Foundation" (name As CFStringRef) As Ptr
		  Declare Function sharedApplication Lib "UIKit" Selector "sharedApplication" (obj As Ptr) As Ptr
		  Dim sharedApp As Ptr = sharedApplication(NSClassFromString("UIApplication"))
		  
		  // https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSURL_Class/#//apple_ref/occ/clm/NSURL/URLWithString:
		  Declare Function URLWithString Lib "Foundation" Selector "URLWithString:" ( id As Ptr, URLString As CFStringRef ) As Ptr
		  Dim nsURL As Ptr = URLWithString(NSClassFromString("NSURL"), url)
		  
		  // https://developer.apple.com/Library/ios/documentation/UIKit/Reference/UIApplication_Class/index.html#//apple_ref/occ/instm/UIApplication/openURL:
		  Declare Function openURL Lib "UIKit" Selector "openURL:" (id As Ptr, nsurl As Ptr) As Boolean
		  Return openURL(sharedApp, nsURL)
		End Function
	#tag EndMethod


	#tag Constant, Name = kAboutText, Type = Text, Dynamic = False, Default = \"Xojo Speed is made with Xojo\x2C a multi-platform development tool that makes it super-easy to create your own iOS apps.\n\nWant to see how Xojo Speedometer was made\?\n\nUse the button below to get the full source code for Xojo Speedometer on GitHub.", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events AboutLabel
	#tag Event
		Sub Open()
		  Me.Text = kAboutText
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="LargeTitleMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackButtonTitle"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="NavigationBarVisible"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Group="Behavior"
		Type="iOSImage"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabTitle"
		Group="Behavior"
		Type="Text"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
