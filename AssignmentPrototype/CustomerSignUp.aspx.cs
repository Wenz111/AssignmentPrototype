using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

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
            db = new DataContextDataContext();

            CustomerTable newCustomerTable = new CustomerTable();
            newCustomerTable.CustomerUsername = cusName.Text;
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