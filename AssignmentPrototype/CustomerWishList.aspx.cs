using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentPrototype
{
    public partial class CustomerWishList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                string OriginalUrl = HttpContext.Current.Request.RawUrl;
                string LoginPageUrl = "CustomerLogin.aspx";
                HttpContext.Current.Response.Redirect(String.Format("{0}?ReturnUrl={1}", LoginPageUrl, OriginalUrl));
            }

            DataContextDataContext objDataContext = new DataContextDataContext();
            CustomerTable objCustomer = objDataContext.CustomerTables.Single(cus => cus.CustomerEmail == Session["user"]);
            string customerEmail = objCustomer.CustomerEmail;

            DataContextDataContext db = new DataContextDataContext();

            var queryWishList = from p in db.WishLists
                                join o in db.ArtistUploads on p.productID equals o.productID
                                where p.customerEmail == customerEmail
                                select new
                                { p.productID, p.wishListID, p.unitPrice, p.quantity, p.customerEmail, o.productname, o.artImage, o.authorEmail };

            DataList1.DataSource = queryWishList;
            DataList1.DataBind();
        }
    }
}