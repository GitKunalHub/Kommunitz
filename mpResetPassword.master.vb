Imports System.Data.SqlClient
Imports System.Data

Partial Class mpResetPassword
    Inherits System.Web.UI.MasterPage
    Dim conn As SqlConnection = New SqlConnection("Data Source=SQL8003.site4now.net;Initial Catalog=db_a8f072_dbkommunitz;User Id=db_a8f072_dbkommunitz_admin;Password=kunal4db")
    Protected Sub login_btn_ServerClick(sender As Object, e As EventArgs) Handles login_btn.ServerClick

        Dim Mail As String
        Dim da As SqlDataAdapter
        Dim ds As DataSet
        da = New SqlDataAdapter("select * from tblUsers where Mail='" + txtEmail.Value + "'", conn)
        ds = New DataSet
        da.Fill(ds)
        Try
            Mail = ds.Tables(0).Rows(0)("Mail").ToString()
        Catch ex As Exception
            MsgBox("Invalid E-Mail ID")
            Response.Redirect("ResetPassword.aspx")
        End Try
        da.Dispose()
        ds.Dispose()
        Session("Mail") = txtEmail.Value
        Response.Redirect("NewPassword.aspx")
        'Response.Redirect("NewPassword.aspx")
    End Sub

    Protected Sub Page_Disposed(sender As Object, e As EventArgs) Handles Me.Disposed
        conn.Close()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        conn.Open()
    End Sub
End Class

