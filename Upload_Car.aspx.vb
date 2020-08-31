Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.IO



Partial Class Upload_Car
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindRepeater()
        End If
    End Sub
    Private Sub BindRepeater()
        Dim Constr As String = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ConnectionString
        Dim conn As New SqlConnection(Constr)
        Using cmd As New SqlCommand("Procedure_Car")
            cmd.Parameters.AddWithValue("@Action", "SELECT")
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



        Dim Make As String = txtUploadMake.Text
        Dim Model As String = txtUploadModel.Text
        Dim Year As String = txtUploadYear.Text
        Dim Color As String = txtUploadColor.Text
        Dim Price As String = txtUploadPrice.Text
        Dim Style As String = DrpUploadStyle.Text
        Dim Spec As String = txtUploadSpec.Text
        Dim Engine As String = txtUploadEngine.Text
        Dim Chassis As String = txtUploadChassis.Text

        If FileUploadImg.HasFile Then

            Dim productimage As String = Path.GetFileName(FileUploadImg.PostedFile.FileName)
            FileUploadImg.PostedFile.SaveAs(Server.MapPath("~/Images/") + productimage)

            Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ConnectionString
            Using conn As New SqlConnection(constr)
                Using cmd As New SqlCommand("Procedure_Car")
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@Action", "INSERT")
                    cmd.Parameters.AddWithValue("@Image", "~/Images/" + productimage)
                    cmd.Parameters.AddWithValue("@Make", Make)
                    cmd.Parameters.AddWithValue("@Model", Model)
                    cmd.Parameters.AddWithValue("@Year", Year)
                    cmd.Parameters.AddWithValue("@Color", Color)
                    cmd.Parameters.AddWithValue("@Price", Price)
                    cmd.Parameters.AddWithValue("@Style", Style)
                    cmd.Parameters.AddWithValue("@Spec", Spec)
                    cmd.Parameters.AddWithValue("@Engine_No", Engine)
                    cmd.Parameters.AddWithValue("@Chassis_No", Chassis)



                    cmd.Connection = conn
                    conn.Open()
                    cmd.ExecuteNonQuery()
                    conn.Close()
                End Using
            End Using

        End If


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
        item.FindControl("ImgCar").Visible = Not isEdit
        item.FindControl("lblMake").Visible = Not isEdit
        item.FindControl("lblModel").Visible = Not isEdit
        item.FindControl("lblYear").Visible = Not isEdit
        item.FindControl("lblColor").Visible = Not isEdit
        item.FindControl("lblPrice").Visible = Not isEdit
        item.FindControl("lblBody").Visible = Not isEdit
        item.FindControl("lblSpec").Visible = Not isEdit
        item.FindControl("lblEngine").Visible = Not isEdit
        item.FindControl("lblChassis").Visible = Not isEdit
    End Sub
    Protected Sub OnEdit(sender As Object, e As EventArgs)
        'Find the reference of the Repeater Item.
        Dim item As RepeaterItem = TryCast(TryCast(sender, LinkButton).Parent, RepeaterItem)



        txtUploadMake.Text = TryCast(item.FindControl("lblMake"), Label).Text
        txtUploadModel.Text = TryCast(item.FindControl("lblModel"), Label).Text
        txtUploadYear.Text = TryCast(item.FindControl("lblYear"), Label).Text
        txtUploadColor.Text = TryCast(item.FindControl("lblColor"), Label).Text
        txtUploadPrice.Text = TryCast(item.FindControl("lblPrice"), Label).Text
        DrpUploadStyle.Text = TryCast(item.FindControl("lblBody"), Label).Text
        txtUploadSpec.Text = TryCast(item.FindControl("lblSpec"), Label).Text
        txtUploadEngine.Text = TryCast(item.FindControl("lblEngine"), Label).Text
        txtUploadChassis.Text = TryCast(item.FindControl("lblChassis"), Label).Text


        Me.ToggleElements(item, True)
    End Sub



    'Update 
    Protected Sub OnUpdate(sender As Object, e As EventArgs)
        'Find the reference of the Repeater Item.
        Dim item As RepeaterItem = TryCast(TryCast(sender, Button).Parent, RepeaterItem)

        Dim make As String = txtUploadMake.Text
        Dim model As String = txtUploadModel.Text
        Dim year As String = txtUploadYear.Text
        Dim color As String = txtUploadColor.Text
        Dim price As String = txtUploadPrice.Text
        Dim style As String = DrpUploadStyle.Text
        Dim spec As String = txtUploadSpec.Text
        Dim Engine As String = txtUploadEngine.Text
        Dim Chassis As String = txtUploadChassis.Text





        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("Procedure_Car")
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@Action", "UPDATE")
                cmd.Parameters.AddWithValue("@Make", make)
                cmd.Parameters.AddWithValue("@Model", model)
                cmd.Parameters.AddWithValue("@Year", year)
                cmd.Parameters.AddWithValue("@Color", color)
                cmd.Parameters.AddWithValue("@Price", price)
                cmd.Parameters.AddWithValue("@Style", Style)
                cmd.Parameters.AddWithValue("@Spec", spec)
                cmd.Parameters.AddWithValue("@Engine_No", Engine)
                cmd.Parameters.AddWithValue("@Chassis_No", Chassis)




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
        Dim CarId As Integer = Integer.Parse(TryCast(item.FindControl("lblCarId"), Label).Text)

        Dim constr As String = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("Procedure_Car")
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@Action", "DELETE")
                cmd.Parameters.AddWithValue("@CarId", CarId)
                cmd.Connection = con
                con.Open()
                cmd.ExecuteNonQuery()
                con.Close()
            End Using
        End Using
        Me.BindRepeater()
    End Sub


    Protected Sub ButtonClr_Click(sender As Object, e As EventArgs) Handles ButtonClr.Click

        txtUploadYear.Text = ""
        txtUploadSpec.Text = ""
        txtUploadPrice.Text = ""
        txtUploadModel.Text = ""
        txtUploadMake.Text = ""
        txtUploadEngine.Text = ""
        txtUploadColor.Text = ""
        txtUploadChassis.Text = ""
        DrpUploadStyle.SelectedValue = -1


    End Sub

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
        sda.SelectCommand = cmmd

        Dim ds As New DataSet
        sda.Fill(ds)
        Repeater1.DataSource = ds
        Repeater1.DataBind()


        conn.Close()




        conn.Close()

    End Sub
End Class
