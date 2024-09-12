<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="WebIrrigationControl.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Watchdog Irrigation Control</title>
    <style type="text/css">
        .auto-style1
        {
            width: 68px;
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
                <td><h1>Watchdog Irrigation Control</h1></td>
            </tr>
        </table>
    </div>
        
    <h3>Current Status:  <asp:Label runat="server" ID="lblCurrentStatus" /></h3>
         <asp:ImageMap ID="ImageMap1" runat="server" HotSpotMode="PostBack" ImageUrl="~/Irrigation Lines3.GIF" ImageAlign="Top">
             <asp:PolygonHotSpot AlternateText="Zone 1" Coordinates="595,262,654,262,654,370,595,370" HotSpotMode="PostBack" PostBackValue="1" />
             <asp:PolygonHotSpot AlternateText="Zone 2" Coordinates="314,452,469,385,668,377,596,502,307,511" HotSpotMode="PostBack" PostBackValue="2"/>
             <asp:PolygonHotSpot AlternateText="Zone 3" Coordinates="658,357,660,303,785,293,900,361,780,470,753,472" HotSpotMode="PostBack" PostBackValue="3" />
             <asp:PolygonHotSpot AlternateText="Zone 4" Coordinates="359,533,551,511,747,495,749,535,620,570,380,585" HotSpotMode="PostBack" PostBackValue="4" />
             <asp:PolygonHotSpot AlternateText="Zone 5" Coordinates="284,586,671,586,671,637,284,637" HotSpotMode="PostBack" PostBackValue="5" />
             <asp:PolygonHotSpot AlternateText="Zone 6" Coordinates="708,561,888,461,1017,309,1063,333,935,505,720,609" HotSpotMode="PostBack" PostBackValue="6" />
             <asp:PolygonHotSpot AlternateText="Zone 7" Coordinates="646,32,988,245,957,313,608,96" HotSpotMode="PostBack" PostBackValue="7" />
             <asp:PolygonHotSpot AlternateText="Zone 8" Coordinates="414,194,548,173,571,194,540,262,430,261" HotSpotMode="PostBack" PostBackValue="8" />
             <asp:PolygonHotSpot AlternateText="Zone 9" Coordinates="431,163,428,102,562,93,744,215,721,256,547,146" HotSpotMode="PostBack" PostBackValue="9" />
             <asp:PolygonHotSpot AlternateText="Zone 10" Coordinates="520,0,580,20,105,256,89,192" HotSpotMode="PostBack" PostBackValue="10" />
             <asp:PolygonHotSpot AlternateText="Zone 11" Coordinates="'246,446,311,305,430,239,432,387,341,387,289,470'" HotSpotMode="PostBack" PostBackValue="11" />
             <asp:PolygonHotSpot AlternateText="Zone 12" Coordinates="342,151,391,213,187,381,130,309" HotSpotMode="PostBack" PostBackValue="12" />
             <asp:PolygonHotSpot AlternateText="Zone 13" Coordinates="0,260,52,240,238,526,193,555,62,437" HotSpotMode="PostBack" PostBackValue="13" />
         </asp:ImageMap>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WatchdogConnectionString1 %>">
        </asp:SqlDataSource>    
    </form>
    <meta http-equiv="refresh" content="15"/>
</body>
</html>
