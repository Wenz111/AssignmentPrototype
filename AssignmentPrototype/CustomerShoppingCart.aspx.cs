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
                        calculateSum();
                    }
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
            string id = gr.Cells[1].Text;
            Response.Redirect("ProductDetail.aspx?id=" + id);
        }

        private void calculateSum()
        {
            foreach (GridViewRow gr in GridView1.Rows)
            {
                subTotal = Convert.ToDouble(gr.Cells[3].Text) * Convert.ToDouble(gr.Cells[4].Text);
                gr.Cells[5].Text = subTotal.ToString();
                grandTotal = grandTotal + Convert.ToDouble(gr.Cells[5].Text);
            }
            PriceInTotal.Text = grandTotal.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Set email body content
            //string totalPaid = PriceInTotal.Text;
            //string bodyText = "Thank you for your purchase using Pika Art Gallery, you've spend a total of RM " + totalPaid + " on " + DateTime.Now.ToShortDateString() + ", " + DateTime.Now.ToShortTimeString() + "."
            //    + Environment.NewLine + "If you did not make this purchase kindly contact us at pika6084@gmail.com";

            using (DataContextDataContext objDataContext = new DataContextDataContext())
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
                conn.Open();
                CustomerTable objCustomer = objDataContext.CustomerTables.Single(cus => cus.CustomerEmail == Session["user"]);

                SqlDataAdapter data = new SqlDataAdapter("select * from ProductDetail", conn);

                string paymentType = "Online";
                SqlCommand cmd = new SqlCommand("insert into Purchase(paymentDate,paymentAmount,paymentType,customerEmail)values(@paymentDate,@paymentAmount,@paymentType,@customerEmail)", conn);

                cmd.Parameters.AddWithValue("@paymentDate", DateTime.Today);
                cmd.Parameters.AddWithValue("@paymentAmount", decimal.Parse(PriceInTotal.Text));
                cmd.Parameters.AddWithValue("@paymentType", paymentType.ToString());
                cmd.Parameters.AddWithValue("@customerEmail", Session["user"]);


                cmd.ExecuteNonQuery();

                // Get Product quantity from seller and deduct it
                DataContextDataContext db1 = new DataContextDataContext();
                var deductProductQty = from p in db1.ArtistUploads
                                       join o in db1.ShoppingCarts on p.productID equals o.productID
                                       where p.productID == o.productID
                                       select p;

                // Add out of stock product to wish list
                DataContextDataContext db3 = new DataContextDataContext();
                WishList updateToWishList = new WishList();

                if (deductProductQty != null)
                {
                    foreach (var deductQty in deductProductQty)
                    {
                        if (deductQty.quantity > 0)
                        {
                            deductQty.quantity = deductQty.quantity - 1;
                        }
                        else
                        {
                            // Add the product with 0 quantity to the customer the wish list
                            Response.Write("<script>alert('" + "This item " + deductQty.productname + " is currently out of stock and has been added to your wish list!" + "')</script>");
                            updateToWishList.productID = deductQty.productID;
                            updateToWishList.quantity = 1;
                            updateToWishList.unitPrice = deductQty.productPrice;
                            updateToWishList.customerEmail = (string)Session["user"];
                            db3.WishLists.InsertOnSubmit(updateToWishList);
                            db3.SubmitChanges();

                            // Clear Shopping Cart for out of stock item
                            DataContextDataContext db4 = new DataContextDataContext();
                            var clearOutOfStockCart = from p in db4.ShoppingCarts
                                                      where p.customerEmail == (string)Session["user"] && p.productID == deductQty.productID
                                                      select p;

                            db4.ShoppingCarts.DeleteAllOnSubmit(clearOutOfStockCart.ToList());
                            db4.SubmitChanges();
                        }
                    }
                    db1.SubmitChanges();
                }

                // Clear Shopping Cart
                DataContextDataContext db2 = new DataContextDataContext();
                var clearShoppingCartTable = from p in db2.ShoppingCarts
                                             where p.customerEmail == (string)Session["user"]
                                             select p;

                if (clearShoppingCartTable != null)
                {
                    db2.ShoppingCarts.DeleteAllOnSubmit(clearShoppingCartTable.ToList());
                    db2.SubmitChanges();
                }

                // Display Payment made
                Response.Write("<script>alert('Your order has succesfully made!')</script>");
                HtmlMeta oScript = new HtmlMeta();
                oScript.Attributes.Add("http-equiv", "REFRESH");
                oScript.Attributes.Add("content", "0; url='CustomerShoppingCart.aspx'");
                Page.Header.Controls.Add(oScript);

                // Send email to the customer (Part 2 extension) + use string builder to customize email's body content
                //SmtpClient client = new SmtpClient();
                //client.Port = 587;
                //client.Host = "smtp.gmail.com";
                //client.EnableSsl = true;
                //client.Timeout = 10000;
                //client.DeliveryMethod = SmtpDeliveryMethod.Network;
                //client.UseDefaultCredentials = false;
                //client.Credentials = new System.Net.NetworkCredential("pika6084@gmail.com", "pikachu@6048");

                //MailMessage mm = new MailMessage("donotreply@domain.com", "angzw-wm17@student.tarc.edu.my", "Pika Art Gallery Payment Receipt", bodyText);
                //mm.BodyEncoding = UTF8Encoding.UTF8;
                //mm.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;

                //client.Send(mm);
            }
        }
    }
}