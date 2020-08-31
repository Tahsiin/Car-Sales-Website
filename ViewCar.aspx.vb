Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Runtime.Serialization
Imports System.Web.Script.Serialization
Partial Class ViewCar
    Inherits System.Web.UI.Page

    Protected Sub ImgBtnAddCart_Click(sender As Object, e As EventArgs) Handles ImgBtnAddCart.Click
        Dim ds As DataSet = Nothing
        If Session("ItemCart") Is Nothing Then
            ds = New DataSet()
            Dim dt As New DataTable()
            dt.Columns.AddRange(New DataColumn(2) {New DataColumn("Make"), New DataColumn("Model"), New DataColumn("Price")})
            ds.Tables.Add(dt)
            Session("ItemCart") = ds
        Else
            ds = DirectCast(Session("ItemCart"), DataSet)
        End If
        Dim row As DataRow = ds.Tables(0).NewRow()

        Dim Non As String = "Not set"
        Dim lblField As Label
        Dim k As Integer = 0

        For Each item In Repeater1.Items
            lblField = item.FindControl("lblCarId")
            If Not IsNothing(lblField) Then
                k += 1
                Non = lblField.Text

            Else
            End If
        Next
        Dim Constr As String = ConfigurationManager.ConnectionStrings("ConnectionStringDatabase").ConnectionString
        Dim con As New SqlConnection(Constr)


        Dim cmd As New SqlCommand()



        cmd.CommandText = "SELECT * FROM [Car], [Make], [Model] WHERE  Car.Make_Id= Make.Make_Id AND Car.Model_Id=Model.Model_Id AND Car.Car_Id =" + Non
        cmd.Connection = con
        con.Open()
        Dim rdr As SqlDataReader
        rdr = cmd.ExecuteReader()
        rdr.Read()


        row("Make") = rdr("Make").ToString()
        row("Model") = rdr("Model").ToString()
        row("Price") = rdr(9).ToString()

        convert_to_json(row("Make"), row("Price"))
        con.Close()
        ds.Tables(0).Rows.Add(row)



    End Sub

    Private Sub convert_to_json(ByVal make As String, ByVal price As String)

        Dim Json = make
        Response.Clear()
        Response.ContentType = "application/json; charset=utf-8"

        Response.Write(Json)
        Response.End()


    End Sub

    'Private Sub ViewCar_Load(sender As Object, e As EventArgs) Handles Me.Load












    '  End Sub

    Private Sub ViewCar_Load(sender As Object, e As EventArgs) Handles Me.PreLoad

        '   convert_to_json("ejfejf", "ksd")

        If Session("Type") = "user1" Then
            Warning.Visible = False
            PanelView.Visible = True
        End If

    End Sub


End Class
