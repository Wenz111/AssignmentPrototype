using System;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
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

            if (!IsPostBack)
            {
                
                DataContextDataContext objDataContext = new DataContextDataContext();
                CustomerTable objCustomer = objDataContext.CustomerTables.Single(cus => cus.CustomerEmail == Session["user"]);
                string customerEmail = objCustomer.CustomerEmail;

                DataContextDataContext db = new DataContextDataContext();

                var queryWishList = from p in db.WishLists
                                    join o in db.ArtistUploads on p.productID equals o.productID
                                    join s in db.ArtistTables on o.authorEmail equals s.authorEmail
                                    where p.customerEmail == customerEmail && o.authorEmail == s.authorEmail
                                    select new
                                    { p.productID, p.wishListID, p.unitPrice, o.description, p.quantity, p.customerEmail, o.productname, o.artImage, o.authorEmail, s.authorName };

                DataList1.DataSource = queryWishList;
                DataList1.DataBind();

                if (DataList1.Items.Count == 0)
                {
                    emptyWishListMessage.Text = "<br />" + "<h3>" + "You currently do not have any products in this wish list, kindly click " + "<a href=\"CustomerBrowse.aspx\">here</a>" + " to start browsing and add items into your wish list!" + "</h3>" + "<br />";
                    emptyWishListMessage.Visible = true;
                }
            }
        }



        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "addToShoppingCart")
            {
                // Get Product ID
                int prodID = Convert.ToInt32(e.CommandArgument);

                // Get products from ArtistUpload Table with this prodID
                DataContextDataContext db1 = new DataContextDataContext();
                ArtistUpload objArtistUpload = db1.ArtistUploads.Single(proID => proID.productID == prodID);


                //Validation if current quantity = 0, don't allow user to add to cart
                // Get Product quantity from seller and deduct it to see if it is 0
                DataContextDataContext dba = new DataContextDataContext();
                var deductProductQty = from p in dba.ArtistUploads
                                       join o in dba.WishLists on p.productID equals o.productID
                                       where p.productID == o.productID && p.productID == prodID
                                       select p;

                if (deductProductQty != null)
                {
                    foreach (var deductQty in deductProductQty)
                    {
                        if (deductQty.quantity >= 1)
                        {
                            // If the item has already been added to the Shopping Cart then 
                            // Prompt the item has already been added to Shopping Cart
                            // And remove the item from Wish List
                            Boolean productAlreadyInCart = false;
                            DataContextDataContext dbCheckShoppingCart = new DataContextDataContext();
                            var checkCShoppingCart = from p in dbCheckShoppingCart.ShoppingCarts
                                                     where p.productID == prodID && p.customerEmail == (string)Session["user"]
                                                     select p;

                            foreach (var checkCart in checkCShoppingCart)
                            {
                                if (checkCart.productID == prodID)
                                {
                                    productAlreadyInCart = true;
                                }
                            }

                            if (productAlreadyInCart == true)
                            {
                                Response.Write("<script>alert('" + "This item " + deductQty.productname + " has already been added to the Shopping Cart! And will be romove from your Wish List!" + "')</script>");

                                // Delete this product from wish list
                                DataContextDataContext dbDelete = new DataContextDataContext();
                                WishList deleteWishList = new WishList();
                                var query = dbDelete.WishLists.Where(wList => wList.productID == prodID).FirstOrDefault();
                                dbDelete.WishLists.DeleteOnSubmit(query);
                                dbDelete.SubmitChanges();

                                HtmlMeta oScript = new HtmlMeta();
                                oScript.Attributes.Add("http-equiv", "REFRESH");
                                oScript.Attributes.Add("content", "0; url='CustomerWishList.aspx'");
                                Page.Header.Controls.Add(oScript);
                            }

                            if (productAlreadyInCart == false)
                            {
                                // Add this product to shopping cart
                                DataContextDataContext db2 = new DataContextDataContext();
                                ShoppingCart newShoppingCart = new ShoppingCart();
                                newShoppingCart.productID = prodID;
                                newShoppingCart.productName = objArtistUpload.productname;
                                newShoppingCart.quantity = 1;
                                newShoppingCart.unitPrice = objArtistUpload.productPrice;
                                newShoppingCart.customerEmail = (string)Session["user"];
                                db2.ShoppingCarts.InsertOnSubmit(newShoppingCart);
                                db2.SubmitChanges();

                                // Delete this product from wish list
                                DataContextDataContext db3 = new DataContextDataContext();
                                WishList deleteWishList = new WishList();
                                var query = db3.WishLists.Where(wList => wList.productID == prodID).FirstOrDefault();
                                db3.WishLists.DeleteOnSubmit(query);
                                db3.SubmitChanges();

                                // Send user back to this page
                                Response.Write("<script>alert('" + "This item " + deductQty.productname + " has successfully been added to the Shopping Cart! And will be romove from your Wish List!" + "')</script>");
                                HtmlMeta oScript = new HtmlMeta();
                                oScript.Attributes.Add("http-equiv", "REFRESH");
                                oScript.Attributes.Add("content", "0; url='CustomerWishList.aspx'");
                                Page.Header.Controls.Add(oScript);
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('" + "This item " + deductQty.productname + " is currently out of stock, please email the seller for more inquiry!" + "')</script>");
                        }
                    }
                }
            }

            if (e.CommandName == "removeFromWishList")
            {
                // Get Wish list ID
                int wListID = Convert.ToInt32(e.CommandArgument);

                // Delete this product from wish list
                DataContextDataContext db = new DataContextDataContext();
                WishList deleteWishList = new WishList();
                var query = db.WishLists.Where(wList => wList.wishListID == wListID).FirstOrDefault();
                db.WishLists.DeleteOnSubmit(query);
                db.SubmitChanges();

                // Send user back to this page
                Response.Redirect("CustomerWishList.aspx");
            }
        }
    }
}