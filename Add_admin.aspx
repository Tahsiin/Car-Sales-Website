<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="false" CodeFile="Add_admin.aspx.vb" Inherits="Add_admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    
                
                    <asp:TextBox ID="txtSearch" runat="server" Width="200px"></asp:TextBox>
                    <asp:Button ID="BtnSearch" Text="Search" runat="server"  CausesValidation="false"/>
               
    <asp:Repeater ID="Repeater1" runat="server" >
           <HeaderTemplate>
        <table border="1">
            <tr style="color:darkslateblue">
                <th scope="col" style="width: 120px">
                    Name
                </th>
                <th scope="col" style="width: 100px">
                    Surname
                </th>
                <th scope="col" style="width: 120px">
                    Age
                </th>
                <th scope="col" style="width: 120px">
                    Type
                </th>
                <th scope="col" style="width: 120px">
                    Address
                </th>
                <th scope="col" style="width: 120px">
                    Contact
                </th>
                <th scope="col" style="width: 120px">
                    Email Address
                </th>
               
                <th scope="col" style="width: 80px">
                </th>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td>
                <asp:Label ID="lblUserId" runat="server" Text='<%# Eval("User_Id") %>' Visible = "false" />
                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>' />
                 
            </td>

            <td> 
                 <asp:Label ID="lblSurname" runat="server" Text='<%# Eval("Surname") %>' />
                   
            </td>
            <td>
                <asp:Label ID="lblAge" runat="server" Text='<%# Eval("Age") %>' />
               
            </td>
             <td>
                <asp:Label ID="lblType" runat="server" Text='<%# Eval("Type") %>' />
                
                
            </td>
             <td>
                <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>' />
                
            </td>
             <td>

                  <asp:Label ID="lblContact" runat="server" Text='<%# Eval("Contact") %>' />
              
                
            </td>
             <td>
                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email Address") %>' />
                
                 <br />
                 
                <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("Password") %>' Visible="false"  />
                
                <asp:Label ID="lblConPass" runat="server" Text='<%# Eval("Confirm Password") %>'  Visible="false" />

                 
             </td>

            
            <td>
                <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" OnClick="OnEdit"  CausesValidation="false"/>
                <asp:LinkButton ID="lnkUpdate" Text="Update" runat="server" Visible="false" OnClick="OnUpdate" CausesValidation="false" />
                <asp:LinkButton ID="lnkCancel" Text="Cancel" runat="server" Visible="false" OnClick="OnCancel" CausesValidation="false" />
                <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" OnClick="OnDelete" CausesValidation="false" OnClientClick="return confirm('Do you want to delete this row?'); " />
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>


     <table border="0" style="border-color:blue; border-style:solid; font-size:large; ">
        <tr>
            <td class="auto-style3">
                <table>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="LabelName" runat="server" Text="Name :"></asp:Label>
                
            </td>
            <td class="auto-style2">
            
                <asp:TextBox ID="txtboxName" runat="server" Height="16px" Width="143px"></asp:TextBox>
            
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

                <asp:TextBox ID="txtboxSurname" runat="server" Height="16px" Width="144px"></asp:TextBox>
                           
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
                <asp:TextBox ID="txtboxAge" runat="server" Width="26px"  TextMode="Number"></asp:TextBox>
        
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorAge"  runat="server" ControlToValidate="txtboxAge" ErrorMessage="Enter Your Age " ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:RangeValidator ID="RangeValidatorAge" runat="server"  ErrorMessage="Age Must Be Between 18 And 99" ControlToValidate="txtboxAge" ForeColor="Red" MaximumValue="99" MinimumValue="18"></asp:RangeValidator>
        
            </td>
        </tr>

        
       <tr>
           
            <td class="auto-style4">
                <asp:Label ID="LabelType" runat="server" Text="Type:"></asp:Label>
        
            </td>



            <td class="auto-style2">

                <asp:DropDownList ID="DrpType" runat="server" >
                    <asp:ListItem Value="user1" Text="user1"></asp:ListItem>
                    <asp:ListItem Value="admin" Text="admin" ></asp:ListItem>                    
                    <asp:ListItem Value="Block" Text="Block" ></asp:ListItem>
                </asp:DropDownList>
        
            </td>
            <td>
                

           </td>

       </tr>

        
        <tr>
            <td class="auto-style4">
                <asp:Label ID="LabelAddress" runat="server" Text="Address :"></asp:Label>
        
            </td>

            <td class="auto-style2">
                <asp:TextBox ID="txtboxAddress" runat="server" Height="16px" Width="132px"></asp:TextBox>
        
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
                <asp:TextBox ID="txtboxContact" runat="server" Height="16px" Width="132px" TextMode="Number"></asp:TextBox>
        
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
                  <asp:TextBox ID="txtboxEmail" runat="server" Height="16px" Width="132px"></asp:TextBox>
        
            </td>
            <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtboxEmail" ErrorMessage="Enter Email Address" ForeColor="Red"></asp:RequiredFieldValidator>
        
                          <br />
                          <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ControlToValidate="txtboxEmail" ErrorMessage="Email Not Valid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        
            </td>
        </tr>

        
      

        <tr>
            <td class="auto-style4">
            
                     <asp:Label ID="LabelPass" runat="server" Text="Password :"></asp:Label>
            </td>

            <td class="auto-style2">

                <asp:TextBox ID="txtboxPass" runat="server" Height="16px" Width="132px" TextMode="Password"></asp:TextBox>
        
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
                <asp:TextBox ID="txtboxConPass" runat="server" Height="16px" Width="132px" TextMode="Password"></asp:TextBox>
    
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

                <asp:Button ID="BtnSubmit" runat="server" Text="Add" OnClick="Insert" />

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;

                <asp:Button ID="Clear" runat="server" Text="Clear" CausesValidation="false" />

                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="lnkUpdate" Text="Update" runat="server" Visible="false" OnClick="OnUpdate" CausesValidation="false" CssClass="auto-style2" Width="93px" />

                <asp:Label ID="LabelSubmit" runat="server" Text=" " />

            </td>

        </tr>
             
     </table>
         </td>

        
        </tr>
        </table>
    
    

</asp:Content>

