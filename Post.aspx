    <%@ Page Title="" Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="Post.aspx.vb" Inherits="Post" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <META http-equiv="Page-Enter" content="blendTrans(Duration=0.01)">
<META http-equiv="Page-Exit" content="blendTrans(Duration=0.01)">
    <style>
        @media screen and (min-width: 301px) and (max-width: 1024px) {
  #dvContent { width: 580px; }   /* hide it elsewhere */
}
    </style>
        <style>
        @media screen and (min-width: 301px) and (max-width: 1024px) {
  #divComment { width: 55%; }   /* hide it elsewhere */
}
    </style>
    <style>
    <style>

      body {
   font-size: .875rem;
   background-color: #eef0f2;
}
       .flex-container {
    display: flex;
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
   btn {
  background: none!important;
  border: none;
  padding: 0!important;
  /*optional
  font-family: arial, sans-serif;
  input has OS specific font-family
  color: #069;
  text-decoration: underline;
  cursor: pointer;
}*/
}
    </style>
  
        <form id="form1" runat="server">
            <center>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <%--<div>
                <asp:Timer ID="Timer1" OnTick="Timer1_Tick" Interval="20000" runat="server"></asp:Timer>
            </div>--%>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
          <div id="dvContent">
            <asp:DataList ID="dlPost" runat="server" Height="60%" Width="60%" DataKeyField="Post_Ref_ID" DataSourceID="sqlPost">

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
                </a>
                   			<table class="table table-bordered" style="background-color:inherit">
			<tbody>
				<tr ng-repeat="member in members">
					<td>

                        <asp:Button ID="btnUp" runat="server" CssClass="btn btn-primary btn-sm" Text=" ▲ " BackColor="Transparent" style="color:inherit" CommandName="up" CommandArgument='<%#Eval("Post_Ref_ID")%>'></asp:Button>
                        &nbsp;
                        <asp:Label ID="Vote" runat="server" Text='<%#Eval("Upvote") %>'>'></asp:Label>
                        &nbsp; 
                        <asp:Button ID="btnDown" runat="server" CssClass="btn btn-danger btn-sm" Text=" ▼ " BackColor="Transparent" style="color:inherit" CommandName="down" CommandArgument='<%#Eval("Post_Ref_ID")%>'></asp:Button>
                        </td>
			</tr>
			</tbody>
		</table>
                </div>
             <br />
        </ItemTemplate>

        </asp:DataList>
        </div>       
            <asp:SqlDataSource ID="sqlPost" runat="server" ConnectionString="<%$ ConnectionStrings:cnSqlConn %>" SelectCommand="SELECT * FROM [tblContent] WHERE ([Post_Ref_ID] = @Post_Ref_ID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Post_Ref_ID" QueryStringField="Post_Ref_ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Panel ID="Panel3" runat="server" Width="60%" Height="60%"  >
           <%--<div class="bg-white rounded-3 shadow-sm p-4 mb-4"  >--%>
         <!-- New Comment //-->
         <div class="d-flex">
            <img class="rounded-circle me-3"
                 style="width:3rem;height:3rem;"
                 src="https://via.placeholder.com/128/fe669e/ffcbde.png?text=S" />
            <div class="flex-grow-1">
               <div class="hstack gap-2 mb-1" style="margin-top:10px">
                  <a href="#" class="fw-bold link-dark" style="margin-left: 10px">Studio KonKon</a>
               </div>
               <div class="form-floating mb-3">
                  <textarea class="form-control w-100"
                            placeholder="Leave a comment here"
                            id="mycomment" runat="server" 
                            style="height:7rem; margin-top:45px "  ></textarea>
                  <%--<label for="my-comment">Leave a comment here</label>--%>
               </div>
               <div class="hstack justify-content-end gap-2">
                  <button class="btn btn-sm btn-link link-secondary text-uppercase">cancel</button>
                   <asp:Button ID="btnComment" runat="server" CssClass="btn btn-sm btn-primary text-uppercase" Text="Comment"></asp:Button>
                  <%--<button class="btn btn-sm btn-primary text-uppercase" id="btnComment" runat="server" onserverclick="btnComment_ServerClick" >comment</button>--%>
               </div>
            </div>
         </div>
<%--      </div>--%>
  </asp:Panel>
        <br />
        <div id="divComment">
        <asp:DataList ID="dlComment" runat="server" DataKeyField="Comment_ID" DataSourceID="sqlComment" >
            <ItemTemplate>
              
                 <div class="d-flex comment">
                  <img class="rounded-circle comment-img"
                       style="width:3rem;height:3rem;"
                       src="https://via.placeholder.com/128/fe669e/ffcbde.png?text=S" />
                  <div class="flex-grow-1 ms-3">
                     <div class="mb-1"><a href="#" class="fw-bold link-dark me-1"><asp:Label ID="Label1" runat="server" Text='<%# Eval("Username")%>' /></a> <span class="text-muted text-nowrap"><asp:Label ID="Comment_DateLabel" runat="server" Text='<%# Eval("Comment_Date")%>' /></span></div>
                     <div class="mb-2">
                        <asp:HiddenField ID="HiddenField4" runat="server" Value='<%#Eval("Replies")%>' />
                            <asp:HiddenField ID="HiddenField5" runat="server" Value='<%# Eval("Comment_ID") %>' />
                           <asp:HiddenField ID="HiddenField7" runat="server" Value='<%# Eval("Main_ID") %>' />
                <asp:Label ID="Comment_ContentLabel" runat="server" Text='<%# Eval("Comment_Content") %>' />
                <br /></div>
                     <div class="hstack align-items-center mb-2">
                        <a class="link-primary me-2" href="#"><i class="zmdi zmdi-thumb-up"></i></a>
                        <span class="me-3 small">55</span>
                        <a class="link-secondary me-4" href="#"><i class="zmdi zmdi-thumb-down"></i></a>
                       
                        <asp:Button ID="Button2" runat="server" Text="Reply" CssClass="btn" style="background-color: Transparent" BorderStyle="None" ForeColor="#007ACC" CommandName="Reply" CommandArgument='<%# Eval("Comment_ID") %>' />
                          <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete_Comment" CommandArgument='<%# Eval("Post_Ref_ID") %>' Visible="false" />
                         
                     </div>
                      <asp:Panel ID="Panel1" runat="server" Visible="False">
                           <div class="bg-white rounded-3 shadow-sm p-4 mb-4">
         <!-- New Comment //-->
         <div class="d-flex">
            <img class="rounded-circle me-3"
                 style="width:3rem;height:3rem;"
                 src="https://via.placeholder.com/128/fe669e/ffcbde.png?text=S" />
            <div class="flex-grow-1">
               <div class="hstack gap-2 mb-1">
                  <a href="#" class="fw-bold link-dark">  <asp:Label ID="LabelUsername" runat="server" Text='<%# Eval("Username")%>' /></a>
                   
               </div>
               <div class="form-floating mb-3">
                    <asp:TextBox  ID="commentrep" runat="server" class="form-control w-100"
                             placeholder="Leave a comment here"
                              style="height: 7rem;" TextMode="MultiLine"></asp:TextBox>                                 
               <%--   <textarea class="form-control w-100"
                            placeholder="Leave a comment here"
                            id="my-comment"
                            style="height:7rem;"></textarea>--%>
                  <%--<label for="my-comment">Leave a comment here</label>--%>
               </div>
               <div class="hstack justify-content-end gap-2">
                  <%--<button class="btn btn-sm btn-link link-secondary text-uppercase" runat="server" CommandName="Cancel"> cancel</button>--%>
                   <asp:Button ID="Button4"  class="btn btn-sm btn-link link-secondary text-uppercase" runat="server" style="background-color: Transparent"  CommandName="Cancel" Text="Cancel" ForeColor="Black" />
                        <asp:Button ID="Button3" class="btn btn-sm btn-primary text-uppercase" runat="server" Text="Comment"  CommandName="InComment" CommandArgument='<%# Eval("Comment_ID")%>' /> 
                
               </div>
            </div>
         </div>
      </div>
                      </asp:Panel>
                     
                      <asp:Button ID="Button1" runat="server" Text="Replies" CssClass="btn" Style="background-color: Transparent" BorderStyle="None" ForeColor="#007ACC" CommandName="Replies" CommandArgument='<%# Eval("Comment_ID") %>' OnClientClick="show_hide(); return false;" />
                      <asp:Panel ID="Panel5" CssClass="InnerPanel" runat="server" BackColor="Transparent" Visible="false" >
                          
                      
                          <asp:DataList ID="dlReply" runat="server" DataKeyField="Comment_ID" DataSourceID="sqlReply" OnItemDataBound = "dlReply_ItemDataBound"  Style="background-color: Transparent" >
                          <ItemTemplate>
                                  <asp:HiddenField ID="HiddenField6" runat="server" Value='<%# Eval("Main_ID") %>' />
                              <asp:HiddenField ID="HiddenField8" runat="server" Value='<%# Eval("Comment_Ref_ID")%>' />

                              
                                      <div class="d-flex comment" style="background-color:transparent">
                                          <img class="rounded-circle comment-img"
                                              style="width: 3rem; height: 3rem;"
                                              src="https://via.placeholder.com/128/fe669e/ffcbde.png?text=S" />
                                          <div class="flex-grow-1 ms-3">
                                              <div class="mb-1"><a href="#" class="fw-bold link-dark me-1">

                                                  

                                                  <asp:Label ID="LabelUsername" runat="server" Text='<%# Eval("Username")%>' /></a> <span class="text-muted text-nowrap"> 
                                                        <asp:Label ID="InComment_Date" runat="server" Text='<%# Eval("Comment_Date")%>' />          
                                                  <br />
                                                  <asp:Label ID="lblReceiver" runat="server" Text="Label" ></asp:Label> </span>
                                              </div>
                                              <div class="mb-2">

                                                  <asp:Label ID="Comment_Content" runat="server" Text='<%# Eval("Comment_Content") %>' />

                                                  <br />
                                              </div>

                                              <div class="hstack align-items-center mb-2">
                                                  <a class="link-primary me-2" href="#"><i class="zmdi zmdi-thumb-up"></i></a>
                                                  <span class="me-3 small">55</span>
                                                  <a class="link-secondary me-4" href="#"><i class="zmdi zmdi-thumb-down"></i></a>
                                                  
                                                  <asp:Button ID="btnInReply" runat="server" Text="Reply" CssClass="btn" Style="background-color: Transparent" BorderStyle="None" ForeColor="#007ACC" CommandName="InReply" />

                                              </div>
                                              <asp:Panel ID="Panel4" runat="server" Visible="False">
                                                  <div class="bg-white rounded-3 shadow-sm p-4 mb-4">
                                                      <!-- New Comment //-->
                                                      <div class="d-flex">
                                                          <img class="rounded-circle me-3"
                                                              style="width: 3rem; height: 3rem;"
                                                              src="https://via.placeholder.com/128/fe669e/ffcbde.png?text=S" />
                                                          <div class="flex-grow-1">
                                                              <div class="hstack gap-2 mb-1">
                                                                  <a href="#" class="fw-bold link-dark">Studio KonKon</a>
                                                              </div>
                                                              <div class="form-floating mb-3">
                                                                  <asp:TextBox  ID="repcomment" runat="server" class="form-control w-100"
                                                                      placeholder="Leave a comment here"
                                                                      style="height: 7rem;" TextMode="MultiLine"></asp:TextBox>
                                                                 <%-- <textarea class="form-control w-100"
                                                                      placeholder="Leave a comment here"
                                                                      id="repcomment"
                                                                      style="height: 7rem;"></textarea>--%>
                                                                  <%--<label for="my-comment">Leave a comment here</label>--%>
                                                              </div>
                                                              <div class="hstack justify-content-end gap-2">
                                                                  <asp:Button ID="btnInCancel"  class="btn btn-sm btn-link link-secondary text-uppercase" runat="server" style="background-color: Transparent"  CommandName="InCancel" Text="Cancel" ForeColor="Black" />
                                                              
                                                                  <asp:Button ID="btnRepComment" class="btn btn-sm btn-primary text-uppercase" runat="server" Text="Comment" CommandName="RepComment" CommandArgument='<%# Eval("Comment_ID")%>'/>
                                                                  
                                                              </div>
                                                          </div>
                                                      </div>
                                                  </div>
                                              </asp:Panel>
                              </ItemTemplate>
                          </asp:DataList>            
                          <asp:SqlDataSource ID="sqlReply" runat="server" ConnectionString="<%$ ConnectionStrings:cnSqlConn %>" SelectCommand="SELECT * FROM [tblComment] WHERE ([Main_ID] = @Main_ID)">
                              <SelectParameters>
                                  <asp:ControlParameter ControlID="HiddenField5" Name="Main_ID" PropertyName="Value" Type="Int32" />
                              </SelectParameters>
                          </asp:SqlDataSource>
                          </asp:Panel>
                  </div>
               </div>
                
              
            </ItemTemplate>
             

            </asp:DataList>
            </div>
            <asp:SqlDataSource ID="sqlComment" runat="server" ConnectionString="<%$ ConnectionStrings:cnSqlConn %>" SelectCommand="SELECT * FROM [tblComment] WHERE (([Post_Ref_ID] = @Post_Ref_ID) AND ([Comment_Ref_ID] IS NULL))">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Post_Ref_ID" QueryStringField="Post_Ref_ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
                </center>
    </form>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script>
        
        var a;
        $(function show_hide() {
            if (a == 1)
            {
                $('[id*=Button1]').on("ClientClick", function show_hide() {
                    $('[id*=Panel5]').attr('style', 'display: block;');
                    return a = 0;
                });
            }
            else
            {
                $('[id*=Button1]').on("ClientClick", function show_hide() {
                    $('[id*=Panel5]').attr('style', 'display:none');
                    return a=1;
                });
            }
        });

    </script>
    </asp:Content>

