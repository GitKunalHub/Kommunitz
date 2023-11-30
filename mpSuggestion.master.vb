Imports System.Data.SqlClient
Imports System.Data
Partial Class mpSuggestion
    Inherits System.Web.UI.MasterPage
    Dim KommunityName As String
    Dim conn As SqlConnection = New SqlConnection("Data Source=SQL8003.site4now.net;Initial Catalog=db_a8f072_dbkommunitz;User Id=db_a8f072_dbkommunitz_admin;Password=kunal4db")

    Protected Sub dlSports_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles dlSports.ItemCommand

        Dim User As String = Session("Username")
        If e.CommandName = "btnJoin" Then
            Dim cmd As SqlCommand = New SqlCommand("insert into tblKommunities_Followed values('" & e.CommandArgument & "','" & User & "')", conn)
            cmd.ExecuteNonQuery()
            cmd.Dispose()

            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            Response.Redirect("SelectInterest.aspx#Sports")
        End If
    End Sub

    Protected Sub dlSports_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlSports.ItemDataBound
        Try
            Dim User As String = Session("Username")
            Dim da As SqlDataAdapter = New SqlDataAdapter("select * from tblKommunities_Followed where Username='" & User & "' and Kommunity_Name='" & CType(e.Item.FindControl("Label1"), Label).Text & "'", conn)
            Dim ds As DataSet = New DataSet
            da.Fill(ds)
            Dim kn As String = ds.Tables(0).Rows(0)("Kommunity_Name").ToString()
            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            da.Dispose()
            ds.Dispose()


        Catch ex As Exception

        End Try
    End Sub


    Protected Sub dlAndroid_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles dlAndroid.ItemCommand

        Dim User As String = Session("Username")
        If e.CommandName = "btnJoin" Then
            Dim cmd As SqlCommand = New SqlCommand("insert into tblKommunities_Followed values('" & e.CommandArgument & "','" & User & "')", conn)
            cmd.ExecuteNonQuery()
            cmd.Dispose()

            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            Response.Redirect("SelectInterest.aspx#Android")
        End If
    End Sub

    Protected Sub dlAnimals_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles dlAnimals.ItemCommand

        Dim User As String = Session("Username")
        If e.CommandName = "btnJoin" Then
            Dim cmd As SqlCommand = New SqlCommand("insert into tblKommunities_Followed values('" & e.CommandArgument & "','" & User & "')", conn)
            cmd.ExecuteNonQuery()
            cmd.Dispose()

            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            Response.Redirect("SelectInterest.aspx#Animals")
        End If
    End Sub

    Protected Sub dlArt_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles dlArt.ItemCommand

        Dim User As String = Session("Username")
        If e.CommandName = "btnJoin" Then
            Dim cmd As SqlCommand = New SqlCommand("insert into tblKommunities_Followed values('" & e.CommandArgument & "','" & User & "')", conn)
            cmd.ExecuteNonQuery()
            cmd.Dispose()

            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            Response.Redirect("SelectInterest.aspx#Art")
        End If
    End Sub

    Protected Sub dlBeauty_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles dlBeauty.ItemCommand

        Dim User As String = Session("Username")
        If e.CommandName = "btnJoin" Then
            Dim cmd As SqlCommand = New SqlCommand("insert into tblKommunities_Followed values('" & e.CommandArgument & "','" & User & "')", conn)
            cmd.ExecuteNonQuery()
            cmd.Dispose()

            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            Response.Redirect("SelectInterest.aspx#Beauty")
        End If
    End Sub

    Protected Sub dlBollywood_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles dlBollywood.ItemCommand

        Dim User As String = Session("Username")
        If e.CommandName = "btnJoin" Then
            Dim cmd As SqlCommand = New SqlCommand("insert into tblKommunities_Followed values('" & e.CommandArgument & "','" & User & "')", conn)
            cmd.ExecuteNonQuery()
            cmd.Dispose()

            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            Response.Redirect("SelectInterest.aspx#Bollywood")
        End If
    End Sub

    Protected Sub dlCovid_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles dlCovid.ItemCommand

        Dim User As String = Session("Username")
        If e.CommandName = "btnJoin" Then
            Dim cmd As SqlCommand = New SqlCommand("insert into tblKommunities_Followed values('" & e.CommandArgument & "','" & User & "')", conn)
            cmd.ExecuteNonQuery()
            cmd.Dispose()

            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            Response.Redirect("SelectInterest.aspx#Covid")
        End If
    End Sub

    Protected Sub dlFunny_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles dlFunny.ItemCommand

        Dim User As String = Session("Username")
        If e.CommandName = "btnJoin" Then
            Dim cmd As SqlCommand = New SqlCommand("insert into tblKommunities_Followed values('" & e.CommandArgument & "','" & User & "')", conn)
            cmd.ExecuteNonQuery()

            cmd.Dispose()

            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            Response.Redirect("SelectInterest.aspx#Funny")
        End If
    End Sub

    Protected Sub dlGaming_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles dlGaming.ItemCommand

        Dim User As String = Session("Username")
        If e.CommandName = "btnJoin" Then
            Dim cmd As SqlCommand = New SqlCommand("insert into tblKommunities_Followed values('" & e.CommandArgument & "','" & User & "')", conn)
            cmd.ExecuteNonQuery()

            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            cmd.Dispose()

            Response.Redirect("SelectInterest.aspx#Gaming")
        End If
    End Sub

    Protected Sub dlHorror_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles dlHorror.ItemCommand

        Dim User As String = Session("Username")
        If e.CommandName = "btnJoin" Then
            Dim cmd As SqlCommand = New SqlCommand("insert into tblKommunities_Followed values('" & e.CommandArgument & "','" & User & "')", conn)
            cmd.ExecuteNonQuery()

            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            cmd.Dispose()

            Response.Redirect("SelectInterest.aspx#Horror")
        End If
    End Sub

    Protected Sub dlManga_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles dlManga.ItemCommand

        Dim User As String = Session("Username")

        If e.CommandName = "btnJoin" Then
            Dim cmd As SqlCommand = New SqlCommand("insert into tblKommunities_Followed values('" & e.CommandArgument & "','" & User & "')", conn)
            cmd.ExecuteNonQuery()

            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            cmd.Dispose()

            Response.Redirect("SelectInterest.aspx#Manga")
        End If
    End Sub

    Protected Sub dlMusic_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles dlMusic.ItemCommand

        Dim User As String = Session("Username")
        If e.CommandName = "btnJoin" Then
            Dim cmd As SqlCommand = New SqlCommand("insert into tblKommunities_Followed values('" & e.CommandArgument & "','" & User & "')", conn)
            cmd.ExecuteNonQuery()

            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            cmd.Dispose()

            Response.Redirect("SelectInterest.aspx#Music")
        End If
    End Sub

    Protected Sub dlSciFi_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles dlSciFi.ItemCommand

        Dim User As String = Session("Username")
        If e.CommandName = "btnJoin" Then
            Dim cmd As SqlCommand = New SqlCommand("insert into tblKommunities_Followed values('" & e.CommandArgument & "','" & User & "')", conn)
            cmd.ExecuteNonQuery()

            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            cmd.Dispose()

            Response.Redirect("SelectInterest.aspx#SciFi")
        End If
    End Sub

    Protected Sub dlSpace_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles dlSpace.ItemCommand

        Dim User As String = Session("Username")
        If e.CommandName = "btnJoin" Then
            Dim cmd As SqlCommand = New SqlCommand("insert into tblKommunities_Followed values('" & e.CommandArgument & "','" & User & "')", conn)
            cmd.ExecuteNonQuery()

            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            cmd.Dispose()

            Response.Redirect("SelectInterest.aspx#Space")
        End If
    End Sub

    Protected Sub dlTechnology_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles dlTechnology.ItemCommand

        Dim User As String = Session("Username")
        If e.CommandName = "btnJoin" Then
            Dim cmd As SqlCommand = New SqlCommand("insert into tblKommunities_Followed values('" & e.CommandArgument & "','" & User & "')", conn)
            cmd.ExecuteNonQuery()

            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            cmd.Dispose()

            Response.Redirect("SelectInterest.aspx#Technology")
        End If
    End Sub

    Protected Sub dlTips_ItemCommand(source As Object, e As DataListCommandEventArgs) Handles dlTips.ItemCommand

        Dim User As String = Session("Username")
        If e.CommandName = "btnJoin" Then
            Dim cmd As SqlCommand = New SqlCommand("insert into tblKommunities_Followed values('" & e.CommandArgument & "','" & User & "')", conn)
            cmd.ExecuteNonQuery()

            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            cmd.Dispose()

            Response.Redirect("SelectInterest.aspx#Tips")
        End If
    End Sub

    Protected Sub dlAndroid_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlAndroid.ItemDataBound
        Try
            Dim User As String = Session("Username")
            Dim da As SqlDataAdapter = New SqlDataAdapter("select * from tblKommunities_Followed where Username='" & User & "' and Kommunity_Name='" & CType(e.Item.FindControl("Label1"), Label).Text & "'", conn)
            Dim ds As DataSet = New DataSet
            da.Fill(ds)
            Dim kn As String = ds.Tables(0).Rows(0)("Kommunity_Name").ToString()
            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            da.Dispose()
            ds.Dispose()

        Catch ex As Exception

        End Try

    End Sub

    Protected Sub dlAnimals_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlAnimals.ItemDataBound
        Try
            Dim User As String = Session("Username")
            Dim da As SqlDataAdapter = New SqlDataAdapter("select * from tblKommunities_Followed where Username='" & User & "' and Kommunity_Name='" & CType(e.Item.FindControl("Label1"), Label).Text & "'", conn)
            Dim ds As DataSet = New DataSet
            da.Fill(ds)
            Dim kn As String = ds.Tables(0).Rows(0)("Kommunity_Name").ToString()
            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            da.Dispose()
            ds.Dispose()

        Catch ex As Exception

        End Try

    End Sub

    Protected Sub dlArt_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlArt.ItemDataBound
        Try
            Dim User As String = Session("Username")



            Dim da As SqlDataAdapter = New SqlDataAdapter("select * from tblKommunities_Followed where Username='" & User & "' and Kommunity_Name='" & CType(e.Item.FindControl("Label1"), Label).Text & "'", conn)
            Dim ds As DataSet = New DataSet
            da.Fill(ds)
            Dim kn As String = ds.Tables(0).Rows(0)("Kommunity_Name").ToString()
            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            da.Dispose()
            ds.Dispose()

        Catch ex As Exception

        End Try

    End Sub

    Protected Sub dlBeauty_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlBeauty.ItemDataBound
        Try
            Dim User As String = Session("Username")
            Dim da As SqlDataAdapter = New SqlDataAdapter("select * from tblKommunities_Followed where Username='" & User & "' and Kommunity_Name='" & CType(e.Item.FindControl("Label1"), Label).Text & "'", conn)
            Dim ds As DataSet = New DataSet
            da.Fill(ds)
            Dim kn As String = ds.Tables(0).Rows(0)("Kommunity_Name").ToString()
            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            da.Dispose()
            ds.Dispose()

        Catch ex As Exception

        End Try

    End Sub

    Protected Sub dlBollywood_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlBollywood.ItemDataBound
        Try
            Dim User As String = Session("Username")
            Dim da As SqlDataAdapter = New SqlDataAdapter("select * from tblKommunities_Followed where Username='" & User & "' and Kommunity_Name='" & CType(e.Item.FindControl("Label1"), Label).Text & "'", conn)
            Dim ds As DataSet = New DataSet
            da.Fill(ds)
            Dim kn As String = ds.Tables(0).Rows(0)("Kommunity_Name").ToString()
            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            da.Dispose()
            ds.Dispose()

        Catch ex As Exception

        End Try

    End Sub

    Protected Sub dlCovid_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlCovid.ItemDataBound
        Try
            Dim User As String = Session("Username")
            Dim da As SqlDataAdapter = New SqlDataAdapter("select * from tblKommunities_Followed where Username='" & User & "' and Kommunity_Name='" & CType(e.Item.FindControl("Label1"), Label).Text & "'", conn)
            Dim ds As DataSet = New DataSet
            da.Fill(ds)
            Dim kn As String = ds.Tables(0).Rows(0)("Kommunity_Name").ToString()
            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            da.Dispose()
            ds.Dispose()


        Catch ex As Exception

        End Try

    End Sub

    Protected Sub dlFunny_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlFunny.ItemDataBound
        Try
            Dim User As String = Session("Username")

            Dim da As SqlDataAdapter = New SqlDataAdapter("select * from tblKommunities_Followed where Username='" & User & "' and Kommunity_Name='" & CType(e.Item.FindControl("Label1"), Label).Text & "'", conn)
            Dim ds As DataSet = New DataSet
            da.Fill(ds)
            Dim kn As String = ds.Tables(0).Rows(0)("Kommunity_Name").ToString()
            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            da.Dispose()
            ds.Dispose()


        Catch ex As Exception

        End Try

    End Sub

    Protected Sub dlGaming_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlGaming.ItemDataBound
        Try
            Dim User As String = Session("Username")

            Dim da As SqlDataAdapter = New SqlDataAdapter("select * from tblKommunities_Followed where Username='" & User & "' and Kommunity_Name='" & CType(e.Item.FindControl("Label1"), Label).Text & "'", conn)
            Dim ds As DataSet = New DataSet
            da.Fill(ds)
            Dim kn As String = ds.Tables(0).Rows(0)("Kommunity_Name").ToString()
            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            da.Dispose()
            ds.Dispose()


        Catch ex As Exception

        End Try

    End Sub

    Protected Sub dlHorror_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlHorror.ItemDataBound
        Try
            Dim User As String = Session("Username")
            Dim da As SqlDataAdapter = New SqlDataAdapter("select * from tblKommunities_Followed where Username='" & User & "' and Kommunity_Name='" & CType(e.Item.FindControl("Label1"), Label).Text & "'", conn)
            Dim ds As DataSet = New DataSet
            da.Fill(ds)
            Dim kn As String = ds.Tables(0).Rows(0)("Kommunity_Name").ToString()
            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            da.Dispose()
            ds.Dispose()

        Catch ex As Exception

        End Try

    End Sub

    Protected Sub dlManga_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlManga.ItemDataBound
        Try
            Dim User As String = Session("Username")
            Dim da As SqlDataAdapter = New SqlDataAdapter("select * from tblKommunities_Followed where Username='" & User & "' and Kommunity_Name='" & CType(e.Item.FindControl("Label1"), Label).Text & "'", conn)
            Dim ds As DataSet = New DataSet
            da.Fill(ds)
            Dim kn As String = ds.Tables(0).Rows(0)("Kommunity_Name").ToString()
            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            da.Dispose()
            ds.Dispose()


        Catch ex As Exception

        End Try

    End Sub

    Protected Sub dlMusic_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlMusic.ItemDataBound
        Try
            Dim User As String = Session("Username")
            Dim da As SqlDataAdapter = New SqlDataAdapter("select * from tblKommunities_Followed where Username='" & User & "' and Kommunity_Name='" & CType(e.Item.FindControl("Label1"), Label).Text & "'", conn)
            Dim ds As DataSet = New DataSet
            da.Fill(ds)
            Dim kn As String = ds.Tables(0).Rows(0)("Kommunity_Name").ToString()
            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            da.Dispose()
            ds.Dispose()


        Catch ex As Exception

        End Try

    End Sub

    Protected Sub dlSciFi_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlSciFi.ItemDataBound
        Try
            Dim User As String = Session("Username")
            Dim da As SqlDataAdapter = New SqlDataAdapter("select * from tblKommunities_Followed where Username='" & User & "' and Kommunity_Name='" & CType(e.Item.FindControl("Label1"), Label).Text & "'", conn)
            Dim ds As DataSet = New DataSet
            da.Fill(ds)
            Dim kn As String = ds.Tables(0).Rows(0)("Kommunity_Name").ToString()
            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            da.Dispose()
            ds.Dispose()


        Catch ex As Exception

        End Try

    End Sub

    Protected Sub dlSpace_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlSpace.ItemDataBound
        Try
            Dim User As String = Session("Username")
            Dim da As SqlDataAdapter = New SqlDataAdapter("select * from tblKommunities_Followed where Username='" & User & "' and Kommunity_Name='" & CType(e.Item.FindControl("Label1"), Label).Text & "'", conn)
            Dim ds As DataSet = New DataSet
            da.Fill(ds)
            Dim kn As String = ds.Tables(0).Rows(0)("Kommunity_Name").ToString()
            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            da.Dispose()
            ds.Dispose()


        Catch ex As Exception

        End Try

    End Sub

    Protected Sub dlTechnology_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlTechnology.ItemDataBound
        Try
            Dim User As String = Session("Username")



            Dim da As SqlDataAdapter = New SqlDataAdapter("select * from tblKommunities_Followed where Username='" & User & "' and Kommunity_Name='" & CType(e.Item.FindControl("Label1"), Label).Text & "'", conn)
            Dim ds As DataSet = New DataSet
            da.Fill(ds)
            Dim kn As String = ds.Tables(0).Rows(0)("Kommunity_Name").ToString()
            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            da.Dispose()
            ds.Dispose()


        Catch ex As Exception

        End Try

    End Sub

    Protected Sub dlTips_ItemDataBound(sender As Object, e As DataListItemEventArgs) Handles dlTips.ItemDataBound
        Try
            Dim User As String = Session("Username")



            Dim da As SqlDataAdapter = New SqlDataAdapter("select * from tblKommunities_Followed where Username='" & User & "' and Kommunity_Name='" & CType(e.Item.FindControl("Label1"), Label).Text & "'", conn)
            Dim ds As DataSet = New DataSet
            da.Fill(ds)
            Dim kn As String = ds.Tables(0).Rows(0)("Kommunity_Name").ToString()
            CType(e.Item.FindControl("btnJoin"), Button).Text = "Joined"
            da.Dispose()
            ds.Dispose()


        Catch ex As Exception

        End Try

    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim User As String = Session("Username")
        Dim Username As String = Session("Username")
        Server.Transfer("DemoHome2.aspx")
    End Sub

    Protected Sub Page_Disposed(sender As Object, e As EventArgs) Handles Me.Disposed
        conn.Close()
    End Sub

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        conn.Open()
    End Sub
End Class