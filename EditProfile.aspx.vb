Imports System.Data
Imports System.Data.OleDb
Imports System.Data.OleDbClient

Partial Class EditProfile
    Inherits System.Web.UI.Page
    Dim conn As OleDbConnection = New OleDbConnection("Data Source=OleDb8003.site4now.net;Initial Catalog=db_a8f072_dbkommunitz;User Id=db_a8f072_dbkommunitz_admin;Password=kunal4db")

    Protected Sub Page_Disposed(sender As Object, e As EventArgs) Handles Me.Disposed
        conn.Close()
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        conn.Open()
        If Session("Username") = "" Then
            MsgBox("Kindly Login First...")
            Response.Redirect("DemoHome2.aspx")
        End If
    End Sub

    Protected Sub DataList1_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles DataList1.ItemCommand

        If e.CommandName = "Upload" Then
            Dim Username As String = Request.QueryString("Username")
            If CType(e.Item.FindControl("FileUpload1"), FileUpload).HasFile = True Then
                CType(e.Item.FindControl("FileUpload1"), FileUpload).SaveAs("K:\My Drive\Komunitz Cera\User Profile_Img\" + CType(e.Item.FindControl("FileUpload1"), FileUpload).FileName)
                Dim img As String = "User Profile_Img\" + CType(e.Item.FindControl("FileUpload1"), FileUpload).FileName + ""
                Dim Cmd As OleDbCommand
                Cmd = New OleDbCommand("Update tblUser_Profile set Profile_Img='" & img & "'", conn)
                Cmd.ExecuteNonQuery()
                Cmd.Dispose()
                Response.Redirect("EditProfile.aspx?Username=" + Username)
            Else
                MsgBox("Please Select Image First")
            End If
        End If


        If e.CommandName = "Save" Then
            Dim Username As String = Request.QueryString("Username")
            Dim fn As String = CType(e.Item.FindControl("fn"), TextBox).Text
            Dim ln As String = CType(e.Item.FindControl("ln"), TextBox).Text
            Dim Contact As String = Val(CType(e.Item.FindControl("Contact"), TextBox).Text)
            Dim bd As String = CType(e.Item.FindControl("bd"), TextBox).Text
            Dim Cmd As OleDbCommand
            Cmd = New OleDbCommand("Update tblUser_Profile set First_Name='" & fn & "',Last_Name='" & ln & "',Contact=" & Contact & ",DOB='" & bd & "' where Username = '" & Username & "'", conn)
            Cmd.ExecuteNonQuery()
            Cmd.Dispose()
        End If
    End Sub
End Class
