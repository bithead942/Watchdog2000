<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Upstairs.aspx.vb" Inherits="WebRoomControl.Upstairs" %>
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
            <td><h1>Watchdog Room Control - Upstairs</h1></td>
        </tr>
    </table>
    </div>
        <br />
         Average
         Temperature:&nbsp;<asp:Label runat="server" ID="lblTemp" Font-Bold="True" />
         <br />
         <br />
         Master Bedroom Light:&nbsp;<asp:Label runat="server" ID="lblMasterBedroomLight" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnMasterBedroomLightOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnMasterBedroomLightOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
        
         <br />
         Master Bedroom Fan:&nbsp;<asp:Label runat="server" ID="lblMasterBedroomFan" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnMasterBedroomFanOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnMasterBedroomFanOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
        
        <br />
         Master Bathroom Light:&nbsp;<asp:Label runat="server" ID="lblMasterBathroomLight" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnMasterBathroomLightOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnMasterBathroomLightOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
                 <br />
         Master Closet Light:&nbsp;<asp:Label runat="server" ID="lblMasterClosetLight" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnMasterClosetLightOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnMasterClosetLightOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
                          <br />
         Kids Hallway:&nbsp;<asp:Label runat="server" ID="lblKidsHallwayLight" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnKidsHallwayLightOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnKidsHallwayLightOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
                          <br />
         Spare Bedroom Light:&nbsp;<asp:Label runat="server" ID="lblSpareBedroomLight" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnSpareBedroomLightOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnSpareBedroomLightOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
                          <br />
         Spare Bedroom Fan:&nbsp;<asp:Label runat="server" ID="lblSpareBedroomFan" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnSpareBedroomFanOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnSpareBedroomFanOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
                          <br />
         Sydney's Bedroom Light:&nbsp;<asp:Label runat="server" ID="lblSydneyBedroomLight" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnSydneyBedroomLightOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnSydneyBedroomLightOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
                          <br />
         Sydney's Bedroom Fan:&nbsp;<asp:Label runat="server" ID="lblSydneyBedroomFan" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnSydneyBedroomFanOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnSydneyBedroomFanOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
                          <br />
         Ethan's Bedroom Light:&nbsp;<asp:Label runat="server" ID="lblEthanBedroomLight" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnEthanBedroomLightOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnEthanBedroomLightOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
                          <br />
         Ethan's Bedroom Fan:&nbsp;<asp:Label runat="server" ID="lblEthanBedroomFan" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnEthanBedroomFanOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnEthanBedroomFanOff" Text="Off"  /> </td>
            </tr>
         </table>
      </div>
                          <br />
         Kids Bathroom Light:&nbsp;<asp:Label runat="server" ID="lblKidsBathroomLight" Font-Bold="True" />
     <div style="text-align:center">

        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnKidsBathroomLightOn" Text="On"  /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnKidsBathroomLightOff" Text="Off"  /> </td>
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
