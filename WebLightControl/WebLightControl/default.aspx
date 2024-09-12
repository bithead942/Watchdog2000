<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default.aspx.vb" Inherits="WebLightControl.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Watchdog Light Control</title>
    <style type="text/css">
        .auto-style1
        {
            width: 49px;
        }
        .auto-style2
        {
            width: 100%;
        }
        .auto-style3
        {
            width: 568px;
        }
        .auto-style4
        {
            width: 568px;
            height: 64px;
        }
        .auto-style5
        {
            height: 64px;
        }
        input[type="submit"]
        {
            font-size: xx-large;
            height: 60px;
            width: 400px;
            background-color: floralwhite;
        }
        .auto-style6
        {
            width: 568px;
            height: 41px;
        }
        .auto-style7
        {
            height: 41px;
        }
    </style>
</head>
<body>
     <form id="form1" runat="server">
    <div style="text-align:center">
    <table style="width:100%;">
        <tr>
            <td class="auto-style1">
    <img alt="" src="Watchdog2.ico" style="height: 58px; width: 60px" /></td>
            <td><h1>Watchdog Light Control</h1></td>
        </tr>
    </table>
        
        <br />
        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnMasterBedroom" Text="Master Bedroom Light"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnEthanBedroom" Text="Ethan's Bedroom Light"  /> </td>
            </tr>
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnMasterBedroomFan" Text="Master Bedroom Fan"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnEthanBedroomFan" Text="Ethan's Bedroom Fan"  /> </td>
            </tr>
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnMasterBathroom" Text="Master Bathroom"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnSydneyBedroom" Text="Sydney's Bedroom Light"  /> </td>
            </tr>
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnMasterCloset" Text="Master Closet"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnSydneyBedroomFan" Text="Sydney's Bedroom Fan"  /> </td>
            </tr>
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnKidsHallway" Text="Kids Hallway"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnSpareBedroom" Text="Spare Bedroom Light"  /> </td>
            </tr>
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnKidsBathroom" Text="Kid's Bathroom"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnSpareBedroomFan" Text="Spare Bedroom Fan"  /> </td>
            </tr>
            <tr>
                <td class="auto-style4" style="padding: 10px">   
                    &nbsp;</td>
                <td class="auto-style5" style="padding: 10px">   
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnMudRoom" Text="Mud Room"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnSpiderLamp" Text="Spider Lamp"  /> </td>
            </tr>
            <tr>
                <td class="auto-style6" style="padding: 10px">
        <asp:Button runat="server" ID="btnPantry" Text="Pantry"  /> </td>
                <td style="padding: 10px" class="auto-style7"> 
        <asp:Button runat="server" ID="btnSconceLights" Text="Sconce Lights"  /> </td>
            </tr>
            <tr>
                <td class="auto-style3" style="padding: 10px">        
        <asp:Button runat="server" ID="btnFDCoach" Text="Front Door Coach Lights"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnGDCoach" Text="Garage Coach Lights"  /> </td>
            </tr>
            <tr>
                <td class="auto-style3" style="padding: 10px">   
        <asp:Button runat="server" ID="btnKitchen" Text="Kitchen"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnPlayRoomEast" Text="Play Room East"  /> </td>
            </tr>
            <tr>
                <td class="auto-style3" style="padding: 10px">   
        <asp:Button runat="server" ID="btnKitchenNook" Text="Kitchen Nook"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnPlayRoomWest" Text="Play Room West"  /> </td>
            </tr>
            <tr>
                <td class="auto-style4" style="padding: 10px">   
        <asp:Button runat="server" ID="btnLivingRoom" Text="Living Room"  /> </td>
                <td class="auto-style5" style="padding: 10px">   
        <asp:Button runat="server" ID="btnShellLamp" Text="Shell Lamp"  /> </td>
            </tr>
            <tr>
                <td class="auto-style4" style="padding: 10px">   
        <asp:Button runat="server" ID="btnBackyardSpot" Text="Backyard Spot"  /> </td>
                <td class="auto-style5" style="padding: 10px">   
        <asp:Button runat="server" ID="btnDiningRoom" Text="Dining Room"  /> </td>
            </tr>
            <tr>
                <td class="auto-style4" style="padding: 10px">   
        <asp:Button runat="server" ID="btnFrontHall" Text="Front Hall"  /> </td>
                <td class="auto-style5" style="padding: 10px">   
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4" style="padding: 10px">   
                    &nbsp;</td>
                <td class="auto-style5" style="padding: 10px">   
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4" style="padding: 10px">   
        <asp:Button runat="server" ID="btnBasementStairs" Text="Basement Stairs"  /> </td>
                <td class="auto-style5" style="padding: 10px">   
        <asp:Button runat="server" ID="btnBasementN" Text="Basement North"  /> </td>
            </tr>
            <tr>
                <td class="auto-style4" style="padding: 10px">   
        <asp:Button runat="server" ID="btnArtRoom" Text="Art Room"  /> </td>
                <td class="auto-style5" style="padding: 10px">   
        <asp:Button runat="server" ID="btnBasementMid" Text="Basement Middle"  /> </td>
            </tr>
            <tr>
                <td class="auto-style4" style="padding: 10px">   
        <asp:Button runat="server" ID="btnServerRoom" Text="Server Room"  /> </td>
                <td class="auto-style5" style="padding: 10px">   
        <asp:Button runat="server" ID="btnBasementS" Text="Basement South"  /> </td>
            </tr>
            <tr>
                <td class="auto-style4" style="padding: 10px">   
                    &nbsp;</td>
                <td class="auto-style5" style="padding: 10px">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4" style="padding: 10px">   
        <asp:Button runat="server" ID="btnTestLamp" Text="Test Lamp"  /> </td>
                <td class="auto-style5" style="padding: 10px">
                    &nbsp;</td>
            </tr>
        </table>
        
        <br />
        <br />   
        <br />
        <br /> 
        <br />
        <br /> 
        <br />
        <br /> 
        <br />
        <br /> 
        <br />
        <br /> 
        <br />
        <br /> 

    </div>
    </form>
</body>
</html>
