
Partial Class loggedout
    Inherits System.Web.UI.Page
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("User") = ""
    End Sub

End Class
