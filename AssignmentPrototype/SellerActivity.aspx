<%@ Page Title="" Language="C#" MasterPageFile="~/SiteSeller.Master" AutoEventWireup="true" CodeBehind="SellerActivity.aspx.cs" Inherits="AssignmentPrototype.SellerActivity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        #cssmenu ul li.active2 a {
            color: #333333;
        }

            #cssmenu ul li.active2 a:before {
                width: 100%;
            }

        .clear {
            clear: both;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">

    <h1>You've recently uploaded these arts for sales</h1>

    <asp:DataList ID="DataList1" runat="server">
        <ItemTemplate>
            <hr />
            <table style="width: 950px; margin: 0 auto;">
                <tr>
                    <td style="width: 200px;">
                        <center>
                            <asp:Image ID="Image1" Style="max-height: 100px; max-width: 100px; height: auto; width: auto;" runat="server" class="w3-hover-opacity" DataValue='<%#Eval("artImage") is DBNull ? null : Eval("artImage")%>' ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String(((System.Data.Linq.Binary)Eval("artImage")).ToArray()) %>' Height="50px" Width="50px" />
                        </center>
                    </td>
                    <td style="width: 400px;">
                        <asp:Label ID="prodName" runat="server" Text='<%# Eval("productname") %>' />
                        <br />
                        <h4>Quantity:<asp:Label ID="Label1" runat="server" Text='<%# Eval("quantity") %>' /></h4>
                    </td>
                    <td style="width: 200px;">RM
                        <asp:Label ID="productPrice" runat="server" Text='<%# Eval("productPrice") %>' />
                    </td>
                    <td></td>
                </tr>
            </table>
            <hr />
            <br />
        </ItemTemplate>
    </asp:DataList>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerContent" runat="server">
</asp:Content>
