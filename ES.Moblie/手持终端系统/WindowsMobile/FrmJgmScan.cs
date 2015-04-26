namespace WindowsMobile
{
    using DataFactory;
    using System;
    using System.Collections;
    using System.ComponentModel;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Windows.Forms;

    public class FrmJgmScan : Form
    {
        private Button btDelete;
        private Button btSave;
        private ComboBox cbBillCode;
        private IContainer components;
        private string conn;
        private System.Windows.Forms.DataGridTableStyle dataGridTableStyle1;
        private System.Windows.Forms.DataGridTextBoxColumn dataGridTextBoxColumn1;
        private System.Windows.Forms.DataGridTextBoxColumn dataGridTextBoxColumn2;
        private System.Windows.Forms.DataGrid dgJgmBills;
        public string[] goods;
        private Hashtable hs;
        private Hashtable jgms;
        private Label label1;
        private Label label2;
        private Label label3;
        private TextBox tbBillcode;
        private TextBox tbBillno;
        private TextBox tbJgm;

        public FrmJgmScan()
        {
            this.components = null;
            this.hs = new Hashtable();
            this.jgms = new Hashtable();
            this.goods = new string[6];
            this.InitializeComponent();
            string result = "";
            this.conn = GetConn.Conn(out result);
            if (string.IsNullOrEmpty(this.conn))
            {
                MessageBox.Show("读取配置文件失败，请重新尝试！错误：" + result);
                this.tbBillno.Enabled = false;
                this.cbBillCode.Enabled = false;
                this.tbJgm.Enabled = false;
            }
            else
            {
                this.hs.Add("入库退货", "'SUP','BAC'");
                this.hs.Add("配送退仓", "'DIS','DIB'");
                this.hs.Add("批发销售", "'WHL','WHR'");
                this.cbBillCode.Enabled = true;
                this.tbBillno.Enabled = true;
                this.tbJgm.Enabled = false;
            }
        }

        public FrmJgmScan(string billno, string billcode)
        {
            this.components = null;
            this.hs = new Hashtable();
            this.jgms = new Hashtable();
            this.goods = new string[6];
            this.InitializeComponent();
            string result = "";
            this.conn = GetConn.Conn(out result);
            if (string.IsNullOrEmpty(this.conn))
            {
                MessageBox.Show("读取配置文件失败，请重新尝试！错误：" + result);
                this.tbBillno.Enabled = false;
                this.cbBillCode.Enabled = false;
                this.tbJgm.Enabled = false;
            }
            else
            {
                this.hs.Add("入库退货", "'SUP','BAC'");
                this.hs.Add("配送退仓", "'DIS','DIB'");
                this.hs.Add("批发销售", "'WHL','WHR'");
                this.cbBillCode.Enabled = true;
                this.tbBillno.Enabled = true;
                this.tbJgm.Enabled = true;
                string str2 = billcode;
                if (str2 != null)
                {
                    if (!(str2 == "SUP"))
                    {
                        if (str2 == "BAK")
                        {
                            this.cbBillCode.SelectedIndex = 0;
                        }
                        else if (str2 == "DIS")
                        {
                            this.cbBillCode.SelectedIndex = 1;
                        }
                        else if (str2 == "DIB")
                        {
                            this.cbBillCode.SelectedIndex = 1;
                        }
                        else if (str2 == "WHL")
                        {
                            this.cbBillCode.SelectedIndex = 2;
                        }
                        else if (str2 == "WHR")
                        {
                            this.cbBillCode.SelectedIndex = 2;
                        }
                    }
                    else
                    {
                        this.cbBillCode.SelectedIndex = 0;
                    }
                }
                this.tbBillno.Text = billno;
                this.tbBillcode.Text = billcode;
                this.BindData(this.tbBillno.Text, this.cbBillCode.SelectedItem.ToString());
                this.tbJgm.Focus();
            }
        }

        private void BindData(string billno, string billcode)
        {
            if (!string.IsNullOrEmpty(this.tbBillno.Text.Trim()) && !string.IsNullOrEmpty(this.cbBillCode.SelectedItem.ToString()))
            {
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                string result = "";
                string sqlstr = "";
                string str5 = billcode;
                if (str5 != null)
                {
                    if (!(str5 == "入库退货"))
                    {
                        if (str5 == "配送退仓")
                        {
                            sqlstr = "select billcode from bims_distract_doc where distractno = '" + billno + "'";
                        }
                        else if (str5 == "批发销售")
                        {
                            sqlstr = "select billcode from bims_wholesale_doc where wholesaleno = '" + billno + "'";
                        }
                    }
                    else
                    {
                        sqlstr = "select billcode from bims_supply_doc where supplyno = '" + billno + "'";
                    }
                }
                string str3 = DbFactory.ExecuteScalar(con, sqlstr, null, null, CommandType.Text, out result);
                if (string.IsNullOrEmpty(str3))
                {
                    MessageBox.Show("未查询到该单据，请核对单据类型和单据号！");
                    this.tbBillno.Text = "";
                }
                else
                {
                    this.tbBillcode.Text = str3;
                    sqlstr = "select jgmcode,1 as status from bims_jgm_bill where billcode = '" + str3 + "' and billno = '" + billno + "' order by id";
                    DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
                    if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
                    {
                        DataTable table = set.Tables[0];
                        table.TableName = "jgmCode";
                        this.dgJgmBills.DataSource = table;
                        this.jgms.Clear();
                        foreach (DataRow row in set.Tables[0].Rows)
                        {
                            this.jgms.Add(row[0].ToString(), "1");
                        }
                        this.tbJgm.Enabled = true;
                        this.tbJgm.Focus();
                    }
                    else
                    {
                        sqlstr = "select billno from bims_goods_custom where billno = '" + billno + "' and billcode = '" + str3 + "'";
                        if (!string.IsNullOrEmpty(DbFactory.ExecuteScalar(con, sqlstr, null, null, CommandType.Text, out result)))
                        {
                            MessageBox.Show("该单据已扫描过，请勿重复扫描！");
                            this.tbJgm.Enabled = false;
                            this.tbBillno.Text = "";
                            this.tbBillno.Focus();
                        }
                        else
                        {
                            this.dgJgmBills.DataSource = null;
                            this.tbJgm.Enabled = true;
                            this.tbJgm.Focus();
                        }
                    }
                }
            }
        }

        private void btDelete_Click(object sender, EventArgs e)
        {
            if ((this.dgJgmBills.CurrentRowIndex >= 0) && (this.dgJgmBills.CurrentRowIndex < this.dgJgmBills.VisibleRowCount))
            {
                if (MessageBox.Show("确定删除该行记录吗？", "删除扫描记录", MessageBoxButtons.OKCancel, MessageBoxIcon.None, MessageBoxDefaultButton.Button2) == DialogResult.OK)
                {
                    int num = 1;
                    if (this.jgms[this.dgJgmBills[this.dgJgmBills.CurrentRowIndex, 0]].ToString() == "1")
                    {
                        string sqlstr = "delete from bims_jgm_bill where billno = '" + this.tbBillno.Text.Trim() + "' and billcode = '" + this.tbBillcode.Text.Trim() + "' and jgmcode ='" + this.dgJgmBills[this.dgJgmBills.CurrentRowIndex, 0].ToString() + "'";
                        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                        string result = "";
                        num = DbFactory.ExecuteNonQuery(con, sqlstr, null, null, CommandType.Text, out result);
                    }
                    if (num > 0)
                    {
                        this.jgms.Remove(this.dgJgmBills[this.dgJgmBills.CurrentRowIndex, 0].ToString());
                        DataTable dataSource = (DataTable) this.dgJgmBills.DataSource;
                        dataSource.Rows.RemoveAt(this.dgJgmBills.CurrentRowIndex);
                        this.dgJgmBills.DataSource = dataSource;
                        MessageBox.Show("删除成功！");
                    }
                    else
                    {
                        MessageBox.Show("删除失败！");
                    }
                }
            }
            else
            {
                MessageBox.Show("请先选择要删除的记录！");
            }
        }

        private void btSave_Click(object sender, EventArgs e)
        {
            DataTable dataSource = (DataTable) this.dgJgmBills.DataSource;
            if ((dataSource != null) && (dataSource.Rows.Count > 0))
            {
                string str2;
                string sqlstr = "insert into bims_jgm_bill(billcode,billno,jgmcode)";
                foreach (DataRow row in dataSource.Rows)
                {
                    if (row[1].ToString() == "0")
                    {
                        object obj2 = sqlstr;
                        sqlstr = string.Concat(new object[] { obj2, "select '", this.tbBillcode.Text.Trim(), "','", this.tbBillno.Text.Trim(), "','", row[0], "'  \r\n                                union all " });
                    }
                }
                if (sqlstr == "insert into bims_jgm_bill(billcode,billno,jgmcode)")
                {
                    if (MessageBox.Show("没有修改过，没有要保存的记录！是否完成本单（注意：完成本单后不能再扫描本单）！", "保存", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button2) == DialogResult.OK)
                    {
                        str2 = this.Submit(this.tbBillno.Text.Trim(), this.tbBillcode.Text.Trim());
                        MessageBox.Show(str2);
                        if (str2 == "本单完成！")
                        {
                            this.Clear();
                        }
                    }
                    else
                    {
                        this.Clear();
                        base.DialogResult = DialogResult.OK;
                        base.Close();
                    }
                }
                else
                {
                    sqlstr = sqlstr.Substring(0, sqlstr.Length - 11);
                    string result = "";
                    System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                    if (DbFactory.ExecuteNonQuery(con, sqlstr, null, null, CommandType.Text, out result) <= 0)
                    {
                        MessageBox.Show("保存失败！message = " + result);
                    }
                    else if (MessageBox.Show("保存成功，是否完成本单（注意：完成本单后不能再扫描本单）！", "保存", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button2) == DialogResult.OK)
                    {
                        str2 = this.Submit(this.tbBillno.Text.Trim(), this.tbBillcode.Text.Trim());
                        MessageBox.Show(str2);
                        if (str2 == "本单完成！")
                        {
                            this.Clear();
                        }
                    }
                    else
                    {
                        this.Clear();
                        base.DialogResult = DialogResult.OK;
                        base.Close();
                    }
                }
            }
        }

        private void cbBillCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.cbBillCode.SelectedIndex >= 0)
            {
                this.tbBillno.Focus();
            }
        }

        private void Clear()
        {
            this.tbBillno.Text = "";
            this.dgJgmBills.DataSource = null;
            this.jgms.Clear();
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
            this.btSave = new Button();
            this.tbBillno = new TextBox();
            this.label2 = new Label();
            this.dgJgmBills = new System.Windows.Forms.DataGrid();
            this.dataGridTableStyle1 = new System.Windows.Forms.DataGridTableStyle();
            this.dataGridTextBoxColumn1 = new System.Windows.Forms.DataGridTextBoxColumn();
            this.dataGridTextBoxColumn2 = new System.Windows.Forms.DataGridTextBoxColumn();
            this.label1 = new Label();
            this.label3 = new Label();
            this.tbJgm = new TextBox();
            this.cbBillCode = new ComboBox();
            this.btDelete = new Button();
            this.tbBillcode = new TextBox();
            base.SuspendLayout();
            this.btSave.Location = new Point(0xa1, 0xea);
            this.btSave.Name = "btSave";
            this.btSave.Size = new Size(0x48, 0x22);
            this.btSave.TabIndex = 0x25;
            this.btSave.Text = "保存";
            this.btSave.Click += new EventHandler(this.btSave_Click);
            this.tbBillno.Location = new Point(0x53, 0x1b);
            this.tbBillno.Name = "tbBillno";
            this.tbBillno.Size = new Size(0x6a, 0x17);
            this.tbBillno.TabIndex = 0x22;
            this.tbBillno.KeyPress += new KeyPressEventHandler(this.tbBillno_KeyPress);
            this.label2.Location = new Point(0x26, 30);
            this.label2.Name = "label2";
            this.label2.Size = new Size(40, 20);
            this.label2.Text = "单号:";
            this.label2.TextAlign = ContentAlignment.TopRight;
            this.dgJgmBills.BackgroundColor=Color.FromArgb(0x80, 0x80, 0x80);
            this.dgJgmBills.Location = new Point(3, 0x4d);
            this.dgJgmBills.Name = "dgJgmBills";
            this.dgJgmBills.Size = new Size(0xe7, 0x9a);
            this.dgJgmBills.TabIndex = 0x21;
            this.dgJgmBills.TableStyles.Add(this.dataGridTableStyle1);
            this.dataGridTableStyle1.GridColumnStyles.Add(this.dataGridTextBoxColumn1);
            this.dataGridTableStyle1.GridColumnStyles.Add(this.dataGridTextBoxColumn2);
            this.dataGridTableStyle1.MappingName = "jgmCode";
            this.dataGridTextBoxColumn1.Format=("");
            this.dataGridTextBoxColumn1.Format=(null);
            this.dataGridTextBoxColumn1.HeaderText = "监管码";
            this.dataGridTextBoxColumn1.MappingName = "jgmcode";
            this.dataGridTextBoxColumn1.Width = 150;
            this.dataGridTextBoxColumn2.Format=("");
            this.dataGridTextBoxColumn2.Format=(null);
            this.dataGridTextBoxColumn2.HeaderText = "状态";
            this.dataGridTextBoxColumn2.MappingName = "status";
            this.dataGridTextBoxColumn2.Width = 40;
            this.label1.Location = new Point(9, 6);
            this.label1.Name = "label1";
            this.label1.Size = new Size(70, 20);
            this.label1.Text = "单据类型:";
            this.label3.Location = new Point(0x12, 0x35);
            this.label3.Name = "label3";
            this.label3.Size = new Size(60, 20);
            this.label3.Text = "监管码:";
            this.label3.TextAlign = ContentAlignment.TopRight;
            this.tbJgm.Location = new Point(0x53, 0x33);
            this.tbJgm.Name = "tbJgm";
            this.tbJgm.Size = new Size(0x98, 0x17);
            this.tbJgm.TabIndex = 0x30;
            this.tbJgm.KeyPress += new KeyPressEventHandler(this.tbJgm_KeyPress);
            this.cbBillCode.Items.Add("入库退货");
            this.cbBillCode.Items.Add("配送退仓");
            this.cbBillCode.Items.Add("批发销售");
            this.cbBillCode.Location = new Point(0x53, 2);
            this.cbBillCode.Name = "cbBillCode";
            this.cbBillCode.Size = new Size(0x98, 0x17);
            this.cbBillCode.TabIndex = 0x2a;
            this.cbBillCode.SelectedIndexChanged += new EventHandler(this.cbBillCode_SelectedIndexChanged);
            this.btDelete.Location = new Point(0x53, 0xea);
            this.btDelete.Name = "btDelete";
            this.btDelete.Size = new Size(0x48, 0x22);
            this.btDelete.TabIndex = 0x34;
            this.btDelete.Text = "删除";
            this.btDelete.Click += new EventHandler(this.btDelete_Click);
            this.tbBillcode.Enabled = false;
            this.tbBillcode.Location = new Point(0xbf, 0x1b);
            this.tbBillcode.Name = "tbBillcode";
            this.tbBillcode.Size = new Size(0x2c, 0x17);
            this.tbBillcode.TabIndex = 0x35;
            base.AutoScaleDimensions = new SizeF(96f, 96f);
            base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            base.ClientSize = new Size(0xee, 270);
            base.Controls.Add(this.tbBillcode);
            base.Controls.Add(this.btDelete);
            base.Controls.Add(this.tbJgm);
            base.Controls.Add(this.label3);
            base.Controls.Add(this.cbBillCode);
            base.Controls.Add(this.btSave);
            base.Controls.Add(this.tbBillno);
            base.Controls.Add(this.label2);
            base.Controls.Add(this.dgJgmBills);
            base.Controls.Add(this.label1);
            base.Name = "FrmJgmScan";
            this.Text = "监管码扫描";
            base.ResumeLayout(false);
        }

        private string Submit(string billno, string billcode)
        {
            try
            {
                string sqlstr = "begin tran T1 \r\n                           insert into bims_goods_custom(customid,goodsid,date,billcode,billno,goods,batchno,idno,lotno,valid_date,goodsqty,outtype,goodsname,goodsspec,producer,shelfno,createuser,createtime,memo,bak1,bak2)\r\n                           select billno,jgmcode,execdate,billcode,billno,'','','','',null,null,0,null,null,null,null,null,execdate,null,null,null from bims_jgm_bill where billno = '" + billno + "' and billcode = '" + billcode + "'\r\n                           if @@error <> 0\r\n                           begin\r\n                                rollback tran T1\r\n                                select '0'\r\n                                return\r\n                           end\r\n                           delete bims_jgm_bill where billno = '" + billno + "' and billcode = '" + billcode + "'\r\n                           if @@error <> 0\r\n                                begin\r\n                                rollback tran T1\r\n                                select '0'\r\n                                return\r\n                           end\r\n                           commit tran T1\r\n                           select '1'";
                string result = "";
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                if (DbFactory.ExecuteScalar(con, sqlstr, null, null, CommandType.Text, out result) == "1")
                {
                    return "本单完成！";
                }
                return "完成失败，请重新读取单据后再尝试！";
            }
            catch (Exception exception)
            {
                return exception.Message;
            }
        }

        private void tbBillno_KeyPress(object sender, KeyPressEventArgs e)
        {
            if ((e.KeyChar == '\r') && !(string.IsNullOrEmpty(this.tbBillno.Text.Trim()) || string.IsNullOrEmpty(this.cbBillCode.SelectedItem.ToString())))
            {
                this.BindData(this.tbBillno.Text.Trim(), this.cbBillCode.SelectedItem.ToString());
            }
        }

        private void tbJgm_KeyPress(object sender, KeyPressEventArgs e)
        {
            if ((e.KeyChar == '\r') && !string.IsNullOrEmpty(this.tbJgm.Text.Trim()))
            {
                try
                {
                    if (this.jgms.ContainsKey(this.tbJgm.Text.Trim()))
                    {
                        MessageBox.Show("该监管码已扫描过，请勿重复扫描！");
                        this.tbJgm.Text = "";
                        this.tbJgm.Focus();
                    }
                    else
                    {
                        DataTable dataSource;
                        if (this.dgJgmBills.DataSource != null)
                        {
                            dataSource = (DataTable) this.dgJgmBills.DataSource;
                            dataSource.TableName = "jgmCode";
                        }
                        else
                        {
                            dataSource = new DataTable("jgmCode");
                            dataSource.Columns.Add("jgmcode");
                            dataSource.Columns.Add("status");
                        }
                        DataRow row = dataSource.NewRow();
                        row[0] = this.tbJgm.Text.Trim();
                        row[1] = "0";
                        dataSource.Rows.InsertAt(row, 0);
                        this.dgJgmBills.DataSource = dataSource;
                        this.jgms.Add(this.tbJgm.Text.Trim(), 0);
                        this.tbJgm.Text = "";
                        this.tbJgm.Focus();
                    }
                }
                catch (Exception exception)
                {
                    MessageBox.Show(exception.Message);
                }
            }
        }
    }
}

