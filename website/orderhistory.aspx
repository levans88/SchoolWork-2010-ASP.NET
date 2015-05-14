<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="orderhistory.aspx.vb" Inherits="orderhistory" title="Great Green T-Shirt Company | Order History"%>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            font-weight: normal;
        }
        .style4
        {
            font-size: medium;
        }
        .style5
        {
            color : white;
            background-color: black;
            font-style: italic;
        }
        .odd
        {
            background-color:DarkGray;
        }
        .even
        {
            background-color:Silver;
        }
                .style8
        {
            font-size: large;
            color: #006600;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">   
    <p class="style8">Order History</p>
    <p>This page shows your current billing/shipping information, and all the purchases you have made with us.  Thank you for your support!</p>
    
    <asp:Label ID="lblNoOrdersMsg" visible="False" runat="server" 
        Font-Bold="False" Font-Italic="True" Font-Names="Tahoma" Font-Size="Small">
    </asp:Label>

    <table width="51%" align="center">
        <asp:Repeater ID="RepeaterBillShip" runat="server">
            <HeaderTemplate>
                <tr>
                    <td class="style5" valign="middle">&nbsp</td>
                    <td class="style5" valign="middle">Street Address</td>
                    <td class="style5" valign="middle">City</td>
                    <td class="style5" valign="middle">State</td>
                    <td class="style5" valign="middle">Zip</td>
                    <td valign="middle"><br /><br /></td>
                </tr>

            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>Billing</td>
                    <td><%#DataBinder.Eval(Container.DataItem, "bstreetaddress")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "bcity")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "bstate")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "bzip")%></td>
                    <td></td>
                    <br />
                </tr>
                <tr>
                    <td>Shipping</td>
                    <td><%#DataBinder.Eval(Container.DataItem, "sstreetaddress")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "scity")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "sstate")%></td>
                    <td><%#DataBinder.Eval(Container.DataItem, "szip")%></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <br />
    
    <table width="51%" align="center">
    <asp:Repeater ID="RepeaterForOrders" runat="server">

        <HeaderTemplate>
             <tr>
                <td width="20%" class="style5" valign="middle">Product Image</td>
                <td width="10%"class="style5" valign="middle">Size</td>
                <td width="10%"class="style5" valign="middle">Quantity</td>
                <td width="10%"class="style5" valign="middle">Price</td>
                <td width="10%"class="style5" valign="middle">Total</td>
<%--                <td width="49%"class="style5" valign="middle">&nbsp;</td>--%>
                <td width="1%">
                    <br />           
                    <br />
                </td>
             </tr>
        </HeaderTemplate>
    
        <ItemTemplate>
            
            <tr>
            <%--<td>
                    <%#DataBinder.Eval(Container.DataItem, "orderid")%>
                </td>--%>
                <td class="even">
                    <img src="<%# DataBinder.Eval(Container.DataItem, "image") %>" alt="" style="width: 33px; height: 32px" class="border2"/>
                </td>
                <td class="even">
                    <%#DataBinder.Eval(Container.DataItem, "size")%>
                </td>
                <td class="even">
                    <%#DataBinder.Eval(Container.DataItem, "qty")%>
                </td>
                <td class="even">
                    <%#FormatCurrency(DataBinder.Eval(Container.DataItem, "price"))%>
                </td>
                <td class="even">
                    <%#FormatCurrency(DataBinder.Eval(Container.DataItem, "price") * DataBinder.Eval(Container.DataItem, "qty"))%>
                </td>

            </tr>

        </ItemTemplate>
    </asp:Repeater>
    </table>

    <br />
        
    <asp:SqlDataSource ID="SqlDataSourceShowCart" runat="server" ConnectionString="<%$ ConnectionStrings:ECUserConnection %>"
        SelectCommand="SELECT username,orderid,orders.productid,qty,size,status,products.productid,image,price FROM orders LEFT JOIN products ON orders.productid=products.productid WHERE username = @username AND status = 'done'">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSourceCountOrders" runat="server" ConnectionString="<%$ ConnectionStrings:ECUserConnection %>"
        SelectCommand="SELECT COUNT(*) FROM orders WHERE status='done' AND username = @username">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSourceGetBillShip" runat="server" ConnectionString="<%$ ConnectionStrings:ECUserConnection %>"
            SelectCommand="SELECT bstreetaddress,bcity,bstate,bzip,sstreetaddress,scity,sstate,szip FROM users WHERE username=@username">
    </asp:SqlDataSource>

<%--"SELECT items.name, items.id FROM items INNER JOIN users_items ON items.id = users_items.id WHERE 
(users_items.user_id = @userId) ORDER BY users_items.date DESC"--%>

<%--SelectCommand="SELECT username,orderid,productid,qty,status FROM orders WHERE username = "<%# Session("User") %>" AND status = "cart"'>--%>


</asp:Content>