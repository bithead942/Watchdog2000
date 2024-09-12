<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SetLevel3.aspx.vb" Inherits="WebBlindControl.SetLevel3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Set Blind Level</title>
    <script type="text/javascript">
        function pageLoad(sender, e) {
            var slider = $find('SliderBehavior');
            slider.add_valueChanged(onValueChanged);
        }
        function onValueChanged(sender, e) {
            var slider = $find('SliderBehavior');
            //slider.style.left = -25;
        }
    </script>
    <style type="text/css">
        #mainContainer{ overflow:hidden; }

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
    <form id="form1" runat="server" method="post">
    <div id="mainContainer" style="text-align:center;" >
        <h1>Set Level: <asp:Label runat="server" ID="lblTitle"/> </h1>
        <br />
        <h2>Current State:  <asp:Label runat="server" ID="lblCurrentState" /></h2>
        <br />
        <br />
     </div>
        <div style="text-align:center;">
            <asp:Button ID="btnBlindUp" runat="server" Text="Blind Up" />
            <br />
            <br />
            <asp:Button ID="btnBlindDownOpen" runat="server" Text="Blind Down Shade Open" />
            <br />
            <br />
            <asp:Button ID="btnBindDownClosed" runat="server" Text="Blind Down Shade Closed" />
       </div>
       <br />
       <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WatchdogConnectionString1 %>" SelectCommand="sp_InsteonRequestStateChange" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="Blind_ID" Type="String" />
                <asp:FormParameter DefaultValue="0" Name="Blind_Request_State" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
    <br />
    <a href="default.aspx"><h2>Back</h2></a>
    <meta http-equiv="refresh" content="10"/>
</body>
</html>
