<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="_private_login" title="Great Green T-Shirt Company | Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style8
        {
            font-size: large;
            color: #006600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <!--Page header added by TeamMember-->
    <!--Button action coding by TeamMember-->
    <p align="center" class="style8">
        Please Login
    </p>
    <p align="left" class="style2">
        <span class="style2">Please enter your username and password below to login.
        <br />
        </span>
        <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label>
        <br />
    </p>
    <p align="left">
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        Username:           <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
        &nbsp;
        
        <asp:RequiredFieldValidator ID="validateUser" runat="server" 
            ControlToValidate="txtUser" ErrorMessage="Username is required.">
        </asp:RequiredFieldValidator>
        
        <span class="style2">
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        Password:           <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
        &nbsp;
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txtPass" ErrorMessage="Password is required.">
        </asp:RequiredFieldValidator>
        
        <br />
        </span>&nbsp;
        <br />
        <asp:Button ID="btnLogin" runat="server" Text="Login" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnRegister" runat="server" CausesValidation="False" Text="Register" />
        &nbsp;
    </p>
    <br />
    
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ECUserConnection %>"
            
        SelectCommand="SELECT * FROM [users] WHERE (([username] = username) AND ([password] = @password))" 
        ProviderName="<%$ ConnectionStrings:ECUserConnection.ProviderName %>">
            <SelectParameters>
                <asp:QueryStringParameter Name="username" QueryStringField="username" />
                <asp:QueryStringParameter Name="password" QueryStringField="password" />
            </SelectParameters>
        </asp:SqlDataSource>

</asp:Content>

