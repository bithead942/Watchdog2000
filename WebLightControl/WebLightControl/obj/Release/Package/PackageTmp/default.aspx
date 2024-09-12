<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default.aspx.vb" Inherits="TestLightControl.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Watchdog Light Control</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Watchdog Light Control</h1>

        <asp:Button runat="server" ID="btnTestLamp" Text="Test Lamp" style=" width:200px;height:44px;background-color:floralwhite;" /> <br />
        <asp:Button runat="server" ID="btnFDCoach" Text="Front Door Coach Lights" style=" width:200px;height:44px;background-color:floralwhite;" /> <br />
        <asp:Button runat="server" ID="btnGDCoach" Text="Garage Coach Lights" style=" width:200px;height:44px;background-color:floralwhite;" /> <br />

    
    </div>
    </form>
</body>
</html>
