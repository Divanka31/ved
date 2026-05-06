<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sale_Picture.aspx.cs" Inherits="пз2.Sale_Picture" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style21 {
            width: 197px;
        }
        .auto-style22 {
            width: 197px;
            height: 23px;
        }
        .auto-style23 {
            height: 23px;
            width: 757px;
        }
        .auto-style24 {
            width: 757px;
        }
        .auto-style25 {
            width: 87%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="IDType" DataValueField="IDType">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Type]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="IDGood">


        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="IDGood" HeaderText="IDGood" InsertVisible="False" SortExpression="IDGood" />
            <asp:BoundField DataField="Название" HeaderText="Название" SortExpression="Название" />
            <asp:BoundField DataField="Типтовара" HeaderText="Типтовара" SortExpression="Типтовара" />
            <asp:BoundField DataField="Автор" HeaderText="Автор" ReadOnly="True" SortExpression="Автор" />
            <asp:BoundField DataField="Цена" HeaderText="Цена" SortExpression="Цена" />
            <asp:BoundField DataField="IDAuthor" HeaderText="IDAuthor" SortExpression="IDAuthor" />
            <asp:BoundField DataField="IDType" HeaderText="IDType" SortExpression="IDType" />
            <asp:BoundField DataField="Фото" HeaderText="Фото" SortExpression="Фото" />
            <asp:CheckBoxField DataField="Продано" HeaderText="Продано" SortExpression="Продано" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Q_Picture_for_Sell]"></asp:SqlDataSource>
    <br />
    <table class="auto-style25">
        <tr>
            <td class="auto-style21">
                <asp:Label ID="Label6" runat="server" Text="Название"></asp:Label>
            </td>
            <td class="auto-style24">
                <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="auto-style24" rowspan="5">
                <asp:Image ID="Image1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style21">
                <asp:Label ID="Label7" runat="server" Text="Техника создания"></asp:Label>
            </td>
            <td class="auto-style24">
                <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style21">
                <asp:Label ID="Label8" runat="server" Text="Автор"></asp:Label>
            </td>
            <td class="auto-style24">
                <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style22">
                <asp:Label ID="Label9" runat="server" Text="Цена"></asp:Label>
            </td>
            <td class="auto-style23">
                <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style22">
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Купить" />
            </td>
            <td class="auto-style23">
                <asp:Label ID="Label14" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <asp:Label ID="Label16" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <br />
</asp:Content>
