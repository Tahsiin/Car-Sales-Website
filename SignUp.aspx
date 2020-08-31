<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageGuest.master" AutoEventWireup="false" CodeFile="SignUp.aspx.vb" Inherits="SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 200px;
        }
        .auto-style3 {
            width: 1100px;
        }
        .auto-style4 {
            width: 126px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="0" style="border-color:blue; border-style:solid; font-size:large; ">
        <tr>
            <td class="auto-style3">
                <table>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="LabelName" runat="server" Text="Name :"></asp:Label>
                
            </td>
            <td class="auto-style2">
            
                <asp:TextBox ID="txtboxName" runat="server" Height="16px" Width="143px" MaxLength="30"></asp:TextBox>
            
            </td>
              
            <td>  
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="txtboxName" ErrorMessage="Enter Your Name" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
            </td>

        </tr>

        <tr>
            <td class="auto-style4">
                   <asp:Label ID="LabelSurname" runat="server" Text="Surname : "></asp:Label>
        
            </td>
            
            <td class="auto-style2">

                <asp:TextBox ID="txtboxSurname" runat="server" Height="16px" Width="144px" MaxLength="30"></asp:TextBox>
                           
            </td>
            
            <td>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidatorSurname" runat="server" ControlToValidate="txtboxSurname" ErrorMessage="Enter Your Surname" ForeColor="Red"></asp:RequiredFieldValidator>
                    
                 <br />
                    
            </td>
        
        </tr>

        <tr>
            <td class="auto-style4">
                <asp:Label ID="LabelAge" runat="server" Text="Age:"></asp:Label>
        
            </td>

            <td class="auto-style2">
                <asp:TextBox ID="txtboxAge" runat="server" Width="26px"  TextMode="Number" MaxLength="2"></asp:TextBox>
        
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAge"  runat="server" ControlToValidate="txtboxAge" ErrorMessage="Enter Your Age " ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:RangeValidator ID="RangeValidatorAge" runat="server"  ErrorMessage="Age Must Be Between 18 And 99" ControlToValidate="txtboxAge" ForeColor="Red" MaximumValue="99" MinimumValue="18"></asp:RangeValidator>
        
            </td>
        </tr>

        
       

        
        <tr>
            <td class="auto-style4">
                <asp:Label ID="LabelAddress" runat="server" Text="Address :"></asp:Label>
        
            </td>

            <td class="auto-style2">
                <asp:TextBox ID="txtboxAddress" runat="server" Height="16px" Width="132px" MaxLength="40"></asp:TextBox>
        
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" runat="server" ControlToValidate="txtboxAddress" ErrorMessage="Enter Your Address" ForeColor="Red"></asp:RequiredFieldValidator>
        
                <br />
        
            </td>
        </tr>

        
        <tr>
            <td class="auto-style4">
                <asp:Label ID="LabelContact" runat="server" Text="Contact :"></asp:Label>
        
            </td>

            <td class="auto-style2">
                <asp:TextBox ID="txtboxContact" runat="server" Height="16px" Width="132px" TextMode="Number" MaxLength="15"></asp:TextBox>
        
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorContact" runat="server" ControlToValidate="txtboxContact" ErrorMessage="Enter Contact Number" ForeColor="Red"></asp:RequiredFieldValidator>
        
            </td>
        </tr>

        
        <tr>
            <td class="auto-style4">
                <asp:Label ID="LabelEmail" runat="server" Text="Email Address :"></asp:Label>
        
            </td>
        
            <td class="auto-style2">
                  <asp:TextBox ID="txtboxEmail"  runat="server" Height="16px" Width="132px" MaxLength="50"></asp:TextBox>
        
            </td>
            <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtboxEmail" ErrorMessage="Enter Email Address" ForeColor="Red"></asp:RequiredFieldValidator>
        
                          <br />
                          <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ControlToValidate="txtboxEmail" ErrorMessage="Email Not Valid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        
            &nbsp;<asp:Label ID="Label1"  runat="server" ForeColor="Red" Text=""></asp:Label>
        
            </td>
        </tr>

        
      

        <tr>
            <td class="auto-style4">
            
                     <asp:Label ID="LabelPass" runat="server" Text="Password :"></asp:Label>
            </td>

            <td class="auto-style2">

                <asp:TextBox ID="txtboxPass" runat="server" Height="16px" Width="132px" TextMode="Password" MaxLength="50"></asp:TextBox>
        
            </td>

            <td>

                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="txtboxPass" ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
        
            </td>

       </tr>

        <tr>
            <td class="auto-style4">
                <asp:Label ID="LabelConPass" runat="server" Text="Confirm Password :"></asp:Label>
        
            </td>

            <td class="auto-style2">
                <asp:TextBox ID="txtboxConPass" runat="server" Height="16px" Width="132px" TextMode="Password" MaxLength="50"></asp:TextBox>
    
            </td>

            <td>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPassword" runat="server" ControlToValidate="txtboxConPass" ErrorMessage="Re-Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                     <br />
                     <asp:CompareValidator ID="CompareValidatorConfirmPassword" runat="server" ControlToCompare="txtboxPass" ControlToValidate="txtboxConPass" ErrorMessage="Password Not Same" ForeColor="Red"></asp:CompareValidator>
   
            </td>
        </tr>

        <tr>
            <td colspan="3">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="BtnSubmit" runat="server" Text="Submit" />

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;

                <asp:Button ID="Clear" runat="server" Text="Clear" CausesValidation="false" />

                &nbsp;&nbsp;&nbsp;

                <asp:Label ID="LabelSubmit" runat="server" Text=" " />

            </td>

        </tr>
             
     </table>
         </td>

        
        </tr>
        </table>
      
    



</asp:Content>

