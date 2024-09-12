Public Class WebForm1
    Inherits System.Web.UI.Page
    Dim ZoneState(15) As Integer
    Dim dtStartTime As DateTime
    Dim bRunning As Boolean

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim iDurationMin, iDurationSec As Integer

        GetCurrentStatus()
        lblCurrentStatus.Text = ""

        iDurationMin = DateDiff(DateInterval.Second, dtStartTime, Now()) \ 60
        iDurationSec = DateDiff(DateInterval.Second, dtStartTime, Now()) Mod 60

        For i = 1 To 14
            If ZoneState(i) = 1 Then
                lblCurrentStatus.Text = "Zone " & i.ToString & " Active.  [Duration: "
                If iDurationMin < 10 Then
                    lblCurrentStatus.Text = lblCurrentStatus.Text & "0" & iDurationMin.ToString & ":"
                Else
                    lblCurrentStatus.Text = lblCurrentStatus.Text & iDurationMin.ToString & ":"
                End If
                If iDurationSec < 10 Then
                    lblCurrentStatus.Text = lblCurrentStatus.Text & "0" & iDurationSec.ToString & "]"
                Else
                    lblCurrentStatus.Text = lblCurrentStatus.Text & iDurationSec.ToString & "]"
                End If
            End If
        Next
        If lblCurrentStatus.Text = "" Then
            lblCurrentStatus.Text = "System Off"
        End If

    End Sub

    Protected Sub GetCurrentStatus()
        Dim dv As DataView
        Dim i As Integer

        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text
        SqlDataSource1.SelectCommand() = "SELECT Zone_ID, Zone_Current_State FROM Irrigation_Control ORDER BY Zone_ID ASC"
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        For i = 0 To dv.Table.Rows.Count - 1
            ZoneState(i) = CType(dv.Table.Rows(i)(1), Integer)
            If ZoneState(i) = 1 And i > 0 Then
                bRunning = True
            End If
        Next
        If bRunning Then
            dv = Nothing
            SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text
            SqlDataSource1.SelectCommand() = "SELECT Event_Timestamp FROM Irrigation_History WHERE Event_ID IN ('201', '203', '205', '207', '209', '211', '213', '215', '217', '219', '221', '223', '225') ORDER BY Event_Timestamp DESC"
            dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
            If dv.Table.Rows.Count > 0 Then
                dtStartTime = CType(dv.Table.Rows(0)(0), DateTime)
            Else
                dtStartTime = Nothing
            End If
        Else
            dtStartTime = Nothing
        End If
    End Sub

    Private Sub ImageMap1_Click1(sender As Object, e As ImageMapEventArgs) Handles ImageMap1.Click
        GetCurrentStatus()

        If ZoneState(CInt(e.PostBackValue)) = 1 Then
            SqlDataSource1.UpdateCommand() = "Update Irrigation_Control SET Zone_Request_State = 0 WHERE ZONE_ID = " & e.PostBackValue
            SqlDataSource1.Update()
        ElseIf ZoneState(CInt(e.PostBackValue)) = 0 Then
            SqlDataSource1.UpdateCommand() = "Update Irrigation_Control SET Zone_Request_State = 1 WHERE ZONE_ID = " & e.PostBackValue
            SqlDataSource1.Update()
        End If
    End Sub
End Class