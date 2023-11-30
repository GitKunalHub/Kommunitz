Imports System.Data
Imports System.Data.OleDb
Imports System.Data.OleDbClient

Partial Class CreateKommunity
    Inherits System.Web.UI.Page
    Dim conn As OleDbConnection = New OleDbConnection("Data Source=OleDb8003.site4now.net;Initial Catalog=db_a8f072_dbkommunitz;User Id=db_a8f072_dbkommunitz_admin;Password=kunal4db")
    Protected Sub btnCreate_Click(sender As Object, e As EventArgs) Handles btnCreate.Click
        Dim cmd As OleDbCommand
        Dim Username As String = Session("Username").ToString
        Dim dt As String = DateTime.Now
        cmd = New OleDbCommand("insert into tblKommunity(Kommunity_Name,Kommunity_Bio,Created_On,Username) values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + dt.ToString() + "','" + Username + "') ", conn)
        cmd.ExecuteNonQuery()
        cmd.Dispose()
        Response.Redirect("Kommunity.aspx?Kommunity_Name=" + TextBox1.Text)
    End Sub

    Protected Sub Page_Disposed(sender As Object, e As EventArgs) Handles Me.Disposed
        conn.Close()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        conn.Open()
    End Sub
End Class
