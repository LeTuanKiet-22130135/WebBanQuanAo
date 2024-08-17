using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TT_ShopJQK.Class;
namespace TT_ShopJQK.Admin
{
    public partial class ThemSanPham : System.Web.UI.Page
    {
        DataUtil da = new DataUtil();
        protected void Page_Load(object sender, EventArgs e)
        {
            cbbmaDanhMuc.DataSource = da.au();
            cbbmaDanhMuc.DataTextField = "tenDanhMuc";
            cbbmaDanhMuc.DataValueField = "maDanhMuc";
            DataBind();
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                tblChiTietSanPham bo = new tblChiTietSanPham();
                //bo.maDT = int.Parse(txtmaDT.Text);
                bo.maDanhMuc = int.Parse(cbbmaDanhMuc.SelectedValue);
                bo.tenSP = txttenSP.Text;
                bo.donGia = int.Parse(txtdongia.Text);
                bo.khuyenMai = txtKhuyenmai.Text;
                bo.thongTinSP = txtgioithieu.Text;
                bo.dungTich = txtDungtich.Text;
                bo.hinhAnh = txtAnhd.FileName;
               
                da.Them(bo);
                the.Text = "them thanh cong";
            }
            catch (Exception ex)
            {

                the.Text = "khong them duoc" + ex.Message;

            }
        }
    }
}