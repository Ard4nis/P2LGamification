<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Master/Gamification.Master" AutoEventWireup="true" CodeBehind="Achievements.aspx.cs" Inherits="P2LGamification.Pages.Content.Achievments" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../../Scripts/Achievements.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%; height: 60px;">
        <telerik:RadDropDownList ID="CustomersDDL" runat="server" AutoPostBack="True" DataSourceID="Customers" Skin="MetroTouch" DataTextField="Name" DataValueField="ID" OnSelectedIndexChanged="CustomersDDL_SelectedIndexChanged"></telerik:RadDropDownList>
        <asp:SqlDataSource ID="Customers" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
    </div>
    <telerik:RadTileList ID="Achievement" runat="server" DataSourceID="Achievements" Skin="MetroTouch">
       
        <DataBindings>
            <CommonTileBinding TileType="RadImageAndTextTile" DataTitleTextField="Name" />
            <ImageAndTextTileBinding DataImageUrlField="ImageURL" />
        </DataBindings>
    </telerik:RadTileList>
    <asp:SqlDataSource ID="Achievements" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Achievement] WHERE ([CustomerID] = @CustomerID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="CustomersDDL" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
