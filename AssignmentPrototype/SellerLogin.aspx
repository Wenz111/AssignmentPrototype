<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SellerLogin.aspx.cs" Inherits="AssignmentPrototype.SellerLogin" %>

<!DOCTYPE html
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #ff751a;
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .btn {
            background-color: #ff751a;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            opacity: 0.8;
        }

        .cancelbtn {
            width: auto;
            padding: 10px 18px;
            background-color: #ff5656;
        }

        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
            position: relative;
        }

        img.avatar {
            width: 40%;
            border-radius: 50%;
        }

        .container {
            padding: 16px;
        }

        span.psw {
            float: right;
        }

        .modal, .modal2 {
            display: block;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto 15% auto;
            border: 1px solid #888;
            width: 80%;
        }

        .close {
            position: absolute;
            right: 25px;
            top: 0;
            color: #000;
            font-size: 35px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: red;
                cursor: pointer;
            }


        .animate {
            -webkit-animation: animatezoom 0.6s;
            animation: animatezoom 0.6s
        }

        @-webkit-keyframes animatezoom {
            from {
                -webkit-transform: scale(0)
            }

            to {
                -webkit-transform: scale(1)
            }
        }

        @keyframes animatezoom {
            from {
                transform: scale(0)
            }

            to {
                transform: scale(1)
            }
        }

        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }

            .cancelbtn {
                width: 100%;
            }
        }
    </style>
</head>
<body>

    <div id="id01" class="modal">

        <form class="modal-content animate" runat="server">

            <center><h3>Dear Seller, Welcome To The Pika Art Gallery!</h3></center>

            <div class="imgcontainer">
                <asp:Image ID="Image1" ImageUrl="pic/Artist.png" runat="server" Style="width: 40%; border-radius: 50%;" />
            </div>

            <div class="container">

                <label for="uname"><b>Email</b></label>

                <asp:TextBox ID="selLogin" runat="server" placeholder="Enter Your Email" name="uname"></asp:TextBox>
                <label for="psw"><b>Password</b></label>

                <asp:TextBox ID="selPswd" runat="server" type="password" placeholder="Enter Your Password" name="psw"></asp:TextBox>
                <asp:Button ID="artiesbtn" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn" />
            </div>

            <div class="container" style="background-color: #f1f1f1">
                <span class="psw"><a href="SellerSignUp.aspx">New User?</a></span>
                <br />
            </div>
        </form>
    </div>
</body>
</html>