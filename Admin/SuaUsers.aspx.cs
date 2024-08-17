using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TT_ShopJQK.Class;
namespace TT_ShopJQK.Admin
{
    public partial class SuaUsers : System.Web.UI.Page
    {
        DataUtil data = new DataUtil();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Users d = (Users)Session["us"];
                txtIDDN.Text = d.IDDN.ToString();
                txtTendangnhap.Text = d.tenDN;
                txtEmail.Text = d.email;
                txtsdt.Text = d.sdt;
                txtDiachi.Text = d.diaChi;
                txtMatkhau.Text = d.matkhauDN;
                Byte role = (byte)d.quyen;
                if (role == 1)
                {

                    ddlQuyen.SelectedValue = "1";
                }
                else if (role == 0)
                {
                    ddlQuyen.SelectedValue = "0";

                }
                txtIDDN.Enabled = false;
                DataBind();
            }
        }

        protected void btnSua_Click1(object sender, EventArgs e)
        {
            try
            {
                Users x = new Users();
                x.IDDN = int.Parse(txtIDDN.Text);
                x.tenDN = txtTendangnhap.Text;
                x.email = txtEmail.Text;
                x.sdt = txtsdt.Text;
                x.diaChi = txtDiachi.Text;
                x.matkhauDN = txtMatkhau.Text;
                string role = ddlQuyen.SelectedValue;
                if (role == "1")
                {
                    x.quyen = Convert.ToByte(1);
                }
                else if (role == "0")
                {
                    x.quyen = Convert.ToByte(0);
                }
                data.SuaUser(x);
                the.Text = "Sửa thành công !";
                Response.Redirect(url: "QuanLyUsers.aspx");
            }
            catch (Exception e1)
            {

                the.Text = "Something wrong: " + e1.Message.ToString();
            }
        }
    }
}