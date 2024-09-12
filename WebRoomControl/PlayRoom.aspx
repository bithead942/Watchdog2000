<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PlayRoom.aspx.vb" Inherits="WebRoomControl.PlayRoom" %>
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
            <td><h1>Watchdog Room Control - Play Room</h1></td>
        </tr>
    </table>
    </div>
        <br />
         Temperature:&nbsp;<asp:Label runat="server" ID="lblTemp" Font-Bold="True" />
         <br />
         <br />
         Play Room East Light:&nbsp;<asp:Label runat="server" ID="lblPlayRoomELight" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnPlayRoomELightOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnPlayRoomELightOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
        <br />
         Play Room West Light:&nbsp;<asp:Label runat="server" ID="lblPlayRoomWLight" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnPlayRoomWLightOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnPlayRoomWLightOff" Text="Off"  /> </td>
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
