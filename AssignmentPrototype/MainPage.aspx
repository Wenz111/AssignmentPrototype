<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="AssignmentPrototype.MainPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style type="text/css">
        .wrapper {
            width: 950px;
            height: 500px;
            margin: auto;
        }

        body
        {
            background-image: url("pic/pikachu-bg.jpg");
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }

        .clear {
            clear: both;
        }

        .fontStyle {
            font-size: large;
            font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table class="wrapper">
                <tr>
                    <td>
                        <h3 class="fontStyle">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Welcome To The Art Gallery Main Page, 
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Kindly Choose A Login Option</h3>
                        <br /><br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="loginSellerBtn" runat="server" Text="Login as a Seller" OnClick="loginSellerBtn_Click" />
                        <br /><br /><br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="loginCustomerBtn" runat="server" Text="Login as a Customer" OnClick="loginCustomerBtn_Click" />

                    </td>
                </tr>
                </table>

        </div>
    </form>
</body>
</html>
