<%@ Page Title="" Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="Message.aspx.vb" Inherits="Message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrapcss"/>
<%--<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>--%>
<%--<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
    <style>

      body{
          overflow:hidden;
      }  

        .container{max-width:1170px; margin:auto;}
img{ max-width:100%;}
.inbox_people {
  background: #f8f8f8 none repeat scroll 0 0;
  float: left;
  overflow: hidden;
  width: 40%; border-right:1px solid #c4c4c4;
}
.inbox_msg {
  border: 1px solid #c4c4c4;
  clear: both;
  overflow: scroll;
}
.top_spac{ margin: 20px 0 0;}


.recent_heading {float: left; width:40%;}
.srch_bar {
  display: inline-block;
  text-align: right;
  width: 60%;
}
.headind_srch{ padding:10px 29px 10px 20px; overflow:hidden; border-bottom:1px solid #c4c4c4;}

.recent_heading h4 {
  color: #05728f;
  font-size: 21px;
  margin: auto;
}
.srch_bar input{ border:1px solid #cdcdcd; border-width:0 0 1px 0; width:80%; padding:2px 0 4px 6px; background:none;}
.srch_bar .input-group-addon button {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  padding: 0;
  color: #707070;
  font-size: 18px;
}
.srch_bar .input-group-addon { margin: 0 0 0 -27px;}

.chat_ib h5{ font-size:15px; color:#464646; margin:0 0 8px 0;}
.chat_ib h5 span{ font-size:13px; float:right;}
.chat_ib p{ font-size:14px; color:#989898; margin:auto}
.chat_img {
  float: left;
  width: 11%;
}
.chat_ib {
  float: left;
  padding: 0 0 0 15px;
  width: 88%;
}

.chat_people{ overflow:hidden; clear:both;}
.chat_list {
  border-bottom: 1px solid #c4c4c4;
  margin: 0;
  padding: 18px 16px 10px;
}
.inbox_chat { height: 550px; overflow-y: scroll;}

.active_chat{ background:#ebebeb;}

.incoming_msg_img {
  display: inline-block;
  width: 6%;

}
.received_msg {
  display: inline-block;
  padding: 0 0 0 10px;
  vertical-align: top;
  width: 92%;

 }
 .received_withd_msg p {
  background: #ebebeb none repeat scroll 0 0;
  border-radius: 3px;
  color: #646464;
  font-size: 14px;
  margin: 0;
  padding: 5px 10px 5px 12px;
  width: 100%;
 
}
.time_date {
  color: #747474;
  display: block;
  font-size: 12px;
  margin: 8px 0 0;
}
.received_withd_msg { width: 57%;}
.mesgs {
  float: left;
  padding: 30px 15px 0 25px;
  width: 60%;
  margin-top:15px;
}

 .sent_msg p {
  background: #05728f none repeat scroll 0 0;
  border-radius: 3px;
  font-size: 14px;
  margin: 0; color:#fff;
  padding: 5px 10px 5px 12px;
  width:100%;
}
.outgoing_msg{ overflow:hidden; margin:26px 0 26px;}
.sent_msg {
  float: right;
  width: 46%;
}
.input_msg_write input {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  color: #4c4c4c;
  font-size: 15px;
  min-height: 48px;
}

.type_msg {border-top: 1px solid #c4c4c4;position: relative;}
.msg_send_btn {
  background: #05728f none repeat scroll 0 0;
  border: medium none;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  font-size: 17px;
  height: 33px;
  right: 0;
  top: 11px;
}
.messaging { padding: 0 0 50px 0;}
.msg_history {
  height: 516px;
  width: max-content;
  overflow-y: auto;
}
    </style>
    <form runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
           
             
         <div class="container">
                <h3 class=" text-center">Messaging</h3>
                <div class="messaging">
                  
                    <div class="inbox_msg">
                      
<%--                        <div class="inbox_people">
                            <div class="headind_srch">
                                <div class="recent_heading">
                                    <h4>Recent</h4>
                                </div>
                                <div class="srch_bar">
                                    <div class="stylish-input-group">
                                        <input type="text" class="search-bar" placeholder="Search">
                                        <span class="input-group-addon">
                                            <button type="button"><i class="fa fa-search" aria-hidden="true"></i></button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="inbox_chat">
                                <div class="chat_list active_chat">
                                    <div class="chat_people">
                                        <div class="chat_img">
                                            <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil" />
                                        </div>

                                      </div>
                                </div>
                            </div>
                           

                        </div>--%>
                            <div style="height:5px; ">
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>  <asp:Label ID="lblUser" runat="server" Text="Label" style="margin-top: 2px;"></asp:Label></b>
              <hr />
             
          </div>
                        <div class="mesgs" >

                            <div class="msg_history">

                                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
            <asp:AsyncPostBackTrigger ControlID="Timer2" EventName="Tick" />
        </Triggers>
        <ContentTemplate>
             <asp:Timer ID="Timer1" Interval="4000" runat="server"></asp:Timer>
            <asp:Timer ID="Timer2" Interval="1000" runat="server"></asp:Timer>
                                <div class="incoming_msg" >
                                  
                                    <div class="received_msg">
                                        <div class="received_withd_msg">
                                            <asp:DataList ID="dlRec" runat="server" DataSourceID="SqlRec" Height="125px">
                                    <ItemTemplate>
                                        <asp:Panel ID="Panel1" runat="server">

                                            <asp:Label ID="Label2" runat="server" Text="<%# Container.ItemIndex+1 %>">"></asp:Label>
                                             <asp:HiddenField ID="hfSent_To" runat="server" Value='<%# Eval("Sent_to")%>' />
											     <%--<img src="https://ptetutorials.com/images/user-profile.png" height="30px" width="30px" alt="sunil" /> &nbsp;				 --%>
                                            <asp:Label ID="lblReceive" runat="server"  Width="400px" Text='<%# Eval("Message_Content") %>'></asp:Label>
                                                    <span class="time_date">11:01 AM    |    June 9</span>
                                            </asp:Panel>
                                                      <div class="outgoing_msg">
                                    <div class="sent_msg">
                                    </div>
                                </div>
                                                </ItemTemplate>
                                            </asp:DataList>

                                            <asp:SqlDataSource ID="SqlRec" runat="server" ConnectionString="<%$ ConnectionStrings:cnSqlConn %>" SelectCommand="SELECT * FROM [tblMessaging] WHERE (([Sent_by] = @Sent_by) AND ([Sent_to] = @Sent_to) OR ([Sent_by] = @Sent_by2) AND ([Sent_to] = @Sent_to2)) ORDER BY [Messaged_on]">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="Sent_by" SessionField="msgTo" Type="String" />
                                                    <asp:SessionParameter Name="Sent_to" SessionField="msgProfile" Type="String" />
                                                    <asp:SessionParameter Name="Sent_by2" SessionField="msgProfile" Type="String" />
                                                    <asp:SessionParameter Name="Sent_to2" SessionField="msgTo" Type="String" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>

                                    </div>
                                </div>
                
                              
                </ContentTemplate>
    </asp:UpdatePanel>
                            </div>
                               <div class="type_msg">
                            <div class="input_msg_write">
                                <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                                    <ContentTemplate>
                                <input id="txtMessage" runat="server" type="text" class="write_msg" placeholder="Type a message" />
                                <asp:Button ID="btnSend" runat="server" CssClass="msg_send_btn" Text="Send" />
                                
                           </ContentTemplate>
                                        </asp:UpdatePanel>
                                     </div>
                        </div>
                        </div>
                    </div>
                 
                </div>
             </div>
   </form>
    <script>
        var objDiv = document.getElementById("incoming_msg");
        objDiv.scrollTop = objDiv.scrollHeight;
    </script>
</asp:Content>

