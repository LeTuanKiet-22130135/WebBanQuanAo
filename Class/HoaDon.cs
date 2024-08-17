using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TT_ShopJQK.Class
{
    public class HoaDon
    {
        public int ID { get; set; }
        public int IDDN { get; set; }
        public string tenDN { get; set; }
        public string sdt  { get; set; }
        public DateTime ngayDat {get; set; }
        public string diaChiNhan { get; set; }
        public int tongTien { get; set; }
        public byte trangThai { get; set; }
    }
}