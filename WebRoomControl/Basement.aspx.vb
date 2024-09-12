Public Class Basement
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dv As DataView
        Dim strQuery As String

        'Server Room:  '22.12.76'
        'Art Room:  '22.10.0C'
        'Basement N:  '29.2B.11'
        'Basement Mid:  '29.27.89'
        'Basement Stairs:  '29.2B.68'
        'Basement S:  '2B.83.1F'

        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text
        strQuery = "SELECT Device_ID, Device_Current_State FROM dbo.Insteon_Control WHERE "
        strQuery = strQuery & "Device_ID = '22.12.76' or Device_ID = '22.10.0C' or Device_ID = '29.2B.11' or Device_ID = '29.27.89' or "
        strQuery = strQuery & "Device_ID = '29.2B.68' or Device_ID = '2B.83.1F'"
        SqlDataSource1.SelectCommand() = strQuery
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)

        If CType(dv.Table.Rows(0)(1), Integer) = 1 Then
            lblArtRoomLight.Text = "On"
        Else
            lblArtRoomLight.Text = "Off"
        End If

        If CType(dv.Table.Rows(1)(1), Integer) >= 1 Then
            lblServerRoomLight.Text = "On"
        Else
            lblServerRoomLight.Text = "Off"
        End If

        If CType(dv.Table.Rows(2)(1), Integer) >= 1 Then
            lblBasementNLight.Text = "On"
        Else
            lblBasementNLight.Text = "Off"
        End If

        If CType(dv.Table.Rows(3)(1), Integer) = 1 Then
            lblBasementMidLight.Text = "On"
        Else
            lblBasementMidLight.Text = "Off"
        End If

        If CType(dv.Table.Rows(4)(1), Integer) >= 1 Then
            lblBasementStairLight.Text = "On"
        Else
            lblBasementStairLight.Text = "Off"
        End If

        If CType(dv.Table.Rows(5)(1), Integer) >= 1 Then
            lblBasementSLight.Text = "On"
        Else
            lblBasementSLight.Text = "Off"
        End If

    End Sub

    Protected Sub btnServerRoomLightOn_Click(sender As Object, e As EventArgs) Handles btnServerRoomLightOn.Click
        LightOn("'22.12.76'")
    End Sub

    Protected Sub btnServerRoomLightOff_Click(sender As Object, e As EventArgs) Handles btnServerRoomLightOff.Click
        LightOff("'22.12.76'")
    End Sub

    Protected Sub btnArtRoomLightOn_Click(sender As Object, e As EventArgs) Handles btnArtRoomLightOn.Click
        LightOn("'22.10.0C'")
    End Sub

    Protected Sub btnArtRoomLightOff_Click(sender As Object, e As EventArgs) Handles btnArtRoomLightOff.Click
        LightOff("'22.10.0C'")
    End Sub

    Protected Sub btnBasementNLightOn_Click(sender As Object, e As EventArgs) Handles btnBasementNLightOn.Click
        LightOn("'29.2B.11'")
    End Sub

    Protected Sub btnBasementNLightOff_Click(sender As Object, e As EventArgs) Handles btnBasementNLightOff.Click
        LightOff("'29.2B.11'")
    End Sub

    Protected Sub btnBasementMidLightOn_Click(sender As Object, e As EventArgs) Handles btnBasementMidLightOn.Click
        LightOn("'29.27.89'")
    End Sub

    Protected Sub btnBasementMidLightOff_Click(sender As Object, e As EventArgs) Handles btnBasementMidLightOff.Click
        LightOff("'29.27.89'")
    End Sub

    Protected Sub btnBasementStairLightOn_Click(sender As Object, e As EventArgs) Handles btnBasementStairLightOn.Click
        LightOn("'29.2B.68'")
    End Sub

    Protected Sub btnBasementStairLightOff_Click(sender As Object, e As EventArgs) Handles btnBasementStairLightOff.Click
        LightOff("'29.2B.68'")
    End Sub

    Protected Sub btnBasementSLightOn_Click(sender As Object, e As EventArgs) Handles btnBasementSLightOn.Click
        LightOn("'2B.83.1F'")
    End Sub

    Protected Sub btnBasementSLightOff_Click(sender As Object, e As EventArgs) Handles btnBasementSLightOff.Click
        LightOff("'2B.83.1F'")
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