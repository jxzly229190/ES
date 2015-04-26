namespace WindowsMobile
{
    using DataFactory;
    using System;
    using System.ComponentModel;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Windows.Forms;

    public class FrmJgmManage : Form
    {
        private Button btEnd;
        private Button btRef;
        private Button btScanNew;
        private Button btScanOld;
        private IContainer components = null;
        private string conn;
        private System.Windows.Forms.DataGrid dgJgmBill;
        private Label label1;

        public FrmJgmManage()
        {
            this.InitializeComponent();
            string result = "";
            this.conn = GetConn.Conn(out result);
            if (string.IsNullOrEmpty(this.conn))
            {
                MessageBox.Show("读取配置文件失败，请重新尝试！错误：" + result);
            }
            this.BindData();
        }

        private void BindData()
        {
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
            string result = "";
            string sqlstr = "select distinct b.billname 单据名称,a.billno 单据编号,a.billcode 单据类型 from bims_jgm_bill a,sys_bill b where a.billcode = b.billcode";
            DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
            if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
            {
                this.dgJgmBill.DataSource = set.Tables[0];
            }
            else
            {
                this.dgJgmBill.DataSource = null;
            }
        }

        private void btEnd_Click(object sender, EventArgs e)
        {
            if (this.dgJgmBill.CurrentRowIndex >= 0)
            {
                try
                {
                    string sqlstr = "begin tran T1 \r\n                           insert into bims_goods_custom(customid,goodsid,date,billcode,billno,goods,batchno,idno,lotno,valid_date,goodsqty,outtype,goodsname,goodsspec,producer,shelfno,createuser,createtime,memo,bak1,bak2)\r\n                           select billno,jgmcode,execdate,billcode,billno,'','','','',null,null,0,null,null,null,null,null,execdate,null,null,null from bims_jgm_bill where billno = '" + this.dgJgmBill[this.dgJgmBill.CurrentRowIndex, 1].ToString() + "' and billcode = '" + this.dgJgmBill[this.dgJgmBill.CurrentRowIndex, 2].ToString() + "'\r\n                           if @@error <> 0\r\n                           begin\r\n                                rollback tran T1\r\n                                select '0'\r\n                                return\r\n                           end\r\n                           delete bims_jgm_bill where billno = '" + this.dgJgmBill[this.dgJgmBill.CurrentRowIndex, 1].ToString() + "' and billcode = '" + this.dgJgmBill[this.dgJgmBill.CurrentRowIndex, 2].ToString() + "'\r\n                           if @@error <> 0\r\n                                begin\r\n                                rollback tran T1\r\n                                select '0'\r\n                                return\r\n                           end\r\n                           commit tran T1\r\n                           select '1'";
                    string result = "";
                    System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                    if (DbFactory.ExecuteScalar(con, sqlstr, null, null, CommandType.Text, out result) == "1")
                    {
                        MessageBox.Show("本单完成！");
                        this.BindData();
                    }
                    else
                    {
                        MessageBox.Show("完成失败，请重新读取单据后再尝试！");
                        this.BindData();
                    }
                }
                catch (Exception exception)
                {
                    MessageBox.Show(exception.Message);
                }
            }
        }

        private void btRef_Click(object sender, EventArgs e)
        {
            this.BindData();
        }

        private void btScanNew_Click(object sender, EventArgs e)
        {
            FrmJgmScan scan = new FrmJgmScan();
            if (scan.ShowDialog() == DialogResult.OK)
            {
                this.BindData();
            }
        }

        private void btScanOld_Click(object sender, EventArgs e)
        {
            if (this.dgJgmBill.CurrentRowIndex >= 0)
            {
                FrmJgmScan scan = new FrmJgmScan(this.dgJgmBill[this.dgJgmBill.CurrentRowIndex, 1].ToString(), this.dgJgmBill[this.dgJgmBill.CurrentRowIndex, 2].ToString());
                if (scan.ShowDialog() == DialogResult.OK)
                {
                    this.BindData();
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
            this.dgJgmBill = new System.Windows.Forms.DataGrid();
            this.btScanNew = new Button();
            this.btScanOld = new Button();
            this.btEnd = new Button();
            this.btRef = new Button();
            base.SuspendLayout();
            this.label1.ForeColor = Color.Red;
            this.label1.Location = new Point(4, 0x12);
            this.label1.Name = "label1";
            this.label1.Size = new Size(140, 20);
            this.label1.Text = "未完成监管码单据";
            this.dgJgmBill.BackgroundColor=Color.FromArgb(0x80, 0x80, 0x80);
            this.dgJgmBill.Location = new Point(4, 0x29);
            this.dgJgmBill.Name = "dgJgmBill";
            this.dgJgmBill.Size = new Size(230, 0xb6);
            this.dgJgmBill.TabIndex = 1;
            this.btScanNew.Location = new Point(0x9d, 0xe3);
            this.btScanNew.Name = "btScanNew";
            this.btScanNew.Size = new Size(0x48, 0x26);
            this.btScanNew.TabIndex = 2;
            this.btScanNew.Text = "扫描新单";
            this.btScanNew.Click += new EventHandler(this.btScanNew_Click);
            this.btScanOld.Location = new Point(9, 0xe3);
            this.btScanOld.Name = "btScanOld";
            this.btScanOld.Size = new Size(0x48, 0x26);
            this.btScanOld.TabIndex = 3;
            this.btScanOld.Text = "继续扫描";
            this.btScanOld.Click += new EventHandler(this.btScanOld_Click);
            this.btEnd.Location = new Point(0x53, 0xe3);
            this.btEnd.Name = "btEnd";
            this.btEnd.Size = new Size(0x48, 0x26);
            this.btEnd.TabIndex = 4;
            this.btEnd.Text = "完成";
            this.btEnd.Click += new EventHandler(this.btEnd_Click);
            this.btRef.Location = new Point(0xa2, 1);
            this.btRef.Name = "btRef";
            this.btRef.Size = new Size(0x48, 0x26);
            this.btRef.TabIndex = 6;
            this.btRef.Text = "刷新";
            this.btRef.Click += new EventHandler(this.btRef_Click);
            base.AutoScaleDimensions = new SizeF(96f, 96f);
            base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            base.ClientSize = new Size(0xee, 270);
            base.Controls.Add(this.btRef);
            base.Controls.Add(this.btEnd);
            base.Controls.Add(this.btScanOld);
            base.Controls.Add(this.btScanNew);
            base.Controls.Add(this.dgJgmBill);
            base.Controls.Add(this.label1);
            base.Name = "FrmJgmManage";
            this.Text = "监管码管理";
            base.ResumeLayout(false);
        }
    }
}

