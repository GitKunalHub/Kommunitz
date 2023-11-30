<%@ Page Title="" Language="VB" MasterPageFile="~/Home.master" AutoEventWireup="false" CodeFile="CreateKommunity.aspx.vb" Inherits="CreateKommunity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <META http-equiv="Page-Enter" content="blendTrans(Duration=0.1)">
<META http-equiv="Page-Exit" content="blendTrans(Duration=0.1)">
 <form id="form1" runat="server">
     <asp:Panel ID="Panel1" runat="server"  Height="600px"  Width="600px" >
         <b><asp:Label ID="Label1" runat="server" Text="Create a Community"  ></asp:Label></b>
         <br /><br /><br />
        <b> <asp:Label ID="Label2" runat="server" Text=" Name :" ></asp:Label></b><br />
         Community name including capitalization cannot be changed.
         <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Solid" BorderWidth="1px" BorderColor="Black"></asp:TextBox>
         <br /><br />
        <b> <asp:Label ID="Label3" runat="server" Text=" Community Type :" ></asp:Label></b>
         <br />
         <asp:TextBox ID="TextBox2" runat="server" BorderStyle="Solid" BorderWidth="1px" TextMode="MultiLine"></asp:TextBox>
         <br />
   
         <br /><br />
         <asp:Button ID="btnCancel" runat="server" Text="Cancel"  />
         <asp:Button ID="btnCreate" runat="server" Text="Create Community" />
         </asp:Panel>
     </form >
</asp:Content>

