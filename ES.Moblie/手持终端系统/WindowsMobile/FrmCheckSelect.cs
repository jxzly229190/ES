namespace WindowsMobile
{
    using DataFactory;
    using System;
    using System.ComponentModel;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Windows.Forms;

    public class FrmCheckSelect : Form
    {
        private Button button1;
        private Button button2;
        private ComboBox cbOrgno;
        private IContainer components = null;
        private string conn;
        private Label label1;
        private Label label2;
        private TextBox tbCheckno;

        public FrmCheckSelect()
        {
            this.InitializeComponent();
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

        private void BindData()
        {
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
            string result = "";
            string sqlstr = "select orgno,orgname from pub_organ where orgtranno = dbo.bims_f_sys_ini('1001') and status = 1";
            DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
            if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
            {
                foreach (DataRow row in set.Tables[0].Rows)
                {
                    this.cbOrgno.Items.Add(row["orgno"].ToString().Trim() + "/" + row["orgname"].ToString().Trim());
                }
                if (set.Tables[0].Rows.Count == 1)
                {
                    this.cbOrgno.SelectedIndex = 0;
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(this.tbCheckno.Text.Trim()))
            {
                new FrmCheckManage().Show();
                base.Close();
            }
            else
            {
                MessageBox.Show("请先选择盘点机构！");
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            base.Close();
        }

        private void cbOrgno_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.cbOrgno.SelectedIndex > -1)
            {
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                string result = "";
                string sqlstr = "select orgno,checkno,checktype,status from bims_check_reg where status in (1,2) and orgno = '" + this.cbOrgno.SelectedItem.ToString().Substring(0, this.cbOrgno.SelectedItem.ToString().IndexOf('/')) + "' and period = convert(varchar(6),getdate(),112)";
                DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
                if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count != 1))
                {
                    MessageBox.Show("该业务机构未登记盘点，请先登记盘点！");
                }
                else
                {
                    User user = new User {
                        CheckNo = set.Tables[0].Rows[0]["checkno"].ToString().Trim()
                    };
                    this.tbCheckno.Text = set.Tables[0].Rows[0]["checkno"].ToString().Trim();
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

        private void InitializeComponent()
        {
            this.label1 = new Label();
            this.cbOrgno = new ComboBox();
            this.label2 = new Label();
            this.tbCheckno = new TextBox();
            this.button1 = new Button();
            this.button2 = new Button();
            base.SuspendLayout();
            this.label1.Location = new Point(0x13, 15);
            this.label1.Name = "label1";
            this.label1.Size = new Size(100, 20);
            this.label1.Text = "选择盘点机构";
            this.cbOrgno.Location = new Point(0x13, 0x27);
            this.cbOrgno.Name = "cbOrgno";
            this.cbOrgno.Size = new Size(0xca, 0x17);
            this.cbOrgno.TabIndex = 1;
            this.cbOrgno.SelectedIndexChanged += new EventHandler(this.cbOrgno_SelectedIndexChanged);
            this.label2.Location = new Point(0x13, 0x4f);
            this.label2.Name = "label2";
            this.label2.Size = new Size(100, 20);
            this.label2.Text = "盘点单号";
            this.tbCheckno.Location = new Point(0x13, 0x66);
            this.tbCheckno.Name = "tbCheckno";
            this.tbCheckno.Size = new Size(0xca, 0x17);
            this.tbCheckno.TabIndex = 4;
            this.button1.Location = new Point(0x23, 0x90);
            this.button1.Name = "button1";
            this.button1.Size = new Size(0x48, 0x34);
            this.button1.TabIndex = 5;
            this.button1.Text = "确  定";
            this.button1.Click += new EventHandler(this.button1_Click);
            this.button2.Location = new Point(0x85, 0x90);
            this.button2.Name = "button2";
            this.button2.Size = new Size(0x48, 0x34);
            this.button2.TabIndex = 6;
            this.button2.Text = "取  消";
            this.button2.Click += new EventHandler(this.button2_Click);
            base.AutoScaleDimensions = new SizeF(96f, 96f);
            base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            base.ClientSize = new Size(0xee, 270);
            base.Controls.Add(this.button2);
            base.Controls.Add(this.button1);
            base.Controls.Add(this.tbCheckno);
            base.Controls.Add(this.label2);
            base.Controls.Add(this.cbOrgno);
            base.Controls.Add(this.label1);
            base.Name = "FrmCheckSelect";
            this.Text = "选择盘点机构";
            base.ResumeLayout(false);
        }
    }
}

