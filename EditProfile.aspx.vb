Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Partial Class EditProfile
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Me.IsPostBack Then
            Me.BindRepeater()
        End If
    End Sub
    Private Sub BindRepeater()
        Dim Constr As String = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ConnectionString
        Dim conn As New SqlConnection(Constr)
        Using cmd As New SqlCommand("Select * From [User] Where [Email Address]=@mail")
            cmd.Parameters.AddWithValue("@mail", Session("EmailAdd"))
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

    'Insert
    Protected Sub Insert(sender As Object, e As EventArgs)



        Dim Name As String = txtboxName.Text
        Dim Surname As String = txtboxSurname.Text
        Dim Age As String = txtboxAge.Text
        Dim Type As String = DrpType.Text
        Dim Address As String = txtboxAddress.Text
        Dim Contact As String = txtboxContact.Text
        Dim Email As String = txtboxEmail.Text
        Dim Password As String = txtboxPass.Text
        Dim ConfirmPassword As String = txtboxConPass.Text




        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ConnectionString
        Using conn As New SqlConnection(constr)
            Using cmd As New SqlCommand("Procedure_Add_Admin")
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@Action", "INSERT")
                cmd.Parameters.AddWithValue("@Name", Name)
                cmd.Parameters.AddWithValue("@Surname", Surname)
                cmd.Parameters.AddWithValue("@Age", Age)
                cmd.Parameters.AddWithValue("@Type", Type)
                cmd.Parameters.AddWithValue("@Address", Address)
                cmd.Parameters.AddWithValue("@Email", Email)
                cmd.Parameters.AddWithValue("@Contact", Contact)
                cmd.Parameters.AddWithValue("@Password", Password)
                cmd.Parameters.AddWithValue("@ConPassword", ConfirmPassword)

                cmd.Connection = conn
                conn.Open()
                cmd.ExecuteNonQuery()
                conn.Close()
            End Using
        End Using



        Me.BindRepeater()



    End Sub

    'Editing and Updating

    Private Sub ToggleElements(item As RepeaterItem, isEdit As Boolean)
        'Toggle Buttons.

        lnkUpdate.Visible = True
        item.FindControl("lnkEdit").Visible = Not isEdit
        item.FindControl("lnkCancel").Visible = isEdit

        'Toggle Labels.
        item.FindControl("lblName").Visible = Not isEdit
        item.FindControl("lblSurname").Visible = Not isEdit
        item.FindControl("lblAge").Visible = Not isEdit
        item.FindControl("lblType").Visible = Not isEdit
        item.FindControl("lblAddress").Visible = Not isEdit
        item.FindControl("lblContact").Visible = Not isEdit
        item.FindControl("lblEmail").Visible = Not isEdit
        item.FindControl("lblPassword").Visible = Not isEdit


    End Sub
    Protected Sub OnEdit(sender As Object, e As EventArgs)
        'Find the reference of the Repeater Item.
        Dim item As RepeaterItem = TryCast(TryCast(sender, LinkButton).Parent, RepeaterItem)


        txtboxName.Text = TryCast(item.FindControl("lblName"), Label).Text
        txtboxSurname.Text = TryCast(item.FindControl("lblSurname"), Label).Text
        txtboxAge.Text = TryCast(item.FindControl("lblAge"), Label).Text
        DrpType.Text = TryCast(item.FindControl("lblType"), Label).Text
        txtboxAddress.Text = TryCast(item.FindControl("lblAddress"), Label).Text
        txtboxContact.Text = TryCast(item.FindControl("lblContact"), Label).Text
        txtboxEmail.Text = TryCast(item.FindControl("lblEmail"), Label).Text
        txtboxPass.Text = TryCast(item.FindControl("lblPassword"), Label).Text

        Me.ToggleElements(item, True)
    End Sub


    'Update 
    Protected Sub OnUpdate(sender As Object, e As EventArgs)
        'Find the reference of the Repeater Item.
        Dim item As RepeaterItem = TryCast(TryCast(sender, Button).Parent, RepeaterItem)

        '  Dim Id As Integer = Integer.Parse(TryCast(item.FindControl("lblUserId"), Label).Text)
        Dim Password As String = txtboxPass.Text


        Dim Name As String = txtboxName.Text
        Dim Surname As String = txtboxSurname.Text
        Dim Age As String = txtboxAge.Text
        Dim Type As String = DrpType.Text
        Dim Address As String = txtboxAddress.Text
        Dim Contact As String = txtboxContact.Text
        Dim Email As String = txtboxEmail.Text


        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("   UPDATE [User] SET  Name=@Name, Surname=@Surname, Age=@Age, [Type]=@Type, [Address]=@Address, Contact=@Contact, [Email Address]=@Email, [Password]=@Password WHERE [User_Id] = @UserId")
                '     cmd.Parameters.AddWithValue("@Action", "UPDATE")
                cmd.Parameters.AddWithValue("@UserId", ID)
                cmd.Parameters.AddWithValue("@Name", Name)
                cmd.Parameters.AddWithValue("@Surname", Surname)
                cmd.Parameters.AddWithValue("@Age", Age)
                cmd.Parameters.AddWithValue("@Type", Type)
                cmd.Parameters.AddWithValue("@Address", Address)
                cmd.Parameters.AddWithValue("@Contact", Contact)
                cmd.Parameters.AddWithValue("@Email", Email)
                cmd.Parameters.AddWithValue("@Password", Password)
                ' cmd.Parameters.AddWithValue("@ConPassword", cPassword)




                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()

            End Using
        End Using
        Me.BindRepeater()
    End Sub







    Protected Sub OnCancel(sender As Object, e As EventArgs)

        Dim item As RepeaterItem = TryCast(TryCast(sender, LinkButton).Parent, RepeaterItem)
        Me.ToggleElements(item, False)
    End Sub


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


    Protected Sub Wizard1_NextButtonClick(sender As Object, e As WizardNavigationEventArgs)
        If Page.IsValid Then
            Try
                Dim connect As New SqlConnection()
                connect.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ToString()

                Dim cmd As New SqlCommand("Select * from [dbo].[User] Where [Email Address] =  @mail  AND [Password]=  @password  ", connect)
                cmd.Parameters.Add("@mail", SqlDbType.NVarChar).Value = Session("EmailAdd")
                cmd.Parameters.Add("@password", SqlDbType.NVarChar).Value = step1password.Text

                connect.Open()

                Dim reader As SqlDataReader

                reader = cmd.ExecuteReader()

                reader.Read()

                If reader.HasRows() = False Then



                    Session("Password") = txtboxcompare.Text

                    Label1.Text = "Password not match"

                Else

                    Label1.Text = "Password match"

                End If
            Catch
                Label1.Text = "Enter Password"
            End Try

        End If
    End Sub
End Class
