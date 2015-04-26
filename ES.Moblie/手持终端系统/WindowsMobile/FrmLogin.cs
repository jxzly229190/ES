using System.Data;

namespace WindowsMobile
{
    using DataFactory;
    using System;
    using System.ComponentModel;
    //using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Threading;
    using System.Windows.Forms;

    public class FrmLogin : Form
    {
        private Button btCancel;
        private Button btChk;
        private Button btLogin;
        private Button btSet;
        private IContainer components = null;
        private string conn;
        private static ThreadStart CachedAnonymousMethodDelegate1;
        private Label label1;
        private Label label2;
        private Label label4;
        private TextBox tbPwd;
        private TextBox tbUser;

        public FrmLogin()
        {
            this.InitializeComponent();
            string result = "";
            this.conn = GetConn.Conn(out result);
            if (string.IsNullOrEmpty(this.conn))
            {
                MessageBox.Show("读取配置文件失败，请重新尝试！错误：" + result);
            }
            this.tbUser.Focus();
        }

        private static void btLogin_Click()
        {
            Application.Run(new FrmMain());
        }

        private void btCancel_Click(object sender, EventArgs e)
        {
            base.Close();
        }

        private void btChk_Click(object sender, EventArgs e)
        {
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
            string result = "";
            string str2 = DbFactory.ExecuteScalar(con, "select getdate()", null, null,System.Data.CommandType.Text, out result);
            if (result != "1")
            {
                MessageBox.Show("连接数据库失败，请检查网络和设置！message = " + result);
            }
            else
            {
                MessageBox.Show("连接成功！");
            }
        }

