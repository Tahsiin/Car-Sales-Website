Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Partial Class MasterPageAdmin
    Inherits System.Web.UI.MasterPage




    Private Sub MasterPage_Load(sender As Object, e As EventArgs) Handles Me.Load


        If Not Session("EmailAdd") Is Nothing Then
            anonymous.Visible = False
            customer.Visible = True

            lblWelcome.Text = "Welcome Admin  " + Session("EmailAdd")
        ElseIf Session("EmailAdd") Is Nothing Then
            anonymous.Visible = True
            customer.Visible = False

            lblWelcome.Text = ""

        End If
    End Sub
    Protected Sub LinkLogout_Click(sender As Object, e As EventArgs) Handles LinkLogout.Click
        Session.RemoveAll()
        Response.Redirect("~/LogIn.aspx")
    End Sub
End Class

