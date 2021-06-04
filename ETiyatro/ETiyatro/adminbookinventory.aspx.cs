﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace ETiyatro
{
    public partial class adminbookinventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillAuthorPublisherValues();
            }

            GridView1.DataBind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            getBookByID();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkIfBookExists())
            {
                Response.Write("<script>alert('Bu kitap bulunmaktadır. Başka bir Kitap ID deneyiniz.');</script>");
            }
            else
            {
                addNewBook();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            updateBookByID();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteBookByID();
        }

        void deleteBookByID()
        {
            if (checkIfBookExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from kitap WHERE kitap_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Kitap başarıyla silinmiştir.');</script>");

                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Geçersiz Kitap ID');</script>");
            }
        }

        void updateBookByID()
        {

            if (checkIfBookExists())
            {
                try
                {

                    int actual_stock = Convert.ToInt32(TextBox4.Text.Trim());
                    int current_stock = Convert.ToInt32(TextBox5.Text.Trim());

                    if (global_actual_stock == actual_stock)
                    {

                    }
                    else
                    {
                        if (actual_stock < global_issued_books)
                        {
                            Response.Write("<script>alert('Güncel stok verisi basılmış kitap sayısından az olamaz.');</script>");
                            return;


                        }
                        else
                        {
                            current_stock = actual_stock - global_issued_books;
                            TextBox5.Text = "" + current_stock;
                        }
                    }

                    string genres = "";
                    foreach (int i in ListBox1.GetSelectedIndices())
                    {
                        genres = genres + ListBox1.Items[i] + ",";
                    }
                    genres = genres.Remove(genres.Length - 1);

                    string filepath = "~/book_inventory/books1";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;

                    }
                    else
                    {
                        FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                        filepath = "~/book_inventory/" + filename;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE kitap set kitap_ad=@kitap_ad, tur=@tur, yazar_ad=@yazar_ad, yayimci_ad=@yayimci_ad, yayim_tarihi=@yayim_tarihi, dil=@dil, baski=@baski, kitap_fiyat=@kitap_fiyat, sayfa_sayisi=@sayfa_sayisi, kitap_aciklamasi=@kitap_aciklamasi, guncel_stok=@actual_stock, cari_stok=@cari_stok, kitap_img_link=@kitap_img_link where kitap_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@kitap_ad", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@tur", genres);
                    cmd.Parameters.AddWithValue("@yazar_ad", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@yayimci_ad", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@yayim_tarihi", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@dil", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@baski", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@kitap_fiyat", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@sayfa_sayisi", TextBox11.Text.Trim());
                    cmd.Parameters.AddWithValue("@kitap_aciklamasi", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@guncel_stok", actual_stock.ToString());
                    cmd.Parameters.AddWithValue("@cari_stok", current_stock.ToString());
                    cmd.Parameters.AddWithValue("@kitap_img_link", filepath);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Kitap başarıyla güncellendi.');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Geçersiz Kitap ID');</script>");
            }
        }

        void getBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from kitap WHERE kitap_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0]["kitap_ad"].ToString();
                    TextBox3.Text = dt.Rows[0]["yayim_tarihi"].ToString();
                    TextBox9.Text = dt.Rows[0]["baski"].ToString();
                    TextBox10.Text = dt.Rows[0]["kitap_fiyat"].ToString().Trim();
                    TextBox11.Text = dt.Rows[0]["sayfa_sayisi"].ToString().Trim();
                    TextBox4.Text = dt.Rows[0]["guncel_stok"].ToString().Trim();
                    TextBox5.Text = dt.Rows[0]["cari_stok"].ToString().Trim();
                    TextBox6.Text = dt.Rows[0]["kitap_aciklamasi"].ToString();
                    TextBox7.Text = "" + (Convert.ToInt32(dt.Rows[0]["guncel_stok"].ToString()) - Convert.ToInt32(dt.Rows[0]["cari_stok"].ToString()));

                    DropDownList1.SelectedValue = dt.Rows[0]["dil"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["yayimci_ad"].ToString().Trim();
                    DropDownList3.SelectedValue = dt.Rows[0]["yazar_ad"].ToString().Trim();

                    ListBox1.ClearSelection();
                    string[] genre = dt.Rows[0]["tur"].ToString().Trim().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < ListBox1.Items.Count; j++)
                        {
                            if (ListBox1.Items[j].ToString() == genre[i])
                            {
                                ListBox1.Items[j].Selected = true;

                            }
                        }
                    }

                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["guncel_stok"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["cari_stok"].ToString().Trim());
                    global_issued_books = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["kitap_img_link"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Geçersiz Kitap ID');</script>");
                }

            }
            catch (Exception ex)
            {

            }
        }

        void fillAuthorPublisherValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT yazar_ad from yazar;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "yazar_ad";
                DropDownList3.DataBind();

                cmd = new SqlCommand("SELECT yayimci_ad from yayimci;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "yayimci_ad";
                DropDownList2.DataBind();

            }
            catch (Exception ex)
            {

            }
        }

        bool checkIfBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from kitap where kitap_id='" + TextBox1.Text.Trim() + "' OR kitap_ad='" + TextBox2.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void addNewBook()
        {
            try
            {
                string genres = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    genres = genres + ListBox1.Items[i] + ",";
                }
                
                genres = genres.Remove(genres.Length - 1);

                string filepath = "~/book_inventory/books1.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                filepath = "~/book_inventory/" + filename;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO kitap(kitap_id,kitap_ad,tur,yazar_ad,yayimci_ad,yayim_tarihi,dil,baski,kitap_fiyat,sayfa_sayisi,kitap_aciklamasi,guncel_stok,cari_stok,kitap_img_link) values(@kitap_id,@kitap_ad,@tur,@yazar_ad,@yayimci_ad,@yayim_tarihi,@dil,@baski,@kitap_fiyat,@sayfa_sayisi,@kitap_aciklamasi,@guncel_stok,@cari_stok,@kitap_img_link)", con);

                cmd.Parameters.AddWithValue("@kitap_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@kitap_ad", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@tur", genres);
                cmd.Parameters.AddWithValue("@yazar_ad", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@yayimci_ad", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@yayim_tarihi", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@dil", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@baski", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@kitap_fiyat", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@sayfa_sayisi", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@kitap_aciklamasi", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@guncel_stok", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@cari_stok", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@kitap_img_link", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Kitap başarıyla eklenmiştir.');</script>");
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
} 