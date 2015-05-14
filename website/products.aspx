<%@ Page Language="VB" debug="true" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="products.aspx.vb" Inherits="products" title="Great Green T-Shirt Company | Products" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            font-weight: normal;
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
            text-align: left;
        }
        
    </style>

</asp:Content>

<%--ACTUAL PAGE CONTENT--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <table width="100%">
        <tr>
            <td>
                <span class="style3">
                <span class="style8">
                Products
                <br />
                <br />
                </span>Below you can find our selection of T-Shirts. Remember that every single T-Shirt 
                purchased can give a family 5 years of clean drinking water! Each T-Shirt 
                is available in S, M, L, XL and XXL.
                </span>
            </td>
        </tr>
    </table>
    <br />
    <br />

    <table width="100%" >
    <asp:Repeater ID="Repeater1" OnItemCommand="R1_ItemCommand" runat="server">
    
<%--HEADER TEMPATE--%>
        <HeaderTemplate>
             <tr>
                <td width="20%" class="style5" valign="middle">Product Image</td>
                <td width="30%"class="style5" valign="middle">Description</td>
                <td width="10%"class="style5" valign="middle">Price</td>
                <td width="14%"class="style5" valign="middle">Size</td>
                <td width="10%"class="style5" valign="middle">Quantity</td>
                <td width="15%"class="style5" valign="middle">&nbsp;</td>
                <td width="1%">
                    <br />           
                    <br />
                </td>
             </tr>
        </HeaderTemplate>
        
<%--ALTERNATING TEMPLATE--%>

        
<%--ITEM TEMPLATE--%>        
        <ItemTemplate>
             <tr>
                <td width="20%" class="even"> 
                <img src="<%# DataBinder.Eval(Container.DataItem, "image") %>" alt="" style="width: 132px; height: 128px" class="border2"/> 
                </td>
                <td class="even">
                    <span class="style3"><%#DataBinder.Eval(Container.DataItem, "description")%></span>
                </td>
                <td class="even">
                    <span class="style3">$30.00</span>
                </td>
                
                <td class="even">
                    <asp:DropDownList ID="ddlSize" runat="server">
                        <asp:ListItem>Small</asp:ListItem>
                        <asp:ListItem>Medium</asp:ListItem>
                        <asp:ListItem>Large</asp:ListItem>
                        <asp:ListItem>X-Large</asp:ListItem>
                        <asp:ListItem>XX-Large</asp:ListItem>
                    </asp:DropDownList>
                </td>
                
                
                <td class="even">
                    <asp:TextBox ID="txtQty" width="40" runat="server"></asp:TextBox>
                </td>
                <td class="even">
                    <asp:Button ID="Button2" CommandName="AddToCart" CommandArgument=<%# DataBinder.Eval(Container.DataItem, "productid")%> runat="server" Text="Add to Cart" />
                </td>
             </tr>
        </ItemTemplate>

    </asp:Repeater>
    </table>
    <br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ECUserConnection %>"
            SelectCommand="SELECT productid,image,description,price FROM products">
    </asp:SqlDataSource>
    
    <asp:SqlDataSource ID="SqlDataSourceForCountingOrders" runat="server" ConnectionString="<%$ ConnectionStrings:ECUserConnection %>"
            SelectCommand="SELECT COUNT(*) AS 'totalrows' FROM orders">
    </asp:SqlDataSource>
    <%-- SELECT MAX(orderid) FROM orders WHERE username = @username --%>
    <%-- SELECT COUNT(*) AS 'totalrows' FROM orders  --%>
    <%-- SELECT username FROM orders WHERE orderid = (SELECT MAX(orderid) FROM orders) --%>
    
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ECUserConnection %>"
            InsertCommand="INSERT INTO orders (orderid,username,productid,size,qty,status) VALUES (@orderid,@username,@productid,@size,@qty,@status);">
    </asp:SqlDataSource>

</asp:Content>

