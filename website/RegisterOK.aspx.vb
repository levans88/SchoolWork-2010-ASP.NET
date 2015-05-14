
Partial Class RegisterOK
    Inherits System.Web.UI.Page
    ' The following code was added by TeamMember
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") <> "" Then
            lblUser.Text = Session("user").ToString()
        End If
    End Sub
End Class
