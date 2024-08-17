using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TT_ShopJQK.Class;
namespace TT_ShopJQK.Admin
{
    public partial class DuyetDon : System.Web.UI.Page
    {
        DataUtil data = new DataUtil();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HoaDon d = (HoaDon)Session["us"];
                txtID.Text = d.ID.ToString();
                Byte role = (byte)d.trangThai;
                if (role == 1)
                {

                    ddlDuyet.SelectedValue = "1";
                }
                else if (role == 0)
                {
                    ddlDuyet.SelectedValue = "0";

                }
                txtID.Enabled = false;
                DataBind();
            }
        }

        protected void btnSua_Click1(object sender, EventArgs e)
        {
            try
            {
                HoaDon x = new HoaDon();
                x.ID = int.Parse(txtID.Text);
                string role = ddlDuyet.SelectedValue;
                if (role == "1")
                {
                    x.trangThai = Convert.ToByte(1);
                }
                else if (role == "0")
                {
                    x.trangThai = Convert.ToByte(0);
                }
                data.SuaHD(x);
                the.Text = "Duyệt thành công !";
                Response.Redirect(url: "QuanLyDonHang.aspx");
            }
            catch (Exception e1)
            {

                the.Text = "Something wrong: " + e1.Message.ToString();
            }
        }
        
    }
}