Imports System.Data.SqlClient
Imports System.Data
Partial Class SearchResults
    Inherits System.Web.UI.Page
    Dim conn As SqlConnection = New SqlConnection("Data Source=SQL8003.site4now.net;Initial Catalog=db_a8f072_dbkommunitz;User Id=db_a8f072_dbkommunitz_admin;Password=kunal4db")

    Protected Sub Page_Disposed(sender As Object, e As EventArgs) Handles Me.Disposed
        conn.Close()
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        conn.Open()
        Dim Demo As String = "%" & Request.QueryString("s") & "%"

        Dim da As SqlDataAdapter
        Dim ds As DataSet
        da = New SqlDataAdapter("select * from tblContent where Content_Text like '" + Demo + "'", conn)
        ds = New DataSet

        da.Fill(ds)

        DataList1.DataSource = ds
        DataList1.DataBind()
    End Sub
    Protected Sub DataList1_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles DataList1.ItemDataBound
        'If String.IsNullOrEmpty(((HiddenField)).Item.FindControl("HiddenField1")).Value)) Then
        If String.IsNullOrEmpty((CType(e.Item.FindControl("HiddenField1"), HiddenField)).Value) Then
            CType(e.Item.FindControl("PlaceHolder1"), PlaceHolder).Visible = False
        End If

        If String.IsNullOrEmpty((CType(e.Item.FindControl("HiddenField2"), HiddenField)).Value) Then
            CType(e.Item.FindControl("PlaceHolder2"), PlaceHolder).Visible = False
        End If

        If String.IsNullOrEmpty((CType(e.Item.FindControl("HiddenField3"), HiddenField)).Value) Then
            CType(e.Item.FindControl("PlaceHolder3"), PlaceHolder).Visible = False
        End If
    End Sub

    Protected Sub btnCommunities_Click(sender As Object, e As EventArgs) Handles btnCommunities.Click

        pnlUsers.Visible = False
        pnlCommunities.Visible = True
        pnlPosts.Visible = False

        Dim Demo As String = "%" & Request.QueryString("s") & "%"

        Dim da As SqlDataAdapter
        Dim ds As DataSet
        da = New SqlDataAdapter("select * from tblKommunity where Kommunity_Name like '" + Demo + "'", conn)
        ds = New DataSet

        da.Fill(ds)

        DataList2.DataSource = ds
        DataList2.DataBind()
        da.Dispose()
        ds.Dispose()
    End Sub

    Protected Sub btnUsers_Click(sender As Object, e As EventArgs) Handles btnUsers.Click

        pnlUsers.Visible = True
        pnlCommunities.Visible = False
        pnlPosts.Visible = False

        Dim Demo As String = "%" & Request.QueryString("s") & "%"

        Dim da As SqlDataAdapter
        Dim ds As DataSet
        da = New SqlDataAdapter("select * from tblUser_Profile where Username like '" + Demo + "'", conn)
        ds = New DataSet

        da.Fill(ds)

        DataList3.DataSource = ds
        DataList3.DataBind()
        da.Dispose()
        ds.Dispose()
    End Sub
End Class
