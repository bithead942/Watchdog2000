<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="OnOff1.aspx.vb" Inherits="WebLightControl.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Test Lamp On/Off</title>
    <style>
        input[type="submit"]
        {
            font-size: xx-large;
            height: 150px;
            width: 550px;
            background-color: floralwhite;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:center">
        <h1><asp:Label runat="server" ID="lblTitle"/> On/Off</h1>
        <br />
        <h2>Current State:  <asp:Label runat="server" ID="lblCurrentState" /></h2>
        <br />
        <br />
        <asp:Button runat="server" ID="btnOn" Text="On" /> 
        <br />
        <br />
        <br />
        <asp:Button runat="server" ID="btnOff" Text="Off" /> 
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WatchdogConnectionString1 %>" SelectCommand="sp_InsteonRequestStateChange" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="1F.4A.5F" Name="Device_ID" Type="String" />
                <asp:FormParameter DefaultValue="0" Name="Device_Request_State" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
    </form>
    <br />
    <a href="default.aspx"><h2>Back</h2></a>
    <meta http-equiv="refresh" content="10"/>
</body>
</html>
