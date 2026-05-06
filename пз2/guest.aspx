<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="guest.aspx.cs" Inherits="пз2.guest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span class="auto-style19">Гостевая книга</span><br />
    <br />
    Введите ваше имя&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    <br />
    <br />
    Текст сообщения&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Добавить сообщение" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label6" runat="server" Text="Label9"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server"  AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IDBook">
        <Columns>
            <asp:BoundField DataField="IDBook" HeaderText="IDBook" InsertVisible="False" ReadOnly="True" SortExpression="IDBook" Visible="False" />
            <asp:BoundField DataField="book_date" HeaderText="Дата" SortExpression="book_date" />
            <asp:BoundField DataField="Book_page" HeaderText="Текст сообщения" SortExpression="Book_page" />
            <asp:BoundField DataField="Guest" HeaderText="Подпись" SortExpression="Guest" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Book]"></asp:SqlDataSource>
    <br />
    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
</asp:Content>
