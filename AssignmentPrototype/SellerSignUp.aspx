<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SellerSignUp.aspx.cs" Inherits="AssignmentPrototype.SellerSignUp" %>

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
                        <td class="auto-style16"></td>
                    </tr>
                    <tr>
                        <td class="auto-style11">Username:</td>
                        <td class="auto-style7">
                            <asp:TextBox ID="selUsername" runat="server" Width="190px" BorderWidth="1px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">Password :</td>
                        <td>
                            <asp:TextBox ID="selPswd" runat="server" Width="190px" BorderWidth="1px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">Confirm Password :</td>
                        <td>
                            <asp:TextBox ID="selConfirmPswd" runat="server" Width="190px" BorderWidth="1px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">Email:</td>
                        <td class="auto-style7">
                            <asp:TextBox ID="selEmail" runat="server" Width="190px" BorderWidth="1px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">Confirm Email :</td>
                        <td>
                            <asp:TextBox ID="selConfirmEmail" runat="server" Width="190px" BorderWidth="1px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">Name:</td>
                        <td>
                            <asp:TextBox ID="selName" runat="server" Width="190px" BorderWidth="1px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">Gender :</td>
                        <td>
                            <asp:TextBox ID="selGender" runat="server" BorderWidth="1px" Width="190px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">Phone Number:</td>
                        <td>
                            <asp:TextBox ID="selPhoneNum" runat="server" BorderWidth="1px" Width="190px"></asp:TextBox>
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
                            <asp:TextBox ID="selHouseAddress" runat="server" BorderWidth="1px" Width="190px"></asp:TextBox>
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
