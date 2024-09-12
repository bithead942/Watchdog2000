<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Basement.aspx.vb" Inherits="WebRoomControl.Basement" %>
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
        .auto-style3
        {
            width: 568px;
        }
        input[type="submit"]
        {
            font-size: xx-large;
            height: 60px;
            width: 400px;
            background-color: floralwhite;
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
            <td><h1>Watchdog Room Control - Basement</h1></td>
        </tr>
    </table>
    </div>
        <br />
         Server Room Light:&nbsp;<asp:Label runat="server" ID="lblServerRoomLight" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnServerRoomLightOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnServerRoomLightOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
        
        <br />
         Art Room Light:&nbsp;<asp:Label runat="server" ID="lblArtRoomLight" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnArtRoomLightOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnArtRoomLightOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
                 <br />
         Basement North Light:&nbsp;<asp:Label runat="server" ID="lblBasementNLight" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnBasementNLightOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnBasementNLightOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
                          <br />
         Basement Mid Light:&nbsp;<asp:Label runat="server" ID="lblBasementMidLight" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnBasementMidLightOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnBasementMidLightOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
                          <br />
         Basement South Light:&nbsp;<asp:Label runat="server" ID="lblBasementSLight" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnBasementSLightOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnBasementSLightOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
                          <br />
         Basement Stair Light:&nbsp;<asp:Label runat="server" ID="lblBasementStairLight" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnBasementStairLightOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnBasementStairLightOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
        <br />
        <br />   

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WatchdogConnectionString1 %>" SelectCommand="sp_InsteonRequestStateChange" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="1F.4A.5F" Name="Device_ID" Type="String" />
                <asp:FormParameter DefaultValue="0" Name="Device_Request_State" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    <a href="default.aspx"><h2>Back</h2></a>
    <meta http-equiv="refresh" content="10"/>


    </form>
</body>
</html>

