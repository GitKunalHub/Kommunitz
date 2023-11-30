<%@ Page Title="DemoHome2.aspx" Language="VB" Debug="true" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="DemoHome2.aspx.vb" Inherits="DemoHome2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <META http-equiv="Page-Enter" content="blendTrans(Duration=0.1)">
<META http-equiv="Page-Exit" content="blendTrans(Duration=0.1)">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        .flex-container {
    display: flex;
}

.flex-child {
    flex: 1;
    margin-bottom: 0px;
}  

.flex-child:first-child {
    margin-left: 10px;
}
        a {
            color: inherit;
        }

    </style>
    <style>
.vl {
  border-left: 3px grey;
  height: 500px;
}

</style>
    <style>
        @media screen and (min-width: 301px) and (max-width: 987px) {
  #dlSize { width: 95%; }   /* hide it elsewhere */
}
    </style>
 <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <center>
<%--     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>
             --%>
          <br />

            
          


     <a id="lnkCreatePost" href="#" runat="server" onserverclick="lnkCreatePost_ServerClick">
          <asp:Panel ID="Panel3" runat="server" Height="60px" Width="60%" VerticalAlign="Center" HorizontalAlign="Center">
              <br />
              <asp:TextBox ID="TextBox1" runat="server" placeholder="  Create Post" BorderColor="#a9a9a9"></asp:TextBox>
              <br />
                   </asp:Panel>
         </a>
     <asp:Panel ID="pnlCreatePost" runat="server" Visible="false" style="align-items:center" >
          <table style="width: 69%; height: 45px;" border="1">
        <tr>
            <td align="center" style="height: 43px; width: 245px">
                <asp:Button ID="btnPost" runat="server" Height="43px" Width="245px" ForeColor="#a9a9a9" Text="Post" BorderColor="#333333" BorderStyle="None" BackColor="transparent" /></td>
          <%--  <td align="center" style="height: 43px; width: 245px;">
                <asp:Button ID="btnAttachments" runat="server" Height="43px" Width="245px" ForeColor="#a9a9a9" Text="Attachments" BorderColor="#333333" BorderStyle="None" BackColor="transparent" />
            </td>--%>
            <td align="center" style="height: 43px; width: 245px;">
                <asp:Button ID="btnFinalize" runat="server" Height="43px" Width="245px" ForeColor="#a9a9a9" Text="Finalize" BorderColor="#333333" BorderStyle="None" BackColor="transparent" />
            </td>
        </tr>
    </table>    

        <asp:Panel ID="pnlTitle" runat="server">
            <asp:TextBox ID="txtTitle" runat="server" placeholder="Title"></asp:TextBox>
        </asp:Panel>
        
                     <asp:Panel ID="pnlHome" runat="server">
                          <asp:TextBox ID="txtContent" runat="server" placeholder="Content Text (optional)..." TextMode="Multiline" Width="69%"></asp:TextBox>
                    <br /><br />
                          <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="Kommunity_Name" DataValueField="Kommunity_Name">
                          </asp:DropDownList>
                          <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cnSqlConn %>" SelectCommand="SELECT [Kommunity_Name] FROM [tblKommunity]"></asp:SqlDataSource>
                          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.ACE.Sql.12.0;Data Source=|DataDirectory|\dbKommunitz.accdb" ProviderName="<%$ ConnectionStrings:ConnectionString5.ProviderName %>" SelectCommand="SELECT [Kommunity_Name] FROM [tblKommunity]"></asp:SqlDataSource>
                          
                    <br />
    <div>
    
