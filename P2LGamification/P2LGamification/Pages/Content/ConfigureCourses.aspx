<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Master/Gamification.Master" AutoEventWireup="true" CodeBehind="ConfigureCourses.aspx.cs" Inherits="P2LGamification.Pages.Content.ConfigureCourses" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%; height: 60px;">
        <telerik:RadDropDownList ID="CustomersDDL" runat="server" DataSourceID="Customers" Skin="MetroTouch" DataTextField="Name" DataValueField="ID"></telerik:RadDropDownList>
    </div>
    <div style="width: 20%; float: left;">
        <div style="width: 100%; height: 45px">
            <telerik:RadTextBox ID="NameBox" runat="server" EmptyMessage="Navn på kursus" Resize="None" Skin="MetroTouch"></telerik:RadTextBox>
        </div>
        <telerik:RadLabel ID="RadLabel2" runat="server" Text="Gennemførselsprocent:" Skin="MetroTouch"></telerik:RadLabel>
        <div style="width: 100%; height: 60px">

            <telerik:RadDropDownList ID="CompletionDDL" runat="server" Skin="MetroTouch" SelectedText="50%" SelectedValue="0">
                <Items>
                    <telerik:DropDownListItem runat="server" Selected="True" Text="50%" Value="50" />
                    <telerik:DropDownListItem runat="server" Text="60%" Value="60" />
                    <telerik:DropDownListItem runat="server" Text="70%" Value="70" />
                    <telerik:DropDownListItem runat="server" Text="80%" Value="80" />
                    <telerik:DropDownListItem runat="server" Text="90%" Value="90" />
                    <telerik:DropDownListItem runat="server" Text="100%" Value="100" />
                </Items>
            </telerik:RadDropDownList>
        </div>
        <telerik:RadLabel ID="RadLabel1" runat="server" Text="Scoreboard Indstillinger" Skin="MetroTouch"></telerik:RadLabel>
        <div style="width: 100%; height: 100px">
            <telerik:RadCheckBoxList ID="ChbxListScoreSettings" runat="server" AutoPostBack="False">
                <Items>
                    <telerik:ButtonListItem Text="Tid" ToolTip="Skal tid spille en faktor ifht. point" Value="0" />
                    <telerik:ButtonListItem Text="Procent" ToolTip="Skal gennemførselsprocent spille en faktor i point afgivning" Value="1" />
                </Items>
            </telerik:RadCheckBoxList>
            <br />
            <telerik:RadNumericTextBox ID="PointBox" EmptyMessage="Kursets max point" runat="server" Skin="MetroTouch" NumberFormat-DecimalDigits="0"></telerik:RadNumericTextBox>
        </div>
        <telerik:RadButton ID="AddBtn" runat="server" Text="Tilføj Kursus" Skin="MetroTouch" OnClick="AddBtn_Click"></telerik:RadButton>
    </div>
    <div style="width: 46%; float: left;">

        <telerik:RadListView ID="CurrentCourses" runat="server" AllowNaturalSort="True" DataKeyNames="ID" DataSourceID="Courses" Skin="MetroTouch" ClientDataKeyNames="ID">
            <LayoutTemplate>
                <div class="RadListView RadListView_MetroTouch">
                    <table cellspacing="0" style="width: 100%;">
                        <thead>
                            <tr class="rlvHeader">
                                <th>&nbsp;</th>
                                <th>Navn</th>
                                <th>Gennemførsels %</th>
                                <th>Tid</th>
                                <th>Gennemførsel</th>
                                <th>Max Score</th>
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
                        <asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" CssClass="rlvBDel" Text=" " ToolTip="Slet" />
                    </td>
                    <td>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CompletionPercentageLabel" runat="server" Text='<%# Eval("CompletionPercentage") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="TimeCheckBox" runat="server" Checked='<%# Eval("Time") %>' Enabled="false" />
                    </td>
                    <td>
                        <asp:CheckBox ID="CompletionCheckBox" runat="server" Checked='<%# Eval("Completion") %>' Enabled="false" />
                    </td>
                    <td>
                        <asp:Label ID="MaxScoreLabel" runat="server" Text='<%# Eval("MaxScore") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr class="rlvA">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" CssClass="rlvBDel" Text=" " ToolTip="Delete" />
                    </td>
                    <td>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CompletionPercentageLabel" runat="server" Text='<%# Eval("CompletionPercentage") %>' />
                    </td>
                    <td>
                        <asp:CheckBox ID="TimeCheckBox" runat="server" Checked='<%# Eval("Time") %>' Enabled="false" />
                    </td>
                    <td>
                        <asp:CheckBox ID="CompletionCheckBox" runat="server" Checked='<%# Eval("Completion") %>' Enabled="false" />
                    </td>
                    <td>
                        <asp:Label ID="MaxScoreLabel" runat="server" Text='<%# Eval("MaxScore") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EmptyDataTemplate>
                <div class="RadListView RadListView_MetroTouch">
                    <div class="rlvEmpty">
                        Der er ingen kurser at vise.
                    </div>
                </div>
            </EmptyDataTemplate>
        </telerik:RadListView>


    </div>
    <asp:SqlDataSource ID="Customers" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Courses" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Course] WHERE ([CustomerID] = @CustomerID)" DeleteCommand="DELETE FROM [Course] WHERE ([ID] = @ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="CustomersDDL" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"/>
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>
