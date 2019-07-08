<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="CustomerBrowse.aspx.cs" Inherits="AssignmentPrototype.CustomerBrowse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Browse
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style type="text/css">
        #cssmenu ul li.active1 a {
            color: #333333;
        }

            #cssmenu ul li.active1 a:before {
                width: 100%;
            }

        .TopBar {
            float: left;
        }

        .clear {
            clear: both;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">

    <%-- include search and filter (sort by price date etc), and with / include user's name in a top right corner!    
        
        <div class="TopBar">
        <div class="Logo">
            Logo
        </div>
    </div>

    <div class="clear"></div>--%>

    <h1>Welcome to Art Gallery!</h1>

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>


            <div class="w3-third w3-container w3-margin-bottom" style="float: left">

                <div class="w3-container w3-white">
                    <br />
                    <asp:Image ID="Image1" runat="server" DataValue='<%#Eval("artImage") is DBNull ? null : Eval("artImage")%>' ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("artImage")) %>' Style="max-height: 100%; max-width: 100%;" class="w3-hover-opacity" />
                    <p>
                        <b>
                            <asp:Label ID="lblname1" runat="server" Text='<%# Eval("productname") %>'></asp:Label></b>
                    </p>
                    <p>
                        RM
                        <asp:Label ID="lblprice1" runat="server" Text='<%# Eval("productPrice") %>'></asp:Label>
                    </p>
                    <p>
                        <asp:Label ID="lbldescrip1" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                    </p>
                    <p>
                        Date:
                        <asp:Label ID="lbldate1" runat="server" Text='<%# Eval("date", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </p>

                    <asp:Button ID="clickForMore" runat="server" Text="Click for more details" OnClick="clickForMore_Click" CommandArgument='<%#Eval("productID") %>' />
                    <br />
                    <br />
                </div>
            </div>

        </ItemTemplate>
    </asp:Repeater>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ArtistUpload]"></asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ShoppingCart]"></asp:SqlDataSource>
    <br />
    <br />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="footerContent" runat="server">
</asp:Content>
