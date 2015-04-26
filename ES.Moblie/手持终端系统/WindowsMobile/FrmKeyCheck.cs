namespace WindowsMobile
{
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;

    public class FrmKeyCheck : Form
    {
        private Button btReturn;
        private IContainer components = null;
        private Label label1;
        private TextBox tbIP;

        public FrmKeyCheck()
        {
            this.InitializeComponent();
        }

        private void btReturn_Click(object sender, EventArgs e)
        {
            new FrmMain().Show();
            base.Close();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && (this.components != null))
            {
                this.components.Dispose();
            }
            base.Dispose(disposing);
        }

        private void FrmSet_Closed(object sender, EventArgs e)
        {
            base.Close();
            Application.Exit();
        }

        private void InitializeComponent()
        {
            ComponentResourceManager manager = new ComponentResourceManager(typeof(FrmKeyCheck));
            this.tbIP = new TextBox();
            this.btReturn = new Button();
            this.label1 = new Label();
            base.SuspendLayout();
            this.tbIP.Location = new Point(10, 0x58);
            this.tbIP.Name = "tbIP";
            this.tbIP.Size = new Size(0xcf, 0x17);
            this.tbIP.TabIndex = 0x13;
            this.tbIP.KeyDown += new KeyEventHandler(this.tbIP_KeyDown);
            this.btReturn.Location = new Point(0x48, 0x83);
            this.btReturn.Name = "btReturn";
            this.btReturn.Size = new Size(0x48, 0x2f);
            this.btReturn.TabIndex = 0x12;
            this.btReturn.Text = "返回";
            this.btReturn.Click += new EventHandler(this.btReturn_Click);
            this.label1.Font = new Font("Tahoma", 16f, FontStyle.Regular);
            this.label1.Location = new Point(10, 11);
            this.label1.Name = "label1";
            this.label1.Size = new Size(0xcf, 0x41);
            this.label1.Text = "请按下按键显示快捷键设置值！";
            base.AutoScaleDimensions = new SizeF(96f, 96f);
            base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            base.ClientSize = new Size(0xe4, 0x109);
            base.Controls.Add(this.tbIP);
            base.Controls.Add(this.btReturn);
            base.Controls.Add(this.label1);
            base.Icon = (Icon) manager.GetObject("$this.Icon");
            base.Name = "FrmKeyCheck";
            this.Text = "数据库设置";
            base.ResumeLayout(false);
        }

        private void tbIP_KeyDown(object sender, KeyEventArgs e)
        {
            this.tbIP.Text = e.KeyCode.ToString();
        }
    }
}

