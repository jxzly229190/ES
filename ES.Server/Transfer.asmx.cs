using ES.Repository;
using ES.Repository.Model;
using ES.Repository.Server;
using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.Services;

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
        public ResponseData Get(string clientCode, string varifyCode, string lastTimeStamp, int rowCount, string configGuid, IDictionary<string,string> paras)
        {
            var client = db.Client.Where(c => c.Status == 0 && c.Code == clientCode).FirstOrDefault();

            if (client == null)
            {
                return new ResponseData() { State = 1, Message = "客户端不存在" };
            }

            if (!VarifyClient(client.GUID.ToString(), varifyCode))
            {
                return new ResponseData() { State = 2, Message = "非法请求" };
            }

            var config = db.TranConfig.Where(c => c.Status == 0 && c.Guid.ToString() == configGuid).FirstOrDefault();

            if (config == null)
            {
                return new ResponseData() { State = 3, Message = "没有找到相应的配置" };
            }

            var detailSql = config.DetailSql.Replace("$timestamp$", lastTimeStamp).Replace("$rowCount$", rowCount.ToString());

            if (paras != null && paras.Count > 0)
            {
                foreach (var item in paras)
                {
                    detailSql = detailSql.Replace("$" + item.Key + "$", item.Value);
                }
            }

            var result = db.ExecuteQuery<string>(detailSql);

            string sql="";

            if (result != null && result.Count()>0)
            {
                foreach (var res in result)
                {
                    sql += res + ";";
                }
            }

            var response = new ResponseData() { State = 0, HeaderSql=config.HeaderSql, DetailSql=sql, FooterSql=config.FooterSql };

            return response;
        }

		/// <summary>
		/// 获取传输配置
		/// </summary>
		/// <returns></returns>
		[WebMethod]
		public IEnumerable<TranConfig> GetTranConfigs(System.Data.Linq.Binary timestamp)
		{			
			return db.ExecuteQuery<TranConfig>("Select * from tranconfig where status=0 and timestamp>{0}",timestamp);
		}

        private bool VarifyClient(string clientGuid, string varifyCode)
        {
            var md5Pulickey = Common.MD5(Common.PublicKey);

            return varifyCode.Equals(Common.MD5(md5Pulickey + clientGuid), StringComparison.OrdinalIgnoreCase);
        }
    }
}
