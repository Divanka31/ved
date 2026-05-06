<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="New_Exhibition.aspx.cs" Inherits="пз2.New_Exhibition" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style22 {
        width: 271px;
    }
    .auto-style24 {
        width: 271px;
        height: 30px;
    }
    .auto-style25 {
        height: 30px;
    }
    .auto-style26 {
        width: 253px;
    }
    .auto-style27 {
        width: 286px;
    }
    .auto-style28 {
        width: 253px;
        height: 26px;
    }
    .auto-style29 {
        width: 271px;
        height: 26px;
    }
    .auto-style30 {
        height: 26px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    <table class="auto-style1">
        <tr>
            <td class="auto-style28">
                <asp:Label ID="Label" runat="server" Text="Ввод начальной страницы"></asp:Label>
            </td>
            <td class="auto-style29">Дата начала</td>
            <td class="auto-style30">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style26" rowspan="5">
                <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" Width="232px"></asp:Calendar>
            </td>
            <td class="auto-style22">Дата окончания</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style22">Тема выставки</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style22">Место проведения</td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style24">
                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Создать выставку" />
            </td>
            <td class="auto-style25">
                <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style22">
                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Просмотр картин" Width="162px" />
            </td>
            <td>
                <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
    <table class="auto-style1">
        <tr>
            <td class="auto-style27">
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
        <tr>
            <td class="auto-style27">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="IDGood">
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
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="IDpicture" DataSourceID="SqlDataSource4" >
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="IDpicture" HeaderText="IDpicture" SortExpression="IDpicture" />
            <asp:BoundField DataField="IDexhibitor" HeaderText="IDexhibitor" SortExpression="IDexhibitor" />
            <asp:BoundField DataField="Название" HeaderText="Название" SortExpression="Название" />
            <asp:BoundField DataField="Типтовара" HeaderText="Типтовара" SortExpression="Типтовара" />
            <asp:BoundField DataField="Фамилия" HeaderText="Фамилия" SortExpression="Фамилия" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:WebConnectionString %>" ProviderName="<%$ ConnectionStrings:WebConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Q_exhibition_picture]"></asp:SqlDataSource>
    <br />
</p>
</asp:Content>
