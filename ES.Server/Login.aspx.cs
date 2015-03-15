using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ES.Server
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1Authenticate(object sender, AuthenticateEventArgs e)
        {
            var db = new dbDataContext();
            var user = db.LoginUsers.SingleOrDefault(u => u.Name == Login1.UserName && u.Pwd == Login1.Password);
            if (user!=null)
            {
                user.LastLogin = DateTime.Now;
                db.SubmitChanges();
                Session["loginUser"] = user;
                Response.Redirect("NewClient.aspx");
            }
            else
            {
                Login1.FailureText = "用户名或者密码错误，请确认后重新输入";
                Login1.UserName = "";
                Login1.Focus();
            }
        }
    }
}