<%@ Page Title="" Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="CreatePost.aspx.vb" Inherits="CreatePost" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
         
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
                          <br />
                          <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="OleDbDataSource1" DataTextField="Kommunity_Name" DataValueField="Kommunity_Name">
                          </asp:DropDownList>
                          <asp:OleDbDataSource ID="OleDbDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString5 %>" ProviderName="<%$ ConnectionStrings:ConnectionString5.ProviderName %>" SelectCommand="SELECT [Kommunity_Name] FROM [tblKommunity]"></asp:OleDbDataSource>
                    <br />
                     <asp:FileUpload ID="FileUpload2" runat="server" />
                    <br />
                     <asp:Button ID="btnSubmit" runat="server" Text="Post" OnClick="btnSubmit_Click" />
                     </asp:Panel>
       <%-- <asp:Panel ID="pnlTitle" runat="server">
            <asp:TextBox ID="txtTitle" runat="server" placeholder="Title"></asp:TextBox>
        </asp:Panel>
        <br />
         <asp:UpdatePanel ID="UpdatePanel2" runat="server">
             <contentTemplate>
                  <asp:panel id="pnlpost" runat="server">
                    <asp:TextBox ID="txtContent" runat="server" placeholder="Content Text (optional)..." TextMode="Multiline" Width="69%"></asp:TextBox>
                    <br />
                     <asp:FileUpload ID="FileUpload2" runat="server" />
                    <br />
                     <asp:Button ID="btnSubmit" runat="server" Text="Post" OnClick="btnSubmit_Click" />
                </asp:Panel>
             </contenttemplate>
       
             </asp:UpdatePanel>
      --%>
           <%-- &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            <asp:Button ID="btnNext2" runat="server" Text="Next"/>--%>

       <%-- <asp:Panel ID="pnlFinalize" runat="server">
             <asp:TextBox ID="txtFinalize" runat="server" TextMode="Multiline" Width="69%"></asp:TextBox>
            <br />
            <asp:Image ID="imgAttachments" runat="server" />
            <br />--%>
           <%-- &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;--%>
        <%--</asp:Panel>--%
        <%-- &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
         --%>
    </form>

      <script src="https://unpkg.com/filepond/dist/filepond.js"></script>
</asp:Content>

