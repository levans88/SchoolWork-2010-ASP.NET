<%@ Page Title="Great Green T-Shirt Company | Billing and Shipping Information" Language="VB" debug="true" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="shipbillinfo.aspx.vb" Inherits="shipbillinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">


        .style8
        {
            font-size: large;
            color: #006600;
        }
    .style15
    {
        text-align: right;
        width: 125px;
    }
    .style16
    {
        text-align: right;
    }
    .style17
    {
        width: 100%;
    }
    .style19
    {
        text-align: right;
        width: 287px;
    }
    .style20
    {
        width: 159px;
    }
    .style21
    {
        text-align: left;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <p align="center" class="style8">Billing and Shipping Information</p>
    <p align="left" class="style2">

        Please enter your billing and shipping addresses as well as your credit card information below.  All fields are required.</p>
        <br />
   <table width="100%">
        <tr>
            <td class="style2">
                Billing</td>
            <td class="style2">
                Shipping</td>
        </tr>
   </table>
   <br />
   <table border="0" width="100%">
        <tr>
            <td class="style16">
                    
                Street Address<br />
                <asp:RequiredFieldValidator ID="valBStreet" runat="server" 
                    ErrorMessage="Street Required" ControlToValidate="txtBStreet"></asp:RequiredFieldValidator>
                <br />
                    
            </td>
            <td>
                &nbsp;</td>
            
            <td>
                <asp:TextBox ID="txtBStreet" runat="server" BorderColor="#666666" Width="223px"></asp:TextBox>
            </td>
            
            <td class="style16">
            
                Street Address<br />
                <asp:RequiredFieldValidator ID="valSStreet" runat="server" 
                    ErrorMessage="Street Required" ControlToValidate="txtSStreet"></asp:RequiredFieldValidator>
                <br />
            
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:TextBox ID="txtSStreet" runat="server" BorderColor="#666666" 
                    Width="223px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style16">
                    
                City<br />
                <asp:RequiredFieldValidator ID="valBCity" runat="server" 
                    ErrorMessage="City Required" ControlToValidate="txtBCity"></asp:RequiredFieldValidator>
                <br />
                    
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:TextBox ID="txtBCity" runat="server" BorderColor="#666666" 
                    Width="223px"></asp:TextBox>
            </td>
            <td class="style16">
            
                City<br />
                <asp:RequiredFieldValidator ID="valSCity" runat="server" 
                    ErrorMessage="City Required" ControlToValidate="txtSCity"></asp:RequiredFieldValidator>
                <br />
            
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:TextBox ID="txtSCity" runat="server" BorderColor="#666666" 
                    Width="224px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style16">
                    
                State<br />
                <asp:RequiredFieldValidator ID="valBState" runat="server" 
                    ErrorMessage="State Required" ControlToValidate="txtBState"></asp:RequiredFieldValidator>
                <br />
                    
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:TextBox ID="txtBState" runat="server" BorderColor="#666666" 
                    Width="224px"></asp:TextBox>
            </td>
            <td class="style15">
            
                State<br />
                <asp:RequiredFieldValidator ID="valSState" runat="server" 
                    ErrorMessage="State Required" ControlToValidate="txtSState"></asp:RequiredFieldValidator>
                <br />
            
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:TextBox ID="txtSState" runat="server" BorderColor="#666666" 
                    Width="223px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style16">
                    
                Zip<br />
                <asp:RequiredFieldValidator ID="valBZip" runat="server" 
                    ErrorMessage="Zip Code Required" ControlToValidate="txtBzip"></asp:RequiredFieldValidator>
                <br />
                    
            </td>
            <td>
                &nbsp;</td>
            
            <td>
                <asp:TextBox ID="txtBZip" runat="server" BorderColor="#666666" 
                    Width="223px"></asp:TextBox>
            </td>
            
            <td class="style16">
            
                Zip<br />
                <asp:RequiredFieldValidator ID="valSZip" runat="server" 
                    ErrorMessage="Zip Code Required" ControlToValidate="txtSZip"></asp:RequiredFieldValidator>
                <br />
            
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:TextBox ID="txtSZip" runat="server" BorderColor="#666666" 
                    Width="224px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    
                                    <br />
    <p align="center" class="style8">Credit Card Information</p>
                                    <table class="style17">
                                        <tr>
                                            <td class="style19" valign="top">
                                                Card Type</td>
            <td class="style20">
                <asp:DropDownList ID="ddlCardType" runat="server" Height="22px" 
                    style="margin-left: 0px" Width="177px">
                    <asp:ListItem Selected="True" Value="Visa">Visa</asp:ListItem>
                    <asp:ListItem Value="Mastercard">Mastercard</asp:ListItem>
                    <asp:ListItem Value="American Express">American Express</asp:ListItem>
                    <asp:ListItem Value="Discover">Discover</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </td>
            <td class="style21">
                &nbsp;</td>
        </tr>
                                        <tr>
                                            <td class="style19">
                                                Card Holder&#39;s Name</td>
            <td class="style20">
                <asp:TextBox ID="txtCardHolderName" runat="server" BorderColor="#666666" 
                    Width="179px" Height="18px" style="margin-left: 0px"></asp:TextBox>
            </td>
            <td class="style21">
                <asp:RequiredFieldValidator ID="valCardHolderName" runat="server" 
                    ErrorMessage="Name Required" ControlToValidate="txtCardHolderName"></asp:RequiredFieldValidator>
                                            </td>
        </tr>
                                        <tr>
                                            <td class="style19">
                                                Card Number</td>
            <td class="style20">
                <asp:TextBox ID="txtCardNumber" runat="server" BorderColor="#666666" 
                    Width="179px" Height="18px" style="margin-left: 0px"></asp:TextBox>
            </td>
            <td class="style21">
                <asp:RequiredFieldValidator ID="valCardNumber" runat="server" 
                    ErrorMessage="Card Number Required" ControlToValidate="txtCardNumber"></asp:RequiredFieldValidator>
                                            </td>
        </tr>
                                        <tr>
                                            <td class="style19">
                                                Expiration Date </td>
            <td class="style20" valign="middle">
                <asp:TextBox ID="txtExpirationDate" runat="server" BorderColor="#666666" 
                    Width="179px" Height="18px" style="margin-left: 0px"></asp:TextBox>
                    <br />
                (MM/DD/YYYY)</td>
            <td class="style21">
                <asp:RequiredFieldValidator ID="valExpirationDate" runat="server" 
                    ErrorMessage="Expiration Date Required" 
                    ControlToValidate="txtExpirationDate" style="text-align: left"></asp:RequiredFieldValidator>
                                            </td>
        </tr>
                                        <tr>
                                            <td class="style19">
                                                &nbsp;</td>
            <td class="style20" valign="middle">
                &nbsp;</td>
            <td class="style21">
                &nbsp;</td>
        </tr>
                                        <tr>
                                            <td class="style19">
                                                CVV/CV2</td>
            <td class="style20">
                <asp:TextBox ID="txtCode" runat="server" BorderColor="#666666" 
                    Width="179px" Height="18px" style="margin-left: 0px"></asp:TextBox>
                <br />
            </td>
            <td class="style21">
                <asp:RequiredFieldValidator ID="valCode" runat="server" 
                    ErrorMessage="Code Required" ControlToValidate="txtCode" 
                    style="text-align: left"></asp:RequiredFieldValidator>
                                            </td>
        </tr>
                                        <tr>
                                            <td class="style19">
                                                &nbsp;</td>
            <td class="style20">
                <br />
                <img alt="CVV" src="images/cvv.JPG" 
                    style="width: 243px; height: 130px; float: right;" /><br />
                <br />
            </td>
            <td class="style21">
                &nbsp;</td>
        </tr>
    </table>
    <p align="left" class="style2">
        <asp:Button ID="btnCheckout" runat="server" Text="Checkout" />
        </p>
        <br />
   
    
    <asp:SqlDataSource ID="SqlDataSourceUpdateBillShip" runat="server" ConnectionString="<%$ ConnectionStrings:ECUserConnection %>"
            UpdateCommand="UPDATE users SET bstreetaddress=@bstreetaddress, bcity=@bcity, bstate=@bstate, bzip=@bzip, sstreetaddress=@sstreetaddress, scity=@scity, sstate=@sstate, szip=@szip, cname=@cname, cnumber=@cnumber, ctype=@ctype, cexpiration=@cexpiration, ccode=@ccode WHERE username=@username">
    </asp:SqlDataSource>
        
    <asp:SqlDataSource ID="SqlDataSourceForSetDone" runat="server" ConnectionString="<%$ ConnectionStrings:ECUserConnection %>"
            UpdateCommand="UPDATE orders SET status = 'done' WHERE status = 'cart'">
    </asp:SqlDataSource>

</asp:Content>

