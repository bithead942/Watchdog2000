Public Class WebForm2
    Inherits System.Web.UI.Page

    Protected Sub btnBackDoorN_Click(sender As Object, e As EventArgs) Handles btnBackDoorN.Click
        Session("ButtonID") = "BackDoorN"
        Response.Redirect("SetLevel.aspx")

    End Sub

    Protected Sub btnBackDoorS_Click(sender As Object, e As EventArgs) Handles btnBackDoorS.Click
        Session("ButtonID") = "BackDoorS"
        Response.Redirect("SetLevel.aspx")
    End Sub

 
    Protected Sub btnLivingRoom_Click(sender As Object, e As EventArgs) Handles btnLivingRoom.Click
        Session("ButtonID") = "LivingRoom"
        Response.Redirect("SetLevel3.aspx")
    End Sub

    Protected Sub btnGreatRoom_Click(sender As Object, e As EventArgs) Handles btnGreatRoom.Click
        Session("ButtonID") = "GreatRoomShade"
        Response.Redirect("SetLevel2.aspx")
    End Sub

    Protected Sub btnDiningRoom_Click(sender As Object, e As EventArgs) Handles btnDiningRoom.Click
        Session("ButtonID") = "DiningRoom"
        Response.Redirect("SetLevel3.aspx")
    End Sub
End Class