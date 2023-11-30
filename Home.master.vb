Imports System.Data
Imports System.Data.OleDb
Partial Class Home
    Inherits System.Web.UI.MasterPage
    Dim conn As OleDbConnection = New OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\dbKommunitz.accdb")

    Protected Sub Page_Disposed(sender As Object, e As EventArgs) Handles Me.Disposed
        conn.Close()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim Username As String = Session("Username")
        Label2.Text = Username
        conn.Open()
        Try

            Dim da2 As OleDbDataAdapter
            Dim ds2 As DataSet
            da2 = New OleDbDataAdapter("select * from tblAdmin where Admin_Username='" & Username & "'", conn)
            ds2 = New DataSet
            da2.Fill(ds2)

            Dim Admin As String = ds2.Tables(0).Rows(0)("Admin_Username").ToString()
            If Admin = Username Then
                Application("checked") = "true"
            End If
            da2.Dispose()
            ds2.Dispose()
        Catch ex2 As Exception

        End Try


    End Sub

    Protected Sub Edit_ServerClick(sender As Object, e As EventArgs) Handles Edit.ServerClick
        Dim str As String = Session("Username")
        Response.Redirect("EditProfile.aspx?Username=" + str)
    End Sub
End Class

