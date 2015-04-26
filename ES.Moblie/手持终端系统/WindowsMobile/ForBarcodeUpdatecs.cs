namespace WindowsMobile
{
    using DataFactory;
    using System;
    using System.ComponentModel;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Windows.Forms;

    public class ForBarcodeUpdatecs : Form
    {
        private Button button1;
        private Button button2;
        private Button button3;
        private IContainer components = null;
        private string conn;
        private System.Windows.Forms.DataGrid dataGrid1;
        public string[] goods = new string[6];
        private string goodsid = "";
        private string goodsid1 = "";
        private Label label1;
        private Label label4;
        private TextBox txtbarcode;
        private Label txtshelfno;
        private TextBox txtsmbarcode;
        private TextBox txtsmshelfno;

        public ForBarcodeUpdatecs()
        {
            this.InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.SelectBind();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.txtbarcode.Enabled = true;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (this.txtbarcode.Enabled)
            {
                string result = "";
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                string sqlstr = "update bims_goods set barcode='" + this.txtbarcode.Text.Trim() + "' where goodsid='" + this.goodsid + "'";
                if (MessageBox.Show("亲，确定维护条码？", "提示", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1) == DialogResult.Yes)
                {
                    if (DbFactory.ExecuteNonQuery(con, sqlstr, null, null, CommandType.Text, out result) > 0)
                    {
                        MessageBox.Show("亲，维护成功 祝您使用愉快！！！");
                        this.SelectBind();
                        this.txtbarcode.Enabled = false;
                    }
                    else
                    {
                        MessageBox.Show("维护失败，是不是操作失误！！！");
                    }
                }
            }
            else
            {
                MessageBox.Show("亲，请点击维护按钮");
            }
        }

        private void dataGrid1_CurrentCellChanged(object sender, EventArgs e)
        {
            this.button2.Enabled = true;
            this.button3.Enabled = true;
            this.txtbarcode.Text = this.dataGrid1[this.dataGrid1.CurrentRowIndex, 1].ToString();
            this.goodsid = this.dataGrid1[this.dataGrid1.CurrentRowIndex, 0].ToString();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && (this.components != null))
            {
                this.components.Dispose();
            }
            base.Dispose(disposing);
        }

        private void ForBarcodeUpdatecs_Load(object sender, EventArgs e)
        {
            this.txtbarcode.Enabled = false;
            this.button2.Enabled = false;
            this.button3.Enabled = false;
        }

        private void InitializeComponent()
        {
            this.label1 = new Label();
            this.dataGrid1 = new System.Windows.Forms.DataGrid();
            this.button1 = new Button();
            this.label4 = new Label();
            this.txtbarcode = new TextBox();
            this.button2 = new Button();
            this.button3 = new Button();
            this.txtsmbarcode = new TextBox();
            this.txtshelfno = new Label();
            this.txtsmshelfno = new TextBox();
            base.SuspendLayout();
            this.label1.ForeColor = Color.Blue;
            this.label1.Location = new Point(3, 4);
            this.label1.Name = "label1";
            this.label1.Size = new Size(80, 20);
            this.label1.Text = "扫描：";
            this.dataGrid1.BackgroundColor=Color.FromArgb(0x40, 0x40, 0x40);
            this.dataGrid1.ForeColor = Color.Blue;
            this.dataGrid1.Location = new Point(3, 0x4a);
            this.dataGrid1.Name = "dataGrid1";
            this.dataGrid1.SelectionBackColor = Color.Red;
            this.dataGrid1.SelectionForeColor = Color.CornflowerBlue;
            this.dataGrid1.Size = new Size(0xe8, 140);
            this.dataGrid1.TabIndex = 6;
            this.dataGrid1.CurrentCellChanged += new EventHandler(this.dataGrid1_CurrentCellChanged);
            this.button1.Location = new Point(0xa2, 0x2f);
            this.button1.Name = "button1";
            this.button1.Size = new Size(0x48, 0x1a);
            this.button1.TabIndex = 7;
            this.button1.Text = "查询";
            this.button1.Click += new EventHandler(this.button1_Click);
            this.label4.ForeColor = Color.Blue;
            this.label4.Location = new Point(6, 0xda);
            this.label4.Name = "label4";
            this.label4.Size = new Size(0x39, 20);
            this.label4.Text = "条码：";
            this.txtbarcode.Location = new Point(0x35, 0xd8);
            this.txtbarcode.Name = "txtbarcode";
            this.txtbarcode.Size = new Size(0xb6, 0x17);
            this.txtbarcode.TabIndex = 9;
            this.button2.Location = new Point(0x21, 0xf1);
            this.button2.Name = "button2";
            this.button2.Size = new Size(0x48, 0x1a);
            this.button2.TabIndex = 10;
            this.button2.Text = "维护";
            this.button2.Click += new EventHandler(this.button2_Click);
            this.button3.Location = new Point(0x85, 0xf1);
            this.button3.Name = "button3";
            this.button3.Size = new Size(0x48, 0x1a);
            this.button3.TabIndex = 11;
            this.button3.Text = "确定";
            this.button3.Click += new EventHandler(this.button3_Click);
            this.txtsmbarcode.Location = new Point(0x2f, 1);
            this.txtsmbarcode.Name = "txtsmbarcode";
            this.txtsmbarcode.Size = new Size(0xbc, 0x17);
            this.txtsmbarcode.TabIndex = 0x10;
            this.txtsmbarcode.KeyPress += new KeyPressEventHandler(this.txtsmbarcode_KeyPress);
            this.txtshelfno.ForeColor = Color.Blue;
            this.txtshelfno.Location = new Point(4, 0x1a);
            this.txtshelfno.Name = "txtshelfno";
            this.txtshelfno.Size = new Size(0x3b, 20);
            this.txtshelfno.Text = "货位：";
            this.txtsmshelfno.Location = new Point(0x2f, 0x18);
            this.txtsmshelfno.Name = "txtsmshelfno";
            this.txtsmshelfno.Size = new Size(0xbc, 0x17);
            this.txtsmshelfno.TabIndex = 0x12;
            base.AutoScaleDimensions = new SizeF(96f, 96f);
            base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            this.BackColor = Color.Gray;
            base.ClientSize = new Size(0xee, 270);
            base.Controls.Add(this.txtsmshelfno);
            base.Controls.Add(this.txtshelfno);
            base.Controls.Add(this.txtsmbarcode);
            base.Controls.Add(this.button3);
            base.Controls.Add(this.button2);
            base.Controls.Add(this.txtbarcode);
            base.Controls.Add(this.label4);
            base.Controls.Add(this.button1);
            base.Controls.Add(this.dataGrid1);
            base.Controls.Add(this.label1);
            base.Name = "ForBarcodeUpdatecs";
            this.Text = "条码维护";
            base.Load += new EventHandler(this.ForBarcodeUpdatecs_Load);
            base.ResumeLayout(false);
        }

        public void SelectBind()
        {
            string str;
            this.conn = GetConn.Conn(out str);
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
            string sqlstr = "SELECT bims_goods.goodsid as 商品编码,   \r\n                              bims_goods.barcode as  商品条形码, \r\n                              bims_goods.goodsname  as 商品名称,   \r\n                              bims_goods.goodsspec  as 商品规格 , \r\n                              bims_goods.producer  as 生产厂家  ,   \r\n                              bims_goods.goodsunit AS 单位,   \r\n                              dbo.bims_f_get_companyname(bims_goods_list.companyno) as 最新供应商名称\r\n                              FROM bims_stock_dtl left join bims_goods_list on bims_stock_dtl.goodsid=bims_goods_list.goodsid\r\n                              left join bims_goods on bims_stock_dtl.goodsid=bims_goods.goodsid where bims_stock_dtl.shelfno='" + this.txtsmshelfno.Text.Trim() + "' and bims_stock_dtl.orgno = dbo.bims_f_sys_ini('1001') and goodsqty<>0";
            DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out str);
            if ((set != null) && (set.Tables.Count > 0))
            {
                this.dataGrid1.DataSource = set.Tables[0];
            }
        }

        private void txtsmbarcode_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == '\r')
            {
                string result = "";
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                if (string.IsNullOrEmpty(this.txtsmbarcode.Text.Trim()))
                {
                    MessageBox.Show("请扫描条形码！");
                }
                else
                {
                    string str3 = this.txtbarcode.Text.Trim();
                    this.txtbarcode.Text = "";
                    string sqlstr = "declare @orgno varchar(10) set @orgno = dbo.bims_f_sys_ini('1001') execute dbo.bims_p_select_goods  @orgno,'" + this.txtsmbarcode.Text + "'";
                    DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
                    if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
                    {
                        if (set.Tables[0].Rows.Count == 1)
                        {
                            this.goodsid1 = set.Tables[0].Rows[0][0].ToString().Trim();
                            System.Data.SqlClient.SqlConnection connection2 = new System.Data.SqlClient.SqlConnection(this.conn);
                            string str4 = " SELECT bims_goods.goodsid as 商品编码,   \r\n                              bims_goods.barcode as  商品条形码, \r\n                              bims_goods.goodsname  as 商品名称,   \r\n                              bims_goods.goodsspec  as 商品规格 , \r\n                              bims_goods.producer  as 生产厂家  ,   \r\n                              bims_goods.goodsunit AS 单位,   \r\n                              bims_goods_list.companyno,dbo.bims_f_get_companyname(bims_goods_list.companyno) as 最新供应商名称\r\n                              FROM bims_goods_ext ,bims_goods   ,bims_goods_list  left join pub_class a on a.classcode=dbo.bims_f_goods_class(dbo.bims_f_sys_ini('1033'),bims_goods_list.goodsid) and a.groupid= dbo.bims_f_sys_ini('1033') \r\n\r\n\t                          left join bims_stock_doc on bims_stock_doc.goodsid=bims_goods_list.goodsid and bims_stock_doc.orgno=dbo.bims_f_sys_ini('1001')\r\n\r\n                              where bims_goods.goodsid=bims_goods_list.goodsid and bims_goods_ext.goodsid=bims_goods.goodsid and bims_goods.goodsid='" + this.goodsid1 + "'";
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
                                this.goodsid1 = this.goods[0];
                                System.Data.SqlClient.SqlConnection connection3 = new System.Data.SqlClient.SqlConnection(this.conn);
                                string str5 = "  SELECT bims_goods.goodsid as 商品编码,   \r\n                                 bims_goods.barcode as  商品条形码, \r\n                                 bims_goods.goodsname  as 商品名称,   \r\n                                 bims_goods.goodsspec  as 商品规格 , \r\n                                 bims_goods.producer  as 生产厂家  ,   \r\n                                 bims_goods.goodsunit AS 单位,   \r\n                                 bims_goods_list.companyno,dbo.bims_f_get_companyname(bims_goods_list.companyno) as 最新供应商名称\r\n                                 FROM bims_goods_ext ,bims_goods   ,bims_goods_list  left join pub_class a on a.classcode=dbo.bims_f_goods_class(dbo.bims_f_sys_ini('1033'),bims_goods_list.goodsid) and a.groupid= dbo.bims_f_sys_ini('1033') \r\n\r\n\t                             left join bims_stock_doc on bims_stock_doc.goodsid=bims_goods_list.goodsid and bims_stock_doc.orgno=dbo.bims_f_sys_ini('1001')\r\n\r\n                                 where bims_goods.goodsid=bims_goods_list.goodsid and bims_goods_ext.goodsid=bims_goods.goodsid and bims_goods.goodsid='" + this.goodsid1 + "'";
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
                        this.txtsmbarcode.Text = "";
                        this.txtsmbarcode.Focus();
                    }
                }
            }
        }
    }
}

