<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Master/Gamification.Master" AutoEventWireup="true" CodeBehind="Scoreboard.aspx.cs" Inherits="P2LGamification.Pages.Content.Scoreboard" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%; height: 150px;">
        <telerik:RadDropDownList ID="CustomersDDL" runat="server" AutoPostBack="true" DataSourceID="Customers" Skin="MetroTouch" DataTextField="Name" DataValueField="ID" OnSelectedIndexChanged="CustomersDDL_SelectedIndexChanged"></telerik:RadDropDownList>
        <br />
        <asp:SqlDataSource ID="Customers" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>

        <telerik:RadLabel ID="RadLabel3" runat="server" Text="Vælg kursus:" Skin="MetroTouch"></telerik:RadLabel>
        <br />
        <telerik:RadDropDownList ID="CoursesDDL" runat="server" AutoPostBack="true" DataSourceID="Courses" DataTextField="Name" DataValueField="ID" Skin="MetroTouch" OnSelectedIndexChanged="CoursesDDL_SelectedIndexChanged"></telerik:RadDropDownList>
        <asp:SqlDataSource ID="Courses" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT [ID], [Name] FROM [Course] WHERE ([CustomerID] = @CustomerID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="CustomersDDL" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </div>

    <telerik:RadListView ID="CurrentAchievements" runat="server" DataKeyNames="ID" DataSourceID="Scores" AllowNaturalSort="True" Skin="MetroTouch">
        <LayoutTemplate>
            <div class="RadListView RadListView_MetroTouch">
                <table cellspacing="0" style="width: 100%;">
                    <thead>
                        <tr class="rlvHeader">
                            <th>Name</th>
                            <th>Point</th>
                            <th>MaxScore</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </tbody>
                </table>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <tr class="rlvI">

                <td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                </td>
                <td>
                    <asp:Label ID="PointLabel" runat="server" Text='<%# Eval("Point") %>' />
                </td>
                <td>
                    <asp:Label ID="MaxScoreLabel" runat="server" Text='<%# Eval("MaxScore") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr class="rlvA">

                <td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                </td>
                <td>
                    <asp:Label ID="PointLabel" runat="server" Text='<%# Eval("Point") %>' />
                </td>
                <td>
                    <asp:Label ID="MaxScoreLabel" runat="server" Text='<%# Eval("MaxScore") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>

        <EmptyDataTemplate>
            <div class="RadListView RadListView_MetroTouch">
                <div class="rlvEmpty">
                    There are no items to be displayed.
                </div>
            </div>
        </EmptyDataTemplate>

    </telerik:RadListView>
    <asp:SqlDataSource ID="Scores" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="GetScoresForScoreboard" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="CoursesDDL" Name="CourseID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
