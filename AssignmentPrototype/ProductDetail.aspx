<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="AssignmentPrototype.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }

        .auto-style2 {
            width: 100%;
        }

        .auto-style4 {
            width: 470px;
            text-align: right;
        }

        .auto-style5 {
            width: 470px;
            text-align: right;
            height: 26px;
        }

        .auto-style6 {
            height: 26px;
        }

        .auto-style7 {
            width: 492px;
        }

        .auto-style8 {
            width: 100%;
            height: 304px;
        }

        .auto-style9 {
            width: 233px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="auto-style1">
        View Product Detail:
           
        <asp:Label ID="lblProduct" runat="server"></asp:Label>
    </div>
    <br />
    <div class="auto-style1">

        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" DataKeyField="productID" CssClass="align-center">
            <ItemTemplate>
                <br />
                <table class="auto-style2">
                    <tr>
                        <td class="auto-style9">&nbsp;</td>
                        <td class="auto-style7">
                            <asp:Image ID="Image1" runat="server" class="w3-hover-opacity" DataValue='<%#Eval("artImage") is DBNull ? null : Eval("artImage")%>' Height="254px" ImageAlign="Middle" ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("artImage")) %>' Style="max-height: 50%; max-width: 50%;"/>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <div>
        <br />
        <table class="auto-style2" style="border: thin dashed #000000; padding: 1pt; margin: 1px; background-color: #CC6600; clip: rect(0px, auto, auto, auto); table-layout: auto; border-spacing: 1px; border-collapse: separate;">
            <tr>
                <td class="auto-style5" style="color: #FFFFFF">Product ID:</td>
                <td class="auto-style6">

                    <asp:Label ID="lblProductID" runat="server" ForeColor="#FFFF99"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="auto-style4" style="color: #FFFFFF">Description:</td>
                <td>

                    <asp:Label ID="lblDescription" runat="server" ForeColor="#FFFF99"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="auto-style4" style="color: #FFFFFF">Quantity:</td>
                <td>

                    <asp:Label ID="lblQuantity" runat="server" ForeColor="#FFFF99"></asp:Label>


                </td>
            </tr>
            <tr>
                <td class="auto-style5" style="color: #FFFFFF">Price</td>
                <td class="auto-style6">

                    <asp:Label ID="lblPrice" runat="server" ForeColor="#FFFF99"></asp:Label>

                </td>
            </tr>
        </table>
        <div class="auto-style1">
            <br />
            <br />
            <asp:Button ID="addToCart" runat="server" CommandArgument='&#039;<%#Eval("productID") %>&#039;' CommandName="addToCart" Text="Add to cart" OnClick="addToCart_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
            <asp:Button ID="addToWishlist" runat="server" CommandArgument='&#039;<%#Eval("productID") %>&#039;' CommandName="addToWishlist" Text="Add to wishlist" OnClick="addToWishlist_Click" />
            <br />
            <br />
            <br />


            <br />
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [artImage], [productID] FROM [ArtistUpload] WHERE ([productID] = @productID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="productID" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="footerContent" runat="server">
</asp:Content>
