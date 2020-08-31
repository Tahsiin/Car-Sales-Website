Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Partial Class Add_admin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Label1.Text = "Number of applications: " + Application("TotalApplications").ToString
        Label2.Text = "Number of User Online: " + Application("TotalUserSessions").ToString


        If Not Me.IsPostBack Then
            Me.BindRepeater()
        End If
    End Sub
    Private Sub BindRepeater()
        Dim Constr As String = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ConnectionString
        Dim conn As New SqlConnection(Constr)
        Using cmd As New SqlCommand("Procedure_Add_Admin")
            cmd.Parameters.AddWithValue("@Action", "Select")
            Using sda As New SqlDataAdapter()
                cmd.CommandType = CommandType.StoredProcedure
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
        item.FindControl("lnkDelete").Visible = Not isEdit

        'Toggle Labels.
        item.FindControl("lblName").Visible = Not isEdit
        item.FindControl("lblSurname").Visible = Not isEdit
        item.FindControl("lblAge").Visible = Not isEdit
        item.FindControl("lblType").Visible = Not isEdit
        item.FindControl("lblAddress").Visible = Not isEdit
        item.FindControl("lblContact").Visible = Not isEdit
        item.FindControl("lblEmail").Visible = Not isEdit

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

        Me.ToggleElements(item, True)
    End Sub


    'Update 
    Protected Sub OnUpdate(sender As Object, e As EventArgs)
        'Find the reference of the Repeater Item.
        Dim item As RepeaterItem = TryCast(TryCast(sender, Button).Parent, RepeaterItem)

        '  Dim Id As Integer = Integer.Parse(TryCast(item.FindControl("lblUserId"), Label).Text)
        'Dim Password As Integer = TryCast(item.FindControl("lblPassword"), Label).Text
        'Dim cPassword As Integer = TryCast(item.FindControl("lblConPass"), Label).Text

        Dim Name As String = txtboxName.Text
        Dim Surname As String = txtboxSurname.Text
        Dim Age As String = txtboxAge.Text 
        Dim Type As String = DrpType.Text
        Dim Address As String = txtboxAddress.Text
        Dim Contact As String = txtboxContact.Text
        Dim Email As String = txtboxEmail.Text


        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("Procedure_Add_Admin")
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@Action", "UPDATE")
                cmd.Parameters.AddWithValue("@UserId", Id)
                cmd.Parameters.AddWithValue("@Name", Name)
                cmd.Parameters.AddWithValue("@Surname", Surname)
                cmd.Parameters.AddWithValue("@Age", Age)
                cmd.Parameters.AddWithValue("@Type", Type)
                cmd.Parameters.AddWithValue("@Address", Address)
                cmd.Parameters.AddWithValue("@Contact", Contact)
                cmd.Parameters.AddWithValue("@Email", Email)
                'cmd.Parameters.AddWithValue("@Password", Password)
                'cmd.Parameters.AddWithValue("@ConPassword", cPassword)




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

    'Delete
    Protected Sub OnDelete(sender As Object, e As EventArgs)

        Dim item As RepeaterItem = TryCast(TryCast(sender, LinkButton).Parent, RepeaterItem)
        Dim UserId As Integer = Integer.Parse(TryCast(item.FindControl("lblUserId"), Label).Text)

        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("Procedure_Add_Admin")
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@Action", "DELETE")
                cmd.Parameters.AddWithValue("@UserId", UserId)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using
        Me.BindRepeater()
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

    Protected Sub BtnSearch_Click(sender As Object, e As EventArgs) Handles BtnSearch.Click
        'Search

        Dim conn As New SqlConnection()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ToString()
        conn.Open()
        Dim Sql As String = " Select  * From [User] WHERE ([Name]=@DSearch OR [Surname]=@DSearch or [Email Address]=@DSearch or [Type]=@DSearch) "

        Dim cmmd As New SqlCommand(Sql, conn)




        cmmd.Parameters.AddWithValue("@DSearch", txtSearch.Text)
        cmmd.CommandText = Sql
        cmmd.ExecuteNonQuery()


        Dim sda As New SqlDataAdapter()

        sda.SelectCommand = cmmd
        Dim ds As New DataSet
        sda.Fill(ds)
        Repeater1.DataSource = ds
        Repeater1.DataBind()


        conn.Close()

    End Sub

    Private Sub BtnSubmit_Click(sender As Object, e As EventArgs) Handles BtnSubmit.Click

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
End Class
