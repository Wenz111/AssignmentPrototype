using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

namespace AssignmentPrototype
{
    public partial class CustomerSignUp : System.Web.UI.Page
    {
        DataContextDataContext db;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Boolean emailExists = false;

            // Check if an Email already exists in the database
            // If yes display an alert message and refresh the page
            DataContextDataContext dbEmail = new DataContextDataContext();
            var getCustomerEmail = from p in dbEmail.CustomerTables
                                   select p;

            // Same Email Cannot Add Register
            foreach (var getExistsEmail in getCustomerEmail)
            {
                if (getExistsEmail.CustomerEmail == cusEmail.Text)
                {
                    emailExists = true;
                }
            }

            if (emailExists == true)
            {
                Response.Write("<script>alert('The Email has already been taken and registered with this website')</script>");
            }

            if (emailExists == false)
            {
                db = new DataContextDataContext();

                CustomerTable newCustomerTable = new CustomerTable();
                newCustomerTable.CustomerUsername = cusUsername.Text;
                newCustomerTable.CustomerPswd = cusPswd.Text;
                newCustomerTable.CustomerEmail = cusEmail.Text;
                newCustomerTable.CustomerName = cusName.Text;
                newCustomerTable.CustomerGender = cusGender.Text;
                newCustomerTable.CustomerPhoneNum = cusPhoneNum.Text;

                DateTime myDateTime = DateTime.ParseExact(Request.Form["date"], "yyyy-MM-dd", null);
                newCustomerTable.CustomerDOB = myDateTime;
                newCustomerTable.CustomerHouseAddress = cusHouseAddress.Text;

                db.CustomerTables.InsertOnSubmit(newCustomerTable);
                db.SubmitChanges();


                Response.Write("<script>alert('You've successfully registered an account!')</script>");
                Response.Redirect("~/CustomerLogin.aspx");
            }
        }
    }
}