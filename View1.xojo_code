#tag IOSView
Begin iosView View1
   BackButtonTitle =   ""
   Compatibility   =   ""
   LargeTitleMode  =   "2"
   Left            =   0
   NavigationBarVisible=   False
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "Xojo Speedometer"
   Top             =   0
   Begin iOSRectangle Rectangle1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Rectangle1, 4, BottomLayoutGuide, 4, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Rectangle1, 1, <Parent>, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Rectangle1, 2, <Parent>, 2, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Rectangle1, 3, <Parent>, 3, False, +1.00, 1, 1, 0, , True
      BorderColor     =   &c00000000
      BorderWidth     =   2.0
      CornerHeight    =   0.0
      CornerWidth     =   0.0
      FillColor       =   &c00000000
      Height          =   480.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   2
      Top             =   0
      Visible         =   True
      Width           =   320.0
      Begin iOSButton AboutButton
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   AboutButton, 8, , 0, False, +1.00, 1, 1, 30, , True
         AutoLayout      =   AboutButton, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, , True
         AutoLayout      =   AboutButton, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, 0, , True
         AutoLayout      =   AboutButton, 7, , 0, False, +1.00, 1, 1, 50, , True
         Caption         =   "About"
         Enabled         =   True
         Height          =   30.0
         Left            =   250
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Rectangle1"
         Scope           =   2
         TextColor       =   &c007AFF00
         TextFont        =   ""
         TextSize        =   0
         Top             =   20
         Visible         =   True
         Width           =   50.0
      End
   End
   Begin iOSLabel SpeedLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   SpeedLabel, 8, , 0, False, +1.00, 1, 1, 243, , True
      AutoLayout      =   SpeedLabel, 1, <Parent>, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   SpeedLabel, 2, <Parent>, 2, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   SpeedLabel, 3, TopLayoutGuide, 4, False, +1.00, 1, 1, *kStdControlGapV, , True
      Enabled         =   True
      Height          =   243.0
      Left            =   0
      LineBreakMode   =   "0"
      LockedInPosition=   False
      Scope           =   2
      Text            =   "0"
      TextAlignment   =   "1"
      TextColor       =   &cFF000000
      TextFont        =   "System Bold		"
      TextSize        =   148
      Top             =   28
      Visible         =   True
      Width           =   320.0
   End
   Begin iOSLocation SpeedTracker
      Accuracy        =   "0"
      AuthorizationState=   "0"
      Enabled         =   True
      Left            =   0
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Scope           =   2
      Top             =   0
   End
   Begin iOSSegmentedControl UnitsSelector
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   UnitsSelector, 4, BottomLayoutGuide, 3, False, +1.00, 1, 1, -*kStdControlGapV, , True
      AutoLayout      =   UnitsSelector, 8, , 0, True, +1.00, 1, 1, 29, , True
      AutoLayout      =   UnitsSelector, 1, <Parent>, 1, False, +1.00, 1, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   UnitsSelector, 2, <Parent>, 2, False, +1.00, 1, 1, -*kStdGapCtlToViewH, , True
      Caption         =   ""
      Enabled         =   True
      Height          =   29.0
      Left            =   20
      LockedInPosition=   False
      Scope           =   2
      Segments        =   "Kilometers per Hour\n\nTrue\rMiles per Hour\n\nFalse"
      Top             =   443
      Value           =   0
      Visible         =   True
      Width           =   280.0
   End
   Begin iOSLabel UnitLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   UnitLabel, 8, , 0, False, +1.00, 1, 1, 86, , True
      AutoLayout      =   UnitLabel, 1, UnitsSelector, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   UnitLabel, 2, UnitsSelector, 2, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   UnitLabel, 3, SpeedLabel, 4, False, +1.00, 1, 1, 0, , True
      Enabled         =   True
      Height          =   86.0
      Left            =   20
      LineBreakMode   =   "0"
      LockedInPosition=   False
      Scope           =   2
      Text            =   "km/h"
      TextAlignment   =   "1"
      TextColor       =   &cFFFFFF00
      TextFont        =   "System Bold		"
      TextSize        =   48
      Top             =   271
      Visible         =   True
      Width           =   280.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  SpeedTracker.Accuracy = iOSLocation.Accuracies.BestForNavigation
		  
		  If SpeedTracker.AuthorizationState = iOSLocation.AuthorizationStates.AuthorizedWhenInUse Then
		    // we've got our requested authorization state, start getting LocationChanged events
		    SpeedTracker.Enabled = True
		  Else
		    // we don't have authorization yet, so ask for it
		    SpeedTracker.RequestInUseAuthorization
		  End If
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events AboutButton
	#tag Event
		Sub Action()
		  Dim v As New AboutView
		  PushTo(v)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SpeedTracker
	#tag Event
		Sub AuthorizationChanged()
		  If Me.AuthorizationState = iOSLocation.AuthorizationStates.AuthorizedWhenInUse Then
		    // start getting LocationChanged events
		    Me.Enabled = True
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub LocationChanged(latitude As Double, longitude As Double, accuracy As Double, altitude As Double, altitudeAccuracy As Double, course As Double, speed As Double)
		  // speed is meters per second
		  Dim kph As Double = speed * 3.6
		  Dim mph As Double = kph / 1.60934
		  
		  If UnitsSelector.Value = 0 Then
		    SpeedLabel.Text = kph.ToText(Locale.Current, "###")
		    UnitLabel.Text = "km/h"
		  Else
		    SpeedLabel.Text = mph.ToText(Locale.Current, "###")
		    UnitLabel.Text = "MPH"
		  End If
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
