﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SiteSeller.Master" AutoEventWireup="true" CodeBehind="SellerProfile.aspx.cs" Inherits="AssignmentPrototype.SellerProfile" %>

<%@ Register TagPrefix="login" TagName="userLogin" Src="~/LoginStatus.ascx" %>
<%@ Register TagPrefix="count" TagName="totalUser" Src="~/CountTotalUser.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Seller's Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #cssmenu ul li.active3 a {
            color: #333333;
        }

            #cssmenu ul li.active3 a:before {
                width: 100%;
            }

        *, *:before, *:after {
            box-sizing: inherit
        }

        .auto-style4 {
            height: 600px;
        }

        input[type=text] {
            width: 800px;
            height: 35px;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            background-color: white;
            padding: 12px 20px 12px 40px;
            -webkit-transition: width 0.4s ease-in-out;
            transition: width 0.4s ease-in-out;
        }


        button, input {
            overflow: visible
        }

        button, input, select, textarea, optgroup {
            font: inherit;
            margin: 0
        }

        [type=checkbox], [type=radio] {
            padding: 0
        }

        .auto-style9 {
            height: 34px;
        }

        .auto-style2 {
            height: 80px;
        }

        textarea {
            overflow: auto
        }

        button, [type=button], [type=reset], [type=submit] {
            -webkit-appearance: button
        }

        .auto-style2 {
            width: 253px;
        }

        .auto-style4 {
            height: 26px;
        }

        .auto-style21 {
            height: 26px;
            text-align: left;
            width: 253px;
        }

        .auto-style22 {
            height: 102px;
        }

        .auto-style23 {
            width: 78%;
            height: 526px;
            margin-left: 103px;
        }

        .auto-style24 {
            height: 140px;
            width: 253px;
        }

        .auto-style25 {
            height: 140px;
        }

        .auto-style27 {
            height: 30px;
            width: 253px;
        }

        .auto-style28 {
            height: 30px;
        }

        .auto-style29 {
            height: 50px;
            width: 253px;
        }

        .auto-style30 {
            height: 34px;
            text-align: left;
            width: 253px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <br />
    
    <%--Login user control--%>
    <login:userLogin ID="login_user" runat="server" />

    <hr style="position: relative; top: -30px; border-top: 1px solid #ff5722" />

    <table class="auto-style23">
        <tr>
            <td class="auto-style21">Name:</td>
            <td class="auto-style4">
                <asp:TextBox ID="selName" runat="server" Height="20px" Width="312px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="selName" InitialValue="" ErrorMessage="Name is required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style27">Gender:</td>
            <td class="auto-style28">
                <asp:TextBox ID="selGender" runat="server" Enabled="false" Height="20px" Width="316px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style29">H/P No:</td>
            <td>
                <asp:TextBox ID="selPhoneNum" runat="server" Height="20px" Width="316px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="selPhoneNum" InitialValue="" ForeColor="Red" runat="server" ErrorMessage="Phone Number is Required">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="selPhoneNum" runat="server" ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$" ErrorMessage="Phone number should be in this format XXX-XXXXXXX">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style30">Email:</td>
            <td class="auto-style9">
                <asp:TextBox ID="selEmail" runat="server" Height="20px" Width="316px" Enabled="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Date Of Birth:</td>
            <td>
                <asp:TextBox ID="selDOB" runat="server" Height="20px" Width="212px" Enabled="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style24">Shipping Address:</td>
            <td class="auto-style25">
                <asp:TextBox ID="selHouseAddress" runat="server" Height="110px" Width="219px" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="selHouseAddress" InitialValue="" ForeColor="Red" runat="server" ErrorMessage="House Address is Required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="The following problems have been encountered" />
        </tr>
        <tr>
            <td class="auto-style22" colspan="2">
                <asp:Button ID="btnSave" runat="server" Text="Save" Width="186px" OnClick="btnSave_Click" />
            </td>
        </tr>
    </table>

    &nbsp;
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="footerContent" runat="server">

    <hr style="border-top: 1px solid #ff5722" />
    
    <%--Count total user control--%>
    <count:totalUser ID="total_user" runat="server" />

</asp:Content>
