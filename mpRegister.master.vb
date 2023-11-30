Imports System.Data
Imports System.Net
Imports System.Net.Mail
Imports System.Configuration
Imports System.Net.Configuration
Imports System.IO
Imports System.Data.OleDb
Partial Class mpRegister
    Inherits System.Web.UI.MasterPage
    Dim conn As OleDbConnection = New OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\dbKommunitz.accdb")
    Protected Sub signup_Click(sender As Object, e As EventArgs) Handles signup.Click
        lblUsername.Text = name.Value
        Dim OTP As String
        Dim random As New Random

        OTP = random.Next(100000, 999999)
        lblOTP.Text = OTP
        Dim cmd As OleDbCommand

        cmd = New OleDbCommand("insert into tblOTP values('" + email.Value + "','" + name.Value + "','" + pass.Value + "'," + OTP + ")", conn)
        'Try
        Dim Smtp_Server As New SmtpClient
        Dim e_mail As New MailMessage()
        Smtp_Server.UseDefaultCredentials = False
        Smtp_Server.Credentials = New Net.NetworkCredential("kunalgolani01@gmail.com", "kunal4google82683wyghmgb")
        Smtp_Server.Port = 587
        Smtp_Server.EnableSsl = True
        Smtp_Server.Host = "smtp.gmail.com"

        Dim Filepath As String = "G:\Kommunitz Kunal\EMail.html"
        Dim str As StreamReader = New StreamReader(Filepath)
        Dim MailText As String = str.ReadToEnd
        str.Close()

        MailText = MailText.Replace("[Username]", name.Value)
        MailText = MailText.Replace("[OTP]", OTP)
        e_mail.IsBodyHtml = True

        e_mail = New MailMessage()
        e_mail.From = New MailAddress("kommunitz1@gmail.com")
        e_mail.To.Add(email.Value)
        e_mail.Subject = "Email Verification"
        e_mail.IsBodyHtml = True
        e_mail.Body = MailText
        Smtp_Server.Send(e_mail)

        'Catch error_t As Exception
        '    MsgBox(error_t.ToString)
        'End Try
        cmd.ExecuteNonQuery()
        cmd.Dispose()
        Response.Redirect("Verification.aspx?Username=" + name.Value + "")
    End Sub

    Protected Sub Page_Disposed(sender As Object, e As EventArgs) Handles Me.Disposed
        conn.Close()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        conn.Open()
        Panel1.Visible = False
    End Sub
End Class

