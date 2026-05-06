<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="correct.aspx.cs" Inherits="пз2.correct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style21 {
        width: 252px;
    }
    .auto-style22 {
        width: 252px;
        height: 30px;
    }
    .auto-style23 {
        height: 30px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td class="auto-style21">
            <asp:Label ID="Label4" runat="server" Text="Имя"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Ввод имени обязателен"></asp:RequiredFieldValidator>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style21">
            <asp:Label ID="Label5" runat="server" Text="email"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4" EnableClientScript="False" ErrorMessage="Ввод обязателен"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" EnableClientScript="False" ErrorMessage="Не верен формат email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style21">
            <asp:Label ID="Label6" runat="server" Text="Web страница"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5" EnableClientScript="False" ErrorMessage="Ввод обязателен"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox5" EnableClientScript="False" ErrorMessage="Не верен адрес страницы" ValidationExpression="([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?"></asp:RegularExpressionValidator>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style21">
            <asp:Label ID="Label9" runat="server" Text="Пароль"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox6" EnableClientScript="False" ErrorMessage="Ввод пароля обязателен"></asp:RequiredFieldValidator>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style21">
            <asp:Label ID="Label8" runat="server" Text="Подтверждение пароля"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox6" ControlToValidate="TextBox7" EnableClientScript="False" EnableTheming="False" ErrorMessage="Пароль не совпадает"></asp:CompareValidator>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style22">
            <asp:Button ID="Button4" runat="server" Text="Готово" Height="61px" Width="193px" OnClick="Button4_Click"/>
        </td>
        <td class="auto-style23">
            <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
        </td>
        <td class="auto-style23"></td>
    </tr>
</table>
<br />
<br />
<br />
</asp:Content>
