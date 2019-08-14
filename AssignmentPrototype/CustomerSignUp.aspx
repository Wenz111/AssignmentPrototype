<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerSignUp.aspx.cs" Inherits="AssignmentPrototype.CustomerSignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Sign Up page</title>
    <style type="text/css">
        body {
            background-color: #5f92af;
            margin-top: 50px;
            font-family: "Mukta", sans-serif;
            color: #a4d01e;
            font-weight: 700;
        }

        a:hover {
            color: #fff;
        }

        input {
            display: block;
            height: 50px;
            border: none;
            margin-bottom: 10px;
            font-size: 1.02rem;
            border: 3px solid #555;
            Width: 366px;
        }

        button {
            font-family: "Mukta", sans-serif;
            width: 300px;
            color: #fff;
            font-size: 1.025rem;
            text-transform: uppercase;
            cursor: pointer;
            font-weight: 700;
            display: block;
            height: 50px;
            border: none;
            margin-left: 100px;
            font-size: 1.02rem;
            border: 3px solid #555;
            Width: 366px;
            position: center;
        }

            button:hover {
                opacity: 0.9;
            }

        #signup {
            margin-left: auto;
            margin-right: auto;
            background-color: #235b7b;
            height: 1070px;
            width: 600px;
            box-shadow: 8px 8px 15px #888;
            padding: 20px;
        }

        .container {
            position: relative;
            top: 40px;
        }

        .signup-text {
            font-size: 1.375rem;
            margin-bottom: 20px;
            margin-left: 20px
        }

        .signup-btn {
            background-color: #a1d613;
            margin-top: 20px;
        }

        .or {
            color: #adc8d8;
            font-size: 1.4rem;
        }

        .has-account {
            color: #5f92af;
            font-weight: 400;
        }

        .label {
            left: 50px;
            text-align: left;
            position: relative;
        }


        .auto-style1 {
            font-size: 1.375rem;
            margin-bottom: 20px;
            height: 805px;
        }

        .auto-style2 {
            font-size: 1.375rem;
            margin-bottom: 20px;
            height: 18px;
        }

        .auto-style3 {
            font-size: 1.375rem;
            margin-bottom: 20px;
            height: 972px;
            margin-top: 19px;
        }

        .auto-style5 {
            text-align: center
        }

        #textposition {
            padding-left: 100px
        }
    </style>
</head>
<body>


    <div id="signup" class="auto-style1">
        <div class="auto-style2">

            <center><h1>Dear Customer, Welcome To The Pika Art Gallery!</h1></center>

            <form id="form2" runat="server" class="auto-style3">

                <div id="textposition">
                    <asp:Label ID="Label1" runat="server" Text="User Name " Style="text-align: left" CssClass="auto-style6"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="cusUsername" ErrorMessage="User Name cannot be empty">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="cusUsername" runat="server"></asp:TextBox>

                    <asp:Label ID="Label2" runat="server" Text="Password " Style="text-align: left" CssClass="auto-style5"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="cusPswd" ErrorMessage="Password cannot be empty">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="cusPswd" TextMode="Password" runat="server"></asp:TextBox>

                    <asp:Label ID="Label3" runat="server" Text="Confirm Password " Style="text-align: left" CssClass="auto-style7"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="cusConfirmPswd" ErrorMessage="Confirm Password cannot be empty">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="cusPswd" ControlToValidate="cusConfirmPswd" ErrorMessage="Password not match!">Password not match!</asp:CompareValidator>
                    <asp:TextBox ID="cusConfirmPswd" TextMode="Password" runat="server"></asp:TextBox>

                    <asp:Label ID="Label4" runat="server" Text="Email" Style="text-align: left" CssClass="auto-style8"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="cusEmail" ErrorMessage="Email Cannot be empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="cusEmail" ErrorMessage="Email format is not valid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="cusEmail" runat="server"></asp:TextBox>

                    <asp:Label ID="Label5" runat="server" Text="Your Name " Style="text-align: left" CssClass="auto-style9"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="cusName" ErrorMessage="Your Name cannot be empty">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="cusName" runat="server"></asp:TextBox>

                    <asp:Label ID="Label6" runat="server" Text="Date of Birth" Style="text-align: left" CssClass="auto-style10"></asp:Label>
                    <input id="dateOfBirth" type="date" name="date" value="1999-12-31" min="1919-01-01" max="2019-08-14" />

                    <asp:Label ID="Label7" runat="server" Text="Gender" Style="text-align: left" CssClass="auto-style11"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="cusGender" ErrorMessage="Your gender cannot be empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="cusGender" ValidationExpression="^Male$|^Female$" ErrorMessage="Gender should either be 'Male' or 'Female'">*</asp:RegularExpressionValidator>
                    <asp:TextBox ID="cusGender" runat="server"> </asp:TextBox>

                    <asp:Label ID="Label8" runat="server" Text="Phone Number  " Style="text-align: left" CssClass="auto-style12"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="cusPhoneNum" ErrorMessage="Phone Number cannot be empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="cusPhoneNum" runat="server" ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$" ErrorMessage="Phone number should be in this format XXX-XXXXXXX">*</asp:RegularExpressionValidator>
                    <asp:TextBox ID="cusPhoneNum" runat="server"></asp:TextBox>

                    <asp:Label ID="Label9" runat="server" Text="House Address" Style="text-align: left" CssClass="auto-style13"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="cusHouseAddress" ErrorMessage="House Address is Required">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="cusHouseAddress" runat="server"></asp:TextBox>

                    <asp:Button ID="btnSignUp" runat="server" class="signup-btn" OnClick="btnSignUp_Click" Text="Sign Up" />
                
                    <div style="position: relative; top: 40px; left: -100px;">
                    <asp:ValidationSummary ID="ValidationSummary1" ForeColor="#333300" runat="server" HeaderText="The following problems have been encountered" />
                    </div>
                </div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [CustomerTable]"></asp:SqlDataSource>
            </form>

        </div>
    </div>

</body>
</html>
