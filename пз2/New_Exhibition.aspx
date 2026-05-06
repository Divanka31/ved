<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="New_Exhibition.aspx.cs" Inherits="пз2.New_Exhibition" %>
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
            width: 100%;
            height: 165px;
        }
        .auto-style27 {
            width: 188px;
            height: 30px;
        }
        .auto-style28 {
            height: 30px;
        }
        .auto-style29 {
            height: 8px;
        }
        .auto-style30 {
            width: 188px;
            height: 23px;
        }
        .auto-style31 {
            width: 188px;
        }
        .auto-style32 {
            width: 188px;
            height: 36px;
        }
        .auto-style33 {
            height: 36px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style23">
        <tr>
            <td class="auto-style22">
                <asp:Label ID="Label6" runat="server" Text="Ввод начальной даты"></asp:Label>
            </td>
            <td class="auto-style30">
                <asp:Label ID="Label7" runat="server" Text="Дата начала"></asp:Label>
            </td>
            <td class="auto-style16">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style21" rowspan="5">
                <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
            </td>
            <td class="auto-style31">
                <asp:Label ID="Label8" runat="server" Text="Дата окончания"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style31">
                <asp:Label ID="Label9" runat="server" Text="Тема выставки"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style32">
                <asp:Label ID="Label10" runat="server" Text="Место проведения"></asp:Label>
            </td>
            <td class="auto-style33">
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style27">
                <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="Создать выставку" />
            </td>
            <td class="auto-style28">
                <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style31">
                <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="Просмотр картины" />
            </td>
            <td>
                <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
    <table class="auto-style14">
        <tr>
            <td class="auto-style29"></td>
            <td class="auto-style29"></td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Типтовара" DataValueField="IDType" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Type]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Автор" DataValueField="IDAuthor" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Q_Author]"></asp:SqlDataSource>
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Q_Picture_for_Sell]"></asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IDpicture" DataSourceID="SqlDataSource4" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="IDpicture" HeaderText="IDpicture" SortExpression="IDpicture" />
            <asp:BoundField DataField="IDexhibition" HeaderText="IDexhibition" SortExpression="IDexhibition" />
            <asp:BoundField DataField="Название" HeaderText="Название" SortExpression="Название" />
            <asp:BoundField DataField="Типтовара" HeaderText="Типтовара" SortExpression="Типтовара" />
            <asp:BoundField DataField="Фамилия" HeaderText="Фамилия" SortExpression="Фамилия" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Q_exhibition_picture]"></asp:SqlDataSource>
</asp:Content>