        private void btLogin_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.tbUser.Text.Trim()))
            {
                if (this.Login(this.tbUser.Text.Trim(), this.tbPwd.Text.Trim()) == "0")
                {
                    MessageBox.Show("用户名或密码错误！");
                }
                else
                {
                    User user = new User {
                        SysUser = this.tbUser.Text.Trim()
                    };
                    new Thread(() => Application.Run(new FrmMain())).Start();
                    base.Close();
                }
            }
        }

        private void btSet_Click(object sender, EventArgs e)
        {
            new FrmTest().ShowDialog();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && (this.components != null))
            {
                this.components.Dispose();
            }
            base.Dispose(disposing);
        }

        private void FrmLogin_Load(object sender, EventArgs e)
        {
        }

        private void InitializeComponent()
        {
            this.btChk = new System.Windows.Forms.Button();
            this.btSet = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.tbPwd = new System.Windows.Forms.TextBox();
            this.tbUser = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.btCancel = new System.Windows.Forms.Button();
            this.btLogin = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btChk
            // 
            this.btChk.Font = new System.Drawing.Font("Tahoma", 12F, System.Drawing.FontStyle.Bold);
            this.btChk.Location = new System.Drawing.Point(133, 197);
            this.btChk.Name = "btChk";
            this.btChk.Size = new System.Drawing.Size(72, 48);
            this.btChk.TabIndex = 19;
            this.btChk.Text = "测  试";
            this.btChk.Click += new System.EventHandler(this.btChk_Click);
            // 
            // btSet
            // 
            this.btSet.Font = new System.Drawing.Font("Tahoma", 12F, System.Drawing.FontStyle.Bold);
            this.btSet.Location = new System.Drawing.Point(39, 197);
            this.btSet.Name = "btSet";
            this.btSet.Size = new System.Drawing.Size(72, 48);
            this.btSet.TabIndex = 18;
            this.btSet.Text = "设  置";
            this.btSet.Click += new System.EventHandler(this.btSet_Click);
            // 
            // label4
            // 
            this.label4.Font = new System.Drawing.Font("Tahoma", 18F, System.Drawing.FontStyle.Bold);
            this.label4.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(64)))), ((int)(((byte)(192)))));
            this.label4.Location = new System.Drawing.Point(21, 28);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(205, 49);
            this.label4.TabIndex = 20;
            this.label4.Text = "手持客户端";
            this.label4.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // tbPwd
            // 
            this.tbPwd.Location = new System.Drawing.Point(89, 115);
            this.tbPwd.Name = "tbPwd";
            this.tbPwd.PasswordChar = '*';
            this.tbPwd.Size = new System.Drawing.Size(129, 21);
            this.tbPwd.TabIndex = 17;
            // 
            // tbUser
            // 
            this.tbUser.Location = new System.Drawing.Point(89, 84);
            this.tbUser.Name = "tbUser";
            this.tbUser.Size = new System.Drawing.Size(129, 21);
            this.tbUser.TabIndex = 16;
            // 
            // label2
            // 
            this.label2.Location = new System.Drawing.Point(12, 117);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(71, 20);
            this.label2.TabIndex = 22;
            this.label2.Text = "密    码：";
            // 
            // label1
            // 
            this.label1.Location = new System.Drawing.Point(12, 86);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(71, 20);
            this.label1.TabIndex = 23;
            this.label1.Text = "用户名：";
            // 
            // btCancel
            // 
            this.btCancel.Font = new System.Drawing.Font("Tahoma", 12F, System.Drawing.FontStyle.Bold);
            this.btCancel.Location = new System.Drawing.Point(133, 144);
            this.btCancel.Name = "btCancel";
            this.btCancel.Size = new System.Drawing.Size(72, 48);
            this.btCancel.TabIndex = 15;
            this.btCancel.Text = "取  消";
            this.btCancel.Click += new System.EventHandler(this.btCancel_Click);
            // 
            // btLogin
            // 
            this.btLogin.Font = new System.Drawing.Font("Tahoma", 12F, System.Drawing.FontStyle.Bold);
            this.btLogin.Location = new System.Drawing.Point(39, 144);
            this.btLogin.Name = "btLogin";
            this.btLogin.Size = new System.Drawing.Size(72, 48);
            this.btLogin.TabIndex = 14;
            this.btLogin.Text = "登  录";
            this.btLogin.Click += new System.EventHandler(this.btLogin_Click);
            // 
            // FrmLogin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(96F, 96F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            this.ClientSize = new System.Drawing.Size(238, 270);
            this.Controls.Add(this.btChk);
            this.Controls.Add(this.btSet);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.tbPwd);
            this.Controls.Add(this.tbUser);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btCancel);
            this.Controls.Add(this.btLogin);
            this.Name = "FrmLogin";
            this.Text = "用户登录";
            this.Load += new System.EventHandler(this.FrmLogin_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        private string Login(string userid, string pwd)
        {
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
            string result = "";
            string str2 = "update pub_user set laborun = '1' where laborun is null or laborun = ''\r\n\r\nif object_id('bims_check_mac') is null\r\nbegin\r\nCREATE TABLE [dbo].[bims_check_mac](\r\n\t[orgno] [varchar](10) NOT NULL,\r\n\t[checkno] [varchar](30) NOT NULL,\r\n\t[createuser] [varchar](10) NOT NULL,\r\n\t[createtime] [datetime] NOT NULL,\r\n\t[rowid] [int] NULL,\r\n\t[goodsid] [varchar](13) NOT NULL,\r\n\t[lotno] [varchar](20) NOT NULL,\r\n\t[goodsqty] [numeric](14, 4) NOT NULL,\r\n\t[checkqty] [numeric](14, 4) NOT NULL,\r\n\t[bak1] [varchar](100) NULL,\r\n\t[bak2] [varchar](100) NULL,\r\n\t[bak3] [varchar](100) NULL,\r\n\t[bak4] [varchar](100) NULL,\r\n\t[bak5] [datetime] NULL,\r\n\t[bak6] [datetime] NULL,\r\n\t[bak7] [int] NULL,\r\n\t[bak8] [numeric](14, 4) NULL,\r\n\t[bak9] [numeric](14, 4) NULL,\r\n\t[memo] [varchar](1000) NULL\r\n) ON [PRIMARY]\r\nALTER TABLE [dbo].[bims_check_mac] ADD  CONSTRAINT [DF__bims_chec__creat__26123CD4]  DEFAULT (getdate()) FOR [createtime]\r\nend\r\n\r\nINSERT sys_ini(ini,funcname,descr,enum,para,notes,datatype,iftran) values('7777','盘点管理','是否按批次盘点','1：不按批次，2：按批次','2',null,'char',0)\r\n\r\nif COL_LENGTH('bims_check_mac','id') is null alter table bims_check_mac add id bigint identity(1,1) primary key\r\n\r\nif OBJECT_ID('bims_jgm_bill') is null\r\nbegin\r\ncreate table bims_jgm_bill(\r\nid bigint identity(1,1) not null primary key,\r\nbillcode varchar(10) not null,\r\nbillno varchar(20) not null,\r\njgmcode varchar(20) not null,\r\nexecdate datetime not null default getdate())\r\nend\r\n\r\nif OBJECT_ID('bims_goods_jgm') is null\r\nbegin\r\ncreate table bims_goods_jgm(\r\ngoodsid varchar(15) not null,\r\njgmcode varchar(20) not null,\r\njgmType int not null default 1,\r\nspecnum int not null default 1,\r\ncreatetime datetime not null default getdate(),\r\nexecdate datetime not null default getdate(),\r\nstamp timestamp)\r\n\r\nalter table bims_goods_jgm add CONSTRAINT pk_bims_goods_jgm PRIMARY KEY(goodsid,jgmcode)\r\nend\r\n";
            if (!string.IsNullOrEmpty(str2))
            {
                string str3 = DbFactory.ExecuteScalar(con, str2, null, null, CommandType.Text, out result);
            }
            str2 = "select userid from pub_user where userid = '" + userid + "' and laborun = '" + pwd + "'";
            if (string.IsNullOrEmpty(DbFactory.ExecuteScalar(con, str2, null, null, CommandType.Text, out result)))
            {
                return "0";
            }
            return "1";
        }
    }
}

