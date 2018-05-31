<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Master/Gamification.Master" AutoEventWireup="true" CodeBehind="ConfigureAchievements.aspx.cs" Inherits="P2LGamification.Pages.Content.ConfigureAchievements" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%; height: 60px;">
        <telerik:RadDropDownList ID="CustomersDDL" runat="server" DataSourceID="Customers" Skin="MetroTouch" DataTextField="Name" DataValueField="ID" OnSelectedIndexChanged="CustomersDDL_SelectedIndexChanged"></telerik:RadDropDownList>
    </div>

    <div style="width: 40%; float: left;">
        <div style="width: 100%; height: 45px">
            <telerik:RadTextBox ID="NameBox" runat="server" EmptyMessage="Navn på achievement" Resize="None" Skin="MetroTouch"></telerik:RadTextBox>
        </div>
        <telerik:RadLabel ID="RadLabel3" runat="server" Text="Kursus:" Skin="MetroTouch"></telerik:RadLabel>
        <div style="width: 100%; height: 45px;">
            <telerik:RadDropDownList ID="CourseDDL" runat="server" DataSourceID="Courses" Skin="MetroTouch" DataTextField="Name" DataValueField="ID" AutoPostBack="true"></telerik:RadDropDownList>
        </div>
        <div style="width: 100%; height: 130px;">
            <telerik:RadLabel ID="RadLabel2" runat="server" Text="Beskrivelsestekst" Skin="MetroTouch"></telerik:RadLabel>
            <br />
            <telerik:RadTextBox ID="DescriptionTextBox" runat="server" Skin="MetroTouch" ToolTip="Her indtastes den generelle beskrivelse af achievementen." Height="100" Width="530"></telerik:RadTextBox>
        </div>
        <div style="width: 100%; height: 130px;">
            <telerik:RadLabel ID="RadLabel1" runat="server" Text="Gennemførselstekst" Skin="MetroTouch"></telerik:RadLabel>
            <br />
            <telerik:RadTextBox ID="CompletionTextBox" runat="server" Skin="MetroTouch" ToolTip="Her indtastes den besked der vil dukke op når en bruger får achievementen." Height="100" Width="530"></telerik:RadTextBox>
        </div>
        <div style="width: 100%; height: 510px;">
            <telerik:RadFileExplorer ID="RadFileExplorer1" OnClientItemSelected="onClientItemSelected" runat="server" Width="530" Height="500" Skin="MetroTouch">
                <Configuration ViewPaths="~/Images/Achievement Icons/png" />
            </telerik:RadFileExplorer>
            <asp:HiddenField ID="FilePath" runat="server" />
            <script type="text/javascript">
                function onClientItemSelected(fileExplorer, args) {
                    if (args.get_item().get_type() == Telerik.Web.UI.FileExplorerItemType.File) {
                        // if the item is a file     
                        var FilePath = $get("<%= FilePath.ClientID %>");
                        FilePath.value = args.get_item().get_path();
                    }
                }
            </script>
        </div>
        <telerik:RadButton ID="AddBtn" runat="server" Text="Tilføj achievement" Skin="MetroTouch" OnClick="AddBtn_Click"></telerik:RadButton>
    </div>
    <div style="width: 33%; height: 60px; float: left;">

        <telerik:RadListView ID="CurrentAchievements" runat="server" DataKeyNames="ID" DataSourceID="Achievements" AllowNaturalSort="True" Skin="MetroTouch">
            <LayoutTemplate>
                <div class="RadListView RadListView_MetroTouch">
                    <table cellspacing="0" style="width: 100%;">
                        <thead>
                            <tr class="rlvHeader">
                                <th>&nbsp;</th>
                                <th>Navn</th>
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
                        <asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" CssClass="rlvBDel" Text=" " ToolTip="Delete" />
                    </td>
                    <td>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
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
                </tr>
            </AlternatingItemTemplate>
            <EmptyDataTemplate>
                <div class="RadListView RadListView_MetroTouch">
                    <div class="rlvEmpty">
                        Der er ingen achievements at vise.
                    </div>
                </div>
            </EmptyDataTemplate>
        </telerik:RadListView>


    </div>
    <asp:SqlDataSource ID="Customers" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT * FROM [Customer]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="Courses" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" SelectCommand="SELECT [ID], [Name] FROM [Course] WHERE ([CustomerID] = @CustomerID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="CustomersDDL" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Achievements" runat="server" ConnectionString="<%$ ConnectionStrings:DBConnectionString %>" DeleteCommand="DELETE FROM [Achievement] WHERE [ID] = @ID" SelectCommand="SELECT * FROM [Achievement] WHERE ([CustomerID] = @CustomerID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="CustomersDDL" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>
