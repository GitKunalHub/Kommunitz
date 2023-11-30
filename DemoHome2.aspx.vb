Imports System.Data
Imports System.Data.OleDb
Imports System.Windows

Partial Class DemoHome2
    Inherits System.Web.UI.Page
    Dim conn As OleDbConnection = New OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\dbKommunitz.accdb")

    Protected Sub DataList1_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles DataList1.ItemCommand
        Dim PostRefID As Integer = CType(e.Item.FindControl("lblPostRefID"), Label).Text
        Dim Username As String = Session("Username")
        Dim Status As Integer
        Try
            Dim da As OleDbDataAdapter = New OleDbDataAdapter("select * from tblPosts_Upvoted where Username = '" & Username & "' and Post_Ref_ID = " & PostRefID & " ", conn)
            Dim ds As DataSet = New DataSet
            da.Fill(ds)
            Status = ds.Tables(0).Rows(0)("Status")
        Catch ex As Exception
            Status = 2
        End Try
        Dim Yes As Integer = 1
        Dim No As Integer = 0
        If e.CommandName = "down" And Status = 2 Then
            Dim vote As Integer = Val(CType(e.Item.FindControl("Vote"), Label).Text)
            vote = vote - 1
            Dim pid As Integer = Val(e.CommandArgument)
            Dim cmd As OleDbCommand = New OleDbCommand("update tblContent set Upvote=" & vote & " where Post_Ref_ID=" & pid & "", conn)
            cmd.ExecuteNonQuery()
            Dim cmd2 As OleDbCommand = New OleDbCommand("insert into tblPosts_Upvoted(Post_Ref_ID,Username,Status) values(" & PostRefID & ",'" & Username & "','" & No & "')", conn)
            cmd2.ExecuteNonQuery()
            CType(e.Item.FindControl("btnDown"), Button).Style("color") = "red"
            CType(e.Item.FindControl("Vote"), Label).Text = vote
        End If

        If e.CommandName = "down" And Status = 0 Then
            Dim vote As Integer = Val(CType(e.Item.FindControl("Vote"), Label).Text)
            vote = vote + 1
            Dim pid As Integer = Val(e.CommandArgument)
            Dim cmd As OleDbCommand = New OleDbCommand("update tblContent set Upvote=" & vote & " where Post_Ref_ID=" & pid & "", conn)
            cmd.ExecuteNonQuery()
            Dim cmd2 As OleDbCommand = New OleDbCommand("delete from tblPosts_Upvoted where Username='" & Username & "' and Post_Ref_ID=" & PostRefID & " ", conn)
            cmd2.ExecuteNonQuery()
            CType(e.Item.FindControl("btnDown"), Button).Style("color") = "initial"
            CType(e.Item.FindControl("Vote"), Label).Text = vote
        End If

        If e.CommandName = "down" And Status = 1 Then
            Dim vote As Integer = Val(CType(e.Item.FindControl("Vote"), Label).Text)
            vote = vote - 2
            Dim pid As Integer = Val(e.CommandArgument)
            Dim cmd As OleDbCommand = New OleDbCommand("update tblContent set Upvote=" & vote & " where Post_Ref_ID=" & pid & "", conn)
            cmd.ExecuteNonQuery()
            Dim cmd2 As OleDbCommand = New OleDbCommand("update tblPosts_Upvoted set Status=" & No & " where Username='" & Username & "' and Post_Ref_ID=" & PostRefID & " ", conn)
            cmd2.ExecuteNonQuery()
            CType(e.Item.FindControl("btnUp"), Button).Style("color") = "initial"
            CType(e.Item.FindControl("btnDown"), Button).Style("color") = "red"
            CType(e.Item.FindControl("Vote"), Label).Text = vote
        End If

        If e.CommandName = "up" And Status = 2 Then
            Dim vote As Integer = Val(CType(e.Item.FindControl("Vote"), Label).Text)
            vote = vote + 1
            Dim pid As Integer = Val(e.CommandArgument)
            Dim cmd As OleDbCommand = New OleDbCommand("update tblContent set Upvote=" & vote & " where Post_Ref_ID=" & pid & "", conn)
            cmd.ExecuteNonQuery()
            Dim cmd2 As OleDbCommand = New OleDbCommand("insert into tblPosts_Upvoted(Post_Ref_ID,Username,Status) values(" & PostRefID & ",'" & Username & "','" & Yes & "')", conn)
            cmd2.ExecuteNonQuery()
            CType(e.Item.FindControl("btnUp"), Button).Style("color") = "blue"
            CType(e.Item.FindControl("Vote"), Label).Text = vote
        End If

        If e.CommandName = "up" And Status = 1 Then
            Dim vote As Integer = Val(CType(e.Item.FindControl("Vote"), Label).Text)
            vote = vote - 1
            Dim pid As Integer = Val(e.CommandArgument)
            Dim cmd As OleDbCommand = New OleDbCommand("update tblContent set Upvote=" & vote & " where Post_Ref_ID=" & pid & "", conn)
            cmd.ExecuteNonQuery()
            Dim cmd2 As OleDbCommand = New OleDbCommand("delete from tblPosts_Upvoted where Username='" & Username & "' and Post_Ref_ID=" & PostRefID & " ", conn)
            cmd2.ExecuteNonQuery()
            CType(e.Item.FindControl("btnUp"), Button).Style("color") = "initial"
            CType(e.Item.FindControl("Vote"), Label).Text = vote
        End If

        If e.CommandName = "up" And Status = 0 Then
            Dim vote As Integer = Val(CType(e.Item.FindControl("Vote"), Label).Text)
            vote = vote + 2
            Dim pid As Integer = Val(e.CommandArgument)
            Dim cmd As OleDbCommand = New OleDbCommand("update tblContent set Upvote=" & vote & " where Post_Ref_ID=" & pid & "", conn)
            cmd.ExecuteNonQuery()
            Dim cmd2 As OleDbCommand = New OleDbCommand("update tblPosts_Upvoted set Status=" & Yes & " where Username='" & Username & "' and Post_Ref_ID=" & PostRefID & " ", conn)
            cmd2.ExecuteNonQuery()
            CType(e.Item.FindControl("btnUp"), Button).Style("color") = "blue"
            CType(e.Item.FindControl("btnDown"), Button).Style("color") = "initial"
            CType(e.Item.FindControl("Vote"), Label).Text = vote
        End If

        If e.CommandName = "btnComments" Then
            Response.Redirect("Post.aspx?Post_Ref_ID=" & PostRefID & "")
        End If

    End Sub


    Protected Sub DataList1_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles DataList1.ItemDataBound
        'If String.IsNullOrEmpty(((HiddenField)).Item.FindControl("HiddenField1")).Value)) Then
        Dim PostRefID As Integer = CType(e.Item.FindControl("lblPostRefID"), Label).Text
        Dim Username As String = Session("Username")
        Try
            Dim da As OleDbDataAdapter = New OleDbDataAdapter("select * from tblComment where Username='" & Username & "' and Post_Ref_ID=" & PostRefID & " ", conn)
            Dim ds As DataSet = New DataSet

            da.Fill(ds)
            Dim lblComment As Integer = ds.Tables(0).Rows.Count
            CType(e.Item.FindControl("lblComments"), Button).Text = " " & lblComment & " Comments"
            CType(e.Item.FindControl("lblComments"), Button).Style("padding-right") = "0"
        Catch ex As Exception
            CType(e.Item.FindControl("lblComments"), Button).Text = "No Comments"
        End Try
        Try
            Dim da As OleDbDataAdapter = New OleDbDataAdapter("select * from tblPosts_Upvoted where Username='" & Username & "' and Post_Ref_ID=" & PostRefID & " ", conn)
            Dim ds As DataSet = New DataSet

            da.Fill(ds)

            Dim Status As String = ds.Tables(0).Rows(0)("Status").ToString
            CType(e.Item.FindControl("btnDown"), Button).Style("padding-right") = "5"
            If Status = "1" Then
                CType(e.Item.FindControl("btnUp"), Button).Style("color") = "blue"
                CType(e.Item.FindControl("btnDown"), Button).Style("color") = "initial"
            ElseIf Status = "0" Then
                CType(e.Item.FindControl("btnDown"), Button).Style("color") = "red"
                CType(e.Item.FindControl("btnUp"), Button).Style("color") = "initial"
            End If
        Catch ex As Exception

        End Try
        
        If String.IsNullOrEmpty((CType(e.Item.FindControl("HiddenField1"), HiddenField)).Value) Then
            CType(e.Item.FindControl("PlaceHolder1"), PlaceHolder).Visible = False
        End If

        If String.IsNullOrEmpty((CType(e.Item.FindControl("HiddenField2"), HiddenField)).Value) Then
            CType(e.Item.FindControl("PlaceHolder2"), PlaceHolder).Visible = False
        End If

        If String.IsNullOrEmpty((CType(e.Item.FindControl("HiddenField3"), HiddenField)).Value) Then
            CType(e.Item.FindControl("PlaceHolder3"), PlaceHolder).Visible = False
        End If

        Dim btnClick As Button = CType(e.Item.FindControl("Button1"), Button)
        Dim ddl As DropDownList = CType(e.Item.FindControl("DropDownList1"), DropDownList)

        Dim PostedOn As Label = CType(e.Item.FindControl("Posted_OnLabel"), Label)
        If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
            Dim lblDate As Label = CType(e.Item.FindControl("Posted_OnLabel"), Label)
            Dim dt As String
            lblDate.Text = lblDate.Text.Replace("/", "-")
            dt = CalCulateTime(lblDate.Text)
            CType(e.Item.FindControl("Posted_OnLabel"), Label).Text = dt.ToString()
        End If

        'Dim Admin_chkbox As CheckBox = TryCast(Me.Master.FindControl("Admin_chk"), CheckBox)

        'If Admin_chkbox.Checked = True Then
        '    CType(e.Item.FindControl("btnDelete"), Button).Visible = True
        'Else
        '    CType(e.Item.FindControl("btnDelete"), Button).Visible = False
        'End If
    End Sub
    Public Function CalCulateTime(ByVal postDate As DateTime) As String
        Dim message As String = ""
        Dim currentDate As DateTime = DateTime.Now
        Dim ctDate As String = currentDate
        ctDate = ctDate.Replace(":", ".")
        ctDate = ctDate.Replace("/", "-")
        Dim realDate As Date = ctDate
        Dim timegap As TimeSpan = realDate - postDate
        message = String.Concat("Posted on ", postDate.ToString("MMMM dd, yyyy"), " at ", postDate.ToString("hh:mm tt"))
        If timegap.Days > 365 Then
            message = String.Concat("", (((timegap.Days) / 30) / 12), " years ago")
        ElseIf timegap.Days > 62 Then
            Dim month As Integer = ((timegap.Days) / 30)
            message = String.Concat("", month, " months ago")
        ElseIf timegap.Days > 31 Then
            Dim month As Integer = ((timegap.Days) / 30)
            message = String.Concat("", month, " month ago")
        ElseIf timegap.Days > 1 Then
            message = String.Concat("", timegap.Days, " days ago")
        ElseIf timegap.Days = 1 Then
            message = "yesterday"
        ElseIf timegap.Hours >= 2 Then
            message = String.Concat("", timegap.Hours, " hours ago")
        ElseIf timegap.Hours >= 1 Then
            message = "an hour ago"
        ElseIf timegap.Minutes >= 60 Then
            message = "more than an hour ago"
        ElseIf timegap.Minutes >= 5 Then
            message = String.Concat("Posted ", timegap.Minutes, " minutes ago")
        ElseIf timegap.Minutes >= 1 Then
            message = "a few minutes ago"
        Else
            message = "less than a minute ago"
        End If

        Return message
    End Function

    Protected Sub lnkCreatePost_ServerClick(sender As Object, e As EventArgs) Handles lnkCreatePost.ServerClick
        DataList1.Visible = False
        pnlCreatePost.Visible = True
        TextBox1.Visible = False
    End Sub

    Protected Sub Page_Disposed(sender As Object, e As EventArgs) Handles Me.Disposed
        conn.Close()
    End Sub
    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim username As String = Session("Username")
        Dim rn As DateTime = DateTime.Now
        Dim click As String = rn
        Dim str As String = DropDownList1.SelectedValue.ToString()
        If txtContent.Text <> "" And txtTitle.Text <> "" Then
            FileUpload2.SaveAs("h:\root\home\kunalgolani-001\www\kommunitz\user images\" + FileUpload2.FileName + "")
            Dim img As String = "user images\" + FileUpload2.FileName + ""
            Dim cmd As OleDbCommand
            Dim vote As Integer = 0
            cmd = New OleDbCommand("insert into tblContent(Content_Title,Content_Text,Content_Image,Kommunity_Name,Username,Posted_On,Upvote) values('" + txtTitle.Text + "','" + txtContent.Text + "','" + img + "','" + str + "','" + username + "','" + click + "'," & vote & ")", conn)
            cmd.ExecuteNonQuery()
            Response.Redirect("DemoHome2.aspx")
        Else
            MsgBox("Error")
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        conn.Open()
        Dim sr As System.Windows.Forms.Screen = System.Windows.Forms.Screen.PrimaryScreen

        Dim srHeight As Integer = sr.Bounds.Height
        Dim srWidth As Integer = sr.Bounds.Width

        If srWidth < 987 Then
            DataList1.Width = 500
        End If

    End Sub

End Class
