using ES.Repository;
using ES.Repository.Model;
using ES.Repository.Server;
using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Xml.Serialization;

namespace ES.Server
{
	/// <summary>
	/// Summary description for Transfer
	/// </summary>
	[WebService(Namespace = "http://tempuri.org/")]
	[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
	[System.ComponentModel.ToolboxItem(false)]
	// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
	// [System.Web.Script.Services.ScriptService]
	[XmlInclude(typeof(ResponseData))]
	[XmlInclude(typeof(SqlData))]
	public class Transfer : System.Web.Services.WebService
	{
		DBDataContext db = new ES.Repository.Server.DBDataContext();

		[WebMethod]
		public string HelloWorld()
		{
			return "Hello World";
		}

		/// <summary>
		/// 从服务器获取数据
		/// </summary>
		/// <param name="clientCode">客户端代号</param>
		/// <param name="varifyCode">验证码</param>
		/// <param name="lastTimeStamp">上一次更新数据时间戳</param>
		/// <param name="rowCount">行数</param>
		/// <param name="configGuid">配置标识</param>
		/// <param name="paras">其他参数</param>
		/// <returns></returns>
		[WebMethod]
		public ResponseData Get(string clientCode, string varifyCode, long lastTimeStamp, int rowCount, string configGuid, params object[] paras)
		{
			var client = db.Clients.Where(c => c.Status == 0 && c.Code == clientCode).FirstOrDefault();

			if (client == null)
			{
				return new ResponseData() { State = 1, Message = "客户端不存在" };
			}

			if (!VarifyClient(client.GUID.ToString(), varifyCode))
			{
				return new ResponseData() { State = 2, Message = "非法请求" };
			}

			var config = db.TranConfigs.Where(c => c.Status == 0 && c.Guid.ToString() == configGuid).FirstOrDefault();

			if (config == null)
			{
				return new ResponseData() { State = 3, Message = "没有找到相应的配置" };
			}

			var detailSql = config.DetailSql.Replace("$lastStamp$", lastTimeStamp.ToString()).Replace("$rowCount$", rowCount.ToString());

			if (paras != null && paras.Length > 0)
			{
				detailSql = string.Format(detailSql, paras);
			}

			detailSql = detailSql.Replace("from", " as sql,cast(timestamp as bigint) as stamp from");

			try
			{
				var result = db.ExecuteQuery<QueryResult>(detailSql).ToList();

				string sql = "";

                if (result != null&&result.Count()>0)
                {
                    foreach (var res in result)
                    {
                        sql += res.sql + ";";
                    }
                }
                else {
                    return new ResponseData() { State = 0, Message = "没有数据了" };
                }

                //获取最大时间戳
                var maxItem = result.OrderByDescending(d => d.stamp).FirstOrDefault();
                
				var response = new ResponseData()
				{
					State = 0,
					data = new SqlData() { HeaderSql = config.HeaderSql, DetailSql = sql, FooterSql = config.FooterSql, MaxTimeStamp = maxItem==null?0:maxItem.stamp, RowCount = result.Count(), ConfigGuid=config.Guid.ToString() }
				};

				return response;
			}
			catch (Exception ex)
			{
				return new ResponseData() { State = 100, Message = ex.Message };
			}
		}

		[WebMethod]
		public ResponseData Post(string clientCode, string varifyCode, SqlData data)
		{
			var client = db.Clients.Where(c => c.Status == 0 && c.Code == clientCode).FirstOrDefault();

			if (client == null)
			{
				return new ResponseData() { State = 1, Message = "客户端不存在" };
			}

			if (!VarifyClient(client.GUID.ToString(), varifyCode))
			{
				return new ResponseData() { State = 2, Message = "非法请求" };
			}

			var sql = data.HeaderSql + ";" + data.DetailSql + ";" + data.FooterSql;

			try
			{
				db.ExecuteCommand(sql);
				return new ResponseData() { State = 0, Message = "执行成功" };
			}
			catch (Exception ex)
			{
				return new ResponseData() { State = 100, Message = ex.Message };
			}
		}

		/// <summary>
		/// 获取传输配置
		/// </summary>
		/// <returns></returns>
		[WebMethod]
		public ResponseData GetTranConfigs(string clientCode, string varifyCode, long timestamp)
		{
			var client = db.Clients.Where(c => c.Status == 0 && c.Code == clientCode).FirstOrDefault();

			if (client == null)
			{
				return new ResponseData() { State = 1, Message = "客户端不存在" };
			}

			if (!VarifyClient(client.GUID.ToString(), varifyCode))
			{
				return new ResponseData() { State = 2, Message = "非法请求" };
			}

			var tranConfig = db.TranConfigs.Where(t => t.Code == "PZSJ" && t.Status == 0).FirstOrDefault();

			if (tranConfig == null)
			{
				return new ResponseData() { State = 3, Message = "配置不存在" };
			}

			return this.Get(clientCode, varifyCode, timestamp, tranConfig.MaxCount, tranConfig.Guid.ToString());
		}

		private bool VarifyClient(string clientGuid, string varifyCode)
		{
			var md5Pulickey = Common.MD5(Common.PublicKey);

			return varifyCode.Equals(Common.MD5(md5Pulickey + clientGuid), StringComparison.OrdinalIgnoreCase);
		}
	}
}
