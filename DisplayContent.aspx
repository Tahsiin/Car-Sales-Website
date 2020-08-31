<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageGuest.master" AutoEventWireup="false" CodeFile="DisplayContent.aspx.vb" Inherits="DisplayContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Repeater ID="Repeater1" runat="server" Visible="True" >
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
                    Price
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
                <asp:ImageButton ID="DisplayImg" runat="server" Width="100px" Height="90px" ImageUrl='<%# Eval("Image") %>'  ToolTip="Click to view more details"  PostBackUrl='<%# Eval("Car_Id", "~/ViewCar.aspx?Car_Id={0}") %>'  />
               
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

   </asp:Content>

