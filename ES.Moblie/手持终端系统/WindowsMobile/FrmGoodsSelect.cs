namespace WindowsMobile
{
    using System;
    using System.ComponentModel;
    using System.Data;
    using System.Drawing;
    using System.Windows.Forms;

    public class FrmGoodsSelect : Form
    {
        private string[] allgoods;
        private Button btCel;
        private Button btSel;
        private IContainer components = null;
        private System.Windows.Forms.DataGridTableStyle dataGridTableStyle1;
        private System.Windows.Forms.DataGridTextBoxColumn dataGridTextBoxColumn1;
        private System.Windows.Forms.DataGridTextBoxColumn dataGridTextBoxColumn2;
        private System.Windows.Forms.DataGridTextBoxColumn dataGridTextBoxColumn3;
        private System.Windows.Forms.DataGridTextBoxColumn dataGridTextBoxColumn4;
        private System.Windows.Forms.DataGridTextBoxColumn dataGridTextBoxColumn5;
        private System.Windows.Forms.DataGridTextBoxColumn dataGridTextBoxColumn6;
        private System.Windows.Forms.DataGrid dgGoods;

        public FrmGoodsSelect(DataTable dt, string[] goods)
        {
            this.InitializeComponent();
            dt.TableName = "Goods";
            this.dgGoods.DataSource = dt;
            this.allgoods = goods;
        }

        private void btCel_Click(object sender, EventArgs e)
        {
            base.Close();
        }

        private void btSel_Click(object sender, EventArgs e)
        {
            if (this.dgGoods.CurrentRowIndex >= 0)
            {
                this.allgoods[0] = this.dgGoods[this.dgGoods.CurrentRowIndex, 0].ToString();
                this.allgoods[1] = this.dgGoods[this.dgGoods.CurrentRowIndex, 1].ToString();
                this.allgoods[2] = this.dgGoods[this.dgGoods.CurrentRowIndex, 2].ToString();
                this.allgoods[3] = this.dgGoods[this.dgGoods.CurrentRowIndex, 3].ToString();
                this.allgoods[4] = this.dgGoods[this.dgGoods.CurrentRowIndex, 4].ToString();
                this.allgoods[5] = this.dgGoods[this.dgGoods.CurrentRowIndex, 5].ToString();
                base.Close();
            }
        }

        private void dgGoods_DoubleClick(object sender, EventArgs e)
        {
            if (this.dgGoods.CurrentRowIndex >= 0)
            {
                this.allgoods[0] = this.dgGoods[this.dgGoods.CurrentRowIndex, 0].ToString();
                this.allgoods[1] = this.dgGoods[this.dgGoods.CurrentRowIndex, 1].ToString();
                this.allgoods[2] = this.dgGoods[this.dgGoods.CurrentRowIndex, 2].ToString();
                this.allgoods[3] = this.dgGoods[this.dgGoods.CurrentRowIndex, 3].ToString();
                this.allgoods[4] = this.dgGoods[this.dgGoods.CurrentRowIndex, 4].ToString();
                this.allgoods[5] = this.dgGoods[this.dgGoods.CurrentRowIndex, 5].ToString();
                base.Close();
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
            this.btCel = new Button();
            this.btSel = new Button();
            this.dgGoods = new System.Windows.Forms.DataGrid();
            this.dataGridTableStyle1 = new System.Windows.Forms.DataGridTableStyle();
            this.dataGridTextBoxColumn1 = new System.Windows.Forms.DataGridTextBoxColumn();
            this.dataGridTextBoxColumn2 = new System.Windows.Forms.DataGridTextBoxColumn();
            this.dataGridTextBoxColumn3 = new System.Windows.Forms.DataGridTextBoxColumn();
            this.dataGridTextBoxColumn4 = new System.Windows.Forms.DataGridTextBoxColumn();
            this.dataGridTextBoxColumn5 = new System.Windows.Forms.DataGridTextBoxColumn();
            this.dataGridTextBoxColumn6 = new System.Windows.Forms.DataGridTextBoxColumn();
            base.SuspendLayout();
            this.btCel.DialogResult = DialogResult.Cancel;
            this.btCel.Location = new Point(140, 0xc5);
            this.btCel.Name = "btCel";
            this.btCel.Size = new Size(0x48, 0x22);
            this.btCel.TabIndex = 5;
            this.btCel.Text = "取  消";
            this.btCel.Click += new EventHandler(this.btCel_Click);
            this.btSel.DialogResult = DialogResult.OK;
            this.btSel.Location = new Point(0x18, 0xc5);
            this.btSel.Name = "btSel";
            this.btSel.Size = new Size(0x48, 0x22);
            this.btSel.TabIndex = 4;
            this.btSel.Text = "选  择";
            this.btSel.Click += new EventHandler(this.btSel_Click);
            this.dgGoods.BackgroundColor=(Color.FromArgb(0x80, 0x80, 0x80));
            this.dgGoods.Location = new Point(3, 5);
            this.dgGoods.Name = "dgGoods";
            this.dgGoods.Size = new Size(0xe8, 0xbc);
            this.dgGoods.TabIndex = 3;
            this.dgGoods.TableStyles.Add(this.dataGridTableStyle1);
            this.dgGoods.DoubleClick += new EventHandler(this.dgGoods_DoubleClick);
            this.dataGridTableStyle1.GridColumnStyles.Add(this.dataGridTextBoxColumn1);
            this.dataGridTableStyle1.GridColumnStyles.Add(this.dataGridTextBoxColumn2);
            this.dataGridTableStyle1.GridColumnStyles.Add(this.dataGridTextBoxColumn3);
            this.dataGridTableStyle1.GridColumnStyles.Add(this.dataGridTextBoxColumn4);
            this.dataGridTableStyle1.GridColumnStyles.Add(this.dataGridTextBoxColumn5);
            this.dataGridTableStyle1.GridColumnStyles.Add(this.dataGridTextBoxColumn6);
            this.dataGridTableStyle1.MappingName = "Goods";
            this.dataGridTextBoxColumn1.Format=("");
            this.dataGridTextBoxColumn1.Format=(null);
            this.dataGridTextBoxColumn1.HeaderText = "商品编码";
            this.dataGridTextBoxColumn1.MappingName = "goodsid";
            this.dataGridTextBoxColumn2.Format=("");
            this.dataGridTextBoxColumn2.Format=(null);
            this.dataGridTextBoxColumn2.HeaderText = "商品名称";
            this.dataGridTextBoxColumn2.MappingName = "goodsname";
            this.dataGridTextBoxColumn3.Format=("");
            this.dataGridTextBoxColumn3.Format=(null);
            this.dataGridTextBoxColumn3.HeaderText = "规格";
            this.dataGridTextBoxColumn3.MappingName = "goodsspec";
            this.dataGridTextBoxColumn4.Format=("");
            this.dataGridTextBoxColumn4.Format=(null);
            this.dataGridTextBoxColumn4.HeaderText = "单位";
            this.dataGridTextBoxColumn4.MappingName = "goodsunit";
            this.dataGridTextBoxColumn5.Format=("");
            this.dataGridTextBoxColumn5.Format=(null);
            this.dataGridTextBoxColumn5.HeaderText = "生产厂家";
            this.dataGridTextBoxColumn5.MappingName = "producer";
            this.dataGridTextBoxColumn6.Format=("");
            this.dataGridTextBoxColumn6.Format=(null);
            this.dataGridTextBoxColumn6.HeaderText = "零售价";
            this.dataGridTextBoxColumn6.MappingName = "retailprice";
            base.AutoScaleDimensions = new SizeF(96f, 96f);
            base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoScroll = true;
            base.ClientSize = new Size(0xee, 0xed);
            base.Controls.Add(this.btCel);
            base.Controls.Add(this.btSel);
            base.Controls.Add(this.dgGoods);
            base.Name = "FrmGoodsSelect";
            this.Text = "商品选择";
            base.ResumeLayout(false);
        }
    }
}

