<%@ Page Title="" Language="C#" MasterPageFile="~/SiteSeller.Master" AutoEventWireup="true" CodeBehind="SellerActivity.aspx.cs" Inherits="AssignmentPrototype.SellerActivity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Seller's Activity
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

        /* File Upload Design  */
        .file-upload {
            display: inline-block;
            overflow: hidden;
            position: relative;
            left: 70px;
            top: -20px;
            text-align: center;
            vertical-align: middle;
            /* Cosmetics */
            border: 1px solid #5C005C;
            background: #5C005C;
            color: #fff;
            /* browser can do it */
            border-radius: 6px;
            -moz-border-radius: 6px;
            text-shadow: #000 1px 1px 2px;
            -webkit-border-radius: 6px;
        }

        /* The button size */
        .file-upload {
            height: 1.3em;
        }

            .file-upload, .file-upload span {
                width: 3.5em;
            }

                .file-upload input {
                    position: absolute;
                    top: 0;
                    left: 0;
                    margin: 0;
                    font-size: 11px;
                    /* Loses tab index in webkit if width is set to 0 */
                    opacity: 0;
                    filter: alpha(opacity=0);
                }

                .file-upload strong {
                    font: normal 12px Tahoma,sans-serif;
                    text-align: center;
                    vertical-align: middle;
                }

                .file-upload span {
                    position: absolute;
                    top: 0;
                    left: 0;
                    display: inline-block;
                    /* Adjust button text vertical alignment */
                    padding-top: .15em;
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
                        <div style="position: relative; top: 20px;">
                            <label class="file-upload">
                                <span><strong>Change</strong></span>
                                <asp:FileUpload ID="FileUpload1" runat="server" Width="60px"></asp:FileUpload>
                            </label>
                        </div>
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
