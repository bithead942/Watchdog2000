Public Class SetLevel3
    Inherits System.Web.UI.Page

    Dim strBlindID

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim iCurrentState As Integer
        Dim dv As DataView
        Dim strButtonID As String

        strButtonID = CType(Session.Item("ButtonID"), String)

        If strButtonID = "LivingRoom" Then
            lblTitle.Text = "Living Room"
            strBlindID = "3"
        End If

        If strButtonID = "DiningRoom" Then
            lblTitle.Text = "Dining Room"
            strBlindID = "5"
        End If

        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text
        SqlDataSource1.SelectCommand() = "SELECT Blind_Current_State FROM dbo.Blinds_Control WHERE Blind_ID = " & strBlindID
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        iCurrentState = CType(dv.Table.Rows(0)(0), Integer)

        lblCurrentState.Text = iCurrentState.ToString & "%"

    End Sub

    Protected Sub btnBlindUp_Click(sender As Object, e As EventArgs) Handles btnBlindUp.Click
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Blinds_Control SET Blind_Request_State = 0 WHERE Blind_ID = " & strBlindID
        SqlDataSource1.Update()
    End Sub

    Protected Sub btnBlindDownOpen_Click(sender As Object, e As EventArgs) Handles btnBlindDownOpen.Click
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Blinds_Control SET Blind_Request_State = 50 WHERE Blind_ID = " & strBlindID
        SqlDataSource1.Update()
    End Sub

    Protected Sub btnBlindDownClosed_Click(sender As Object, e As EventArgs) Handles btnBindDownClosed.Click
        SqlDataSource1.UpdateCommand() = "UPDATE dbo.Blinds_Control SET Blind_Request_State = 100 WHERE Blind_ID = " & strBlindID
        SqlDataSource1.Update()
    End Sub
End Class