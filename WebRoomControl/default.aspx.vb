Public Class _default
    Inherits System.Web.UI.Page


    Protected Sub btnUpstairs_Click(sender As Object, e As EventArgs) Handles btnUpstairs.Click
        Response.Redirect("Upstairs.aspx")
    End Sub

    Protected Sub btnBasement_Click(sender As Object, e As EventArgs) Handles btnBasement.Click
        Response.Redirect("Basement.aspx")
    End Sub

    Protected Sub btnLivingRoom_Click(sender As Object, e As EventArgs) Handles btnLivingRoom.Click
        Response.Redirect("LivingRoom.aspx")
    End Sub

    Protected Sub btnDiningRoom_Click(sender As Object, e As EventArgs) Handles btnDiningRoom.Click
        Response.Redirect("DiningRoom.aspx")
    End Sub

    Protected Sub btnKitchen_Click(sender As Object, e As EventArgs) Handles btnKitchen.Click
        Response.Redirect("Kitchen.aspx")
    End Sub

    Protected Sub btnGreatRoom_Click(sender As Object, e As EventArgs) Handles btnGreatRoom.Click
        Response.Redirect("GreatRoom.aspx")
    End Sub

    Protected Sub btnPlayRoom_Click(sender As Object, e As EventArgs) Handles btnPlayRoom.Click
        Response.Redirect("PlayRoom.aspx")
    End Sub

    Protected Sub btnOutside_Click(sender As Object, e As EventArgs) Handles btnOutside.Click
        Response.Redirect("Outside.aspx")
    End Sub
End Class