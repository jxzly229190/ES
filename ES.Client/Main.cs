using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ES.Repository;
using ES.Client.TransferService;

namespace ES.Client
{
    public partial class Main : Form
    {
        public Main()
        {
            InitializeComponent();

            UpdateConfigs();
        }

        TransferService.TransferSoapClient server = new TransferService.TransferSoapClient();
        ES.Repository.Client.DBDataContext db = new ES.Repository.Client.DBDataContext();

        private void Main_Load(object sender, EventArgs e)
        { 
            var result=server.HelloWorld();

            var ts = db.ExecuteQuery<object>("Select Convert(timestamp,'fafds')");

            lblResult.Text = ts.FirstOrDefault().ToString();
        }

		private void GetDataFromServer()
		{
			
		}

        private void UpdateConfigs()
        {
            var md5Pulickey = Common.MD5(Common.PublicKey);
            string clientCode,clientGuid;
            clientGuid=QueryCurrentClientGUID(out clientCode);

			var timestamp = db.ExecuteQuery<long?>("Select max(cast(Timestamp as bigint)) From TranConfig Where [GUID]={0}", clientGuid).FirstOrDefault();

            var result = server.GetTranConfigs(clientCode, Common.MD5(md5Pulickey + clientGuid), timestamp??0);

            if (result == null)
            {
                throw new Exception("返回值为空");
            }

            if (result.State != 0)
            {
                throw new Exception("返回值异常,错误信息：" + result.Message);
            }

            var sqlData = result.data as SqlData;

			if (sqlData == null)
			{
				throw new Exception("转换出错");
			}

			try
			{
				db.ExecuteCommand(sqlData.HeaderSql + ";" + sqlData.DetailSql + ";" + sqlData.FooterSql);
			}
			catch (Exception ex)
			{				
				throw ex;
			}			
        }

        private string QueryCurrentClientGUID(out string clientCode)
        {
            //return null;
            var client = db.Client.Where(c => c.Status == 0 && c.IsCurrent == true).FirstOrDefault();

            if (client == null)
            {
                throw new Exception("当前Client为空");
            }

            clientCode = client.Code;

            return client.GUID.ToString();
        }
    }
}
