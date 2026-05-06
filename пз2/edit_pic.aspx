<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="edit_pic.aspx.cs" Inherits="пз2.edit_pic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style21 {
            width: 112px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style14">
    <tr>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Автор" DataValueField="IDAuthor">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Q_Author]"></asp:SqlDataSource>
        </td>
        <td>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Типтовара" DataValueField="IDType">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Type]"></asp:SqlDataSource>
        </td>
    </tr>
</table>
<table class="auto-style14">
    <tr>
        <td>
            <asp:Button ID="Button9" runat="server" Text="Поиск по типу" OnClick="Button9_Click" />
        </td>
        <td>
            <asp:Button ID="Button10" runat="server" Text="Поиск по автору" OnClick="Button10_Click" />
        </td>
        <td>
            <asp:Button ID="Button11" runat="server" Text="Поиск по типу и автору" OnClick="Button11_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button12" runat="server" OnClick="Button12_Click" Text="Сброс" />
        </td>
    </tr>
</table>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IDGood" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
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
     <!-- ✅ ДОБАВЬТЕ ЭТУ СЕКЦИЮ: -->
  <connectionStrings>
    <add name="ConnectionString2" 
         connectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\Web.mdb" 
         providerName="System.Data.OleDb" />
  </connectionStrings>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Q_Picture_for_Sell]"></asp:SqlDataSource>
    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
    <br />
    <table class="auto-style14">
        <tr>
            <td rowspan="5">
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="IDGood" DataSourceID="SqlDataSource4" Height="50px" Width="125px">
                    <Fields>
                        <asp:BoundField DataField="IDGood" HeaderText="IDGood" InsertVisible="False" ReadOnly="True" SortExpression="IDGood" />
                        <asp:BoundField DataField="Название" HeaderText="Название" SortExpression="Название" />
                        <asp:BoundField DataField="IDAuthor" HeaderText="IDAuthor" SortExpression="IDAuthor" />
                        <asp:BoundField DataField="IDType" HeaderText="IDType" SortExpression="IDType" />
                        <asp:BoundField DataField="Цена" HeaderText="Цена" SortExpression="Цена" />
                        <asp:BoundField DataField="Дата поступления" HeaderText="Дата поступления" SortExpression="Дата поступления" />
                        <asp:CheckBoxField DataField="Продано" HeaderText="Продано" SortExpression="Продано" />
                        <asp:BoundField DataField="Год" HeaderText="Год" SortExpression="Год" />
                        <asp:BoundField DataField="Фото" HeaderText="Фото" SortExpression="Фото" />
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Picture]"></asp:SqlDataSource>
            </td>
            <td class="auto-style21">
                <asp:Label ID="Label11" runat="server" Text="Выбери рисунок"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="auto-style21">
                <asp:Label ID="Label8" runat="server" Text="Введи цену"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style21">
                <asp:Label ID="Label9" runat="server" Text="Введи год"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style21">
                <asp:Label ID="Label10" runat="server" Text="Введи название"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style21">
                <asp:Button ID="Button13" runat="server" Text="Добавить" OnClick="Button13_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
