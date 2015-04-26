namespace WindowsMobile
{
    using DataFactory;
    using System;
    using System.ComponentModel;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Windows.Forms;

    public class ForAdjustQuantity : Form
    {
        private string batchno = "";
        private Button button1;
        private string[] check;
        private ComboBox comboBox1;
        private IContainer components = null;
        private string conn;
        private string distractno = "";
        private string goodsid = "";
        private string goodsname = "";
        private string goodsqty = "";
        private string idno = "";
        private Label label1;
        private Label label2;
        private Label label3;
        private Label label4;
        private Label label6;
        private Label label8;
        private Label label9;
        private string lotno = "";
        private string shelfno = "";
        private TextBox textBox1;
        private TextBox texupdatesqty;
        private Label txt;
        private TextBox txtdistractno;
        private TextBox txtgoodsname;
        private TextBox txtgoodsqty;
        private TextBox txtlotno;
        private TextBox txtmubiao;
        private TextBox txtshelfno;
        private User u = new User();
        private string valid_date = "";

        public ForAdjustQuantity(string[] check1)
        {
            this.InitializeComponent();
            this.check = check1;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                double num = Convert.ToDouble(this.texupdatesqty.Text);
            }
            catch
            {
                MessageBox.Show("请输入数字");
                return;
            }
            if (Convert.ToDouble(this.check[7].ToString()) < Convert.ToDouble(this.texupdatesqty.Text.ToString()))
            {
                MessageBox.Show("调整数量不能大于库存数量");
            }
            else
            {
                try
                {
                    string str2;
                    System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                    string sqlstr = "select (goodsqty-awaitqty) as kcqty  from bims_stock_dtl where goodsid='" + this.check[0] + "' and batchno='" + this.check[2] + "' and idno='" + this.check[3] + "' and orgno =dbo.bims_f_sys_ini('1001') and shelfno='" + this.txtshelfno.Text.Trim() + "'";
                    string str4 = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out str2).Tables[0].Rows[0]["kcqty"].ToString();
                    if (Convert.ToDouble(this.texupdatesqty.Text) > Convert.ToDouble(str4))
                    {
                        MessageBox.Show("可出库数量" + str4);
                        MessageBox.Show("调整数量不能大于可出库数量");
                    }
                    else if ((this.texupdatesqty.Text == "") || (Convert.ToDouble(this.texupdatesqty.Text) == 0.0))
                    {
                        MessageBox.Show("调货数量不能为空,或者调货数不能为0");
                    }
                    else if (Convert.ToString(this.txtmubiao.Text.Trim()) == this.txtshelfno.Text.ToString().Trim())
                    {
                        MessageBox.Show("目标货位不能等于原货位");
                    }
                    else
                    {
                        string str5 = "if exists(select * from pub_shelf where shelfno = '" + this.txtmubiao.Text + "') ---判断货位是否存在 并且 2856参数=0\r\n  begin\r\n\r\n\tif dbo.bims_f_sys_ini('2856') <> 0  --2856参数不等于0 则不控制\r\n    begin\r\n\t\tselect '1'\r\n\tend\r\n\telse\r\n\tbegin\r\n\t\tif exists(select * from bims_stock_dtl where shelfno = '" + this.txtmubiao.Text + "' and goodsqty <> 0)  ---判断该货位是否有药品\r\n\t\tbegin\r\n\t\t\tif exists(select zoneno from pub_shelf where shelfno = '" + this.txtmubiao.Text + "' and CHARINDEX(zoneno,(select para from sys_ini where ini = '7100'),0) > 0)  ---判断该货位是否为可混存货位\r\n\t\t\tbegin\r\n\t\t\t\tselect '1'   --如果是则返回1，允许调整\r\n\t\t\tend\r\n\t\t\telse\r\n\t\t\tbegin\r\n\t\t\t\tif exists(select * from bims_stock_dtl a,bims_stock_list b where a.goodsid = b.goodsid and a.batchno = b.batchno and a.idno = b.idno \r\n\t\t\t\t\t\t\t\t\t\t and a.shelfno = '" + this.txtmubiao.Text + "' and a.goodsqty <> 0 and (a.goodsid = '" + this.check[0] + "' and b.lotno = '" + this.check[2] + "' or a.idno='" + this.check[3] + "'))  ---判断目标货位是否有非该商品该批号的商品，有则不允许调\r\n\t\t\t\tbegin\r\n\t\t\t\t\tselect '1'  --如果是则返回1，允许调整！\r\n\t\t\t\tend\r\n\t\t\t\telse\r\n\t\t\t\tbegin\r\n\t\t\t\t\t\r\n                    select '目标货位商品或批号不同，不允许调整！'\r\n\t\t\t\tend\r\n\t\t\t\r\n\t\t\tend\r\n\t\tend\r\n\t\telse\r\n\t\tbegin\r\n\t\t\tselect '1'  --如果是则返回1，允许调整\r\n\t\tend\r\n\tend\r\nend\r\nelse\r\nbegin\r\n\tselect '货位不存在，请重新输入！'\r\nend";
                        string result = "";
                        string text = DbFactory.ExecuteScalar(con, str5, null, null, CommandType.Text, out result);
                        if (text != "1")
                        {
                            MessageBox.Show(text);
                        }
                        else if (MessageBox.Show("亲，确定调整货位吗？调整以后商品的位置就改变了哦！！！", "提示", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1) == DialogResult.Yes)
                        {
                            string str8 = "SHF";
                            string sysUser = this.u.SysUser;
                            string str10 = "1";
                            string str11 = this.textBox1.Text;
                            string str12 = this.textBox1.Text;
                            string str13 = "01";
                            this.goodsid = this.check[0];
                            string str14 = "0";
                            string str15 = this.u.SysUser;
                            string str16 = this.u.SysUser;
                            string str17 = "0";
                            string str18 = "0";
                            string str19 = "0";
                            string str20 = "0";
                            string str21 = this.u.SysUser;
                            string str22 = DateTime.Now.ToString();
                            System.Data.SqlClient.SqlConnection connection = new System.Data.SqlClient.SqlConnection(this.conn);
                            string cmdText = string.Format("INSERT INTO bims_distract_doc ( billcode, distractno, distracter, distracttype, \r\n                            srcorgno, objorgno, paytype, chkflag1, chkflag2, chkflag3, chkflag4, status, createuser, createtime,chker1,chker2 ) \r\n                            values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}')", new object[] { str8, this.distractno, sysUser, str10, this.check[12], str12, str13, str14, str17, str18, str19, str20, str21, str22, str15, str16 });
                            connection.Open();
                            int num2 = new System.Data.SqlClient.SqlCommand(cmdText, connection).ExecuteNonQuery();
                            if (num2 >= 1)
                            {
                                int num3 = new System.Data.SqlClient.SqlCommand(string.Format("INSERT INTO bims_distract_dtl ( distractno, goodsid, batchno, idno, lotno, valid_date, shelfno, \r\n                                    objshelfno, goodsqty, costprice, distractprice, retailprice, rowid,suptax )\r\n                                   values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}',{13})", new object[] { this.distractno, this.goodsid, this.check[2], this.check[3], this.check[4], this.check[5], this.check[6], this.txtmubiao.Text.Trim(), this.texupdatesqty.Text, this.check[10], this.check[9], this.check[8], 1, this.check[11] }), connection).ExecuteNonQuery();
                                if (num3 >= 1)
                                {
                                    string str25 = "update bims_distract_doc set chker1=  '" + this.u.SysUser + "' ,chkflag1 = 1, chker2 ='" + this.u.SysUser + "',status = 1, execdate= '" + str22 + "' WHERE distractno='" + this.distractno + "'";
                                    int num4 = DbFactory.ExecuteNonQuery(connection, str25, null, null, CommandType.Text, out text);
                                    if (((num2 > 0) && (num3 > 0)) && (num4 > 0))
                                    {
                                        MessageBox.Show("亲，货位修改成功，祝您使用愉快！！！");
                                    }
                                    else
                                    {
                                        MessageBox.Show("亲，货位调整未成功，是不是操作有问题！！！");
                                    }
                                    new ForPositionAdjustment().ShowDialog();
                                    base.Close();
                                }
                            }
                        }
                    }
                }
                catch (Exception exception)
                {
                    throw exception;
                }
            }
        }

        private void comboBox1_DataSourceChanged(object sender, EventArgs e)
        {
        }

        private void comboBox1_SelectedValueChanged(object sender, EventArgs e)
        {
            this.txtmubiao.Text = this.comboBox1.Text.ToString();
        }

        public void DateBind()
        {
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
            this.textBox1.Text = this.check[12];
            string result = "";
            string sqlstr = "declare @billno varchar(16)\r\n                                        exec bims_p_skip 'DIS'\r\n                                        select @billno= serialno from bims_f_get_serialno ( 'DIS' ) \r\n                                        select @billno";
            DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
            this.distractno = set.Tables[0].Rows[0][0].ToString();
            string str3 = "";
            string str4 = "select top 100 shelfno from pub_shelf where zoneno in(select zoneno from pub_zone where orgno=dbo.bims_f_sys_ini('1001'))";
            DataSet set2 = DbFactory.ExecuteSet(con, str4, null, null, CommandType.Text, out str3);
            this.comboBox1.DisplayMember = "shelfno";
            this.comboBox1.ValueMember = "shelfno";
            this.comboBox1.DataSource = set2.Tables[0];
            this.txtmubiao.Text = this.comboBox1.Text.ToString();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && (this.components != null))
            {
                this.components.Dispose();
            }
            base.Dispose(disposing);
        }

        private void ForAdjustQuantity_Load(object sender, EventArgs e)
        {
            this.texupdatesqty.Text = this.check[7];
            this.textBox1.Enabled = false;
            this.txtdistractno.Enabled = false;
            this.txtgoodsname.Enabled = false;
            this.txtlotno.Enabled = false;
            this.txtgoodsqty.Enabled = false;
            this.txtshelfno.Enabled = false;
            this.txtgoodsname.Text = this.check[0] + "/" + this.check[1];
            this.txtlotno.Text = this.check[4];
            this.txtgoodsqty.Text = this.check[7];
            this.txtshelfno.Text = this.check[6];
            string result = "";
            this.conn = GetConn.Conn(out result);
            this.DateBind();
        }

        private void InitializeComponent()
        {
            this.label3 = new Label();
            this.txtgoodsname = new TextBox();
            this.label4 = new Label();
            this.txtlotno = new TextBox();
            this.label2 = new Label();
            this.txtdistractno = new TextBox();
            this.label1 = new Label();
            this.label6 = new Label();
            this.txtgoodsqty = new TextBox();
            this.txt = new Label();
            this.txtshelfno = new TextBox();
            this.label8 = new Label();
            this.comboBox1 = new ComboBox();
            this.label9 = new Label();
            this.texupdatesqty = new TextBox();
            this.button1 = new Button();
            this.txtmubiao = new TextBox();
            this.textBox1 = new TextBox();
            base.SuspendLayout();
            this.label3.ForeColor = Color.Blue;
            this.label3.Location = new Point(3, 0x3b);
            this.label3.Name = "label3";
            this.label3.Size = new Size(70, 20);
            this.label3.Text = "商品名称:";
            this.txtgoodsname.Location = new Point(0x54, 0x39);
            this.txtgoodsname.Name = "txtgoodsname";
            this.txtgoodsname.Size = new Size(0x97, 0x17);
            this.txtgoodsname.TabIndex = 5;
            this.label4.ForeColor = Color.Blue;
            this.label4.Location = new Point(3, 0x55);
            this.label4.Name = "label4";
            this.label4.Size = new Size(70, 20);
            this.label4.Text = "批号:";
            this.txtlotno.Location = new Point(0x54, 0x52);
            this.txtlotno.Name = "txtlotno";
            this.txtlotno.Size = new Size(0x97, 0x17);
            this.txtlotno.TabIndex = 7;
            this.label2.ForeColor = Color.Blue;
            this.label2.Location = new Point(3, 0x21);
            this.label2.Name = "label2";
            this.label2.Size = new Size(70, 20);
            this.label2.Text = "调整仓库:";
            this.txtdistractno.Location = new Point(0x54, 6);
            this.txtdistractno.Name = "txtdistractno";
            this.txtdistractno.Size = new Size(0x97, 0x17);
            this.txtdistractno.TabIndex = 1;
            this.txtdistractno.Text = "自动生成";
            this.label1.ForeColor = Color.Blue;
            this.label1.Location = new Point(3, 9);
            this.label1.Name = "label1";
            this.label1.Size = new Size(70, 20);
            this.label1.Text = "调整单号:";
            this.label6.ForeColor = Color.Blue;
            this.label6.Location = new Point(3, 0x6d);
            this.label6.Name = "label6";
            this.label6.Size = new Size(70, 20);
            this.label6.Text = "库存数量:";
            this.txtgoodsqty.Location = new Point(0x54, 0x6b);
            this.txtgoodsqty.Name = "txtgoodsqty";
            this.txtgoodsqty.Size = new Size(0x97, 0x17);
            this.txtgoodsqty.TabIndex = 10;
            this.txt.ForeColor = Color.Blue;
            this.txt.Location = new Point(3, 0x86);
            this.txt.Name = "txt";
            this.txt.Size = new Size(70, 20);
            this.txt.Text = "原货位号:";
            this.txtshelfno.Location = new Point(0x54, 0x84);
            this.txtshelfno.Name = "txtshelfno";
            this.txtshelfno.Size = new Size(0x97, 0x17);
            this.txtshelfno.TabIndex = 12;
            this.label8.ForeColor = Color.Blue;
            this.label8.Location = new Point(3, 0x9f);
            this.label8.Name = "label8";
            this.label8.Size = new Size(70, 20);
            this.label8.Text = "目标货位:";
            this.comboBox1.Location = new Point(0x54, 0x9d);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new Size(0x45, 0x17);
            this.comboBox1.TabIndex = 14;
            this.comboBox1.SelectedValueChanged += new EventHandler(this.comboBox1_SelectedValueChanged);
            this.label9.ForeColor = Color.Blue;
            this.label9.Location = new Point(3, 0xba);
            this.label9.Name = "label9";
            this.label9.Size = new Size(70, 20);
            this.label9.Text = "调整数量:";
            this.texupdatesqty.Location = new Point(0x54, 0xb8);
            this.texupdatesqty.Name = "texupdatesqty";
            this.texupdatesqty.Size = new Size(0x97, 0x17);
            this.texupdatesqty.TabIndex = 0x10;
            this.button1.BackColor = Color.Gainsboro;
            this.button1.ForeColor = Color.Black;
            this.button1.Location = new Point(0x3e, 0xd4);
            this.button1.Name = "button1";
            this.button1.Size = new Size(0x7b, 0x1a);
            this.button1.TabIndex = 0x11;
            this.button1.Text = "调整";
            this.button1.Click += new EventHandler(this.button1_Click);
            this.txtmubiao.Location = new Point(0x9c, 0x9e);
            this.txtmubiao.Name = "txtmubiao";
            this.txtmubiao.Size = new Size(0x4f, 0x17);
            this.txtmubiao.TabIndex = 0x1c;
            this.txtmubiao.TextChanged += new EventHandler(this.txtmubiao_TextChanged);
            this.textBox1.Location = new Point(0x54, 0x20);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new Size(0x97, 0x17);
            this.textBox1.TabIndex = 0x25;
            base.AutoScaleDimensions = new SizeF(96f, 96f);
            base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            this.BackColor = SystemColors.ControlDark;
            base.ClientSize = new Size(0xee, 270);
            base.Controls.Add(this.textBox1);
            base.Controls.Add(this.txtmubiao);
            base.Controls.Add(this.button1);
            base.Controls.Add(this.texupdatesqty);
            base.Controls.Add(this.label9);
            base.Controls.Add(this.comboBox1);
            base.Controls.Add(this.label8);
            base.Controls.Add(this.txtshelfno);
            base.Controls.Add(this.txt);
            base.Controls.Add(this.txtgoodsqty);
            base.Controls.Add(this.label6);
            base.Controls.Add(this.txtdistractno);
            base.Controls.Add(this.label1);
            base.Controls.Add(this.label2);
            base.Controls.Add(this.txtlotno);
            base.Controls.Add(this.label4);
            base.Controls.Add(this.txtgoodsname);
            base.Controls.Add(this.label3);
            base.Name = "ForAdjustQuantity";
            this.Text = "货位调整数";
            base.Load += new EventHandler(this.ForAdjustQuantity_Load);
            base.ResumeLayout(false);
        }

        private void txtmubiao_TextChanged(object sender, EventArgs e)
        {
            this.comboBox1.Text = this.txtmubiao.Text.ToString();
        }
    }
}

