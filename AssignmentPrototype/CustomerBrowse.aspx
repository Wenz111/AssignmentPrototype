<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="CustomerBrowse.aspx.cs" Inherits="AssignmentPrototype.CustomerBrowse" %>

<%@ Register TagPrefix="count" TagName="totalUser" Src="~/CountTotalUser.ascx" %>

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

        body {
            background-color: #f2f2f2;
        }

        .btnSize {
            width: 60px;
            height: 60px;
            position: relative;
            top: 31px;
        }

        .btnClear {
            width: 30px;
            height: 30px;
            position: relative;
            top: 9px;
            left: -100px;
        }

        input[type="submit" i] {
            font: 400 13.3333px Arial;
        }

        #signUpBtn1 {
            top: -19px;
            margin-bottom: -34px;
        }

        #signUpBtn1:focus {
                outline: none !important;
                border: none !important;
                border-style:none !important;
                padding: 0 !important;
        }

        #logoutBtn1 {
            position: relative;
            top: 38px;
            left: 880px;
            z-index:99 !important;
        }

        #welcomeStyle1 {
            position: relative;
            top: 17px;
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

    <div class="clear"></div>

    <div id="search">         
         <asp:TextBox ID="txtSearchBox" runat="server"></asp:TextBox>
        <asp:ImageButton ID="btnSearch" CssClass="btnSize" ImageUrl="pic/searchButton.png" OnClick="btnSearch_Click" runat="server" />
        <asp:ImageButton ID="btnSearchClear" CssClass="btnClear" ImageUrl="pic/delete (3).png" OnClick="btnClear_Click" runat="server" />
        <br /><br />
        <asp:Label ID="lblCount" runat="server" Visible="false"></asp:Label>
     </div>

    <div class="clear"></div>
    <br />
    <div>         
         Sort By: <asp:DropDownList ID="ddlSortArtProduct" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSortArtProduct_SelectedIndexChanged">
             <asp:ListItem>Default</asp:ListItem>
             <asp:ListItem>Lowest to Highest Price</asp:ListItem>
             <asp:ListItem>Highest To Lowest Price</asp:ListItem>
             <asp:ListItem>Oldest To Newest</asp:ListItem>
             <asp:ListItem>Newest To Oldest</asp:ListItem>
         </asp:DropDownList>
     </div>
    <br />
    <div class="clear"></div>

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="w3-third w3-container w3-margin-bottom" style="float: left">
                <div class="w3-container w3-white">
                    <br />
                   <%-- <asp:Image ID="Image1" runat="server" DataValue='<%#Eval("artImage") is DBNull ? null : Eval("artImage")%>' ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String((byte[])Eval("artImage")) %>' Style="max-height: 100%; max-width: 100%;" class="w3-hover-opacity" />--%>
                    <center>
                        <a title="Click To View More" alt="Click To View More"
                                 href="<%# ResolveUrl(String.Format("~/ProductDetail.aspx?id={0}", Eval("productID"))) %>">
                     <asp:Image ID="Image1" Style="height: 250px; width: 250px;" runat="server" class="w3-hover-opacity" DataValue='<%#Eval("artImage") is DBNull ? null : Eval("artImage")%>' ImageUrl='<%# "data:image/jpg;base64," + Convert.ToBase64String(((System.Data.Linq.Binary)Eval("artImage")).ToArray()) %>' />
                        </a>
                    </center>
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
    
    <hr style="border-top: 1px solid #ff5722" />
    
    <%--Count total user control--%>
    <count:totalUser ID="total_user" runat="server" />
</asp:Content>
