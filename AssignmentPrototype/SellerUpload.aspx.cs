using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentPrototype
{
    public partial class SellerUpload : System.Web.UI.Page
    {
        DataContextDataContext db;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["seller"] == null)
            {
                string OriginalUrl = HttpContext.Current.Request.RawUrl;
                string LoginPageUrl = "SellerLogin.aspx";
                HttpContext.Current.Response.Redirect(String.Format("{0}?ReturnUrl={1}", LoginPageUrl, OriginalUrl));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

                int length = FileUpload2.PostedFile.ContentLength;
                byte[] pic = new byte[length];
                FileUpload2.PostedFile.InputStream.Read(pic, 0, length);

                db = new DataContextDataContext();
                ArtistUpload newArtistUpload = new ArtistUpload();

                newArtistUpload.authorEmail = (string) Session["seller"];
                newArtistUpload.description = Request.Form["artdescrip"];
                DateTime myDateTime = DateTime.ParseExact(Request.Form["date"], "yyyy-MM-dd", null);
                newArtistUpload.date = myDateTime;
                newArtistUpload.quantity = int.Parse(Request.Form["artquantity"]);

                newArtistUpload.productname = Request.Form["artname"];
                newArtistUpload.productPrice = decimal.Parse(Request.Form["artprice"]);


            if (FileUpload2.HasFile == false)
            {
                Response.Write("<script>alert('Please first select a file to upload...')</script>");
            }
            else
            {
                newArtistUpload.artImage = pic;
                db.ArtistUploads.InsertOnSubmit(newArtistUpload);
                db.SubmitChanges();
                Response.Write("<script>alert('Upload successful')</script>");
            }
        }
    }
}