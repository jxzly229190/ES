namespace WindowsMobile
{
    using DataFactory;
    using System;
    using System.ComponentModel;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Windows.Forms;

    public class FrmCheckManage : Form
    {
        private Button btAll;
        private Button btDelete;
        private Button btUpdate;
        private IContainer components = null;
        private string conn;
        private System.Windows.Forms.DataGrid dgCheck;
        public string[] goods = new string[6];
        private Label label1;
        private Label label2;
        private Label label3;
        private TextBox tbBarCode;
        private TextBox tbBillno;
        private TextBox tbMemo;
        private TextBox tbSelect;

        public FrmCheckManage()
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
                this.BindData("");
            }
        }

        private void BindData(string goodsid)
        {
            string str = "";
            if (!string.IsNullOrEmpty(goodsid))
            {
                str = " and a.goodsid = '" + goodsid + "'";
            }
            User user = new User();
            string sqlstr = "select id as 编号,a.goodsid as 商品编码,b.goodsname as 商品名称,b.goodsspec as 规格,b.goodsunit as 单位,b.producer as 生产厂家,a.lotno as 批号,a.goodsqty as 库存数量,a.checkqty as 盘点数量,a.createuser as 盘点人,a.memo as 备注,b.warrantno as 批准文号 \r\nfrom bims_check_mac a,bims_goods_list b\r\nwhere a.goodsid = b.goodsid " + str + " and a.checkno = '" + user.CheckNo + "' order by a.createtime desc,a.memo,a.goodsid,a.createuser";
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
            string result = "";
            DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
            if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
            {
                this.dgCheck.DataSource = set.Tables[0];
            }
            else
            {
                this.dgCheck.DataSource = null;
                MessageBox.Show("未查询到扫描记录！");
                this.tbBarCode.Focus();
            }
        }

        private void btAll_Click(object sender, EventArgs e)
        {
            this.BindData("");
        }

        private void btDelete_Click(object sender, EventArgs e)
        {
            if ((this.dgCheck.CurrentRowIndex >= 0) && (this.dgCheck.CurrentRowIndex < this.dgCheck.VisibleRowCount))
            {
                if (MessageBox.Show("确定删除该行记录吗？", "删除扫描记录", MessageBoxButtons.OKCancel, MessageBoxIcon.None, MessageBoxDefaultButton.Button2) == DialogResult.OK)
                {
                    string sqlstr = "delete from bims_check_mac where id = '" + this.dgCheck[this.dgCheck.CurrentRowIndex, 0].ToString() + "'";
                    System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                    string result = "";
                    if (DbFactory.ExecuteNonQuery(con, sqlstr, null, null, CommandType.Text, out result) > 0)
                    {
                        MessageBox.Show("删除成功！");
                        this.BindData("");
                    }
                    else
                    {
                        MessageBox.Show("删除失败！消息：" + result);
                    }
                }
            }
            else
            {
                MessageBox.Show("请先选择要删除的记录！");
            }
        }

        private void btUpdate_Click(object sender, EventArgs e)
        {
            if ((this.dgCheck.CurrentRowIndex >= 0) && (this.dgCheck.CurrentRowIndex < this.dgCheck.VisibleRowCount))
            {
                FrmCheckUpdate update = new FrmCheckUpdate(new string[] { this.dgCheck[this.dgCheck.CurrentRowIndex, 0].ToString(), this.dgCheck[this.dgCheck.CurrentRowIndex, 1].ToString(), this.dgCheck[this.dgCheck.CurrentRowIndex, 2].ToString(), this.dgCheck[this.dgCheck.CurrentRowIndex, 3].ToString(), this.dgCheck[this.dgCheck.CurrentRowIndex, 4].ToString(), this.dgCheck[this.dgCheck.CurrentRowIndex, 5].ToString(), this.dgCheck[this.dgCheck.CurrentRowIndex, 11].ToString(), this.dgCheck[this.dgCheck.CurrentRowIndex, 6].ToString(), this.dgCheck[this.dgCheck.CurrentRowIndex, 7].ToString(), this.dgCheck[this.dgCheck.CurrentRowIndex, 8].ToString() });
                if (update.ShowDialog() == DialogResult.OK)
                {
                    MessageBox.Show("保存成功！");
                    this.BindData("");
                    this.tbBarCode.Focus();
                }
                else
                {
                    MessageBox.Show("请扫描条形码！");
                    this.tbBarCode.Focus();
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
            this.btAll = new Button();
            this.btDelete = new Button();
            this.btUpdate = new Button();
            this.tbSelect = new TextBox();
            this.label3 = new Label();
            this.label2 = new Label();
            this.dgCheck = new System.Windows.Forms.DataGrid();
            this.tbBarCode = new TextBox();
            this.label1 = new Label();
            this.tbBillno = new TextBox();
            base.SuspendLayout();
            this.btAll.Location = new Point(0xad, 0x34);
            this.btAll.Name = "btAll";
            this.btAll.Size = new Size(0x3e, 0x18);
            this.btAll.TabIndex = 0x26;
            this.btAll.Text = "全部";
            this.btAll.Click += new EventHandler(this.btAll_Click);
            this.btDelete.Location = new Point(0x8f, 0xea);
            this.btDelete.Name = "btDelete";
            this.btDelete.Size = new Size(0x48, 0x22);
            this.btDelete.TabIndex = 0x25;
            this.btDelete.Text = "删除";
            this.btDelete.Click += new EventHandler(this.btDelete_Click);
            this.btUpdate.Location = new Point(0x17, 0xea);
            this.btUpdate.Name = "btUpdate";
            this.btUpdate.Size = new Size(0x48, 0x22);
            this.btUpdate.TabIndex = 0x24;
            this.btUpdate.Text = "修改";
            this.btUpdate.Click += new EventHandler(this.btUpdate_Click);
            this.tbSelect.Location = new Point(0x47, 0x35);
            this.tbSelect.Name = "tbSelect";
            this.tbSelect.Size = new Size(0x63, 0x17);
            this.tbSelect.TabIndex = 0x23;
            this.tbSelect.KeyPress += new KeyPressEventHandler(this.tbSelect_KeyPress);
            this.label3.Location = new Point(9, 0x35);
            this.label3.Name = "label3";
            this.label3.Size = new Size(0x38, 20);
            this.label3.Text = "查找：";
            this.label3.TextAlign = ContentAlignment.TopRight;
            this.label2.Location = new Point(9, 30);
            this.label2.Name = "label2";
            this.label2.Size = new Size(0x38, 20);
            this.label2.Text = "备注：";
            this.label2.TextAlign = ContentAlignment.TopRight;
            this.dgCheck.BackgroundColor=Color.FromArgb(0x80, 0x80, 0x80);
            this.dgCheck.Location = new Point(3, 0x4e);
            this.dgCheck.Name = "dgCheck";
            this.dgCheck.Size = new Size(0xe7, 0x9a);
            this.dgCheck.TabIndex = 0x21;
            this.tbBarCode.Location = new Point(0x47, 3);
            this.tbBarCode.Name = "tbBarCode";
            this.tbBarCode.Size = new Size(0xa4, 0x17);
            this.tbBarCode.TabIndex = 0x20;
            this.tbBarCode.KeyPress += new KeyPressEventHandler(this.tbBarCode_KeyPress);
            this.label1.Location = new Point(9, 6);
            this.label1.Name = "label1";
            this.label1.Size = new Size(0x38, 20);
            this.label1.Text = "扫描：";
            this.label1.TextAlign = ContentAlignment.TopRight;
            this.tbBillno.Location = new Point(0x47, 0x1c);
            this.tbBillno.Name = "tbBillno";
            this.tbBillno.Size = new Size(0xa4, 0x17);
            this.tbBillno.TabIndex = 0x2a;
            base.AutoScaleDimensions = new SizeF(96f, 96f);
            base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            base.ClientSize = new Size(0xee, 270);
            base.Controls.Add(this.tbBillno);
            base.Controls.Add(this.btAll);
            base.Controls.Add(this.btDelete);
            base.Controls.Add(this.btUpdate);
            base.Controls.Add(this.tbSelect);
            base.Controls.Add(this.label3);
            base.Controls.Add(this.label2);
            base.Controls.Add(this.dgCheck);
            base.Controls.Add(this.tbBarCode);
            base.Controls.Add(this.label1);
            base.Name = "FrmCheckManage";
            this.Text = "盘点扫描";
            base.ResumeLayout(false);
        }

        private void tbBarCode_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == '\r')
            {
                string result = "";
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                if (string.IsNullOrEmpty(this.tbBarCode.Text.Trim()))
                {
                    MessageBox.Show("请扫描条形码！");
                }
                else
                {
                    string str3 = this.tbBarCode.Text.Trim();
                    this.tbBarCode.Text = "";
                    string sqlstr = "declare @orgno varchar(10) set @orgno = dbo.bims_f_sys_ini('1001') execute dbo.bims_p_select_goods  @orgno,'" + str3 + "'";
                    DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
                    if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
                    {
                        FrmCheck check;
                        if (set.Tables[0].Rows.Count == 1)
                        {
                            check = new FrmCheck(set.Tables[0].Rows[0][0].ToString().Trim(), this.tbBillno.Text.Trim());
                            if (check.ShowDialog() == DialogResult.OK)
                            {
                                this.BindData("");
                                base.Focus();
                                this.tbBarCode.Focus();
                            }
                            else
                            {
                                base.Focus();
                                this.tbBarCode.Focus();
                            }
                        }
                        else
                        {
                            FrmGoodsSelect select = new FrmGoodsSelect(set.Tables[0], this.goods);
                            if ((select.ShowDialog() == DialogResult.OK) && !string.IsNullOrEmpty(this.goods[0]))
                            {
                                check = new FrmCheck(this.goods[0], this.tbBillno.Text.Trim());
                                if (check.ShowDialog() == DialogResult.OK)
                                {
                                    this.BindData("");
                                    base.Focus();
                                    this.tbBarCode.Focus();
                                }
                                else
                                {
                                    base.Focus();
                                    this.tbBarCode.Focus();
                                }
                            }
                        }
                    }
                    else
                    {
                        MessageBox.Show("无此商品！");
                        this.tbBarCode.Text = "";
                        this.tbBarCode.Focus();
                    }
                }
            }
        }

        private void tbSelect_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == '\r')
            {
                string result = "";
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                if (string.IsNullOrEmpty(this.tbSelect.Text.Trim()))
                {
                    MessageBox.Show("请扫描条形码！");
                }
                else
                {
                    string str3 = this.tbSelect.Text.Trim();
                    this.tbSelect.Text = "";
                    string sqlstr = "declare @orgno varchar(10) set @orgno = dbo.bims_f_sys_ini('1001') execute dbo.bims_p_select_goods  @orgno,'" + str3 + "'";
                    DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
                    if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
                    {
                        if (set.Tables[0].Rows.Count == 1)
                        {
                            this.BindData(set.Tables[0].Rows[0][0].ToString().Trim());
                            this.tbSelect.Text = "";
                            this.tbBarCode.Focus();
                        }
                        else
                        {
                            FrmGoodsSelect select = new FrmGoodsSelect(set.Tables[0], this.goods);
                            if (!((select.ShowDialog() != DialogResult.OK) || string.IsNullOrEmpty(this.goods[0])))
                            {
                                this.BindData(this.goods[0]);
                            }
                            this.tbSelect.Text = "";
                            this.tbBarCode.Focus();
                        }
                    }
                    else
                    {
                        MessageBox.Show("无此商品！");
                        this.tbSelect.Text = "";
                        this.tbBarCode.Focus();
                    }
                }
            }
        }
    }
}

