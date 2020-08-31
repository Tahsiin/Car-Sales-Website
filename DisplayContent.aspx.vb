
Partial Class DisplayContent
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Repeater1.DataSource = Session("Display")
        Repeater1.DataBind()






    End Sub




End Class
