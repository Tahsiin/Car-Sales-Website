<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageGuest.master" AutoEventWireup="false" CodeFile="EditProfile.aspx.vb" Inherits="EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
      <div style="color:black">
    <asp:Wizard ID="Wizard1" runat="server"    BackColor="#FFFFCC" ActiveStepIndex="1" OnNextButtonClick="Wizard1_NextButtonClick">
        
        <SideBarTemplate>
            <asp:DataList ID="SideBarList" runat="server">
                <ItemTemplate>
                    <asp:LinkButton ID="SideBarButton" runat="server"></asp:LinkButton>
                </ItemTemplate>
                <SelectedItemStyle Font-Bold="True" />
            </asp:DataList>
        </SideBarTemplate>
        <WizardSteps >
            <asp:WizardStep ID="WizardStep1"   runat="server"  Title="Step 1">
               
                

                Enter Password to continue : 

                <br /> 

              Password:  <asp:TextBox ID="step1password" TextMode="Password" runat="server" AutoPostBack="true" ></asp:TextBox>

                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

            </asp:WizardStep>
            
            <asp:WizardStep ID="WizardStep2"   runat="server" Title="Step 2" >


           

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
               
                <th scope="col" style="width: 120px">
                    Password
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
                <asp:TextBox ID="txtName" runat="server" Width="120" Text='<%# Eval("Name") %>'  Visible="false" />
               
            </td>

            <td> 
                 <asp:Label ID="lblSurname" runat="server" Text='<%# Eval("Surname") %>' />
                <asp:TextBox ID="txtSurname" runat="server" Width="120" Text='<%# Eval("Surname") %>'  Visible="false" />
                    
            </td>
            <td>
                <asp:Label ID="lblAge" runat="server" Text='<%# Eval("Age") %>' />
                <asp:TextBox ID="txtAge" runat="server" Width="120" Text='<%# Eval("Age") %>'
                    Visible="false" />
            </td>
             <td>
                <asp:Label ID="lblType" runat="server" Text='<%# Eval("Type") %>' />
                <asp:TextBox ID="txtType" runat="server" Width="120" Text='<%# Eval("Type") %>'
                    Visible="false" />
                
            </td>
             <td>
                <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>' />
                <asp:TextBox ID="txtAddress" runat="server" Width="120" Text='<%# Eval("Address") %>'
                    Visible="false" />
            </td>
             <td>

                  <asp:Label ID="lblContact" runat="server" Text='<%# Eval("Contact") %>' />
                <asp:TextBox ID="txtContact" runat="server" Width="120" Text='<%# Eval("Contact") %>'
                    Visible="false" />
                
            </td>
             <td>
                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email Address") %>' />
                <asp:TextBox ID="txtEmail" runat="server" Width="120" Text='<%# Eval("Email Address") %>'
                    Visible="false" />
                 <br />
                 <td>
                <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("Password") %>'   />
                </td>
                
                 
             </td>

            
            <td>
                <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" OnClick="OnEdit"  CausesValidation="false"/>
                <asp:LinkButton ID="lnkUpdate" Text="Update" runat="server" Visible="false" OnClick="OnUpdate" CausesValidation="false" />
                <asp:LinkButton ID="lnkCancel" Text="Cancel" runat="server" Visible="false" OnClick="OnCancel" CausesValidation="false" />
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
                    <asp:ListItem  Enabled="false" Value="admin" Text="admin" ></asp:ListItem>                    
                    <asp:ListItem Enabled="false" Value="Block" Text="Block" ></asp:ListItem>
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
                <asp:Button ID="lnkUpdate" Text="Update" runat="server" Visible="false" OnClick="OnUpdate" CssClass="auto-style2" Width="93px" />
                <asp:CompareValidator ID="CompareValidator1" runat="server"  ControlToValidate="step1password" ControlToCompare="txtboxcompare" ErrorMessage="Password not matched"></asp:CompareValidator>
               <<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="step1password" ErrorMessage="Enter password"></asp:RequiredFieldValidator>
                 <asp:Label ID="LabelSubmit" runat="server" Text=" " />
               <asp:TextBox ID="txtboxcompare" runat="server" Visible="false"></asp:TextBox>

            </td>

        </tr>
             
     </table>
         </td>

        
        </tr>
        </table>
    
 </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
    </div>
</asp:Content>

