<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="edit_st.aspx.cs" Inherits="пз2.edit_st" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="NameStation" DataValueField="NameStation" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" Width="205px">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [Station]"></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="IDDogov">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="IDDogov" HeaderText="IDDogov" InsertVisible="False" SortExpression="IDDogov" />
            <asp:BoundField DataField="Дата" HeaderText="Дата" SortExpression="Дата" />
            <asp:BoundField DataField="Название" HeaderText="Название" SortExpression="Название" />
            <asp:BoundField DataField="Фото" HeaderText="Фото" SortExpression="Фото" />
            <asp:BoundField DataField="Типтовара" HeaderText="Типтовара" SortExpression="Типтовара" />
            <asp:BoundField DataField="Фамилия" HeaderText="Фамилия" SortExpression="Фамилия" />
            <asp:BoundField DataField="NameStation" HeaderText="NameStation" SortExpression="NameStation" />
            <asp:BoundField DataField="NameU" HeaderText="NameU" SortExpression="NameU" />
        </Columns>
    </asp:GridView>



    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [Q_Sale]"></asp:SqlDataSource>
    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
    <br />
    <table class="auto-style14">
        <tr>
            <td>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource3" Height="50px" Width="125px">
                    <Fields>
                        <asp:BoundField DataField="IDDogov" HeaderText="IDDogov" InsertVisible="False" SortExpression="IDDogov" />
                        <asp:BoundField DataField="Дата" HeaderText="Дата" SortExpression="Дата" />
                        <asp:BoundField DataField="Название" HeaderText="Название" SortExpression="Название" />
                        <asp:BoundField DataField="Фото" HeaderText="Фото" SortExpression="Фото" />
                        <asp:BoundField DataField="Типтовара" HeaderText="Типтовара" SortExpression="Типтовара" />
                        <asp:BoundField DataField="Фамилия" HeaderText="Фамилия" SortExpression="Фамилия" />
                        <asp:BoundField DataField="NameStation" HeaderText="NameStation" SortExpression="NameStation" />
                        <asp:BoundField DataField="NameU" HeaderText="NameU" SortExpression="NameU" />
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [Q_Sale]"></asp:SqlDataSource>
            </td>
            <td style="vertical-align: top">
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="NameStation" DataValueField="IDStation">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [Station]"></asp:SqlDataSource>
                <br />
                <asp:Button ID="Button9" runat="server" Height="33px" OnClick="Button9_Click" Text="Изменить" Width="116px" />
            </td>
        </tr>
    </table>
</asp:Content>
