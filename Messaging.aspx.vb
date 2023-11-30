Imports System.Data.OleDb
Imports System.Data

Partial Class _Default
    Inherits System.Web.UI.Page
    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        dlRec.ID = SqlRec.ID
        dlRec.DataBind()
    End Sub

    Protected Sub btnSend_Click(sender As Object, e As EventArgs) Handles btnSend.Click
        Dim conn As OleDbConnection
        Dim click As String
        click = DateTime.Now
        conn = New OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\dbKommunitz.accdb")
        conn.Open()

        Dim msgBy As String = Session("Username")
        Dim msgTo As String = Request.QueryString("Username")
        Session("Username") = msgBy

        Dim cmd As OleDbCommand
        cmd = New OleDbCommand("insert into tblMessaging(Message_Content,Sent_by,Sent_to,Messaged_on) values('" & txtMessage.Value & "','" & msgBy & "','" & msgTo & "','" & click & "')", conn)
        cmd.ExecuteNonQuery()
        conn.Close()
    End Sub

    Protected Sub dlRec_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlRec.ItemDataBound
        If CType(e.Item.FindControl("hfSent_To"), HiddenField).Value <> Session("Username") Then

            CType(e.Item.FindControl("Panel1"), Panel).HorizontalAlign = HorizontalAlign.Right

        End If
    End Sub

    Protected Sub DataList3_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles DataList3.ItemCommand
        If e.CommandName = "btnMessage" Then
            Session("MsgProfile") = Session("Username")
            Session("msgTo") = e.CommandArgument.ToString()
            Server.Transfer("Messaging.aspx?Username=" + e.CommandArgument)
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim user As String = Session("msgto")

        lblUser.Text = user
        
    End Sub
End Class
