Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Partial Class Find_Car
    Inherits System.Web.UI.Page

    Dim param As New SqlParameter
    Dim Sql As String = " Select  * From [Car], [Body Style],Make,Model,Image WHERE [Car].Style_Id=[Body Style].Style_Id AND [Car].Image_Id=Image.Image_Id AND Car.Make_Id= Make.Make_Id AND Car.Model_Id=Model.Model_Id AND [Body Style].[Body Style] = @BStyle "



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles BtnSedans.Click

        Dim conn As New SqlConnection()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ToString()
        conn.Open()

        Dim cmmd As New SqlCommand(Sql, conn)

        cmmd.Parameters.AddWithValue("@BStyle", BtnSedans.Text)
        cmmd.CommandText = Sql
        cmmd.ExecuteNonQuery()


        Dim sda As New SqlDataAdapter()

        sda.SelectCommand = cmmd
        Dim da As New DataSet
        sda.Fill(da)
        Repeater1.DataSource = da
        Repeater1.DataBind()




        conn.Close()
        Repeater1.Visible = True


    End Sub
    Protected Sub BtnCoupes_Click(sender As Object, e As EventArgs) Handles BtnCoupes.Click

        Dim conn As New SqlConnection()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ToString()
        conn.Open()

        Dim cmmd As New SqlCommand(Sql, conn)




        cmmd.Parameters.AddWithValue("@BStyle", BtnCoupes.Text)
        cmmd.CommandText = Sql
        cmmd.ExecuteNonQuery()


        Dim sda As New SqlDataAdapter()

        sda.SelectCommand = cmmd
        Dim da As New DataSet
        sda.Fill(da)
        Repeater1.DataSource = da
        Repeater1.DataBind()




        conn.Close()
        Repeater1.Visible = True


    End Sub
    Protected Sub BtnWagons_Click(sender As Object, e As EventArgs) Handles BtnWagons.Click
        Dim conn As New SqlConnection()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ToString()
        conn.Open()

        Dim cmmd As New SqlCommand(Sql, conn)




        cmmd.Parameters.AddWithValue("@BStyle", BtnWagons.Text)
        cmmd.CommandText = Sql
        cmmd.ExecuteNonQuery()


        Dim sda As New SqlDataAdapter()

        sda.SelectCommand = cmmd
        Dim da As New DataSet
        sda.Fill(da)
        Repeater1.DataSource = da
        Repeater1.DataBind()




        conn.Close()
        Repeater1.Visible = True

    End Sub
    Protected Sub BtnHatchs_Click(sender As Object, e As EventArgs) Handles BtnHatchs.Click
        Dim conn As New SqlConnection()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ToString()
        conn.Open()

        Dim cmmd As New SqlCommand(Sql, conn)




        cmmd.Parameters.AddWithValue("@BStyle", BtnHatchs.Text)
        cmmd.CommandText = Sql
        cmmd.ExecuteNonQuery()


        Dim sda As New SqlDataAdapter()

        sda.SelectCommand = cmmd
        Dim da As New DataSet
        sda.Fill(da)
        Repeater1.DataSource = da
        Repeater1.DataBind()




        conn.Close()
        Repeater1.Visible = True

    End Sub
    Protected Sub BtnSUVs_Click(sender As Object, e As EventArgs) Handles BtnSUVs.Click
        Dim conn As New SqlConnection()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ToString()
        conn.Open()

        Dim cmmd As New SqlCommand(Sql, conn)




        cmmd.Parameters.AddWithValue("@BStyle", BtnSUVs.Text)
        cmmd.CommandText = Sql
        cmmd.ExecuteNonQuery()


        Dim sda As New SqlDataAdapter()

        sda.SelectCommand = cmmd
        Dim da As New DataSet
        sda.Fill(da)
        Repeater1.DataSource = da
        Repeater1.DataBind()




        conn.Close()
        Repeater1.Visible = True

    End Sub
    Protected Sub BtnConvertibles_Click(sender As Object, e As EventArgs) Handles BtnConvertibles.Click
        Dim conn As New SqlConnection()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ToString()
        conn.Open()

        Dim cmmd As New SqlCommand(Sql, conn)




        cmmd.Parameters.AddWithValue("@BStyle", BtnConvertibles.Text)
        cmmd.CommandText = Sql
        cmmd.ExecuteNonQuery()


        Dim sda As New SqlDataAdapter()

        sda.SelectCommand = cmmd
        Dim da As New DataSet
        sda.Fill(da)
        Repeater1.DataSource = da
        Repeater1.DataBind()




        conn.Close()
        Repeater1.Visible = True

    End Sub
    Protected Sub BtnMini_Click(sender As Object, e As EventArgs) Handles BtnMini.Click
        Dim conn As New SqlConnection()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ToString()
        conn.Open()

        Dim cmmd As New SqlCommand(Sql, conn)




        cmmd.Parameters.AddWithValue("@BStyle", BtnMini.Text)
        cmmd.CommandText = Sql
        cmmd.ExecuteNonQuery()


        Dim sda As New SqlDataAdapter()

        sda.SelectCommand = cmmd
        Dim da As New DataSet
        sda.Fill(da)
        Repeater1.DataSource = da
        Repeater1.DataBind()




        conn.Close()
        Repeater1.Visible = True

    End Sub



    Protected Sub BtnFind_Click(sender As Object, e As EventArgs) Handles BtnFind.Click

        Dim drpSql As String = " Select  * From [Car], [Body Style],Make,Model,Image WHERE [Car].Style_Id=[Body Style].Style_Id AND [Car].Image_Id=Image.Image_Id AND Car.Make_Id= Make.Make_Id AND Car.Model_Id=Model.Model_Id AND [Make].[Make] = @DMake "

        Dim conn As New SqlConnection()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ToString()
        conn.Open()

        Dim cmmd As New SqlCommand(drpSql, conn)


        cmmd.Parameters.AddWithValue("@DMake", DrpMake.SelectedValue)
            cmmd.CommandText = drpSql
            cmmd.ExecuteNonQuery()


            Dim sda As New SqlDataAdapter()

            sda.SelectCommand = cmmd
            Dim ds As New DataSet
            sda.Fill(ds)
            Repeater1.DataSource = ds
            Repeater1.DataBind()




            conn.Close()
            Repeater1.Visible = True





    End Sub



    Protected Sub BtnFind1_Click(sender As Object, e As EventArgs) Handles BtnFind1.Click
        Dim drpSql As String = " Select  * From [Car], [Body Style],Make,Model,Image WHERE [Car].Style_Id=[Body Style].Style_Id AND [Car].Image_Id=Image.Image_Id AND Car.Make_Id= Make.Make_Id AND Car.Model_Id=Model.Model_Id AND [Model].[Model] = @DModel "

        Dim conn As New SqlConnection()
        conn.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ToString()
        conn.Open()






        Dim cmmd As New SqlCommand(drpSql, conn)




        cmmd.Parameters.AddWithValue("@DModel", DrpModel.SelectedValue)
        cmmd.CommandText = drpSql
            cmmd.ExecuteNonQuery()


            Dim sda As New SqlDataAdapter()

            sda.SelectCommand = cmmd
            Dim ds As New DataSet
            sda.Fill(ds)
            Repeater1.DataSource = ds
            Repeater1.DataBind()




            conn.Close()
            Repeater1.Visible = True




        conn.Close()
    End Sub

End Class
