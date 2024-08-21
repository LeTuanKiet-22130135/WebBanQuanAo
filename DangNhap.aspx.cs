using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TT_ShopJQK.Class;

namespace TT_ShopJQK
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbID.Visible = false;
            txtusername.Attributes.Add("placeholder", "Tên tài khoản");
            txtpassword.Attributes.Add("placeholder", "Mật khẩu");
            lbMessage.Visible = false;
        }
        public void checkUser()
        {
            string sqlCon = @"Data Source=LAPTOP-4SO828CP\SQLEXPRESS;Initial Catalog=JQKShop;Integrated Security=True";
            SqlConnection con = new SqlConnection(sqlCon);
            con.Open();
            string checkuser = "select * from Users where tenDN like '" + txtusername.Text.ToString() + "' ";
            SqlCommand cmd = new SqlCommand(checkuser, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr["tenDN"].ToString() == txtusername.Text && dr["matkhauDN"].ToString() == txtpassword.Text &&
                    Convert.ToBoolean(dr["quyen"].ToString()) == true)
                {
                    Users u = new Users();
                    u.IDDN = (int)(dr["IDDN"]);
                    u.tenDN = (string)dr["tenDN"];
                    lbID.Text = u.IDDN.ToString();
                    string name = u.tenDN;
                    Session["login"] = lbID.Text;
                    Session["name"] = name;
                    Response.Redirect(url: "~/Admin/HomeAdmin.aspx");
                }
                else if (dr["tenDN"].ToString() == txtusername.Text && dr["matkhauDN"].ToString() == txtpassword.Text &&
                    Convert.ToBoolean(dr["quyen"].ToString()) == false)
                {
                    Users u = new Users();
                    u.tenDN = (string)dr["tenDN"];
                    u.IDDN = (int)(dr["IDDN"]);
                    lbID.Text = u.IDDN.ToString();
                    string name = u.tenDN;
                    Session["userlogin"] = lbID.Text;
                    Session["useremail"] = (string)dr["email"];
                    Session["username"] = name;
                    //Response.Redirect(url: "~/TrangChu.aspx");
                    HttpCookie returnCookie = Request.Cookies["returnUrl"];
                    if ((returnCookie == null) || string.IsNullOrEmpty(returnCookie.Value))
                    {
                        Response.Redirect("TrangChu.aspx");
                    }
                    else
                    {
                        HttpCookie deleteCookie = new HttpCookie("returnUrl");
                        deleteCookie.Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies.Add(deleteCookie);
                        Response.Redirect(returnCookie.Value);
                    }
                }
            }
            con.Close();
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            checkUser();
        }
    }
}