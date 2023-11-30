
Partial Class User
    Inherits System.Web.UI.Page

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

    Protected Sub DataList2_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles DataList2.ItemCommand
        If e.CommandName = "btnMessage" Then
            Dim mymsg As String = Session("Username")

            Session("msgTo") = e.CommandArgument
            Session("msgProfile") = mymsg
            Server.Transfer("Message.aspx")
        End If
    End Sub
End Class
