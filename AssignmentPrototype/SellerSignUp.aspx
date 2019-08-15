<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SellerSignUp.aspx.cs" Inherits="AssignmentPrototype.SellerSignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Seller sign up</title>
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
            height: 42px;
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

            <center><h1>Dear Seller, Welcome To The Pika Art Gallery!</h1></center>

            <form id="form2" runat="server" class="auto-style3">

                <div id="textposition">
                    <asp:Label ID="Label1" runat="server" Text="User Name " CssClass=" auto-style5 "></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="selUsername" ErrorMessage="User Name cannot be empty">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="selUsername" runat="server"></asp:TextBox>
                    
                    <asp:Label ID="Label2" runat="server" Text="Password " Style="text-align: left" CssClass="auto-style5"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="selPswd" ErrorMessage="Password cannot be empty">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="selPswd" TextMode="Password" runat="server"></asp:TextBox>

                    <asp:Label ID="Label3" runat="server" Text="Confirm Password " Style="text-align: left" CssClass="   auto-style5 "></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="selConfirmPswd" ErrorMessage="Confirm Password cannot be empty">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="selPswd" ControlToValidate="selConfirmPswd" ErrorMessage="Password not match!">Password not match!</asp:CompareValidator>
                    <asp:TextBox ID="selConfirmPswd" TextMode="Password" runat="server"></asp:TextBox>
                    
                    <asp:Label ID="Label4" runat="server" Text="Email" Style="text-align: left" CssClass="auto-style5"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="selEmail" ErrorMessage="Email Cannot be empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="selEmail" ErrorMessage="Email format is not valid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="selEmail" runat="server"></asp:TextBox>
                    
                    <asp:Label ID="Label5" runat="server" Text="Your Name " Style="text-align: left" CssClass="auto-style5"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="selName" ErrorMessage="Your Name cannot be empty">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="selName" runat="server"></asp:TextBox>
                    
                    <asp:Label ID="Label6" runat="server" Text="Date of Birth" Style="text-align: left" CssClass="auto-style5"></asp:Label>
                    <input id="dateOfBirth" type="date" name="date" value="1999-12-31" min="1919-01-01" max="2019-08-14" />
                    
                    <asp:Label ID="Label7" runat="server" Text="Gender" Style="text-align: left" CssClass="auto-style5"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="selGender" ErrorMessage="Your gender cannot be empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="selGender" ValidationExpression="^Male$|^Female$" ErrorMessage="Gender should either be 'Male' or 'Female'">*</asp:RegularExpressionValidator>
                    <asp:TextBox ID="selGender" runat="server"> </asp:TextBox>
                    
                    <asp:Label ID="Label8" runat="server" Text="Phone Number  " Style="text-align: left" CssClass="auto-style12"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="selPhoneNum" ErrorMessage="Phone Number cannot be empty">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="selPhoneNum" runat="server" ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$" ErrorMessage="Phone number should be in this format XXX-XXXXXXX">*</asp:RegularExpressionValidator>
                    <asp:TextBox ID="selPhoneNum" runat="server"></asp:TextBox>
                    
                    <asp:Label ID="Label9" runat="server" Text="House Address" Style="text-align: left" CssClass="auto-style13"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="selHouseAddress" ErrorMessage="House Address is Required">*</asp:RequiredFieldValidator>
                    <asp:TextBox ID="selHouseAddress" runat="server"></asp:TextBox>

                    <asp:Button ID="btnSignUp" class="signup-btn" runat="server" OnClick="btnSignUp_Click" Text="Sign Up" />

                    <div style="position: relative; top: 30px; left: 245px;">
                        <span><a href="SellerLogin.aspx">Already Have An Account?</a></span>
                    </div>

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
