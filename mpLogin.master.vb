Imports System.Data
Imports System.Data.OleDb


Partial Class mpLogin
    Inherits System.Web.UI.MasterPage
    Dim conn As OleDbConnection = New OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\dbKommunitz.accdb")

    Protected Sub btnLogin_ServerClick(sender As Object, e As EventArgs) Handles btnLogin.ServerClick
        Dim Username As String
        Dim Password As String
        Try
            Dim da As OleDbDataAdapter
            Dim ds As DataSet
            da = New OleDbDataAdapter("select * from tblUsers where Username='" + txtEmail.Value + "' and Password='" + txtPassword.Value + "'", conn)
            ds = New DataSet
            da.Fill(ds)
            Username = ds.Tables(0).Rows(0)("Username").ToString()
            Password = ds.Tables(0).Rows(0)("Password").ToString()
            If Username <> "" Then
                Session("Username") = Username
            End If
            da.Dispose()
            ds.Dispose()
            Response.Redirect("DemoHome2.aspx")
        Catch ex As Exception
            Try

                Dim da2 As OleDbDataAdapter
                Dim ds2 As DataSet
                da2 = New OleDbDataAdapter("select * from tblAdmin where Admin_Username='" & txtEmail.Value & "' and Password='" & txtPassword.Value & "'", conn)
                ds2 = New DataSet
                da2.Fill(ds2)

                Dim Admin As String = ds2.Tables(0).Rows(0)("Admin_Username").ToString()
                Dim admin_password As String = ds2.Tables(0).Rows(0)("Password").ToString()
                If Admin <> "" Then
                    Session("Username") = Admin
                    da2.Dispose()
                    ds2.Dispose()
                    Response.Redirect("Admin.aspx")
                End If
            Catch ex2 As Exception
                MsgBox("Invalid Username or Password")

                Response.Redirect("login.aspx")
            End Try
        End Try
        Application("Login") = "Login"
        Response.Redirect("Demohome2.aspx")

        Response.Redirect("DemoHome2.aspx?Username=" + Username + "")
    End Sub

    Protected Sub Page_Disposed(sender As Object, e As EventArgs) Handles Me.Disposed
        conn.Close()
    End Sub


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        conn.Open()
    End Sub

End Class

