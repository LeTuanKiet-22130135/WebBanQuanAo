using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using TT_ShopJQK.Class;

namespace TT_ShopJQK
{

    public class tbDisplayDataUtil
    {
        SqlConnection con;
        public tbDisplayDataUtil()
        {
            string sqlCon = @"Data Source=LAPTOP-IA9NJULV\SQL;Initial Catalog=JQKShop;Integrated Security=True";
            con = new SqlConnection(sqlCon);
        }
        public List<HoaDon> lsOrder(int IDDN)
        {
            List<HoaDon> ls = new List<HoaDon>();
            string sql = "select * from HoaDon where IDDN=@IDDN";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                HoaDon o = new HoaDon();
                o.ID = (int)dr["ID"];
                o.ngayDat = (DateTime)dr["ngayDat"];
                o.tongTien = (int)dr["tongTien"];
                o.IDDN = (int)dr["IDDN"];
                //o. = (bool)dr["Status"];
                o.trangThai = (byte)dr["trangThai"];
                o.sdt = (string)dr["sdt"];
                o.tenDN = (string)dr["tenDN"];
                o.diaChiNhan = (string)dr["diaChiNhan"];
                ls.Add(o);
            }
            con.Close();
            return ls;
        }

        //internal object lsOrder()
        //{
        //    throw new NotImplementedException();
        //}

        public void addOrder(HoaDon o)
        {
            con.Open();
            string sql = "insert into HoaDon values (@IDDN,@tenDN,@sdt,@ngayDat,@diaChiNhan,@tongTien,@trangThai)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("IDDN", o.IDDN);
            cmd.Parameters.AddWithValue("tenDN", o.tenDN);
            cmd.Parameters.AddWithValue("ngayDat", o.ngayDat);
            //cmd.Parameters.AddWithValue("status", o.Status);
            cmd.Parameters.AddWithValue("sdt", o.sdt);
            cmd.Parameters.AddWithValue("diaChiNhan", o.diaChiNhan);
            cmd.Parameters.AddWithValue("tongTien", o.tongTien);
            cmd.Parameters.AddWithValue("trangThai", o.trangThai);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void addOrderDetail(ChiTietHoaDon o)
        {
            con.Open();
            string sql = "insert into ChiTietHoaDon values (@IDHD,@maSP,@donGia,@soLuong)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("IDHD", o.IDHD);
            cmd.Parameters.AddWithValue("maSP", o.maSP);           
            cmd.Parameters.AddWithValue("donGia", o.donGia);
            cmd.Parameters.AddWithValue("soLuong", o.soLuong);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}