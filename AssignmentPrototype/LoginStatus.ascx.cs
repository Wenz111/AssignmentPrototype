using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentPrototype
{
    public partial class LoginStatus : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["seller"] == null)
            {
                signUpBtnMain.Visible = true;
                loginBtnMain.Visible = true;

                logoutBtnMain.Visible = false;
                lblWelcomeMsg.Visible = false;
                lblLoginTime.Visible = false;
                lblLoginDate.Visible = false;
            }
            else
            {
                signUpBtnMain.Visible = false;
                loginBtnMain.Visible = false;

                logoutBtnMain.Visible = true;
                lblWelcomeMsg.Visible = true;
                lblLoginTime.Visible = true;
                lblLoginDate.Visible = true;
            }

            if (!IsPostBack)
            {
                if (Session["seller"] != null)
                {
                    DataContextDataContext objDataContext = new DataContextDataContext();
                    ArtistTable objSeller = objDataContext.ArtistTables.Single(sel => sel.authorEmail == Session["seller"]);
                    string selName = objSeller.authorName;

                    lblWelcomeMsg.Text = "Welcome back, " + selName + "!";
                    lblLoginTime.Text = "Time Now : " + DateTime.Now.ToShortTimeString();
                    lblLoginDate.Text = "Date Access : " + DateTime.Now.ToShortDateString();
                }
            }
        }

        protected void loginBtnMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SellerLogin.aspx");
        }

        protected void signUpBtnMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SellerSignUp.aspx");
        }

        protected void logoutBtnMain_Click(object sender, EventArgs e)
        {
            Session.Remove("seller");
            Response.Redirect("MainPage.aspx");
        }
    }
}