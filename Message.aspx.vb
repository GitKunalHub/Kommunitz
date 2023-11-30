Imports System.Data
Imports System.Data.SqlClient

Partial Class Message
    Inherits System.Web.UI.Page
    Dim sqlRec2 As SqlDataSource
    Dim conn As SqlConnection
    Dim da As SqlDataAdapter
    Dim ds As DataSet
    Dim count As String
    Dim read As String = "No"
    Dim yes As String = "Yes"
    Dim cmd As SqlCommand
    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Try
            da.Fill(ds)
            dlRec.DataSourceID = SqlRec.ID
            dlRec.DataBind()
            cmd.ExecuteNonQuery()
        Catch ex As Exception

        End Try
    End Sub
    Protected Sub btnSend_Click(sender As Object, e As EventArgs) Handles btnSend.Click
        Dim click As String
        click = DateTime.Now
        Dim conn As SqlConnection
        conn = New SqlConnection("Data Source=SQL8003.site4now.net;Initial Catalog=db_a8f072_dbkommunitz;User Id=db_a8f072_dbkommunitz_admin;Password=kunal4db")
        conn.Open()
        Dim msgBy As String = Session("Username")
        Dim msgTo As String = Request.QueryString("Username")
        Session("Username") = msgBy

        Dim cmd As SqlCommand
        cmd = New SqlCommand("insert into tblMessaging(Message_Content,Sent_by,Sent_to,Messaged_on,Message_read) values('" & txtMessage.Value & "','" & msgBy & "','" & msgTo & "','" & click & "','" & "No" & "')", conn)
        cmd.ExecuteNonQuery()
        dlRec.DataSourceID = SqlRec.ID
        dlRec.DataBind()
        conn.Close()
    End Sub
    Protected Sub dlRec_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlRec.ItemDataBound
        If CType(e.Item.FindControl("hfSent_To"), HiddenField).Value <> Session("Username") Then

            CType(e.Item.FindControl("Panel1"), Panel).HorizontalAlign = HorizontalAlign.Right

        End If
    End Sub
    'Protected Sub DataList3_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles DataList3.ItemCommand
    '    If e.CommandName = "btnMessage" Then
    '        Session("MsgProfile") = Session("Username")
    '        Session("msgTo") = e.CommandArgument.ToString()
    '        Server.Transfer("Message.aspx?Username=" + e.CommandArgument)
    '    End If
    'End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim user As String = Session("msgto")
        lblUser.Text = user
        conn = New SqlConnection("Data Source=SQL5098.site4now.net;Initial Catalog=db_a84ebb_dbkommunitz;Pooling=false;User Id=db_a84ebb_dbkommunitz_admin;Password=Project3957")
        conn.Open()
        da = New SqlDataAdapter("select * from tblMessaging where Message_read = '" & read & "' ", conn)
        ds = New DataSet
        cmd = New SqlCommand("update tblMessaging set Message_read = '" & yes & "' where Message_read = '" & read & "' ")
    End Sub
End Class
