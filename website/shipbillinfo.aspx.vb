Imports System.Data
Imports System.Data.SqlClient
Partial Class shipbillinfo
    Inherits System.Web.UI.Page
    ' The following code was added by Lenny Evans
    Protected Sub btnCheckout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCheckout.Click
        If Session("User") = "" Then
            'Session("User") = "captaincaveman"
            Response.Redirect("http://localhost/login.aspx")

        Else

            'Session("User") = "captaincaveman"

            Dim MyConnectionUpdateBillShip As New SqlConnection(SqlDataSourceUpdateBillShip.ConnectionString)
            Dim MyCommandUpdateBillShip As New SqlCommand(SqlDataSourceUpdateBillShip.UpdateCommand)
            MyCommandUpdateBillShip.Connection = MyConnectionUpdateBillShip
            MyConnectionUpdateBillShip.Open()

            MyCommandUpdateBillShip.Parameters.AddWithValue("@username", Session("User").ToString)
            MyCommandUpdateBillShip.Parameters.AddWithValue("@bstreetaddress", txtBStreet.Text.ToString)
            MyCommandUpdateBillShip.Parameters.AddWithValue("@bcity", txtBCity.Text.ToString)
            MyCommandUpdateBillShip.Parameters.AddWithValue("@bstate", txtBState.Text.ToString)
            MyCommandUpdateBillShip.Parameters.AddWithValue("@bzip", txtBZip.Text.ToString)
            MyCommandUpdateBillShip.Parameters.AddWithValue("@sstreetaddress", txtSStreet.Text.ToString)
            MyCommandUpdateBillShip.Parameters.AddWithValue("@scity", txtSCity.Text.ToString)
            MyCommandUpdateBillShip.Parameters.AddWithValue("@sstate", txtSState.Text.ToString)
            MyCommandUpdateBillShip.Parameters.AddWithValue("@szip", txtSZip.Text.ToString)
            'and card info
            MyCommandUpdateBillShip.Parameters.AddWithValue("@cname", txtCardHolderName.Text.ToString)
            MyCommandUpdateBillShip.Parameters.AddWithValue("@cnumber", txtCardNumber.Text.ToString)
            MyCommandUpdateBillShip.Parameters.AddWithValue("@ctype", ddlCardType.Text)
            MyCommandUpdateBillShip.Parameters.AddWithValue("@cexpiration", txtExpirationDate.Text.ToString)
            MyCommandUpdateBillShip.Parameters.AddWithValue("@ccode", txtCode.Text.ToString)

            MyCommandUpdateBillShip.ExecuteNonQuery()
            MyConnectionUpdateBillShip.Close()

            Dim MyConnectionForSetDone As New SqlConnection(SqlDataSourceForSetDone.ConnectionString)
            Dim MyCommandForSetDone As New SqlCommand(SqlDataSourceForSetDone.UpdateCommand)
            MyCommandForSetDone.Connection = MyConnectionForSetDone
            MyConnectionForSetDone.Open()
            MyCommandForSetDone.ExecuteNonQuery()
            Response.Redirect("http://localhost/orderhistory.aspx")
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class
