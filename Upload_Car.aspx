<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="false" CodeFile="Upload_Car.aspx.vb" Inherits="Upload_Car" MaintainScrollPositionOnPostback="True" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            margin-left: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div>
            
                    <asp:TextBox ID="txtSearch" runat="server" Width="200px"></asp:TextBox>
                    <asp:Button ID="BtnSearch" Text="Search" runat="server"  CausesValidation="false"/>
               

        <asp:Repeater ID="Repeater1" runat="server" >
           <HeaderTemplate>
        <table border="1">
            <tr style="color:darkslateblue">
                <th scope="col" style="width: 120px">
                    Image
                </th>
                <th scope="col" style="width: 100px">
                    Make
                </th>
                <th scope="col" style="width: 120px">
                    Model
                </th>
                <th scope="col" style="width: 120px">
                    Month/Year
                </th>
                <th scope="col" style="width: 120px">
                    Color
                </th>
                <th scope="col" style="width: 120px">
                    Price(Rs)
                </th>
                <th scope="col" style="width: 120px">
                    Style
                </th>

                <th scope="col" style="width: 80px">
                         Engine No 
                </th>

                <th scope="col" style="width: 80px">
                         Chassis No
                </th>


                <th scope="col" style="width: 80px">
                         Basic Description
                </th>

                
                <th scope="col" style="width: 80px">
           
                </th>

            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td>
                <asp:Label ID="lblCarId" runat="server" Text='<%# Eval("Car_Id") %>' Visible = "false" />
                <asp:Image ID="ImgCar" runat="server" Width="120px" Height="120px" ImageUrl='<%# Eval("Image") %>'  />

            </td>

            <td> 
                 <asp:Label ID="lblMake" runat="server" Text='<%# Eval("Make") %>' />
                <asp:TextBox ID="txtMake" runat="server" Width="120" Text='<%# Eval("Make") %>'
                    Visible="false" />
            </td>
           
            <td>
                <asp:Label ID="lblModel" runat="server" Text='<%# Eval("Model") %>' />
                <asp:TextBox ID="txtModel" runat="server" Width="120" Text='<%# Eval("Model") %>'
                    Visible="false" />
            </td>
             <td>
                <asp:Label ID="lblYear" runat="server" Text='<%# Eval("Month/Year") %>' />
                <asp:TextBox ID="txtYear" runat="server" Width="120" Text='<%# Eval("Month/Year") %>'
                    Visible="false" />
            </td>
             <td>
                <asp:Label ID="lblColor" runat="server" Text='<%# Eval("Color") %>' />
                <asp:TextBox ID="txtColor" runat="server" Width="120" Text='<%# Eval("Color") %>'
                    Visible="false" />
            </td>
             <td>
                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>' />
                <asp:TextBox ID="txtPrice" runat="server" Width="120" Text='<%# Eval("Price") %>'
                    Visible="false" />
            </td>
             <td>
                <asp:Label ID="lblBody" runat="server" Text='<%# Eval("Body Style") %>' />
                <asp:TextBox ID="txtBody" runat="server" Width="120" Text='<%# Eval("Body Style") %>'
                    Visible="false" />
            </td>
                <td>
                <asp:Label ID="lblEngine" runat="server" Text='<%#Eval("Engine_No") %>'></asp:Label>
                <asp:TextBox ID="txtEngine" runat="server" Width="120" Text='<%# Eval("Body Style") %>'
                    Visible="false" />
            </td>

            <td>
                <asp:Label ID="lblChassis" runat="server" Text='<%#Eval("Chassis_No") %>'></asp:Label>
                <asp:TextBox ID="txtChassis" runat="server" Width="120" Text='<%# Eval("Body Style") %>'
                    Visible="false" />
            </td>

            <td>
                <asp:Label ID="lblSpec" runat="server" Height="100px" Width="200px" Text='<%#Eval("Basic Specification") %>' ></asp:Label>
                <asp:TextBox ID="txtSpec" runat="server" TextMode="MultiLine" Height="100px" Width="200px" Visible="false" ></asp:TextBox>

            </td>

            <td>
                <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" OnClick="OnEdit"  CausesValidation="false"/>
                <asp:LinkButton ID="lnkCancel" Text="Cancel" runat="server" Visible="false" OnClick="OnCancel" CausesValidation="false" />
                <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" OnClick="OnDelete" CausesValidation="false" OnClientClick="return confirm('Do you want to delete this row?'); " />
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>

           <!--table to upload new car-->
           
       <table>

           <tr>
               <td>


                   Image :</td>

               <td>


            <asp:FileUpload ID="FileUploadImg" runat="server" Width="144px" />
           

               </td>

               <td>


                   &nbsp;</td>

           </tr>

           <tr>
               <td>


                   Make :</td>

               <td>


            <asp:TextBox ID="txtUploadMake" runat="server" Width="139px" />


               </td>

               <td>


                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Make" ControlToValidate="txtUploadMake" ForeColor="Red"></asp:RequiredFieldValidator>


                   <br />


               </td>

           </tr>
           
           <tr>
               <td>


                   Model :</td>

               <td>


            <asp:TextBox ID="txtUploadModel" runat="server" Width="140px" />


               </td>

               <td>


                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Model" ControlToValidate="txtUploadModel" ForeColor="Red"></asp:RequiredFieldValidator>


                   <br />


               </td>

           </tr>
           
           <tr>
               <td>


                   Month/Year :</td>

               <td>


            <asp:TextBox ID="txtUploadYear" runat="server" Width="139px" />


               </td>

               <td>


                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter month and date" ControlToValidate="txtUploadYear" ForeColor="Red"></asp:RequiredFieldValidator>


                   <br />


               </td>

           </tr>

           <tr>
               <td>


                   Color :</td>

               <td>


            <asp:TextBox ID="txtUploadColor" runat="server" Width="139px" />


               </td>

               <td>


                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Car Color" ControlToValidate="txtUploadColor" ForeColor="Red"></asp:RequiredFieldValidator>


                   <br />


               </td>

           </tr>

           <tr>
               <td>


                   Price(Rs) :</td>

               <td>


            <asp:TextBox ID="txtUploadPrice" runat="server" Width="140px" />


               </td>

               <td>


                   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Price" ControlToValidate="txtUploadPrice" ForeColor="Red"></asp:RequiredFieldValidator>


               </td>

           </tr>

           <tr>
               <td>


                   Body Style :</td>

               <td>


            <asp:DropDownList ID="DrpUploadStyle" runat="server">
                <asp:ListItem Text="--Select Body Style--" Value="-1"></asp:ListItem>
                <asp:ListItem Text="Sedans" Value="Sedans"></asp:ListItem>
                <asp:ListItem Text="Coupes" Value="Coupes"></asp:ListItem>
                <asp:ListItem Text="Wagons" Value="Wagons"></asp:ListItem>
                <asp:ListItem Text=" Hatchs" Value="Hatchs"></asp:ListItem>
                <asp:ListItem Text="SUVs" Value="SUVs"></asp:ListItem>
                <asp:ListItem Text="Convertibles" Value="Convertibles"></asp:ListItem>
                <asp:ListItem Text="Mini Vechicles" Value="Mini Vehicles"></asp:ListItem>


            </asp:DropDownList>

               </td>

               <td>


                   <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="DrpUploadStyle" ErrorMessage="Choose a Body Style " ForeColor="Red"></asp:CustomValidator>


               </td>

           </tr>

            <tr>
               <td>

                   Engine_No :
                   
               </td>

               <td>
                   <asp:TextBox ID="txtUploadEngine" runat="server" Width="140px"></asp:TextBox>
               </td>

                <td>
                    
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Engine Number" ControlToValidate="txtUploadEngine" ForeColor="Red"></asp:RequiredFieldValidator>
                    
               </td>
           </tr>

                <tr>
               <td>
                   
                   Chassis_No :

               </td>

               <td>
                    <asp:TextBox ID="txtUploadChassis" runat="server" Width="140px" />

               </td>

               <td>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Chassis Number" ControlToValidate="txtUploadChassis" ForeColor="Red"></asp:RequiredFieldValidator>
               </td>

           </tr>


           <tr>

               <td>

                   

                  Basic Specification : 


               </td>

               <td>
                   <asp:TextBox ID="txtUploadSpec" runat="server" TextMode="MultiLine"></asp:TextBox>

               </td>
               <td>


               </td>

           </tr>



       </table>
            <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="Insert" Width="96px"  />
            
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
             <asp:Button ID="lnkUpdate" Text="Update" runat="server" Visible="false" OnClick="OnUpdate" CausesValidation="false" CssClass="auto-style2" Width="93px" />
               
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
             <asp:Button ID="ButtonClr" Text="Clear" runat="server"  CausesValidation="false" Width="84px" />



               
    </div>
</asp:Content>

