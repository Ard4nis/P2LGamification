<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Master/Gamification.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="P2LGamification.Pages.Default" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Scripts/Default.css" rel="stylesheet" />    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="buttonList" class="auto-style1">
        <telerik:RadMenu ID="RadMenu1" runat="server" Skin="Metro">
            <Items>
                <telerik:RadMenuItem runat="server" Text="Konfigurer">
                </telerik:RadMenuItem>
                <telerik:RadMenuItem runat="server" Text="Simuler E-Læring">
                </telerik:RadMenuItem>
                <telerik:RadMenuItem runat="server" Text="Vis Achievements">
                </telerik:RadMenuItem>
            </Items>
        </telerik:RadMenu>
    </div>
</asp:Content>
