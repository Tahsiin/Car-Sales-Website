<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageGuest.master" AutoEventWireup="false" CodeFile="Contact.aspx.vb" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
      
        .auto-style4 {
            width: 871px;
        }

        .auto-style5 {
            margin-left: 69px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <table style="border-color:blue; border-style:solid; "  >
        <tr>
            


            <td style="background-color:whitesmoke; color:black;text-align:center; " class="auto-style4">
                <h3>Contact Info</h3>
                <b>Mr Tahsiin Auzim(Director) </b>
                <br/>
                9th mile Royal Road, Triolet
                <br />
                Tel: 59711703<br />
                Fax: 34989084
                <br />
                Email: tahsiinauzim@gmail.com
                <br/><br/>
            </td>
         </tr>
           <tr>
            <td class="auto-style4" style="background-color:whitesmoke; color:blue; text-align:left" >
                <br />
                &nbsp;Sent us some of your feedback:<br />
                <br />
                
                 &nbsp;<asp:TextBox ID="txtFeedBack" runat="server" TextMode="MultiLine" Height="126px" Width="307px" CssClass="auto-style5" ></asp:TextBox>
                
                    <br />
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Width="275px"  Height="17px"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <asp:Button ID="btnSubmit" runat="server" Text="Submit" /><br/><br/>
            </td>
        </tr>

    </table>


</asp:Content>

