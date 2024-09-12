Public Class WebForm2
    Inherits System.Web.UI.Page

    Protected Sub btnTestLamp_Click(sender As Object, e As EventArgs) Handles btnTestLamp.Click
        Session("ButtonID") = "TestLamp"
        Response.Redirect("OnOff1.aspx")

    End Sub

    Protected Sub btnFDCoach_Click(sender As Object, e As EventArgs) Handles btnFDCoach.Click
        Session("ButtonID") = "FDCoach"
        Response.Redirect("OnOff1.aspx")

    End Sub

    Protected Sub btnGDCoach_Click(sender As Object, e As EventArgs) Handles btnGDCoach.Click
        Session("ButtonID") = "GDCoach"
        Response.Redirect("OnOff1.aspx")

    End Sub

    Protected Sub btnSpiderLamp_Click(sender As Object, e As EventArgs) Handles btnSpiderLamp.Click
        Session("ButtonID") = "SpiderLamp"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnShellLamp_Click(sender As Object, e As EventArgs) Handles btnShellLamp.Click
        Session("ButtonID") = "ShellLamp"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnArtRoom_Click(sender As Object, e As EventArgs) Handles btnArtRoom.Click
        Session("ButtonID") = "ArtRoom"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnServerRoom_Click(sender As Object, e As EventArgs) Handles btnServerRoom.Click
        Session("ButtonID") = "ServerRoom"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnKitchen_Click(sender As Object, e As EventArgs) Handles btnKitchen.Click
        Session("ButtonID") = "Kitchen"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnLivingRoom_Click(sender As Object, e As EventArgs) Handles btnLivingRoom.Click
        Session("ButtonID") = "LivingRoom"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnSydneyBedroom_Click(sender As Object, e As EventArgs) Handles btnSydneyBedroom.Click
        Session("ButtonID") = "SydneyBedroom"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnEthanBedroom_Click(sender As Object, e As EventArgs) Handles btnEthanBedroom.Click
        Session("ButtonID") = "EthanBedroom"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnPantry_Click(sender As Object, e As EventArgs) Handles btnPantry.Click
        Session("ButtonID") = "Pantry"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnKidsBathroom_Click(sender As Object, e As EventArgs) Handles btnKidsBathroom.Click
        Session("ButtonID") = "KidsBathroom"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnMasterBedroom_Click(sender As Object, e As EventArgs) Handles btnMasterBedroom.Click
        Session("ButtonID") = "MasterBedroom"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnMasterBathroom_Click(sender As Object, e As EventArgs) Handles btnMasterBathroom.Click
        Session("ButtonID") = "MasterBathroom"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnMasterCloset_Click(sender As Object, e As EventArgs) Handles btnMasterCloset.Click
        Session("ButtonID") = "MasterCloset"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnSpareBedroom_Click(sender As Object, e As EventArgs) Handles btnSpareBedroom.Click
        Session("ButtonID") = "SpareBedroom"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnPlayRoomEast_Click(sender As Object, e As EventArgs) Handles btnPlayRoomEast.Click
        Session("ButtonID") = "PlayRoomEast"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnPlayRoomWest_Click(sender As Object, e As EventArgs) Handles btnPlayRoomWest.Click
        Session("ButtonID") = "PlayRoomWest"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnMudRoom_Click(sender As Object, e As EventArgs) Handles btnMudRoom.Click
        Session("ButtonID") = "MudRoom"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnKitchenNook_Click(sender As Object, e As EventArgs) Handles btnKitchenNook.Click
        Session("ButtonID") = "KitchenNook"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnKidsHallway_Click(sender As Object, e As EventArgs) Handles btnKidsHallway.Click
        Session("ButtonID") = "KidsHallway"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnSconceLights_Click(sender As Object, e As EventArgs) Handles btnSconceLights.Click
        Session("ButtonID") = "SconceLights"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnBasementStairs_Click(sender As Object, e As EventArgs) Handles btnBasementStairs.Click
        Session("ButtonID") = "BasementStairs"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnBasementN_Click(sender As Object, e As EventArgs) Handles btnBasementN.Click
        Session("ButtonID") = "BasementN"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnBasementMid_Click(sender As Object, e As EventArgs) Handles btnBasementMid.Click
        Session("ButtonID") = "BasementMid"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnMasterBedroomFan_Click(sender As Object, e As EventArgs) Handles btnMasterBedroomFan.Click
        Session("ButtonID") = "MasterBRFan"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnEthanBedroomFan_Click(sender As Object, e As EventArgs) Handles btnEthanBedroomFan.Click
        Session("ButtonID") = "EthanBRFan"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnSydneyBedroomFan_Click(sender As Object, e As EventArgs) Handles btnSydneyBedroomFan.Click
        Session("ButtonID") = "SydneyBRFan"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnSpareBedroomFan_Click(sender As Object, e As EventArgs) Handles btnSpareBedroomFan.Click
        Session("ButtonID") = "SpareBRFan"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnBackyardSpot_Click(sender As Object, e As EventArgs) Handles btnBackyardSpot.Click
        Session("ButtonID") = "BackyardSpot"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnDiningRoom_Click(sender As Object, e As EventArgs) Handles btnDiningRoom.Click
        Session("ButtonID") = "DiningRoom"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnFrontHall_Click(sender As Object, e As EventArgs) Handles btnFrontHall.Click
        Session("ButtonID") = "FrontHall"
        Response.Redirect("OnOff1.aspx")
    End Sub

    Protected Sub btnBasementS_Click(sender As Object, e As EventArgs) Handles btnBasementS.Click
        Session("ButtonID") = "BasementS"
        Response.Redirect("OnOff1.aspx")
    End Sub
End Class