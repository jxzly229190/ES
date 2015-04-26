namespace WindowsMobile
{
    using DataFactory;
    using System;
    using System.ComponentModel;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Windows.Forms;

    public class FrmCheck : Form
    {
        private Button btClean;
        private Button btSave;
        private IContainer components = null;
        private string conn;
        private System.Windows.Forms.DataGrid dgGoods;
        public string[] goods = new string[7];
        private string goodsid;
        private Label label1;
        private Label label2;
        private Label label3;
        private Label label4;
        private Label label5;
        private Label label6;
        private Label label7;
        private string memo = "";
        private TextBox tbGoodsid;
        private TextBox tbGoodsName;
        private TextBox tbLotno;
        private TextBox tbQty;
        private TextBox tbSpec;
        private TextBox tbSunQty;
        private TextBox tbWarrantno;

        public FrmCheck(string goods, string test)
        {
            this.InitializeComponent();
            string result = "";
            this.memo = test;
            this.goodsid = goods;
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
            string sqlstr = "insert into bims_check_mac(orgno,checkno,createuser,goodsid,lotno,goodsqty,checkqty,memo) ";
            DataTable dataSource = (DataTable) this.dgGoods.DataSource;
            User user = new User();
            for (int i = 0; i < dataSource.Rows.Count; i++)
            {
                string str3 = sqlstr;
                sqlstr = str3 + "select dbo.bims_f_sys_ini('1001'),'" + user.CheckNo.ToString().Trim() + "','" + user.SysUser.ToString().Trim() + "','" + this.dgGoods[i, 0].ToString() + "','" + this.dgGoods[i, 2].ToString() + "','" + this.dgGoods[i, 3].ToString() + "','" + this.dgGoods[i, 5].ToString() + "','" + this.memo + "' \r\nunion all ";
            }
            sqlstr = sqlstr.Substring(0, sqlstr.Length - 10);
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

        private void ClearText()
        {
            this.tbGoodsid.Text = "";
            this.tbGoodsName.Text = "";
            this.tbLotno.Text = "";
            this.tbWarrantno.Text = "";
            this.tbSunQty.Text = "";
            this.tbSpec.Text = "";
        }

        private void dgGoods_Click(object sender, EventArgs e)
        {
            if (this.dgGoods.CurrentRowIndex >= 0)
            {
                this.tbGoodsid.Text = this.dgGoods[this.dgGoods.CurrentRowIndex, 0].ToString();
                this.tbGoodsName.Text = this.dgGoods[this.dgGoods.CurrentRowIndex, 1].ToString();
                this.tbSpec.Text = this.dgGoods[this.dgGoods.CurrentRowIndex, 6].ToString() + " / " + this.dgGoods[this.dgGoods.CurrentRowIndex, 7].ToString() + " / " + this.dgGoods[this.dgGoods.CurrentRowIndex, 8].ToString();
                this.tbWarrantno.Text = this.dgGoods[this.dgGoods.CurrentRowIndex, 9].ToString();
                this.tbLotno.Text = this.dgGoods[this.dgGoods.CurrentRowIndex, 2].ToString();
                this.tbSunQty.Text = this.dgGoods[this.dgGoods.CurrentRowIndex, 3].ToString();
                this.tbQty.Text = this.dgGoods[this.dgGoods.CurrentRowIndex, 5].ToString();
            }
        }

        private void dgGoods_CurrentCellChanged(object sender, EventArgs e)
        {
            if ((this.dgGoods.CurrentRowIndex >= 0) && (this.dgGoods.CurrentRowIndex < this.dgGoods.VisibleRowCount))
            {
                this.tbGoodsid.Text = this.dgGoods[this.dgGoods.CurrentRowIndex, 0].ToString();
                this.tbGoodsName.Text = this.dgGoods[this.dgGoods.CurrentRowIndex, 1].ToString();
                this.tbSpec.Text = this.dgGoods[this.dgGoods.CurrentRowIndex, 6].ToString() + " / " + this.dgGoods[this.dgGoods.CurrentRowIndex, 7].ToString() + " / " + this.dgGoods[this.dgGoods.CurrentRowIndex, 8].ToString();
                this.tbWarrantno.Text = this.dgGoods[this.dgGoods.CurrentRowIndex, 9].ToString();
                this.tbLotno.Text = this.dgGoods[this.dgGoods.CurrentRowIndex, 2].ToString();
                this.tbSunQty.Text = this.dgGoods[this.dgGoods.CurrentRowIndex, 3].ToString();
                this.tbQty.Text = this.dgGoods[this.dgGoods.CurrentRowIndex, 5].ToString();
            }
        }

        private void dgGoods_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.F8)
            {
                e.Handled = true;
                this.tbQty.Focus();
            }
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

        private void FrmCheckManage_Load(object sender, EventArgs e)
        {
            string sqlstr = "select a.goodsid as 商品编码,max(goodsname) as 商品名称,case when dbo.bims_f_sys_ini('7777') = '1' then 'ALL' else c.lotno end as 批号,\r\n         SUM(b.goodsqty) as 库存数量,SUM(awaitqty) as 待出库数量,0.0 as 实盘数量,\r\n         max(goodsspec) as 规格,max(goodsunit) as 单位,\r\n\t     max(producer) as 生产厂家,max(warrantno) as 批准文号,max(retailprice) as 零售价\r\nfrom bims_goods_list a,bims_stock_dtl b,bims_stock_list c \r\nwhere a.goodsid = b.goodsid and b.goodsid = c.goodsid and b.batchno = c.batchno and b.idno = c.idno \r\n\t  and orgno = dbo.bims_f_sys_ini('1001') and a.goodsid = '" + this.goodsid + "'group by a.goodsid,case when dbo.bims_f_sys_ini('7777') = '1' then 'ALL' else c.lotno end order by 库存数量 desc,批号";
            string result = "";
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
            DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
            if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
            {
                this.dgGoods.DataSource = set.Tables[0];
                this.dgGoods.CurrentRowIndex = 0;
                this.tbGoodsid.Text = this.dgGoods[0, 0].ToString();
                this.tbGoodsName.Text = this.dgGoods[0, 1].ToString();
                this.tbSpec.Text = this.dgGoods[0, 6].ToString() + " / " + this.dgGoods[0, 7].ToString() + " / " + this.dgGoods[0, 8].ToString();
                this.tbWarrantno.Text = this.dgGoods[0, 9].ToString();
                this.tbLotno.Text = this.dgGoods[0, 2].ToString();
                this.tbSunQty.Text = this.dgGoods[0, 3].ToString();
                this.tbQty.Text = this.dgGoods[0, 5].ToString();
            }
            else
            {
                MessageBox.Show("未找到该商品库存记录！");
                base.Close();
            }
        }

        private void InitializeComponent()
        {
            this.tbSunQty = new TextBox();
            this.label1 = new Label();
            this.tbWarrantno = new TextBox();
            this.label7 = new Label();
            this.tbQty = new TextBox();
            this.label6 = new Label();
            this.btClean = new Button();
            this.tbLotno = new TextBox();
            this.tbSpec = new TextBox();
            this.tbGoodsName = new TextBox();
            this.tbGoodsid = new TextBox();
            this.label5 = new Label();
            this.label4 = new Label();
            this.label3 = new Label();
            this.label2 = new Label();
            this.btSave = new Button();
            this.dgGoods = new System.Windows.Forms.DataGrid();
            base.SuspendLayout();
            this.tbSunQty.Enabled = false;
            this.tbSunQty.Location = new Point(50, 0x79);
            this.tbSunQty.Name = "tbSunQty";
            this.tbSunQty.Size = new Size(0x41, 0x17);
            this.tbSunQty.TabIndex = 0x7c;
            this.label1.Location = new Point(5, 0x7b);
            this.label1.Name = "label1";
            this.label1.Size = new Size(50, 20);
            this.label1.Text = "帐存：";
            this.label1.TextAlign = ContentAlignment.TopRight;
            this.tbWarrantno.Enabled = false;
            this.tbWarrantno.Location = new Point(0x63, 0x49);
            this.tbWarrantno.Name = "tbWarrantno";
            this.tbWarrantno.Size = new Size(0x88, 0x17);
            this.tbWarrantno.TabIndex = 0x7b;
            this.label7.Location = new Point(5, 0x4c);
            this.label7.Name = "label7";
            this.label7.Size = new Size(0x59, 20);
            this.label7.Text = "批准文号：";
            this.label7.TextAlign = ContentAlignment.TopRight;
            this.tbQty.Location = new Point(170, 0x79);
            this.tbQty.Name = "tbQty";
            this.tbQty.Size = new Size(0x41, 0x17);
            this.tbQty.TabIndex = 0x74;
            this.tbQty.TextChanged += new EventHandler(this.tbQty_TextChanged);
            this.tbQty.KeyDown += new KeyEventHandler(this.tbQty_KeyDown);
            this.label6.Location = new Point(0x7e, 0x7b);
            this.label6.Name = "label6";
            this.label6.Size = new Size(50, 20);
            this.label6.Text = "实盘：";
            this.label6.TextAlign = ContentAlignment.TopRight;
            this.btClean.DialogResult = DialogResult.Cancel;
            this.btClean.Location = new Point(0x8b, 0xee);
            this.btClean.Name = "btClean";
            this.btClean.Size = new Size(0x48, 30);
            this.btClean.TabIndex = 0x76;
            this.btClean.Text = "返  回";
            this.btClean.Click += new EventHandler(this.btClean_Click);
            this.tbLotno.Enabled = false;
            this.tbLotno.Location = new Point(0x63, 0x61);
            this.tbLotno.Name = "tbLotno";
            this.tbLotno.Size = new Size(0x88, 0x17);
            this.tbLotno.TabIndex = 0x77;
            this.tbSpec.Enabled = false;
            this.tbSpec.Location = new Point(0x63, 0x31);
            this.tbSpec.Name = "tbSpec";
            this.tbSpec.Size = new Size(0x88, 0x17);
            this.tbSpec.TabIndex = 120;
            this.tbGoodsName.Enabled = false;
            this.tbGoodsName.Location = new Point(0x63, 0x19);
            this.tbGoodsName.Name = "tbGoodsName";
            this.tbGoodsName.Size = new Size(0x88, 0x17);
            this.tbGoodsName.TabIndex = 0x79;
            this.tbGoodsid.Enabled = false;
            this.tbGoodsid.Location = new Point(0x63, 1);
            this.tbGoodsid.Name = "tbGoodsid";
            this.tbGoodsid.Size = new Size(0x88, 0x17);
            this.tbGoodsid.TabIndex = 0x7a;
            this.label5.Location = new Point(4, 100);
            this.label5.Name = "label5";
            this.label5.Size = new Size(0x59, 20);
            this.label5.Text = "批号：";
            this.label5.TextAlign = ContentAlignment.TopRight;
            this.label4.Location = new Point(5, 0x34);
            this.label4.Name = "label4";
            this.label4.Size = new Size(0x59, 20);
            this.label4.Text = "规格/单位：";
            this.label4.TextAlign = ContentAlignment.TopRight;
            this.label3.Location = new Point(4, 0x1b);
            this.label3.Name = "label3";
            this.label3.Size = new Size(0x59, 20);
            this.label3.Text = "商品名称：";
            this.label3.TextAlign = ContentAlignment.TopRight;
            this.label2.Location = new Point(4, 4);
            this.label2.Name = "label2";
            this.label2.Size = new Size(0x59, 20);
            this.label2.Text = "商品编码：";
            this.label2.TextAlign = ContentAlignment.TopRight;
            this.btSave.DialogResult = DialogResult.OK;
            this.btSave.Location = new Point(0x16, 0xee);
            this.btSave.Name = "btSave";
            this.btSave.Size = new Size(0x48, 30);
            this.btSave.TabIndex = 0x75;
            this.btSave.Text = "保  存";
            this.btSave.Click += new EventHandler(this.btSave_Click);
            this.dgGoods.BackgroundColor=Color.FromArgb(0x80, 0x80, 0x80);
            this.dgGoods.Location = new Point(4, 0x91);
            this.dgGoods.Name = "dgGoods";
            this.dgGoods.Size = new Size(230, 0x5c);
            this.dgGoods.TabIndex = 0x84;
            this.dgGoods.CurrentCellChanged += new EventHandler(this.dgGoods_CurrentCellChanged);
            this.dgGoods.KeyDown += new KeyEventHandler(this.dgGoods_KeyDown);
            this.dgGoods.Click += new EventHandler(this.dgGoods_Click);
            base.AutoScaleDimensions = new SizeF(96f, 96f);
            base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            base.ClientSize = new Size(0xee, 270);
            base.Controls.Add(this.dgGoods);
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
            base.Name = "FrmCheck";
            this.Text = "盘点录入";
            base.Load += new EventHandler(this.FrmCheckManage_Load);
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
            if ((e.KeyCode == Keys.Up) || (e.KeyCode == Keys.Down))
            {
                e.Handled = true;
                this.dgGoods.Focus();
            }
        }

        private void tbQty_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.tbQty.Text.Trim()))
            {
                this.dgGoods[this.dgGoods.CurrentRowIndex, 5] = "0";
            }
            else
            {
                try
                {
                    if ((this.tbQty.Text.Trim() != "-") && (this.tbQty.Text.Trim() != "."))
                    {
                        this.dgGoods[this.dgGoods.CurrentRowIndex, 5] = this.tbQty.Text;
                    }
                }
                catch (Exception)
                {
                    this.tbQty.Text = "";
                    MessageBox.Show("只允许输入数值！");
                }
            }
        }
    }
}

