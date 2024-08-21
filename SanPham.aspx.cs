using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TT_ShopJQK.Class;
namespace TT_ShopJQK
{
    public partial class SanPham : System.Web.UI.Page
    {
        DataUtil data = new DataUtil();
        public int maSP;
        public string anh;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hienthi();
            }
            //int b = Convert.ToInt32(Request["maDanhMuc"]);
            //tblChiTietSanPham d = data.layra1sp(b);
            //Session["sp"] = d;
            //RsSanPham.DataSource = data.dsSanPhamDanhMuc(Convert.ToInt32(Request["maDanhMuc"]));
            //RsSanPham.DataBind();
            //maSP = int.Parse(Request.QueryString[0].ToString());
            //tblChiTietSanPham w = data.layra1sp(maSP);
            
        }
        public void hienthi()
        {
            int b = Convert.ToInt32(Request.QueryString["maDanhMuc"]);
            tblChiTietSanPham d = data.layra1sp(b);
            //RsSanPham.DataSource = GetData("SELECT * FROM ChiTietSanPham WHERE maDanhMuc =");
            DataBind();

        }

        //private DataTable GetData(string query)
        //{
        //    DataTable dt = new DataTable();
        //    string constr = @"Data Source=LAPTOP-4SO828CP\SQLEXPRESS;Initial Catalog=JQKShop;Integrated Security=True";
        //    using (SqlConnection con = new SqlConnection(constr))
        //    {
        //        using (SqlCommand cmd = new SqlCommand(query))
        //        {
        //            using (SqlDataAdapter sda = new SqlDataAdapter())
        //            {
        //                cmd.CommandType = CommandType.Text;
        //                cmd.Connection = con;
        //                sda.SelectCommand = cmd;
        //                sda.Fill(dt);
        //            }
        //        }
        //        return dt;
        //    }
        //}
    }
}