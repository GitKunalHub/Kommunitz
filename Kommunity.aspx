<%@ Page Title="" Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="Kommunity.aspx.vb" Inherits="Kommunity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <META http-equiv="Page-Enter" content="blendTrans(Duration=0.1)">
<META http-equiv="Page-Exit" content="blendTrans(Duration=0.1)">
    <style>
        @media screen and (min-width: 301px) and (max-width: 1024px) {
  #flex-container { display: none; }   /* hide it elsewhere */
}
    </style>
     <style>
        .flex-container {
    display: flex;
}
      .btn{
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.button1 {
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
}

   body {
   font-size: .875rem;
   background-color: #eef0f2;
}
   .flex-child {
    flex: 1;
    margin-bottom: 200px;
}  

.flex-child:first-child {
    margin-right: 400px;
}

.flex-child:second-child {
    margin-right: 400px;
}

$comment-img-size: 3rem;
$comment-img-size-sm: 1.75rem;

.comment {
   &-img {
      width: $comment-img-size;
      height: $comment-img-size;
   }
      
   &-replies &-img {
      width: $comment-img-size-sm;
      height: $comment-img-size-sm;
   }

    </style>
                             
    <form id="form1" runat="server" >
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
       <center>
        <asp:DataList ID="DataList2" runat="server" DataKeyField="Kommunity_Name" DataSourceID="SqlDataSource2" Width="53%" Style="background-color: Transparent" >
             
            <ItemTemplate>
 
                     <div class="flex-container">
                       
                       
                           <div  style="background-color:transparent; margin-top:50px">
                <asp:Image ID="Image3" class="rounded-circle me-3" style="width:7rem;height:7rem;" runat="server" Height="130px" ImageUrl='<%# Eval("Kommunity_ProfileImg", "{0}") %>' Width="160px" /></a>
                 </div>
            
                          
                              <div style="margin-top:60px">
               <h1><b>   &nbsp;&nbsp;&nbsp; <asp:Label ID="Kommunity_NameLabel" runat="server" Text='<%# Eval("Kommunity_Name") %>' /></b></h1>
                                 
                       
                           
                       
                  <%--     <br />  <br /> --%> &nbsp;&nbsp;&nbsp;<asp:Button ID="btnJoin" runat="server" Text="Join" /><asp:Button ID="btnEdit" runat="server" Text="Edit Profile" Visible="false" />

              
                
                               
              
                 
                       </div> 
                       </div>
                <br />
                
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
         </center>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cnSqlConn %>" SelectCommand="SELECT * FROM [tblKommunity] WHERE ([Kommunity_Name] = @Kommunity_Name)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Kommunity_Name" QueryStringField="Kommunity_Name" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <center>
&nbsp;<asp:DataList ID="DataList1" runat="server" DataKeyField="Post_Ref_ID" DataSourceID="SqlDataSource1" Width="43%">
            <ItemTemplate >
                  <a href='Kommunity.aspx?Kommunity_Name=<%#Eval("Kommunity_Name")%>'style="color: inherit" > 
                <asp:Image ID="Image2" runat="server" BorderStyle="Outset" Height="26px" ImageAlign="Left" ImageUrl="https://i.pinimg.com/originals/ed/a4/4a/eda44a02431fd96480560c51c056c0c4.png" Width="28px" />
                &nbsp; kz⤻<b><asp:Label ID="Kommunity_NameLabel" runat="server" Text='<%# Eval("Kommunity_Name") %>' /></b></a>
            &nbsp;• Posted by: <a href='User.aspx?Username=<%#Eval("Username")%>'style="color: inherit" > 
            <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' /></a> 
            <%--     &nbsp;•
            <asp:Label ID="Posted_OnLabel" runat="server" CssClass="PostedOn" Text='<%# Eval("Posted_On") %>' />
                --%>&nbsp;
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
            </center>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cnSqlConn %>" SelectCommand="SELECT * FROM [tblContent] WHERE ([Kommunity_Name] = @Kommunity_Name)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Kommunity_Name" QueryStringField="Kommunity_Name" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>

