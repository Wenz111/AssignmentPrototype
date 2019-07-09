using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentPrototype
{
    public partial class SellerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["seller"] == null)
                {
                    Response.Redirect("SellerLogin.aspx");
                }
                else
                {
                    showData();
                }
            }
        }

        public void showData()
        {
            using (DataContextDataContext objDataContext = new DataContextDataContext())
            {
                // Get single seller record to display
                ArtistTable objSeller = objDataContext.ArtistTables.Single(sel => sel.authorEmail == Session["seller"]);

                //Fields which will be display customer details
                selName.Text = objSeller.authorName;
                selPhoneNum.Text = objSeller.contact;
                selEmail.Text = objSeller.authorEmail;
                selGender.Text = objSeller.authorGender;

                DateTime sdate = (DateTime)objSeller.authorDOB;
                selDOB.Text = sdate.ToString("dd-MM-yyyy");
                selHouseAddress.Text = objSeller.address;
            };
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //SqlDataSource1.Update();

            using (DataContextDataContext objDataContext = new DataContextDataContext())
            {
                // Get single customer record
                ArtistTable objSeller = objDataContext.ArtistTables.Single(sel => sel.authorEmail == Session["seller"]);

                //Field which allow customer to update their profile
                objSeller.authorName = selName.Text;
                objSeller.contact = selPhoneNum.Text;
                objSeller.authorEmail = selEmail.Text;
                objSeller.authorGender = selGender.Text;
                objSeller.authorDOB = DateTime.ParseExact(selDOB.Text, "dd-MM-yyyy", null);
                objSeller.address = selHouseAddress.Text;

                // executes the commands to implement the changes to the database
                objDataContext.SubmitChanges();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("seller");
            Session.RemoveAll(); //Removes all session variables
            Response.Redirect("MainPage.aspx");
        }
    }
}