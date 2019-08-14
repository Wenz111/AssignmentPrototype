<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginStatus.ascx.cs" Inherits="AssignmentPrototype.LoginStatus" %>

            <div style="position: relative; left: 10px; top: -10px;">
                <asp:Button ID="loginBtnMain" Visible="false" runat="server" Text="Login" OnClick="loginBtnMain_Click" />
            </div>
            <div id="signUpBtn1" style="position: relative; top: -32px; left: 70px;">
                <asp:Button ID="signUpBtnMain" Visible="false"  runat="server" Text="Sign Up" OnClick="signUpBtnMain_Click" />
            </div>
            <div id="logoutBtn1" style="position: relative; top: -15px; left: 880px; z-index:10;">
                <asp:Button ID="logoutBtnMain" Visible="false" runat="server" Text="Logout" OnClick="logoutBtnMain_Click" />
            </div>
            <div id="welcomeStyle1" style="position: relative; top: -40px; left: 10px;">
                <asp:Label ID="lblWelcomeMsg" Visible="false" runat="server" Text="Label"></asp:Label>
            </div>
            <div id="showDate" style="position: relative; top: -40px; left: 10px;">
                <asp:Label ID="lblLoginDate" runat="server"></asp:Label>
            </div>
            <div id="showTime" style="position: relative; top: -40px; left: 10px;">
                <asp:Label ID="lblLoginTime" runat="server"></asp:Label>
            </div>

