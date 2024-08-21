using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TT_ShopJQK.Class;
using System.Text.RegularExpressions;
using iTextSharp.text;
using System.IO;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
namespace TT_ShopJQK
{
    public partial class My_Account : System.Web.UI.Page
    {
        DataUtil data = new DataUtil();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //lbDetailTitle.Text = "";
                if (Session["username"] != null)
                {
                    lbName.Text = Session["username"].ToString();
                }
                else
                {
                    lbName.Text = "";
                }
                showList();

            }
        }
        private void showList()
        {
            if (Session["userlogin"] != null)
            {
                int IDDN = Convert.ToInt32(Session["userlogin"].ToString());
                string sqlCon = @"Data Source=LAPTOP-4SO828CP\SQLEXPRESS;Initial Catalog=JQKShop;Integrated Security=True";

                SqlConnection con = new SqlConnection(sqlCon);
                string query = "select * from HoaDon where IDDN=@IDDN";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("IDDN", IDDN);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                grOrders.DataSource = dt;
                grOrders.DataBind();
            }

        }
        protected void grOrders_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    string orderid = e.Row.Cells[0].Text;
            //    Session["orderid"] = orderid;
            //    string days = e.Row.Cells[2].Text;
            //    if (days == "False")
            //    {
            //        e.Row.Cells[2].Text = "Chưa thanh toán";
            //    }
            //    else if (days == "True")
            //    {
            //        e.Row.Cells[2].Text = "Đã thanh toán";
            //    }
            //}
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string days = e.Row.Cells[6].Text;
                if (days == "False")
                {
                    e.Row.Cells[6].Text = "Chưa thanh toán";
                }
                else if (days == "True")
                {
                    e.Row.Cells[6].Text = "Đã thanh toán";
                }
            }
            
        }
        private void showdetail(int IDHD)
        {
            string sqlCon = @"Data Source=LAPTOP-4SO828CP\SQLEXPRESS;Initial Catalog=JQKShop;Integrated Security=True";

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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string sqlCon = @"Data Source=LAPTOP-4SO828CP\SQLEXPRESS;Initial Catalog=JQKShop;Integrated Security=True";
            SqlConnection con = new SqlConnection(sqlCon);
            con.Open();
            string checkuser = "select * from Users";
            SqlCommand cmd = new SqlCommand(checkuser, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (Txtmatkhau.Text == "")
                {
                    msg.Text = "Mật khẩu không được để trống";
                    Txtmatkhau.Focus();
                    break;
                }
                else if (Txtmatkhau.Text != "")
                {

                    int userid = int.Parse(Session["userlogin"].ToString());
                    SuaUser(userid);
                    msg.Text = "Cập nhật thông tin tài khoản thành công";
                    break;
                    //else
                    //{
                    //    msg.Text = "Email không hợp lệ";
                    //}
                }
            }
        }
        public void SuaUser(int IDDN)/*(Users b)*/
        {
            string sqlCon = @"Data Source=LAPTOP-4SO828CP\SQLEXPRESS;Initial Catalog=JQKShop;Integrated Security=True";
            SqlConnection con = new SqlConnection(sqlCon);
            con.Open();
            string sql1 = "update Users set tenDN=@tenDN,email=@email,diaChi=@diaChi,sdt=@sdt,matkhauDN=@matkhauDN where IDDN=@IDDN";
            SqlCommand cmd = new SqlCommand(sql1, con);
            cmd.Parameters.AddWithValue("email", TxtEmail.Text);
            cmd.Parameters.AddWithValue("diaChi", TxtDiachi.Text);
            cmd.Parameters.AddWithValue("sdt", TxtSdt.Text);
            cmd.Parameters.AddWithValue("matkhauDN", Txtmatkhau.Text);
            cmd.Parameters.AddWithValue("IDDN", IDDN);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        //protected void lbLogin_Click(object sender, EventArgs e)
        //{
        //    Response.Cookies.Add(new HttpCookie("returnUrl", Request.Url.PathAndQuery));
        //    Response.Redirect("Login.aspx");
        //}

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
        protected void urlLogin_Click(object sender, EventArgs e)
        {

            if (Session["userlogin"] == null)
            {
                urlLogin.Text = "Đăng Xuất";
                Response.Redirect("DangNhap.aspx");
            }
            else if (Session["userlogin"] != null)
            {
                Session.Remove("userlogin");
                Session.Remove("username");
                Session.Remove("useremail");
                Response.Cookies.Add(new HttpCookie("returnUrl", Request.Url.PathAndQuery));
                HttpCookie returnCookie = Request.Cookies["returnUrl"];
                if ((returnCookie == null) || string.IsNullOrEmpty(returnCookie.Value))
                {
                    Response.Redirect(url: "~/TrangChu.aspx");
                }
                else
                {
                    HttpCookie deleteCookie = new HttpCookie("returnUrl");
                    deleteCookie.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(deleteCookie);
                    Response.Redirect(returnCookie.Value);
                }
            }
        }
        protected void lbExport_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "select")
            {
                int m = Convert.ToInt32(e.CommandArgument);
                Session["orderid"] = m;

                if (Session["orderid"] != null)
                {
                    grOrders.Visible = false;
                    string orderid = Session["orderid"].ToString();
                    showdetail(Convert.ToInt32(orderid));
                    grvDetails.Visible = false;
                    lbDetailTitle.Text = "Chi tiết order #" + m;
                    findaddress(m);
                    showgrid(m);
                    Panel2.Visible = true;
                    GridView1.Visible = true;

                }
            }
        }
        private void findaddress(int orderid)
        {
            String mycon = @"Data Source=LAPTOP-4SO828CP\SQLEXPRESS;Initial Catalog=JQKShop;Integrated Security=True";

            String myquery = "Select a.ID ,ngayDat,tongTien,a.IDDN,a.sdt,a.diaChiNhan,b.tenDN " +
                "from HoaDon a inner join Users b on a.IDDN=b.IDDN " +
                "where a.ID='" + orderid + "'";
            SqlConnection con = new SqlConnection(mycon);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = myquery;
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lborderid.Text = ds.Tables[0].Rows[0]["ID"].ToString();
                lbuser.Text = ds.Tables[0].Rows[0]["tenDN"].ToString();
                lbdate.Text = ds.Tables[0].Rows[0]["ngayDat"].ToString();
                lbphone.Text = ds.Tables[0].Rows[0]["sdt"].ToString();
                lbaddress.Text = ds.Tables[0].Rows[0]["diaChiNhan"].ToString();
                lbmoney.Text = ds.Tables[0].Rows[0]["tongTien"].ToString();
            }

            con.Close();
        }
        private void showgrid(int orderid)
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("Mã sản phẩm");
            dt.Columns.Add("Tên sản phẩm");
            dt.Columns.Add("Số lượng mua");
            dt.Columns.Add("Đơn giá");
            String mycon = @"Data Source=LAPTOP-4SO828CP\SQLEXPRESS;Initial Catalog=JQKShop;Integrated Security=True";
            SqlConnection scon = new SqlConnection(mycon);
            String myquery = "Select IDHD,c.maSP, tenSP,soLuong,a.donGia " +
                "from ChiTietHoaDon " +
                "a inner join HoaDon b on a.IDHD = b.ID " +
                "inner join ChiTietSanPham c on a.maSP = c.maSP " +
                "where IDHD='" + orderid + "'";
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = myquery;
            cmd.Connection = scon;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            int totalrows = ds.Tables[0].Rows.Count;
            int i = 0;
            while (i < totalrows)
            {
                dr = dt.NewRow();
                dr["Mã sản phẩm"] = ds.Tables[0].Rows[i]["maSP"].ToString();
                dr["Tên sản phẩm"] = ds.Tables[0].Rows[i]["tenSP"].ToString();          
                dr["Số lượng mua"] = ds.Tables[0].Rows[i]["soLuong"].ToString();
                dr["Đơn giá"] = ds.Tables[0].Rows[i]["donGia"].ToString();
                dt.Rows.Add(dr);
                i = i + 1;
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();

            //Label8.Text = grandtotal.ToString();
        }
        private void exportpdf()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Panel2.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }
        protected void btnpdf_Click(object sender, EventArgs e)
        {
            exportpdf();
        }

    }
}
