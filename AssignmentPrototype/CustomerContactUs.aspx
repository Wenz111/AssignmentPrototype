<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCustomer.Master" AutoEventWireup="true" CodeBehind="CustomerContactUs.aspx.cs" Inherits="AssignmentPrototype.CustomerContactUs" %>
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
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    This is Contact Us Page...<br /><br />

    Address:<br />
    S-40,67,Jalan Taman Ibu Kota,<br />
    Taman Danau Kota, 53000 Kuala Lumpur,<br />
    Wilayah Persekutuan Kuala Lumpur.<br /><br />

    H/P :<br />
    03-56312345<br /><br />

    Email:<br />
    abcbookstore@taruc.com
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="footerContent" runat="server">
</asp:Content>
