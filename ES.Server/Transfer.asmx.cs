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

        public ResponseData Get(string clientCode, string varifyCode, string lastTimeStamp, int rowCount, string configGuid, IDictionary<string,string> paras)
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

        private bool VarifyClient(string clientGuid, string varifyCode)
        {
            var md5Pulickey = Common.MD5(Common.PublicKey);

            return varifyCode.Equals(Common.MD5(md5Pulickey + clientGuid), StringComparison.OrdinalIgnoreCase);
        }
    }
}
