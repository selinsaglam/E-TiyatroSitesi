using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ETiyatro
{
    public partial class userprofile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["kullaniciadi"] == null)
                {
                    Response.Write("<script>alert('Oturumun Süresi Doldu Tekrar Giriş Yapın');</script>");
                    Response.Redirect("userlogin.aspx");
                }
                else
                {
                    getUserBookData();

                    if (!Page.IsPostBack)
                    {
                        getUserPersonalDetails();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Oturumun Süresi Doldu Tekrar Giriş Yapın');</script>");
                Response.Redirect("userlogin.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Session["kullaniciadi"] == null)
            {
                Response.Write("<script>alert('Oturumun Süresi Doldu Tekrar Giriş Yapın');</script>");
                Response.Redirect("userlogin.aspx");
            }
            else
            {
                updateUserPersonalDetails();

            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void getUserBookData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from kitap_basim where uye_id='" + Session["kullaniciadi"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void getUserPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from uye where uye_id='" + Session["kullaniciadi"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                TextBox1.Text = dt.Rows[0]["ad"].ToString();
                TextBox2.Text = dt.Rows[0]["dogum_tarihi"].ToString();
                TextBox3.Text = dt.Rows[0]["iletisim_no"].ToString();
                TextBox4.Text = dt.Rows[0]["email"].ToString();
                DropDownList1.SelectedValue = dt.Rows[0]["ulke"].ToString().Trim();
                TextBox6.Text = dt.Rows[0]["sehir"].ToString();
                TextBox7.Text = dt.Rows[0]["pinkodu"].ToString();
                TextBox5.Text = dt.Rows[0]["adres"].ToString();
                TextBox8.Text = dt.Rows[0]["uye_id"].ToString();
                TextBox9.Text = dt.Rows[0]["sifre"].ToString();

                Label1.Text = dt.Rows[0]["hesap_durumu"].ToString().Trim();

                if (dt.Rows[0]["hesap_durumu"].ToString().Trim() == "active")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-success");
                }
                else if (dt.Rows[0]["hesap_durumu"].ToString().Trim() == "pending")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-warning");
                }
                else if (dt.Rows[0]["hesap_durumu"].ToString().Trim() == "deactive")
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-danger");
                }
                else
                {
                    Label1.Attributes.Add("class", "badge badge-pill badge-info");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        void updateUserPersonalDetails()
        {
            string password = "";
            if (TextBox10.Text.Trim() == "")
            {
                password = TextBox9.Text.Trim();
            }
            else
            {
                password = TextBox10.Text.Trim();
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }


                SqlCommand cmd = new SqlCommand("update uye set ad=@ad, dogum_tarihi=@dogum_tarihi, iletisim_no=@iletisim_no, email=@email, ulke=@ulke, sehir=@sehir, pinkodu=@pinkodu, adres=@adres, sifre=@sifre, hesap_durumu=@hesap_durumu WHERE uye_id='" + Session["kullaniciadi"].ToString().Trim() + "'", con);

                cmd.Parameters.AddWithValue("@ad", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@dogum_tarihi", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@iletisim_no", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@ulke", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@sehir", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@pinkodu", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@adres", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@sifre", password);
                cmd.Parameters.AddWithValue("@hesap_durumu", "pending");

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    Response.Write("<script>alert('Bilgileriniz başarıyla kaydedilmiştir.');</script>");
                    getUserPersonalDetails();
                    getUserBookData();
                }
                else
                {
                    Response.Write("<script>alert('Geçersiz giriş');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}