Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class SignUp
    Inherits System.Web.UI.Page




    'When Requesting forAdmin Permission 

    Protected Sub Clear_Click(sender As Object, e As EventArgs) Handles Clear.Click
        txtboxName.Text = ""
        txtboxSurname.Text = ""
        txtboxAge.Text = ""
        txtboxAddress.Text = ""
        txtboxContact.Text = ""
        txtboxEmail.Text = ""
        txtboxPass.Text = ""
        txtboxConPass.Text = ""

    End Sub
    Protected Sub BtnSubmit_Click(sender As Object, e As EventArgs) Handles BtnSubmit.Click

        Dim connect As New SqlConnection()

        connect.ConnectionString() = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ToString()
        connect.Open()

        Dim check As String = "Select * From [User] WHERE [Email Address]=@Email"

        Dim cmmd As New SqlCommand(check, connect)

        cmmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = txtboxEmail.Text

        Dim reader As SqlDataReader

        reader = cmmd.ExecuteReader()

        reader.Read()

        If reader.HasRows() = True Then

            Label1.Text = "Email exist"
            Exit Sub
        Else
            reader.Close()
            Dim sql As String = "insert into [dbo].[User] " &
                 " (Name , Surname , Age , Type , Address , Contact , [Email Address] , Password , [Confirm Password]) " & "Values ( '" + txtboxName.Text + "', '" + txtboxSurname.Text + "' , " + txtboxAge.Text + ", 'user1' , '" + txtboxAddress.Text + "' , " + txtboxContact.Text + " , '" + txtboxEmail.Text + "','" + txtboxPass.Text + "','" + txtboxConPass.Text + "')"



            Dim cmd As New SqlCommand(sql, connect)

            cmd.ExecuteNonQuery()
            If (Not connect Is Nothing) Then
                connect.Close()
            End If




            LabelSubmit.Text = "Submit Sucessfull"
            LabelSubmit.ForeColor = Drawing.Color.Green



            Response.Redirect("~/LogIn.aspx")

        End If
    End Sub



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        If Not Session("User_account") Is Nothing Then

            Response.Redirect("~/Home.aspx")
        End If
    End Sub

End Class
