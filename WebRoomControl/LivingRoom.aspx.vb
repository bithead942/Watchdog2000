Public Class LivingRoom
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dv As DataView
        Dim strQuery As String

        'Living Room Light:  '22.13.0E'
        'Shell Lamp:  '20.25.3A'


        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text
        strQuery = "SELECT Device_ID, Device_Current_State FROM dbo.Insteon_Control WHERE Device_ID = '22.13.0E' or Device_ID = '20.25.3A'"
        SqlDataSource1.SelectCommand() = strQuery
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)


        If CType(dv.Table.Rows(0)(1), Integer) = 1 Then
            lblShellLamp.Text = "On"
        Else
            lblShellLamp.Text = "Off"
        End If

        If CType(dv.Table.Rows(1)(1), Integer) = 1 Then
            lblLivingRoomLight.Text = "On"
        Else
            lblLivingRoomLight.Text = "Off"
        End If

        strQuery = "SELECT Blind_ID, Blind_Current_State FROM dbo.Blinds_Control WHERE Blind_ID = 3"
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

        strQuery = "SELECT Living_Room FROM dbo.Temp_Current_State"
        SqlDataSource1.SelectCommand() = strQuery
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        lblTemp.Text = dv.Table.Rows(0)(0)

    End Sub

    Protected Sub btnLivingRoomLightOn_Click(sender As Object, e As EventArgs) Handles btnLivingRoomLightOn.Click
        LightOn("'22.13.0E'")
    End Sub

    Protected Sub btnLivingRoomLightOff_Click(sender As Object, e As EventArgs) Handles btnLivingRoomLightOff.Click
        LightOff("'22.13.0E'")
    End Sub

    Protected Sub btnShellLampOn_Click(sender As Object, e As EventArgs) Handles btnShellLampOn.Click
        LightOn("'20.25.3A'")
    End Sub

    Protected Sub btnShellLampOff_Click(sender As Object, e As EventArgs) Handles btnShellLampOff.Click
        LightOff("'20.25.3A'")
    End Sub

    Protected Sub btnBlindsOpen_Click(sender As Object, e As EventArgs) Handles btnBlindsOpen.Click
        BlindsOpen("3")
    End Sub

    Protected Sub btnBlindsDownOpen_Click(sender As Object, e As EventArgs) Handles btnBlindsDownOpen.Click
        BlindsDownOpen("3")
    End Sub

    Protected Sub btnBlindsClose_Click(sender As Object, e As EventArgs) Handles btnBlindsFullyClose.Click
        BlindsFullyClose("3")
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

    Protected Sub BlindsDownOpen(ByVal strBlindID As String)
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Blinds_Control SET Blind_Request_State = 50 WHERE Blind_ID = " & strBlindID
        SqlDataSource1.Update()

    End Sub

    Protected Sub BlindsFullyClose(ByVal strBlindID As String)
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Blinds_Control SET Blind_Request_State = 100 WHERE Blind_ID = " & strBlindID
        SqlDataSource1.Update()

    End Sub

End Class