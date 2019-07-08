using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentPrototype
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        static string cname;
        static string stringcmd = "";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        SqlDataReader dr;

        DataContextDataContext db;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                cname = Request.QueryString["id"];
                conn.Open();
                stringcmd = "select * from ArtistUpload where productID='" + cname + "'";
                SqlCommand cmd1 = new SqlCommand(stringcmd, conn);
                dr = cmd1.ExecuteReader();
                dr.Read();
                lblProduct.Text = dr["productname"].ToString();
                lblDescription.Text = dr["description"].ToString();
                lblPrice.Text = dr["productPrice"].ToString();
                lblProductID.Text = dr["productID"].ToString();
                lblQuantity.Text = dr["quantity"].ToString();

                conn.Close();
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void addToWishlist_Click(object sender, EventArgs e)
        {
                if (Session["user"] == null)
                {
                    string OriginalUrl = HttpContext.Current.Request.RawUrl;
                    string LoginPageUrl = "CustomerLogin.aspx";
                    HttpContext.Current.Response.Redirect(String.Format("{0}?ReturnUrl={1}", LoginPageUrl, OriginalUrl));
                }

                using (DataContextDataContext objDataContext = new DataContextDataContext())
                {

                    db = new DataContextDataContext();
                    WishList newWishList = new WishList();
                    newWishList.productID = int.Parse(lblProductID.Text);
                    newWishList.quantity = 1;
                    newWishList.unitPrice = decimal.Parse(lblPrice.Text);
                    newWishList.customerEmail = (string)Session["user"];
                    db.WishLists.InsertOnSubmit(newWishList);
                    db.SubmitChanges();
                }

                Response.Write("<script>alert('The item has been added in to your wish list!')</script>");
        }

        protected void addToCart_Click(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                string OriginalUrl = HttpContext.Current.Request.RawUrl;
                string LoginPageUrl = "CustomerLogin.aspx";
                HttpContext.Current.Response.Redirect(String.Format("{0}?ReturnUrl={1}", LoginPageUrl, OriginalUrl));
            }

            conn.Open();

            using (DataContextDataContext objDataContext = new DataContextDataContext())
            {

                db = new DataContextDataContext();
                ShoppingCart newShoppingCart = new ShoppingCart();
                newShoppingCart.productID = int.Parse(lblProductID.Text);
                newShoppingCart.productName = lblProduct.Text;
                newShoppingCart.quantity = 1;
                newShoppingCart.unitPrice = decimal.Parse(lblPrice.Text);
                newShoppingCart.customerEmail = (string)Session["user"];
                db.ShoppingCarts.InsertOnSubmit(newShoppingCart);
                db.SubmitChanges();
            }

            Response.Write("<script>alert('The item has added in to your shopping cart!')</script>");
        }
    }

}