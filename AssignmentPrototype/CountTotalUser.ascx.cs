using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentPrototype
{
    public partial class CountTotalUser : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblVisitors.Text = Application["count"].ToString();
            lblAccessDate.Text = Session["mydate"].ToString();
        }
    }
}