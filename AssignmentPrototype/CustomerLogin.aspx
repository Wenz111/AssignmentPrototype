<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="AssignmentPrototype.CustomerLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        .auto-style5 {
            width: 430px;
            text-align: right;
            height: 29px;
        }
        .auto-style6 {
            width: 430px;
            text-align: right;
            height: 26px;
        }
        .auto-style7 {
            height: 26px;
        }
        .auto-style11 {
            height: 29px;
        }
        .auto-style12 {
            height: 780px;
        }
        .auto-style14 {
            text-align: center;
            height: 29px;
        }
        .auto-style15 {
            width: 430px;
            text-align: right;
            height: 200px;
        }
        .auto-style16 {
            height: 200px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
        <div class="auto-style12" style="background-image: url('pic/Coffee-Shop-Blur-Background-Wi.jpg'); background-position: center bottom; background-repeat: no-repeat;">
        <table class="auto-style1">
            <tr>
                <td class="auto-style15"></td>
                <td class="auto-style16">
                </td>
            </tr>
            <tr>
                <td class="auto-style6">Email:</td>
                <td class="auto-style7">
                    <asp:TextBox ID="cusLogin" runat="server" Width="190px" BorderWidth="1px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Password:</td>
                <td class="auto-style11">
                    <asp:TextBox ID="cusPswd" runat="server" Width="190px" BorderWidth="1px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style14" colspan="2">
                    <br />
                    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
                </td>
            </tr>
            </table>
        </div>
            </div>
    </form>
</body>
</html>
