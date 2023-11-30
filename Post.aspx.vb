Imports System.Data
Imports System.Data.SqlClient

Partial Class Post
    Inherits System.Web.UI.Page
    Dim HCid As HiddenField
    Dim Conn As SqlConnection = New SqlConnection("Data Source=SQL8003.site4now.net;Initial Catalog=db_a8f072_dbkommunitz;User Id=db_a8f072_dbkommunitz_admin;Password=kunal4db")

    Protected Sub dlPost_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlPost.ItemDataBound
        If String.IsNullOrEmpty((CType(e.Item.FindControl("HiddenField1"), HiddenField)).Value) Then
            CType(e.Item.FindControl("PlaceHolder1"), PlaceHolder).Visible = False
        End If

        If String.IsNullOrEmpty((CType(e.Item.FindControl("HiddenField2"), HiddenField)).Value) Then
            CType(e.Item.FindControl("PlaceHolder2"), PlaceHolder).Visible = False
        End If

        If String.IsNullOrEmpty((CType(e.Item.FindControl("HiddenField3"), HiddenField)).Value) Then
            CType(e.Item.FindControl("PlaceHolder3"), PlaceHolder).Visible = False
        End If

        If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
            Dim lblDate As Label = CType(e.Item.FindControl("Posted_OnLabel"), Label)
            Dim dt As String
            lblDate.Text = lblDate.Text.Replace("/", "-")
            dt = CalCulateTime(lblDate.Text)
            CType(e.Item.FindControl("Posted_OnLabel"), Label).Text = dt.ToString()
        End If
    End Sub
    Public Sub dlComment_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles dlComment.ItemCommand

        If e.CommandName = "Replies" And CType(e.Item.FindControl("Panel5"), Panel).Visible = False Then
            CType(e.Item.FindControl("Panel5"), Panel).Visible = True
        End If

        If e.CommandName = "Replies" And CType(e.Item.FindControl("Panel5"), Panel).Visible = True Then
            CType(e.Item.FindControl("Panel5"), Panel).EnableViewState = True
        End If
        If e.CommandName = "Reply" Then
            Dim pnlReplyBox As Panel = CType(e.Item.FindControl("Panel1"), Panel)
            pnlReplyBox.Visible = False
            If IsPostBack Then
                CType(e.Item.FindControl("Panel1"), Panel).Visible = True
            End If
        End If

        If e.CommandName = "InComment" Then
            Dim cid As Integer = Val(e.CommandArgument.ToString())
            Dim cmd As SqlCommand
            Dim cmd2 As SqlCommand
            Dim pid As Integer = Val(Request.QueryString("Post_Ref_ID"))
            Dim Username As String = Session("Username").ToString
            Dim mid As Integer = Val(CType(e.Item.FindControl("HiddenField7"), HiddenField).Value)
            Dim cont As String = CType(e.Item.FindControl("commentrep"), TextBox).Text
            Dim time As String


            Dim rep As Integer = Val(CType(e.Item.FindControl("hiddenfield4"), HiddenField).Value)
            rep = rep + 1
            time = DateTime.Now

            cmd = New SqlCommand("insert into tblComment(Comment_Content,Post_Ref_ID,Comment_Ref_ID,Username,Comment_Date,Main_ID) values('" & cont & "'," & pid & "," & cid & ",'" & Username & "','" & time.Replace(".", ":") & "'," & cid & ")", conn)
            cmd.ExecuteNonQuery()
            cmd.Dispose()
            cmd2 = New SqlCommand("update tblComment set Replies=" & rep & " where Comment_ID=" & cid & "", conn)
            cmd2.ExecuteNonQuery()
            cmd2.Dispose()
            dlComment.DataSourceID = sqlComment.ID
            dlComment.DataBind()
            'Response.Redirect("Post.aspx?Post_Ref_ID=" & pid)
        End If

        If e.CommandName = "Cancel" Then
            CType(e.Item.FindControl("Panel1"), Panel).Visible = False
        End If

    End Sub

    Protected Sub dlComment_ItemCreated(sender As Object, e As DataListItemEventArgs) Handles dlComment.ItemCreated
        If e.Item.ItemType = ListItemType.AlternatingItem OrElse e.Item.ItemType = ListItemType.Item Then
            Dim inner As DataList = DirectCast(e.Item.FindControl("dlReply"), DataList)
            AddHandler inner.ItemCommand, AddressOf dlReply_ItemCommand

        End If


    End Sub

    Protected Sub dlReply_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs)

        If e.CommandName = "InReply" Then
            CType(e.Item.FindControl("Panel4"), Panel).Visible = True
        End If

        If e.CommandName = "InCancel" Then
            CType(e.Item.FindControl("Panel4"), Panel).Visible = False
        End If

        If e.CommandName = "RepComment" Then
            Dim cid As Integer = Val(e.CommandArgument.ToString())
            Dim cmd As SqlCommand
            Dim cmd2 As SqlCommand
            Dim pid As Integer = Val(Request.QueryString("Post_Ref_ID"))
            Dim Username As String = Session("Username").ToString
            Dim cont As String = CType(e.Item.FindControl("repcomment"), TextBox).Text
            Dim time As String
            Dim mid As Integer = Val(CType(e.Item.FindControl("HiddenField6"), HiddenField).Value)
            Dim da As SqlDataAdapter = New SqlDataAdapter("select * from tblComment where Comment_ID=" & mid & "", conn)
            Dim ds As DataSet = New DataSet
            da.Fill(ds)
            Dim rep As Integer = Val(ds.Tables(0).Rows(0)("Replies").ToString())
            rep = rep & 1
            time = DateTime.Now
            cmd = New SqlCommand("insert into tblComment(Comment_Content,Post_Ref_ID,Comment_Ref_ID,Username,Comment_Date,Main_ID) values ('" & cont & "'," & pid & "," & cid & ",'" & Username & "','" & time.Replace(".", ":") & "'," & mid & ")", conn)
            cmd2 = New SqlCommand("update tblComment set Replies='" & rep & "'  where Comment_ID=" & mid & "", conn)

            cmd.ExecuteNonQuery()
            cmd.Dispose()
            cmd2.ExecuteNonQuery()
            cmd2.Dispose()
            dlComment.DataSourceID = sqlComment.ID
            dlComment.DataBind()
            da.Dispose()
            ds.Dispose()
        End If
    End Sub


    Protected Sub dlComment_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlComment.ItemDataBound

        If String.IsNullOrEmpty((CType(e.Item.FindControl("HiddenField4"), HiddenField)).Value) Then

            CType(e.Item.FindControl("Button1"), Button).Visible = False
            CType(e.Item.FindControl("dlReply"), DataList).Visible = False
        End If

        If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
            Dim lblDate As Label = CType(e.Item.FindControl("Comment_DateLabel"), Label)
            Dim dt As String
            lblDate.Text = lblDate.Text.Replace("/", "-")
            dt = CalCulateTime(lblDate.Text)
            CType(e.Item.FindControl("Comment_DateLabel"), Label).Text = dt.ToString()
        End If

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

    Protected Sub dlReply_ItemDataBound(sender As Object, e As DataListItemEventArgs)
        If e.Item.ItemType = ListItemType.Item OrElse e.Item.ItemType = ListItemType.AlternatingItem Then
            Dim lblDate As Label = CType(e.Item.FindControl("InComment_Date"), Label)
            Dim dt As String
            lblDate.Text = lblDate.Text.Replace("/", "-")
            dt = CalCulateTime(lblDate.Text)
            CType(e.Item.FindControl("InComment_Date"), Label).Text = dt.ToString()
        End If

        Dim pid As Integer = Val(CType(e.Item.FindControl("HiddenField8"), HiddenField).Value)
        Dim da As SqlDataAdapter = New SqlDataAdapter("select * from tblComment where Comment_ID=" & pid & "", conn)
        Dim ds As DataSet = New DataSet
        da.Fill(ds)
        Dim user As String = ds.Tables(0).Rows(0)("Username").ToString()
        CType(e.Item.FindControl("lblReceiver"), Label).Text = "Replying To: " & user.ToString()
        da.Dispose()
        ds.Dispose()
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Conn.Open()
    End Sub

    Protected Sub btnComment_Click(sender As Object, e As EventArgs) Handles btnComment.Click
        Try
            Dim cmd As SqlCommand
            Dim id As String = Val(Request.QueryString("Post_Ref_ID"))
            Dim Username As String = Session("Username").ToString
            Dim cont As String = mycomment.Value
            Dim time As String

            time = DateTime.Now
            cmd = New SqlCommand("insert into tblComment(Comment_Content,Post_Ref_ID,Username,Comment_Date) values ('" & cont & "'," & id & ",'" & Username & "','" & time.Replace(".", ":") & "')", Conn)
            cmd.ExecuteNonQuery()
            cmd.Dispose()
            dlComment.DataSourceID = sqlComment.ID
            dlComment.DataBind()
        Catch ex As Exception

        End Try

    End Sub
End Class
