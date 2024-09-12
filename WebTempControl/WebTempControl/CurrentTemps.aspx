<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CurrentTemps.aspx.vb" Inherits="WebTempControl.CurrentTemps" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Watchdog Light Control</title>
    <style type="text/css">
        .auto-style1
        {
            width: 49px;
        }
        .auto-style2
        {
            width: 45%;
        }
        .auto-style3
        {
            width: 258px;
        }
        .auto-style4
        {
            width: 256px;
        }
    </style>
</head>
<body>
     <div style="text-align:center">
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">
            <img alt="" src="Watchdog2.ico" style="height: 58px; width: 60px" /></td>
                <td><h1>Current House Temps</h1></td>
            </tr>
        </table>
    </div>
    <br />
     <table class="auto-style2" border="1" style="margin-left:auto;margin-right:auto;">
         <tr style="background-color:aqua">
             <td style="text-align:center" class="auto-style3"><h3>Room</h3></td>
             <td style="text-align:center" class="auto-style4"><h3>Temp</h3></td>
         </tr>
         <tr>
             <td class="auto-style3">Master Bedroom</td>
             <td class="auto-style4"><asp:Label runat="server" ID="lblMasterBedroom" /> degrees</td>
         </tr>
         <tr>
             <td class="auto-style3">Ethan&#39;s Bedroom</td>
             <td class="auto-style4"><asp:Label runat="server" ID="lblEthanBedroom" /> degrees</td>
         </tr>
         <tr>
             <td class="auto-style3">Sydney&#39;s Bedroom</td>
             <td class="auto-style4"><asp:Label runat="server" ID="lblSydneyBedroom" /> degrees</td>
         </tr>
         <tr>
             <td class="auto-style3">Play Room</td>
             <td class="auto-style4"><asp:Label runat="server" ID="lblPlayRoom" /> degrees</td>
         </tr>
         <tr>
             <td class="auto-style3">Kitchen</td>
             <td class="auto-style4"><asp:Label runat="server" ID="lblKitchen" /> degrees</td>
         </tr>
         <tr>
             <td class="auto-style3">Living Room</td>
             <td class="auto-style4"><asp:Label runat="server" ID="lblLivingRoom" /> degrees</td>
         </tr>
         <tr>
             <td class="auto-style3">Great Room</td>
             <td class="auto-style4"><asp:Label runat="server" ID="lblGreatRoom" /> degrees</td>
         </tr>
     </table>
    <br />


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WatchdogConnectionString1 %>" SelectCommand="sp_InsteonRequestStateChange" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>    
    <br />
    Last Updated: <asp:Label ID="lblLastUpdated" runat="server" /><br />
    <br />

    <meta http-equiv="refresh" content="10"/>
    <a href="default.aspx"><h2>Back</h2></a>
</body>
</html>
