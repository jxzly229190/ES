namespace WindowsMobile
{
    using DataFactory;
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.IO;
    using System.Reflection;
    using System.Windows.Forms;

    public class FrmSet : Form
    {
        private Button btOk;
        private Button btReturn;
        private IContainer components = null;
        private Label label1;
        private Label label2;
        private Label label3;
        private Label label4;
        private Label label5;
        private TextBox tbDatabase;
        private TextBox tbIP;
        private TextBox tbPassword;
        private TextBox tbUser;

        public FrmSet()
        {
            this.InitializeComponent();
            this.DataBind();
        }

        private void btOk_Click(object sender, EventArgs e)
        {
            if (!this.Check())
            {
                MessageBox.Show("必填项不允许为空！");
            }
            else
            {
                string str = "";
                if (!string.IsNullOrEmpty(this.tbIP.Text.Trim()))
                {
                    str = str + "Data Source=" + this.tbIP.Text.Trim() + ";";
                }
                if (!string.IsNullOrEmpty(this.tbDatabase.Text.Trim()))
                {
                    str = str + "Initial Catalog=" + this.tbDatabase.Text.Trim() + ";";
                }
                if (!string.IsNullOrEmpty(this.tbUser.Text.Trim()))
                {
                    str = str + "User ID=" + this.tbUser.Text.Trim() + ";";
                }
                if (!string.IsNullOrEmpty(this.tbPassword.Text.Trim()))
                {
                    str = str + "Password=" + this.tbPassword.Text.Trim() + ";";
                }
                string path = Path.GetDirectoryName(Assembly.GetExecutingAssembly().GetName().CodeBase.ToString()) + @"\AppCode.txt";
                if (path.StartsWith("file:"))
                {
                    path = path.Substring(6);
                }
                FileStream stream = new FileStream(path, FileMode.Create);
                try
                {
                    using (StreamWriter writer = new StreamWriter(stream))
                    {
                        writer.Flush();
                        writer.WriteLine(str);
                        writer.Flush();
                        writer.Close();
                    }
                    MessageBox.Show("保存成功！");
                    new FrmMain().Show();
                    base.Close();
                }
                catch (Exception exception)
                {
                    MessageBox.Show("保存失败！message = " + exception.Message);
                }
            }
        }

        private void btReturn_Click(object sender, EventArgs e)
        {
            new FrmMain().Show();
            base.Close();
        }

        private bool Check()
        {
            if (string.IsNullOrEmpty(this.tbIP.Text.Trim()))
            {
                return false;
            }
            if (string.IsNullOrEmpty(this.tbDatabase.Text.Trim()))
            {
                return false;
            }
            if (string.IsNullOrEmpty(this.tbUser.Text.Trim()))
            {
                return false;
            }
            return true;
        }

        private void DataBind()
        {
            string result = "";
            string str2 = GetConn.Conn(out result);
            if (string.IsNullOrEmpty(str2))
            {
                MessageBox.Show("读取配置文件失败！message = " + result);
            }
            else
            {
                string[] strArray = str2.Split(new char[] { ';' });
                foreach (string str3 in strArray)
                {
                    if (!string.IsNullOrEmpty(str3))
                    {
                        if (str3.Substring(0, str3.IndexOf("=")) == "Data Source")
                        {
                            this.tbIP.Text = str3.Substring(str3.IndexOf("=") + 1, (str3.Length - str3.IndexOf("=")) - 1);
                        }
                        if (str3.Substring(0, str3.IndexOf("=")) == "Initial Catalog")
                        {
                            this.tbDatabase.Text = str3.Substring(str3.IndexOf("=") + 1, (str3.Length - str3.IndexOf("=")) - 1);
                        }
                        if (str3.Substring(0, str3.IndexOf("=")) == "User ID")
                        {
                            this.tbUser.Text = str3.Substring(str3.IndexOf("=") + 1, (str3.Length - str3.IndexOf("=")) - 1);
                        }
                        if (str3.Substring(0, str3.IndexOf("=")) == "Password")
                        {
                            this.tbPassword.Text = str3.Substring(str3.IndexOf("=") + 1, (str3.Length - str3.IndexOf("=")) - 1);
                        }
                    }
                }
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && (this.components != null))
            {
                this.components.Dispose();
            }
            base.Dispose(disposing);
        }

        private void FrmSet_Closed(object sender, EventArgs e)
        {
        }

        private void InitializeComponent()
        {
            ComponentResourceManager manager = new ComponentResourceManager(typeof(FrmSet));
            this.tbDatabase = new TextBox();
            this.tbUser = new TextBox();
            this.tbPassword = new TextBox();
            this.label4 = new Label();
            this.label3 = new Label();
            this.label2 = new Label();
            this.tbIP = new TextBox();
            this.btReturn = new Button();
            this.btOk = new Button();
            this.label1 = new Label();
            this.label5 = new Label();
            base.SuspendLayout();
            this.tbDatabase.Location = new Point(0x75, 0x6a);
            this.tbDatabase.Name = "tbDatabase";
            this.tbDatabase.Size = new Size(100, 0x17);
            this.tbDatabase.TabIndex = 0x16;
            this.tbUser.Location = new Point(0x75, 0x85);
            this.tbUser.Name = "tbUser";
            this.tbUser.Size = new Size(100, 0x17);
            this.tbUser.TabIndex = 0x15;
            this.tbPassword.Location = new Point(0x75, 160);
            this.tbPassword.Name = "tbPassword";
            this.tbPassword.Size = new Size(100, 0x17);
            this.tbPassword.TabIndex = 20;
            this.label4.Location = new Point(0x18, 160);
            this.label4.Name = "label4";
            this.label4.Size = new Size(0x57, 20);
            this.label4.Text = "密码：";
            this.label4.TextAlign = ContentAlignment.TopRight;
            this.label3.Location = new Point(0x18, 0x85);
            this.label3.Name = "label3";
            this.label3.Size = new Size(0x57, 20);
            this.label3.Text = "用户名：";
            this.label3.TextAlign = ContentAlignment.TopRight;
            this.label2.Location = new Point(0x18, 0x6a);
            this.label2.Name = "label2";
            this.label2.Size = new Size(0x57, 20);
            this.label2.Text = "数据库名：";
            this.label2.TextAlign = ContentAlignment.TopRight;
            this.tbIP.Location = new Point(0x75, 0x4f);
            this.tbIP.Name = "tbIP";
            this.tbIP.Size = new Size(100, 0x17);
            this.tbIP.TabIndex = 0x13;
            this.btReturn.Location = new Point(0x75, 0xc3);
            this.btReturn.Name = "btReturn";
            this.btReturn.Size = new Size(0x48, 0x2f);
            this.btReturn.TabIndex = 0x12;
            this.btReturn.Text = "返回";
            this.btReturn.Click += new EventHandler(this.btReturn_Click);
            this.btOk.Location = new Point(0x26, 0xc3);
            this.btOk.Name = "btOk";
            this.btOk.Size = new Size(0x48, 0x2f);
            this.btOk.TabIndex = 0x11;
            this.btOk.Text = "确定";
            this.btOk.Click += new EventHandler(this.btOk_Click);
            this.label1.Location = new Point(11, 80);
            this.label1.Name = "label1";
            this.label1.Size = new Size(100, 20);
            this.label1.Text = "服务器地址：";
            this.label1.TextAlign = ContentAlignment.TopRight;
            this.label5.Font = new Font("Tahoma", 12f, FontStyle.Bold);
            this.label5.ForeColor = Color.Red;
            this.label5.Location = new Point(0x11, 15);
            this.label5.Name = "label5";
            this.label5.Size = new Size(0xce, 50);
            this.label5.Text = "提醒：设置前请连接网络！";
            base.AutoScaleDimensions = new SizeF(96f, 96f);
            base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            base.ClientSize = new Size(0xe4, 0x109);
            base.Controls.Add(this.label5);
            base.Controls.Add(this.tbDatabase);
            base.Controls.Add(this.tbUser);
            base.Controls.Add(this.tbPassword);
            base.Controls.Add(this.label4);
            base.Controls.Add(this.label3);
            base.Controls.Add(this.label2);
            base.Controls.Add(this.tbIP);
            base.Controls.Add(this.btReturn);
            base.Controls.Add(this.btOk);
            base.Controls.Add(this.label1);
            base.Icon = (Icon) manager.GetObject("$this.Icon");
            base.Name = "FrmSet";
            this.Text = "数据库设置";
            base.ResumeLayout(false);
        }
    }
}

