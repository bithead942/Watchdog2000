Public Class GreatRoom
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dv As DataView
        Dim strQuery As String

        'Spider Lamp:  '1A.F4.47'
        'Sconce Light: '29.27.9D'


        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text
        strQuery = "SELECT Device_ID, Device_Current_State FROM dbo.Insteon_Control WHERE Device_ID = '1A.F4.47' or Device_ID = '29.27.9D'"
        SqlDataSource1.SelectCommand() = strQuery
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)

        If CType(dv.Table.Rows(0)(1), Integer) = 1 Then
            lblSpiderLamp.Text = "On"
        Else
            lblSpiderLamp.Text = "Off"
        End If

        If CType(dv.Table.Rows(1)(1), Integer) = 1 Then
            lblSconceLights.Text = "On"
        Else
            lblSconceLights.Text = "Off"
        End If

        strQuery = "SELECT Blind_ID, Blind_Current_State FROM dbo.Blinds_Control WHERE Blind_ID = 4"
        SqlDataSource1.SelectCommand() = strQuery
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)

        If CType(dv.Table.Rows(0)(1), Integer) = 100 Then
            lblBlinds.Text = "Closed"
        Else
            lblBlinds.Text = "Open"
        End If

        strQuery = "SELECT Great_Room FROM dbo.Temp_Current_State"
        SqlDataSource1.SelectCommand() = strQuery
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        lblTemp.Text = dv.Table.Rows(0)(0)

    End Sub

    Protected Sub btnSpiderLampOn_Click(sender As Object, e As EventArgs) Handles btnSpiderLampOn.Click
        LightOn("'1A.F4.47'")
    End Sub

    Protected Sub btnSpiderLampOff_Click(sender As Object, e As EventArgs) Handles btnSpiderLampOff.Click
        LightOff("'1A.F4.47'")
    End Sub

    Protected Sub btnSconceLightOn_Click(sender As Object, e As EventArgs) Handles btnSconceLightOn.Click
        LightOn("'29.27.9D'")
    End Sub

    Protected Sub btnSconceLightOff_Click(sender As Object, e As EventArgs) Handles btnSconceLightOff.Click
        LightOff("'29.27.9D'")
    End Sub

    Protected Sub btnBlindsOpen_Click(sender As Object, e As EventArgs) Handles btnBlindsOpen.Click
        BlindsOpen("4")
    End Sub

    Protected Sub btnBlindsClose_Click(sender As Object, e As EventArgs) Handles btnBlindsClose.Click
        BlindsClose("4")
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

    Protected Sub BlindsClose(ByVal strBlindID As String)
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Blinds_Control SET Blind_Request_State = 100 WHERE Blind_ID = " & strBlindID
        SqlDataSource1.Update()

    End Sub

End Class