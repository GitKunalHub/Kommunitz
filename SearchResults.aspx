<%@ Page Title="" Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="SearchResults.aspx.vb" Inherits="SearchResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <form id="form1" runat="server">
    <h1>Search Results</h1>
        <br />
    <br />
    <asp:Button ID="btnAll" runat="server" Text="All" />&nbsp;<asp:Button ID="btnPosts" runat="server" Text="Posts" />&nbsp;<asp:Button ID="btnCommunities" runat="server" Text="Communities" />&nbsp;<asp:Button ID="btnUsers" runat="server" Text="Users" />
        <br />
        <asp:Panel ID="pnlPosts" runat="server">
             <asp:DataList ID="DataList1" runat="server" DataKeyField="Post_Ref_ID" BorderStyle="Solid" BorderWidth="2px" Width="700px">
            <ItemTemplate >
                 <a href='Kommunity.aspx?Kommunity_Name=<%#Eval("Kommunity_Name")%>'style="color: inherit" > 
                <asp:Image ID="Image2" runat="server" BorderStyle="Outset" Height="26px" ImageAlign="Left" ImageUrl="https://i.pinimg.com/originals/ed/a4/4a/eda44a02431fd96480560c51c056c0c4.png" Width="28px" />
                &nbsp; r/<b><asp:Label ID="Kommunity_NameLabel" runat="server" Text='<%# Eval("Kommunity_Name") %>' /></b></a>
            &nbsp;• Posted by:
            <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             • Posted_On:
            <asp:Label ID="Posted_OnLabel" runat="server" CssClass="PostedOn" Text='<%# Eval("Posted_On")%>' />
          <hr style="height:2px;border-width:0;color:gray;background-color:gray">
                &nbsp; •&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <a href='post.aspx?post_ref_id=<%#eval("post_ref_id")%>' style="color: inherit">
            <asp:Label ID="Content_TitleLabel" runat="server" Text='<%# Eval("Content_Title")%>' Font-Bold="True" Font-Italic="False" Font-Size="X-Large"  />
            <hr style="height:2px;border-width:0;color:gray;background-color:gray">
               &nbsp; ╰┈➤&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Content_TextLabel" runat="server" Text='<%# Eval("Content_Text") %>' Font-Bold="False" Font-Italic="False" Font-Size="X-Large" />
            <asp:PlaceHolder ID="PlaceHolder3" runat="server">
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
                <hr style="height:2px;border-width:0;color:gray;background-color:gray">
                </asp:PlaceHolder>
                    </center>
                </a>
                    </div>
                <asp:Panel ID="Panel2" runat="server" Height="35px" Width="49px">
                    <br />
                    <hr />

                </asp:Panel>
        </ItemTemplate>
         
        </asp:DataList>
        </asp:Panel>
        <asp:Panel ID="pnlCommunities" runat="server" Visible="false">
            <asp:DataList ID="DataList2" runat="server" DataKeyField="Kommunity_Name" Width="1000px" Style="background-color: Transparent" >
             
            <ItemTemplate>
                <br />
                   <div class="flex-container">
                       
                       
                          
                &nbsp;&nbsp;&nbsp; <asp:Image ID="Image3" class="rounded-circle me-3" style="width:36px;height:36px;" runat="server" ImageUrl='<%# Eval("Kommunity_ProfileImg", "{0}") %>' /></a>
                <b>   &nbsp;&nbsp;&nbsp; <asp:Label ID="Label1" runat="server" Text='<%# Eval("Kommunity_Name") %>' /></b>
                       <br />
                           &nbsp;&nbsp;&nbsp; <asp:Label ID="Label2" style="margin-left:55px"  runat="server" Text='<%# Eval("Kommunity_Bio") %>' />
                             <%--   </div>--%>
                             <br />&nbsp;&nbsp;&nbsp;
                           &nbsp;&nbsp;&nbsp;      &nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;      &nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                           <asp:Button ID="btnJoin" runat="server" Text="Join"  /><asp:Button ID="btnEdit" runat="server" Text="Edit Profile" Visible="false" />
                       </div>
                <br />
            </ItemTemplate>
        </asp:DataList>
        </asp:Panel>

        <asp:Panel ID="pnlUsers" runat="server">
            <asp:DataList ID="DataList3" runat="server" DataKeyField="Username" Width="1000px" Style="background-color: Transparent" >
             
            <ItemTemplate>
                <br />
                   <div class="flex-container">
                       
                       
                          
                &nbsp;&nbsp;&nbsp; <asp:Image ID="Image3" class="rounded-circle me-3" style="width:36px;height:36px;" runat="server" ImageUrl='<%# Eval("Profile_Img", "{0}") %>' /></a>
                <b>   &nbsp;&nbsp;&nbsp; <asp:Label ID="Label1" runat="server" Text='<%# Eval("Username")%>' /></b>
                       <br />
                           &nbsp;&nbsp;&nbsp; <asp:Label ID="Label2" style="margin-left:55px"  runat="server" Text='<%# Eval("First_Name") %>' />
                             <%--   </div>--%>
                             <br />&nbsp;&nbsp;&nbsp;
                           &nbsp;&nbsp;&nbsp;      &nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;      &nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                           <asp:Button ID="btnJoin" runat="server" Text="Join"  /><asp:Button ID="btnEdit" runat="server" Text="Edit Profile" Visible="false" />
                       </div>
                <br />
            </ItemTemplate>
        </asp:DataList>
        </asp:Panel>

    </form>
</asp:Content>

