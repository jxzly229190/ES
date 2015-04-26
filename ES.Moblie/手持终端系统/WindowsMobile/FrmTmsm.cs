namespace WindowsMobile
{
    using DataFactory;
    using System;
    using System.ComponentModel;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Windows.Forms;

    public class FrmTmsm : Form
    {
        private Button btCheck;
        private Button btCheckBar;
        private Button btClear;
        private Button btSave;
        private IContainer components = null;
        private string conn;
        private Label label1;
        private Label label2;
        private Label label3;
        private Label label4;
        private Label label5;
        private Label label6;
        private Label lbGoodsName;
        private Label lbGoodsProducer;
        private Label lbGoodsSpec;
        private Label lbGoodsWarrantno;
        private Label lbMessage;
        private MainMenu mainMenu1;
        private TextBox tbBarcode;
        private TextBox tbGoodsid;

        public FrmTmsm()
        {
            this.InitializeComponent();
            string result = "";
            this.conn = GetConn.Conn(out result);
            if (string.IsNullOrEmpty(this.conn))
            {
                this.tbBarcode.Enabled = false;
                this.tbGoodsid.Enabled = false;
                this.btCheck.Enabled = false;
                this.btSave.Enabled = false;
                MessageBox.Show("读取配置文件失败，请重新尝试！错误：" + result);
            }
        }

        private void btCheck_Click(object sender, EventArgs e)
        {
            string result = "";
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
            if (string.IsNullOrEmpty(this.tbGoodsid.Text.Trim()))
            {
                MessageBox.Show("请输入商品编码！");
            }
            else
            {
                string sqlstr = "select goodsid,goodsname,goodsspec,producer,warrantno from bims_goods_list where goodsid = '" + this.tbGoodsid.Text.Trim() + "'";
                DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
                if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
                {
                    this.tbGoodsid.Text = set.Tables[0].Rows[0]["goodsid"].ToString().Trim();
                    this.lbGoodsName.Text = set.Tables[0].Rows[0]["goodsname"].ToString().Trim();
                    this.lbGoodsSpec.Text = set.Tables[0].Rows[0]["goodsspec"].ToString().Trim();
                    this.lbGoodsProducer.Text = set.Tables[0].Rows[0]["producer"].ToString().Trim();
                    this.lbGoodsWarrantno.Text = set.Tables[0].Rows[0]["warrantno"].ToString().Trim();
                    if (set.Tables[0].Rows.Count > 1)
                    {
                        this.lbMessage.Text = "查找到记录集：" + set.Tables[0].Rows.Count + "条！";
                    }
                    else
                    {
                        this.lbMessage.Text = "";
                    }
                }
            }
        }

        private void btClear_Click(object sender, EventArgs e)
        {
            this.tbBarcode.Text = "";
            this.tbGoodsid.Text = "";
            this.lbGoodsName.Text = "";
            this.lbGoodsProducer.Text = "";
            this.lbGoodsSpec.Text = "";
            this.lbGoodsWarrantno.Text = "";
            this.lbMessage.Text = "";
        }

        private void btSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.tbBarcode.Text.Trim()) || string.IsNullOrEmpty(this.tbGoodsid.Text.Trim()))
            {
                MessageBox.Show("请扫描入条形码和输入商品！");
            }
            else
            {
                string result = "";
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                string sqlstr = "insert into bak_goods_barcode values('" + this.tbGoodsid.Text.Trim() + "','" + this.tbBarcode.Text.Trim() + "')";
                if (DbFactory.ExecuteNonQuery(con, sqlstr, null, null, CommandType.Text, out result) > 0)
                {
                    this.tbBarcode.Text = "";
                    this.tbGoodsid.Text = "";
                    this.lbGoodsName.Text = "";
                    this.lbGoodsProducer.Text = "";
                    this.lbGoodsSpec.Text = "";
                    this.lbGoodsWarrantno.Text = "";
                    this.lbMessage.Text = "";
                }
                else
                {
                    MessageBox.Show("保存失败！错误：" + result);
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string result = "";
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
            if (string.IsNullOrEmpty(this.tbBarcode.Text.Trim()))
            {
                MessageBox.Show("请扫描条形码！");
            }
            else
            {
                string sqlstr = "select goodsid,goodsname,goodsspec,producer,warrantno from bims_goods_list where barcode = '" + this.tbBarcode.Text.Trim() + "'";
                DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
                if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
                {
                    this.tbGoodsid.Text = set.Tables[0].Rows[0]["goodsid"].ToString().Trim();
                    this.lbGoodsName.Text = set.Tables[0].Rows[0]["goodsname"].ToString().Trim();
                    this.lbGoodsSpec.Text = set.Tables[0].Rows[0]["goodsspec"].ToString().Trim();
                    this.lbGoodsProducer.Text = set.Tables[0].Rows[0]["producer"].ToString().Trim();
                    this.lbGoodsWarrantno.Text = set.Tables[0].Rows[0]["warrantno"].ToString().Trim();
                    if (set.Tables[0].Rows.Count > 1)
                    {
                        this.lbMessage.Text = "查找到记录集：" + set.Tables[0].Rows.Count + "条！";
                    }
                    else
                    {
                        this.lbMessage.Text = "";
                    }
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
            this.mainMenu1 = new MainMenu();
            this.btCheckBar = new Button();
            this.btClear = new Button();
            this.lbMessage = new Label();
            this.btCheck = new Button();
            this.btSave = new Button();
            this.lbGoodsWarrantno = new Label();
            this.lbGoodsProducer = new Label();
            this.lbGoodsSpec = new Label();
            this.lbGoodsName = new Label();
            this.label6 = new Label();
            this.label5 = new Label();
            this.label4 = new Label();
            this.label3 = new Label();
            this.label2 = new Label();
            this.tbGoodsid = new TextBox();
            this.label1 = new Label();
            this.tbBarcode = new TextBox();
            base.SuspendLayout();
            this.btCheckBar.Location = new Point(0xb0, 0x25);
            this.btCheckBar.Name = "btCheckBar";
            this.btCheckBar.Size = new Size(0x36, 20);
            this.btCheckBar.TabIndex = 0x48;
            this.btCheckBar.Text = "清除";
            this.btCheckBar.Click += new EventHandler(this.button1_Click);
            this.btClear.Location = new Point(0x84, 230);
            this.btClear.Name = "btClear";
            this.btClear.Size = new Size(0x48, 0x29);
            this.btClear.TabIndex = 0x47;
            this.btClear.Text = "清除";
            this.btClear.Click += new EventHandler(this.btClear_Click);
            this.lbMessage.Font = new Font("Tahoma", 10f, FontStyle.Bold);
            this.lbMessage.ForeColor = Color.Red;
            this.lbMessage.Location = new Point(11, 0xcf);
            this.lbMessage.Name = "lbMessage";
            this.lbMessage.Size = new Size(0xdb, 20);
            this.btCheck.Location = new Point(0xb0, 80);
            this.btCheck.Name = "btCheck";
            this.btCheck.Size = new Size(0x36, 20);
            this.btCheck.TabIndex = 70;
            this.btCheck.Text = "确定";
            this.btCheck.Click += new EventHandler(this.btCheck_Click);
            this.btSave.Location = new Point(0x26, 230);
            this.btSave.Name = "btSave";
            this.btSave.Size = new Size(0x48, 0x29);
            this.btSave.TabIndex = 0x45;
            this.btSave.Text = "保存";
            this.btSave.Click += new EventHandler(this.btSave_Click);
            this.lbGoodsWarrantno.Location = new Point(0x5e, 0xb6);
            this.lbGoodsWarrantno.Name = "lbGoodsWarrantno";
            this.lbGoodsWarrantno.Size = new Size(0x88, 15);
            this.lbGoodsProducer.Location = new Point(0x5f, 0x9e);
            this.lbGoodsProducer.Name = "lbGoodsProducer";
            this.lbGoodsProducer.Size = new Size(0x87, 15);
            this.lbGoodsSpec.Location = new Point(0x5f, 0x84);
            this.lbGoodsSpec.Name = "lbGoodsSpec";
            this.lbGoodsSpec.Size = new Size(0x87, 15);
            this.lbGoodsName.Location = new Point(0x5f, 0x6c);
            this.lbGoodsName.Name = "lbGoodsName";
            this.lbGoodsName.Size = new Size(0x87, 15);
            this.label6.Location = new Point(11, 0xb6);
            this.label6.Name = "label6";
            this.label6.Size = new Size(0x4d, 15);
            this.label6.Text = "批准文号：";
            this.label5.Location = new Point(11, 0x9e);
            this.label5.Name = "label5";
            this.label5.Size = new Size(0x4d, 15);
            this.label5.Text = "生产厂家：";
            this.label4.Location = new Point(11, 0x84);
            this.label4.Name = "label4";
            this.label4.Size = new Size(0x4d, 15);
            this.label4.Text = "商品规格：";
            this.label3.Location = new Point(11, 0x6c);
            this.label3.Name = "label3";
            this.label3.Size = new Size(0x4d, 15);
            this.label3.Text = "商品名称：";
            this.label2.Location = new Point(10, 0x3e);
            this.label2.Name = "label2";
            this.label2.Size = new Size(100, 15);
            this.label2.Text = "商品信息：";
            this.tbGoodsid.Location = new Point(10, 80);
            this.tbGoodsid.Name = "tbGoodsid";
            this.tbGoodsid.Size = new Size(160, 0x17);
            this.tbGoodsid.TabIndex = 0x44;
            this.tbGoodsid.KeyPress += new KeyPressEventHandler(this.tbGoodsid_KeyPress);
            this.label1.Location = new Point(10, 0x12);
            this.label1.Name = "label1";
            this.label1.Size = new Size(100, 15);
            this.label1.Text = "条形码：";
            this.tbBarcode.Location = new Point(10, 0x24);
            this.tbBarcode.Name = "tbBarcode";
            this.tbBarcode.Size = new Size(160, 0x17);
            this.tbBarcode.TabIndex = 0x43;
            this.tbBarcode.KeyPress += new KeyPressEventHandler(this.tbBarcode_KeyPress);
            base.AutoScaleDimensions = new SizeF(96f, 96f);
            base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            base.ClientSize = new Size(240, 0x126);
            base.Controls.Add(this.btCheckBar);
            base.Controls.Add(this.btClear);
            base.Controls.Add(this.lbMessage);
            base.Controls.Add(this.btCheck);
            base.Controls.Add(this.btSave);
            base.Controls.Add(this.lbGoodsWarrantno);
            base.Controls.Add(this.lbGoodsProducer);
            base.Controls.Add(this.lbGoodsSpec);
            base.Controls.Add(this.lbGoodsName);
            base.Controls.Add(this.label6);
            base.Controls.Add(this.label5);
            base.Controls.Add(this.label4);
            base.Controls.Add(this.label3);
            base.Controls.Add(this.label2);
            base.Controls.Add(this.tbGoodsid);
            base.Controls.Add(this.label1);
            base.Controls.Add(this.tbBarcode);
            base.Menu = this.mainMenu1;
            base.Name = "FrmTmsm";
            this.Text = "条码扫描";
            base.ResumeLayout(false);
        }

        private void tbBarcode_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == '\r')
            {
                string result = "";
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                if (string.IsNullOrEmpty(this.tbBarcode.Text.Trim()))
                {
                    MessageBox.Show("请扫描条形码！");
                }
                else
                {
                    string sqlstr = "select goodsid,goodsname,goodsspec,producer,warrantno from bims_goods_list where barcode = '" + this.tbBarcode.Text.Trim() + "'";
                    DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
                    if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
                    {
                        this.tbGoodsid.Text = set.Tables[0].Rows[0]["goodsid"].ToString().Trim();
                        this.lbGoodsName.Text = set.Tables[0].Rows[0]["goodsname"].ToString().Trim();
                        this.lbGoodsSpec.Text = set.Tables[0].Rows[0]["goodsspec"].ToString().Trim();
                        this.lbGoodsProducer.Text = set.Tables[0].Rows[0]["producer"].ToString().Trim();
                        this.lbGoodsWarrantno.Text = set.Tables[0].Rows[0]["warrantno"].ToString().Trim();
                        if (set.Tables[0].Rows.Count > 1)
                        {
                            this.lbMessage.Text = "查找到记录集：" + set.Tables[0].Rows.Count + "条！";
                        }
                        else
                        {
                            this.lbMessage.Text = "";
                        }
                    }
                }
            }
        }

        private void tbGoodsid_KeyPress(object sender, KeyPressEventArgs e)
        {
        }
    }
}

