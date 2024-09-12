<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default.aspx.vb" Inherits="WebTempControl.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Watchdog Temp Control</title>
    <style type="text/css">
        .auto-style1
        {
            width: 49px;
        }
        
        input[type="submit"]
        {
            font-size: xx-large;
            height: 80px;
            width: 420px;
            background-color: floralwhite;
        }
        .auto-style2
        {
            width: 100%;
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
                <td><h1>Watchdog Temp Control</h1></td>
            </tr>
        </table>
    </div>
        
    <h3>Current Set Temp:  <asp:Label runat="server" ID="lblCurrentSetTemp" /> degrees
       <br />
    Current Mode:  <asp:Label runat="server" ID="lblMode" />
       <br />
    <a href="CurrentTemps.aspx">Average House Temp:  <asp:Label runat="server" ID="lblAvgHouseTemp" /> degrees</a>
        <br />
        <br />
        <br />
    </h3>
     <div style="text-align:center">

         <table  class="auto-style2">
             <tr>
                 <td>
                    <asp:Button runat="server" ID="btnTempUp1" Text="Set +1" /> 
                    <br />
                    <br />
                    <br />
                    <asp:Button runat="server" ID="btnTempDown1" Text="Set -1" /> 
                    <br />
                    <br />
                    <br />
                    <br />                 </td>
                 <td>
                    <asp:Button runat="server" ID="btnHeat" Text="Heat" /> 
                    <br />
                    <br />
                    <br />
                    <asp:Button runat="server" ID="btnCool" Text="Cool" /> 
                    <br />
                    <br />
                    <br />
                    <br />
                 </td>
             </tr>
         </table>



    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WatchdogConnectionString1 %>" SelectCommand="sp_InsteonRequestStateChange" SelectCommandType="StoredProcedure">
        </asp:SqlDataSource>    
    <br />
    Last Updated: <asp:Label ID="lblLastUpdated" runat="server" /><br />
    <meta http-equiv="refresh" content="10"/>
    </form>

</body>
</html>
