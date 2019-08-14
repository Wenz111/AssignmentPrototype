using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Text;

namespace AssignmentPrototype
{
    public partial class CustomerShoppingCart : System.Web.UI.Page
    {
        double grandTotal = 0;
        double subTotal;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["user"] == null)
            {
                string OriginalUrl = HttpContext.Current.Request.RawUrl;
                string LoginPageUrl = "CustomerLogin.aspx";
                HttpContext.Current.Response.Redirect(String.Format("{0}?ReturnUrl={1}", LoginPageUrl, OriginalUrl));
            }

            calculateSum();
            if (PriceInTotal.Text == "0")
            {
                Label1.Visible = true;
            }
            else if (PriceInTotal.Text != "0")
            {
                Label2.Visible = true;
                PriceInTotal.Visible = true;
                Button1.Visible = true;
            }
            if (!IsPostBack)
            {
                if (Session["user"] == null)
                {
                    Response.Redirect("CustomerLogin.aspx");
                }
                else
                {
                    using (DataContextDataContext objDataContext = new DataContextDataContext())
                    {
                        CustomerTable objCustomer = objDataContext.CustomerTables.Single(cus => cus.CustomerEmail == Session["user"]);

                    }
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            calculateSum();
            GridViewRow gr = GridView1.SelectedRow;
            string id = gr.Cells[3].Text;
            Response.Redirect("ProductDetail.aspx?id=" + id);
        }

        private void calculateSum()
        {
            foreach (GridViewRow gr in GridView1.Rows)
            {
                TextBox tqnt = gr.Cells[4].FindControl("txtq") as TextBox;
                // double quantity = Convert.ToInt32(gr.Cells[4].Text.ToString());
                int quantity = Convert.ToInt32(tqnt.Text);

                subTotal = Convert.ToDouble(quantity) * Convert.ToDouble(gr.Cells[6].Text);
                gr.Cells[7].Text = subTotal.ToString();
                grandTotal = grandTotal + Convert.ToDouble(gr.Cells[7].Text);
            }
            PriceInTotal.Text = grandTotal.ToString();
        }




        protected void Button1_Click(object sender, EventArgs e)
        {
            using (DataContextDataContext objDataContext = new DataContextDataContext())
            {

// ======================================== Payment Section ===================================================================
                //    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
                //    conn.Open();
                //    CustomerTable objCustomer = objDataContext.CustomerTables.Single(cus => cus.CustomerEmail == Session["user"]);

                //    SqlDataAdapter data = new SqlDataAdapter("select * from ProductDetail", conn);

                //    string paymentType = "Online";
                //    SqlCommand cmd = new SqlCommand("insert into Purchase(paymentDate,paymentAmount,paymentType,customerEmail)values(@paymentDate,@paymentAmount,@paymentType,@customerEmail)", conn);

                //    cmd.Parameters.AddWithValue("@paymentDate", DateTime.Today);
                //    cmd.Parameters.AddWithValue("@paymentAmount", decimal.Parse(PriceInTotal.Text));
                //    cmd.Parameters.AddWithValue("@paymentType", paymentType.ToString());
                //    cmd.Parameters.AddWithValue("@customerEmail", Session["user"]);


                //    cmd.ExecuteNonQuery();
// ======================================== End Payment Section ===================================================================

                // Get Product quantity from seller and deduct it
                DataContextDataContext db1 = new DataContextDataContext();
                var deductProductQty = from p in db1.ArtistUploads
                                       join o in db1.ShoppingCarts on p.productID equals o.productID
                                       where p.productID == o.productID
                                       select p;

                // Add out of stock product to wish list
                DataContextDataContext db3 = new DataContextDataContext();
                WishList updateToWishList = new WishList();

                // Check if quantity of item is 0 
                // Then remove item from Shopping Cart
                // And add to wish list
                // If Wish List already have that item then prompt another error message

                // -------------------------------------------------------------------------------------------------------

                // Get Product quantity from seller and deduct it
                DataContextDataContext dbValidate = new DataContextDataContext();
                var checkProductQty = from p in dbValidate.ArtistUploads
                                      join o in dbValidate.ShoppingCarts on p.productID equals o.productID
                                      where p.productID == o.productID
                                      select p;

                // Boolean if true then assign that product ID into an array
                // Then add it to Wish List
                // Else perform the rest
                List<int> prodId = new List<int>();
                Boolean checkForItemLessThanZero = false;


                    foreach (var checkQty in checkProductQty)
                    {
                        if (checkQty.quantity == 0)
                        {
                            prodId.Add(checkQty.productID);
                            checkForItemLessThanZero = true;
                    }
                    }
                    

                // Add the item that have less than 0 quantity into their Wish List
                if (checkForItemLessThanZero == true)
                {
                    for (int i = 0; i < prodId.Count(); i++)
                    {
                        // Move item from Shopping Cart to Wish List
                        DataContextDataContext dbToWishList = new DataContextDataContext();
                        var moveToWishList = dbToWishList.ArtistUploads.Where(w => w.productID == prodId[i]).FirstOrDefault();

                        // Check if the item is already in wish list
                        // If it is then don't add to wish list
                        // Show an error message that the item is currently out of stock and can be found in your wish list
                        // Get product ID from wish list and compare if added already then prompt 
                        // the product has already been added to your wishlist and return to their Customer Wish List
                        DataContextDataContext dbValidate1 = new DataContextDataContext();
                        var currentWishList = from p in dbValidate1.WishLists
                                              select p;

                        DataContextDataContext db = new DataContextDataContext();
                        WishList newWishList = new WishList();

                        int tempProductId = moveToWishList.productID;
                        Boolean productIdExists = false;

                        // Same item cannot Add to Wish List
                        foreach (var getProductId in currentWishList)
                        {
                            if (getProductId.productID == tempProductId)
                            {
                                productIdExists = true;
                            }
                        }

                        // ####################################################################################################

                        if (productIdExists == true)
                        {
                            Response.Write("<script>alert('" + "The item " + moveToWishList.productname + " is currently out of stock and can be found in your wish list!" + "')</script>");

                            // Clear Shopping Cart for out of stock item
                            DataContextDataContext db4 = new DataContextDataContext();
                            var clearOutOfStockCart = from p in db4.ShoppingCarts
                                                      where p.customerEmail == (string)Session["user"] && p.productID == moveToWishList.productID
                                                      select p;

                            db4.ShoppingCarts.DeleteAllOnSubmit(clearOutOfStockCart.ToList());
                            db4.SubmitChanges();
                        }
                        else
                        {
                            // Add the product with 1 quantity to the customer the wish list
                            Response.Write("<script>alert('" + "This item " + moveToWishList.productname + " is currently out of stock and has been added to your wish list!" + "')</script>");
                            updateToWishList.productID = moveToWishList.productID;
                            updateToWishList.quantity = 1;
                            updateToWishList.unitPrice = moveToWishList.productPrice;
                            updateToWishList.customerEmail = (string)Session["user"];
                            db3.WishLists.InsertOnSubmit(updateToWishList);
                            db3.SubmitChanges();

                            // Clear Shopping Cart for out of stock item
                            DataContextDataContext db4 = new DataContextDataContext();
                            var clearOutOfStockCart = from p in db4.ShoppingCarts
                                                      where p.customerEmail == (string)Session["user"] && p.productID == moveToWishList.productID
                                                      select p;

                            db4.ShoppingCarts.DeleteAllOnSubmit(clearOutOfStockCart.ToList());
                            db4.SubmitChanges();
                        }
                    }
                    Response.Write("<script>alert('The item(s) can be found in your Wish List!\\nKindly Click on Make Payment to confirm checkout for the other items!')</script>");
                    HtmlMeta oScript = new HtmlMeta();
                    oScript.Attributes.Add("http-equiv", "REFRESH");
                    oScript.Attributes.Add("content", "0; url='CustomerShoppingCart.aspx'");
                    Page.Header.Controls.Add(oScript);
                }

                // -------------------------------------------------------------------------------------------------------

                // Reload the page, if item move to wish list, then ask the buyer to make purchase again

                if (checkForItemLessThanZero == false)
                {
                    if (deductProductQty != null)
                    {
                        foreach (var deductQty in deductProductQty)
                        {
                            if (deductQty.quantity > 0)
                            {
                                deductQty.quantity = deductQty.quantity - 1;
                            }
                        }
                        db1.SubmitChanges();
                    }

                    // Make payment and store payment in Payment History Table
                    // Store final payment into Purchase table
                    DataContextDataContext dbInsertPurchase = new DataContextDataContext();
                    Purchase newPurchase = new Purchase();
                    newPurchase.PaymentDate = DateTime.Now;
                    newPurchase.PaymentAmount = decimal.Parse(PriceInTotal.Text);
                    newPurchase.PaymentType = "Online";
                    newPurchase.customerEmail = (string) Session["user"];
                    dbInsertPurchase.Purchases.InsertOnSubmit(newPurchase);
                    dbInsertPurchase.SubmitChanges();

                    // Display Payment made
                    Response.Write("<script>alert('Your order has succesfully made!\\nAn Email regarding the purchase details has been send to your registered email address!')</script>");
                    HtmlMeta oScript = new HtmlMeta();
                    oScript.Attributes.Add("http-equiv", "REFRESH");
                    oScript.Attributes.Add("content", "0; url='CustomerShoppingCart.aspx'");
                    Page.Header.Controls.Add(oScript);

                    // Clear Shopping Cart
                    DataContextDataContext db2 = new DataContextDataContext();
                    var clearShoppingCartTable = from p in db2.ShoppingCarts
                                                 where p.customerEmail == (string)Session["user"]
                                                 select p;

                    // Before clear Shopping Cart
                    // Send an email summary of the payment and total payment
                    // Store the details in PurchaseHistory Table
                    //Set email body content
                    // Get customer name
                    DataContextDataContext dbGetName = new DataContextDataContext();
                    CustomerTable objCustomerName = dbGetName.CustomerTables.Single(cus => cus.CustomerEmail == Session["user"]);
                    string cusName = objCustomerName.CustomerName;

                    string bodyText = "Dear " + cusName + ", <br/>Thank you for your purchase using Pika Art Gallery, you've spend a total of RM " + decimal.Parse(PriceInTotal.Text) + " on " + DateTime.Now.ToShortDateString() + ", " + DateTime.Now.ToShortTimeString() + "."
                                       + "If you did not make this purchase kindly contact us at pika6084@gmail.com.";
                    bodyText += "<br/><br/>Below is a summary of your current purchase:";
                    bodyText += "<table border=" + 1 + " cellpadding=" + 0 + " cellspacing=" + 0 + " width = " + 400 + "><tr bgcolor='#f5d442'><td><center><b>Product purchased</b></center></td><td><center><b>Quantity</b></center></td><td><center><b>Price (RM)</b></center></td></tr>";

                    // for every item in shopping cart add to this email
                    if (clearShoppingCartTable != null)
                    {
                        foreach (var addToEmail in clearShoppingCartTable)
                        {
                            bodyText += "<tr><td><center>" + addToEmail.productName + "</center></td><td><center>1</center></td><td><center>" + addToEmail.unitPrice + "</center></td></tr>";
                        }
                        bodyText += "<tr><td><center><b>Total</b></center></td><td></td><td><center><b>" + decimal.Parse(PriceInTotal.Text) + "</b></center></td>";
                        bodyText += "</table>";
                    }

                    // Send email to the customer (Part 2 extension) + use string builder to customize email's body content
                    SmtpClient client = new SmtpClient();
                    client.Port = 587;
                    client.Host = "smtp.gmail.com";
                    client.EnableSsl = true;
                    client.Timeout = 10000;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new System.Net.NetworkCredential("pika6084@gmail.com", "pikachu@6084");

                    MailMessage mm = new MailMessage("donotreply@domain.com", "angzw-wm17@student.tarc.edu.my", "Pika Art Gallery Payment Receipt", bodyText);
                    mm.IsBodyHtml = true;
                    mm.BodyEncoding = UTF8Encoding.UTF8;
                    mm.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;

                    client.Send(mm);

                    // Clear Shopping Cart
                    if (clearShoppingCartTable != null)
                    {
                        db2.ShoppingCarts.DeleteAllOnSubmit(clearShoppingCartTable.ToList());
                        db2.SubmitChanges();
                    }
                }
            }
        }




        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            calculateSum();
            TextBox tqnt = GridView1.Rows[e.RowIndex].Cells[1].FindControl("txtq") as TextBox;
            string cartID = GridView1.DataKeys[e.RowIndex].Value.ToString();//foodid

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            conn.Open();

            int newQty = Convert.ToInt32(tqnt.Text);

            string updatePrice = "update ShoppingCart set Quantity ='" + newQty + "' where cartID ='" + cartID + "'";
            SqlCommand cmd2 = new SqlCommand(updatePrice, conn); //Command is to let you to select in database
            cmd2.Parameters.AddWithValue("@cartID", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
            cmd2.ExecuteNonQuery();
            GridView1.DataBind();
            GridView1.Visible = true;

            conn.Close();

            Response.Redirect("CustomerShoppingCart.aspx");
        }




        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            conn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "Delete from [ShoppingCart] Where cartID =@id1";
            cmd.Parameters.AddWithValue("@id1", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
            cmd.Connection = conn;
            cmd.ExecuteNonQuery();

            Response.Redirect("CustomerShoppingCart.aspx");
        }
    }
}