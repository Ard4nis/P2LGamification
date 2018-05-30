<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Master/Gamification.Master" AutoEventWireup="true" CodeBehind="Simulate.aspx.cs" Inherits="P2LGamification.Pages.Content.Simulate" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%; height: 60px;">
        <telerik:RadDropDownList ID="CustomersDDL" runat="server" DataSourceID="Customers" Skin="MetroTouch" DataTextField="Name" DataValueField="ID" OnSelectedIndexChanged="CustomersDDL_SelectedIndexChanged"></telerik:RadDropDownList>
        <br />
        <telerik:RadDropDownList ID="UsersDDL" runat="server" DataSourceID="Users" DataTextField="Name" DataValueField="ID" Skin="MetroTouch"></telerik:RadDropDownList>

    </div>

    <telerik:RadLabel ID="RadLabel1" runat="server" Text="Vælg kursus:" Skin="MetroTouch"></telerik:RadLabel>
    <br />
    <telerik:RadDropDownList ID="CoursesDDL" runat="server" DataSourceID="Courses" DataTextField="Name" DataValueField="ID" Skin="MetroTouch"></telerik:RadDropDownList>
    <br />
    <br />
    <br />
    <telerik:RadLabel ID="RadLabel2" runat="server" Text="Hvor mange procent korrekt havde du:" Skin="MetroTouch"></telerik:RadLabel>
    <telerik:RadDropDownList ID="CompletionDDL" runat="server" Skin="MetroTouch" SelectedText="50%" SelectedValue="0">
        <Items>
            <telerik:DropDownListItem runat="server" Selected="true" Text="0%" Value="0" />
            <telerik:DropDownListItem runat="server" Text="10%" Value="10" />
            <telerik:DropDownListItem runat="server" Text="20%" Value="20" />
            <telerik:DropDownListItem runat="server" Text="30%" Value="30" />
            <telerik:DropDownListItem runat="server" Text="40%" Value="40" />
            <telerik:DropDownListItem runat="server" Text="50%" Value="50" />
            <telerik:DropDownListItem runat="server" Text="60%" Value="60" />
            <telerik:DropDownListItem runat="server" Text="70%" Value="70" />
            <telerik:DropDownListItem runat="server" Text="80%" Value="80" />
            <telerik:DropDownListItem runat="server" Text="90%" Value="90" />
            <telerik:DropDownListItem runat="server" Text="100%" Value="100" />
        </Items>
    </telerik:RadDropDownList>
    <br />
    <telerik:RadButton ID="SimulateBtn" runat="server" Text="Simulere e-læring" Skin="MetroTouch" OnClick="SimulateBtn_Click"></telerik:RadButton>
    <asp:SqlDataSource ID="Courses" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="GetCoursesForSimulation" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="CustomersDDL" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="UsersDDL" Name="UserID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Users" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT [ID], [Name] FROM [User] WHERE ([CustomerID] = @CustomerID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="CoursesDDL" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Customers" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
</asp:Content>
