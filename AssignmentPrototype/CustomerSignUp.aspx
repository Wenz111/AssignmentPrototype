<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerSignUp.aspx.cs" Inherits="AssignmentPrototype.CustomerSignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Sign Up page</title>
    <style type="text/css">
        .wrapper {
            width: 950px;
            margin: auto;
        }

        .auto-style1 {
            width: 100%;
            border-style: none;
            border-width: 0px;
        }
        .auto-style7 {
            height: 26px;
        }
        .auto-style8 {
            text-align: center;
        }
        .auto-style11 {
            width: 408px;
            text-align: right;
            height: 26px;
        }
        .auto-style12 {
            width: 408px;
            text-align: right;
        }
        .auto-style14 {
            height: 780px;
        }
        .auto-style15 {
            width: 408px;
            text-align: right;
            height: 123px;
        }
        .auto-style16 {
            height: 123px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
        <div class="auto-style14" style="background-image: url('pic/Coffee-Shop-Blur-Background-Wi.jpg'); background-position: center bottom; background-repeat: no-repeat;">
        <table class="auto-style1">
            <tr>
                <td class="auto-style15"></td>
                <td class="auto-style16">
                </td>
            </tr>
            <tr>
                <td class="auto-style11">Username:</td>
                <td class="auto-style7">
                    <asp:TextBox ID="cusUsername" runat="server" Width="190px" BorderWidth="1px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">Password :</td>
                <td>
                    <asp:TextBox ID="cusPswd" runat="server" Width="190px" BorderWidth="1px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">Confirm Password :</td>
                <td>
                    <asp:TextBox ID="cusConfirmPswd" runat="server" Width="190px" BorderWidth="1px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style11">Email:</td>
                <td class="auto-style7">
                    <asp:TextBox ID="cusEmail" runat="server" Width="190px" BorderWidth="1px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">Confirm Email :</td>
                <td>
                    <asp:TextBox ID="cusConfirmEmail" runat="server" Width="190px" BorderWidth="1px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">Name:</td>
                <td>
                    <asp:TextBox ID="cusName" runat="server" Width="190px" BorderWidth="1px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">Gender :</td>
                <td>
                    <asp:TextBox ID="cusGender" runat="server" BorderWidth="1px" Width="190px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">Phone Number:</td>
                <td>
                    <asp:TextBox ID="cusPhoneNum" runat="server" BorderWidth="1px" Width="190px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">Date of Birth:</td>
                <td>
                <input type="date" name="date" />
                </td>
            </tr>
            <tr>
                <td class="auto-style12">House Address:</td>
                <td>
                    <asp:TextBox ID="cusHouseAddress" runat="server" BorderWidth="1px" Width="190px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8" colspan="2">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [CustomerTable]"></asp:SqlDataSource>
                    <br />
                    <asp:Button ID="btnSignUp" runat="server" OnClick="btnSignUp_Click" Text="Sign Up" />
                    <br />
                </td>
            </tr>
            </table>
        </div>
            </div>
    </form>
</body>
</html>
