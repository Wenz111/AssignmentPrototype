using System;
using System.Web.UI.WebControls;

namespace AssignmentPrototype
{
    public partial class CustomerBrowse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void clickForMore_Click(object sender, EventArgs e)
        {
            Button btn = (sender as Button);
            string id = btn.CommandArgument;
            Response.Redirect("ProductDetail.aspx?id=" + id);
        }
    }
}