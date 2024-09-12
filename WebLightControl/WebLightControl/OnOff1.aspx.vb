Public Class WebForm1
    Inherits System.Web.UI.Page
    Dim strDeviceID

    Private Sub form1_Load(sender As Object, e As EventArgs) Handles form1.Load
        Dim iCurrentState As Integer
        Dim dv As DataView
        Dim strButtonID As String

        strButtonID = CType(Session.Item("ButtonID"), String)

        If strButtonID = "TestLamp" Then
            lblTitle.Text = "Test Lamp"
            strDeviceID = "'1F.4A.5F'"
        End If

        If strButtonID = "FDCoach" Then
            lblTitle.Text = "Front Door Coach Lights"
            strDeviceID = "'33.67.22'"
        End If

        If strButtonID = "GDCoach" Then
            lblTitle.Text = "Garage Door Coach Lights"
            strDeviceID = "'17.A6.A9'"
        End If

        If strButtonID = "SpiderLamp" Then
            lblTitle.Text = "Spider Lamp"
            strDeviceID = "'1A.F4.47'"
        End If

        If strButtonID = "ShellLamp" Then
            lblTitle.Text = "Shell Lamp"
            strDeviceID = "'20.25.3A'"
        End If

        If strButtonID = "ArtRoom" Then
            lblTitle.Text = "Art Room"
            strDeviceID = "'22.10.0C'"
        End If

        If strButtonID = "ServerRoom" Then
            lblTitle.Text = "Server Room"
            strDeviceID = "'22.12.76'"
        End If

        If strButtonID = "Kitchen" Then
            lblTitle.Text = "Kitchen"
            strDeviceID = "'22.10.09'"
        End If

        If strButtonID = "LivingRoom" Then
            lblTitle.Text = "Living Room"
            strDeviceID = "'22.13.0E'"
        End If

        If strButtonID = "SydneyBedroom" Then
            lblTitle.Text = "Sydney's Bedroom Light"
            strDeviceID = "'23.C5.30'"
        End If

        If strButtonID = "EthanBedroom" Then
            lblTitle.Text = "Ethan's Bedroom Light"
            strDeviceID = "'23.B6.EB'"
        End If

        If strButtonID = "Pantry" Then
            lblTitle.Text = "Pantry"
            strDeviceID = "'22.13.0C'"
        End If

        If strButtonID = "KidsBathroom" Then
            lblTitle.Text = "Kid's Bathroom"
            strDeviceID = "'23.DB.10'"
        End If

        If strButtonID = "MasterBedroom" Then
            lblTitle.Text = "Master Bedroom Light"
            strDeviceID = "'20.E5.84'"
        End If

        If strButtonID = "MasterBathroom" Then
            lblTitle.Text = "Master Bathroom"
            strDeviceID = "'23.E2.E4'"
        End If

        If strButtonID = "MasterCloset" Then
            lblTitle.Text = "Master Closet"
            strDeviceID = "'23.EA.1D'"
        End If

        If strButtonID = "SpareBedroom" Then
            lblTitle.Text = "Spare Bedroom Light"
            strDeviceID = "'22.56.9E'"
        End If

        If strButtonID = "PlayRoomEast" Then
            lblTitle.Text = "Play Room East (L)"
            strDeviceID = "'22.85.9B'"
        End If

        If strButtonID = "PlayRoomWest" Then
            lblTitle.Text = "Play Room West (R)"
            strDeviceID = "'22.10.A1'"
        End If

        If strButtonID = "MudRoom" Then
            lblTitle.Text = "Mud Room"
            strDeviceID = "'29.27.CE'"
        End If

        If strButtonID = "KitchenNook" Then
            lblTitle.Text = "Kitchen Breakfast Nook"
            strDeviceID = "'29.2B.1F'"
        End If

        If strButtonID = "KidsHallway" Then
            lblTitle.Text = "Kids Hallway"
            strDeviceID = "'29.2A.B9'"
        End If

        If strButtonID = "SconceLights" Then
            lblTitle.Text = "Sconce Lights"
            strDeviceID = "'29.27.9D'"
        End If

        If strButtonID = "BasementStairs" Then
            lblTitle.Text = "Basement Stairs"
            strDeviceID = "'29.2B.68'"
        End If

        If strButtonID = "BasementN" Then
            lblTitle.Text = "Basement North"
            strDeviceID = "'29.2B.11'"
        End If

        If strButtonID = "BasementMid" Then
            lblTitle.Text = "Basement Middle"
            strDeviceID = "'29.27.89'"
        End If

        If strButtonID = "MasterBRFan" Then
            lblTitle.Text = "Master Bedroom Fan"
            strDeviceID = "'2A.39.F6'"
        End If

        If strButtonID = "SydneyBRFan" Then
            lblTitle.Text = "Sydney's Bedroom Fan"
            strDeviceID = "'2A.3D.80'"
        End If

        If strButtonID = "EthanBRFan" Then
            lblTitle.Text = "Ethan's Bedroom Fan"
            strDeviceID = "'2A.3B.F0'"
        End If

        If strButtonID = "SpareBRFan" Then
            lblTitle.Text = "Spare Bedroom Fan"
            strDeviceID = "'2A.3F.41'"
        End If

        If strButtonID = "BackyardSpot" Then
            lblTitle.Text = "Backyard Spot"
            strDeviceID = "'2B.82.42'"
        End If

        If strButtonID = "DiningRoom" Then
            lblTitle.Text = "Dining Room"
            strDeviceID = "'2B.80.6A'"
        End If

        If strButtonID = "FrontHall" Then
            lblTitle.Text = "Front Hall"
            strDeviceID = "'2B.80.FF'"
        End If

        If strButtonID = "BasementS" Then
            lblTitle.Text = "Basement South"
            strDeviceID = "'2B.83.1F'"
        End If

        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text
        SqlDataSource1.SelectCommand() = "SELECT Device_Current_State FROM dbo.Insteon_Control WHERE Device_ID = " & strDeviceID
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        iCurrentState = CType(dv.Table.Rows(0)(0), Integer)
        If iCurrentState = 1 Then
            lblCurrentState.Text = "On"
        Else
            lblCurrentState.Text = "Off"
        End If

    End Sub

    Protected Sub btnOn_Click(sender As Object, e As EventArgs) Handles btnOn.Click
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Insteon_Control SET Device_Request_State = 1 WHERE Device_ID = " & strDeviceID
        SqlDataSource1.Update()

    End Sub

    Protected Sub btnOff_Click(sender As Object, e As EventArgs) Handles btnOff.Click
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Insteon_Control SET Device_Request_State = 0 WHERE Device_ID = " & strDeviceID
        SqlDataSource1.Update()

    End Sub

End Class