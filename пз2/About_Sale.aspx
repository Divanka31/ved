<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About_Sale.aspx.cs" Inherits="пз2.About_Sale" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="IDDogov" HeaderText="IDDogov" InsertVisible="False" SortExpression="IDDogov" />
            <asp:BoundField DataField="Дата" HeaderText="Дата" SortExpression="Дата" />
            <asp:BoundField DataField="Название" HeaderText="Название" SortExpression="Название" />
            <asp:BoundField DataField="Фото" HeaderText="Фото" SortExpression="Фото" />
            <asp:BoundField DataField="Типтовара" HeaderText="Типтовара" SortExpression="Типтовара" />
            <asp:BoundField DataField="Фамилия" HeaderText="Фамилия" SortExpression="Фамилия" />
            <asp:BoundField DataField="NameStation" HeaderText="NameStation" SortExpression="NameStation" />
            <asp:BoundField DataField="NameU" HeaderText="NameU" SortExpression="NameU" />
            <asp:ImageField DataImageUrlField="Фото">
                <ControlStyle Width="100px" />
            </asp:ImageField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Q_Sale]"></asp:SqlDataSource>
</asp:Content>