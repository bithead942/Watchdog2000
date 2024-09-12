Public Class WebForm1
    Inherits System.Web.UI.Page
    Dim strBlindID
    Dim iCurrentState As Integer

    Private Sub form1_Load(sender As Object, e As EventArgs) Handles form1.Load
        Dim dv As DataView
        Dim strButtonID As String

        strButtonID = CType(Session.Item("ButtonID"), String)

        If strButtonID = "BackDoorN" Then
            lblTitle.Text = "Back Door (N)"
            strBlindID = "1"
        End If

        If strButtonID = "BackDoorS" Then
            lblTitle.Text = "Back Door (S)"
            strBlindID = "2"
        End If

        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text
        SqlDataSource1.SelectCommand() = "SELECT Blind_Current_State FROM dbo.Blinds_Control WHERE Blind_ID = " & strBlindID
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        iCurrentState = CType(dv.Table.Rows(0)(0), Integer)

        lblCurrentState.Text = iCurrentState.ToString & "%"

        If Slider1.Text = "" Then
            Slider1.Text = iCurrentState.ToString
        End If

    End Sub

    Protected Sub btnMoveBlind_Click(sender As Object, e As EventArgs) Handles btnMoveBlind.Click
        If Slider1.Text <> iCurrentState.ToString Then
            SqlDataSource1.UpdateCommand() = "UPDATE dbo.Blinds_Control SET Blind_Request_State = " & Slider1.Text & " WHERE Blind_ID = " & strBlindID
            SqlDataSource1.Update()
        End If
    End Sub
End Class