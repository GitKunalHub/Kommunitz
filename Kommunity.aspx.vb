Imports System.Data
Imports System.Data.OleDbClient
Partial Class Kommunity
    Inherits System.Web.UI.Page
    Dim conn As OleDbConnection = New OleDbConnection("Data Source=OleDb8003.site4now.net;Initial Catalog=db_a8f072_dbkommunitz;User Id=db_a8f072_dbkommunitz_admin;Password=kunal4db")
    Protected Sub DataList1_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles DataList1.ItemCommand
        If e.CommandName = "delete_post" Then
            Dim pid As Integer = Val(e.CommandArgument)
            Dim answer As Integer

            answer = MsgBox("Text", vbQuestion + vbYesNo + vbDefaultButton2, "Confirmation")
            If answer = vbYes Then
                Dim cmd As OleDbCommand
                cmd = New OleDbCommand("Delete from tblContent where Post_Ref_ID=" & pid & "", conn)
                cmd.ExecuteNonQuery()
                cmd.Dispose()
            End If
        End If
        If e.CommandName = "Ban_User" Then
            Dim pid As Integer = Val(e.CommandArgument)
            Dim answer As Integer

            answer = MsgBox("Are you Sure You Want To Ban User ?", vbQuestion + vbYesNo + vbDefaultButton2, "Confirmation")

            If e.CommandName = "Yes" Then
                Dim cmd As OleDbCommand
                cmd = New OleDbCommand("Delete from tblContent where Post_Ref_ID=" & pid & "", conn)
                cmd.ExecuteNonQuery()
                cmd.Dispose()
            End If
        End If
    End Sub

    Protected Sub DataList1_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles DataList1.ItemDataBound
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
            message = String.Concat("Posted ", (((timegap.Days) / 30) / 12), " years ago")
        ElseIf timegap.Days > 31 Then
            message = String.Concat("Posted ", ((timegap.Days) / 30), " months ago")
        ElseIf timegap.Days > 1 Then
            message = String.Concat("Posted ", timegap.Days, " days ago")
        ElseIf timegap.Days = 1 Then
            message = "Posted yesterday"
        ElseIf timegap.Hours >= 2 Then
            message = String.Concat("Posted ", timegap.Hours, " hours ago")
        ElseIf timegap.Hours >= 1 Then
            message = "Posted an hour ago"
        ElseIf timegap.Minutes >= 60 Then
            message = "Posted more than an hour ago"
        ElseIf timegap.Minutes >= 5 Then
            message = String.Concat("Posted ", timegap.Minutes, " minutes ago")
        ElseIf timegap.Minutes >= 1 Then
            message = "Posted a few minute/s ago"
        Else
            message = "Posted less than a minute ago"
        End If

        Return message
    End Function

    Protected Sub DataList2_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles DataList2.ItemDataBound
        Try
            Dim Username As String = Session("Username").ToString
            Dim kn As String = Request.QueryString("Kommunity_Name")
            Dim da As OleDbDataAdapter = New OleDbDataAdapter("select * from tblKommunity where Kommunity_Name='" + kn.ToString() + "'", conn)
            Dim ds As DataSet = New DataSet
            da.Fill(ds)
            Dim un As String = ds.Tables(0).Rows(0)("Username").ToString()
            If un = Username Then
                CType(e.Item.FindControl("btnJoin"), Button).Visible = False
                CType(e.Item.FindControl("btnedit"), Button).Visible = True
            End If
            da.Dispose()
            ds.Dispose()
        Catch ex As Exception
            CType(e.Item.FindControl("btnJoin"), Button).Visible = False
            CType(e.Item.FindControl("btnedit"), Button).Visible = False
        End Try 
    End Sub

    Protected Sub Page_Disposed(sender As Object, e As EventArgs) Handles Me.Disposed
        conn.Close()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        conn.Open()
    End Sub
End Class
