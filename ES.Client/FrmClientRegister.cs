using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ES.Client
{
    public partial class FrmClientRegister : Form
    {
        dbDataContext db = new dbDataContext();
        Client client = null;

        public FrmClientRegister()
        {
            InitializeComponent();
            InitData();
        }

        private void InitData() {
            client = db.Client.FirstOrDefault(c => c.IsCurrent == true && c.Type == 1);
            if (client != null) {
                txtGuid.Text = client.GUID.ToString();
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtGuid.Text)) {
                MessageBox.Show("请输入GUID。");
                return;
            }

            Guid guid;
            if (!Guid.TryParse(txtGuid.Text, out guid))
            {
                MessageBox.Show("请输入正确的Guid。");
                return;
            }

            if (client == null)
            {
                client = new Client();
                client.GUID = guid;
                client.Type = 1;
                client.IsCurrent = true;
                db.Client.InsertOnSubmit(client);
            }
            else {
                client.GUID = guid;
                client.Type = 1;
                client.IsCurrent = true;
            }            

            try
            {
                db.SubmitChanges();
                MessageBox.Show("保存成功");
                this.Close();
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("您确定要关闭吗？", "提示", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                this.Close();
            }
        }
    }
}
