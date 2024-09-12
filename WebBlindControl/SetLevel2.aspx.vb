Public Class SetLevel2
    Inherits System.Web.UI.Page
    Dim strBlindID
    Dim iCurrentState As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dv As DataView
        Dim strButtonID As String

        strButtonID = CType(Session.Item("ButtonID"), String)

        If strButtonID = "GreatRoomShade" Then
            lblTitle.Text = "Great Room Shades"
            strBlindID = "4"
        End If

        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text
        SqlDataSource1.SelectCommand() = "SELECT Blind_Current_State FROM dbo.Blinds_Control WHERE Blind_ID = " & strBlindID
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        iCurrentState = CType(dv.Table.Rows(0)(0), Integer)

        lblCurrentState.Text = iCurrentState.ToString & "%"

    End Sub

    Protected Sub btnShadeOpen_Click(sender As Object, e As EventArgs) Handles btnShadeOpen.Click
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Blinds_Control SET Blind_Request_State = 0 WHERE Blind_ID = " & strBlindID
        SqlDataSource1.Update()
    End Sub

    Protected Sub btnShadeClose_Click(sender As Object, e As EventArgs) Handles btnShadeClose.Click
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Blinds_Control SET Blind_Request_State = 100 WHERE Blind_ID = " & strBlindID
        SqlDataSource1.Update()
    End Sub
End Class