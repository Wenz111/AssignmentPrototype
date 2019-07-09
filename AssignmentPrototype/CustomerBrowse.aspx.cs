using System;
using System.Web.UI.WebControls;
using System.Linq;

namespace AssignmentPrototype
{
    public partial class CustomerBrowse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataContextDataContext db = new DataContextDataContext();
                var queryAllProduct = from p in db.ArtistUploads
                                      select p;

                Repeater1.DataSourceID = null;
                Repeater1.DataSource = queryAllProduct;
                Repeater1.DataBind();

                txtSearchBox.Text = "";
                lblCount.Text = "";
                lblCount.Visible = false;
            }
        }

        protected void clickForMore_Click(object sender, EventArgs e)
        {
            Button btn = (sender as Button);
            string id = btn.CommandArgument;
            Response.Redirect("ProductDetail.aspx?id=" + id);
        }

        protected void btnSearch_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            if (txtSearchBox.Text == String.Empty)
            {
                lblCount.Text = "";
                lblCount.Visible = false;

                DataContextDataContext db = new DataContextDataContext();
                var queryAllProduct = from p in db.ArtistUploads
                                      select p;

                Repeater1.DataSourceID = null;
                Repeater1.DataSource = queryAllProduct;
                Repeater1.DataBind();
            }
            else
            {
                DataContextDataContext db = new DataContextDataContext();
                var queryAllProduct = from p in db.ArtistUploads
                                      where p.productname.Contains(txtSearchBox.Text)
                                      select p;

                int count = queryAllProduct.Count();

                if (count != 0)
                {
                    lblCount.Text = "Number of records found: " + count;
                    lblCount.Visible = true;
                }
                else
                {
                    lblCount.Text = "Number of records found: " + count;
                    lblCount.Text += "<br />Sorry, there is no product name '" + txtSearchBox.Text + "' in our database";
                    lblCount.Visible = true;
                }

                Repeater1.DataSourceID = null;
                Repeater1.DataSource = queryAllProduct;
                Repeater1.DataBind();
            }
        }

        protected void ddlSortArtProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSortArtProduct.SelectedValue == "Default")
            {
                txtSearchBox.Text = "";
                lblCount.Text = "";
                lblCount.Visible = false;

                DataContextDataContext db = new DataContextDataContext();
                var queryAllProduct = from p in db.ArtistUploads
                                      where p.productname.Contains(txtSearchBox.Text)
                                      select p;

                Repeater1.DataSourceID = null;
                Repeater1.DataSource = queryAllProduct;
                Repeater1.DataBind();
            }
            else if (ddlSortArtProduct.SelectedValue == "Lowest to Highest Price")
            {
                txtSearchBox.Text = "";
                lblCount.Text = "";
                lblCount.Visible = false;

                DataContextDataContext db = new DataContextDataContext();
                var queryAllProduct = from p in db.ArtistUploads
                                      orderby p.productPrice ascending
                                      select p;

                Repeater1.DataSourceID = null;
                Repeater1.DataSource = queryAllProduct;
                Repeater1.DataBind();
            }
            else if (ddlSortArtProduct.SelectedValue == "Highest To Lowest Price")
            {
                txtSearchBox.Text = "";
                lblCount.Text = "";
                lblCount.Visible = false;

                DataContextDataContext db = new DataContextDataContext();
                var queryAllProduct = from p in db.ArtistUploads
                                      orderby p.productPrice descending
                                      select p;

                Repeater1.DataSourceID = null;
                Repeater1.DataSource = queryAllProduct;
                Repeater1.DataBind();
            }
            else if (ddlSortArtProduct.SelectedValue == "Oldest To Newest")
            {
                txtSearchBox.Text = "";
                lblCount.Text = "";
                lblCount.Visible = false;

                DataContextDataContext db = new DataContextDataContext();
                var queryAllProduct = from p in db.ArtistUploads
                                      orderby p.date ascending
                                      select p;

                Repeater1.DataSourceID = null;
                Repeater1.DataSource = queryAllProduct;
                Repeater1.DataBind();
            }
            else if (ddlSortArtProduct.SelectedValue == "Newest To Oldest")
            {
                txtSearchBox.Text = "";
                lblCount.Text = "";
                lblCount.Visible = false;

                DataContextDataContext db = new DataContextDataContext();
                var queryAllProduct = from p in db.ArtistUploads
                                      orderby p.date descending
                                      select p;

                Repeater1.DataSourceID = null;
                Repeater1.DataSource = queryAllProduct;
                Repeater1.DataBind();
            }
            else
            {
                txtSearchBox.Text = "";
                lblCount.Text = "";
                lblCount.Visible = false;

                DataContextDataContext db = new DataContextDataContext();
                var queryAllProduct = from p in db.ArtistUploads
                                      where p.productname.Contains(txtSearchBox.Text)
                                      select p;

                Repeater1.DataSourceID = null;
                Repeater1.DataSource = queryAllProduct;
                Repeater1.DataBind();
            }
        }

        protected void btnClear_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            txtSearchBox.Text = "";
            lblCount.Text = "";
            lblCount.Visible = false;

            DataContextDataContext db = new DataContextDataContext();
            var queryAllProduct = from p in db.ArtistUploads
                                  select p;

            Repeater1.DataSourceID = null;
            Repeater1.DataSource = queryAllProduct;
            Repeater1.DataBind();
        }
    }
}