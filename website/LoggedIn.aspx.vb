
'TeamMember and Lenny Evans added the code below
Partial Class LoggedIn
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") <> "" Then
            lblUser.Text = Session("user").ToString()
        End If

        If Session("User") = "" Then
            Response.Redirect("secure/login.aspx")
        End If


    End Sub
End Class
