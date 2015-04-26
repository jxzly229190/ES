namespace WindowsMobile
{
    using DataFactory;
    using System;
    using System.ComponentModel;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Windows.Forms;

    public class supplyaudit : Form
    {
        private string boto = "";
        private Button button1;
        private Button button2;
        private Button button3;
        private Button button4;
        private Button button5;
        private Button button6;
        private Button button7;
        private IContainer components = null;
        private string conn;
        private System.Windows.Forms.DataGrid datasupply;
        public string[] goods = new string[6];
        private string goodsqty = "";
        private string hanbarcode = "";
        private string hangoodsid = "";
        private string idno = "";
        private Label label1;
        private Label label2;
        private Label label3;
        private Label label4;
        private Label label5;
        private Label label6;
        private Label label7;
        private string shelfno = "";
        private string shuliang = "";
        public string supplyno;
        private Label txtBarcode;
        private TextBox txtcode;
        private TextBox txtdatatim;
        private TextBox txtgoodsname;
        private TextBox txtgoodsunit;
        private TextBox txtlotdate;
        private TextBox txtlotno;
        private TextBox txtnumber;
        private TextBox txtshelfno;
        private User u = new User();
        private string update = "";

        public supplyaudit()
        {
            this.InitializeComponent();
        }

        public void BindData(string supplyno1)
        {
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
            string sqlstr = "\r\n               SELECt case when  a.whl_idno   IS null  then '未验收' else '已验收' end  as '状态' ,a.goodsqty as '入库数量' ,\r\n               a.lotno as '批号' ,   a.valid_date  as '有效日期' ,b.goodsname as '商品名称',\r\n               b.goodsspec as '规格', b.producer as '生产企业', b.goodsid as '商品编码',\r\n               a.lot_date as '生产日期', b.barcode as '商品条码',  a.idno as '行号', a.shelfno as 货号,b.goodsunit as 单位\r\n               from bims_supply_dtl a left join bims_goods b on a.goodsid=b.goodsid \r\n               where a.supplyno='" + supplyno1 + "'";
            string result = "";
            DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
            if ((set != null) && (set.Tables[0].Rows.Count > 0))
            {
                this.datasupply.DataSource = set.Tables[0];
            }
            else
            {
                MessageBox.Show("没有入库记录");
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.boto = this.txtlotno.Text;
            string str = "oneupdate";
            this.update = "update";
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
            string result = "";
            string sqlstr = "\r\n               SELECt case when  a.whl_idno   IS null  then '未验收' else '已验收' end  as '状态' ,a.goodsqty as '入库数量' ,\r\n               a.lotno as '批号' ,   a.valid_date  as '有效日期' ,b.goodsname as '商品名称',\r\n               b.goodsspec as '规格', b.producer as '生产企业', b.goodsid as '商品编码',\r\n               a.lot_date as '生产日期', b.barcode as '商品条码',  a.idno as '行号', a.shelfno as 货号,b.goodsunit as 单位\r\n               from bims_supply_dtl a left join bims_goods b on a.goodsid=b.goodsid \r\n               where a.supplyno='" + this.supplyno + "' and a.whl_idno =1 and a.goodsid ='" + this.hangoodsid + "'";
            DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
            if ((set != null) && (set.Tables[0].Rows.Count > 0))
            {
                switch (MessageBox.Show("亲，已经验收过了！！确定修改该行记录吗？", "提示", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1))
                {
                    case DialogResult.Yes:
                        this.update = "update";
                        this.txtshelfno.Enabled = true;
                        this.txtnumber.Enabled = true;
                        this.txtlotno.Enabled = true;
                        this.txtdatatim.Enabled = true;
                        this.txtlotdate.Enabled = true;
                        break;

                    case DialogResult.No:
                        this.txtshelfno.Enabled = false;
                        this.txtnumber.Enabled = false;
                        this.txtlotno.Enabled = false;
                        this.txtdatatim.Enabled = false;
                        this.txtlotdate.Enabled = false;
                        this.update = "";
                        break;
                }
            }
            if ((str == "oneupdate") && (this.update == "update"))
            {
                this.txtshelfno.Enabled = true;
                this.txtnumber.Enabled = true;
                this.txtlotno.Enabled = true;
                this.txtdatatim.Enabled = true;
                this.txtlotdate.Enabled = true;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string str14;
            string str15;
            System.Data.SqlClient.SqlConnection connection3;
            string str25;
            string text = this.txtlotno.Text;
            if (this.boto != text)
            {
                string str2 = "";
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                string result = "";
                string sqlstr = " select orgno from pub_organ where orgno=dbo.bims_f_sys_ini('1001')";
                DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
                if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
                {
                    str2 = set.Tables[0].Rows[0][0].ToString();
                }
                string str5 = "";
                User user = new User();
                string str6 = "";
                string str7 = "SUP";
                string supplyno = this.supplyno;
                string hangoodsid = this.hangoodsid;
                string str10 = this.txtshelfno.Text.Trim();
                string sysUser = user.SysUser;
                string str12 = this.txtlotno.Text.Trim();
                string str13 = "select dbo.bims_f_get_default_shelf(@orgno,@goodsid,@lotno)";
                System.Data.SqlClient.SqlParameter[] param = new System.Data.SqlClient.SqlParameter[] { new System.Data.SqlClient.SqlParameter("@orgno", str2.Trim()), new System.Data.SqlClient.SqlParameter("@goodsid", this.hangoodsid.Trim()), new System.Data.SqlClient.SqlParameter("@lotno", this.txtlotno.Text.Trim()) };
                DataSet set2 = DbFactory.ExecuteSet(con, str13, param, null, CommandType.Text, out str14);
                this.txtshelfno.Text = set2.Tables[0].Rows[0][0].ToString();
                str5 = set2.Tables[0].Rows[0][0].ToString();
                MessageBox.Show(set2.Tables[0].Rows[0][0].ToString());
                string str16 = string.Format("insert into bims_shelf_used (handle,billcode,billno,goodsid,shelfno,createuser,lotno) values('{0}','{1}','{2}','{3}','{4}','{5}','{6}')", new object[] { str6, str7, supplyno, hangoodsid, set2.Tables[0].Rows[0][0].ToString(), sysUser, str12 });
                if (DbFactory.ExecuteNonQuery(con, str16, null, null, CommandType.Text, out str15) < 0)
                {
                    MessageBox.Show(str15);
                }
                this.boto = this.txtlotno.Text;
            }
            string str17 = "";
            string str18 = "";
            string str19 = this.txtnumber.Text;
            string str20 = this.txtlotno.Text;
            string str21 = this.txtshelfno.Text;
            str17 = this.txtdatatim.Text;
            str18 = this.txtlotdate.Text;
            try
            {
                if (Convert.ToDateTime(this.txtlotdate.Text) > DateTime.Now)
                {
                    MessageBox.Show("生产日期不能大于当前时间");
                    return;
                }
                str18 = this.txtlotdate.Text;
            }
            catch
            {
                try
                {
                    if (Convert.ToDateTime(str18.Substring(0, 4) + "-" + str18.Substring(4, 2) + "-" + str18.Substring(6, 2)) > DateTime.Now)
                    {
                        MessageBox.Show("生产日期不能大于当前时间");
                        return;
                    }
                }
                catch
                {
                    MessageBox.Show("请输入日期格式");
                    return;
                }
            }
            try
            {
                if (Convert.ToDateTime(this.txtdatatim.Text) < DateTime.Now)
                {
                    MessageBox.Show("日期不能小于当前时间");
                    return;
                }
                str17 = this.txtdatatim.Text;
            }
            catch
            {
                try
                {
                    if (Convert.ToDateTime(str17.Substring(0, 4) + "-" + str17.Substring(4, 2) + "-" + str17.Substring(6, 2)) < DateTime.Now)
                    {
                        MessageBox.Show("不能小于当前时间");
                        return;
                    }
                }
                catch
                {
                    MessageBox.Show("请输入日期格式");
                    return;
                }
            }
            if (str20 == "")
            {
                MessageBox.Show("批号不能为空");
            }
            if (this.update == "update")
            {
                if (MessageBox.Show("亲，确定要修改吗？", "提示", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1) == DialogResult.Yes)
                {
                    System.Data.SqlClient.SqlConnection connection2 = new System.Data.SqlClient.SqlConnection(this.conn);
                    str15 = "";
                    string str24 = "select shelfno from pub_shelf where zoneno in(select zoneno from pub_zone where orgno=dbo.bims_f_sys_ini('1001'))  and shelfno='" + this.txtshelfno.Text.ToString().Trim() + "'";
                    DataSet set3 = DbFactory.ExecuteSet(connection2, str24, null, null, CommandType.Text, out str15);
                    if ((set3.Tables.Count <= 0) || (set3.Tables[0].Rows.Count <= 0))
                    {
                        MessageBox.Show("您输入的货位号不存在");
                        return;
                    }
                    connection3 = new System.Data.SqlClient.SqlConnection(this.conn);
                    str25 = "UPDATE bims_supply_dtl SET goodsqty= '" + str19 + "',lotno='" + str20 + "',valid_date='" + str17 + "',shelfno='" + str21 + "',whl_idno=1,lot_date='" + this.txtlotdate.Text + "'  where  supplyno ='" + this.supplyno + "' and idno='" + this.idno + "'";
                    str14 = "";
                    if (DbFactory.ExecuteNonQuery(connection3, str25, null, null, CommandType.Text, out str14) >= 0)
                    {
                        if (this.update == "update")
                        {
                            MessageBox.Show("亲，修改成功，祝您使用愉快");
                            this.BindData(this.supplyno);
                        }
                        this.BindData(this.supplyno);
                    }
                    else
                    {
                        MessageBox.Show("亲，修改失败，是不是您操作上有错误！！！");
                    }
                }
            }
            else
            {
                connection3 = new System.Data.SqlClient.SqlConnection(this.conn);
                str25 = "UPDATE bims_supply_dtl SET goodsqty= '" + str19 + "',lotno='" + str20 + "',valid_date='" + str17 + "',shelfno='" + str21 + "',whl_idno=1  where  supplyno ='" + this.supplyno + "' and idno='" + this.idno + "'";
                str14 = "";
                if (DbFactory.ExecuteNonQuery(connection3, str25, null, null, CommandType.Text, out str14) >= 0)
                {
                    this.BindData(this.supplyno);
                }
                else
                {
                    MessageBox.Show("验收失败");
                }
            }
            this.txtnumber.Enabled = false;
            this.txtlotno.Enabled = false;
            this.txtdatatim.Enabled = false;
            this.txtshelfno.Enabled = false;
            this.txtlotdate.Enabled = false;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
            string result = "";
            string sqlstr = "\r\n             SELECt case when  a.whl_idno   IS null  then '未验收' else '已验收' end  as '状态' ,a.goodsqty as '入库数量' ,\r\n               a.lotno as '批号' ,   a.valid_date  as '有效日期' ,b.goodsname as '商品名称',\r\n               b.goodsspec as '规格', b.producer as '生产企业', b.goodsid as '商品编码',\r\n               a.lot_date as '生产日期', b.barcode as '商品条码',  a.idno as '行号', a.shelfno as 货号,b.goodsunit as 单位\r\n               from bims_supply_dtl a left join bims_goods b on a.goodsid=b.goodsid \r\n               where a.supplyno='" + this.supplyno + "' and a.whl_idno is null ";
            DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
            if ((set != null) && (set.Tables[0].Rows.Count > 0))
            {
                MessageBox.Show("有未验收的商品");
                this.datasupply.DataSource = set.Tables[0];
            }
            else if (MessageBox.Show("亲，确定审核吗？审核以后数据就不能修改了！！！", "提示", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1) == DialogResult.Yes)
            {
                System.Data.SqlClient.SqlConnection connection2 = new System.Data.SqlClient.SqlConnection(this.conn);
                string str3 = "";
                string str4 = "update bims_supply_doc set chkflag1=1,supplyer=" + this.u.SysUser + ",chker1='" + this.u.SysUser + "'where supplyno='" + this.supplyno + "'";
                if (DbFactory.ExecuteNonQuery(connection2, str4, null, null, CommandType.Text, out str3) > 0)
                {
                    MessageBox.Show("亲，审核成功，祝您使用愉快");
                    base.Close();
                }
                else
                {
                    MessageBox.Show("亲，审核失败，是不是操作上有失误");
                }
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            string text = this.txtcode.Text;
            string sqlstr = "\r\n                     SELECt case when  a.whl_idno   IS null  then '未验收' else '已验收' end  as '状态' ,a.goodsqty as '入库数量' ,\r\n               a.lotno as '批号' ,   a.valid_date  as '有效日期' ,b.goodsname as '商品名称',\r\n               b.goodsspec as '规格', b.producer as '生产企业', b.goodsid as '商品编码',\r\n               a.lot_date as '生产日期', b.barcode as '商品条码',  a.idno as '行号', a.shelfno as 货号,b.goodsunit as 单位\r\n               from bims_supply_dtl a left join bims_goods b on a.goodsid=b.goodsid  \r\n               where a.supplyno='" + this.supplyno + "'";
            if (text == "")
            {
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                string result = "";
                DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
                if ((set != null) && (set.Tables[0].Rows.Count > 0))
                {
                    this.datasupply.DataSource = set.Tables[0];
                }
                else
                {
                    this.datasupply.DataSource = null;
                    MessageBox.Show("没有入库记录");
                }
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("亲，确定要修改吗？", "提示", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1) == DialogResult.Yes)
            {
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                string result = "";
                string sqlstr = "select * from  bims_supply_dtl where supplyno= '" + this.supplyno + "' and whl_idno =1";
                DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
                if (((set == null) || (set.Tables.Count <= 0)) || (set.Tables[0].Rows.Count <= 0))
                {
                    MessageBox.Show("没有已经验收的记录不能分单");
                }
                else
                {
                    User user = new User();
                    string str3 = "";
                    string str4 = "";
                    string str5 = "declare @billno varchar(16)\r\n                                        exec bims_p_skip 'SUP'\r\n                                        select @billno= serialno from bims_f_get_serialno ( 'SUP' ) \r\n                                        select @billno";
                    str3 = DbFactory.ExecuteSet(con, str5, null, null, CommandType.Text, out str4).Tables[0].Rows[0][0].ToString();
                    string str6 = "";
                    string str7 = "";
                    string str8 = "01";
                    string str9 = user.SysUser.ToString();
                    DateTime now = DateTime.Now;
                    string str10 = "select orgno,companyno from bims_supply_doc where supplyno='" + this.supplyno + "'";
                    string str11 = "";
                    DataSet set3 = DbFactory.ExecuteSet(con, str10, null, null, CommandType.Text, out str11);
                    if (((set3 != null) && (set3.Tables.Count > 0)) && (set3.Tables[0].Rows.Count > 0))
                    {
                        str6 = set3.Tables[0].Rows[0]["orgno"].ToString();
                        str7 = set3.Tables[0].Rows[0]["companyno"].ToString();
                        string str12 = "SUP";
                        string str13 = "";
                        string str14 = string.Format("INSERT INTO bims_supply_doc ( billcode, supplyno, orgno, companyno, paytype, supplyer, chkflag1, chkflag2, chkflag3, chkflag4, status, supplytype, createuser, createtime ) VALUES\r\n                                          ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}')", new object[] { str12, str3, str6, str7, str8, user.SysUser, 0, 0, 0, 0, 0, 1, str9, now });
                        if (DbFactory.ExecuteNonQuery(con, str14, null, null, CommandType.Text, out str13) >= 0)
                        {
                            string str15 = "";
                            string str16 = "\r\n                                if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb..#tempzd') and type='U')   \r\n                                 begin \r\n                                   drop table #tempzd\r\n                                end     \r\n                              select " + str3 + "  as supplyno, idno, direct, goodsid, shelfno, goodsqty, costprice, costpriceo, suptax, lotno, maxqty, midqty, rowid, orderprice, orderqty, src_qty, flag1, flag2, retprice, distractprice, retailprice,indentno ,valid_date ,lot_date into #tempzd  from    bims_supply_dtl where whl_idno=1 and supplyno='" + this.supplyno + "'  insert into bims_supply_dtl (supplyno, idno, direct, goodsid, shelfno, goodsqty, costprice, costpriceo, suptax, lotno, maxqty, midqty, rowid, orderprice, orderqty, src_qty, flag1, flag2, retprice, distractprice, retailprice,indentno,valid_date ,lot_date)  select *from #tempzd  update bims_supply_doc set chkflag1=1 ,supplyer='" + user.SysUser + "', chker1='" + user.SysUser + "' where supplyno='" + str3 + "'";
                            if (DbFactory.ExecuteNonQuery(con, str16, null, null, CommandType.Text, out str15) >= 0)
                            {
                                string str17 = "";
                                string str18 = "delete bims_supply_dtl where supplyno= '" + this.supplyno + "' and whl_idno =1";
                                if (DbFactory.ExecuteNonQuery(con, str18, null, null, CommandType.Text, out str17) > 0)
                                {
                                    MessageBox.Show("亲，分单成功，祝您使用愉快，新单号为" + str3 + "请注意查收");
                                    this.BindData(this.supplyno);
                                }
                            }
                            else
                            {
                                MessageBox.Show("分单失败", str15);
                            }
                        }
                        else
                        {
                            MessageBox.Show("亲，分单失败");
                        }
                    }
                    else
                    {
                        MessageBox.Show("没有数据");
                    }
                }
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            User user = new User();
            ForError error = new ForError {
                stuti = this.goodsqty
            };
            error.Callback += new DelCallBack(this.frm_CallBack);
            error.ShowDialog();
            if (this.shuliang != "")
            {
                string result = "";
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                int num = Convert.ToInt32(this.shuliang);
                string sqlstr = string.Concat(new object[] { 
                    "declare @count int\r\n                             select @count=count(*)+10 from bims_supply_dtl where supplyno='", this.supplyno, "'\r\n                            if exists (select * from tempdb.dbo.sysobjects where id = object_id(N'tempdb..#tempzdcount') and type='U')   \r\n                                 begin \r\n                                   drop table #tempzdcount\r\n                                end  \r\n                             select  supplyno,  @count  as idno, direct, goodsid, shelfno, '", this.shuliang, "' as goodsqty  , costprice, costpriceo, suptax, lotno, maxqty, midqty, rowid, orderprice, orderqty, src_qty, flag1, flag2, retprice, distractprice, retailprice,indentno ,valid_date ,lot_date into #tempzdcount  from    bims_supply_dtl where idno=", this.idno, " and supplyno='", this.supplyno, "' and goodsid='", this.hangoodsid, "'\r\n                                insert into bims_supply_dtl (supplyno, idno, direct, goodsid, shelfno, goodsqty, costprice, costpriceo, suptax, lotno, maxqty, midqty, rowid, orderprice, orderqty, src_qty, flag1, flag2, retprice, distractprice, retailprice,indentno,valid_date ,lot_date)  select *from #tempzdcount  update bims_supply_dtl set  goodsqty=goodsqty-", num, " where supplyno='", this.supplyno, "'  and idno='", this.idno, 
                    "' and goodsid='", this.hangoodsid, "'"
                 });
                MessageBox.Show("亲，分单数量为" + num);
                if (DbFactory.ExecuteNonQuery(con, sqlstr, null, null, CommandType.Text, out result) >= 0)
                {
                    MessageBox.Show("亲，分单成功，祝您使用愉快=-=！！！");
                    this.BindData(this.supplyno);
                }
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
            string text = this.txtshelfno.Text;
            string sqlstr = "if exists (select * from bims_shelf_used where shelfno='" + text + "') begin select '1' end";
            string result = "";
            if (DbFactory.ExecuteScalar(con, sqlstr, null, null, CommandType.Text, out result) == "1")
            {
                MessageBox.Show(text + "货位被暂用");
            }
            else
            {
                MessageBox.Show(text + "货位空闲");
            }
        }

        private void datasupply_CurrentCellChanged(object sender, EventArgs e)
        {
            if (this.datasupply.CurrentRowIndex >= 0)
            {
                this.button1.Enabled = true;
                this.button2.Enabled = true;
                this.button3.Enabled = true;
                this.button5.Enabled = true;
                this.button6.Enabled = true;
                this.txtgoodsname.Text = this.datasupply[this.datasupply.CurrentRowIndex, 7].ToString() + "/" + this.datasupply[this.datasupply.CurrentRowIndex, 4].ToString() + "/" + this.datasupply[this.datasupply.CurrentRowIndex, 5].ToString();
                this.goodsqty = this.datasupply[this.datasupply.CurrentRowIndex, 1].ToString();
                this.txtnumber.Text = this.datasupply[this.datasupply.CurrentRowIndex, 1].ToString();
                this.txtlotno.Text = this.datasupply[this.datasupply.CurrentRowIndex, 2].ToString();
                this.txtdatatim.Text = this.datasupply[this.datasupply.CurrentRowIndex, 3].ToString();
                this.hanbarcode = this.datasupply[this.datasupply.CurrentRowIndex, 9].ToString();
                this.hangoodsid = this.datasupply[this.datasupply.CurrentRowIndex, 7].ToString();
                this.idno = this.datasupply[this.datasupply.CurrentRowIndex, 10].ToString();
                this.shelfno = this.datasupply[this.datasupply.CurrentRowIndex, 11].ToString();
                this.txtshelfno.Text = this.datasupply[this.datasupply.CurrentRowIndex, 11].ToString();
                this.txtlotdate.Text = this.datasupply[this.datasupply.CurrentRowIndex, 8].ToString();
                this.txtgoodsunit.Text = this.datasupply[this.datasupply.CurrentRowIndex, 12].ToString();
                this.boto = this.txtlotno.Text;
            }
            else
            {
                MessageBox.Show("请选择行");
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

        private void frm_CallBack(string StrText)
        {
            this.shuliang = StrText;
        }

        private void InitializeComponent()
        {
            this.txtBarcode = new Label();
            this.txtcode = new TextBox();
            this.datasupply = new System.Windows.Forms.DataGrid();
            this.label1 = new Label();
            this.txtnumber = new TextBox();
            this.label2 = new Label();
            this.txtlotno = new TextBox();
            this.label3 = new Label();
            this.txtdatatim = new TextBox();
            this.button1 = new Button();
            this.button2 = new Button();
            this.button3 = new Button();
            this.button4 = new Button();
            this.label4 = new Label();
            this.txtgoodsname = new TextBox();
            this.label5 = new Label();
            this.txtshelfno = new TextBox();
            this.label6 = new Label();
            this.txtlotdate = new TextBox();
            this.button5 = new Button();
            this.button6 = new Button();
            this.label7 = new Label();
            this.txtgoodsunit = new TextBox();
            this.button7 = new Button();
            base.SuspendLayout();
            this.txtBarcode.ForeColor = Color.Blue;
            this.txtBarcode.Location = new Point(3, 4);
            this.txtBarcode.Name = "txtBarcode";
            this.txtBarcode.Size = new Size(40, 20);
            this.txtBarcode.Text = "扫描:";
            this.txtcode.Location = new Point(0x2e, 1);
            this.txtcode.Name = "txtcode";
            this.txtcode.Size = new Size(0xbd, 0x17);
            this.txtcode.TabIndex = 3;
            this.txtcode.KeyPress += new KeyPressEventHandler(this.txtcode_KeyPress);
            this.datasupply.BackgroundColor=Color.FromArgb(0x40, 0x40, 0x40);
            this.datasupply.ForeColor = Color.Blue;
            this.datasupply.Location = new Point(3, 50);
            this.datasupply.Name = "datasupply";
            this.datasupply.SelectionBackColor = Color.Red;
            this.datasupply.SelectionForeColor = Color.FromArgb(0, 0x80, 0xff);
            this.datasupply.Size = new Size(0xe8, 100);
            this.datasupply.TabIndex = 4;
            this.datasupply.CurrentCellChanged += new EventHandler(this.datasupply_CurrentCellChanged);
            this.label1.ForeColor = Color.Blue;
            this.label1.Location = new Point(3, 0xdf);
            this.label1.Name = "label1";
            this.label1.Size = new Size(40, 0x15);
            this.label1.Text = "数量:";
            this.txtnumber.Location = new Point(0x2b, 220);
            this.txtnumber.Name = "txtnumber";
            this.txtnumber.Size = new Size(70, 0x17);
            this.txtnumber.TabIndex = 7;
            this.label2.ForeColor = Color.Blue;
            this.label2.Location = new Point(0x7c, 0xdf);
            this.label2.Name = "label2";
            this.label2.Size = new Size(40, 0x15);
            this.label2.Text = "批号:";
            this.txtlotno.Location = new Point(0xa4, 220);
            this.txtlotno.Name = "txtlotno";
            this.txtlotno.Size = new Size(70, 0x17);
            this.txtlotno.TabIndex = 12;
            this.label3.ForeColor = Color.Blue;
            this.label3.Location = new Point(0x7c, 0xc7);
            this.label3.Name = "label3";
            this.label3.Size = new Size(40, 0x15);
            this.label3.Text = "效期:";
            this.txtdatatim.Location = new Point(0xa4, 0xc5);
            this.txtdatatim.Name = "txtdatatim";
            this.txtdatatim.Size = new Size(70, 0x17);
            this.txtdatatim.TabIndex = 14;
            this.txtdatatim.LostFocus += new EventHandler(this.txtdatatim_LostFocus);
            this.button1.BackColor = Color.LightGray;
            this.button1.Location = new Point(2, 0xf3);
            this.button1.Name = "button1";
            this.button1.Size = new Size(0x2c, 0x1a);
            this.button1.TabIndex = 15;
            this.button1.Text = "修改";
            this.button1.Click += new EventHandler(this.button1_Click);
            this.button2.BackColor = Color.LightGray;
            this.button2.Location = new Point(0x30, 0xf3);
            this.button2.Name = "button2";
            this.button2.Size = new Size(0x2c, 0x1a);
            this.button2.TabIndex = 0x10;
            this.button2.Text = "验收";
            this.button2.Click += new EventHandler(this.button2_Click);
            this.button3.BackColor = Color.LightGray;
            this.button3.Location = new Point(0x5f, 0xf3);
            this.button3.Name = "button3";
            this.button3.Size = new Size(0x2c, 0x1a);
            this.button3.TabIndex = 0x11;
            this.button3.Text = "审核";
            this.button3.Click += new EventHandler(this.button3_Click);
            this.button4.BackColor = Color.Silver;
            this.button4.Location = new Point(0xad, 0x18);
            this.button4.Name = "button4";
            this.button4.Size = new Size(0x3a, 0x19);
            this.button4.TabIndex = 0x12;
            this.button4.Text = "查询";
            this.button4.Click += new EventHandler(this.button4_Click);
            this.label4.ForeColor = Color.Blue;
            this.label4.Location = new Point(3, 0x9a);
            this.label4.Name = "label4";
            this.label4.Size = new Size(80, 20);
            this.label4.Text = "商品名称:";
            this.txtgoodsname.Location = new Point(0x4d, 0x97);
            this.txtgoodsname.Name = "txtgoodsname";
            this.txtgoodsname.Size = new Size(0x9e, 0x17);
            this.txtgoodsname.TabIndex = 0x18;
            this.label5.ForeColor = Color.Blue;
            this.label5.Location = new Point(3, 0xc7);
            this.label5.Name = "label5";
            this.label5.Size = new Size(40, 0x15);
            this.label5.Text = "货号:";
            this.txtshelfno.Location = new Point(0x2b, 0xc5);
            this.txtshelfno.Name = "txtshelfno";
            this.txtshelfno.Size = new Size(70, 0x17);
            this.txtshelfno.TabIndex = 0x1f;
            this.label6.ForeColor = Color.Blue;
            this.label6.Location = new Point(3, 0xb0);
            this.label6.Name = "label6";
            this.label6.Size = new Size(40, 0x15);
            this.label6.Text = "产期:";
            this.txtlotdate.Location = new Point(0x2b, 0xae);
            this.txtlotdate.Name = "txtlotdate";
            this.txtlotdate.Size = new Size(70, 0x17);
            this.txtlotdate.TabIndex = 0x27;
            this.button5.Location = new Point(0x8e, 0xf3);
            this.button5.Name = "button5";
            this.button5.Size = new Size(0x2c, 0x1a);
            this.button5.TabIndex = 0x2f;
            this.button5.Text = "分单";
            this.button5.Click += new EventHandler(this.button5_Click);
            this.button6.Location = new Point(190, 0xf3);
            this.button6.Name = "button6";
            this.button6.Size = new Size(0x2c, 0x1a);
            this.button6.TabIndex = 0x37;
            this.button6.Text = "拆分";
            this.button6.Click += new EventHandler(this.button6_Click);
            this.label7.ForeColor = Color.Blue;
            this.label7.Location = new Point(0x7c, 0xb0);
            this.label7.Name = "label7";
            this.label7.Size = new Size(40, 0x15);
            this.label7.Text = "单位:";
            this.txtgoodsunit.Location = new Point(0xa4, 0xae);
            this.txtgoodsunit.Name = "txtgoodsunit";
            this.txtgoodsunit.Size = new Size(70, 0x17);
            this.txtgoodsunit.TabIndex = 0x40;
            this.button7.Location = new Point(0x6b, 0x18);
            this.button7.Name = "button7";
            this.button7.Size = new Size(0x3b, 0x19);
            this.button7.TabIndex = 0x49;
            this.button7.Text = "货位";
            this.button7.Click += new EventHandler(this.button7_Click);
            base.AutoScaleDimensions = new SizeF(96f, 96f);
            base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            this.BackColor = SystemColors.ControlDark;
            base.ClientSize = new Size(0xee, 270);
            base.Controls.Add(this.button7);
            base.Controls.Add(this.txtgoodsunit);
            base.Controls.Add(this.label7);
            base.Controls.Add(this.button6);
            base.Controls.Add(this.button5);
            base.Controls.Add(this.txtlotdate);
            base.Controls.Add(this.label6);
            base.Controls.Add(this.txtshelfno);
            base.Controls.Add(this.label5);
            base.Controls.Add(this.txtgoodsname);
            base.Controls.Add(this.label4);
            base.Controls.Add(this.button4);
            base.Controls.Add(this.button3);
            base.Controls.Add(this.button2);
            base.Controls.Add(this.button1);
            base.Controls.Add(this.txtdatatim);
            base.Controls.Add(this.label3);
            base.Controls.Add(this.txtlotno);
            base.Controls.Add(this.label2);
            base.Controls.Add(this.txtnumber);
            base.Controls.Add(this.label1);
            base.Controls.Add(this.datasupply);
            base.Controls.Add(this.txtcode);
            base.Controls.Add(this.txtBarcode);
            base.Name = "supplyaudit";
            this.Text = "入库审核";
            base.Load += new EventHandler(this.supplyaudit_Load);
            base.ResumeLayout(false);
        }

        public void selectshenhe()
        {
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
            string sqlstr = "\r\n               select * from bims_supply_doc a inner join bims_supply_dtl  b on \r\n                a.supplyno= b.supplyno where a.chkflag1=0 and supplyno='" + this.supplyno + "'";
            string result = "";
            DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
            this.datasupply.DataSource = set.Tables[0];
        }

        private void supplyaudit_Load(object sender, EventArgs e)
        {
            string result = "";
            this.txtgoodsunit.Enabled = false;
            this.txtlotdate.Enabled = false;
            this.txtgoodsname.Enabled = false;
            this.txtnumber.Enabled = false;
            this.txtlotno.Enabled = false;
            this.txtdatatim.Enabled = false;
            this.txtshelfno.Enabled = false;
            this.button1.Enabled = false;
            this.button2.Enabled = false;
            this.button3.Enabled = false;
            this.button5.Enabled = false;
            this.button6.Enabled = false;
            this.conn = GetConn.Conn(out result);
            if (string.IsNullOrEmpty(this.conn))
            {
                MessageBox.Show("读取配置文件失败，请重新尝试！错误：" + result);
            }
            else
            {
                this.BindData(this.supplyno);
            }
        }

        private void txtcode_KeyPress(object sender, KeyPressEventArgs e)
        {
            string str = "";
            if (e.KeyChar == '\r')
            {
                string result = "";
                System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(this.conn);
                if (string.IsNullOrEmpty(this.txtcode.Text.Trim()))
                {
                    MessageBox.Show("请扫描条形码！");
                }
                else
                {
                    string str4 = this.txtcode.Text.Trim();
                    this.txtcode.Text = "";
                    string sqlstr = "declare @orgno varchar(10) set @orgno = dbo.bims_f_sys_ini('1001') execute dbo.bims_p_select_goods_zdy  @orgno,'" + str4 + "'";
                    DataSet set = DbFactory.ExecuteSet(con, sqlstr, null, null, CommandType.Text, out result);
                    if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
                    {
                        if (set.Tables[0].Rows.Count == 1)
                        {
                            str = set.Tables[0].Rows[0][0].ToString().Trim();
                            System.Data.SqlClient.SqlConnection connection2 = new System.Data.SqlClient.SqlConnection(this.conn);
                            string str5 = " SELECt case when  a.whl_idno   IS null  then '未验收' else '已验收' end  as '状态' ,a.goodsqty as '入库数量' ,\r\n               a.lotno as '批号' ,   a.valid_date  as '有效日期' ,b.goodsname as '商品名称',\r\n               b.goodsspec as '规格', b.producer as '生产企业', b.goodsid as '商品编码',\r\n               a.lot_date as '生产日期', b.barcode as '商品条码',  a.idno as '行号', a.shelfno as 货号,b.goodsunit as 单位\r\n               from bims_supply_dtl a left join bims_goods b on a.goodsid=b.goodsid   \r\n                 where a.supplyno='" + this.supplyno + "' and b.goodsid='" + str + "'";
                            DataSet set2 = DbFactory.ExecuteSet(connection2, str5, null, null, CommandType.Text, out result);
                            if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
                            {
                                this.datasupply.DataSource = set2.Tables[0];
                            }
                            else
                            {
                                MessageBox.Show("亲,此商品没有库存");
                            }
                        }
                        else
                        {
                            FrmGoodsSelect select = new FrmGoodsSelect(set.Tables[0], this.goods);
                            if ((select.ShowDialog() == DialogResult.OK) && !string.IsNullOrEmpty(this.goods[0]))
                            {
                                str = this.goods[0];
                                System.Data.SqlClient.SqlConnection connection3 = new System.Data.SqlClient.SqlConnection(this.conn);
                                string str6 = "SELECt case when  a.whl_idno   IS null  then '未验收' else '已验收' end  as '状态' ,a.goodsqty as '入库数量' ,\r\n               a.lotno as '批号' ,   a.valid_date  as '有效日期' ,b.goodsname as '商品名称',\r\n               b.goodsspec as '规格', b.producer as '生产企业', b.goodsid as '商品编码',\r\n               a.lot_date as '生产日期', b.barcode as '商品条码',  a.idno as '行号', a.shelfno as 货号,b.goodsunit as 单位\r\n               from bims_supply_dtl a left join bims_goods b on a.goodsid=b.goodsid   \r\n                 where a.supplyno='" + this.supplyno + "' and b.goodsid='" + str + "'";
                                DataSet set3 = DbFactory.ExecuteSet(connection3, str6, null, null, CommandType.Text, out result);
                                if (((set != null) && (set.Tables.Count > 0)) && (set.Tables[0].Rows.Count > 0))
                                {
                                    this.datasupply.DataSource = set3.Tables[0];
                                }
                                else
                                {
                                    MessageBox.Show("亲,此商品没有库存");
                                }
                            }
                        }
                    }
                    else
                    {
                        MessageBox.Show("无此商品！");
                        this.txtcode.Text = "";
                        this.txtcode.Focus();
                    }
                }
            }
        }

        private void txtdatatim_LostFocus(object sender, EventArgs e)
        {
        }
    }
}

