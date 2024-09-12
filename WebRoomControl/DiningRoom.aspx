<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DiningRoom.aspx.vb" Inherits="WebRoomControl.DiningRoom" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Watchdog Room Control</title>
    <style type="text/css">
        .auto-style1
        {
            width: 49px;
        }
        .auto-style2
        {
            width: 100%;
        }
        .auto-style4
        {
            width: 33%
        }
        input[type="submit"]
        {
            font-size: xx-large;
            height: 60px;
            width: 400px;
            background-color: floralwhite;
        }
        .auto-style3
        {
            width: 568px;
        }
        </style>
</head>
<body>
     <form id="form1" runat="server" style="font-size: x-large">
    <div style="text-align:center">
    <table style="width:100%;">
        <tr>
            <td class="auto-style1">
    <img alt="" src="Watchdog1.ico" style="height: 58px; width: 60px" /></td>
            <td><h1>Watchdog Room Control - Dining Room</h1></td>
        </tr>
    </table>
    </div>
        <br />
         Blinds:&nbsp;<asp:Label runat="server" ID="lblBlinds" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style4" style="padding: 10px">
        <asp:Button runat="server" ID="btnBlindsOpen" Text="Open" Width="350px"  /> </td>   
                <td class="auto-style4" style="padding: 10px">
        <asp:Button runat="server" ID="btnBlindsDownOpen" Text="Down Open" Width="350px"  /> </td>
                <td class="auto-style4" style="padding: 10px">
        <asp:Button runat="server" ID="btnBlindsFullyClose" Text="Fully Close" Width="350px"  /> </td>
            </tr>
         </table>
      </div>
                          <br />
         Dining Room Light:&nbsp;<asp:Label runat="server" ID="lblDiningRoom" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnDiningRoomLightOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnDiningRoomLightOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
                          <br />
         Front Hall Light:&nbsp;<asp:Label runat="server" ID="lblFrontHallLight" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnFrontHallLightOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnFrontHallLightOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
        <br />
        <br />   

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WatchdogConnectionString1 %>">
        </asp:SqlDataSource>

    <a href="default.aspx"><h2>Back</h2></a>
    <meta http-equiv="refresh" content="10"/>


    </form>
</body>
</html>
