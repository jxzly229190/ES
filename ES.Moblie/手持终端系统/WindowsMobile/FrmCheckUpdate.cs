namespace WindowsMobile
{
    using DataFactory;
    using System;
    using System.ComponentModel;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Windows.Forms;

    public class FrmCheckUpdate : Form
    {
        private Button btClean;
        private Button btSave;
        private IContainer components = null;
        private string conn;
        private Label label1;
        private Label label2;
        private Label label3;
        private Label label4;
        private Label label5;
        private Label label6;
        private Label label7;
        private Label label8;
        private Label label9;
        private TextBox tbGoodsid;
        private TextBox tbGoodsName;
        private TextBox tbId;
        private TextBox tbLotno;
        private TextBox tbMemo;
        private TextBox tbQty;
        private TextBox tbSpec;
        private TextBox tbSunQty;
        private TextBox tbWarrantno;

        public FrmCheckUpdate(string[] check)
        {
            this.InitializeComponent();
            string result = "";
            this.tbId.Text = check[0];
            this.tbGoodsid.Text = check[1];
            this.tbGoodsName.Text = check[2];
            this.tbSpec.Text = check[3] + " / " + check[4] + " / " + check[5];
            this.tbWarrantno.Text = check[6];
            this.tbLotno.Text = check[7];
            this.tbSunQty.Text = check[8];
            this.tbQty.Text = check[9];
            this.conn = GetConn.Conn(out result);
            if (string.IsNullOrEmpty(this.conn))
            {
                this.tbGoodsid.Enabled = false;
                this.tbQty.Enabled = false;
                this.btClean.Enabled = false;
                this.btSave.Enabled = false;
                MessageBox.Show("读取配置文件失败，请重新尝试！错误：" + result);
            }
        }

        private void btClean_Click(object sender, EventArgs e)
        {
            base.DialogResult = DialogResult.Cancel;
            base.Close();
        }

        private void btSave_Click(object sender, EventArgs e)
        {
            User user = new User();
            string sqlstr = "update bims_check_mac set orgno = dbo.bims_f_sys_ini('1001'),checkno = '" + user.CheckNo.ToString().Trim() + "',createuser = '" + User.sysUser.ToString().Trim() + "',goodsid = '" + this.tbGoodsid.Text.Trim() + "',lotno = '" + this.tbLotno.Text.Trim() + "',goodsqty = '" + this.tbSunQty.Text.Trim() + "',checkqty = '" + this.tbQty.Text.Trim() + "',memo = '" + this.tbMemo.Text.Trim() + "' where id = '" + this.tbId.Text.Trim() + "'";
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
            string result = "";
            if (DbFactory.ExecuteNonQuery(con, sqlstr, null, null, CommandType.Text, out result) > 0)
            {
                base.DialogResult = DialogResult.OK;
                base.Close();
            }
            else
            {
                MessageBox.Show("保存失败！消息：" + result);
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

        private void FrmCheck_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.F6)
            {
                e.Handled = true;
                this.btSave_Click(null, EventArgs.Empty);
            }
            if (e.KeyCode == Keys.F7)
            {
                e.Handled = true;
                this.btClean_Click(null, EventArgs.Empty);
            }
        }

        private void InitializeComponent()
        {
            ComponentResourceManager manager = new ComponentResourceManager(typeof(FrmCheckUpdate));
            this.btSave = new Button();
            this.label2 = new Label();
            this.label3 = new Label();
            this.label4 = new Label();
            this.label5 = new Label();
            this.tbGoodsid = new TextBox();
            this.tbGoodsName = new TextBox();
            this.tbSpec = new TextBox();
            this.tbLotno = new TextBox();
            this.btClean = new Button();
            this.label7 = new Label();
            this.tbWarrantno = new TextBox();
            this.tbQty = new TextBox();
            this.label6 = new Label();
            this.label1 = new Label();
            this.tbSunQty = new TextBox();
            this.label8 = new Label();
            this.tbId = new TextBox();
            this.tbMemo = new TextBox();
            this.label9 = new Label();
            base.SuspendLayout();
            this.btSave.DialogResult = DialogResult.OK;
            this.btSave.Location = new Point(0x1f, 0xdb);
            this.btSave.Name = "btSave";
            this.btSave.Size = new Size(0x48, 0x2d);
            this.btSave.TabIndex = 4;
            this.btSave.Text = "保  存";
            this.btSave.Click += new EventHandler(this.btSave_Click);
            this.label2.Location = new Point(3, 0x1d);
            this.label2.Name = "label2";
            this.label2.Size = new Size(0x59, 20);
            this.label2.Text = "商品编码：";
            this.label2.TextAlign = ContentAlignment.TopRight;
            this.label3.Location = new Point(3, 0x34);
            this.label3.Name = "label3";
            this.label3.Size = new Size(0x59, 20);
            this.label3.Text = "商品名称：";
            this.label3.TextAlign = ContentAlignment.TopRight;
            this.label4.Location = new Point(4, 0x4d);
            this.label4.Name = "label4";
            this.label4.Size = new Size(0x59, 20);
            this.label4.Text = "规格/单位：";
            this.label4.TextAlign = ContentAlignment.TopRight;
            this.label5.Location = new Point(3, 0x7d);
            this.label5.Name = "label5";
            this.label5.Size = new Size(0x59, 20);
            this.label5.Text = "批号：";
            this.label5.TextAlign = ContentAlignment.TopRight;
            this.tbGoodsid.Enabled = false;
            this.tbGoodsid.Location = new Point(0x62, 0x1a);
            this.tbGoodsid.Name = "tbGoodsid";
            this.tbGoodsid.Size = new Size(0x88, 0x17);
            this.tbGoodsid.TabIndex = 0x63;
            this.tbGoodsName.Enabled = false;
            this.tbGoodsName.Location = new Point(0x62, 50);
            this.tbGoodsName.Name = "tbGoodsName";
            this.tbGoodsName.Size = new Size(0x88, 0x17);
            this.tbGoodsName.TabIndex = 0x63;
            this.tbSpec.Enabled = false;
            this.tbSpec.Location = new Point(0x62, 0x4a);
            this.tbSpec.Name = "tbSpec";
            this.tbSpec.Size = new Size(0x88, 0x17);
            this.tbSpec.TabIndex = 0x63;
            this.tbLotno.Enabled = false;
            this.tbLotno.Location = new Point(0x62, 0x7a);
            this.tbLotno.Name = "tbLotno";
            this.tbLotno.Size = new Size(0x88, 0x17);
            this.tbLotno.TabIndex = 0x63;
            this.btClean.DialogResult = DialogResult.Cancel;
            this.btClean.Location = new Point(0x86, 0xdb);
            this.btClean.Name = "btClean";
            this.btClean.Size = new Size(0x48, 0x2d);
            this.btClean.TabIndex = 5;
            this.btClean.Text = "返  回";
            this.btClean.Click += new EventHandler(this.btClean_Click);
            this.label7.Location = new Point(4, 0x65);
            this.label7.Name = "label7";
            this.label7.Size = new Size(0x59, 20);
            this.label7.Text = "批准文号：";
            this.label7.TextAlign = ContentAlignment.TopRight;
            this.tbWarrantno.Enabled = false;
            this.tbWarrantno.Location = new Point(0x62, 0x62);
            this.tbWarrantno.Name = "tbWarrantno";
            this.tbWarrantno.Size = new Size(0x88, 0x17);
            this.tbWarrantno.TabIndex = 0x63;
            this.tbQty.Location = new Point(0x62, 0xc2);
            this.tbQty.Name = "tbQty";
            this.tbQty.Size = new Size(0x88, 0x17);
            this.tbQty.TabIndex = 1;
            this.tbQty.KeyDown += new KeyEventHandler(this.tbQty_KeyDown);
            this.label6.Location = new Point(0x2b, 0xc5);
            this.label6.Name = "label6";
            this.label6.Size = new Size(50, 20);
            this.label6.Text = "实盘：";
            this.label6.TextAlign = ContentAlignment.TopRight;
            this.label1.Location = new Point(0x2b, 0xad);
            this.label1.Name = "label1";
            this.label1.Size = new Size(50, 20);
            this.label1.Text = "帐存：";
            this.label1.TextAlign = ContentAlignment.TopRight;
            this.tbSunQty.Enabled = false;
            this.tbSunQty.Location = new Point(0x62, 170);
            this.tbSunQty.Name = "tbSunQty";
            this.tbSunQty.Size = new Size(0x88, 0x17);
            this.tbSunQty.TabIndex = 0x6c;
            this.label8.Location = new Point(3, 5);
            this.label8.Name = "label8";
            this.label8.Size = new Size(0x59, 20);
            this.label8.Text = "编号：";
            this.label8.TextAlign = ContentAlignment.TopRight;
            this.tbId.Enabled = false;
            this.tbId.Location = new Point(0x62, 2);
            this.tbId.Name = "tbId";
            this.tbId.Size = new Size(0x88, 0x17);
            this.tbId.TabIndex = 0x76;
            this.tbMemo.Enabled = false;
            this.tbMemo.Location = new Point(0x62, 0x92);
            this.tbMemo.Name = "tbMemo";
            this.tbMemo.Size = new Size(0x88, 0x17);
            this.tbMemo.TabIndex = 0x77;
            this.label9.Location = new Point(0x2a, 0x95);
            this.label9.Name = "label9";
            this.label9.Size = new Size(50, 20);
            this.label9.Text = "备注：";
            this.label9.TextAlign = ContentAlignment.TopRight;
            base.AutoScaleDimensions = new SizeF(96f, 96f);
            base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            base.ClientSize = new Size(0xee, 270);
            base.Controls.Add(this.label9);
            base.Controls.Add(this.tbMemo);
            base.Controls.Add(this.tbId);
            base.Controls.Add(this.label8);
            base.Controls.Add(this.tbSunQty);
            base.Controls.Add(this.label1);
            base.Controls.Add(this.tbWarrantno);
            base.Controls.Add(this.label7);
            base.Controls.Add(this.tbQty);
            base.Controls.Add(this.label6);
            base.Controls.Add(this.btClean);
            base.Controls.Add(this.tbLotno);
            base.Controls.Add(this.tbSpec);
            base.Controls.Add(this.tbGoodsName);
            base.Controls.Add(this.tbGoodsid);
            base.Controls.Add(this.label5);
            base.Controls.Add(this.label4);
            base.Controls.Add(this.label3);
            base.Controls.Add(this.label2);
            base.Controls.Add(this.btSave);
            base.Icon = (Icon) manager.GetObject("$this.Icon");
            base.KeyPreview = true;
            base.Name = "FrmCheckUpdate";
            this.Text = "录入修改";
            base.KeyDown += new KeyEventHandler(this.FrmCheck_KeyDown);
            base.ResumeLayout(false);
        }

        private void tbQty_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.F6)
            {
                e.Handled = true;
                this.btSave_Click(null, EventArgs.Empty);
            }
            if (e.KeyCode == Keys.F7)
            {
                e.Handled = true;
                this.btClean_Click(null, EventArgs.Empty);
            }
        }
    }
}

