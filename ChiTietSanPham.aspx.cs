using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TT_ShopJQK.Class;
namespace TT_ShopJQK
{
    public partial class ChiTietSanPham : System.Web.UI.Page
    {
        DataUtil data = new DataUtil();
        public int maSP;
        public string anh;
        protected void Page_Load(object sender, EventArgs e)
        {
            maSP = int.Parse(Request.QueryString[0].ToString());
            tblChiTietSanPham w = data.layra1sp(maSP);
            anhsp.ImageUrl = "~/Anh/anhSp/" + w.hinhAnh;
            anh = w.hinhAnh;
            anhsp1.ImageUrl = "~/Anh/anhSp/" + w.hinhAnh;
            anh = w.hinhAnh;
            //ltImage.Text = "<img src='/images/" + w.hinhAnh.ToString() + "' />";
            LbtenSP.Text = w.tenSP;
            lbdonGia.Text = w.donGia.ToString();
            LbdungTich.Text = w.dungTich;
            LbdanhMuc.Text = w.maDanhMuc.ToString();
            LbthongTinSp.Text = w.thongTinSP;
            LbkhuyenMai.Text = w.khuyenMai;
          
        }
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            Session["maSP"] = int.Parse(Request.QueryString[0].ToString());   

            Session["donGia"] = lbdonGia.Text;

            Session["tenSP"] = LbtenSP.Text;

            Session["hinhAnh"] = anh.ToString();

            Session["quantity"] = txtOrderQuantity.Text;
            string quantity = txtOrderQuantity.Text;

            Session["add"] = "add";
            //Response.Redirect("GioHang.aspx");

            ScriptManager.RegisterStartupScript(this, this.GetType(), "message",
                    "alert('Bạn vừa thêm sản phẩm " + LbtenSP.Text + " vào giỏ hàng!');location.href = 'GioHang.aspx';", true);

        }
    }
}
