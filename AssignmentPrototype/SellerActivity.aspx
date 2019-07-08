<%@ Page Title="" Language="C#" MasterPageFile="~/SiteSeller.Master" AutoEventWireup="true" CodeBehind="SellerActivity.aspx.cs" Inherits="AssignmentPrototype.SellerActivity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        #cssmenu ul li.active2 a 
        {
            color: #333333;
        }

        #cssmenu ul li.active2 a:before 
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

        .editStyle 
        {
            height: 40px;
            background-color: #f2f2f2
        }

        .deleteStyle 
        {
            height: 40px;
            background-color: #f2f2f2
        }

        h4, h5 
        {
            display: inline-block;
            padding: 0px;
            margin: 1px;
        }

        .fontStyle
        {
            font-size: small;
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
        }

        .updatedStyle 
        {
            height: 40px;
            background-color: #f2f2f2
        }

        .cancelStyle 
        {
            height: 40px;
            background-color: #f2f2f2
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">

    <h1>You've recently uploaded these arts for sales</h1>

    <asp:DataList ID="DataList1" runat="server" OnEditCommand="DataList1_EditCommand" OnUpdateCommand="DataList1_UpdateCommand" OnCancelCommand="DataList1_CancelCommand" OnDeleteCommand="DataList1_DeleteCommand">
        <EditItemTemplate>
            <asp:Label ID="productId1" runat="server" Visible="false" Text='<%# Eval("productID") %>'></asp:Label>
            <br />
            <hr />
            <table style="width: 950px; margin: 0 auto;">
                <tr>
                    <td style="width: 200px;">
                        <center>
                            <asp:Image ID="Image1" Style="max-height: 100px; max-width: 100px; height: auto; width: auto;" runat="server" class="w3-hover-opacity" DataValue='<%#Eval("artImage") is DBNull ? null : Eval("artImage")%>' ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String(((System.Data.Linq.Binary)Eval("artImage")).ToArray()) %>' Height="50px" Width="50px" />
                        </center>
                    </td>
                    <td style="width: 350px;">
                        <span class="fontStyle">Name: <h5><asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("productname") %>'></asp:TextBox></h5></span>
                        <br />
                        <span class="fontStyle">Product Description: <h5><asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("description") %>'></asp:TextBox></h5></span>
                        <br />
                        <span class="fontStyle">Quantity: <h4><asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("quantity") %>'></asp:TextBox></h4></span>
                    </td>
                    <td style="width: 200px;">RM </span><h4><asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("productPrice") %>' Width="70px"></asp:TextBox></h4></span>
                    </td>
                    <td>
                        <asp:ImageButton ID="UpdateButton" CommandName="Update" CssClass="updatedStyle" ImageUrl="/pic/updated.png" runat="server" Text="Update" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="CancelButton" CommandName="Cancel" CssClass="cancelStyle" ImageUrl="/pic/delete (1).png" runat="server" Text="Cancel" />
                    </td>
                </tr>
            </table>
            <hr />
            <br />
        </EditItemTemplate>

        <%--Normal Item Template - used to display existing record from database--%>
        <ItemTemplate>
            <hr />
            <table style="width: 950px; margin: 0 auto;">
                <tr>
                    <td style="width: 200px;">
                        <center>
                            <asp:Label ID="productId2" runat="server" Visible="false" Text='<%# Eval("productID") %>'></asp:Label>
                            <asp:Image ID="Image1" Style="max-height: 100px; max-width: 100px; height: auto; width: auto;" runat="server" class="w3-hover-opacity" DataValue='<%#Eval("artImage") is DBNull ? null : Eval("artImage")%>' ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String(((System.Data.Linq.Binary)Eval("artImage")).ToArray()) %>' Height="50px" Width="50px" />
                        </center>
                    </td>
                    <td style="width: 350px;">
                        <span class="fontStyle">Name: <h5><asp:Label ID="prodName" runat="server" Text='<%# Eval("productname") %>' /></h5></span>
                        <br />
                        <span class="fontStyle">Product Description: <h5><asp:Label ID="prodDescription" runat="server" Text='<%# Eval("description") %>' /></h5></span>
                        <br />
                        <span class="fontStyle">Quantity: <h4><asp:Label ID="Label1" runat="server" Text='<%# Eval("quantity") %>' /></h4></span>
                    </td>
                    <td style="width: 200px;">RM </span><h4><asp:Label ID="productPrice" runat="server" Text='<%# Eval("productPrice") %>' /></h4></span>
                    </td>
                    <td>
                        <asp:ImageButton ID="EditButton" CssClass="editStyle" ImageUrl="/pic/edit.png" CommandName="Edit" runat="server" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:ImageButton ID="DeleteButton" OnClientClick="return confirm('Are you sure you want to delete? This action is not recoverable!')" CssClass="deleteStyle" ImageUrl="/pic/delete.png" CommandName="Delete" runat="server" />
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
