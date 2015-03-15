using System;
using System.Linq;

namespace ES.Server
{
    public partial class NewClient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginUser"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                lblMsg.Visible = false;
            }
        }

        protected void BtnOkClick(object sender, EventArgs e)
        {
            lblMsg.Visible = true;
            bool isValid = false;
            if (string.IsNullOrEmpty(tbName.Text))
            {
                lblMsg.Text = "客户端名称不能为空！！\r\n";
                isValid = true;
            }
            if (string.IsNullOrEmpty(tbCode.Text))
            {
                lblMsg.Text += "客户端编码不能为空！！\r\n";
                isValid = true;
            }

            if (isValid)
            {
                return;
            }

            string name = tbName.Text;
            string code = tbCode.Text;
            string address = tbAddress.Text;
            var db = new dbDataContext();
            if (db.Client.Count(c => c.Code == code) >= 0)
            {
                lblMsg.Text += "客户端编码已经使用！！\r\n";
                tbCode.Text = "";
                return;
            }

            var client = new Client
            {
                Address = address,
                Code = code,
                Name = name,
                CreatedTime = DateTime.Now,
                CreatedBy = ((LoginUser) Session["loginUser"]).Name,
                IsCurrent = false
            };

            db.Client.InsertOnSubmit(client);
            db.SubmitChanges();

            tbName.Text = "";
            tbCode.Text = "";
            tbAddress.Text = "";
            lblMsg.Text = "保存成功";
        }
    }
}