using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace TT_ShopJQK.Admin
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application.Lock();
            System.IO.StreamReader sr;
            sr = new System.IO.StreamReader(Server.MapPath("sl.txt"));
            string s = sr.ReadLine();
            sr.Close();
            Application.UnLock();
            Application["counter"] = s;
            Application["cur"] = "0";
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            //Session["login"] = "";
            //Application["counter"] = Int32.Parse(Application["counter"].ToString()) + 1;
            //System.IO.StreamWriter sw;
            //sw = new System.IO.StreamWriter(Server.MapPath("sl.txt"));
            //sw.Write(Application["counter"].ToString());
            //sw.Close();
            //Application["cur"] = Int32.Parse(Application["cur"].ToString()) + 1;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            Application["cur"] = Int32.Parse(Application["cur"].ToString()) - 1;
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}