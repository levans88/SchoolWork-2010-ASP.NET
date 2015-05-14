'The following code was entered by Lenny Evans 

Imports System.Data
Imports System.Data.SqlClient
Partial Class cart
    Inherits System.Web.UI.Page
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim intNumberOfCartItems As Integer

        If Session("User") = "" Then
            'Session("User") = "captaincaveman"
            Response.Redirect("http://localhost/login.aspx")

        Else
            'Session("User") = "captaincaveman"
            Dim MyConnectionShowCart As New SqlConnection(SqlDataSourceShowCart.ConnectionString)
            Dim MyCommandForCart As New SqlCommand(SqlDataSourceShowCart.SelectCommand)

            MyCommandForCart.Parameters.AddWithValue("@username", Session("User").ToString)

            MyCommandForCart.Connection = MyConnectionShowCart
            Dim MyReaderForCart As SqlClient.SqlDataReader
            MyConnectionShowCart.Open()
            MyReaderForCart = MyCommandForCart.ExecuteReader(CommandBehavior.CloseConnection)

            If Not IsPostBack Then
                RepeaterForCart.DataSource = MyReaderForCart
                RepeaterForCart.DataBind()

            End If

            MyReaderForCart.Close()


        End If

        Dim MyConnectionCountCart As New SqlConnection(SqlDataSourceCountCart.ConnectionString)
        Dim MyCommandCountCart As New SqlCommand(SqlDataSourceCountCart.SelectCommand)

        MyCommandCountCart.Parameters.AddWithValue("@username", Session("User").ToString)
        MyCommandCountCart.Connection = MyConnectionCountCart
        MyConnectionCountCart.Open()

        intNumberOfCartItems = MyCommandCountCart.ExecuteScalar()

        If intNumberOfCartItems = 0 Then
            RepeaterForCart.Visible = False
            lblCartIsEmptyMsg.Visible = True
            lblCartIsEmptyMsg.Text = "There are currently no items in your shopping cart."
        End If

        MyConnectionCountCart.Close()

    End Sub

    ' The following code was entered by TeamMember

    Sub RepeaterForCart_ItemCommand(ByVal source As Object, ByVal e As RepeaterCommandEventArgs) 'Handles RepeaterForCart.ItemCommand

        Dim MyConnectionForRemove As New SqlConnection(SqlDataSourceForRemove.ConnectionString)
        Dim MyCommandForRemove As New SqlCommand(SqlDataSourceForRemove.DeleteCommand)

        MyCommandForRemove.Connection = MyConnectionForRemove

        MyConnectionForRemove.Open()

        'a = (e.CommandArgument.ToString - 1)
        'objRepeaterTextBox = CType(Repeater1.Items(a).FindControl("Label1"), TextBox)
        'strQty = objRepeaterTextBox.text()

        MyCommandForRemove.Parameters.AddWithValue("@orderid", e.CommandArgument.ToString)
        MyCommandForRemove.ExecuteNonQuery()
        'Parameters.AddWithValue("@orderid", 96)

        MyConnectionForRemove.Close()
        'lblTest.Text = "test"
        Response.Redirect("http://localhost/cart.aspx")

    End Sub

    Protected Sub btnCheckOut_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCheckOut.Click
        Response.Redirect("http://localhost/shipbillinfo.aspx")

    End Sub

    Protected Sub btnContinueShopping_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinueShopping.Click
        Response.Redirect("http://localhost/products.aspx")
    End Sub
End Class
