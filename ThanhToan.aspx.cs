using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using TT_ShopJQK.Class;

namespace TT_ShopJQK
{
    public partial class ThanhToan : System.Web.UI.Page
    {
        tbDisplayDataUtil du = new tbDisplayDataUtil();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userlogin"] == null)
                {
                    txtname.Focus();
                    txtname.Enabled = false;
                    txtEmail.Enabled = false;
                }
                else
                {
                    string userid = Session["userlogin"].ToString();
                    string username = Session["username"].ToString();
                    txtname.Text = username;
                    txtname.Enabled = false;
                    txtEmail.Enabled = false;
                    txtEmail.Text = Session["useremail"].ToString();

                }
                showCart();
            }
        }

        private void showCart()
        {
            DataTable cart = new DataTable();
            if (Session["cart"] == null)
            {
                //Nếu chưa có giỏ hàng, tạo giỏ hàng thông qua DataTable với 4 cột chính
                //ID (Mã sản phẩm), Name (Tên sản phẩm)
                //Price (Giá tiền), Quantity (Số lượng)

                cart.Columns.Add("maSP");
                cart.Columns.Add("tenSP");
                cart.Columns.Add("donGia");
                cart.Columns.Add("quantity");
                cart.Columns.Add("money");
                //Sau khi tạo xong thì lưu lại vào session
                Session["cart"] = cart;
            }
            else
            {
                //Lấy thông tin giỏ hàng từ Session["cart"]
                cart = Session["cart"] as DataTable;
            }
            //if (!String.IsNullOrEmpty(Request.QueryString["action"]))
            //{
            //    if (Request.QueryString["action"] == "add")
            //    {
            if (Session["add"] == "add")
            {
                string productid = Session["maSP"].ToString();
                string name = Session["tenSP"].ToString();
                string price = Session["donGia"].ToString();
                string quantity = Session["quantity"].ToString();
                //Kiểm tra xem đã có sản phẩm trong giỏ hàng chưa ?
                //Nếu chưa thì thêm bản ghi mới vào giỏ hàng với số lượng Quantity là 1
                //Nếu có thì tăng quantity lên 1
                bool isExisted = false;
                foreach (DataRow dr in cart.Rows)
                {
                    if (dr["maSP"].ToString() == productid)
                    {
                        dr["quantity"] = int.Parse(dr["quantity"].ToString()) + Convert.ToInt32(quantity);
                        isExisted = true;
                        break;
                    }
                }
                if (!isExisted)//Chưa có sản phẩm trong giỏ hàng
                {
                    DataRow dr = cart.NewRow();
                    dr["maSP"] = productid;
                    dr["tenSP"] = name;
                    dr["donGia"] = price;
                    dr["quantity"] = quantity;
                    dr["money"] = (Convert.ToInt32(price) * Convert.ToInt32(quantity));
                    cart.Rows.Add(dr);
                }
                //Lưu lại thông tin giỏ hàng mới nhất vào session["Cart"]
                Session["cart"] = cart;
                grdcart.DataSource = cart;
                grdcart.DataBind();
            }
            if (Session["add"] == "show")
            {
                string productid, name, price, quantity /*available*/;
                bool isExisted = false;
                if (Session["productid"] == null)
                {
                    productid = null;
                    name = null;
                    price = Convert.ToString(0);
                    quantity = Convert.ToString(0);
                    //available = null;
                    foreach (DataRow dr in cart.Rows)
                    {
                        if (dr["maSP"].ToString() == "")
                        {
                            string a = dr["maSP"].ToString();
                            isExisted = true;
                            break;
                        }
                    }
                    if (!isExisted)//Chưa có sản phẩm trong giỏ hàng
                    {
                        DataRow dr = cart.NewRow();
                        dr["maSP"] = productid;
                        dr["tenSP"] = name;
                        dr["donGia"] = price;
                        dr["quantity"] = quantity;
                        dr["money"] = (Convert.ToInt32(price) * Convert.ToInt32(quantity));
                        cart.Rows.Add(dr);

                    }
                    //Lưu lại thông tin giỏ hàng mới nhất vào session["Cart"]
                    Session["cart"] = cart;
                    grdcart.DataSource = cart;
                    grdcart.DataBind();
                }
                else
                {
                    productid = Session["maSP"].ToString();
                    name = Session["tenSP"].ToString();                  
                    price = Session["donGia"].ToString();
                    quantity = Session["quantity"].ToString();
                    //Kiểm tra xem đã có sản phẩm trong giỏ hàng chưa ?
                    //Nếu chưa thì thêm bản ghi mới vào giỏ hàng với số lượng Quantity là 1
                    //Nếu có thì tăng quantity lên 1
                    foreach (DataRow dr in cart.Rows)
                    {
                        if (dr["maSP"].ToString() == productid)
                        {
                            isExisted = true;
                            break;
                        }
                    }
                    if (!isExisted)//Chưa có sản phẩm trong giỏ hàng
                    {
                        DataRow dr = cart.NewRow();
                        dr["maSP"] = productid;
                        dr["tenSP"] = name;
                        dr["donGia"] = price;
                        dr["quantity"] = quantity;
                        dr["money"] = (Convert.ToInt32(price) * Convert.ToInt32(quantity));
                        cart.Rows.Add(dr);
                    }
                    //Lưu lại thông tin giỏ hàng mới nhất vào session["Cart"]
                    Session["cart"] = cart;
                    grdcart.DataSource = cart;
                    grdcart.DataBind();
                }

            }
        }

        protected void grdcart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lbl = e.Row.FindControl("lbID") as Label;
                string a = lbl.Text;
                if (lbl.Text == "")
                {
                    e.Row.Visible = false;
                }
                else
                {
                    e.Row.Visible = true;
                }
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            if (Session["userlogin"] == null)
            {
                Response.Cookies.Add(new HttpCookie("returnUrl", Request.Url.PathAndQuery));
            }
            else
            {
                try
                {
                    HoaDon o = new HoaDon();
                    o.ngayDat = Convert.ToDateTime(DateTime.Now.ToString());
                    o.IDDN = Convert.ToInt32(Session["userlogin"].ToString());
                    DataTable cart = Session["cart"] as DataTable;
                    int total = 0;
                    foreach (DataRow datarow in cart.Rows)
                    {

                        int money = int.Parse(datarow["money"].ToString());
                        total += money;
                    }
                    //lbTotal.Text = total.ToString("n0") + " VND";
                    o.tongTien = total;
                    //o.Status = false;
                    //o.trangThai = false;
                    o.tenDN = txtname.Text;
                    o.sdt = txtPhone.Text;
                    o.diaChiNhan = txtAddress.Text;
                    du.addOrder(o);

                    string sqlCon = @"Data Source=LAPTOP-IA9NJULV\SQL;Initial Catalog=JQKShop;Integrated Security=True";
                    SqlConnection con = new SqlConnection(sqlCon);
                    string sql = "select * from HoaDon where ngayDat=@ngayDat and IDDN=@IDDN";
                    con.Open();
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("ngayDat", o.ngayDat);
                    cmd.Parameters.AddWithValue("IDDN", o.IDDN);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        Session["IDHD"] = int.Parse(dr["ID"].ToString());
                    }

                    foreach (DataRow datarow in cart.Rows)
                    {
                        ChiTietHoaDon od = new ChiTietHoaDon();
                        od.IDHD = int.Parse(Session["IDHD"].ToString());
                        od.maSP = int.Parse(datarow["maSP"].ToString());
                        od.soLuong = int.Parse(datarow["quantity"].ToString());
                        od.donGia = int.Parse(datarow["donGia"].ToString());
                        du.addOrderDetail(od);
                    }
                    con.Close();

                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "popup", "alert('Thanh toán thành công!')", true);
                    //Response.Redirect(url: "ListCategories.aspx");
                    Session.Remove("cart");
                    Session.Remove("add");
                }
                catch (Exception e1)
                {

                    msg.Text = "Something wrong: " + e1.Message.ToString();
                }
            }


        }
        
    }
}