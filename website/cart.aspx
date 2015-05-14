<%@ Page Language="VB" debug="true" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="cart.aspx.vb" Inherits="cart" title="Great Green T-Shirt Company | View Cart" %>

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
    
<%--    <asp:Button ID="btnTest" runat="server" Text="Button" />--%>
<%--    <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>--%>
    <p class="style8">Shopping Cart</p>
    <p>This page shows the items currently in your shopping cart.  Press "Remove" to remove an item from the cart, or "Check Out" to proceed.</p>
    <br />
    <asp:Label ID="lblCartIsEmptyMsg" visible="False" runat="server" 
        Font-Bold="False" Font-Italic="True" Font-Names="Tahoma" Font-Size="Small"></asp:Label>

    <table width="71%" align="center">
    <asp:Repeater ID="RepeaterForCart" OnItemCommand="RepeaterForCart_ItemCommand" runat="server">
        
        <HeaderTemplate>
             <tr>
                <td width="20%" class="style5" valign="middle">Product Image</td>
                <td width="10%"class="style5" valign="middle">Size</td>
                <td width="10%"class="style5" valign="middle">Quantity</td>
                <td width="10%"class="style5" valign="middle">Price</td>
                <td width="10%"class="style5" valign="middle">Total</td>
                <td width="20%"class="style5" valign="middle">&nbsp;</td>
<%--                <td width="49%"class="style5" valign="middle">&nbsp;</td>--%>
                <td width="1%">
                    <br />           
                    <br />
                </td>
             </tr>
        </HeaderTemplate>
        
        <ItemTemplate>
            <%--<table>--%>
            <tr>
            <%--<td>
                    <asp:Label ID="Label1" runat="server" Text=<%#DataBinder.Eval(Container.DataItem, "orderid")%>></asp:Label>
                </td>--%>
                <td class="even">
                    <img src="<%# DataBinder.Eval(Container.DataItem, "image") %>" alt="" style="width: 33px; height: 32px" class="border2"/> 
                    <%--<%#DataBinder.Eval(Container.DataItem, "productid")%>--%>
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
                <td class="even">
                    <asp:Button ID="ButtonRemove" CommandName="RemoveFromCart" CommandArgument=<%# DataBinder.Eval(Container.DataItem, "orderid")%> runat="server" Text="Remove" />
                </td>
            </tr>
            <%--</table>--%>
        </ItemTemplate>
    </asp:Repeater>
    </table>
    
    <br />
    
    <asp:Button ID="btnContinueShopping" runat="server" Text="Continue Shopping" 
        Width="183px" />
        &nbsp; &nbsp; &nbsp; &nbsp;
    <asp:Button ID="btnCheckOut" runat="server" Text="Begin Check-Out Process" 
        Width="180px" />
    
    <br />
    <br />    
    
    <asp:SqlDataSource ID="SqlDataSourceShowCart" runat="server" ConnectionString="<%$ ConnectionStrings:ECUserConnection %>"
        SelectCommand="SELECT username,orderid,orders.productid,size,qty,status,products.productid,image,price FROM orders LEFT JOIN products ON orders.productid=products.productid WHERE username = @username AND status = 'cart'">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSourceForRemove" runat="server" ConnectionString="<%$ ConnectionStrings:ECUserConnection %>"
            DeleteCommand="DELETE FROM orders WHERE orderid = @orderid">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSourceCountCart" runat="server" ConnectionString="<%$ ConnectionStrings:ECUserConnection %>"
            SelectCommand="SELECT COUNT(*) FROM orders WHERE status='cart' and username=@username">
    </asp:SqlDataSource>

<%--"SELECT items.name, items.id FROM items INNER JOIN users_items ON items.id = users_items.id WHERE 
(users_items.user_id = @userId) ORDER BY users_items.date DESC"--%>

<%--SelectCommand="SELECT username,orderid,productid,qty,status FROM orders WHERE username = "<%# Session("User") %>" AND status = "cart"'>--%>


</asp:Content>