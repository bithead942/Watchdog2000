Public Class Outside
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dv As DataView
        Dim strQuery As String

        'FDoor Coach Lights:  '33.67.22'
        'GDoor Coach Lights:  '17.A6.A9'
        'Backyard Spot:  '2B.82.42'


        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text
        strQuery = "SELECT Device_ID, Device_Current_State FROM dbo.Insteon_Control WHERE Device_ID = '33.67.22' or Device_ID = '17.A6.A9' or Device_ID = '2B.82.42'"
        SqlDataSource1.SelectCommand() = strQuery
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)


        If CType(dv.Table.Rows(0)(1), Integer) = 1 Then
            lblFDoorCoachLights.Text = "On"
        Else
            lblFDoorCoachLights.Text = "Off"
        End If

        If CType(dv.Table.Rows(1)(1), Integer) = 1 Then
            lblGDoorCoachLights.Text = "On"
        Else
            lblGDoorCoachLights.Text = "Off"
        End If

        If CType(dv.Table.Rows(2)(1), Integer) = 1 Then
            lblBackyardSpot.Text = "On"
        Else
            lblBackyardSpot.Text = "Off"
        End If

        strQuery = "SELECT Garage FROM dbo.Temp_Current_State"
        SqlDataSource1.SelectCommand() = strQuery
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        lblTemp.Text = dv.Table.Rows(0)(0)

    End Sub

    Protected Sub btnGDoorCoachLightsOn_Click(sender As Object, e As EventArgs) Handles btnGDoorCoachLightsOn.Click
        LightOn("'17.A6.A9'")
    End Sub

    Protected Sub btnGDoorCoachLightsOff_Click(sender As Object, e As EventArgs) Handles btnGDoorCoachLightsOff.Click
        LightOff("'17.A6.A9'")
    End Sub

    Protected Sub btnFDoorCoachLightsOn_Click(sender As Object, e As EventArgs) Handles btnFDoorCoachLightsOn.Click
        LightOn("'33.67.22'")
    End Sub

    Protected Sub btnFDoorCoachLightsOff_Click(sender As Object, e As EventArgs) Handles btnFDoorCoachLightsOff.Click
        LightOff("'33.67.22'")
    End Sub

    Protected Sub btnBackyardSpotOn_Click(sender As Object, e As EventArgs) Handles btnBackyardSpotOn.Click
        LightOn("'2B.82.42'")
    End Sub

    Protected Sub btnBackyardSpotOff_Click(sender As Object, e As EventArgs) Handles btnBackyardSpotOff.Click
        LightOff("'2B.82.42'")
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