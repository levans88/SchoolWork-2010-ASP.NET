Imports System
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient

Partial Class Register
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    ' The following code was added by TeamMember
    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Dim sqlCommand As New SqlCommand(SqlDataSource1.SelectCommand)
        Dim sqlConnection As New SqlConnection(SqlDataSource1.ConnectionString)
        sqlCommand.Connection = sqlConnection
        Dim sqlReader As SqlDataReader

        Session("User") = txtUsername.Text
        Session("Email") = txtEmail.Text
        Session("Password") = txtPassword.Text
        Session("Fname") = txtFname.Text
        Session("Lname") = txtLname.Text


        Dim Email = Session("Email")
        sqlCommand.Connection = sqlConnection
        Dim Query As String
        Query = "INSERT INTO users (username, password, fname, lname, email) VALUES (@username, @password, @fname, @lname, @email)"
        sqlCommand.CommandText = Query
        sqlCommand.Parameters.AddWithValue("@fName", txtFname.Text)
        sqlCommand.Parameters.AddWithValue("@lName", txtLname.Text)
        sqlCommand.Parameters.AddWithValue("@email", txtEmail.Text)
        sqlCommand.Parameters.AddWithValue("@password", txtPassword.Text)
        sqlCommand.Parameters.AddWithValue("@username", txtUsername.Text)
        GetAndDisplayRecords(sqlCommand)
        Response.Redirect("RegisterOK.Aspx")

    End Sub
    'The following code was added by Bhavini Nayee
    Sub GetAndDisplayRecords(ByVal sqlComm As SqlCommand)
        Dim sqlReader As SqlDataReader
        Dim sqlConnection As New SqlConnection(SqlDataSource1.ConnectionString)
        sqlComm.Connection = sqlConnection
        sqlConnection.Open()
        sqlReader = sqlComm.ExecuteReader(CommandBehavior.CloseConnection)
        sqlReader.Close()
    End Sub



End Class
