<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="RegisterOK.aspx.vb" Inherits="RegisterOK" title="Great Green T-Shirt Company | Registration Successful" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Registration Successful<br />
        <br />
        Username:
        <asp:Label ID="lblUser" runat="server" Text="Label"></asp:Label>
    </p>
    <p>
        You have been automatically logged in.  Please click
        <a href="http://localhost/products.aspx">here</a>
        to view our products.
    </p>
        
</asp:Content>

