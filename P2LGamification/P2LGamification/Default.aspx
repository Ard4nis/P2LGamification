<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Master/Gamification.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="P2LGamification.Pages.Default" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%; height: 5%;">
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" Skin="MetroTouch" Align="Center" ScrollButtonsPosition="Middle" MultiPageID="RadMultiPage1">
            <Tabs>
                <telerik:RadTab runat="server" Text="Konfigurer" PageViewID="RadPageView1">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Text="Simulere E-Læring" PageViewID="RadPageView2">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Text="Scoreboard" PageViewID="RadPageView3">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Text="Achievements" PageViewID="RadPageView4">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
    </div>

    <div style="width:100%; float: left; height:600px;">
        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" Width="100%" Height="100%">
            <telerik:RadPageView ID="RadPageView1" runat="server" ContentUrl="~/Pages/Content/Config.aspx"></telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView2" runat="server" ContentUrl="~/Pages/Content/Simulate.aspx"></telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView3" runat="server" ContentUrl="~/Pages/Content/Scoreboard.aspx"></telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView4" runat="server" ContentUrl="~/Pages/Content/Achievements.aspx"></telerik:RadPageView>
        </telerik:RadMultiPage>
    </div>
</asp:Content>
