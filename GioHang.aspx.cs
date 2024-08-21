using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TT_ShopJQK.Class;
namespace TT_ShopJQK
{
    public partial class GioHang : System.Web.UI.Page
    {
        DataUtil xuly = new DataUtil();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["productdelete"] = null;
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
                cart.Columns.Add("hinhAnh");
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
            if (Session["add"] != null && Session["add"].ToString() == "add")
            {
                string maSP = Session["maSP"].ToString();
                string tenSP = Session["tenSP"].ToString();
                string donGia = Session["donGia"].ToString();
                string hinhAnh = Session["hinhAnh"].ToString();
                string quantity = Session["quantity"].ToString();
                //Kiểm tra xem đã có sản phẩm trong giỏ hàng chưa ?
                //Nếu chưa thì thêm bản ghi mới vào giỏ hàng với số lượng Quantity là 1
                //Nếu có thì tăng quantity lên 1
                bool isExisted = false;
                foreach (DataRow dr in cart.Rows)
                {
                    if (dr["maSP"].ToString() == maSP)
                    {
                        dr["quantity"] = int.Parse(dr["quantity"].ToString()) + Convert.ToInt32(quantity);
                        isExisted = true;
                        break;
                    }
                }
                if (!isExisted)//Chưa có sản phẩm trong giỏ hàng
                {
                    DataRow dr = cart.NewRow();
                    dr["maSP"] = maSP;
                    dr["tenSP"] = tenSP;
                    dr["donGia"] = donGia;
                    dr["hinhAnh"] = hinhAnh;
                    dr["quantity"] = quantity;
                    dr["money"] = (Convert.ToInt32(donGia) * Convert.ToInt32(quantity));
                    cart.Rows.Add(dr);
                }
                //Lưu lại thông tin giỏ hàng mới nhất vào session["Cart"]
                Session["cart"] = cart;
                grdcart.DataSource = cart;
                grdcart.DataBind();
            }
            else if (Session["add"] != null && Session["add"].ToString() == "show")

            {
                string maSP, tenSP, donGia, hinhAnh, quantity;
                bool isExisted = false;
                if (Session["maSP"] == null)
                {
                    maSP = null;
                    tenSP = null;
                    donGia = Convert.ToString(0);
                    hinhAnh = null;
                    quantity = Convert.ToString(0);
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
                        dr["maSP"] = maSP;
                        dr["tenSP"] = tenSP;
                        dr["donGia"] = donGia;
                        dr["hinhAnh"] = hinhAnh;
                        dr["quantity"] = quantity;
                        //dr["money"] = (Convert.ToInt32(donGia) * Convert.ToInt32(quantity));
                        cart.Rows.Add(dr);

                    }
                    //Lưu lại thông tin giỏ hàng mới nhất vào session["Cart"]
                    Session["cart"] = cart;
                    grdcart.DataSource = cart;
                    grdcart.DataBind();
                }
                else
                {
                    maSP = Session["maSP"].ToString();
                    tenSP = Session["tenSP"].ToString();                  
                    donGia = Session["donGia"].ToString();
                    hinhAnh = Session["hinhAnh"].ToString();
                    quantity = Session["quantity"].ToString();
                    //K
                    foreach (DataRow dr in cart.Rows)
                    {
                        if (dr["maSP"].ToString() == maSP)
                        {
                            isExisted = true;
                            break;
                        }
                    }
                    if (!isExisted)//Chưa có sản phẩm trong giỏ hàng
                    {
                        DataRow dr = cart.NewRow();
                        dr["maSP"] = maSP;
                        dr["tenSP"] = tenSP;
                        dr["donGia"] = donGia;
                        dr["hinhAnh"] = hinhAnh;
                        dr["quantity"] = quantity;
                        dr["money"] = (Convert.ToInt32(donGia) * Convert.ToInt32(quantity));
                        cart.Rows.Add(dr);
                    }
                    //Lưu lại thông tin giỏ hàng mới nhất vào session["Cart"]
                    Session["cart"] = cart;
                    grdcart.DataSource = cart;
                    grdcart.DataBind();
                }

            }
            //    }
            //}
            //Hiện thị thông tin giỏ hàng
        }
        protected void grdcart_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            string id = grdcart.DataKeys[e.NewSelectedIndex].Value.ToString();
            TextBox quantity = grdcart.Rows[e.NewSelectedIndex].Cells[4].FindControl("txtQuantity") as TextBox;
            string a = quantity.Text;
            //Duyệt qua Giỏ hàng và tăng số lượng
            DataTable cart = Session["cart"] as DataTable;
            foreach (DataRow dr in cart.Rows)
            {
                //Kiểm tra mã sản phẩm phù hợp để gán số lượng khách hàng mua
                if (dr["maSP"].ToString() == id)
                {
                    dr["quantity"] = int.Parse(quantity.Text);
                    dr["money"] = Convert.ToInt32(dr["quantity"]) * Convert.ToInt32(dr["donGia"]);
                    break;
                }
            }
            //Lưu lại vào Session
            Session["cart"] = cart;
            //Hiển thị giỏ hàng với thông tin mới
            grdcart.DataSource = cart;
            grdcart.DataBind();
            
        }
        protected void grdcart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = grdcart.DataKeys[e.RowIndex].Value.ToString();
            //Duyệt qua Giỏ hàng và xóa sản phẩm phù hợp
            DataTable cart = Session["cart"] as DataTable;
            foreach (DataRow dr in cart.Rows)
            {
                if (dr["maSP"].ToString() == id)
                {
                    Session["productdelete"] = dr["maSP"].ToString();
                    string a = Session["productdelete"].ToString();
                    dr.Delete();
                    break;
                }
            }
            //Lưu lại vào Session
            Session["cart"] = cart;
            //Hiển thị giỏ hàng với thông tin mới
            grdcart.DataSource = cart;
            grdcart.DataBind();
        }

        protected void btnUpgrade_Click(object sender, EventArgs e)
        {
            DataTable cart = Session["cart"] as DataTable;
            int total = 0;
            foreach (DataRow dr in cart.Rows)
            {
                int money = int.Parse(dr["money"].ToString());
                total += money;
            }
            lbTotal.Text = total.ToString("n0") + " VND";
            Session["productdelete"] = null;
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
        protected void lbCheckout_Click(object sender, EventArgs e)
        {
            DataTable cart = Session["cart"] as DataTable;
            int check = 0;
            foreach (DataRow dr in cart.Rows)
            {
                string id = dr["maSP"].ToString();
                if (id == "" || id == null)
                {
                    check = 0;
                }
                else { check += 1; }
            }
            int i = grdcart.Rows.Count;
            if (check >= 1)
            {
                Response.Redirect("ThanhToan.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, typeof(Page),
                    "popup", "alert('Bạn cần thêm vào giỏ ít nhất 1 sản phẩm để thanh toán!')", true);
            }
        }
        protected void lbDelete_Click(object sender, EventArgs e)
        {
        }
    }
}
