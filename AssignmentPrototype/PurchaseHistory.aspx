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
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerContent" runat="server">

    <hr style="border-top: 1px solid #ff5722" />
    
    <%--Count total user control--%>
    <count:totalUser ID="total_user" runat="server" />

</asp:Content>
