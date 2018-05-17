<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Master/Gamification.Master" AutoEventWireup="true" CodeBehind="ConfigureAchievements.aspx.cs" Inherits="P2LGamification.Pages.Content.ConfigureAchievements" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="width: 100%; height: 60px;">
        <telerik:RadDropDownList ID="CustomersDDL" runat="server" DataSourceID="Customers" Skin="MetroTouch" DataTextField="Name" DataValueField="ID"></telerik:RadDropDownList>
    </div>
    <asp:SqlDataSource ID="Customers" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
</asp:Content>
