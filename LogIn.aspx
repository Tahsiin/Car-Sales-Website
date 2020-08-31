<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageGuest.master" AutoEventWireup="false" CodeFile="LogIn.aspx.vb" Inherits="LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
            
        
    <div>
           
        <asp:Label ID="lblEmail" runat="server" Text="Email : "></asp:Label>
        <asp:Textbox ID="txtEmail" runat="server"></asp:Textbox> <br />
        
        <asp:Label ID="lblPassword" runat="server" Text="Password : "></asp:Label>
        <asp:Textbox ID="TxtPassword" Textmode="Password" runat="server"></asp:Textbox> <br />
        
        <asp:Button ID="btnLogin" runat="server" Text="Login"/>
        <br/>
        <asp:Label ID="lblError" runat="server"> </asp:Label>
        

        <asp:Label ID="Label1" runat="server" ></asp:Label> 
        

    </div>
        
</asp:Content>


