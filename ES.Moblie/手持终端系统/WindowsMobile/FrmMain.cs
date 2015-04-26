namespace WindowsMobile
{
    using DataFactory;
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;

    public partial class FrmMain : Form
    {
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
        private PictureBox pbCkfh;
        private PictureBox pbDd1;
        private PictureBox pbDd2;
        private PictureBox pbDd3;
        private PictureBox pbDd4;
        private PictureBox pbJhck;
        private PictureBox pbPdgl;
        private PictureBox pbRksj;
        private PictureBox pbTmwh;

        public FrmMain()
        {
            this.InitializeComponent();
            string result = "";
            this.conn = GetConn.Conn(out result);
            if (string.IsNullOrEmpty(this.conn))
            {
                MessageBox.Show("读取配置文件失败，请重新尝试！错误：" + result);
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
            this.label9 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.pbDd4 = new System.Windows.Forms.PictureBox();
            this.pbDd3 = new System.Windows.Forms.PictureBox();
            this.pbDd2 = new System.Windows.Forms.PictureBox();
            this.pbDd1 = new System.Windows.Forms.PictureBox();
            this.pbCkfh = new System.Windows.Forms.PictureBox();
            this.pbJhck = new System.Windows.Forms.PictureBox();
            this.pbRksj = new System.Windows.Forms.PictureBox();
            this.pbPdgl = new System.Windows.Forms.PictureBox();
            this.pbTmwh = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.pbDd4)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbDd3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbDd2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbDd1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbCkfh)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbJhck)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbRksj)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbPdgl)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbTmwh)).BeginInit();
            this.SuspendLayout();
            // 
            // label9
            // 
            this.label9.Font = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Bold);
            this.label9.ForeColor = System.Drawing.Color.Firebrick;
            this.label9.Location = new System.Drawing.Point(161, 238);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(60, 20);
            this.label9.TabIndex = 0;
            this.label9.Text = "监管码";
            this.label9.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // label8
            // 
            this.label8.Font = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Bold);
            this.label8.ForeColor = System.Drawing.SystemColors.ControlDark;
            this.label8.Location = new System.Drawing.Point(88, 238);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(60, 20);
            this.label8.TabIndex = 1;
            this.label8.Text = "待定";
            this.label8.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // label7
            // 
            this.label7.Font = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Bold);
            this.label7.ForeColor = System.Drawing.SystemColors.ControlDark;
            this.label7.Location = new System.Drawing.Point(15, 238);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(60, 20);
            this.label7.TabIndex = 2;
            this.label7.Text = "待定";
            this.label7.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // label6
            // 
            this.label6.Font = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Bold);
            this.label6.ForeColor = System.Drawing.Color.Firebrick;
            this.label6.Location = new System.Drawing.Point(161, 152);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(60, 20);
            this.label6.TabIndex = 3;
            this.label6.Text = "货位管理";
            this.label6.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // label5
            // 
            this.label5.Font = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Bold);
            this.label5.ForeColor = System.Drawing.Color.Firebrick;
            this.label5.Location = new System.Drawing.Point(88, 152);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(60, 20);
            this.label5.TabIndex = 4;
            this.label5.Text = "出库复核";
            this.label5.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // label4
            // 
            this.label4.Font = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Bold);
            this.label4.ForeColor = System.Drawing.Color.Firebrick;
            this.label4.Location = new System.Drawing.Point(15, 152);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(60, 20);
            this.label4.TabIndex = 5;
            this.label4.Text = "捡货出库";
            this.label4.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // label3
            // 
            this.label3.Font = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Bold);
            this.label3.ForeColor = System.Drawing.Color.Firebrick;
            this.label3.Location = new System.Drawing.Point(161, 66);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(60, 20);
            this.label3.TabIndex = 6;
            this.label3.Text = "入库上架";
            this.label3.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // label2
            // 
            this.label2.Font = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Bold);
            this.label2.ForeColor = System.Drawing.Color.Firebrick;
            this.label2.Location = new System.Drawing.Point(88, 66);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(60, 20);
            this.label2.TabIndex = 7;
            this.label2.Text = "盘点管理";
            this.label2.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // label1
            // 
            this.label1.Font = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Bold);
            this.label1.ForeColor = System.Drawing.Color.Firebrick;
            this.label1.Location = new System.Drawing.Point(15, 66);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(60, 20);
            this.label1.TabIndex = 16;
            this.label1.Text = "条码维护";
            this.label1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // pbDd4
            // 
            this.pbDd4.Image = global::Properties.Resources.edit_find;
            this.pbDd4.Location = new System.Drawing.Point(161, 175);
            this.pbDd4.Name = "pbDd4";
            this.pbDd4.Size = new System.Drawing.Size(60, 60);
            this.pbDd4.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pbDd4.TabIndex = 8;
            this.pbDd4.TabStop = false;
            this.pbDd4.Click += new System.EventHandler(this.pbDd4_Click);
            // 
            // pbDd3
            // 
            this.pbDd3.Image = global::Properties.Resources._590c4b55ca;
            this.pbDd3.Location = new System.Drawing.Point(88, 175);
            this.pbDd3.Name = "pbDd3";
            this.pbDd3.Size = new System.Drawing.Size(60, 60);
            this.pbDd3.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pbDd3.TabIndex = 9;
            this.pbDd3.TabStop = false;
            // 
            // pbDd2
            // 
            this.pbDd2.Image = global::Properties.Resources._590c4b55ca;
            this.pbDd2.Location = new System.Drawing.Point(15, 175);
            this.pbDd2.Name = "pbDd2";
            this.pbDd2.Size = new System.Drawing.Size(60, 60);
            this.pbDd2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pbDd2.TabIndex = 10;
            this.pbDd2.TabStop = false;
            // 
            // pbDd1
            // 
            this.pbDd1.Image = global::Properties.Resources.document_properties;
            this.pbDd1.Location = new System.Drawing.Point(161, 89);
            this.pbDd1.Name = "pbDd1";
            this.pbDd1.Size = new System.Drawing.Size(60, 60);
            this.pbDd1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pbDd1.TabIndex = 11;
            this.pbDd1.TabStop = false;
            this.pbDd1.Click += new System.EventHandler(this.pbDd1_Click_1);
            // 
            // pbCkfh
            // 
            this.pbCkfh.Image = global::Properties.Resources.edit_find_replace;
            this.pbCkfh.Location = new System.Drawing.Point(88, 89);
            this.pbCkfh.Name = "pbCkfh";
            this.pbCkfh.Size = new System.Drawing.Size(60, 60);
            this.pbCkfh.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pbCkfh.TabIndex = 12;
            this.pbCkfh.TabStop = false;
            // 
            // pbJhck
            // 
            this.pbJhck.Image = global::Properties.Resources.format_indent_less;
            this.pbJhck.Location = new System.Drawing.Point(15, 89);
            this.pbJhck.Name = "pbJhck";
            this.pbJhck.Size = new System.Drawing.Size(60, 60);
            this.pbJhck.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pbJhck.TabIndex = 13;
            this.pbJhck.TabStop = false;
            // 
            // pbRksj
            // 
            this.pbRksj.Image = global::Properties.Resources.format_indent_more;
            this.pbRksj.Location = new System.Drawing.Point(161, 3);
            this.pbRksj.Name = "pbRksj";
            this.pbRksj.Size = new System.Drawing.Size(60, 60);
            this.pbRksj.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pbRksj.TabIndex = 14;
            this.pbRksj.TabStop = false;
            this.pbRksj.Click += new System.EventHandler(this.pbRksj_Click);
            // 
            // pbPdgl
            // 
            this.pbPdgl.Image = global::Properties.Resources.go_home;
            this.pbPdgl.Location = new System.Drawing.Point(88, 3);
            this.pbPdgl.Name = "pbPdgl";
            this.pbPdgl.Size = new System.Drawing.Size(60, 60);
            this.pbPdgl.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pbPdgl.TabIndex = 15;
            this.pbPdgl.TabStop = false;
            this.pbPdgl.Click += new System.EventHandler(this.pbPdgl_Click);
            // 
            // pbTmwh
            // 
            this.pbTmwh.Image = global::Properties.Resources.accessories_text_editor;
            this.pbTmwh.Location = new System.Drawing.Point(15, 3);
            this.pbTmwh.Name = "pbTmwh";
            this.pbTmwh.Size = new System.Drawing.Size(60, 60);
            this.pbTmwh.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pbTmwh.TabIndex = 17;
            this.pbTmwh.TabStop = false;
            this.pbTmwh.Click += new System.EventHandler(this.pbTmwh_Click);
            // 
            // FrmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(96F, 96F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            this.ClientSize = new System.Drawing.Size(238, 270);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.pbDd4);
            this.Controls.Add(this.pbDd3);
            this.Controls.Add(this.pbDd2);
            this.Controls.Add(this.pbDd1);
            this.Controls.Add(this.pbCkfh);
            this.Controls.Add(this.pbJhck);
            this.Controls.Add(this.pbRksj);
            this.Controls.Add(this.pbPdgl);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.pbTmwh);
            this.Name = "FrmMain";
            this.Text = "手持终端设备";
            ((System.ComponentModel.ISupportInitialize)(this.pbDd4)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbDd3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbDd2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbDd1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbCkfh)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbJhck)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbRksj)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbPdgl)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbTmwh)).EndInit();
            this.ResumeLayout(false);

        }

        private void pbDd1_Click(object sender, EventArgs e)
        {
            new FrmTmsm().Show();
        }

        private void pbDd1_Click_1(object sender, EventArgs e)
        {
            new ForPositionAdjustment().ShowDialog();
        }

        private void pbDd4_Click(object sender, EventArgs e)
        {
            new FrmJgmManage().ShowDialog();
        }

        private void pbPdgl_Click(object sender, EventArgs e)
        {
            new FrmCheckSelect().Show();
        }

        private void pbRksj_Click(object sender, EventArgs e)
        {
            new Forsupplyno().Show();
        }

        private void pbTmwh_Click(object sender, EventArgs e)
        {
            new ForBarcodeUpdatecs().ShowDialog();
        }
    }
}

