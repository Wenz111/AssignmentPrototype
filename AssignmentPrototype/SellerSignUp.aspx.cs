using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentPrototype
{
    public partial class SellerSignUp : System.Web.UI.Page
    {
        DataContextDataContext db;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            db = new DataContextDataContext();

            ArtistTable newArtistTable = new ArtistTable();
            newArtistTable.authorUsername = selUsername.Text;
            newArtistTable.authorPswd = selPswd.Text;
            newArtistTable.authorEmail = selEmail.Text;
            newArtistTable.authorName = selName.Text;
            newArtistTable.authorGender = selGender.Text;
            newArtistTable.contact = selPhoneNum.Text;
            DateTime myDateTime = DateTime.ParseExact(Request.Form["date"], "yyyy-MM-dd", null);
            newArtistTable.authorDOB = myDateTime;
            newArtistTable.address = selHouseAddress.Text;

            db.ArtistTables.InsertOnSubmit(newArtistTable);
            db.SubmitChanges();

            Response.Write("<script>alert('You've successfully registered an account!')</script>");
            Response.Redirect("~/SellerLogin.aspx");
        }
    }
}