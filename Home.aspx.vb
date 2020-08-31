Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Partial Class Home
    Inherits System.Web.UI.Page



    Private Sub Home_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim Constr As String = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ConnectionString
        Dim conn As New SqlConnection(Constr)
        Using cmd As New SqlCommand("Select  * From [Car], [Body Style],Make,Model,Image WHERE [Car].Style_Id=[Body Style].Style_Id AND [Car].Image_Id=Image.Image_Id AND Car.Make_Id= Make.Make_Id AND Car.Model_Id=Model.Model_Id   ", conn)

            Using sda As New SqlDataAdapter()
                cmd.Connection = conn
                sda.SelectCommand = cmd
                Using dt As New DataTable()
                    sda.Fill(dt)
                    Repeater1.DataSource = dt
                    Repeater1.DataBind()

                End Using

            End Using

        End Using
    End Sub

End Class
