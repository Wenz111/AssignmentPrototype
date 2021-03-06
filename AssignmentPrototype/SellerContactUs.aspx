﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteSeller.Master" AutoEventWireup="true" CodeBehind="SellerContactUs.aspx.cs" Inherits="AssignmentPrototype.SellerContactUs" %>

<%@ Register TagPrefix="login" TagName="userLogin" Src="~/LoginStatus.ascx" %>
<%@ Register TagPrefix="count" TagName="totalUser" Src="~/CountTotalUser.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Contact Us
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        #cssmenu ul li.active4 a {
            color: #333333;
        }

            #cssmenu ul li.active4 a:before {
                width: 100%;
            }

        .clear {
            clear: both;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    
    <br />
    <%--Login user control--%>
    <login:userLogin ID="login_user" runat="server" />

    <hr style="position: relative; top: -25px; border-top: 1px solid #ff5722" />

    Address:<br />
    S-40,67,Jalan Taman Ibu Kota,<br />
    Taman Danau Kota, 53000 Kuala Lumpur,<br />
    Wilayah Persekutuan Kuala Lumpur.<br /><br />

    H/P :<br />
    03-56312345<br /><br />

    Email:<br />
    abcbookstore@taruc.com
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerContent" runat="server">

    <hr style="border-top: 1px solid #ff5722" />
    
    <%--Count total user control--%>
    <count:totalUser ID="total_user" runat="server" />

</asp:Content>
