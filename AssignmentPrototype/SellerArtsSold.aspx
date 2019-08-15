<%@ Page Title="" Language="C#" MasterPageFile="~/SiteSeller.Master" AutoEventWireup="true" CodeBehind="SellerArtsSold.aspx.cs" Inherits="AssignmentPrototype.SellerArtsSold" %>

<%@ Register TagPrefix="login" TagName="userLogin" Src="~/LoginStatus.ascx" %>
<%@ Register TagPrefix="count" TagName="totalUser" Src="~/CountTotalUser.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Seller's Arts Sold
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        #cssmenu ul li.active5 a 
        {
            color: #333333;
        }

        #cssmenu ul li.active5 a:before 
        {
                width: 100%;
        }

        .clear 
        {
            clear: both;
        }

        body 
        {
            background-color: #f2f2f2;
        }

       .fontStyle
        {
            font-size: small;
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
        }

        tr.border_bottom td {
          border-bottom: 1px solid #bdb3a6;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <br />

    <%--Login user control--%>
    <login:userLogin ID="login_user" runat="server" />

    <hr style="position: relative; top: -20px; border-top: 1px solid #ff5722" />

    <h1 style="margin-bottom: 0px;">Total Arts Sold</h1>
        <br />
        <h3 style="color: #3265a8; margin: 0px; padding: 0px;"><asp:Label ID="totalProfit" runat="server" Visible="false" Text=""></asp:Label></h3>
        <h3 style="color: #3265a8; margin: 0px; padding: 0px;"><asp:Label ID="artsSold" runat="server" Visible="false" Text=""></asp:Label></h3>
        <asp:Label ID="noArtsSoldYet" runat="server" Visible="false" Text=""></asp:Label>

    <%--Show seller sold arts in this section using Data List--%>
    <asp:DataList ID="DataList1" runat="server">
                <ItemTemplate>
            <hr />
            <table style="width:950px; margin: 0 auto;">
                <tr class="border_bottom">
                    <td>
                        <h6 style="margin-top: 0px; margin-bottom: 0px;">Purchase ID <span style="color: #1a9cb7;">#<asp:Label ID="purchaseNumber" runat="server" Text='<%# Eval("PurchaseHistoryDetailsID") %>' /></span></h6>
                        <h6 style="color: #757575; margin-top: 0px; margin-bottom: 0px;">Order made on <asp:Label ID="purchasedDate" runat="server" Text='<%# Eval("purchaseDate") %>' /></h6>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="width: 200px;">
                        <center>
                            <a title="Click To View More" alt="Click To View More"
                                 href="<%# ResolveUrl(String.Format("~/ProductDetail.aspx?id={0}", Eval("productID"))) %>">
                            <asp:Image ID="Image1" Style="max-height: 100px; max-width: 100px; height: auto; width: auto;" runat="server" class="w3-hover-opacity" DataValue='<%#Eval("artImage") is DBNull ? null : Eval("artImage")%>' ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String(((System.Data.Linq.Binary)Eval("artImage")).ToArray()) %>' Height="50px" Width="50px" />
                                </a>
                        </center>
                    </td>
                    <td style="width: 250px;">
                        <h6 style="margin-top: 5px; margin-bottom: 0px;" class="fontStyle"><asp:Label ID="prodName" runat="server" Text='<%# Eval("productName") %>' /></h6>
                        <h6 style="color: #757575; margin-top: 0px; margin-bottom: 0px;">Buyer Name: <asp:Label ID="buyerName" runat="server" Text='<%# Eval("CustomerName") %>' /></h6>
                        <h6 style="color: #757575; margin-top: 0px; margin-bottom: 0px;">Buyer Email: <asp:Label ID="buyerEmail" runat="server" Text='<%# Eval("CustomerEmail") %>' /></h6>
                    </td>
                    <td style="width: 160px;">
                        <h6 style="color: #757575; margin-top: 0px; margin-bottom: 0px;">Qty: <span style="color: #212121;"><asp:Label ID="quantityPurchase" runat="server" Text='<%# Eval("quantity") %>' /></span></h6>
                    </td>
                    <td style="width: 170px;">
                        <h6 style="font-size: 12px; padding: 4px 12px; display: inline-block; border-radius: 24px; background-color: yellowgreen; max-width: 150px; margin-top: 0px; margin-bottom: 0px;">Sold</h6>
                    </td>
                    <td>
                        <h5 style="color: #757575; margin-top: 0px; margin-bottom: 0px;">RM <span style="color: #212121;"><asp:Label ID="productPrice" runat="server" Text='<%# Eval("unitPrice") %>' /></span></h5>
                    </td>
                </tr>
            </table>
            <hr />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <%--End of showing seller sold arts in this section using Data List--%>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="footerContent" runat="server">
    <hr style="border-top: 1px solid #ff5722" />
    
    <%--Count total user control--%>
    <count:totalUser ID="total_user" runat="server" />
</asp:Content>
