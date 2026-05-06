<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="пз2.add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style21 {
        width: 282px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td class="auto-style21">
            <asp:DropDownList ID="LstAuthor" runat="server" DataSourceID="SqlDataSource1" DataTextField="Автор" DataValueField="IDAuthor">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Q_Author]"></asp:SqlDataSource>
        </td>
        <td>Выберите Автора</td>
    </tr>
    <tr>
        <td class="auto-style21">
            <asp:DropDownList ID="LstType" runat="server" DataSourceID="SqlDataSource2" DataTextField="Типтовара" DataValueField="IDType">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Type]"></asp:SqlDataSource>
        </td>
        <td>Выберите тип</td>
    </tr>
    <tr>
        <td class="auto-style21">Выберите рисунок</td>
        <td>
            <asp:FileUpload ID="FileUpload1" runat="server" />
        </td>
    </tr>
    <tr>
        <td class="auto-style21">Цена</td>
        <td>
            <asp:TextBox ID="TxtPrice" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style21">Год создания</td>
        <td>
            <asp:TextBox ID="TxtYear" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style21">Название</td>
        <td>
            <asp:TextBox ID="TxtName" runat="server" Width="496px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style21">
            <asp:Button ID="Button4" runat="server" Text="Добавить" />
        </td>
        <td>
            <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style21">
            <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
<br />
<br />
<br />
<br />
</asp:Content>
