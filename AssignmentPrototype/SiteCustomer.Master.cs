using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentPrototype
{
    public partial class SiteCustomer : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                signUpBtnMain.Visible = true;
                loginBtnMain.Visible = true;

                logoutBtnMain.Visible = false;
                lblWelcomeMsg.Visible = false;
            }
            else
            {
                signUpBtnMain.Visible = false;
                loginBtnMain.Visible = false;

                logoutBtnMain.Visible = true;
                lblWelcomeMsg.Visible = true;
            }

            if (!IsPostBack)
            {
                if (Session["user"] != null)
                {
                    DataContextDataContext objDataContext = new DataContextDataContext();
                    CustomerTable objCustomer = objDataContext.CustomerTables.Single(cus => cus.CustomerEmail == Session["user"]);
                    string cusName = objCustomer.CustomerName;

                    lblWelcomeMsg.Text = "Welcome back, " + cusName + "!";
                }
            }
        }


        protected void loginBtnMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerLogin.aspx");
        }

        protected void signUpBtnMain_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerSignUp.aspx");
        }

        protected void logoutBtnMain_Click(object sender, EventArgs e)
        {
            Session.Remove("user");
            Response.Redirect("MainPage.aspx");
        }
    }
}