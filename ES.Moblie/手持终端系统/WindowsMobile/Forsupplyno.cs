namespace WindowsMobile
{
    using DataFactory;
    using System;
    using System.ComponentModel;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Windows.Forms;

    public class Forsupplyno : Form
    {
        private Button button1;
        private Button button2;
        private IContainer components = null;
        private string conn;
        private System.Windows.Forms.DataGrid dataGrid1;
        private Label label2;
        private Label label3;
        private Label label4;
        private Label label5;
        private Label label6;
        private TextBox textBox1;
        private TextBox textBox2;
        private TextBox textBox3;
        private TextBox textBox4;
        private TextBox txtgoodsname;

        public Forsupplyno()
        {
            this.InitializeComponent();
        }

        private void BindData()
        {
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
            string result = "";
            string sqlstr = "select a.supplyno as 单号 , b.username 制单人 ,d.Companyname 供应商名称 ,a.createtime  创建时间 from dbo.bims_supply_doc a \r\n                                    left join pub_user b on a.createuser=b.userid \r\n                                    left join pub_organ c on a.orgno =c.orgno \r\n                                    left join bims_company d on a.companyno=d.companyno \r\n                                    where chkflag1=0  and a.billcode='SUP' and a.status=0  ";
            DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
            if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
            {
                this.dataGrid1.DataSource = set.Tables[0];
            }
            else
            {
                MessageBox.Show("没有未审核的单号");
                base.Close();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (this.textBox1.Text == "")
            {
                MessageBox.Show("入库单号不能为空");
            }
            else
            {
                string str = this.textBox1.Text.ToString().Trim();
                supplyaudit supplyaudit = new supplyaudit {
                    supplyno = str
                };
                base.Close();
                supplyaudit.ShowDialog();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.SelectBind();
        }

        private void dataGrid1_CurrentCellChanged(object sender, EventArgs e)
        {
            this.textBox1.Text = this.dataGrid1[this.dataGrid1.CurrentRowIndex, 0].ToString();
            this.SelectBind();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && (this.components != null))
            {
                this.components.Dispose();
            }
            base.Dispose(disposing);
        }

        private void Forsupplyno_Load(object sender, EventArgs e)
        {
            this.textBox2.Enabled = false;
            this.textBox3.Enabled = false;
            this.textBox4.Enabled = false;
            this.txtgoodsname.Enabled = false;
            string result = "";
            this.conn = GetConn.Conn(out result);
            if (string.IsNullOrEmpty(this.conn))
            {
                MessageBox.Show("读取配置文件失败，请重新尝试！错误：" + result);
            }
            else
            {
                this.BindData();
            }
        }

        private void InitializeComponent()
        {
            this.button1 = new Button();
            this.textBox1 = new TextBox();
            this.label2 = new Label();
            this.label4 = new Label();
            this.textBox2 = new TextBox();
            this.label5 = new Label();
            this.textBox3 = new TextBox();
            this.label6 = new Label();
            this.textBox4 = new TextBox();
            this.button2 = new Button();
            this.label3 = new Label();
            this.txtgoodsname = new TextBox();
            this.dataGrid1 = new System.Windows.Forms.DataGrid();
            base.SuspendLayout();
            this.button1.BackColor = Color.LightGray;
            this.button1.Location = new Point(0x87, 0xeb);
            this.button1.Name = "button1";
            this.button1.Size = new Size(0x52, 0x20);
            this.button1.TabIndex = 4;
            this.button1.Text = "确定";
            this.button1.Click += new EventHandler(this.button1_Click);
            this.textBox1.Location = new Point(0x48, 120);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new Size(0xa3, 0x17);
            this.textBox1.TabIndex = 0x12;
            this.label2.ForeColor = Color.Blue;
            this.label2.Location = new Point(2, 0x79);
            this.label2.Name = "label2";
            this.label2.Size = new Size(70, 20);
            this.label2.Text = "单号:";
            this.label4.ForeColor = Color.Blue;
            this.label4.Location = new Point(2, 0x90);
            this.label4.Name = "label4";
            this.label4.Size = new Size(70, 20);
            this.label4.Text = "机构名称:";
            this.textBox2.Location = new Point(0x48, 0x8f);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new Size(0xa3, 0x17);
            this.textBox2.TabIndex = 0x17;
            this.label5.ForeColor = Color.Blue;
            this.label5.Location = new Point(2, 0xa9);
            this.label5.Name = "label5";
            this.label5.Size = new Size(70, 20);
            this.label5.Text = "制单人:";
            this.textBox3.Location = new Point(0x48, 0xa6);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new Size(0xa3, 0x17);
            this.textBox3.TabIndex = 0x19;
            this.label6.ForeColor = Color.FromArgb(0, 0, 0xc0);
            this.label6.Location = new Point(2, 0xbf);
            this.label6.Name = "label6";
            this.label6.Size = new Size(70, 20);
            this.label6.Text = "制单时间:";
            this.textBox4.Location = new Point(0x48, 0xbd);
            this.textBox4.Name = "textBox4";
            this.textBox4.Size = new Size(0xa3, 0x17);
            this.textBox4.TabIndex = 0x1b;
            this.button2.BackColor = Color.LightGray;
            this.button2.Location = new Point(0x10, 0xeb);
            this.button2.Name = "button2";
            this.button2.Size = new Size(0x52, 0x20);
            this.button2.TabIndex = 0x1c;
            this.button2.Text = "查询";
            this.button2.Click += new EventHandler(this.button2_Click);
            this.label3.ForeColor = Color.Blue;
            this.label3.Location = new Point(2, 0xd8);
            this.label3.Name = "label3";
            this.label3.Size = new Size(70, 20);
            this.label3.Text = "供应商:";
            this.txtgoodsname.Location = new Point(0x48, 0xd4);
            this.txtgoodsname.Name = "txtgoodsname";
            this.txtgoodsname.Size = new Size(0xa3, 0x17);
            this.txtgoodsname.TabIndex = 0x24;
            this.dataGrid1.BackgroundColor=Color.FromArgb(0x40, 0x40, 0x40);
            this.dataGrid1.Location = new Point(3, 3);
            this.dataGrid1.Name = "dataGrid1";
            this.dataGrid1.Size = new Size(0xe8, 0x73);
            this.dataGrid1.TabIndex = 0x2a;
            this.dataGrid1.CurrentCellChanged += new EventHandler(this.dataGrid1_CurrentCellChanged);
            base.AutoScaleDimensions = new SizeF(96f, 96f);
            base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            this.BackColor = SystemColors.ControlDark;
            base.ClientSize = new Size(0xee, 270);
            base.Controls.Add(this.dataGrid1);
            base.Controls.Add(this.txtgoodsname);
            base.Controls.Add(this.label3);
            base.Controls.Add(this.button2);
            base.Controls.Add(this.textBox4);
            base.Controls.Add(this.label6);
            base.Controls.Add(this.textBox3);
            base.Controls.Add(this.label5);
            base.Controls.Add(this.textBox2);
            base.Controls.Add(this.label4);
            base.Controls.Add(this.label2);
            base.Controls.Add(this.textBox1);
            base.Controls.Add(this.button1);
            base.Name = "Forsupplyno";
            this.Text = "选择入库单号";
            base.Load += new EventHandler(this.Forsupplyno_Load);
            base.ResumeLayout(false);
        }

        private void SelectBind()
        {
            if (this.textBox1.Text == "")
            {
                MessageBox.Show("单号不能为空");
            }
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
            string result = "";
            string sqlstr = "select c.orgname , b.username ,d.Companyname ,a.createtime  from dbo.bims_supply_doc a \r\n                                    left join pub_user b on a.createuser=b.userid \r\n                                    left join pub_organ c on a.orgno =c.orgno \r\n                                    left join bims_company d on a.companyno=d.companyno \r\n                                    where chkflag1=0  and a.billcode='SUP' and a.status=0 and a.supplyno='" + this.textBox1.Text + "'";
            DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
            if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
            {
                this.textBox2.Text = set.Tables[0].Rows[0]["orgname"].ToString();
                this.textBox3.Text = set.Tables[0].Rows[0]["username"].ToString();
                this.textBox4.Text = set.Tables[0].Rows[0]["createtime"].ToString();
                this.txtgoodsname.Text = set.Tables[0].Rows[0]["Companyname"].ToString();
            }
            else
            {
                MessageBox.Show("没有这个单号", result);
            }
        }

        public class suppply
        {
            private string opt_k__BackingField;
            private string val_k__BackingField;

            public string Optname
            {
                get
                {
                    return opt_k__BackingField;
                }
                set
                {
                    opt_k__BackingField = value;
                }
            }

            public string Value
            {
                get
                {
                    return val_k__BackingField;
                }
                set
                {
                    this.val_k__BackingField = value;
                }
            }
        }
    }
}

