Imports System.Data.Sql
Imports System.Data
Imports System.Data.SqlClient

Partial Class mpNewPassword
    Inherits System.Web.UI.MasterPage
    Dim conn As SqlConnection = New SqlConnection("Data Source=SQL8003.site4now.net;Initial Catalog=db_a8f072_dbkommunitz;User Id=db_a8f072_dbkommunitz_admin;Password=kunal4db")

    Protected Sub btnReset_ServerClick(sender As Object, e As EventArgs) Handles btnReset.ServerClick

        Dim MailCheck As String = Application("Mail")
        Dim npassword As String = new_password.Value
        Dim cmd As SqlCommand
        cmd = New SqlCommand("UPDATE tblUsers SET [Password] = '" & npassword.ToString & "' WHERE Mail = '" & MailCheck & "';", conn)
        cmd.ExecuteNonQuery()
        cmd.Dispose()
    End Sub

    Protected Sub Page_Disposed(sender As Object, e As EventArgs) Handles Me.Disposed
        conn.Close()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        conn.Open()
    End Sub
End Class

