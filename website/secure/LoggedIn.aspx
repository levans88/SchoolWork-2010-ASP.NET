<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="LoggedIn.aspx.vb" Inherits="LoggedIn" title="Great Green T-Shirt Company | Logged In" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--Login page by TeamMember-->
<!--Session code by TeamMember-->
    <p align="center" class="style1">
        Welcome!</p>
    <p align="center" class="style3">
        Hello,
        <asp:Label ID="lblUser" runat="server" ForeColor="#006600"></asp:Label>
        . You have now logged into our secured area.<br />
        Please select a link from above to continue.</p>
        <br />
</asp:Content>

