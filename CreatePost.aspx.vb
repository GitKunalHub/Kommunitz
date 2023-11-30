Imports System.Data.OleDbClient
Imports System.Data
Partial Class CreatePost
    Inherits System.Web.UI.Page
    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click

        Dim conn As OleDbConnection
        conn = New OleDbConnection("Data Source=OleDb5092.site4now.net;Initial Catalog=db_a84ebb_kommunitz;User Id=db_a84ebb_kommunitz_admin;Password=Project3957")
        conn.Open()

        Dim click As String
        click = DateTime.Now
        Dim str As String = DropDownList1.SelectedValue.ToString()

        Dim username As String = Request.QueryString("username")
        If FileUpload2.HasFile = True And txtContent.Text <> "" And txtTitle.Text <> "" Then
            FileUpload2.SaveAs("k:\my drive\komunitz cera\user images\" + FileUpload2.FileName)
            Dim img As String = "user images\" + FileUpload2.FileName + ""
            Dim cmd As OleDbCommand
            Dim vote As Integer = 0
            cmd = New OleDbCommand("insert into tblcontent(content_title,content_text,content_image,Kommunity_Name,username,posted_on,upvote) values('" + txtTitle.Text + "','" + txtContent.Text + "','" + img + "','" + str + "','" + username + "','" + click.Replace(".", ":") + "'," & vote & ")", conn)
            cmd.ExecuteNonQuery()
            Response.Redirect("demohome2.aspx?username=" + username + "")
        Else
            Response.Write("Please Select a File or Community")
        End If
        conn.Close()
    End Sub
End Class
