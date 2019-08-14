<%@ Page Title="" Language="C#" MasterPageFile="~/SiteSeller.Master" AutoEventWireup="true" CodeBehind="SellerUpload.aspx.cs" Inherits="AssignmentPrototype.SellerUpload" %>

<%@ Register TagPrefix="count" TagName="totalUser" Src="~/CountTotalUser.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Upload Art Form
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inconsolata">

    <style>
        #cssmenu ul li.active1 a {
            color: #333333;
        }

            #cssmenu ul li.active1 a:before {
                width: 100%;
            }

        .clear {
            clear: both;
        }

        input, select {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        artdescrip {
            width: 100%;
            height: 150px;
            padding: 12px 20px;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            background-color: #f8f8f8;
            font-size: 16px;
            resize: none;
        }

        input[type=submit] {
            width: 100%;
            background-color: #b8b894;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-family: Arial Black;
        }

            input[type=submit]:hover {
                background-color: #45a049;
            }

        div {
            border-radius: 5px;
            padding: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">

    <div id="upoload" style="margin-top: 10px">

        <h5 class="w3-center w3-padding-64"><span class="w3-tag w3-wide">UPLOAD YOUR ART</span></h5>
        <div class="w3-container w3-section w3-white" style="margin-left: 200px; margin-right: 200px">
            <div>

                <label for="Artname">Art Name</label>
                <input type="text" name="artname" placeholder="ART name..">

                <label for="price">Price </label>
                <input type="text" name="artprice" placeholder="ART price..">

                <label for="artyear">Year of creation</label>
                <input type="date" name="date">

                <label for="artquantity">Quantity</label>
                <input type="number" name="artquantity">

                <label for="artdescrip">Description</label>
                <input type="text" name="artdescrip" placeholder="Write some description here....">

                <label for="uploadImage">Upload Image</label>
                <asp:FileUpload ID="FileUpload2" runat="server" />
                <asp:Image ID="Image1" runat="server" />

                <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />

            </div>
        </div>

    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footerContent" runat="server">

    <hr style="border-top: 1px solid #ff5722" />
    
    <%--Count total user control--%>
    <count:totalUser ID="total_user" runat="server" />

</asp:Content>
