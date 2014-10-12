using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using ES.Repository;
using ES.Client.TransferService;
using ES.Repository.Client;

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
			SyncData();
		}

		private void SyncData()
		{
			var md5Pulickey = Common.MD5(Common.PublicKey);
			string clientCode, clientGuid;
			clientGuid = QueryCurrentClientGUID(out clientCode);			

			var configs = db.TranConfig.Where(c => c.Code != "PZSJ" && c.Status == 0 && c.Sort >= 0).ToList();

			if (configs != null) {
				foreach (var config in configs) {
					if (config.Direct == 0) {
						Get(md5Pulickey, clientCode, clientGuid, config);
					}
					else
					{						
						Post(md5Pulickey, clientCode, clientGuid, config);
					}
				}
			}
		}

		#region 多余的代码
		private void GetDataFromServer()
		{
			var md5Pulickey = Common.MD5(Common.PublicKey);
			string clientCode, clientGuid;
			clientGuid = QueryCurrentClientGUID(out clientCode);

			var configs = db.TranConfig.Where(c => c.Code != "PZSJ" && c.Status == 0 && c.Sort >= 0 && c.Direct == 0).OrderBy(c => c.Sort).ToList();

			if (configs != null)
			{
				foreach (var config in configs)
				{
					Get(md5Pulickey, clientCode, clientGuid, config);
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

				foreach (var config in configs)
				{
					Post(md5Pulickey, clientCode, clientGuid, config);
				}
			}
		} 
		#endregion

		private void Get(string md5Pulickey, string clientCode, string clientGuid, TranConfig config)
		{
			SqlData sqlData = null;
			TranLog log=null;
			do
			{
				var result = server.Get(clientCode, Common.MD5(md5Pulickey + clientGuid), Convert.ToInt64(config.LastStamp), config.MaxCount, config.Guid.ToString(), null);

				if (result.State != 0)
				{
					log = new TranLog()
					{
						Client = clientCode,
						ConfigCode = config.Code,
						ConfigName = config.Name,
						Count = 0,
						Direct = 0,
						Remark = result.Message,
						Result = "服务器出错了",
						Sort = config.Sort,
						Stamp = config.LastStamp,
						TranTime = DateTime.Now
					};

					db.TranLog.InsertOnSubmit(log);
					db.SubmitChanges();
					return;
				}

				if (result.data == null)
				{
					log = new TranLog()
					{
						Client = clientCode,
						ConfigCode = config.Code,
						ConfigName = config.Name,
						Count = 0,
						Direct = 0,
						Result = "没有获取到数据",
						Sort = config.Sort,
						Stamp = config.LastStamp,
						TranTime = DateTime.Now
					};
					db.TranLog.InsertOnSubmit(log);
					db.SubmitChanges();
					return;
				}

				sqlData = result.data as SqlData;

				if (sqlData == null)
				{
					log = new TranLog()
					{
						Client = clientCode,
						ConfigCode = config.Code,
						ConfigName = config.Name,
						Count = 0,
						Direct = 0,
						Remark = "SqlData 为 Null",
						Result = "SqlData转换出错",
						Sort = config.Sort,
						Stamp = config.LastStamp,
						TranTime = DateTime.Now
					};

					db.TranLog.InsertOnSubmit(log);
					db.SubmitChanges();
					return;
				}

				this.UpdateDbByResponse(sqlData, config.Guid.ToString());

				config.LastStamp = sqlData.MaxTimeStamp;

				log = new TranLog()
				{
					Client = clientCode,
					ConfigCode = config.Code,
					ConfigName = config.Name,
					Count = sqlData.RowCount,
					Direct = 0,
					Remark = result.Message,
					Result = "数据更新成功",
					Sort = config.Sort,
					Stamp = sqlData.MaxTimeStamp,
					Header = sqlData.HeaderSql,
					Detail = sqlData.DetailSql,
					Footer = sqlData.FooterSql,
					TranTime=DateTime.Now				
				};

				db.TranLog.InsertOnSubmit(log);
				db.SubmitChanges();
			}
			while (sqlData.RowCount == config.MaxCount);
		}

		private void Post(string md5Pulickey, string clientCode, string clientGuid, Repository.Client.TranConfig config)
		{
			List<ES.Repository.Model.QueryResult> results = null;
			long lastStamp;
			string sql="";
			lastStamp = Convert.ToInt64(config.LastStamp);

			do
			{
				var detailSql = config.DetailSql.Replace("$lastStamp$", lastStamp.ToString()).Replace("$rowCount$", config.MaxCount.ToString()).Replace("from", " as sql,cast(timestamp as bigint) as stamp from");

				results = db.ExecuteQuery<ES.Repository.Model.QueryResult>(detailSql).ToList();

				if (results != null && results.Count() > 0)
				{
					foreach (var result in results)
					{
						sql += result.sql + ";";
					}
					var sqlData = new ES.Client.TransferService.SqlData() { ConfigGuid = config.Guid.ToString(), RowCount = results.Count(), MaxTimeStamp = results.Count(), HeaderSql = config.HeaderSql, DetailSql = sql, FooterSql = config.FooterSql };

					var response = server.Post(clientCode, Common.MD5(md5Pulickey + clientGuid), sqlData);

					var log = new TranLog()
					{
						Client = clientCode,
						ConfigCode = config.Code,
						ConfigName = config.Name,
						Count = results.Count(),
						Direct = 0,
						Remark = response.Message,
						Sort = config.Sort,
						Stamp = config.LastStamp,
						Header = config.HeaderSql,
						Detail = sql,
						Footer = config.FooterSql,
						TranTime = DateTime.Now
					};

					if (response.State == 0)
					{
						//更新配置时间戳
						var maxItem = results.OrderByDescending(c => c.stamp).FirstOrDefault();
						lastStamp = maxItem == null ? 0 : maxItem.stamp;
						db.ExecuteCommand("Update tranconfig Set lastStamp={0} Where Guid={1}", lastStamp, config.Guid);

						log.Result = "提交数据成功";
						db.TranLog.InsertOnSubmit(log);
						db.SubmitChanges();
					}
					else
					{
						log.Result = "提交数据出错";
						db.TranLog.InsertOnSubmit(log);
						db.SubmitChanges();

						//继续下一条配置数据传输
						break;
					}
				}
			} while (results.Count() == config.MaxCount);
		}

		private void UpdateConfigs()
		{
			var md5Pulickey = Common.MD5(Common.PublicKey);
			string clientCode, clientGuid;
			clientGuid = QueryCurrentClientGUID(out clientCode);
			TranLog log=null;

			var config = db.TranConfig.Where(c => c.Code == "PZSJ" && c.Status == 0).FirstOrDefault();

			var result = server.GetTranConfigs(clientCode, Common.MD5(md5Pulickey + clientGuid), config == null ? 0 : Convert.ToInt64(config.LastStamp));

			if (result == null)
			{
				log = new TranLog()
				{
					Client = clientCode,
					ConfigCode = "PZSJ",
					ConfigName = "传输配置数据",
					Direct = 0,
					Result = "返回数据出错",
					Sort = -1,
					Stamp=config==null?0:config.LastStamp,
					TranTime=DateTime.Now
				};

				db.TranLog.InsertOnSubmit(log);
				db.SubmitChanges();

				throw new Exception("返回数据出错");
			}

			if (result.State != 0)
			{
				log = new TranLog()
				{
					Client = clientCode,
					ConfigCode = "PZSJ",
					ConfigName = "传输配置数据",
					Direct = 0,
					Result = "服务器发生错误",
					Remark=result.Message,
					Sort = -1,
					Stamp = config == null ? 0 : config.LastStamp,
					TranTime = DateTime.Now
				};

				db.TranLog.InsertOnSubmit(log);
				db.SubmitChanges();

				throw new Exception("返回值异常,错误信息：" + result.Message);
			}

            //判断是否获取到数据
            if (result.data == null)
            {
				log = new TranLog()
				{
					Client = clientCode,
					ConfigCode = "PZSJ",
					ConfigName = "传输配置数据",
					Direct = 0,
					Result = "没有返回数据",
					Remark = result.Message,
					Sort = -1,
					Stamp = config == null ? 0 : config.LastStamp,
					TranTime = DateTime.Now
				};

				db.TranLog.InsertOnSubmit(log);
				db.SubmitChanges();

                //没有获取到数据,直接返回
                return;
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

			log = new TranLog()
			{
				Client = clientCode,
				ConfigCode = "PZSJ",
				ConfigName = "传输配置数据",
				Direct = 0,
				Count=sqlData.RowCount,
				Result = "更新数据成功",
				Sort = -1,
				Stamp = sqlData.MaxTimeStamp,
				Header=sqlData.HeaderSql,
				Detail=sqlData.DetailSql,
				Footer = sqlData.FooterSql,
				TranTime = DateTime.Now
			};
			db.TranLog.InsertOnSubmit(log);
			db.SubmitChanges();
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
