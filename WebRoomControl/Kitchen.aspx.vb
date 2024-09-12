Public Class Kitchen
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dv As DataView
        Dim strQuery As String

        'Kitchen Nook:  '29.2B.1F'
        'Pantry Light:  '22.13.0C'
        'Kitchen Light:  '22.10.09'
        'Mud Room Light:  '29.27.CE'

        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text
        strQuery = "SELECT Device_ID, Device_Current_State FROM dbo.Insteon_Control WHERE Device_ID = '29.2B.1F' or Device_ID = '22.13.0C' or Device_ID = '22.10.09' or Device_ID = '29.27.CE'"
        SqlDataSource1.SelectCommand() = strQuery
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)


        If CType(dv.Table.Rows(0)(1), Integer) = 1 Then
            lblKitchenNookLight.Text = "On"
        Else
            lblKitchenNookLight.Text = "Off"
        End If

        If CType(dv.Table.Rows(1)(1), Integer) = 1 Then
            lblPantryLight.Text = "On"
        Else
            lblPantryLight.Text = "Off"
        End If

        If CType(dv.Table.Rows(2)(1), Integer) = 1 Then
            lblKitchenLight.Text = "On"
        Else
            lblKitchenLight.Text = "Off"
        End If

        If CType(dv.Table.Rows(3)(1), Integer) = 1 Then
            lblMudRoomLight.Text = "On"
        Else
            lblMudRoomLight.Text = "Off"
        End If

        strQuery = "SELECT Blind_ID, Blind_Current_State FROM dbo.Blinds_Control WHERE Blind_ID = 1 or Blind_ID = 2"
        SqlDataSource1.SelectCommand() = strQuery
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)

        If CType(dv.Table.Rows(0)(1), Integer) = 100 Then
            lblNorthShade.Text = "Closed"
        End If
        If CType(dv.Table.Rows(0)(1), Integer) = 50 Then
            lblNorthShade.Text = "50%"
        End If
        If CType(dv.Table.Rows(0)(1), Integer) = 0 Then
            lblNorthShade.Text = "Open"
        End If

        If CType(dv.Table.Rows(1)(1), Integer) = 100 Then
            lblSouthShade.Text = "Closed"
        End If

        If CType(dv.Table.Rows(1)(1), Integer) = 50 Then
            lblSouthShade.Text = "50%"
        End If
        If CType(dv.Table.Rows(1)(1), Integer) = 0 Then
            lblSouthShade.Text = "Open"
        End If

        strQuery = "SELECT Kitchen FROM dbo.Temp_Current_State"
        SqlDataSource1.SelectCommand() = strQuery
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        lblTemp.Text = dv.Table.Rows(0)(0)

    End Sub

    Protected Sub btnKitchenLightOn_Click(sender As Object, e As EventArgs) Handles btnKitchenLightOn.Click
        LightOn("'22.10.09'")
    End Sub

    Protected Sub btnKitchenLightOff_Click(sender As Object, e As EventArgs) Handles btnKitchenLightOff.Click
        LightOff("'22.10.09'")
    End Sub

    Protected Sub btnKitchenNookOn_Click(sender As Object, e As EventArgs) Handles btnKitchenNookOn.Click
        LightOn("'29.2B.1F'")
    End Sub

    Protected Sub btnKitchenNookOff_Click(sender As Object, e As EventArgs) Handles btnKitchenNookOff.Click
        LightOff("'29.2B.1F'")
    End Sub

    Protected Sub btnMudRoomLightOn_Click(sender As Object, e As EventArgs) Handles btnMudRoomLightOn.Click

    End Sub

    Protected Sub btnMudRoomLightOff_Click(sender As Object, e As EventArgs) Handles btnMudRoomLightOff.Click

    End Sub

    Protected Sub btnPantryLightOn_Click(sender As Object, e As EventArgs) Handles btnPantryLightOn.Click
        LightOn("'22.13.0C'")
    End Sub

    Protected Sub lblPantryLightOff_Click(sender As Object, e As EventArgs) Handles lblPantryLightOff.Click
        LightOff("'22.13.0C'")
    End Sub

    Protected Sub btnNorthShadeOpen_Click(sender As Object, e As EventArgs) Handles btnNorthShadeOpen.Click
        BlindsOpen("1")
    End Sub

    Protected Sub btnNorthShadeHalf_Click(sender As Object, e As EventArgs) Handles btnNorthShadeHalf.Click
        BlindsHalf("1")
    End Sub

    Protected Sub btnNorthShadeClose_Click(sender As Object, e As EventArgs) Handles btnNorthShadeClose.Click
        BlindsClose("1")
    End Sub

    Protected Sub btnSouthShadeOpen_Click(sender As Object, e As EventArgs) Handles btnSouthShadeOpen.Click
        BlindsOpen("2")
    End Sub

    Protected Sub btnSouthShadeHalf_Click(sender As Object, e As EventArgs) Handles btnSouthShadeHalf.Click
        BlindsHalf("2")
    End Sub

    Protected Sub btnSouthShadeClose_Click(sender As Object, e As EventArgs) Handles btnSouthShadeClose.Click
        BlindsClose("2")
    End Sub

    Protected Sub LightOn(ByVal strDeviceID As String)
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Insteon_Control SET Device_Request_State = 1 WHERE Device_ID = " & strDeviceID
        SqlDataSource1.Update()

    End Sub

    Protected Sub LightOff(ByVal strDeviceID As String)
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Insteon_Control SET Device_Request_State = 0 WHERE Device_ID = " & strDeviceID
        SqlDataSource1.Update()

    End Sub

    Protected Sub BlindsOpen(ByVal strBlindID As String)
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Blinds_Control SET Blind_Request_State = 0 WHERE Blind_ID = " & strBlindID
        SqlDataSource1.Update()

    End Sub

    Protected Sub BlindsHalf(ByVal strBlindID As String)
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Blinds_Control SET Blind_Request_State = 50 WHERE Blind_ID = " & strBlindID
        SqlDataSource1.Update()

    End Sub

    Protected Sub BlindsClose(ByVal strBlindID As String)
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Blinds_Control SET Blind_Request_State = 100 WHERE Blind_ID = " & strBlindID
        SqlDataSource1.Update()

    End Sub

End Class