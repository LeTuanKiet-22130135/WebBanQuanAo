using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TT_ShopJQK.Class;

namespace TT_ShopJQK.Admin
{
    public partial class QuanLyDonHang : System.Web.UI.Page
    {
        DataUtil data = new DataUtil();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hienthi();
            }
        }
        public void hienthi()
        {
            grOrders.DataSource = data.dsHD();
            DataBind();
        }
        protected void Xoa_click(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "xoa")
            {
                int b = Convert.ToInt16(e.CommandArgument);
                data.XoaHD(b);
                hienthi();
            }
        }
        protected void Sua_click(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "sua")
            {
                int b = Convert.ToInt16(e.CommandArgument);
                HoaDon d = data.layra1HD(b);
                Session["us"] = d;
                Response.Redirect("DuyetDon.aspx");
            }
        }
        protected void lbView_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "select")
            {
                int m = Convert.ToInt32(e.CommandArgument);
                Session["IDHD"] = m;

                if (Session["IDHD"] != null)
                {
                    grOrders.Visible = false;
                    string IDHD = Session["IDHD"].ToString();
                    showdetail(Convert.ToInt32(IDHD));
                    grvDetails.Visible = true;
                    lbDetailTitle.Text = "Chi tiết order #" + m;

                }
            }

        }
        private void showdetail(int IDHD)
        {
            //grdShoes.DataSource = data.lsProduct();
            //grdShoes.DataBind();
            string sqlCon = @"Data Source=LAPTOP-IA9NJULV\SQL;Initial Catalog=JQKShop;Integrated Security=True";

            SqlConnection con = new SqlConnection(sqlCon);
            string query = "select IDHD, ChiTietHoaDon.maSP, ChiTietHoaDon.donGia, soLuong, tenSP, hinhAnh " +
                "from ChiTietHoaDon inner join ChiTietSanPham on ChiTietSanPham.maSP = ChiTietHoaDon.maSP" +
                " where ChiTietHoaDon.IDHD=@IDHD";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("IDHD", IDHD);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            grvDetails.DataSource = dt;
            grvDetails.DataBind();
        }
        protected void grOrders_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string days = e.Row.Cells[7].Text;
                if (days == "0")
                {
                    e.Row.Cells[7].Text = "Chưa thanh toán";
                }
                else if (days == "1")
                {
                    e.Row.Cells[7].Text = "Đã thanh toán";
                }
            }

        }
    }
}