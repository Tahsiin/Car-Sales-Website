
Partial Class Contact
    Inherits System.Web.UI.Page

    Private Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click

        If Session("Type") = "user1" Then
            Label1.Text = "Message sent"
            Label1.ForeColor = Drawing.Color.Green
        Else
            Label1.Text = "Please login first to sent feedback"
            Label1.ForeColor = Drawing.Color.Red
        End If





    End Sub
End Class
