using System;
using System.Web;

namespace AssignmentPrototype
{
    public partial class SellerContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["seller"] == null)
            {

            }
        }
    }
}