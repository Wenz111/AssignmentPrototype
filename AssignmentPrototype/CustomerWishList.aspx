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
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <h1>Wish List</h1>

    <asp:DataList ID="DataList1" runat="server">
        <ItemTemplate>
            <hr />
            <table style="width:950px; margin: 0 auto;">
                <tr>
                    <td style="width:200px;">
                        <center>
                            <asp:Image ID="Image1" Style="max-height: 100px; max-width: 100px; height: auto; width: auto;" runat="server" class="w3-hover-opacity" DataValue='<%#Eval("artImage") is DBNull ? null : Eval("artImage")%>' ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String(((System.Data.Linq.Binary)Eval("artImage")).ToArray()) %>' Height="50px" Width="50px" />
                        </center>
                    </td>
                    <td style="width:400px;">
                        <asp:Label ID="prodName" runat="server" Text='<%# Eval("productname") %>' />
                        <br />
                        <h6>Author Email:<asp:Label ID="Label1" runat="server" Text='<%# Eval("authorEmail") %>' /></h6>
                        <%--delete button place here--%>
                    </td>
                    <td style="width:200px;">RM<asp:Label ID="unitPrice" runat="server" Text='<%# Eval("unitPrice") %>' />
                    </td>
                    <td>
                        <%--Add to shopping cart button here--%>
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
