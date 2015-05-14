Imports System.Data
Imports System.Data.SqlClient
Partial Class orderhistory
    Inherits System.Web.UI.Page
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Me.Load
        'The following code was added by Lenny Evans
        Dim intNumberOfOrders As Integer

        If Session("User") = "" Then
            'Session("User") = "captaincaveman"
            Response.Redirect("http://localhost/secure/login.aspx")
        Else
            'Session("User") = "captaincaveman"

            'show billing shipping address
            Dim MyConnectionGetBillShip As New SqlConnection(SqlDataSourceGetBillShip.ConnectionString)
            Dim MyCommandGetBillShip As New SqlCommand(SqlDataSourceGetBillShip.SelectCommand)
            MyCommandGetBillShip.Parameters.AddWithValue("@username", Session("User").ToString)
            MyCommandGetBillShip.Connection = MyConnectionGetBillShip

            Dim MyReaderBillShip As SqlClient.SqlDataReader
            MyConnectionGetBillShip.Open()
            MyReaderBillShip = MyCommandGetBillShip.ExecuteReader(CommandBehavior.CloseConnection)

            If Not IsPostBack Then
                RepeaterBillShip.DataSource = MyReaderBillShip
                RepeaterBillShip.DataBind()
            End If
            MyReaderBillShip.Close()

            'cart stuff
            Dim MyConnectionShowCart As New SqlConnection(SqlDataSourceShowCart.ConnectionString)
            Dim MyCommandForCart As New SqlCommand(SqlDataSourceShowCart.SelectCommand)
            MyCommandForCart.Parameters.AddWithValue("@username", Session("User").ToString)
            MyCommandForCart.Connection = MyConnectionShowCart

            Dim MyReaderForCart As SqlClient.SqlDataReader
            MyConnectionShowCart.Open()
            MyReaderForCart = MyCommandForCart.ExecuteReader(CommandBehavior.CloseConnection)

            If Not IsPostBack Then
                RepeaterForOrders.DataSource = MyReaderForCart
                RepeaterForOrders.DataBind()
            End If
            MyReaderForCart.Close()

            'count orders, display msg if none
            Dim MyConnectionCountOrders As New SqlConnection(SqlDataSourceCountOrders.ConnectionString)
            Dim MyCommandCountOrders As New SqlCommand(SqlDataSourceCountOrders.SelectCommand)

            MyCommandCountOrders.Parameters.AddWithValue("@username", Session("User").ToString)
            MyCommandCountOrders.Connection = MyConnectionCountOrders
            MyConnectionCountOrders.Open()

            intNumberOfOrders = MyCommandCountOrders.ExecuteScalar()

            If intNumberOfOrders = 0 Then
                RepeaterForOrders.Visible = False
                lblNoOrdersMsg.Visible = True
                lblNoOrdersMsg.Text = "You haven't yet placed any orders with us."
            End If
            MyConnectionCountOrders.Close()

            End If

    End Sub
End Class
