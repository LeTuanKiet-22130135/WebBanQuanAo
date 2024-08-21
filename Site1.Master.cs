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
    public partial class Site1 : System.Web.UI.MasterPage
    {
        DataUtil xuly = new DataUtil();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userlogin"] != null)
                {
                    lbName.Text = "Xin Chào " + Session["username"].ToString();
                }
                else
                {
                    lbName.Text = " ";
                }
                //hienthidanhmuc();
                //hienthidanhmuccon();
                //this.BindMenu();
            }
        }
        protected void btnTim_Click(object sender, EventArgs e)
        {
            Session["tukhoa"] = Txttimkiem.Text;
            Response.Redirect("TimKiem.aspx");
        }
        //private void hienthidanhmuc()
        //{
        //    RpDanhMuc.DataSource = xuly.dsDanhMuc();
        //    DataBind();
        //}
        //protected void hienthidanhmuccon()
        //{
        //    RpDanhMuc.DataSource = xuly.dsDanhMuccon();

        //    DataBind();
        //}
        protected void rptMenu_OnItemBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Repeater rptSubMenu = e.Item.FindControl("rptChildMenu") as Repeater;
                rptSubMenu.DataSource = GetData("SELECT maDanhMuc,tenDanhMuc,maThuongHieu FROM DanhMucSanPham WHERE maThuongHieu =" + ((System.Data.DataRowView)(e.Item.DataItem)).Row[0]);
                rptSubMenu.DataBind();
            }
        }

        //private void BindMenu()
        //{
        //    this.RpDanhMuc.DataSource = GetData("SELECT * FROM DanhMucSanPham WHERE maThuongHieu is null");
        //    this.RpDanhMuc.DataBind();
        //}
        private DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            string constr = @"Data Source=LAPTOP-4SO828CP\SQLEXPRESS;Initial Catalog=JQKShop;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);
                    }
                }
                return dt;
            }
        }
    }
}