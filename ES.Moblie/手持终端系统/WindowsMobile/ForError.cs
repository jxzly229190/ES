namespace WindowsMobile
{
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Runtime.CompilerServices;
    using System.Windows.Forms;

    public class ForError : Form
    {
        private Button button1;
        private Button button2;
        private IContainer components = null;
        private Label label1;
        public string stuti;
        private TextBox textBox1;

        public event DelCallBack Callback;

        public ForError()
        {
            this.InitializeComponent();
            base.FormBorderStyle = FormBorderStyle.FixedSingle;
            base.MaximizeBox = false;
            base.MinimizeBox = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (Convert.ToDouble(this.textBox1.Text) < 0.0)
            {
                MessageBox.Show("亲，分单数量不能为负数");
            }
            else if (Convert.ToDouble(this.textBox1.Text) > Convert.ToDouble(this.stuti))
            {
                MessageBox.Show("亲，分单的数量不能大于原有的数量");
            }
            else if (this.textBox1.Text == "")
            {
                MessageBox.Show("亲，请输入分单数量");
            }
            else
            {
                try
                {
                    long num = Convert.ToInt64(this.textBox1.Text);
                }
                catch
                {
                    MessageBox.Show("亲,请输入整数");
                    return;
                }
                if (string.IsNullOrEmpty(this.textBox1.Text.Trim()))
                {
                    MessageBox.Show("亲,请输入数量！");
                }
                else if (this.Callback != null)
                {
                    this.Callback(this.textBox1.Text);
                    base.Close();
                }
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
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

        private void ForError_Load(object sender, EventArgs e)
        {
        }

        private void InitializeComponent()
        {
            this.button1 = new Button();
            this.button2 = new Button();
            this.textBox1 = new TextBox();
            this.label1 = new Label();
            base.SuspendLayout();
            this.button1.Location = new Point(12, 0x48);
            this.button1.Name = "button1";
            this.button1.Size = new Size(50, 30);
            this.button1.TabIndex = 1;
            this.button1.Text = "是";
            this.button1.Click += new EventHandler(this.button1_Click);
            this.button2.Location = new Point(0x54, 0x48);
            this.button2.Name = "button2";
            this.button2.Size = new Size(0x35, 30);
            this.button2.TabIndex = 2;
            this.button2.Text = "否";
            this.button2.Click += new EventHandler(this.button2_Click);
            this.textBox1.Location = new Point(12, 0x2b);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new Size(0x7d, 0x17);
            this.textBox1.TabIndex = 3;
            this.label1.ForeColor = Color.Red;
            this.label1.Location = new Point(12, 20);
            this.label1.Name = "label1";
            this.label1.Size = new Size(0x90, 20);
            this.label1.Text = "请输入分单的数量";
            base.AutoScaleDimensions = new SizeF(96f, 96f);
            base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            this.BackColor = Color.Blue;
            base.ClientSize = new Size(0x9f, 0x92);
            base.Controls.Add(this.label1);
            base.Controls.Add(this.textBox1);
            base.Controls.Add(this.button2);
            base.Controls.Add(this.button1);
            this.ForeColor = Color.Red;
            base.Name = "ForError";
            this.Text = "提示";
            base.Load += new EventHandler(this.ForError_Load);
            base.ResumeLayout(false);
        }

        private void label1_ParentChanged(object sender, EventArgs e)
        {
        }
    }
}

