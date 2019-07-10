using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssignmentPrototype
{
    public partial class SellerActivity : System.Web.UI.Page
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
                BindUploadProduct();
            }
        }

        public void BindUploadProduct()
        {
            DataContextDataContext db = new DataContextDataContext();
            var queryProduct = from p in db.ArtistUploads
                               where p.authorEmail == (string)Session["seller"]
                               select p;

            DataList1.DataSource = queryProduct;
            DataList1.DataBind();
        }

        protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.EditItemIndex = e.Item.ItemIndex;
            BindUploadProduct();
        }

        protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            string prodID = "";
            Label tempProdID = DataList1.Items[e.Item.ItemIndex].FindControl("productId1") as Label;

                prodID = tempProdID.Text;

                DataContextDataContext db = new DataContextDataContext();
                ArtistUpload currentArtistUpload = db.ArtistUploads.Single(pId => pId.productID == int.Parse(prodID));

                // Get updated image
                FileUpload updateImage = (FileUpload) DataList1.Items[DataList1.EditItemIndex].FindControl("FileUpload1");
                byte[] img = new byte[updateImage.PostedFile.ContentLength];
                updateImage.PostedFile.InputStream.Read(img, 0, img.Length);

                // If have update image then save into the database
                if (img != null)
                {
                    currentArtistUpload.artImage = img;
                }

                TextBox txtTemp = DataList1.Items[e.Item.ItemIndex].FindControl("TextBox1") as TextBox;
                if (txtTemp != null)
                    currentArtistUpload.productname = txtTemp.Text;

                txtTemp = DataList1.Items[e.Item.ItemIndex].FindControl("TextBox2") as TextBox;
                if (txtTemp != null)
                    currentArtistUpload.description = txtTemp.Text;

                txtTemp = DataList1.Items[e.Item.ItemIndex].FindControl("TextBox3") as TextBox;
                if (txtTemp != null)
                    currentArtistUpload.quantity = int.Parse(txtTemp.Text);

                txtTemp = DataList1.Items[e.Item.ItemIndex].FindControl("TextBox4") as TextBox;
                if (txtTemp != null)
                    currentArtistUpload.productPrice = decimal.Parse(txtTemp.Text);

                db.SubmitChanges();
                DataList1.EditItemIndex = -1;
                BindUploadProduct();
        }

        protected void DataList1_CancelCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.EditItemIndex = -1;
            BindUploadProduct();
        }

        protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            string prodID = "";
            Label tempProdID = DataList1.Items[e.Item.ItemIndex].FindControl("productId2") as Label;

            prodID = tempProdID.Text;

            DataContextDataContext db = new DataContextDataContext();
            ArtistUpload currentArtistUpload = db.ArtistUploads.Single(pId => pId.productID == int.Parse(prodID));

            db.ArtistUploads.DeleteOnSubmit(currentArtistUpload);
            db.SubmitChanges();
            BindUploadProduct();
        }
    }
}