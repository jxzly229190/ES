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
            PostDataToServer();
		}

		private void GetDataFromServer()
		{
			var md5Pulickey = Common.MD5(Common.PublicKey);
			string clientCode, clientGuid;
			clientGuid = QueryCurrentClientGUID(out clientCode);

            var configs = db.TranConfigs.Where(c => c.Code != "PZSJ" && c.Status == 0 && c.Sort >= 0 && c.Direct == 0 ).ToList();

			if (configs != null)
			{
				foreach (var config in configs)
				{
					SqlData sqlData = null;
					do
					{
						var result = server.Get(clientCode, Common.MD5(md5Pulickey + clientGuid), Convert.ToInt64(config.LastStamp), config.MaxCount, config.Guid.ToString(), null);

                        if (result.State != 0)
                        {
                            throw new Exception("获取数据出错："+result.Message);
                        }

                        if (result.data == null) {
                            //数据传输完成
                            break;
                        }

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

            var configs = db.TranConfigs.Where(c => c.Code != "PZSJ" && c.Status == 0 && c.Sort >= 0 && c.Direct == 1).ToList();

			if (configs != null)
			{
				List<ES.Repository.Model.QueryResult> results = null;
                string sql = "";
                long lastStamp;

				foreach (var config in configs)
				{
					lastStamp = Convert.ToInt64(config.LastStamp);
					do
					{
						var detailSql = config.DetailSql.Replace("$lastStamp$", lastStamp.ToString()).Replace("$rowCount$", config.MaxCount.ToString()).Replace("from", " as sql,cast(timestamp as bigint) as stamp from");

						results = db.ExecuteQuery<ES.Repository.Model.QueryResult>(detailSql).ToList();

						if (results != null&&results.Count()>0)
						{
							foreach (var result in results)
							{
								sql += result.sql + ";";
							}
                            var sqlData = new ES.Client.TransferService.SqlData() { ConfigGuid = config.Guid.ToString(), RowCount = config.MaxCount, MaxTimeStamp = results.Count(), HeaderSql = config.HeaderSql, DetailSql = sql, FooterSql = config.FooterSql };

							var response = server.Post(clientCode, Common.MD5(md5Pulickey + clientGuid), sqlData);

                            if (response.State == 0)
                            {
                                //更新配置时间戳
                                var maxItem = results.OrderByDescending(c => c.stamp).FirstOrDefault();
                                lastStamp = maxItem == null ? 0 : maxItem.stamp;
                                db.ExecuteCommand("Update tranconfig Set lastStamp={0} Where Guid={1}", lastStamp, config.Guid);
                            }
                            else
                            {
                                //todo:记录错误信息
                                //继续下一条配置数据传输
                                break;
                            }
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

			var config = db.TranConfigs.Where(c => c.Code == "PZSJ" && c.Status == 0).FirstOrDefault();

			var result = server.GetTranConfigs(clientCode, Common.MD5(md5Pulickey + clientGuid), config == null ? 0 : Convert.ToInt64(config.LastStamp));

			if (result == null)
			{
				throw new Exception("返回值为空");
			}

			if (result.State != 0)
			{
				throw new Exception("返回值异常,错误信息：" + result.Message);
			}

            //判断是否获取到数据
            if (result.data == null)
            {
                //没有获取到数据,直接返回
                return;
            }

			if (config == null)
			{
				config = db.TranConfigs.Where(c => c.Code == "PZSJ" && c.Status == 0).FirstOrDefault();
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
			var client = db.Clients.Where(c => c.Status == 0 && c.IsCurrent == true).FirstOrDefault();

			if (client == null)
			{
				throw new Exception("当前Client为空");
			}

			clientCode = client.Code;

			return client.GUID.ToString();
		}
	}
}
