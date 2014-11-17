using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Windows.Forms;
using ES.Repository;
using ES.Client.ServiceReference;
using System.Threading;

namespace ES.Client
{
    public partial class Main : Form
    {
        private readonly object _lockFlag = new object();
        readonly SynchronizationContext _syncContext = null;

        public Main()
        {
            InitializeComponent();

            _syncContext = SynchronizationContext.Current;
            dgv_log.ReadOnly = true;
        }

        ServiceReference.TransferSoapClient _server = new ServiceReference.TransferSoapClient();
        dbDataContext _db = new dbDataContext();

        private void Main_Load(object sender, EventArgs e)
        {
            LoadServiceAddress();
            ReloadLog(null);
            tl_pName.Text = "传输状态：";
            tl_tName.Text = "准备";
        }

        private void LoadServiceAddress()
        {
            var url = util.GetSetting("serviceUrl");
            if (string.IsNullOrWhiteSpace(url))
            {
                MessageBox.Show("请先配置服务器地址");
                this.Close();
                return;
            }
            _server.Endpoint.Address = new EndpointAddress(util.GetSetting("serviceUrl"));
        }

        public void ShowTranferName(object name)
        {
            tl_tName.Text = name.ToString();
        }

        public void ReloadLog(object listData)
        {
            dgv_log.DataSource = listData;
        }

        private void SyncData(object form)
        {
            var formObj = form as Main;

            lock (_lockFlag)
            {
                try
                {
                    UpdateConfigs();

                    var md5Pulickey = Common.MD5(Common.PublicKey);
                    string clientCode;
                    string clientGuid = QueryCurrentClientGuid(out clientCode);

                    var configs = _db.TranConfig.Where(c => c.Code != "PZSJ" && c.Status == 0 && c.Sort >= 0).ToList();

                    foreach (var config in configs)
                    {
                        if (config.Direct == 0)
                        {
                            if (formObj != null)
                            {
                                _syncContext.Post(formObj.ShowTranferName, "获取" + config.Name);
                                Get(md5Pulickey, clientCode, clientGuid, config);
                                _syncContext.Post(formObj.ReloadLog, _db.TranLog.OrderByDescending(p => p.ID).Take(200).ToList());
                            }
                        }
                        else
                        {
                            if (formObj != null)
                            {
                                //formObj.ShowTranferName("推送" + config.Name);
                                _syncContext.Post(formObj.ShowTranferName, "推送" + config.Name);
                            }

                            Post(md5Pulickey, clientCode, clientGuid, config);
                            if (formObj != null)
                                _syncContext.Post(formObj.ReloadLog, _db.TranLog.OrderByDescending(p => p.ID).Take(200).ToList());
                        }
                    }

                    if (formObj != null)
                    {
                        formObj.ShowTranferName("数据更新完成");
                        _syncContext.Post(formObj.ReloadLog, _db.TranLog.OrderByDescending(p => p.ID).Take(200).ToList());
                    }
                }
                catch (Exception ex)
                {
                    if (formObj != null)
                    {
                        _syncContext.Post(formObj.HandleError, "错误原因：" + ex.Message);
                    }
                }
            }
        }

        public void HandleError(object msg)
        {
            MessageBox.Show(msg.ToString(), "错误", MessageBoxButtons.OK, MessageBoxIcon.Error);
            停止传输ToolStripMenuItem_Click(null, null);
        }

        private void Get(string md5Pulickey, string clientCode, string clientGuid, TranConfig config)
        {
            SqlData sqlData = null;
            do
            {
                var result = _server.Get(clientCode, Common.MD5(md5Pulickey + clientGuid), Convert.ToInt64(config.LastStamp), config.MaxCount, config.Guid.ToString(), null);

                TranLog log = null;
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

                    _db.TranLog.InsertOnSubmit(log);
                    _db.SubmitChanges();
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
                        Result = "没有返回数据",
                        Remark = "已经是最新数据",
                        Sort = config.Sort,
                        Stamp = config.LastStamp,
                        TranTime = DateTime.Now
                    };
                    _db.TranLog.InsertOnSubmit(log);
                    _db.SubmitChanges();
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

                    _db.TranLog.InsertOnSubmit(log);
                    _db.SubmitChanges();
                    return;
                }

