<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Master/Gamification.Master" AutoEventWireup="true" CodeBehind="Config.aspx.cs" Inherits="P2LGamification.Pages.Content.Config" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" MultiPageID="RadMultiPage1" Orientation="VerticalLeft" Skin="MetroTouch">
            <Tabs>
                <telerik:RadTab runat="server" Text="Courses" PageViewID="RadPageView1">
                </telerik:RadTab>
                <telerik:RadTab runat="server" Text="Achievements" PageViewID="RadPageView2">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0">
            <telerik:RadPageView ID="RadPageView1" runat="server" ContentUrl="ConfigureCourses.aspx"></telerik:RadPageView>
            <telerik:RadPageView ID="RadPageView2" runat="server" ContentUrl="ConfigureAchievements.aspx"></telerik:RadPageView>
        </telerik:RadMultiPage>
    
</asp:Content>
