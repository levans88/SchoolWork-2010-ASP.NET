<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="map.aspx.vb" Inherits="map" title="Great Green T-Shirt Company | Site Map" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
                .style8
        {
            font-size: x-large;
            color: #006600;
        }
        .style9
        {
            font-family: Arial, Helvetica, sans-serif;
        }
        .style10
        {
            font-size: large;
            color: #006600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!--Page header added by TeamMember-->
<!--Page title added by TeamMember, TeamMember added the site map-->
    <span class="style10"><span class="style9">Site Map</span><br class="style9" /></span>
    <span class="style8"><br /></span><asp:TreeView ID="TreeView1" runat="server" 
        Height="151px" ImageSet="Simple" 
    Width="189px">
    <ParentNodeStyle Font-Bold="False" />
    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" 
        HorizontalPadding="0px" VerticalPadding="0px" />
    <Nodes>
        <asp:TreeNode NavigateUrl="~/Default.aspx" Text="Home" Value="Home">
            <asp:TreeNode NavigateUrl="~/products.aspx" Text="Products" Value="Products">
            </asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/about.aspx" Text="About Us" Value="About Us">
            </asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/cart.aspx" Text="View Cart" Value="View Cart">
            </asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/Register.aspx" Text="Register" Value="Register">
            </asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/login.aspx" Text="Login" Value="Login">
            </asp:TreeNode>
        </asp:TreeNode>
    </Nodes>
    <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" 
        HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
</asp:TreeView>
</asp:Content>

