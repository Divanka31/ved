<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="edit_pic.aspx.cs" Inherits="пз2.edit_pic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style21 {
            width: 276px;
        }
        .auto-style22 {
            margin-left: 0px;
        }
        .auto-style23 {
            width: 292px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style21">
                <asp:Label ID="Label1" runat="server" Text="Фильтр по авторам"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Фамилия" DataValueField="IDAuthor">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT IDAuthor, Фамилия, Имя, Отчество FROM Author"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style21">
                <asp:Label ID="Label2" runat="server" Text="Фильтр по типам"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Типтовара" DataValueField="IDType">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT IDType, Типтовара FROM Type"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
    <table class="auto-style1">
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Поиск по типу" />
            </td>
            <td>
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Поиск по автору" />
            </td>
            <td class="auto-style23">
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Поиск по типу и автору" />
            </td>
            <td>
                <asp:Button ID="Button4" runat="server" CssClass="auto-style22" OnClick="Button4_Click" Text="Сброс" Width="105px" />
            </td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Название" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="IDGood" HeaderText="IDGood" InsertVisible="False" SortExpression="IDGood" />
            <asp:BoundField DataField="Название" HeaderText="Название" SortExpression="Название" />
            <asp:BoundField DataField="техника создания" HeaderText="техника создания" SortExpression="техника создания" />
            <asp:BoundField DataField="Автор" HeaderText="Автор" ReadOnly="True" SortExpression="Автор" />
            <asp:BoundField DataField="Цена" HeaderText="Цена" SortExpression="Цена" />
            <asp:BoundField DataField="Год" HeaderText="Год" SortExpression="Год" />
            <asp:BoundField DataField="IDAuthor" HeaderText="IDAuthor" SortExpression="IDAuthor" />
            <asp:BoundField DataField="IDType" HeaderText="IDType" SortExpression="IDType" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Q_picture_Sell]"></asp:SqlDataSource>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Детали выбранной картины"></asp:Label>
    <br />
    <asp:Label ID="Label4" runat="server" Text="ID:"></asp:Label>
    <br />
    <asp:Label ID="lblID" runat="server" Text="lblID"></asp:Label>
    <br />
    <asp:Label ID="Label6" runat="server" Text="Название"></asp:Label>
    <br />
    <asp:Label ID="lblTitle" runat="server" Text="lblTitle"></asp:Label>
    <br />
    <asp:Label ID="Label8" runat="server" Text="Автор"></asp:Label>
    <br />
    <asp:Label ID="lblAuthor" runat="server" Text="lblAuthor"></asp:Label>
    <br />
    <asp:Label ID="Label10" runat="server" Text="Тип"></asp:Label>
    <br />
    <asp:Label ID="lblType" runat="server" Text="lblType"></asp:Label>
    <br />
    <asp:Label ID="Label12" runat="server" Text="Цена"></asp:Label>
    <br />
    <asp:Label ID="lblPrice" runat="server" Text="lblPrice"></asp:Label>
    <br />
    <asp:Label ID="Label14" runat="server" Text="Статус продажи"></asp:Label>
    <br />
    <asp:Label ID="lblSold" runat="server" Text="lblSold"></asp:Label>
    <br />
    <asp:Label ID="Label16" runat="server" Text="Изображение"></asp:Label>
    <br />
    <asp:Image ID="imgPicture" runat="server" />
</asp:Content>
