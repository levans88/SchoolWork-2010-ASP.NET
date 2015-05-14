Imports System.Data
Imports System.Data.SqlClient
Partial Class products
    Inherits System.Web.UI.Page
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Me.Load
        'The following code was added by TeamMember
        Dim MyConnection As New SqlConnection(SqlDataSource1.ConnectionString)
        Dim MyCommand As New SqlCommand(SqlDataSource1.SelectCommand)
        MyCommand.Connection = MyConnection
        Dim MyReader As SqlClient.SqlDataReader
        MyConnection.Open()
        MyReader = MyCommand.ExecuteReader(CommandBehavior.CloseConnection)

        'get data for repeater
        If Not IsPostBack Then
            Repeater1.DataSource = MyReader
            Repeater1.DataBind()


        End If
        MyReader.Close()



    End Sub
    Sub R1_ItemCommand(ByVal Sender As Object, ByVal e As RepeaterCommandEventArgs)
        'The following code was added by Lenny Evans
        Dim objRepeaterTextBox As Object 'make the repeater text box an object, later we'll make it an actual text box
        Dim objRepeaterDropDownList As Object 'make the repeater drop down list an object
        Dim strQty As String
        Dim strSize As String
        Dim a As Integer 'variable for index position of repeater text box
        Dim b As Integer 'variable for index position of repeater drop down list
        Dim intOrderid As Integer


        If Session("User") = "" Then
            Response.Redirect("login.aspx")
            'Session("User") = "captaincaveman"
        Else
            'Session("User") = "captaincaveman"

            'write some stuff to DB
            Dim MyConnection2 As New SqlConnection(SqlDataSource2.ConnectionString)
            Dim MyCommand2 As New SqlCommand(SqlDataSource2.InsertCommand)

            MyCommand2.Connection = MyConnection2

            MyConnection2.Open()

            'get quantity from appropriate text box within the repeater
            a = (e.CommandArgument.ToString - 1)
            objRepeaterTextBox = CType(Repeater1.Items(a).FindControl("txtQty"), TextBox)
            If objRepeaterTextBox.text = "" Then
                strQty = 1
            Else
                strQty = objRepeaterTextBox.text()
            End If

            'get size from appropriate control within the repeater
            'b = (e.CommandArgument.ToString - 1)
            objRepeaterDropDownList = CType(Repeater1.Items(a).FindControl("ddlSize"), DropDownList)
            'If objRepeaterDropDownList.text = "" Then
            '    strQty = 1
            'Else
            strSize = objRepeaterDropDownList.text()
            'End If


            '-----------------------------------------------------
            'get count of orders before user clicks "Add to Cart"

            Dim MyConnectionForCount As New SqlConnection(SqlDataSourceForCountingOrders.ConnectionString)
            Dim MyCommandForCountingOrders As New SqlCommand(SqlDataSourceForCountingOrders.SelectCommand)
            MyCommandForCountingOrders.Connection = MyConnectionForCount
            MyConnectionForCount.Open()

            intOrderid = MyCommandForCountingOrders.ExecuteScalar()
            MyConnectionForCount.Close()

            MyCommand2.Parameters.AddWithValue("@username", Session("User").ToString)
            MyCommand2.Parameters.AddWithValue("@orderid", intOrderid)
            MyCommand2.Parameters.AddWithValue("@productid", e.CommandArgument.ToString)
            MyCommand2.Parameters.AddWithValue("@size", strSize)
            MyCommand2.Parameters.AddWithValue("@qty", strQty)
            MyCommand2.Parameters.AddWithValue("@status", "cart")

            MyCommand2.ExecuteNonQuery()

            MyConnection2.Close()
            Response.Redirect("cart.aspx")

        End If

    End Sub




End Class
