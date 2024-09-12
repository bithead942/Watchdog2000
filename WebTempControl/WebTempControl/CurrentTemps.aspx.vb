Public Class CurrentTemps
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim dv As DataView

        SqlDataSource1.SelectCommandType = SqlDataSourceCommandType.Text
        SqlDataSource1.SelectCommand() = "SELECT Master_Bedroom, Ethan_Bedroom, Sydney_Bedroom, Play_Room, Kitchen, Living_Room, Great_Room FROM Temp_Current_State"
        dv = CType(SqlDataSource1.Select(DataSourceSelectArguments.Empty), DataView)
        lblMasterBedroom.Text = CType(dv.Table.Rows(0)(0), String)
        lblEthanBedroom.Text = CType(dv.Table.Rows(0)(1), String)
        lblSydneyBedroom.Text = CType(dv.Table.Rows(0)(2), String)
        lblPlayRoom.Text = CType(dv.Table.Rows(0)(3), String)
        lblKitchen.Text = CType(dv.Table.Rows(0)(4), String)
        lblLivingRoom.Text = CType(dv.Table.Rows(0)(5), String)
        lblGreatRoom.Text = CType(dv.Table.Rows(0)(6), String)

        lblLastUpdated.Text = Now.ToString

    End Sub

End Class