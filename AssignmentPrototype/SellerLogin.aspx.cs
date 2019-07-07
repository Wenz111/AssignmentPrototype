using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace AssignmentPrototype
{
    public partial class SellerLogin : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlDataAdapter sda = new SqlDataAdapter();
        DataSet ds = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            String seller = selLogin.Text.Trim();

            cmd.CommandText = "select * from ArtistTable where authorEmail= '" + selLogin.Text + "' and authorPswd='" + selPswd.Text + "'";
            cmd.Connection = con;
            sda.SelectCommand = cmd;
            sda.Fill(ds, "ArtistTable");
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["seller"] = seller;

                if (this.Request.QueryString["ReturnUrl"] != null)
                {
                    this.Response.Redirect(Request.QueryString["ReturnUrl"].ToString());
                }
                else
                {
                    this.Response.Redirect("~/SellerUpload.aspx");
                }
            }
            else
            {
                Response.Write("<script language='javascript'>window.alert('Your Username or Password is Invalid!')</script>");
            }
        }
    }
}