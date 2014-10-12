namespace ES.Client
{
    partial class Main
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
			this.components = new System.ComponentModel.Container();
			this.ms_main = new System.Windows.Forms.MenuStrip();
			this.设置ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.客户端注册ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.总部服务配置ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.q退出ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.dgv_log = new System.Windows.Forms.DataGridView();
			this.tranLogBindingSource = new System.Windows.Forms.BindingSource(this.components);
			this.ss_main = new System.Windows.Forms.StatusStrip();
			this.tl_pName = new System.Windows.Forms.ToolStripStatusLabel();
			this.tl_tName = new System.Windows.Forms.ToolStripStatusLabel();
			this.iDDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.configNameDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.configCodeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.directDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.clientDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.targetDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.sortDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.headerDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.detailDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.footerDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.countDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.stampDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.resultDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.remarkDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.tranTimeDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
			this.ms_main.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)(this.dgv_log)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.tranLogBindingSource)).BeginInit();
			this.ss_main.SuspendLayout();
			this.SuspendLayout();
			// 
			// ms_main
			// 
			this.ms_main.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.设置ToolStripMenuItem,
            this.q退出ToolStripMenuItem});
			this.ms_main.Location = new System.Drawing.Point(0, 0);
			this.ms_main.Name = "ms_main";
			this.ms_main.Size = new System.Drawing.Size(719, 25);
			this.ms_main.TabIndex = 0;
			this.ms_main.Text = "menuStrip1";
			// 
			// 设置ToolStripMenuItem
			// 
			this.设置ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.客户端注册ToolStripMenuItem,
            this.总部服务配置ToolStripMenuItem});
			this.设置ToolStripMenuItem.Name = "设置ToolStripMenuItem";
			this.设置ToolStripMenuItem.Size = new System.Drawing.Size(51, 21);
			this.设置ToolStripMenuItem.Text = "&S设置";
			// 
			// 客户端注册ToolStripMenuItem
			// 
			this.客户端注册ToolStripMenuItem.Name = "客户端注册ToolStripMenuItem";
			this.客户端注册ToolStripMenuItem.Size = new System.Drawing.Size(148, 22);
			this.客户端注册ToolStripMenuItem.Text = "客户端注册";
			// 
			// 总部服务配置ToolStripMenuItem
			// 
			this.总部服务配置ToolStripMenuItem.Name = "总部服务配置ToolStripMenuItem";
			this.总部服务配置ToolStripMenuItem.Size = new System.Drawing.Size(148, 22);
			this.总部服务配置ToolStripMenuItem.Text = "总部服务配置";
			// 
			// q退出ToolStripMenuItem
			// 
			this.q退出ToolStripMenuItem.Name = "q退出ToolStripMenuItem";
			this.q退出ToolStripMenuItem.Size = new System.Drawing.Size(54, 21);
			this.q退出ToolStripMenuItem.Text = "&Q退出";
			this.q退出ToolStripMenuItem.Click += new System.EventHandler(this.q退出ToolStripMenuItem_Click);
			// 
			// dgv_log
			// 
			this.dgv_log.AutoGenerateColumns = false;
			this.dgv_log.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
			this.dgv_log.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.iDDataGridViewTextBoxColumn,
            this.configNameDataGridViewTextBoxColumn,
            this.configCodeDataGridViewTextBoxColumn,
            this.directDataGridViewTextBoxColumn,
            this.clientDataGridViewTextBoxColumn,
            this.targetDataGridViewTextBoxColumn,
            this.sortDataGridViewTextBoxColumn,
            this.headerDataGridViewTextBoxColumn,
            this.detailDataGridViewTextBoxColumn,
            this.footerDataGridViewTextBoxColumn,
            this.countDataGridViewTextBoxColumn,
            this.stampDataGridViewTextBoxColumn,
            this.resultDataGridViewTextBoxColumn,
            this.remarkDataGridViewTextBoxColumn,
            this.tranTimeDataGridViewTextBoxColumn});
			this.dgv_log.DataSource = this.tranLogBindingSource;
			this.dgv_log.Dock = System.Windows.Forms.DockStyle.Fill;
			this.dgv_log.Location = new System.Drawing.Point(0, 25);
			this.dgv_log.Name = "dgv_log";
			this.dgv_log.RowTemplate.Height = 23;
			this.dgv_log.Size = new System.Drawing.Size(719, 434);
			this.dgv_log.TabIndex = 1;
			// 
			// tranLogBindingSource
			// 
			this.tranLogBindingSource.DataSource = typeof(ES.Repository.Client.TranLog);
			// 
			// ss_main
			// 
			this.ss_main.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tl_pName,
            this.tl_tName});
			this.ss_main.Location = new System.Drawing.Point(0, 437);
			this.ss_main.Name = "ss_main";
			this.ss_main.Size = new System.Drawing.Size(719, 22);
			this.ss_main.TabIndex = 2;
			this.ss_main.Text = "statusStrip1";
			// 
			// tl_pName
			// 
			this.tl_pName.Name = "tl_pName";
			this.tl_pName.Size = new System.Drawing.Size(63, 17);
			this.tl_pName.Text = "tl_pName";
			// 
			// tl_tName
			// 
			this.tl_tName.Name = "tl_tName";
			this.tl_tName.Size = new System.Drawing.Size(59, 17);
			this.tl_tName.Text = "tl_tName";
			this.tl_tName.Click += new System.EventHandler(this.toolStripStatusLabel2_Click);
			// 
			// iDDataGridViewTextBoxColumn
			// 
			this.iDDataGridViewTextBoxColumn.DataPropertyName = "ID";
			this.iDDataGridViewTextBoxColumn.HeaderText = "编号";
			this.iDDataGridViewTextBoxColumn.Name = "iDDataGridViewTextBoxColumn";
			// 
			// configNameDataGridViewTextBoxColumn
			// 
			this.configNameDataGridViewTextBoxColumn.DataPropertyName = "ConfigName";
			this.configNameDataGridViewTextBoxColumn.HeaderText = "传输项目名称";
			this.configNameDataGridViewTextBoxColumn.Name = "configNameDataGridViewTextBoxColumn";
			// 
			// configCodeDataGridViewTextBoxColumn
			// 
			this.configCodeDataGridViewTextBoxColumn.DataPropertyName = "ConfigCode";
			this.configCodeDataGridViewTextBoxColumn.HeaderText = "传输项目代号";
			this.configCodeDataGridViewTextBoxColumn.Name = "configCodeDataGridViewTextBoxColumn";
			// 
			// directDataGridViewTextBoxColumn
			// 
			this.directDataGridViewTextBoxColumn.DataPropertyName = "Direct";
			this.directDataGridViewTextBoxColumn.HeaderText = "传输方向";
			this.directDataGridViewTextBoxColumn.Name = "directDataGridViewTextBoxColumn";
			// 
			// clientDataGridViewTextBoxColumn
			// 
			this.clientDataGridViewTextBoxColumn.DataPropertyName = "Client";
			this.clientDataGridViewTextBoxColumn.HeaderText = "Client";
			this.clientDataGridViewTextBoxColumn.Name = "clientDataGridViewTextBoxColumn";
			this.clientDataGridViewTextBoxColumn.Visible = false;
			// 
			// targetDataGridViewTextBoxColumn
			// 
			this.targetDataGridViewTextBoxColumn.DataPropertyName = "Target";
			this.targetDataGridViewTextBoxColumn.HeaderText = "目标";
			this.targetDataGridViewTextBoxColumn.Name = "targetDataGridViewTextBoxColumn";
			this.targetDataGridViewTextBoxColumn.Visible = false;
			// 
			// sortDataGridViewTextBoxColumn
			// 
			this.sortDataGridViewTextBoxColumn.DataPropertyName = "Sort";
			this.sortDataGridViewTextBoxColumn.HeaderText = "顺序";
			this.sortDataGridViewTextBoxColumn.Name = "sortDataGridViewTextBoxColumn";
			// 
			// headerDataGridViewTextBoxColumn
			// 
			this.headerDataGridViewTextBoxColumn.DataPropertyName = "Header";
			this.headerDataGridViewTextBoxColumn.HeaderText = "数据头";
			this.headerDataGridViewTextBoxColumn.Name = "headerDataGridViewTextBoxColumn";
			// 
			// detailDataGridViewTextBoxColumn
			// 
			this.detailDataGridViewTextBoxColumn.DataPropertyName = "Detail";
			this.detailDataGridViewTextBoxColumn.HeaderText = "数据体";
			this.detailDataGridViewTextBoxColumn.Name = "detailDataGridViewTextBoxColumn";
			// 
			// footerDataGridViewTextBoxColumn
			// 
			this.footerDataGridViewTextBoxColumn.DataPropertyName = "Footer";
			this.footerDataGridViewTextBoxColumn.HeaderText = "数据尾";
			this.footerDataGridViewTextBoxColumn.Name = "footerDataGridViewTextBoxColumn";
			// 
			// countDataGridViewTextBoxColumn
			// 
			this.countDataGridViewTextBoxColumn.DataPropertyName = "Count";
			this.countDataGridViewTextBoxColumn.HeaderText = "数据行数";
			this.countDataGridViewTextBoxColumn.Name = "countDataGridViewTextBoxColumn";
			// 
			// stampDataGridViewTextBoxColumn
			// 
			this.stampDataGridViewTextBoxColumn.DataPropertyName = "Stamp";
			this.stampDataGridViewTextBoxColumn.HeaderText = "最大时间戳";
			this.stampDataGridViewTextBoxColumn.Name = "stampDataGridViewTextBoxColumn";
			this.stampDataGridViewTextBoxColumn.Visible = false;
			// 
			// resultDataGridViewTextBoxColumn
			// 
			this.resultDataGridViewTextBoxColumn.DataPropertyName = "Result";
			this.resultDataGridViewTextBoxColumn.HeaderText = "处理结果";
			this.resultDataGridViewTextBoxColumn.Name = "resultDataGridViewTextBoxColumn";
			// 
			// remarkDataGridViewTextBoxColumn
			// 
			this.remarkDataGridViewTextBoxColumn.DataPropertyName = "Remark";
			this.remarkDataGridViewTextBoxColumn.HeaderText = "说明";
			this.remarkDataGridViewTextBoxColumn.Name = "remarkDataGridViewTextBoxColumn";
			// 
			// tranTimeDataGridViewTextBoxColumn
			// 
			this.tranTimeDataGridViewTextBoxColumn.DataPropertyName = "TranTime";
			this.tranTimeDataGridViewTextBoxColumn.HeaderText = "传输时间";
			this.tranTimeDataGridViewTextBoxColumn.Name = "tranTimeDataGridViewTextBoxColumn";
			// 
			// Main
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(719, 459);
			this.Controls.Add(this.ss_main);
			this.Controls.Add(this.dgv_log);
			this.Controls.Add(this.ms_main);
			this.MainMenuStrip = this.ms_main;
			this.Name = "Main";
			this.Text = "数据传输客户端";
			this.Load += new System.EventHandler(this.Main_Load);
			this.ms_main.ResumeLayout(false);
			this.ms_main.PerformLayout();
			((System.ComponentModel.ISupportInitialize)(this.dgv_log)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.tranLogBindingSource)).EndInit();
			this.ss_main.ResumeLayout(false);
			this.ss_main.PerformLayout();
			this.ResumeLayout(false);
			this.PerformLayout();

        }

        #endregion

		private System.Windows.Forms.MenuStrip ms_main;
		private System.Windows.Forms.ToolStripMenuItem 设置ToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem 客户端注册ToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem 总部服务配置ToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem q退出ToolStripMenuItem;
		private System.Windows.Forms.DataGridView dgv_log;
		private System.Windows.Forms.BindingSource tranLogBindingSource;
		private System.Windows.Forms.StatusStrip ss_main;
		private System.Windows.Forms.ToolStripStatusLabel tl_pName;
		private System.Windows.Forms.ToolStripStatusLabel tl_tName;
		private System.Windows.Forms.DataGridViewTextBoxColumn iDDataGridViewTextBoxColumn;
		private System.Windows.Forms.DataGridViewTextBoxColumn configNameDataGridViewTextBoxColumn;
		private System.Windows.Forms.DataGridViewTextBoxColumn configCodeDataGridViewTextBoxColumn;
		private System.Windows.Forms.DataGridViewTextBoxColumn directDataGridViewTextBoxColumn;
		private System.Windows.Forms.DataGridViewTextBoxColumn clientDataGridViewTextBoxColumn;
		private System.Windows.Forms.DataGridViewTextBoxColumn targetDataGridViewTextBoxColumn;
		private System.Windows.Forms.DataGridViewTextBoxColumn sortDataGridViewTextBoxColumn;
		private System.Windows.Forms.DataGridViewTextBoxColumn headerDataGridViewTextBoxColumn;
		private System.Windows.Forms.DataGridViewTextBoxColumn detailDataGridViewTextBoxColumn;
		private System.Windows.Forms.DataGridViewTextBoxColumn footerDataGridViewTextBoxColumn;
		private System.Windows.Forms.DataGridViewTextBoxColumn countDataGridViewTextBoxColumn;
		private System.Windows.Forms.DataGridViewTextBoxColumn stampDataGridViewTextBoxColumn;
		private System.Windows.Forms.DataGridViewTextBoxColumn resultDataGridViewTextBoxColumn;
		private System.Windows.Forms.DataGridViewTextBoxColumn remarkDataGridViewTextBoxColumn;
		private System.Windows.Forms.DataGridViewTextBoxColumn tranTimeDataGridViewTextBoxColumn;


	}
}

