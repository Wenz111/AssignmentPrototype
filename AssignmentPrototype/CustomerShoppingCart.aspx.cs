﻿using System;
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

                if (deductProductQty != null)
                {
                    foreach (var deductQty in deductProductQty)
                    {
                        deductQty.quantity = deductQty.quantity - 1;
                    }
                    db1.SubmitChanges();
                }

                // Clear Payment Table
                DataContextDataContext db2 = new DataContextDataContext();
                var clearShoppingCartTable = from p in db2.ShoppingCarts
                                             where p.customerEmail == (string)Session["user"]
                                             select p;

                if (clearShoppingCartTable != null)
                {
                    db2.ShoppingCarts.DeleteAllOnSubmit(clearShoppingCartTable.ToList());
                    db2.SubmitChanges();
                }

                Response.Write("<script>alert('Your order has succesfully made!')</script>");
                HtmlMeta oScript = new HtmlMeta();
                oScript.Attributes.Add("http-equiv", "REFRESH");
                oScript.Attributes.Add("content", "0; url='CustomerShoppingCart.aspx'");
                Page.Header.Controls.Add(oScript);
            }
        }
    }
}