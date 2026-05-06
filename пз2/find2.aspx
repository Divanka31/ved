<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="find2.aspx.cs" Inherits="пз2.find2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Автор" DataValueField="IDAuthor">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Q_Author]"></asp:SqlDataSource>
    <br />
    <br />
    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Типтовара" DataValueField="IDType">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Type]"></asp:SqlDataSource>
    <br />
    <br />
    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Поиск по автору" />
    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Поиск по виду" />
    <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Поиск по виду и автору" />
    <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Сброс" />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="IDGood" >
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Q_Picture_for_Sell]"></asp:SqlDataSource>
    <br />
    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
    <br />
</asp:Content>
