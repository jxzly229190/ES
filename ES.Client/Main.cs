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
			var result = server.HelloWorld();

			var ts = db.ExecuteQuery<object>("Select Convert(timestamp,'fafds')");

			lblResult.Text = ts.FirstOrDefault().ToString();

			GetDataFromServer();
		}

		private void GetDataFromServer()
		{
			var md5Pulickey = Common.MD5(Common.PublicKey);
			string clientCode, clientGuid;
			clientGuid = QueryCurrentClientGUID(out clientCode);

			var configs = db.TranConfig.Where(c => c.Code != "PZSJ" && c.Status == 0 && c.Sort >= 0 && c.Direct == 0).ToList();

			if (configs != null)
			{
				foreach (var config in configs)
				{
					SqlData sqlData = null;
					do
					{
						var result = server.Get(clientCode, Common.MD5(md5Pulickey + clientGuid), Convert.ToInt64(config.LastStamp), config.MaxCount, config.Guid.ToString(), null);

						sqlData = result.data as SqlData;

						if (sqlData == null)
						{
							throw new Exception("转换出错");
						}

						this.UpdateDbByResponse(sqlData, config.Guid.ToString());

						config.LastStamp = sqlData.MaxTimeStamp;
					}
					while (sqlData.RowCount == config.MaxCount);
				}
			}
		}

		private void PostDataToServer()
		{
			var md5Pulickey = Common.MD5(Common.PublicKey);
			string clientCode, clientGuid;
			clientGuid = QueryCurrentClientGUID(out clientCode);

			var configs = db.TranConfig.Where(c => c.Code != "PZSJ" && c.Status == 0 && c.Sort >= 0 && c.Direct == 1).ToList();

			if (configs != null)
			{
				List<ES.Repository.Model.QueryResult> results = null;
				string sql = "", lastStamp;

				foreach (var config in configs)
				{
					lastStamp = config.LastStamp.ToString();
					do
					{
						var detailSql = config.DetailSql.Replace("$lastStamp$", config.LastStamp.ToString()).Replace("$rowCount$", config.MaxCount.ToString()).Replace("from", " as sql,cast(timestamp as bigint) as stamp from");

						results = db.ExecuteQuery<ES.Repository.Model.QueryResult>(detailSql).OrderByDescending(c => c.stamp).ToList();

						if (results != null)
						{
							foreach (var result in results)
							{
								sql += result.sql + ";";
							}
							var sqlData = new ES.Client.TransferService.SqlData() { ConfigGuid = config.Guid.ToString(), RowCount = config.MaxCount, MaxTimeStamp = results.Count(), HeaderSql = config.HeaderSql, DetailSql = config.DetailSql, FooterSql = config.FooterSql };

							server.Post(clientCode, Common.MD5(md5Pulickey + clientGuid), sqlData);

							lastStamp = results.First() != null ? "0" : results.First().stamp.ToString();
						}

					} while (results.Count() == config.MaxCount);
				}
			}
		}

		private void UpdateConfigs()
		{
			var md5Pulickey = Common.MD5(Common.PublicKey);
			string clientCode, clientGuid;
			clientGuid = QueryCurrentClientGUID(out clientCode);

			var config = db.TranConfig.Where(c => c.Code == "PZSJ" && c.Status == 0).FirstOrDefault();

			var result = server.GetTranConfigs(clientCode, Common.MD5(md5Pulickey + clientGuid), config == null ? 0 : Convert.ToInt64(config.LastStamp));

			if (result == null)
			{
				throw new Exception("返回值为空");
			}

			if (result.State != 0)
			{
				throw new Exception("返回值异常,错误信息：" + result.Message);
			}

			if (config == null)
			{
				config = db.TranConfig.Where(c => c.Code == "PZSJ" && c.Status == 0).FirstOrDefault();
			}

			var sqlData = result.data as SqlData;

			if (sqlData == null)
			{
				throw new Exception("转换出错");
			}

			UpdateDbByResponse(sqlData, sqlData.ConfigGuid);
		}

		private void UpdateDbByResponse(SqlData sqlData, string configGuid)
		{
			try
			{
				db.ExecuteCommand(sqlData.HeaderSql + ";" + sqlData.DetailSql + ";" + sqlData.FooterSql + ";" + "Update tranconfig Set lastStamp={0} Where Guid={1}", sqlData.MaxTimeStamp, configGuid);
			}
			catch (Exception ex)
			{
				db.Transaction.Rollback();
				throw ex;
			}
		}

		private string QueryCurrentClientGUID(out string clientCode)
		{
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
