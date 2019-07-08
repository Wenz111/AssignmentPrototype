<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="CustomerWishList.aspx.cs" Inherits="AssignmentPrototype.CustomerWishList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #cssmenu ul li.active2 a {
        color: #333333;
        }

        #cssmenu ul li.active2 a:before {
        width: 100%;
        }

        .addToCart {
            height: 32px
        }

        .removeFromCart {
            height: 25px;
            background-color: peachpuff
        }

        body 
        {
            background-color: #f2f2f2;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <h1>Wish List</h1>

    <asp:Label ID="emptyWishListMessage" runat="server" Visible="false" Text=""></asp:Label>

    <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            <hr />
            <table style="width:950px; margin: 0 auto;">
                <tr>
                    <td style="width:200px;">
                        <center>
                            <asp:Image ID="Image1" Style="max-height: 100px; max-width: 100px; height: auto; width: auto;" runat="server" class="w3-hover-opacity" DataValue='<%#Eval("artImage") is DBNull ? null : Eval("artImage")%>' ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String(((System.Data.Linq.Binary)Eval("artImage")).ToArray()) %>' Height="50px" Width="50px" />
                        </center>
                    </td>
                    <td style="width:300px;">
                        <asp:Label ID="prodName" runat="server" Text='<%# Eval("productname") %>' />
                        <br />
                        <h6><asp:Label ID="Label2" runat="server" Text='<%# Eval("description") %>' /></h6>
                        <h6>Author Name:<asp:Label ID="Label1" runat="server" Text='<%# Eval("authorName") %>' /></h6>
                        <%--delete button place here--%>
                        <asp:ImageButton ID="removeFromCart" CssClass="removeFromCart" ImageUrl="/pic/garbage.png" CommandName="removeFromWishList" CommandArgument='<%# Eval("wishListID") %>' runat="server"></asp:ImageButton>
                    </td>
                    <td style="width:300px;">RM<asp:Label ID="unitPrice" runat="server" Text='<%# Eval("unitPrice") %>' />
                    </td>
                    <td>
                        <%--Add to shopping cart button here--%>
                        <asp:ImageButton ID="addToShoppingCart" CssClass="addToCart" ImageUrl="/pic/addToCart.png" CommandName="addToShoppingCart" CommandArgument='<%# Eval("productID") %>' runat="server"></asp:ImageButton>
                    </td>
                </tr>
            </table>
            <hr />
            <br />
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerContent" runat="server">
</asp:Content>
