Imports System.Data
Imports System.Data.SqlClient
Partial Class _private_login
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        Dim User As String = ""
        Dim Pass As String = ""
        Dim sql As New SqlCommand(SqlDataSource1.SelectCommand)
        Dim sqlConnect As New SqlConnection(SqlDataSource1.ConnectionString)
        Dim sqlRead As SqlDataReader
        sql.Connection = sqlConnect
        sql.Parameters.AddWithValue("@password", txtPass.Text)
        sql.Parameters.AddWithValue("@email", txtUser.Text)
        sqlConnect.Open()
        sqlRead = sql.ExecuteReader(CommandBehavior.CloseConnection)
        While sqlRead.Read()
            Pass = sqlRead.GetString(1).Trim
            User = sqlRead.GetString(2).Trim
        End While
        sqlConnect.Close()

        If txtPass.Text.Trim <> Pass Then
            lblResult.Text = "Username or password is incorrect. Please re-enter your login information. If you are a new user, please click the Register button below to create an account."
        Else
            Session("User") = txtUser.Text
            Response.Redirect("LoggedIn.Aspx")
        End If

    End Sub

    Protected Sub btnRegister_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRegister.Click
        Response.Redirect("Register.Aspx")
    End Sub
End Class
