<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="CustomerContactUs.aspx.cs" Inherits="AssignmentPrototype.CustomerContactUs" %>

<%@ Register TagPrefix="count" TagName="totalUser" Src="~/CountTotalUser.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Contact Us
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #cssmenu ul li.active6 a {
        color: #333333;
        }

        #cssmenu ul li.active6 a:before {
        width: 100%;
        }

        body {
            background-color: #f2f2f2;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <br />

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
