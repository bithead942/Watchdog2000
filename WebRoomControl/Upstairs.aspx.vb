Public Class Upstairs
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dv As DataView
        Dim strQuery As String
        Dim iMasterTemp, iSydneyTemp, iEthanTemp, iAvgTemp As Integer

        'MasterBedroom:  '20.E5.84'
        'MasterBDRMFan:  '2A.39.F6'
        'MasterBathroom:  '23.E2.E4'
        'MasterCloset:  '23.EA.1D'
        'KidsHallway:  '29.2A.B9'
        'SpareBedroom:  '22.56.9E'
        'SpareBDRMFan:  '2A.3F.41'
        'SydneyBedroom:  '23.C5.30'
        'SydneyBDRMFan:  '2A.3D.80'
        'EthanBedroom:  '23.B6.EB'
        'EthanBDRMFan:  '2A.3B.F0'
        'KidsBathroom:  '23.DB.10'

        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text
        strQuery = "SELECT Device_ID, Device_Current_State FROM dbo.Insteon_Control WHERE "
        strQuery = strQuery & "Device_ID = '20.E5.84' or Device_ID = '23.E2.E4' or Device_ID = '23.EA.1D' or Device_ID = '29.2A.B9' or "
        strQuery = strQuery & "Device_ID = '22.56.9E' or Device_ID = '23.C5.30' or Device_ID = '23.B6.EB' or Device_ID = '23.DB.10' or "
        strQuery = strQuery & "Device_ID = '2A.39.F6' or Device_ID = '2A.3F.41' or Device_ID = '2A.3D.80' or Device_ID = '2A.3B.F0'"
        SqlDataSource1.SelectCommand() = strQuery
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)

        If CType(dv.Table.Rows(0)(1), Integer) = 1 Then
            lblKidsHallwayLight.Text = "On"
        Else
            lblKidsHallwayLight.Text = "Off"
        End If

        If CType(dv.Table.Rows(1)(1), Integer) >= 1 Then
            lblSydneyBedroomLight.Text = "On"
        Else
            lblSydneyBedroomLight.Text = "Off"
        End If

        If CType(dv.Table.Rows(2)(1), Integer) >= 1 Then
            lblEthanBedroomLight.Text = "On"
        Else
            lblEthanBedroomLight.Text = "Off"
        End If

        If CType(dv.Table.Rows(3)(1), Integer) = 1 Then
            lblKidsBathroomLight.Text = "On"
        Else
            lblKidsBathroomLight.Text = "Off"
        End If

        If CType(dv.Table.Rows(4)(1), Integer) >= 1 Then
            lblMasterBedroomLight.Text = "On"
        Else
            lblMasterBedroomLight.Text = "Off"
        End If

        If CType(dv.Table.Rows(5)(1), Integer) = 1 Then
            lblMasterBathroomLight.Text = "On"
        Else
            lblMasterBathroomLight.Text = "Off"
        End If

        If CType(dv.Table.Rows(6)(1), Integer) = 1 Then
            lblMasterClosetLight.Text = "On"
        Else
            lblMasterClosetLight.Text = "Off"
        End If

        If CType(dv.Table.Rows(7)(1), Integer) >= 1 Then
            lblSpareBedroomLight.Text = "On"
        Else
            lblSpareBedroomLight.Text = "Off"
        End If

        If CType(dv.Table.Rows(8)(1), Integer) >= 1 Then
            lblMasterBedroomFan.Text = "On"
        Else
            lblMasterBedroomFan.Text = "Off"
        End If

        If CType(dv.Table.Rows(9)(1), Integer) >= 1 Then
            lblSpareBedroomFan.Text = "On"
        Else
            lblSpareBedroomFan.Text = "Off"
        End If

        If CType(dv.Table.Rows(10)(1), Integer) >= 1 Then
            lblSydneyBedroomFan.Text = "On"
        Else
            lblSydneyBedroomFan.Text = "Off"
        End If

        If CType(dv.Table.Rows(11)(1), Integer) >= 1 Then
            lblEthanBedroomFan.Text = "On"
        Else
            lblEthanBedroomFan.Text = "Off"
        End If

        strQuery = "SELECT Master_Bedroom, Ethan_Bedroom, Sydney_Bedroom FROM dbo.Temp_Current_State"
        SqlDataSource1.SelectCommand() = strQuery
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        iMasterTemp = dv.Table.Rows(0)(0)
        iEthanTemp = dv.Table.Rows(0)(1)
        iSydneyTemp = dv.Table.Rows(0)(2)
        iAvgTemp = (iMasterTemp + iEthanTemp + iSydneyTemp) / 3
        lblTemp.Text = CStr(iAvgTemp)

    End Sub

    Protected Sub btnMasterBedroomLightOn_Click(sender As Object, e As EventArgs) Handles btnMasterBedroomLightOn.Click
        LightOn("'20.E5.84'")
    End Sub

    Protected Sub btnMasterBedroomLightOff_Click(sender As Object, e As EventArgs) Handles btnMasterBedroomLightOff.Click
        LightOff("'20.E5.84'")
    End Sub

    Protected Sub btnMasterBathroomLightOn_Click(sender As Object, e As EventArgs) Handles btnMasterBathroomLightOn.Click
        LightOn("'23.E2.E4'")
    End Sub

    Protected Sub btnMasterBathroomLightOff_Click(sender As Object, e As EventArgs) Handles btnMasterBathroomLightOff.Click
        LightOff("'23.E2.E4'")
    End Sub

    Protected Sub btnMasterClosetLightOn_Click(sender As Object, e As EventArgs) Handles btnMasterClosetLightOn.Click
        LightOn("'23.EA.1D'")
    End Sub

    Protected Sub btnMasterClosetLightOff_Click(sender As Object, e As EventArgs) Handles btnMasterClosetLightOff.Click
        LightOff("'23.EA.1D'")
    End Sub

    Protected Sub btnKidsHallwayLightOn_Click(sender As Object, e As EventArgs) Handles btnKidsHallwayLightOn.Click
        LightOn("'29.2A.B9'")
    End Sub

    Protected Sub btnKidsHallwayLightOff_Click(sender As Object, e As EventArgs) Handles btnKidsHallwayLightOff.Click
        LightOff("'29.2A.B9'")
    End Sub

    Protected Sub btnSpareBedroomLightOn_Click(sender As Object, e As EventArgs) Handles btnSpareBedroomLightOn.Click
        LightOn("'22.56.9E'")
    End Sub

    Protected Sub btnSpareBedroomLightOff_Click(sender As Object, e As EventArgs) Handles btnSpareBedroomLightOff.Click
        LightOff("'22.56.9E'")
    End Sub

    Protected Sub btnSydneyBedroomLightOn_Click(sender As Object, e As EventArgs) Handles btnSydneyBedroomLightOn.Click
        LightOn("'23.C5.30'")
    End Sub

    Protected Sub btnSydneyBedroomLightOff_Click(sender As Object, e As EventArgs) Handles btnSydneyBedroomLightOff.Click
        LightOff("'23.C5.30'")
    End Sub

    Protected Sub btnEthanBedroomLightOn_Click(sender As Object, e As EventArgs) Handles btnEthanBedroomLightOn.Click
        LightOn("'23.B6.EB'")
    End Sub

    Protected Sub btnEthanBedroomLightOff_Click(sender As Object, e As EventArgs) Handles btnEthanBedroomLightOff.Click
        LightOff("'23.B6.EB'")
    End Sub

    Protected Sub btnKidsBathroomLightOn_Click(sender As Object, e As EventArgs) Handles btnKidsBathroomLightOn.Click
        LightOn("'23.DB.10'")
    End Sub

    Protected Sub btnKidsBathroomLightOff_Click(sender As Object, e As EventArgs) Handles btnKidsBathroomLightOff.Click
        LightOff("'23.DB.10'")
    End Sub

    Protected Sub btnMasterBedroomFanOn_Click(sender As Object, e As EventArgs) Handles btnMasterBedroomFanOn.Click
        LightOn("'2A.39.F6'")
    End Sub

    Protected Sub btnMasterBedroomFanOff_Click(sender As Object, e As EventArgs) Handles btnMasterBedroomFanOff.Click
        LightOff("'2A.39.F6'")
    End Sub

    Protected Sub btnSpareBedroomFanOn_Click(sender As Object, e As EventArgs) Handles btnSpareBedroomFanOn.Click
        LightOn("'2A.3F.41'")
    End Sub

    Protected Sub btnSpareBedroomFanOff_Click(sender As Object, e As EventArgs) Handles btnSpareBedroomFanOff.Click
        LightOff("'2A.3F.41'")
    End Sub

    Protected Sub btnSydneyBedroomFanOn_Click(sender As Object, e As EventArgs) Handles btnSydneyBedroomFanOn.Click
        LightOn("'2A.3D.80'")
    End Sub

    Protected Sub btnSydneyBedroomFanOff_Click(sender As Object, e As EventArgs) Handles btnSydneyBedroomFanOff.Click
        LightOff("'2A.3D.80'")
    End Sub

    Protected Sub btnEthanBedroomFanOn_Click(sender As Object, e As EventArgs) Handles btnEthanBedroomFanOn.Click
        LightOn("'2A.3B.F0'")
    End Sub

    Protected Sub btnEthanBedroomFanOff_Click(sender As Object, e As EventArgs) Handles btnEthanBedroomFanOff.Click
        LightOff("'2A.3B.F0'")
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