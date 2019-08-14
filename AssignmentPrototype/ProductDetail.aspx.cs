using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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
                // Get product ID from wish list and compare if added already then prompt 
                // the product has already been added to your wishlist and return to their Customer Wish List
                DataContextDataContext dbValidate1 = new DataContextDataContext();
                var currentWishList = from p in dbValidate1.WishLists
                                      where p.customerEmail == (string) Session["user"]
                                      select p;

                db = new DataContextDataContext();
                WishList newWishList = new WishList();

                int tempProductId = int.Parse(lblProductID.Text);
                Boolean productIdExists = false;

                // Same item cannot Add to Wish List
                foreach (var getProductId in currentWishList)
                {
                    if (getProductId.productID == tempProductId)
                    {
                        productIdExists = true;
                    }
                }

                    if (productIdExists == true)
                    {
                        Response.Write("<script>alert('The item has already been added in to your wish list!')</script>");
                        HtmlMeta oScript = new HtmlMeta();
                        oScript.Attributes.Add("http-equiv", "REFRESH");
                        oScript.Attributes.Add("content", "0; url='CustomerWishList.aspx'");
                        Page.Header.Controls.Add(oScript);
                    }
                    else
                    {
                        // Product ID not the same can Add to Cart
                        newWishList.productID = int.Parse(lblProductID.Text);
                        newWishList.quantity = 1;
                        newWishList.unitPrice = decimal.Parse(lblPrice.Text);
                        newWishList.customerEmail = (string) Session["user"];
                        db.WishLists.InsertOnSubmit(newWishList);
                        db.SubmitChanges();
                        Response.Write("<script>alert('The item has been added in to your wish list!')</script>");
                    }
            }
        } // Add to Wish List Function End




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
                // Get current Product ID
                int tempProductId = int.Parse(lblProductID.Text);

                // Validate if item quantity = 0 
                // cannot add it to the shopping cart but can add to their Wish List

                //Validation if current quantity = 0, don't allow user to add to cart
                // Get Product quantity from seller and deduct it to see if it is 0
                DataContextDataContext dba = new DataContextDataContext();
                var checkProductQty = from p in dba.ArtistUploads
                                      where p.productID == tempProductId
                                      select p;

                if (checkProductQty != null)
                {
                    foreach (var checkQty in checkProductQty)
                    {
                        if (checkQty.quantity >= 1)
                        {
                            // Add to Shopping Cart

                            // Get product ID from shopping cart and compare if added already then prompt 
                            // the product has already been added to your shopping cart and return to their Customer Shopping Cart
                            DataContextDataContext dbValidate2 = new DataContextDataContext();
                            var currentShoppingCart = from p in dbValidate2.ShoppingCarts
                                                      where p.customerEmail == (string) Session["user"]
                                                      select p;


                            db = new DataContextDataContext();
                            ShoppingCart newShoppingCart = new ShoppingCart();


                            Boolean productIdExists = false;

                            // Same item cannot Add to Wish List
                            foreach (var getProductId in currentShoppingCart)
                            {
                                if (getProductId.productID == tempProductId)
                                {
                                    productIdExists = true;
                                }
                            }

                            if (productIdExists == true)
                            {
                                Response.Write("<script>alert('The item has already been added in to your shopping cart!')</script>");
                                HtmlMeta oScript = new HtmlMeta();
                                oScript.Attributes.Add("http-equiv", "REFRESH");
                                oScript.Attributes.Add("content", "0; url='CustomerShoppingCart.aspx'");
                                Page.Header.Controls.Add(oScript);
                            }
                            else
                            {
                                // Product ID not the same can Add to Cart
                                newShoppingCart.productID = int.Parse(lblProductID.Text);
                                newShoppingCart.productName = lblProduct.Text;
                                newShoppingCart.quantity = 1;
                                newShoppingCart.unitPrice = decimal.Parse(lblPrice.Text);
                                newShoppingCart.customerEmail = (string)Session["user"];
                                db.ShoppingCarts.InsertOnSubmit(newShoppingCart);
                                db.SubmitChanges();
                                Response.Write("<script>alert('The item has been added in to your shopping cart!')</script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('" + "This item " + checkQty.productname + " is currently out of stock, please email the seller for more inquiry!" + "')</script>");
                        }
                    }
                }

                // ---------------------------------------------------------------------------------------------------------


            }
        } // Add to Cart Function End

    }
}