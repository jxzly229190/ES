namespace WindowsMobile
{
    using DataFactory;
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;

    public class FrmJgmSet : Form
    {
        private Button btCancel;
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
        private RadioButton rbMax;
        private RadioButton rbMid;
        private RadioButton rbMin;
        private TextBox tbGoodsid;
        private TextBox tbGoodsname;
        private TextBox tbJgm;
        private TextBox tbNum;
        private TextBox tbProducer;
        private TextBox tbSpec;

        public FrmJgmSet()
        {
            this.InitializeComponent();
            string result = "";
            this.conn = GetConn.Conn(out result);
            if (string.IsNullOrEmpty(this.conn))
            {
                this.tbGoodsid.Enabled = false;
                this.btSave.Enabled = false;
                MessageBox.Show("读取配置文件失败，请重新尝试！错误：" + result);
            }
        }

        private void btCancel_Click(object sender, EventArgs e)
        {
            base.DialogResult = DialogResult.Cancel;
            base.Close();
        }

        private void btSave_Click(object sender, EventArgs e)
        {
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
            this.tbGoodsid = new TextBox();
            this.tbGoodsname = new TextBox();
            this.label2 = new Label();
            this.tbSpec = new TextBox();
            this.label3 = new Label();
            this.tbProducer = new TextBox();
            this.label4 = new Label();
            this.tbJgm = new TextBox();
            this.label5 = new Label();
            this.label6 = new Label();
            this.rbMax = new RadioButton();
            this.rbMid = new RadioButton();
            this.rbMin = new RadioButton();
            this.label7 = new Label();
            this.tbNum = new TextBox();
            this.btSave = new Button();
            this.btCancel = new Button();
            base.SuspendLayout();
            this.label1.Location = new Point(4, 4);
            this.label1.Name = "label1";
            this.label1.Size = new Size(70, 20);
            this.label1.Text = "商品编码:";
            this.tbGoodsid.Location = new Point(0x4f, 2);
            this.tbGoodsid.Name = "tbGoodsid";
            this.tbGoodsid.Size = new Size(0x88, 0x17);
            this.tbGoodsid.TabIndex = 1;
            this.tbGoodsname.Enabled = false;
            this.tbGoodsname.Location = new Point(0x4f, 0x1b);
            this.tbGoodsname.Name = "tbGoodsname";
            this.tbGoodsname.Size = new Size(0x88, 0x17);
            this.tbGoodsname.TabIndex = 3;
            this.label2.Location = new Point(4, 0x1d);
            this.label2.Name = "label2";
            this.label2.Size = new Size(70, 20);
            this.label2.Text = "商品名称:";
            this.tbSpec.Enabled = false;
            this.tbSpec.Location = new Point(0x4f, 0x34);
            this.tbSpec.Name = "tbSpec";
            this.tbSpec.Size = new Size(0x88, 0x17);
            this.tbSpec.TabIndex = 6;
            this.label3.Location = new Point(4, 0x36);
            this.label3.Name = "label3";
            this.label3.Size = new Size(70, 20);
            this.label3.Text = "规格单位:";
            this.tbProducer.Enabled = false;
            this.tbProducer.Location = new Point(0x4f, 0x4d);
            this.tbProducer.Name = "tbProducer";
            this.tbProducer.Size = new Size(0x88, 0x17);
            this.tbProducer.TabIndex = 9;
            this.label4.Location = new Point(4, 0x4f);
            this.label4.Name = "label4";
            this.label4.Size = new Size(70, 20);
            this.label4.Text = "生产厂家:";
            this.tbJgm.Enabled = false;
            this.tbJgm.Location = new Point(0x4f, 0x66);
            this.tbJgm.Name = "tbJgm";
            this.tbJgm.Size = new Size(0x88, 0x17);
            this.tbJgm.TabIndex = 12;
            this.label5.Location = new Point(4, 0x68);
            this.label5.Name = "label5";
            this.label5.Size = new Size(70, 20);
            this.label5.Text = "监管码:";
            this.label6.Location = new Point(5, 0x81);
            this.label6.Name = "label6";
            this.label6.Size = new Size(70, 20);
            this.label6.Text = "编码规格:";
            this.rbMax.Location = new Point(0x4f, 0x80);
            this.rbMax.Name = "rbMax";
            this.rbMax.Size = new Size(40, 20);
            this.rbMax.TabIndex = 0x10;
            this.rbMax.Text = "大";
            this.rbMid.Location = new Point(0x7f, 0x80);
            this.rbMid.Name = "rbMid";
            this.rbMid.Size = new Size(40, 20);
            this.rbMid.TabIndex = 0x11;
            this.rbMid.Text = "中";
            this.rbMin.Location = new Point(0xae, 0x80);
            this.rbMin.Name = "rbMin";
            this.rbMin.Size = new Size(40, 20);
            this.rbMin.TabIndex = 0x12;
            this.rbMin.Text = "小";
            this.label7.Location = new Point(5, 0x98);
            this.label7.Name = "label7";
            this.label7.Size = new Size(70, 20);
            this.label7.Text = "编码装量:";
            this.tbNum.Location = new Point(0x4e, 0x95);
            this.tbNum.Name = "tbNum";
            this.tbNum.Size = new Size(0x88, 0x17);
            this.tbNum.TabIndex = 0x15;
            this.btSave.Location = new Point(0x8d, 0xb0);
            this.btSave.Name = "btSave";
            this.btSave.Size = new Size(0x48, 0x24);
            this.btSave.TabIndex = 0x16;
            this.btSave.Text = "保存";
            this.btSave.Click += new EventHandler(this.btSave_Click);
            this.btCancel.Location = new Point(4, 0xaf);
            this.btCancel.Name = "btCancel";
            this.btCancel.Size = new Size(0x48, 0x24);
            this.btCancel.TabIndex = 0x17;
            this.btCancel.Text = "取消";
            this.btCancel.Click += new EventHandler(this.btCancel_Click);
            base.AutoScaleDimensions = new SizeF(96f, 96f);
            base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            base.ClientSize = new Size(0xda, 0xd7);
            base.Controls.Add(this.btCancel);
            base.Controls.Add(this.btSave);
            base.Controls.Add(this.tbNum);
            base.Controls.Add(this.label7);
            base.Controls.Add(this.rbMin);
            base.Controls.Add(this.rbMid);
            base.Controls.Add(this.rbMax);
            base.Controls.Add(this.label6);
            base.Controls.Add(this.tbJgm);
            base.Controls.Add(this.label5);
            base.Controls.Add(this.tbProducer);
            base.Controls.Add(this.label4);
            base.Controls.Add(this.tbSpec);
            base.Controls.Add(this.label3);
            base.Controls.Add(this.tbGoodsname);
            base.Controls.Add(this.label2);
            base.Controls.Add(this.tbGoodsid);
            base.Controls.Add(this.label1);
            base.Name = "FrmJgmSet";
            this.Text = "对应关系维护";
            base.ResumeLayout(false);
        }
    }
}

