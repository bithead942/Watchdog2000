Public Class DiningRoom
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dv As DataView
        Dim strQuery As String

        strQuery = "SELECT Blind_ID, Blind_Current_State FROM dbo.Blinds_Control WHERE Blind_ID = 5"
        SqlDataSource1.SelectCommand() = strQuery
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)

        If CType(dv.Table.Rows(0)(1), Integer) = 100 Then
            lblBlinds.Text = "Closed"
        End If
        If CType(dv.Table.Rows(0)(1), Integer) = 50 Then
            lblBlinds.Text = "Down Open"
        End If
        If CType(dv.Table.Rows(0)(1), Integer) = 0 Then
            lblBlinds.Text = "Fully Closed"
        End If

        'Dining Room:  '2B.80.6A'
        'Front Hall:  '2B.80.FF'

        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text
        strQuery = "SELECT Device_ID, Device_Current_State FROM dbo.Insteon_Control WHERE "
        strQuery = strQuery & "Device_ID = '2B.80.6A' or Device_ID = '2B.80.FF'"
        SqlDataSource1.SelectCommand() = strQuery
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)

        If CType(dv.Table.Rows(0)(1), Integer) = 1 Then
            lblDiningRoom.Text = "On"
        Else
            lblDiningRoom.Text = "Off"
        End If

        If CType(dv.Table.Rows(1)(1), Integer) >= 1 Then
            lblFrontHallLight.Text = "On"
        Else
            lblFrontHallLight.Text = "Off"
        End If

    End Sub

    Protected Sub btnBlindsOpen_Click(sender As Object, e As EventArgs) Handles btnBlindsOpen.Click
        BlindsOpen("5")
    End Sub

    Protected Sub btnBlindsDownOpen_Click(sender As Object, e As EventArgs) Handles btnBlindsDownOpen.Click
        BlindsDownOpen("5")
    End Sub

    Protected Sub btnBlindsFullyClose_Click(sender As Object, e As EventArgs) Handles btnBlindsFullyClose.Click
        BlindsFullyClose("5")
    End Sub

    Protected Sub BlindsOpen(ByVal strBlindID As String)
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Blinds_Control SET Blind_Request_State = 0 WHERE Blind_ID = " & strBlindID
        SqlDataSource1.Update()

    End Sub

    Protected Sub BlindsDownOpen(ByVal strBlindID As String)
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Blinds_Control SET Blind_Request_State = 50 WHERE Blind_ID = " & strBlindID
        SqlDataSource1.Update()

    End Sub

    Protected Sub BlindsFullyClose(ByVal strBlindID As String)
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Blinds_Control SET Blind_Request_State = 100 WHERE Blind_ID = " & strBlindID
        SqlDataSource1.Update()

    End Sub

    Protected Sub btnDiningRoomLightOn_Click(sender As Object, e As EventArgs) Handles btnDiningRoomLightOn.Click
        LightOn("'2B.80.6A'")
    End Sub

    Protected Sub btnDiningRoomLightOff_Click(sender As Object, e As EventArgs) Handles btnDiningRoomLightOff.Click
        LightOff("'2B.80.6A'")
    End Sub

    Protected Sub btnFrontHallLightOn_Click(sender As Object, e As EventArgs) Handles btnFrontHallLightOn.Click
        LightOn("'2B.80.FF'")
    End Sub

    Protected Sub btnFrontHallLightOff_Click(sender As Object, e As EventArgs) Handles btnFrontHallLightOff.Click
        LightOff("'2B.80.FF'")
    End Sub

    Protected Sub LightOn(ByVal strDeviceID As String)
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Insteon_Control SET Device_Request_State = 1 WHERE Device_ID = " & strDeviceID
        SqlDataSource1.Update()

    End Sub

    Protected Sub LightOff(ByVal strDeviceID As String)
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Insteon_Control SET Device_Request_State = 0 WHERE Device_ID = " & strDeviceID
        SqlDataSource1.Update()

    End Sub
End Class