<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="CustomerShoppingCart.aspx.cs" Inherits="AssignmentPrototype.CustomerShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Shopping Cart
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        #cssmenu ul li.active3 a {
            color: #333333;
        }

            #cssmenu ul li.active3 a:before {
                width: 100%;
            }
        .auto-style1 {
            margin-right: 98px;
            margin-top: 1px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div>
    </div>
    <center>
        <br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  OnRowDeleting="GridView1_RowDeleting"   OnRowUpdating="GridView1_RowUpdating" onrow ="637px" Height="215px" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" DataKeyNames="cartID" CssClass="auto-style1" Width="738px">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
<%--            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="button2" runat="server" CommandName="Update" ToolTip="Update" Text="Update"/>
                    <asp:Button ID="button3" runat="server" CommandName="Delete" ToolTip="Delete" Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:ButtonField CommandName="Delete" ShowHeader="True" Text="Delete" />
            <asp:ButtonField CommandName="Select" ShowHeader="True" Text="Select" />
            <asp:ButtonField CommandName="Update" ShowHeader="True" Text="Update" />
            <asp:BoundField DataField="productID" HeaderText="Product ID" SortExpression="productID" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="productName" HeaderText="Product Name" SortExpression="productName" >
             <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
             <asp:TemplateField HeaderText="Quantity">
                 <ItemTemplate>
                <asp:TextBox ID="txtq" runat="server" Text='<%# Bind("quantity") %>' Height="20px" Width="40px" />
                </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
             <asp:BoundField DataField="unitPrice" HeaderText="Unit Price(RM)" SortExpression="unitPrice" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Sub Total">
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>

        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />

    </asp:GridView>

        </center>
    <center>
        <asp:Label ID="Label1" runat="server" Text="Your Shopping Cart Is Empty" Visible="False"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Total Price Is RM:" Visible="False"></asp:Label>
        <asp:Label ID="PriceInTotal" runat="server" Visible="False"></asp:Label>
  
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Make Payment" Visible="False" />
        <br />
        <br />
    <br />

    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CustomerBrowse.aspx">Continue Shopping</asp:HyperLink>
    </center>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [cartID], [productID], [productName], [quantity], [unitPrice] FROM [ShoppingCart]" DeleteCommand="DELETE FROM ShoppingCart WHERE cartID = @cartID ">
        <DeleteParameters>
            <asp:Parameter Name="cartID" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerContent" runat="server">
</asp:Content>

<%--        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:TemplateField HeaderText="">
             <ItemTemplate>
             <asp:Button ID="Button2" runat="server" Text="Delete" CommandName="Delete" CommandArgument="cartID" />
            </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="productID" HeaderText="Product ID" SortExpression="productID" />
            <asp:BoundField DataField="productName" HeaderText="Product Name" SortExpression="productName" />
             <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
             <asp:BoundField DataField="unitPrice" HeaderText="Unit Price(RM)" SortExpression="unitPrice" />
<asp:TemplateField HeaderText="Sub Total"></asp:TemplateField>--%>