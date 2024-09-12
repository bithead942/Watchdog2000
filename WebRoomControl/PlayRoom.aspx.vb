Public Class PlayRoom
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dv As DataView
        Dim strQuery As String

        'Play Room E:  '22.85.9B'
        'Play Room W:  '22.10.A1'

        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text
        strQuery = "SELECT Device_ID, Device_Current_State FROM dbo.Insteon_Control WHERE Device_ID = '22.85.9B' or Device_ID = '22.10.A1'"
        SqlDataSource1.SelectCommand() = strQuery
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)


        If CType(dv.Table.Rows(0)(1), Integer) = 1 Then
            lblPlayRoomELight.Text = "On"
        Else
            lblPlayRoomELight.Text = "Off"
        End If

        If CType(dv.Table.Rows(1)(1), Integer) = 1 Then
            lblPlayRoomWLight.Text = "On"
        Else
            lblPlayRoomWLight.Text = "Off"
        End If

        strQuery = "SELECT Play_Room FROM dbo.Temp_Current_State"
        SqlDataSource1.SelectCommand() = strQuery
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        lblTemp.Text = dv.Table.Rows(0)(0)


    End Sub

    Protected Sub btnPlayRoomELightOn_Click(sender As Object, e As EventArgs) Handles btnPlayRoomELightOn.Click
        LightOn("'22.85.9B'")
    End Sub

    Protected Sub btnPlayRoomELightOff_Click(sender As Object, e As EventArgs) Handles btnPlayRoomELightOff.Click
        LightOff("'22.85.9B'")
    End Sub

    Protected Sub btnPlayRoomWLightOn_Click(sender As Object, e As EventArgs) Handles btnPlayRoomWLightOn.Click
        LightOn("'22.10.A1'")
    End Sub

    Protected Sub btnPlayRoomWLightOff_Click(sender As Object, e As EventArgs) Handles btnPlayRoomWLightOff.Click
        LightOff("'22.10.A1'")
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