using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentPrototype
{
    public partial class SellerArtsSold : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["seller"] == null)
            {
                string OriginalUrl = HttpContext.Current.Request.RawUrl;
                string LoginPageUrl = "SellerLogin.aspx";
                HttpContext.Current.Response.Redirect(String.Format("{0}?ReturnUrl={1}", LoginPageUrl, OriginalUrl));
            }

            if (!IsPostBack)
            {
                // For Purchase History Details Section
                DataContextDataContext db = new DataContextDataContext();

                var getSellerSales = from p in db.PurchaseDetails
                                     join s in db.CustomerTables on p.customerEmail equals s.CustomerEmail
                                     where p.sellerEmail == (string)Session["seller"]
                                     select new
                                     { p.productID, p.PurchaseHistoryDetailsID, p.purchaseDate, p.artImage, p.productName, s.CustomerName, s.CustomerEmail, p.quantity, p.unitPrice };

                DataList1.DataSource = getSellerSales;
                DataList1.DataBind();

                if (DataList1.Items.Count > 0)
                {
                    // Get seller profit and quantity of art sold
                    decimal profitEarned;
                    int soldQty;

                    DataContextDataContext dbgetSellerProfit = new DataContextDataContext();

                    profitEarned = (from p in dbgetSellerProfit.PurchaseDetails
                                           where p.sellerEmail == (string)Session["seller"]
                                           group p by p.sellerEmail into g
                                           select g.Sum(c => c.unitPrice).Value).FirstOrDefault();


                    DataContextDataContext dbgetSellerQuantitySold = new DataContextDataContext();

                    soldQty = (from p in dbgetSellerQuantitySold.PurchaseDetails
                                           where p.sellerEmail == (string)Session["seller"]
                                           group p by p.sellerEmail into g
                                           select g.Sum(c => c.quantity).Value).FirstOrDefault();

                    // Display it
                    totalProfit.Text = "Total Profit Earned: RM " + profitEarned;
                    totalProfit.Visible = true;

                    artsSold.Text = "Total Art Sold: " + soldQty;
                    artsSold.Visible = true;
                }

                if (DataList1.Items.Count == 0)
                {
                    noArtsSoldYet.Text = "<br />" + "<h3>" + "There are no Arts Sold yet, please try to advertise your arts on social media to promote your Arts!" + "</h3>" + "<br />";
                    noArtsSoldYet.Visible = true;
                }
            }
        }
    }
}