<%--        <link href="filepond/dist/filepond.css" rel="stylesheet" />
        <link href="filepond/dist/filepond.min.css" rel="stylesheet" />
        <style>


                            .filepond--drop-label {
	                            color: #4c4e53;
                            }

                            .filepond--label-action {
	                            text-decoration-color: #babdc0;
                            }

                            .filepond--panel-root {
	                            border-radius: 2em;
	                            background-color: #edf0f4;
	                            height: 1em;
                            }

                            .filepond--item-panel {
	                            background-color: #595e68;
                            }

                            .filepond--drip-blob {
	                            background-color: #7f8a9a;
                            }

                         </style>
        <link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet" />
        <link href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css" rel="stylesheet" />--%>
        <%--<input id="FileUpload2" runat="server" multiple type="file" />--%>
        <asp:FileUpload ID="FileUpload2" runat="server" AllowMultiple="true"></asp:FileUpload>

<%--<script src="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-resize/dist/filepond-plugin-image-resize.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-transform/dist/filepond-plugin-image-transform.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-crop/dist/filepond-plugin-image-crop.js"></script>
<script src="https://unpkg.com/filepond/dist/filepond.js"></script>
<script>
	
    FilePond.registerPlugin(
		FilePondPluginImageCrop,
		FilePondPluginImagePreview,
		FilePondPluginImageResize,
		FilePondPluginImageTransform
	);

    const inputElement = document.querySelector('input[type="file"]');
    const pond = FilePond.create(inputElement, {
        onaddfile: (err, fileItem) => {
            console.log(err, fileItem.getMetadata('resize'));
    },
    onpreparefile: (fileItem, outputFiles) => {
        outputFiles.forEach(output => {
            const img = new Image();
    img.src = URL.createObjectURL(output.file);
    document.body.appendChild(img);
    })
    }
    });
