Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Partial Class LogIn
    Inherits System.Web.UI.Page
    Dim ds As New DataSet
    Protected Sub Button_Click(sender As Object, e As EventArgs) Handles btnLogin.Click



        Dim connect As New SqlConnection()
        connect.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ToString()
        Dim userType As String
        Dim cmd As New SqlCommand("Select Type from [dbo].[User] Where [Email Address] =  @mail  AND [Password]=  @password  ", connect)
        cmd.Parameters.Add("@mail", SqlDbType.NVarChar).Value = txtEmail.Text
        cmd.Parameters.Add("@password", SqlDbType.NVarChar).Value = TxtPassword.Text

        connect.Open()


        userType = cmd.ExecuteScalar()

        Session("Type") = userType

        If userType = "admin" Then

            Session("Password") = TxtPassword.Text

            Session("EmailAdd") = txtEmail.Text

            Response.Redirect("~/Upload_Car.aspx")

        ElseIf userType = "user1" Then
            Session("EmailAdd") = txtEmail.Text

            Response.Redirect("~/Home.aspx")

        ElseIf userType = "Block" Then

            lblError.Text = "User has been Block By Admin"

        Else
            lblError.Text = "Email/Password not matched"

        End If

    End Sub

    Private Sub LogIn_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("Type") = "user1" Then

            Response.Redirect("~/Home.aspx")

        End If
    End Sub
End Class
