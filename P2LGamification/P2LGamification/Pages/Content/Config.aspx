<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Master/Gamification.Master" AutoEventWireup="true" CodeBehind="Config.aspx.cs" Inherits="P2LGamification.Pages.Content.Config" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: 8%; float: left;">
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" MultiPageID="RadMultiPage1" Orientation="VerticalLeft" Skin="MetroTouch" Height="100%" Align="Left">
            <Tabs>
                <telerik:RadTab runat="server" Text="Kurser" PageViewID="RadPageView1">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Text="Achievements" PageViewID="RadPageView2">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
    </div>
    <div style="width:80%; float: left; height:500px;">
        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" Width="100%" Height="100%">
            <telerik:RadPageView ID="RadPageView1" runat="server" ContentUrl="ConfigureCourses.aspx"></telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView2" runat="server" ContentUrl="ConfigureAchievements.aspx"></telerik:RadPageView>
        </telerik:RadMultiPage>
    </div>
</asp:Content>
