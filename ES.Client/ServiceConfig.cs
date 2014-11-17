using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ES.Client
{
    public partial class ServiceConfig : Form
    {
        public ServiceConfig()
        {
            InitializeComponent();
        }

        private void BtnSaveClick(object sender, EventArgs e)
        {
            var url = tbServiceUrl.Text;
            if (string.IsNullOrWhiteSpace(url))
            {
                MessageBox.Show("请输入服务地址");
                return;
            }

            if (!url.StartsWith("http://"))
            {
                MessageBox.Show("请输入正确的服务地址");
                return;
            }

            util.SetSetting("serviceUrl", url);
        }
    }
}
