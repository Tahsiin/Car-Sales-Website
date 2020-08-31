<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPageGuest.master" AutoEventWireup="false" CodeFile="Cart.aspx.vb" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:Panel ID="PanelWarning" Visible="true" runat="server">
        <div style="text-align:center; animation:ease-in-out; color:red;">
        YOU NEED TO LOGIN OR REGISTER TO VIEW YOUR CART
        </div>

    </asp:Panel>


           <div>
               <asp:Panel ID="CartItems" runat="server" Visible="false" >
        <div>
    <asp:GridView ID="GridView1"  SkinID="GridView"  runat="server" AutoGenerateColumns="False" Width="50%" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns >
           
            <asp:BoundField DataField="Make" HeaderText="Make" />

            <asp:BoundField DataField="Model" HeaderText="Model" />

            <asp:BoundField DataField="Price" HeaderText="Price" />

            

        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
            <asp:Button ID="Button1" runat="server" Text="Check out"  />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2"  runat="server" Text="Cancel" />
            <br />
            <br />
</div>

    </asp:Panel>

    <asp:Panel ID="PnlEmpty" Visible="false" runat="server">

       <h1> Cart is Empty</h1>

    </asp:Panel>


    </div>


</asp:Content>

