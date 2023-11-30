<%@ Page Title="" Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="User.aspx.vb" Inherits="User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .float-container {
  
    padding: 20px;
}

.float-child {
  
    float: left;
    padding: 20px;
   
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

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <center>
        <asp:DataList ID="DataList2" Height="90%" Width="90%" runat="server" HorizontalAlign="Justify"   DataKeyField="Username" DataSourceID="SqlDataSource2" >
                      <ItemTemplate>
                         
                              <div class="float-container ">
                                  <div class="float-child ">
                          <asp:Image ID="Image3" class="rounded-circle me-3" style="width:9rem; height:9rem;"  runat="server" ImageUrl='<%# Eval("Profile_Img") %>' />
                          <br />
                             
                                      </div>
                              <div class="float-container ">
                                  <br />

                         <b><h1>
                             <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' /></h1></b>
                         
                          First_Name:
                          <asp:Label ID="First_NameLabel" runat="server" Text='<%# Eval("First_Name") %>' />
                          <br />
                          Last_Name:
                          <asp:Label ID="Last_NameLabel" runat="server" Text='<%# Eval("Last_Name") %>' />
                          <br />
                          Contact:
                          <asp:Label ID="ContactLabel" runat="server" Text='<%# Eval("Contact") %>' />
                          <br />
                                  <asp:Button ID='btnMessage' runat="server" CommandArgument='<%# Eval("Username") %>' CommandName="btnMessage" Text="Message" />
                          <br />
                         
                         
                                   </div>
                                  </div>

                             
                      </ItemTemplate>
                </asp:DataList>
      <br />
            <br />
        <asp:DataList ID="DataList1" runat="server" DataKeyField="Post_Ref_ID" DataSourceID="SqlDataSource1"  Width="55%" Height="55%">
            
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
                
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cnSqlConn %>" SelectCommand="SELECT * FROM [tblContent] WHERE ([Username] = @Username)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Username" QueryStringField="Username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
                   <br />
            
                  
                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cnSqlConn %>" SelectCommand="SELECT * FROM [tblUser_Profile] WHERE ([Username] = @Username)">
                      <SelectParameters>
                          <asp:QueryStringParameter Name="Username" QueryStringField="Username" Type="String" />
                      </SelectParameters>
                  </asp:SqlDataSource>
            </center>
    </form>
</asp:Content>

