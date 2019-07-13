using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AssignmentPrototype
{
    public partial class CustomerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user"] == null)
                {
                    Response.Redirect("CustomerLogin.aspx");
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
                // Get single customer record to display
                CustomerTable objCustomer = objDataContext.CustomerTables.Single(cus => cus.CustomerEmail == Session["user"]);

                //Fields which will be display customer details
                cusName.Text = objCustomer.CustomerName;
                cusPhoneNum.Text = objCustomer.CustomerPhoneNum;
                cusEmail.Text = objCustomer.CustomerEmail;
                cusGender.Text = objCustomer.CustomerGender;

                DateTime sdate = (DateTime) objCustomer.CustomerDOB;
                cusDOB.Text = sdate.ToString("dd-MM-yyyy");
                cusHouseAddress.Text = objCustomer.CustomerHouseAddress;
            };
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //SqlDataSource1.Update();

            using (DataContextDataContext objDataContext = new DataContextDataContext())
            {
                // Get single customer record
                CustomerTable objCustomer = objDataContext.CustomerTables.Single(cus => cus.CustomerEmail == Session["user"]);

                //Field which allow customer to update their profile
                objCustomer.CustomerName = cusName.Text;
                objCustomer.CustomerPhoneNum = cusPhoneNum.Text;
                objCustomer.CustomerEmail = cusEmail.Text;
                objCustomer.CustomerGender = cusGender.Text;
                objCustomer.CustomerDOB = DateTime.ParseExact(cusDOB.Text, "dd-MM-yyyy", null);
                objCustomer.CustomerHouseAddress = cusHouseAddress.Text;

                // executes the commands to implement the changes to the database
                objDataContext.SubmitChanges();
            }
        }
    }
}