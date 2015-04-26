namespace WindowsMobile
{
    using DataFactory;
    using System;
    using System.ComponentModel;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Windows.Forms;

    public class ForPositionAdjustment : Form
    {
        private string batchno = "";
        private Button button1;
        private Button button2;
        private IContainer components = null;
        private string conn;
        private System.Windows.Forms.DataGrid dataGrid1;
        private string distractno = "";
        public string[] goods = new string[6];
        private string goodsid = "";
        private string goodsname = "";
        private string goodsqty = "";
        private string idno = "";
        private Label label1;
        private Label label2;
        private Label label3;
        private Label label4;
        private Label label5;
        private string lotno = "";
        private string objshelfno = "";
        private string shelfno = "";
        private TextBox txtbarcode;
        private TextBox txtgoodsname;
        private TextBox txtgoodspece;
        private TextBox txtshelf;
        private TextBox txtshelfno;
        private string valid_date = "";

        public ForPositionAdjustment()
        {
            this.InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.DateBind();
            if (this.txtshelfno.Text != "")
            {
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                string text = this.txtshelfno.Text;
                string sqlstr = "if exists (select * from bims_shelf_used where shelfno='" + text + "') begin select '1' end";
                string result = "";
                if (DbFactory.ExecuteScalar(con, sqlstr, null, null, CommandType.Text, out result) == "1")
                {
                    MessageBox.Show(text + "货位被暂用");
                }
                else
                {
                    MessageBox.Show(text + "货位空闲");
                }
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            new ForAdjustQuantity(new string[] { this.dataGrid1[this.dataGrid1.CurrentRowIndex, 1].ToString(), this.dataGrid1[this.dataGrid1.CurrentRowIndex, 3].ToString(), this.dataGrid1[this.dataGrid1.CurrentRowIndex, 9].ToString(), this.dataGrid1[this.dataGrid1.CurrentRowIndex, 10].ToString(), this.dataGrid1[this.dataGrid1.CurrentRowIndex, 6].ToString(), this.dataGrid1[this.dataGrid1.CurrentRowIndex, 12].ToString(), this.dataGrid1[this.dataGrid1.CurrentRowIndex, 2].ToString(), this.dataGrid1[this.dataGrid1.CurrentRowIndex, 7].ToString(), this.dataGrid1[this.dataGrid1.CurrentRowIndex, 13].ToString(), this.dataGrid1[this.dataGrid1.CurrentRowIndex, 14].ToString(), this.dataGrid1[this.dataGrid1.CurrentRowIndex, 15].ToString(), this.dataGrid1[this.dataGrid1.CurrentRowIndex, 15].ToString(), this.dataGrid1[this.dataGrid1.CurrentRowIndex, 0].ToString() }).ShowDialog();
            base.Close();
        }

        private void dataGrid1_Click(object sender, EventArgs e)
        {
        }

        private void dataGrid1_CurrentCellChanged(object sender, EventArgs e)
        {
            if (this.dataGrid1.CurrentRowIndex >= 0)
            {
                this.button2.Enabled = true;
                this.txtgoodsname.Text = this.dataGrid1[this.dataGrid1.CurrentRowIndex, 3].ToString();
                this.txtshelf.Text = this.dataGrid1[this.dataGrid1.CurrentRowIndex, 2].ToString() + "/" + this.dataGrid1[this.dataGrid1.CurrentRowIndex, 7].ToString();
                this.txtgoodspece.Text = this.dataGrid1[this.dataGrid1.CurrentRowIndex, 1].ToString() + "/" + this.dataGrid1[this.dataGrid1.CurrentRowIndex, 4].ToString();
            }
        }

        public void DateBind()
        {
            string result = "";
            string text = this.txtshelfno.Text;
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
            string sqlstr = "  SELECT bims_stock_dtl.orgno as '机构编码',   \r\n                             bims_stock_dtl.goodsid as '商品编码', \r\n                             bims_stock_dtl.shelfno as '货位号',    \r\n                             bims_goods_list.goodsname  as '商品名称',   \r\n                             bims_goods_list.goodsspec as '商品规格',   \r\n                             bims_goods_list.producer as '生产企业',  \r\n                             bims_stock_list.lotno as  '批号',  \r\n                             bims_stock_dtl.goodsqty as '库存数量',         \r\n\t                         bims_company.companyname as '供应商名称',\r\n\t                         bims_stock_dtl.batchno as '批次号',\r\n\t                         bims_stock_dtl.idno as '识别号'\t,\r\n\t                         bims_goods_list.barcode as '商品条形码',\r\n                             CONVERT(varchar(100) ,bims_stock_list.valid_date,120) as  '有效期至',\r\n                             bims_goods_list.retailprice as '零售价',\r\n                             bims_stock_list.distractprice as '配送价',\r\n                             bims_stock_list.costprice as '成本价',\r\n                             bims_stock_list.suptax as '进项税率'\t\r\n                             FROM bims_stock_dtl (nolock)  left join \r\n\t                         pub_shelf  (nolock) on bims_stock_dtl.shelfno = pub_shelf.shelfno , \r\n                             bims_goods_list (nolock) ,bims_stock_list (nolock) ,bims_company(nolock)\r\n                             where bims_stock_dtl.goodsid=bims_goods_list.goodsid \r\n                             and bims_stock_dtl.goodsid=bims_stock_list.goodsid \r\n                             and bims_stock_dtl.batchno=bims_stock_list.batchno \r\n                             and bims_stock_dtl.idno=bims_stock_list.idno\r\n                             and bims_stock_list.companyno=bims_company.companyno \r\n                             and bims_stock_dtl.goodsqty<>0\r\n                             and  bims_stock_dtl.orgno =dbo.bims_f_sys_ini('1001')\r\n\r\n                             and bims_stock_dtl.shelfno ='" + text + "'";
            DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
            this.dataGrid1.DataSource = set.Tables[0];
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && (this.components != null))
            {
                this.components.Dispose();
            }
            base.Dispose(disposing);
        }

        private void ForPositionAdjustment_Load(object sender, EventArgs e)
        {
            this.button2.Enabled = false;
            string result = "";
            this.conn = GetConn.Conn(out result);
            this.txtgoodsname.Enabled = false;
            this.txtshelf.Enabled = false;
            this.txtgoodspece.Enabled = false;
        }

        private void InitializeComponent()
        {
            this.button1 = new Button();
            this.label2 = new Label();
            this.txtbarcode = new TextBox();
            this.dataGrid1 = new System.Windows.Forms.DataGrid();
            this.button2 = new Button();
            this.label3 = new Label();
            this.txtshelfno = new TextBox();
            this.label4 = new Label();
            this.txtgoodsname = new TextBox();
            this.label5 = new Label();
            this.txtshelf = new TextBox();
            this.label1 = new Label();
            this.txtgoodspece = new TextBox();
            base.SuspendLayout();
            this.button1.BackColor = Color.LightGray;
            this.button1.Location = new Point(0x9d, 0x19);
            this.button1.Name = "button1";
            this.button1.Size = new Size(0x4d, 0x17);
            this.button1.TabIndex = 2;
            this.button1.Text = "查询货位";
            this.button1.Click += new EventHandler(this.button1_Click);
            this.label2.ForeColor = Color.Blue;
            this.label2.Location = new Point(5, 4);
            this.label2.Name = "label2";
            this.label2.Size = new Size(0x36, 20);
            this.label2.Text = "扫描：";
            this.txtbarcode.Location = new Point(0x3f, 1);
            this.txtbarcode.Name = "txtbarcode";
            this.txtbarcode.Size = new Size(0xac, 0x17);
            this.txtbarcode.TabIndex = 4;
            this.txtbarcode.KeyPress += new KeyPressEventHandler(this.txtbarcode_KeyPress);
            this.dataGrid1.BackgroundColor=(Color.FromArgb(0x40, 0x40, 0x40));
            this.dataGrid1.ForeColor = Color.Blue;
            this.dataGrid1.Location = new Point(3, 50);
            this.dataGrid1.Name = "dataGrid1";
            this.dataGrid1.SelectionBackColor = Color.Red;
            this.dataGrid1.SelectionForeColor = Color.FromArgb(0, 0x80, 0xff);
            this.dataGrid1.Size = new Size(0xe8, 0x91);
            this.dataGrid1.TabIndex = 5;
            this.dataGrid1.CurrentCellChanged += new EventHandler(this.dataGrid1_CurrentCellChanged);
            this.dataGrid1.Click += new EventHandler(this.dataGrid1_Click);
            this.button2.BackColor = Color.LightGray;
            this.button2.Location = new Point(0xa1, 0xf3);
            this.button2.Name = "button2";
            this.button2.Size = new Size(0x48, 0x19);
            this.button2.TabIndex = 6;
            this.button2.Text = "货位调整";
            this.button2.Click += new EventHandler(this.button2_Click);
            this.label3.ForeColor = Color.Blue;
            this.label3.Location = new Point(4, 0x1d);
            this.label3.Name = "label3";
            this.label3.Size = new Size(100, 20);
            this.label3.Text = "货位号：";
            this.txtshelfno.Location = new Point(0x3f, 0x19);
            this.txtshelfno.Name = "txtshelfno";
            this.txtshelfno.Size = new Size(0x58, 0x17);
            this.txtshelfno.TabIndex = 10;
            this.label4.ForeColor = Color.Blue;
            this.label4.Location = new Point(3, 200);
            this.label4.Name = "label4";
            this.label4.Size = new Size(0x54, 20);
            this.label4.Text = "商品名称：";
            this.txtgoodsname.Location = new Point(0x56, 0xc5);
            this.txtgoodsname.Name = "txtgoodsname";
            this.txtgoodsname.Size = new Size(0x94, 0x17);
            this.txtgoodsname.TabIndex = 12;
            this.label5.ForeColor = Color.Blue;
            this.label5.Location = new Point(3, 0xf6);
            this.label5.Name = "label5";
            this.label5.Size = new Size(0x60, 20);
            this.label5.Text = "货号/数量：";
            this.txtshelf.Location = new Point(0x56, 0xf4);
            this.txtshelf.Name = "txtshelf";
            this.txtshelf.Size = new Size(70, 0x17);
            this.txtshelf.TabIndex = 14;
            this.label1.ForeColor = Color.Blue;
            this.label1.Location = new Point(3, 0xdf);
            this.label1.Name = "label1";
            this.label1.Size = new Size(0x63, 20);
            this.label1.Text = "编码/规格：";
            this.txtgoodspece.Location = new Point(0x56, 220);
            this.txtgoodspece.Name = "txtgoodspece";
            this.txtgoodspece.Size = new Size(0x94, 0x17);
            this.txtgoodspece.TabIndex = 20;
            base.AutoScaleDimensions = new SizeF(96f, 96f);
            base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            this.BackColor = SystemColors.ControlDark;
            base.ClientSize = new Size(0xee, 270);
            base.Controls.Add(this.txtgoodspece);
            base.Controls.Add(this.label1);
            base.Controls.Add(this.txtshelf);
            base.Controls.Add(this.label5);
            base.Controls.Add(this.txtgoodsname);
            base.Controls.Add(this.label4);
            base.Controls.Add(this.txtshelfno);
            base.Controls.Add(this.label3);
            base.Controls.Add(this.button2);
            base.Controls.Add(this.dataGrid1);
            base.Controls.Add(this.txtbarcode);
            base.Controls.Add(this.label2);
            base.Controls.Add(this.button1);
            base.Name = "ForPositionAdjustment";
            this.Text = "商品货位";
            base.Load += new EventHandler(this.ForPositionAdjustment_Load);
            base.ResumeLayout(false);
        }

        private void txtbarcode_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == '\r')
            {
                string result = "";
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                if (string.IsNullOrEmpty(this.txtbarcode.Text.Trim()))
                {
                    MessageBox.Show("请扫描条形码！");
                }
                else
                {
                    string str3 = this.txtbarcode.Text.Trim();
                    this.txtbarcode.Text = "";
                    string sqlstr = "declare @orgno varchar(10) set @orgno = dbo.bims_f_sys_ini('1001') execute dbo.bims_p_select_goods_zdy  @orgno,'" + str3 + "'";
                    DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
                    if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
                    {
                        if (set.Tables[0].Rows.Count == 1)
                        {
                            this.goodsid = set.Tables[0].Rows[0][0].ToString().Trim();
                            System.Data.SqlClient.SqlConnection connection2 = new System.Data.SqlClient.SqlConnection(this.conn);
                            string str4 = "  SELECT bims_stock_dtl.orgno as '机构编码',   \r\n                             bims_stock_dtl.goodsid as '商品编码', \r\n                             bims_stock_dtl.shelfno as '货位号',    \r\n                             bims_goods_list.goodsname  as '商品名称',   \r\n                             bims_goods_list.goodsspec as '商品规格',   \r\n                             bims_goods_list.producer as '生产企业',  \r\n                             bims_stock_list.lotno as  '批号',  \r\n                             bims_stock_dtl.goodsqty as '库存数量',         \r\n\t                         bims_company.companyname as '供应商名称',\r\n\t                         bims_stock_dtl.batchno as '批次号',\r\n\t                         bims_stock_dtl.idno as '识别号'\t,\r\n\t                         bims_goods_list.barcode as '商品条形码',\r\n                             CONVERT(varchar(100) ,bims_stock_list.valid_date,120) as  '有效期至',\r\n                             bims_goods_list.retailprice as '零售价',\r\n                             bims_stock_list.distractprice as '配送价',\r\n                             bims_stock_list.costprice as '成本价',\r\n                              bims_stock_list.suptax as '进项税率'\t\r\n                             FROM bims_stock_dtl (nolock)  left join \r\n\t                         pub_shelf  (nolock) on bims_stock_dtl.shelfno = pub_shelf.shelfno , \r\n                             bims_goods_list (nolock) ,bims_stock_list (nolock) ,bims_company(nolock)\r\n                             where bims_stock_dtl.goodsid=bims_goods_list.goodsid \r\n                             and bims_stock_dtl.goodsid=bims_stock_list.goodsid \r\n                             and bims_stock_dtl.batchno=bims_stock_list.batchno \r\n                             and bims_stock_dtl.idno=bims_stock_list.idno\r\n                             and bims_stock_list.companyno=bims_company.companyno \r\n                             and bims_stock_dtl.goodsqty<>0\r\n                             and  bims_stock_dtl.orgno =dbo.bims_f_sys_ini('1001')\r\n                             and  bims_stock_dtl.goodsid='" + this.goodsid + "'";
                            DataSet set2 = DbFactory.ExecuteSet(connection2, str4, null, null, CommandType.Text, out result);
                            if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
                            {
                                this.dataGrid1.DataSource = set2.Tables[0];
                            }
                            else
                            {
                                MessageBox.Show("亲,此商品没有库存");
                                this.dataGrid1.DataSource = null;
                            }
                        }
                        else
                        {
                            FrmGoodsSelect select = new FrmGoodsSelect(set.Tables[0], this.goods);
                            if ((select.ShowDialog() == DialogResult.OK) && !string.IsNullOrEmpty(this.goods[0]))
                            {
                                this.goodsid = this.goods[0];
                                System.Data.SqlClient.SqlConnection connection3 = new System.Data.SqlClient.SqlConnection(this.conn);
                                string str5 = "  SELECT bims_stock_dtl.orgno as '机构编码',   \r\n                             bims_stock_dtl.goodsid as '商品编码', \r\n                             bims_stock_dtl.shelfno as '货位号',    \r\n                             bims_goods_list.goodsname  as '商品名称',   \r\n                             bims_goods_list.goodsspec as '商品规格',   \r\n                             bims_goods_list.producer as '生产企业',  \r\n                             bims_stock_list.lotno as  '批号',  \r\n                             bims_stock_dtl.goodsqty as '库存数量',         \r\n\t                         bims_company.companyname as '供应商名称',\r\n\t                         bims_stock_dtl.batchno as '批次号',\r\n\t                         bims_stock_dtl.idno as '识别号'\t,\r\n\t                         bims_goods_list.barcode as '商品条形码',\r\n                             CONVERT(varchar(100) ,bims_stock_list.valid_date,120) as  '有效期至',\r\n                             bims_goods_list.retailprice as '零售价',\r\n                             bims_stock_list.distractprice as '配送价',\r\n                             bims_stock_list.costprice as '成本价',\r\n                              bims_stock_list.suptax as '进项税率'\t\r\n                             FROM bims_stock_dtl (nolock)  left join \r\n\t                         pub_shelf  (nolock) on bims_stock_dtl.shelfno = pub_shelf.shelfno , \r\n                             bims_goods_list (nolock) ,bims_stock_list (nolock) ,bims_company(nolock)\r\n                             where bims_stock_dtl.goodsid=bims_goods_list.goodsid \r\n                             and bims_stock_dtl.goodsid=bims_stock_list.goodsid \r\n                             and bims_stock_dtl.batchno=bims_stock_list.batchno \r\n                             and bims_stock_dtl.idno=bims_stock_list.idno\r\n                             and bims_stock_list.companyno=bims_company.companyno \r\n                             and bims_stock_dtl.goodsqty<>0\r\n                             and  bims_stock_dtl.orgno =dbo.bims_f_sys_ini('1001')\r\n                             and  bims_stock_dtl.goodsid='" + this.goodsid + "'";
                                DataSet set3 = DbFactory.ExecuteSet(connection3, str5, null, null, CommandType.Text, out result);
                                if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
                                {
                                    this.dataGrid1.DataSource = set3.Tables[0];
                                }
                                else
                                {
                                    MessageBox.Show("亲,此商品没有库存");
                                    this.dataGrid1.DataSource = null;
                                }
                            }
                        }
                    }
                    else
                    {
                        MessageBox.Show("无此商品！");
                        this.txtbarcode.Text = "";
                        this.txtbarcode.Focus();
                    }
                }
            }
        }
    }
}

