Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient

Public Class Cart
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("Type") = "user1" Then
            PanelWarning.Visible = False
            CartItems.Visible = True

            GridView1.DataSource = DirectCast(Session("ItemCart"), DataSet)
            GridView1.DataBind()
        End If

    End Sub


    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click

        Session.Remove("ItemCart")
            GridView1.DataBind()
        Button1.Visible = False
        PnlEmpty.Visible = True
    End Sub
End Class

