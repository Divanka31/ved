<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="find.aspx.cs" Inherits="пз2.find" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Автор" DataValueField="IDAuthor" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
</asp:DropDownList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Q_Author]"></asp:SqlDataSource>
<br />
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IDGood" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="IDGood" HeaderText="IDGood" InsertVisible="False" SortExpression="IDGood" Visible="False" />
        <asp:BoundField DataField="Название" HeaderText="Название" SortExpression="Название" />
        <asp:BoundField DataField="Типтовара" HeaderText="Типтовара" SortExpression="Типтовара" />
        <asp:BoundField DataField="Автор" HeaderText="Автор" ReadOnly="True" SortExpression="Автор" />
        <asp:BoundField DataField="Цена" HeaderText="Цена" SortExpression="Цена" />
        <asp:BoundField DataField="IDAuthor" HeaderText="IDAuthor" SortExpression="IDAuthor" Visible="False" />
        <asp:BoundField DataField="IDType" HeaderText="IDType" SortExpression="IDType" Visible="False" />
        <asp:BoundField DataField="Фото" HeaderText="Фото" SortExpression="Фото" />
        <asp:CheckBoxField DataField="Продано" HeaderText="Продано" SortExpression="Продано" />
        <asp:ImageField DataImageUrlField="Фото">
            <ControlStyle Width="50px" />
        </asp:ImageField>
    </Columns>
    <SelectedRowStyle BackColor="#99CCFF" BorderStyle="Solid" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Q_Picture_for_Sell] WHERE ([IDAuthor] = ?)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="IDAuthor" SessionField="IDA" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<br />
<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource3" Height="50px" OnPageIndexChanging="DetailsView1_PageIndexChanging" Width="125px">
    <Fields>
        <asp:BoundField DataField="IDGood" HeaderText="IDGood" InsertVisible="False" SortExpression="IDGood" Visible="False" />
        <asp:BoundField DataField="Название" HeaderText="Название" SortExpression="Название" />
        <asp:BoundField DataField="Типтовара" HeaderText="Типтовара" SortExpression="Типтовара" />
        <asp:BoundField DataField="Автор" HeaderText="Автор" ReadOnly="True" SortExpression="Автор" />
        <asp:BoundField DataField="Цена" HeaderText="Цена" SortExpression="Цена" />
        <asp:BoundField DataField="IDAuthor" HeaderText="IDAuthor" SortExpression="IDAuthor" Visible="False" />
        <asp:BoundField DataField="IDType" HeaderText="IDType" SortExpression="IDType" Visible="False" />
        <asp:BoundField DataField="Фото" HeaderText="Фото" SortExpression="Фото" />
        <asp:CheckBoxField DataField="Продано" HeaderText="Продано" SortExpression="Продано" />
        <asp:ImageField DataImageUrlField="Фото">
            <ControlStyle Width="200px" />
        </asp:ImageField>
    </Fields>
</asp:DetailsView>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Q_Picture_for_Sell] WHERE ([IDGood] = ?)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="IDGood" SessionField="IDG" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
