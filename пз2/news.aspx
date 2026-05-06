<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="news.aspx.cs" Inherits="пз2.news" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idnews" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="idnews" HeaderText="idnews" InsertVisible="False" ReadOnly="True" SortExpression="idnews" Visible="False" />
        <asp:BoundField DataField="news" HeaderText="Текст новости" SortExpression="news" />
        <asp:BoundField DataField="dateN" DataFormatString="{0:d}" HeaderText="dateN" SortExpression="dateN" />
        <asp:CheckBoxField DataField="show" HeaderText="show" SortExpression="show" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [tbl_news]"></asp:SqlDataSource>
</asp:Content>
