Imports System.Data.SqlClient
Imports System.Data

Partial Class mpVerification
    Inherits System.Web.UI.MasterPage
    Dim conn As SqlConnection = New SqlConnection("Data Source=SQL8003.site4now.net;Initial Catalog=db_a8f072_dbkommunitz;User Id=db_a8f072_dbkommunitz_admin;Password=kunal4db")

    Protected Sub btnVerify_ServerClick(sender As Object, e As EventArgs) Handles btnVerify.ServerClick
        Dim Username As String = Request.QueryString("Username")
        Dim da As SqlDataAdapter
        Dim ds As DataSet
        da = New SqlDataAdapter("select * from tblOTP where Username='" + Username + "'", conn)
        ds = New DataSet
        da.Fill(ds)
        Dim OTP As String = ds.Tables(0).Rows(0)("OTP").ToString()
        Dim UserMail As String = ds.Tables(0).Rows(0)("Mail").ToString
        Dim Password As String = ds.Tables(0).Rows(0)("Password").ToString
        If IsPostBack Then
            Dim str1 As String = Request.Form("digit1")
            Dim str2 As String = Request.Form("digit2")
            Dim str3 As String = Request.Form("digit3")
            Dim str4 As String = Request.Form("digit4")
            Dim str5 As String = Request.Form("digit5")
            Dim str6 As String = Request.Form("digit6")

            Dim OTP2 As String = "" + str1 + "" + str2 + "" + str3 + "" + str4 + "" + str5 + "" + str6 + ""

            If OTP = OTP2 Then
                Dim cmd As SqlCommand
                cmd = New SqlCommand("insert into tblUsers values('" + UserMail + "','" + Username + "','" + Password + "','" + OTP + "')", conn)
                cmd.ExecuteNonQuery()
                cmd.Dispose()
                Dim cmd2 As SqlCommand
                cmd2 = New SqlCommand("delete from tblOTP where OTP=" + OTP + "", conn)
                cmd2.ExecuteNonQuery()
                cmd2.Dispose()
                Dim cmd3 As SqlCommand
                cmd3 = New SqlCommand("insert into tblUser_Profile(Username) values('" + Username + "')", conn)
                cmd3.ExecuteNonQuery()
                cmd3.Dispose()
                Session("Username") = Username
                Application("Verify") = "Verification"
                Response.Redirect("SelectInterest.aspx")
            Else
                MsgBox("Invalid OTP.")
            End If
        End If
        da.Dispose()
        ds.Dispose()
    End Sub

    Protected Sub Page_Disposed(sender As Object, e As EventArgs) Handles Me.Disposed
        conn.Close()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        conn.Open()
    End Sub
End Class

