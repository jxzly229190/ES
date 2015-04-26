namespace WindowsMobile
{
    using DataFactory;
    using System;
    using System.ComponentModel;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Windows.Forms;

    public class FrmTest : Form
    {
        private Button button1;
        private Button button2;
        private IContainer components = null;
        private MainMenu mainMenu1;

        public FrmTest()
        {
            this.InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string str = "";
            string result = "";
            str = GetConn.Conn(out result);
            if (string.IsNullOrEmpty(str))
            {
                MessageBox.Show("读取配置文件失败，请重新尝试！错误：" + result);
            }
            MessageBox.Show(str);
            System.Data.SqlClient.SqlConnection connection = new System.Data.SqlClient.SqlConnection(str);
            System.Data.SqlClient.SqlCommand command = new System.Data.SqlClient.SqlCommand();
            try
            {
                command.Connection = connection;
                command.CommandType = CommandType.Text;
                command.CommandText = "select getdate()";
                connection.Open();
                object obj2 = command.ExecuteScalar();
                if (obj2 == null)
                {
                    result = "未查询到结果！";
                }
                else
                {
                    result = obj2.ToString();
                }
                MessageBox.Show(result);
            }
            catch (Exception exception)
            {
                MessageBox.Show(exception.Message);
            }
            finally
            {
                connection.Close();
                command.Dispose();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string text = "";
            System.Data.SqlClient.SqlConnection connection = new System.Data.SqlClient.SqlConnection(@"Data Source=192.168.1.104\jenovo;Initial Catalog=jenovo_ceshi;User ID=jenovo;Password=jenovo;");
            System.Data.SqlClient.SqlCommand command = new System.Data.SqlClient.SqlCommand();
            MessageBox.Show(connection.ConnectionString);
            try
            {
                command.Connection = connection;
                command.CommandType = CommandType.Text;
                command.CommandText = "select getdate()";
                connection.Open();
                object obj2 = command.ExecuteScalar();
                if (obj2 == null)
                {
                    text = "未查询到结果！";
                }
                else
                {
                    text = obj2.ToString();
                }
                MessageBox.Show(text);
            }
            catch (Exception exception)
            {
                MessageBox.Show(exception.Message);
            }
            finally
            {
                connection.Close();
                command.Dispose();
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
            this.button1 = new Button();
            this.button2 = new Button();
            base.SuspendLayout();
            this.button1.Location = new Point(0x54, 0x42);
            this.button1.Name = "button1";
            this.button1.Size = new Size(0x48, 0x31);
            this.button1.TabIndex = 1;
            this.button1.Text = "button1";
            this.button1.Click += new EventHandler(this.button1_Click);
            this.button2.Location = new Point(0x54, 0x98);
            this.button2.Name = "button2";
            this.button2.Size = new Size(0x48, 0x37);
            this.button2.TabIndex = 2;
            this.button2.Text = "button2";
            this.button2.Click += new EventHandler(this.button2_Click);
            base.AutoScaleDimensions = new SizeF(96f, 96f);
            base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            base.ClientSize = new Size(240, 0x126);
            base.Controls.Add(this.button2);
            base.Controls.Add(this.button1);
            base.Menu = this.mainMenu1;
            base.Name = "FrmTest";
            this.Text = "测试窗口";
            base.ResumeLayout(false);
        }
    }
}

