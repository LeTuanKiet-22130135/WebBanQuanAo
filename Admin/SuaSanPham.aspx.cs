using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TT_ShopJQK.Class;

namespace TT_ShopJQK.Admin
{
    public partial class SuaSanPham : System.Web.UI.Page
    {
        DataUtil data = new DataUtil();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tblChiTietSanPham d = (tblChiTietSanPham)Session["sp"];
                txtmaSP.Text = d.maSP.ToString();

                cbbmaDanhMuc.DataSource = data.au();
                cbbmaDanhMuc.DataTextField = "tenDanhMuc";
                cbbmaDanhMuc.DataValueField = "maDanhMuc";
                DataBind();
                cbbmaDanhMuc.SelectedValue = d.maDanhMuc.ToString();

                txttenSP.Text = d.tenSP;
                txtdongia.Text = d.donGia.ToString();
                txtKhuyenmai.Text = d.khuyenMai;
                txtgioithieu.Text = d.thongTinSP;
                txtDungtich.Text = d.dungTich;
                Txthinhanh.Text = d.hinhAnh;
            }
        }

        protected void btnSua_Click1(object sender, EventArgs e)
        {
            try
            {
                tblChiTietSanPham bo = new tblChiTietSanPham();
                bo.maSP = int.Parse(txtmaSP.Text);
                bo.maDanhMuc = int.Parse(cbbmaDanhMuc.SelectedValue);
                bo.tenSP = txttenSP.Text;
                bo.donGia = int.Parse(txtdongia.Text);
                bo.khuyenMai = txtKhuyenmai.Text;
                bo.thongTinSP = txtgioithieu.Text;
                bo.dungTich = txtDungtich.Text;
                bo.hinhAnh = Txthinhanh.Text;
  
                data.Sua(bo);
                the.Text = "Cập nhật thành công! ";
            }
            catch (Exception ex)
            {

                the.Text = "Khong sửa được" + ex.Message;

            }
        }
    }
}