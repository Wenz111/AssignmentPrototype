<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="AssignmentPrototype.PurchaseHistory" %>

<%@ Register TagPrefix="count" TagName="totalUser" Src="~/CountTotalUser.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Purchase History
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #cssmenu ul li.active4 a {
            color: #333333;
        }

            #cssmenu ul li.active4 a:before {
                width: 100%;
            }

        .auto-style1 {
            text-align: center;
        }

        h1 {
            padding: 0px;
            margin: 0px;
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
    <h1>Purchase History</h1>
    <br />
    <p class="auto-style1">
        <center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="208px" Width="712px" DataSourceID="LinqDataSource1" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" AllowPaging="True" HorizontalAlign="Center" >
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="PaymentID" HeaderText="Payment ID" ReadOnly="True" SortExpression="PaymentID" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PaymentDate" HeaderText="Payment Date" ReadOnly="True" SortExpression="PaymentDate" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PaymentAmount" HeaderText="Payment Amount" ReadOnly="True" SortExpression="PaymentAmount" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PaymentType" HeaderText="Payment Type" ReadOnly="True" SortExpression="PaymentType" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
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
    </p>
    <p>
        &nbsp;
    </p>
    <p>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="AssignmentPrototype.DataContextDataContext" EntityTypeName="" Select="new (PaymentID, PaymentDate, PaymentAmount, PaymentType)" TableName="Purchases" Where="customerEmail == @customerEmail">
            <WhereParameters>
                <asp:SessionParameter Name="customerEmail" SessionField="user" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
        <br />
    </p>

    <h1>Purchase History Details</h1>
    <br />
        <h3 style="color: #3265a8; margin: 0px; padding: 0px;"><asp:Label ID="totalSpending" runat="server" Visible="false" Text=""></asp:Label></h3>
        <h3 style="color: #3265a8; margin: 0px; padding: 0px;"><asp:Label ID="artsPurchased" runat="server" Visible="false" Text=""></asp:Label></h3>
    <asp:Label ID="emptyPurchaseHistoryDetails" runat="server" Visible="false" Text=""></asp:Label>

    <%--Show customer past purchase details in this section using Data List--%>
    <asp:DataList ID="DataList1" runat="server">
                <ItemTemplate>
            <hr />
            <table style="width:950px; margin: 0 auto;">
                <tr class="border_bottom">
                    <td>
                        <h6 style="margin-top: 0px; margin-bottom: 0px;">Order <span style="color: #1a9cb7;">#<asp:Label ID="orderNum" runat="server" Text='<%# Eval("PurchaseHistoryDetailsID") %>' /></span></h6>
                        <h6 style="color: #757575; margin-top: 0px; margin-bottom: 0px;">Placed on <asp:Label ID="purchasedDate" runat="server" Text='<%# Eval("purchaseDate") %>' /></h6>
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
                        <h6 style="color: #757575; margin-top: 0px; margin-bottom: 0px;">Seller Name: <asp:Label ID="sellerName" runat="server" Text='<%# Eval("authorName") %>' /></h6>
                        <h6 style="color: #757575; margin-top: 0px; margin-bottom: 0px;">Seller Email: <asp:Label ID="sellerEmail" runat="server" Text='<%# Eval("authorEmail") %>' /></h6>
                    </td>
                    <td style="width: 160px;">
                        <h6 style="color: #757575; margin-top: 0px; margin-bottom: 0px;">Qty: <span style="color: #212121;"><asp:Label ID="quantityPurchase" runat="server" Text='<%# Eval("quantity") %>' /></span></h6>
                    </td>
                    <td style="width: 170px;">
                        <h6 style="font-size: 12px; padding: 4px 12px; display: inline-block; border-radius: 24px; background-color: yellowgreen; max-width: 150px; margin-top: 0px; margin-bottom: 0px;"><asp:Label ID="productStatus" runat="server" Text='<%# Eval("status") %>' /></h6>
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
    <%--End of showing customer past purchase details in this section using Data List--%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerContent" runat="server">

    <hr style="border-top: 1px solid #ff5722" />
    
    <%--Count total user control--%>
    <count:totalUser ID="total_user" runat="server" />

</asp:Content>
