<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default.aspx.vb" Inherits="WebBlindControl.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Watchdog Blind Control</title>
    <style type="text/css">
        .auto-style1
        {
            width: 49px;
        }
        .auto-style2
        {
            width: 100%;
            height: 305px;
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
     <form id="form1" runat="server">
    <div style="text-align:center">
    <table style="width:100%;">
        <tr>
            <td class="auto-style1">
    <img alt="" src="Watchdog2.ico" style="height: 58px; width: 60px" /></td>
            <td><h1>Watchdog Blind Control</h1></td>
        </tr>
    </table>
        
        <br />
        <table class="auto-style2">
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnBackDoorN" Text="Back Door (N)" /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnBackDoorS" Text="Back Door (S)" /> </td>
            </tr>
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnLivingRoom" Text="Living Room" /> </td>
                <td style="padding: 10px"> 
        <asp:Button runat="server" ID="btnGreatRoom" Text="Great Room" /> </td>
            </tr>
            <tr>
                <td class="auto-style3" style="padding: 10px">
        <asp:Button runat="server" ID="btnDiningRoom" Text="Dining Room" /> </td>
                <td style="padding: 10px"> 
                    &nbsp;</td>
            </tr>
            </table>
        
        <br />
        <br />   
        <br />

    </div>
    </form>
</body>
</html>
