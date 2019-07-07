using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentPrototype
{
    public partial class SellerActivity : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["seller"] == null)
            {
                string OriginalUrl = HttpContext.Current.Request.RawUrl;
                string LoginPageUrl = "SellerLogin.aspx";
                HttpContext.Current.Response.Redirect(String.Format("{0}?ReturnUrl={1}", LoginPageUrl, OriginalUrl));
            }

            //Do database transactions to display products listing
            DataContextDataContext objDataContext = new DataContextDataContext();
            ArtistUpload objArtistUpload = objDataContext.ArtistUploads.Single(sel => sel.authorEmail == Session["seller"]);
            string sellerEmail = objArtistUpload.authorEmail;

            DataContextDataContext db = new DataContextDataContext();
            var queryProduct = from p in db.ArtistUploads
                               where p.authorEmail == sellerEmail
                               select p;

            DataList1.DataSource = queryProduct;
            DataList1.DataBind();
        }

    }
}