</script>
    --%>
    </div>
                    <br />
                     <asp:Button ID="btnSubmit" runat="server" Text="Post" />
                     </asp:Panel>
     </asp:Panel>
          <br />
        <asp:DataList ID="DataList1" runat="server" Height="43%" Width="43%" DataKeyField="Post_Ref_ID" DataSourceID="SqlDataSource1">
            <ItemTemplate >
                 <a href='Kommunity.aspx?Kommunity_Name=<%#Eval("Kommunity_Name")%>'style="color: inherit" > 
                <asp:Image ID="Image2" runat="server" BorderStyle="Outset" Height="26px" ImageAlign="Left" ImageUrl="https://i.pinimg.com/originals/ed/a4/4a/eda44a02431fd96480560c51c056c0c4.png" Width="28px" />
                &nbsp; kz⤻<b><asp:Label ID="Kommunity_NameLabel" runat="server" Text='<%# Eval("Kommunity_Name") %>' /></b></a>
            &nbsp;• Posted by: <a href='User.aspx?Username=<%#Eval("Username")%>'style="color: inherit" > 
            <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' /></a> 
                 &nbsp;•
            <asp:Label ID="Posted_OnLabel" runat="server" CssClass="PostedOn" Text='<%# Eval("Posted_On") %>' />
                &nbsp;
                &nbsp;
                <div class="menu-nav">
                 <hr style="height:2px;border-width:0;color:gray;background-color:gray">
                &nbsp; •&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href='post.aspx?post_ref_id=<%#eval("post_ref_id")%>' style="color: inherit">
            <asp:Label ID="Content_TitleLabel" runat="server" Text='<%# Eval("Content_Title")%>' Font-Bold="True" Font-Italic="False" Font-Size="X-Large"  />
            <hr style="height:2px;border-width:0;color:gray;background-color:gray">
               &nbsp; ╰┈➤&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Content_TextLabel" runat="server" Text='<%# Eval("Content_Text") %>' Font-Bold="False" Font-Italic="False" Font-Size="X-Large" />
            <asp:PlaceHolder ID="PlaceHolder3" runat="server">
                <br />
                <asp:HiddenField ID="HiddenField3" runat="server" value='<%# Eval("Content_Image")%>'/>
             <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Content_Image")%>' />
            <hr style="height:2px;border-width:0;color:gray;background-color:gray">    
            </asp:PlaceHolder>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server">
                <asp:HiddenField ID="HiddenField1" runat="server"  Value='<%#Eval("Content_Audio")%>' />
           <audio id="Audio1" height="20" width="100"   controls>
               <source src="<%#Eval("Content_Audio")%>" type="audio/mp3" />
               <source src="<%#Eval("Content_Audio")%>" type="audio/mp4"/>
               <source src="<%#Eval("Content_Audio")%>" type="audio/ogg" />
               <source src="<%#Eval("Content_Audio")%>" type="audio/vnd.rn-realaudio" />
               <source src="<%#Eval("Content_Audio")%>" type="audio/vnd.wave"/>
               <source src="<%#Eval("Content_Audio")%>" type="audio/vorbis" />
               <source src="<%#Eval("Content_Audio")%>" type="audio/x-ms-wma" />

           </audio>
                <hr style="height:2px;border-width:0;color:gray;background-color:gray">
                </asp:PlaceHolder>
            <asp:PlaceHolder ID="PlaceHolder2" runat="server">
                <asp:HiddenField ID="HiddenField2" runat="server" value='<%#Eval("Content_Video")%>'/>
           <video id="Video1" height="500" width="500" controls >
               <source src="<%#Eval("Content_Video")%>" type="video/mp4" />
                 <source src="<%#Eval("Content_Video")%>" type="video/3gpp" />
                 <source src="<%#Eval("Content_Video")%>" type="video/m4v" />
                 <source src="<%#Eval("Content_Video")%>" type="video/mpeg" />
                 <source src="<%#Eval("Content_Video")%>" type="video/ogg" />
                 <source src="<%#Eval("Content_Video")%>" type="video/quicktime" />
               <source src="<%#Eval("Content_Video")%>" type="video/webm" />
                 <source src="<%#Eval("Content_Video")%>" type="video/x-ms-wmv" />
           </video>
                </asp:PlaceHolder>
                    </center>
                </a>
                   			<table class="table table-bordered" style="background-color:inherit">
			<tbody>
				<tr ng-repeat="member in members">
					<td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="lblComments" EventName="click" />
                            </Triggers>
                            <ContentTemplate>
                        <asp:Button ID="btnUp" runat="server" CssClass="btn btn-primary btn-sm" Text=" ▲ " BackColor="Transparent" style="color:initial;border:initial" CommandName="up" CommandArgument='<%#Eval("Post_Ref_ID")%>'></asp:Button>
                        &nbsp;
                        <asp:Label ID="Vote" runat="server" style="color:initial" Text='<%#Eval("Upvote") %>'>'></asp:Label>
                                &nbsp;
                        <asp:Label ID="lblPostRefID" runat="server" Visible="false" Text='<%#Eval("Post_Ref_ID") %>'>'></asp:Label>
                        &nbsp; 
                        <asp:Button ID="btnDown" runat="server" CssClass="btn btn-danger btn-sm" Text=" ▼ " BackColor="Transparent" style="color:initial;border:initial" CommandName="down" CommandArgument='<%#Eval("Post_Ref_ID")%>'></asp:Button>
                        
                        <asp:Button ID="lblComments" BackColor="Transparent" BorderColor="Transparent" ForeColor="Black" runat="server" Text="Comments" CommandName="btnComments"></asp:Button>  
                        </ContentTemplate>
                        </asp:UpdatePanel>
                        
                                </td>
			</tr>
			</tbody>
		</table>
                </div>
             <br />
        </ItemTemplate> 
        </asp:DataList>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cnSqlConn %>" SelectCommand="SELECT * FROM [tblContent]"></asp:SqlDataSource>
           
<%--             </ContentTemplate>
     </asp:UpdatePanel>
        --%>
</center>
     
    </form>     
        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.ACE.Sql.12.0;Data Source=|DataDirectory|\dbKommunitz.accdb" ProviderName="System.Data.Sql" SelectCommand="SELECT * FROM [tblContent]"></asp:SqlDataSource>--%>
</asp:Content>

