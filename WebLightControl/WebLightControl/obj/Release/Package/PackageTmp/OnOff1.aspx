<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="OnOff1.aspx.vb" Inherits="TestLightControl.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Test Lamp On/Off</title>
</head>
<body>
    <div><h1>Test Lamp On/Off</h1></div>

    <form id="form1" runat="server">
    
        <asp:Button runat="server" ID="btnOn" Text="On" style=" width:100px;height:44px;background-color:floralwhite;" /> <br />
        <asp:Button runat="server" ID="btnOff" Text="Off" style=" width:100px;height:44px;background-color:floralwhite;" /> <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WatchdogConnectionString1 %>" SelectCommand="sp_InsteonRequestStateChange" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="1F.4A.5F" Name="Device_ID" Type="String" />
                <asp:FormParameter DefaultValue="0" Name="Device_Request_State" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </form>
    <br />
    <a href="default.aspx">Back</a>
</body>
</html>