                string errorMsg = null;
                try
                {
                    this.UpdateDbByResponse(sqlData, config.Guid.ToString());
                }
                catch (Exception ex)
                {
                    errorMsg = ex.Message;
                }

                config.LastStamp = sqlData.MaxTimeStamp;

                log = new TranLog()
                {
                    Client = clientCode,
                    ConfigCode = config.Code,
                    ConfigName = config.Name,
                    Count = sqlData.RowCount,
                    Direct = 0,
                    Result = errorMsg == null ? "数据更新成功" : "更新出错，详情见备注。",
                    Sort = config.Sort,
                    Stamp = sqlData.MaxTimeStamp,
                    Header = sqlData.HeaderSql,
                    Detail = sqlData.DetailSql,
                    Footer = sqlData.FooterSql,
                    TranTime = DateTime.Now,
                    Remark = errorMsg
                };

                _db.TranLog.InsertOnSubmit(log);
                try
                {
                    _db.SubmitChanges(System.Data.Linq.ConflictMode.ContinueOnConflict);
                }
                catch (System.Data.Linq.ChangeConflictException ex)
                {
                    foreach (System.Data.Linq.ObjectChangeConflict occ in _db.ChangeConflicts)
                    {
                        // 使用当前数据库中的值，覆盖Linq缓存中实体对象的值
                        occ.Resolve(System.Data.Linq.RefreshMode.OverwriteCurrentValues);
                    }

                    // 这个地方要注意，Catch方法中，我们前面只是指明了怎样来解决冲突，这个地方还需要再次提交更新，这样的话，值    //才会提交到数据库。
                    _db.SubmitChanges();

                }
            }
            while (sqlData.RowCount == config.MaxCount);
        }

        private void Post(string md5Pulickey, string clientCode, string clientGuid, TranConfig config)
        {
            List<ES.Repository.Model.QueryResult> results = null;
            string sql = "";
            long lastStamp = Convert.ToInt64(config.LastStamp);

            do
            {
                var detailSql = config.DetailSql.Replace("$lastStamp$", lastStamp.ToString()).Replace("$rowCount$", config.MaxCount.ToString()).Replace("from", " as sql,cast(timestamp as bigint) as stamp from");

                results = _db.ExecuteQuery<ES.Repository.Model.QueryResult>(detailSql).ToList();

                if (results.Any())
                {
                    sql = results.Aggregate(sql, (current, result) => current + (current + ";"));
                    var sqlData = new ES.Client.ServiceReference.SqlData() { ConfigGuid = config.Guid.ToString(), RowCount = results.Count(), MaxTimeStamp = results.Count(), HeaderSql = config.HeaderSql, DetailSql = sql, FooterSql = config.FooterSql };

                    var response = _server.Post(clientCode, Common.MD5(md5Pulickey + clientGuid), sqlData);

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
                        _db.ExecuteCommand("Update tranconfig Set lastStamp={0} Where Guid={1}", lastStamp, config.Guid);

                        log.Result = "提交数据成功";
                        _db.TranLog.InsertOnSubmit(log);
                        _db.SubmitChanges();
                    }
                    else
                    {
                        log.Result = "提交数据出错";
                        _db.TranLog.InsertOnSubmit(log);
                        _db.SubmitChanges();

                        //继续下一条配置数据传输
                        break;
                    }
                }
            } while (results.Count() == config.MaxCount);
        }

        private void UpdateConfigs()
        {
            var md5Pulickey = Common.MD5(Common.PublicKey);
            string clientCode;
            string clientGuid = QueryCurrentClientGuid(out clientCode);
            TranLog log = null;

            var config = _db.TranConfig.FirstOrDefault(c => c.Code == "PZSJ" && c.Status == 0);

            var result = _server.GetTranConfigs(clientCode, Common.MD5(md5Pulickey + clientGuid), config == null ? 0 : Convert.ToInt64(config.LastStamp));

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
                    Stamp = config == null ? 0 : config.LastStamp,
                    TranTime = DateTime.Now
                };

                _db.TranLog.InsertOnSubmit(log);
                _db.SubmitChanges();

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
                    Remark = result.Message,
                    Sort = -1,
                    Stamp = config == null ? 0 : config.LastStamp,
                    TranTime = DateTime.Now
                };

                _db.TranLog.InsertOnSubmit(log);
                _db.SubmitChanges();

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
                    Remark = "已经是最新数据",
                    Sort = -1,
                    Stamp = config == null ? 0 : config.LastStamp,
                    TranTime = DateTime.Now
                };

                _db.TranLog.InsertOnSubmit(log);
                _db.SubmitChanges();

                //没有获取到数据,直接返回
                return;
            }

            if (config == null)
            {
                config = _db.TranConfig.FirstOrDefault(c => c.Code == "PZSJ" && c.Status == 0);
            }

            var sqlData = result.data as SqlData;

            if (sqlData == null)
            {
                throw new Exception("转换出错");
            }

            string errorMsg = null;
            try
            {
                UpdateDbByResponse(sqlData, sqlData.ConfigGuid);
            }
            catch (Exception ex)
            {
                errorMsg = ex.Message;
            }

            log = new TranLog()
            {
                Client = clientCode,
                ConfigCode = "PZSJ",
                ConfigName = "传输配置数据",
                Direct = 0,
                Count = sqlData.RowCount,
                Result = errorMsg == null ? "更新数据成功" : "更新出错，详情见备注。",
                Sort = -1,
                Stamp = sqlData.MaxTimeStamp,
                Header = sqlData.HeaderSql,
                Detail = sqlData.DetailSql,
                Footer = sqlData.FooterSql,
                TranTime = DateTime.Now,
                Remark = errorMsg
            };
            _db.TranLog.InsertOnSubmit(log);
            _db.SubmitChanges();
        }

        private void UpdateDbByResponse(SqlData sqlData, string configGuid)
        {
            _db.ExecuteCommand(sqlData.HeaderSql + ";" + sqlData.DetailSql + ";" + sqlData.FooterSql + ";" + "Update tranconfig Set lastStamp={0} Where Guid={1}", sqlData.MaxTimeStamp, configGuid);
        }

        private string QueryCurrentClientGuid(out string clientCode)
        {
            var client = _db.Client.FirstOrDefault(c => c.Status == 0 && c.IsCurrent == true);

            if (client == null)
            {
                throw new Exception("当前Client为空");
            }

            clientCode = client.Code;

            return client.GUID.ToString();
        }

        private void toolStripStatusLabel2_Click(object sender, EventArgs e)
        {

        }

        private void q退出ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("您确定退出吗？", "提示", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
                this.Close();
        }

        Thread t = null;
        private void 开始传输ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            t = new Thread(new ParameterizedThreadStart(SyncData), 0);
            t.IsBackground = true;

            t.Start(this);

            开始传输ToolStripMenuItem.Enabled = false;
        }

        private void 停止传输ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (t != null && t.IsAlive)
            {
                t.Abort();
            }

            开始传输ToolStripMenuItem.Enabled = true;
            停止传输ToolStripMenuItem.Enabled = false;
            this.ShowTranferName("传输停止");
        }

        private void toolStripMenuItemConfig_Click(object sender, EventArgs e)
        {
            var configForm=new ServiceConfig();
            configForm.ShowDialog();
        }
    }
}
