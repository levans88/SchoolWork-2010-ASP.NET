<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Register.aspx.vb" Inherits="Register" title="Great Green T-Shirt Company | Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">

* {
	
            text-align: center;
        }

      

        .style4
        {
            width: 8%;
        }
        .style8
        {
            font-size: large;
            color: #006600;
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <!--Registration page by TeamMember-->

    <p align="center" class="style8">Register</p>
    <p align="left" class="style2">

        Please complete the information fields below. All fields are required.</p>

                <asp:CompareValidator ID="valPassCompare" runat="server" 
                    ControlToCompare="txtPassword" ControlToValidate="txtPassword2" 
                    ErrorMessage="Both passwords must match"></asp:CompareValidator>

   <table border="0">
        <tr>
            <td class="style4">Username<br />
                <asp:RequiredFieldValidator ID="valUsername" runat="server" 
                    ControlToValidate="txtUsername" ErrorMessage="Username is required"></asp:RequiredFieldValidator>
            </td>
            <td width="16%"><asp:TextBox ID="txtUsername" runat="server" BorderColor="#666666" 
                    Width="120px"></asp:TextBox>
                <br />
            </td>
            <td width="8%">Email Address<br />
                <asp:RequiredFieldValidator ID="valEmail" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Email is required"></asp:RequiredFieldValidator>
            </td>
            <td width="16%"><asp:TextBox ID="txtEmail" runat="server" BorderColor="#666666" 
                    Width="120px"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style4">Password&nbsp;
                <br />
                <asp:RequiredFieldValidator ID="valPassword" runat="server" 
                    ControlToValidate="txtPassword" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
                                </td>
            <td width="16%">
                <asp:TextBox ID="txtPassword" runat="server" BorderColor="#666666" 
                    TextMode="Password" Width="120px"></asp:TextBox>
                <br />
            </td>
            
            <td width="8%">Confirm Password<br />
                <asp:RequiredFieldValidator ID="valPassword2" runat="server" 
                    ControlToValidate="txtPassword2" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
            </td>
            <td width="16%">
                <asp:TextBox ID="txtPassword2" runat="server" BorderColor="#666666" 
                    TextMode="Password" Width="120px"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style4">First Name<br />
                <asp:RequiredFieldValidator ID="valFname" runat="server" 
                    ControlToValidate="txtFname" ErrorMessage="First Name is required"></asp:RequiredFieldValidator>
            </td>
            <td width="16%"><asp:TextBox ID="txtFname" runat="server" BorderColor="#666666" 
                    Width="120px"></asp:TextBox>
                <br />
            </td>
            <td width="8%">Last Name<br />
                <asp:RequiredFieldValidator ID="valLname" runat="server" 
                    ControlToValidate="txtLname" ErrorMessage="Last Name is required"></asp:RequiredFieldValidator>
            </td>
            <td width="16%"><asp:TextBox ID="txtLname" runat="server" BorderColor="#666666" 
                    Width="120px"></asp:TextBox>
                <br />
            </td>
        </tr>
    </table>
    
    <p align="left" class="style2">
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
        </p>
        <br />

 <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ECUserConnection %>" 
            ProviderName="<%$ ConnectionStrings:ECUserConnection.ProviderName %>">
        </asp:SqlDataSource>

</asp:Content>

