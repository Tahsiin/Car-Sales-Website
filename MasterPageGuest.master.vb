Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage
    Protected Sub BtnSearch_Click(sender As Object, e As EventArgs) Handles BtnSearch.Click
        'Search

        Dim conn As New SqlConnection()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ToString()
        conn.Open()
        Dim Sql As String = " Select  * From [Car], [Body Style],Make,Model,Image WHERE [Car].Style_Id=[Body Style].Style_Id AND [Car].Image_Id=Image.Image_Id AND Car.Make_Id= Make.Make_Id AND Car.Model_Id=Model.Model_Id AND ([Make].[Make] = @DSearch OR [Model].[Model]=@DSearch) "

        Dim cmmd As New SqlCommand(Sql, conn)




        cmmd.Parameters.AddWithValue("@DSearch", txtSearch.Text)
        cmmd.CommandText = Sql
        cmmd.ExecuteNonQuery()


        Dim sda As New SqlDataAdapter()

        sda.SelectCommand = cmmd
        Dim ds As New DataSet
        sda.Fill(ds)
        Session("Display") = ds
        Response.Redirect("~/DisplayContent.aspx")




        conn.Close()

    End Sub


    Private Sub MasterPage_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Session("Type") = "Admin" Then
            Response.Redirect("~/Upload_Car.aspx")

        ElseIf Session("Type") = "user1" Then

            If Not Session("EmailAdd") Is Nothing Then
                anonymous.Visible = False
                customer.Visible = True


                lblWelcome.Text = "Welcome User   " + Session("EmailAdd")

            ElseIf Session("EmailAdd") Is Nothing Then

                anonymous.Visible = True
                customer.Visible = False
                lblWelcome.Text = ""
            End If

        End If


    End Sub
    Protected Sub LinkLogout_Click(sender As Object, e As EventArgs) Handles LinkLogout.Click
        Session.Remove("EmailAdd")
        Session.RemoveAll()
        Response.Redirect("~/LogIn.aspx")

    End Sub
    Protected Sub LinkEdit_Click(sender As Object, e As EventArgs) Handles LinkEdit.Click

        Response.Redirect("~/EditProfile.aspx")


    End Sub
End Class

