using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentPrototype
{
    public partial class PurchaseHistory : System.Web.UI.Page
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

                // For Purchase History Details Section
                DataContextDataContext db = new DataContextDataContext();

                var getPurchaseHistoryDetails = from p in db.PurchaseDetails
                                                join s in db.ArtistTables on p.sellerEmail equals s.authorEmail
                                                where p.customerEmail == (string)Session["user"] && p.sellerEmail == s.authorEmail
                                                select new
                                                { p.productID, p.productName, p.artImage, s.authorName, s.authorEmail, p.purchaseDate, p.quantity, p.unitPrice, p.status, p.PurchaseHistoryDetailsID };

                DataList1.DataSource = getPurchaseHistoryDetails;
                DataList1.DataBind();

                if (DataList1.Items.Count > 0)
                {
                    // Get seller profit and quantity of art sold
                    decimal totalSpend;
                    int totalPurchasedQty;

                    DataContextDataContext dbgetBuyerPurchased= new DataContextDataContext();

                    totalSpend = (from p in dbgetBuyerPurchased.PurchaseDetails
                                    where p.customerEmail == (string)Session["user"]
                                    group p by p.customerEmail into g
                                    select g.Sum(c => c.unitPrice).Value).FirstOrDefault();


                    DataContextDataContext dbgetBuyerQtyPurchased = new DataContextDataContext();

                    totalPurchasedQty = (from p in dbgetBuyerQtyPurchased.PurchaseDetails
                               where p.customerEmail == (string)Session["user"]
                               group p by p.customerEmail into g
                               select g.Sum(c => c.quantity).Value).FirstOrDefault();

                    // Display it
                    totalSpending.Text = "Total Expenditure: RM " + totalSpend;
                    totalSpending.Visible = true;

                    artsPurchased.Text = "Total Art Purchased: " + totalPurchasedQty;
                    artsPurchased.Visible = true;
                }

                if (DataList1.Items.Count == 0)
                {
                    emptyPurchaseHistoryDetails.Text = "<br />" + "<h3>" + "You currently do not have purchase history details, kindly click " + "<a href=\"CustomerBrowse.aspx\">here</a>" + " to start buying items to see your Past Purchase History Details!" + "</h3>" + "<br />";
                    emptyPurchaseHistoryDetails.Visible = true;
                }

            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}