<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SetLevel.aspx.vb" Inherits="WebBlindControl.WebForm1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
     <%@ Register Assembly="AjaxControlToolkit"  Namespace="AjaxControlToolkit.SliderExtender"  TagPrefix="SliderExtender" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        #divA{ float:left; width:49%;}
        #divB{ float:right; width:51%;}
        
        .handleClass 
        {
            width: 60px;
            position: absolute;
            height: 20px;
            -webkit-border-radius: 7px;
            -moz-border-radius: 7px;
            border-radius: 7px;
            overflow: hidden;
            background-color: black;
        }

        .railClass 
        {
            width: 20px;
            height: 450px;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            background: #61bb46;
            position: relative;
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
    <form id="form1" runat="server" method="post">
    <div id="mainContainer" style="text-align:center;" >
        <h1>Set Level: <asp:Label runat="server" ID="lblTitle"/> </h1>
        <br />
        <h2>Current State:  <asp:Label runat="server" ID="lblCurrentState" /></h2>
        <br />
        <div id="divA"></div>
        <div id="divB">
               <asp:TextBox id="Slider1" runat="server" AutoPostback="true" />
                <ajaxToolkit:SliderExtender 
                    ID="Slider1_SliderExtender" 
                    orientation="Vertical" 
                    runat="server" 
                    Enabled="True" 
                    Maximum="100" 
                    Minimum="0" 
                    Steps="11" 
                    Length="400"
                    BehaviorID="SliderBehavior"
                    RailCssClass="railClass"
                    HandleCssClass="handleClass"
                    RaiseChangeOnlyOnMouseUp="true"
                    TargetControlID="Slider1">
                </ajaxToolkit:SliderExtender>
                <br />
        </div>
        <br />
        <br />
     </div>
        <div style="text-align:center;">
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="btnMoveBlind" runat="server" Text="Move Blind" />
       </div>
       <br />
       <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WatchdogConnectionString1 %>" SelectCommand="sp_InsteonRequestStateChange" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="Blind_ID" Type="String" />
                <asp:FormParameter DefaultValue="0" Name="Blind_Request_State" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
    </form>
    <br />
    <a href="default.aspx"><h2>Back</h2></a>
    <meta http-equiv="refresh" content="20"/>
</body>
</html>
