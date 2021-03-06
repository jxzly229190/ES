﻿using System.Data.Entity;
using System.Text;
using ES.Repository;
using ES.Repository.Model;
using System;
using System.Collections.Generic;
using System.Linq;
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
        Entities db = new Entities();

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
		/// <param name="lastTMstamp">上一次更新数据时间戳</param>
		/// <param name="rowCount">行数</param>
		/// <param name="configGuid">配置标识</param>
		/// <param name="paras">其他参数</param>
		/// <returns></returns>
		[WebMethod]
        public ResponseData Get(string tranferNo, string clientCode, string varifyCode, long lastTMstamp, int rowCount, string configGuid, params object[] paras)
		{
            string detailSql = string.Empty;

			var client = db.Client.FirstOrDefault(c => c.Status == 0 && c.Code == clientCode);            

			if (client == null)
			{
				return new ResponseData() { State = 1, Message = "客户端不存在" };
			}

			if (!VarifyClient(client.GUID.ToString(), varifyCode))
			{
				return new ResponseData() { State = 2, Message = "非法请求" };
			}

			var config = db.TranConfig.FirstOrDefault(c => c.Status == 0 && c.Guid.ToString() == configGuid);

			if (config == null)
			{
				return new ResponseData() { State = 3, Message = "没有找到相应的配置" };
			}

			detailSql = config.DetailSql.Replace("$lastStamp$", lastTMstamp.ToString()).Replace("$rowCount$", rowCount.ToString());
            //todo:将这句配置到网页去生成
            //detailSql = detailSql.Replace("Where",
            //    "Where [Guid] not in (Select [guid] from tranferTempLog where TransferNo = '" + tranferNo +
            //    "' and ConfigCode='" +
            //    config.Code + "') And");
		    detailSql =
		        detailSql.Replace("{templog:", "")
		            .Replace(":templog}", "")
		            .Replace("$tranferNo$", tranferNo)
		            .Replace("$configCode$", config.Code);

			if (paras != null && paras.Length > 0)
			{
				detailSql = string.Format(detailSql, paras);
			}

			try
			{
                var result = db.Database.SqlQuery<QueryResult>(detailSql);//db.ExecuteQuery<QueryResult>(detailSql).ToList();
                List<BlobData> blobData = null;

				string sql = "";                

			    if (result.Any())
			    {
			        blobData = new List<BlobData>();
			        foreach (var res in result)
			        {
			            sql += res.sql + ";";
			            blobData.Add(new BlobData() {Guid = res.Guid, Blob = res.Blob});
			        }
			    }
			    else
			    {
                    var maxStamp = db.Database.SqlQuery<long>("Select Cast(isnull(max([TMstamp]),0) as bigint) [TMstamp] From [" + config.SourceTableName + "]").FirstOrDefault();
                    
                    return new ResponseData() { State = 0, Message = "没有数据了", MaxStamp = maxStamp };
			    }

                //获取最大时间戳
                var maxItem = result.OrderByDescending(d => d.stamp).FirstOrDefault();

			    var response = new ResponseData()
			    {
			        State = 0,
			        data =
			            new SqlData()
			            {
			                HeaderSql = config.HeaderSql,
			                DetailSql = sql,
			                FooterSql = config.FooterSql,
			                MaxTMstamp = maxItem == null ? 0 : maxItem.stamp,
			                RowCount = result.Count(),
			                ConfigGuid = config.Guid.ToString(),
			                BlobDatas = blobData
			            }
			    };

			    return response;
			}
			catch (Exception ex)
			{
                TranLog log = new TranLog() {
                    Guid = Guid.NewGuid(),
                    Client=clientCode,                    
                    TransferNo=tranferNo,
                    IsSuccess=false,
                    Direct=config.Direct,
                    Detail=detailSql.Substring(0,4000),                    
                    Result=ex.Message,
                    Remark=ex.InnerException==null?"":ex.InnerException.Message,
                    TranTime=DateTime.Now
                };

                if (config != null) { 
                    log.ConfigCode=config.Code;
                    log.ConfigName = config.Name;
                    log.Header=config.HeaderSql;
                    log.Footer = config.FooterSql;
                }
                db.Entry<TranLog>(log).State=EntityState.Added;
                db.SaveChanges();

				return new ResponseData() { State = 100, Message = ex.Message };
			}
		}

        [WebMethod]
        public ResponseData Post(string tranferNo, string clientCode, string varifyCode, SqlData sqlData)
        {
            var client = db.Client.FirstOrDefault(c => c.Status == 0 && c.Code == clientCode);

            if (client == null)
            {
                return new ResponseData() { State = 1, Message = "客户端不存在" };
            }

            if (!VarifyClient(client.GUID.ToString(), varifyCode))
            {
                return new ResponseData() { State = 2, Message = "非法请求" };
            }

            var config =
                db.TranConfig.FirstOrDefault(
                    t => t.Status == 0 && t.Guid.ToString().Equals(sqlData.ConfigGuid, StringComparison.OrdinalIgnoreCase));

            if (config == null)
            {
                return new ResponseData() { State = 3, Message = "配置不存在或者已经停用，无法完成数据同步。" };
            }

            //var sql = data.HeaderSql + ";" + data.DetailSql + ";" + data.FooterSql;

            StringBuilder sql = new StringBuilder(sqlData.HeaderSql + ";" + sqlData.DetailSql + ";");
            StringBuilder updateBlobSql = new StringBuilder();
            object[] paramters = null;

            if (!string.IsNullOrEmpty(config.BlobColumn))
            {
                var blobs = sqlData.BlobDatas;
                paramters = new object[blobs.Count * 2];
                for (var i = 0; i < blobs.Count; i++)
                {
                    //todo:
                    //1.#table 的名字：约定为主表的名字
                    //2.Blob列的名字
                    updateBlobSql.Append("Update ")
                        .Append("#temp_" + config.SourceTableName)
                        .Append(" set ")
                        .Append(config.BlobColumn + "= {" + (i * 2) + "}")
                        .Append(" Where [Guid]=")
                        .Append("{" + (i * 2 + 1) + "}")
                        .Append(";");

                    paramters[i * 2] = blobs[i].Blob;
                    paramters[i * 2 + 1] = blobs[i].Guid;
                }
            }

            sql.Append(updateBlobSql)
                .Append(sqlData.FooterSql)
                .Append(";");

            if (config.Direct == 2)
            {
                StringBuilder tempSql = new StringBuilder();
                foreach (var item in sqlData.BlobDatas)
                {
                    tempSql.Append("Insert into tranferTempLog([TransferNo],[ConfigCode],[Guid],[ClientGuid]) select '")
                        .Append(tranferNo)
                        .Append("','")
                        .Append(config.Code)
                        .Append("','")
                        .Append(item.Guid)
                        .Append("','")
                        .Append(client.GUID)
                        .Append("';");
                }
                //db.Database.ExecuteSqlCommand(tempSql.ToString());
                sql.Append(tempSql.ToString());
            }

            try
            {

                if (paramters == null)
                {
                    db.Database.ExecuteSqlCommand(TransactionalBehavior.EnsureTransaction, sql.ToString());
                }
                else
                {
                    db.Database.ExecuteSqlCommand(TransactionalBehavior.EnsureTransaction, sql.ToString(), paramters);
                }
            }
            catch (Exception ex)
            {
                return new ResponseData() { State = 100, Message = ex.Message };
            }

            return new ResponseData() { State = 0, Message = "执行成功" };
        }

	    /// <summary>
		/// 获取传输配置
		/// </summary>
		/// <returns></returns>
		[WebMethod]
		public ResponseData GetTranConfigs(string tranferCode, string clientCode, string varifyCode, long TMstamp)
		{
			var client = db.Client.FirstOrDefault(c => c.Status == 0 && c.Code == clientCode);

			if (client == null)
			{
				return new ResponseData() { State = 1, Message = "客户端不存在" };
			}

			if (!VarifyClient(client.GUID.ToString(), varifyCode))
			{
				return new ResponseData() { State = 2, Message = "非法请求" };
			}

	        this.ClearOldTempLog(client.GUID.ToString(), tranferCode);
            var tranConfig = db.TranConfig.FirstOrDefault(t => t.Code == "PZSJ" && t.Status == 0);

			if (tranConfig == null)
			{
				return new ResponseData() { State = 3, Message = "配置不存在" };
			}

            return this.Get(tranferCode, clientCode, varifyCode, TMstamp, tranConfig.MaxCount, tranConfig.Guid.ToString());
		}

	    private void ClearOldTempLog(string clientGuid, string transferNo)
	    {
	        db.Database.ExecuteSqlCommand(
	            string.Format("Delete [tranferTempLog] Where ClientGuid ='{0}' And TransferNo <>'{1}'", clientGuid,
	                transferNo));
	    }

	    private bool VarifyClient(string clientGuid, string varifyCode)
		{
			var md5Pulickey = Common.MD5(Common.PublicKey);

			return varifyCode.Equals(Common.MD5(md5Pulickey + clientGuid), StringComparison.OrdinalIgnoreCase);
		}
	}
}
