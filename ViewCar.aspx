<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageGuest.master" AutoEventWireup="false" CodeFile="ViewCar.aspx.vb" Inherits="ViewCar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
       <br />
    <asp:panel ID="Warning" visible="true" runat="server" >

        <h1>Need to login first to View Car</h1>

    </asp:panel>

<asp:Panel ID="PanelView" runat="server" Visible="false">
     <asp:ImageButton ID="ImgBtnAddCart" runat="server" ImageUrl="~/Images/btn-1.gif"  />
         
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
ConnectionString="<%$ ConnectionStrings:ConnectionStringDatabase %>"
SelectCommand="Select  * From [Car], [Body Style],Make,Model,Image WHERE 
        [Car].Style_Id=[Body Style].Style_Id AND [Car].Image_Id=Image.Image_Id AND Car.Make_Id= Make.Make_Id AND Car.Model_Id=Model.Model_Id AND [Car].Car_Id=@Car_Id 
              ">
    <SelectParameters>
    <asp:QueryStringParameter Name="Car_Id" 
                              QueryStringField="Car_Id" 
                              Type="Decimal"  />
    </SelectParameters>
</asp:SqlDataSource>

    
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" Visible="True" >

      <HeaderTemplate>
        <table border="1">
            <tr style="color:darkslateblue">
                <th scope="col" >
                     <asp:Label ID="lblMake" runat="server"  Text='<%# Eval("Make") %>' />            
                     <asp:Label ID="lblModel" runat="server" Text='<%# Eval("Model") %>' />
                </th>
            
                     </tr>
    </HeaderTemplate>

    <ItemTemplate>  
       <table>


       <tr>      
           <td>
                 <asp:Label ID="lblCarId" runat="server" Visible="false" Text='<%# Eval("Car_Id") %>' />                                
                   
                 <asp:Label ID="Label1" runat="server" Text="PRICE (Rs)"  Font-Size="Medium" ForeColor="Purple"/>
          
               <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'  Font-Size="Medium" />
          
         </td>
           </tr>
       
           <tr><td>
        
               <asp:ImageButton ID="DisplayImg" runat="server"  ImageUrl='<%# Eval("Image") %>'  />
                  
           </td></tr>
           </table>

            <asp:Label ID="Label7" runat="server" Text="Specification" />
             
            
                <asp:Label ID="lblSpec" runat="server" Text='<%# Eval("Basic Specification") %>' />

        <table border="1" style="color:black;background-color:aqua;">
           <tr>
               <td>
                   <asp:Label ID="Label2" runat="server" Text="Year" />
             
               </td>

             <td>
                <asp:Label ID="lblYear" runat="server" Text='<%# Eval("Month/Year") %>' />
             
            </td>
               </tr>
            <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Color" />
             
            </td>
             <td>
                <asp:Label ID="lblColor" runat="server" Text='<%# Eval("Color") %>' />
             
            </td>
               </tr>
            <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Body Style" />
             
            </td>
             <td>
                <asp:Label ID="lblBody" runat="server" Text='<%# Eval("Body Style") %>' />
          
            </td>
                
               </tr>
               </tr>
            <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Engine No" />
             
            </td>
             <td>
                <asp:Label ID="lblEngine" runat="server" Text='<%# Eval("Engine_No") %>' />
          
            </td>
                
               </tr>
               </tr>
            <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Chasis No" />
             
            </td>
             <td>
                <asp:Label ID="lblChassis" runat="server" Text='<%# Eval("Chassis_No") %>' />
          
            </td>
                
               </tr>
             
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>

    </asp:Panel>
    
         

</asp:Content>

