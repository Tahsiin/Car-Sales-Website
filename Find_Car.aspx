<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageGuest.master" AutoEventWireup="false" CodeFile="Find_Car.aspx.vb" Inherits="Find_Car" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            height: 8px;
        }
        .auto-style4 {
            width: 467px;
        }
        .auto-style5 {
            margin-top: 5px;
        width: 282px;
        height: 217px;
    }
        .auto-style7 {
            width: 277px;
            height: 229px;
        }
    .auto-style8 {
        width: 386px;
    }
    .auto-style9 {
        width: 493px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table border="1" >
        <tr>
            <td class="auto-style4">


                <table class="auto-style5">

                        <tr>
                            <td colspan="2">
                              <h2 class="auto-style8">Body Style :</h2>

                            </td>
                        </tr>
        
                        <tr>

                            <td >
                                                      
                                     <asp:Button ID="BtnSedans" runat="server"  value="Sedans" BackColor="Black" BorderColor="Black" ForeColor="White" Text="Sedans" Width="60px" />
                                      
                            </td>
                            
                            <td>
                 
                                     <asp:Button ID="BtnCoupes" runat="server"  value="Coupes" BackColor="Black" BorderColor="Black" ForeColor="White" Text="Coupes" Width="60px" />
                                      
                            </td>
                        </tr>
        
                          <tr>

                           <td>
                 
                                     <asp:Button ID="BtnWagons" runat="server"  value="Wagons" BackColor="Black" BorderColor="Black" ForeColor="White" Text="Wagons" Width="60px" />
                                      
                                   &nbsp
                 
                            </td>

                            <td>
                 
                                     <asp:Button ID="BtnHatchs" runat="server"  value="Hatchs" BackColor="Black" BorderColor="Black" ForeColor="White" Text="Hatchs" Width="60px" />
                                      
                            </td>
                                 
                            </tr>

                        <tr>

                            <td>
                 
                                     <asp:Button ID="BtnSUVs" runat="server"  value="SUVs" BackColor="Black" BorderColor="Black" ForeColor="White" Text="SUVs" Width="60px" />
                                      
                                &nbsp
                    
                            </td>
                            <td>
                 
                                     <asp:Button ID="BtnConvertibles" runat="server"  value="Convertibles" BackColor="Black" BorderColor="Black" ForeColor="White" Text="Convertibles" Width="74px" />
                                      
                            </td>
                        </tr>

                        <tr>
                              <td colspan="2" class="auto-style3">
                                       
                                     <asp:Button ID="BtnMini" runat="server"  value="Mini Vehicles" BackColor="Black" BorderColor="Black" ForeColor="White" Text="Mini Vehicles" Width="151px" />
                                      
                              
                              </td>
                            
                         </tr>

         
                    </table>            
            </td> 

            
            <td class="auto-style9">
                
                <table>

         <tr >

              <td class="auto-style7">
                 
                    <h2>Find Your Car :</h2>
                  
                    Make:<br />
                   <asp:DropDownList ID="DrpMake" runat="server" Width="128px" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Make" DataValueField="Make">
                                              
                   </asp:DropDownList>
                                      &nbsp;&nbsp;&nbsp;&nbsp;
                                      <asp:Button ID="BtnFind" runat="server" Text="Find" Width="52px" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringDatabase %>" SelectCommand="SELECT Distinct [Make] FROM [Make]"></asp:SqlDataSource>
                    <br />Model:<br />
                   <asp:DropDownList ID="DrpModel" runat="server" Height="16px" Width="128px" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Model" DataValueField="Model" >
                   </asp:DropDownList>
                  &nbsp;&nbsp;&nbsp;&nbsp;
                                      <asp:Button ID="BtnFind1" runat="server" Text="Find" Width="52px" />
                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringDatabase %>" SelectCommand="SELECT Distinct [Model] FROM [Model]"></asp:SqlDataSource>
                   
                  <br/>

                  
                   <%--Year:
                  
                   <br />
                   <asp:DropDownList ID="DropDownList3" runat="server" Height="16px" Width="98px">
                   </asp:DropDownList>
&nbsp; To&nbsp;&nbsp;
                   <asp:DropDownList ID="DropDownList4" runat="server" Height="16px" Width="98px">
                   </asp:DropDownList>
                  <br/>
            
                                   Price:

                                    <br />
                                    <asp:DropDownList ID="DropDownList5" runat="server" Height="16px" Width="98px">
                                </asp:DropDownList>
                        &nbsp; To&nbsp;&nbsp;
                                     <asp:DropDownList ID="DropDownList6" runat="server" Height="16px" Width="98px">
                                </asp:DropDownList>
                            <br />
                    <br />--%>


                            </td>
                        </tr>

                  </table>
                


            </td>
        </tr>
    </table>
    
    
  <div>
        <asp:Repeater ID="Repeater1" runat="server" Visible="false" >
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
                
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td>
                <asp:Label ID="lblCarId" runat="server" Text='<%# Eval("Car_Id") %>' Visible = "false" />
                <asp:ImageButton ID="DisplayImg" runat="server" Width="100px" Height="90px" ImageUrl='<%# Eval("Image") %>'  ToolTip="Click to view more details" PostBackUrl='<%# Eval("Car_Id", "~/ViewCar.aspx?Car_Id={0}") %>' />

            </td>
                 
            <td>
                 <asp:Label ID="lblMake" runat="server" Text='<%# Eval("Make") %>' />
              
            </td>
           
            <td>
                <asp:Label ID="lblModel" runat="server" Text='<%# Eval("Model") %>' />
             
            </td>
             <td>
                <asp:Label ID="lblYear" runat="server" Text='<%# Eval("Month/Year") %>' />
             
            </td>
             <td>
                <asp:Label ID="lblColor" runat="server" Text='<%# Eval("Color") %>' />
             
            </td>
             <td>
                <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>' />
              
            </td>
             <td>
                <asp:Label ID="lblBody" runat="server" Text='<%# Eval("Body Style") %>' />
          
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>

      </div>


</asp:Content>


