using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Windows.Forms;
using ES.Repository;
using ES.Client.ServiceReference;
using System.Threading;
using System.Data.Linq;

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
        
        private string tranferNo = string.Empty;

        private void Main_Load(object sender, EventArgs e)
        {
            //ReloadLog(null);
            //_db.ObjectTrackingEnabled = false;
            tl_pName.Text = "传输状态：";
            tl_tName.Text = "准备";
        }

        private bool LoadServiceAddress()
        {
            var url = util.GetSetting("serviceUrl");
            if (string.IsNullOrWhiteSpace(url))
            {
                MessageBox.Show("请先配置服务器地址");
                return false;
            }
            _server.Endpoint.Address = new EndpointAddress(util.GetSetting("serviceUrl"));
            return true;
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
            _db=new dbDataContext();

            lock (_lockFlag)
            {
                try
                {
                    UpdateConfigs();

                    var md5Pulickey = Common.MD5(Common.PublicKey);
                    string clientCode;
                    string clientGuid = QueryCurrentClientGuid(out clientCode);

                    List<TranConfig> configs =
                        _db.TranConfigs.Where(
                            tranConfig => tranConfig.Status == 0 && tranConfig.Code != "PZSJ" && tranConfig.Sort >= 0)
                            .ToList();

                    foreach (var config in configs)
                    {
                        try
                        {
                            if (config.Direct == 0)
                            {
                                GetDataFromServer(formObj, config, md5Pulickey, clientCode, clientGuid);
                            }
                            else if (config.Direct == 1)
                            {
                                PostDataToServer(formObj, config, md5Pulickey, clientCode, clientGuid);
                            }
                            else if (config.Direct == 2)
                            {
                                //先提交再更新
                                PostDataToServer(formObj, config, md5Pulickey, clientCode, clientGuid);

                                GetDataFromServer(formObj, config, md5Pulickey, clientCode, clientGuid);
                            }
                            else
                            {
                                _syncContext.Post(formObj.HandleError, "传输方向常异，无法处理。");
                                return;
                            }
                        }
                        catch (Exception ex)
                        {
                            //只有重要传输才终断程序运行，否则继续。
                            if (config.Import == 2)
                            {
                                _syncContext.Post(formObj.HandleError, ex.Message);
                                return;
                            }
                            continue;
                        }
                    }

                    if (formObj != null)
                    {
                        formObj.ShowTranferName("数据更新完成");
                        _syncContext.Post(formObj.ReloadLog, _db.TranLogs.OrderByDescending(p => p.ID).Take(200).ToList());
                    }
                }
                catch (Exception ex)
                {
                    if (formObj != null)
                    {
                        _syncContext.Post(formObj.HandleError, "错误原因：" + ex.Message);
                    }
                }
                finally
                {
                    if (formObj != null)
                    {
                        _syncContext.Post(formObj.FinishTransfer, null);
                    }
                }
            }
        }

        private void PostDataToServer(Main formObj, TranConfig config, string md5Pulickey, string clientCode, string clientGuid)
        {
            if (formObj != null)
            {
                //formObj.ShowTranferName("推送" + config.Name);
                _syncContext.Post(formObj.ShowTranferName, "上传 " + config.Name);
            }

            Post(md5Pulickey, clientCode, clientGuid, config);
            if (formObj != null)
                _syncContext.Post(formObj.ReloadLog, _db.TranLogs.OrderByDescending(p => p.ID).Take(200).ToList());
        }

        private void GetDataFromServer(Main formObj, TranConfig config, string md5Pulickey, string clientCode, string clientGuid)
        {
            if (formObj != null)
            {
                _syncContext.Post(formObj.ShowTranferName, "下载 " + config.Name);
                Get(md5Pulickey, clientCode, clientGuid, config);
                _syncContext.Post(formObj.ReloadLog, _db.TranLogs.OrderByDescending(p => p.ID).Take(200).ToList());
            }
        }

        public void HandleError(object msg)
        {
            MessageBox.Show(msg.ToString(), "错误", MessageBoxButtons.OK, MessageBoxIcon.Error);
            this.FinishTransfer(null);
        }

        private void Get(string md5Pulickey, string clientCode, string clientGuid, TranConfig config)
        {
            SqlData sqlData = null;
            TranLog log = null;
            string sql = string.Empty;
            bool isError = false;
            int times = -1;
            do
            {
                var result = _server.Get(tranferNo, clientCode, Common.MD5(md5Pulickey + clientGuid), Convert.ToInt64(config.Sstamp), config.MaxCount, config.Guid.ToString(), null);

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
                        TranTime = DateTime.Now
                    };

                    isError = true;
                    break;
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
                        TranTime = DateTime.Now
                    };

                    _db.ExecuteCommand(string.Format(
                        "Update tranconfig Set Sstamp={0} Where Guid='{1}'",
                        result.MaxStamp, config.Guid));
                    break;
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
                        TranTime = DateTime.Now
                    };

                    isError = true;
                    break;
                }

                string errorMsg = null;
                try
                {
                    this.UpdateDbByResponse(sqlData, config.Guid.ToString(), config.TargetTableName, config.BlobColumn,
                        out sql);
                    config.Sstamp = sqlData.MaxTMstamp;
                    //_db.SubmitChanges();
                }
                catch (Exception ex)
                {
                    errorMsg = ex.Message;

                    log = new TranLog()
                    {
                        Client = clientCode,
                        ConfigCode = config.Code,
                        ConfigName = config.Name,
                        Count = sqlData.RowCount,
                        Direct = 0,
                        Result = "更新出错，详情见备注。",
                        Sort = config.Sort,
                        Detail = sql,
                        TranTime = DateTime.Now,
                        Remark = errorMsg
                    };

                    isError = true;
                    break;
                }

                times += 1;
            }
            while (sqlData.RowCount >= config.MaxCount);

            try
            {
                if(log==null)
                {
                    log = new TranLog()
                    {
                        Client = clientCode,
                        ConfigCode = config.Code,
                        ConfigName = config.Name,
                        Count = (times*config.MaxCount) + sqlData.RowCount,
                        Direct = 0,
                        Result = "下载数据成功。",
                        Sort = config.Sort,
                        TranTime = DateTime.Now
                    };
                }
                _db.TranLogs.InsertOnSubmit(log);
                _db.SubmitChanges();
            }
            catch (System.Data.Linq.ChangeConflictException conflictEx)
            {
                _db.ChangeConflicts.ResolveAll(RefreshMode.OverwriteCurrentValues);//保持原来的更新,放弃了当前的值.
                _db.SubmitChanges();
                if (isError)
                    throw new Exception("获取数据发生异常，详情请查看传输日志。");
            }
        }

        private void Post(string md5Pulickey, string clientCode, string clientGuid, TranConfig config)
        {
            List<ES.Repository.Model.QueryResult> results = null;
            TranLog log = null;
            bool isError = false;
            StringBuilder sql = new StringBuilder();
            long lastStamp = Convert.ToInt64(config.Cstamp);

            do
            {
                var detailSql = config.DetailSql.Replace("$lastStamp$", lastStamp.ToString())
                    .Replace("$rowCount$", config.MaxCount.ToString());

                if (detailSql.Contains("{templog:"))
                {
                    var sindex = detailSql.IndexOf("{templog:");
                    var eindex = detailSql.IndexOf(":templog}");
                    if (eindex <= -1)
                    {
                        log = new TranLog()
                        {
                            Client = clientCode,
                            ConfigCode = config.Code,
                            ConfigName = config.Name,
                            Count = results.Count(),
                            Direct = 0,
                            Remark = "templog 标志异常，请检查“{templog:”与“{templog:”",
                            Sort = config.Sort,
                            Stamp = config.Cstamp,
                            Header = config.HeaderSql,
                            Detail = detailSql,
                            Footer = config.FooterSql,
                            TranTime = DateTime.Now
                        };

                        isError = true;
                        break;
                    }

                    detailSql = detailSql.Remove(sindex, eindex + 10 - sindex);
                }

                results = _db.ExecuteQuery<ES.Repository.Model.QueryResult>(detailSql).ToList();

                if (results.Any())
                {
                    //sql = results.Aggregate(sql, (current, result) => current + (result.sql + ";"));
                    var blobData = new List<ES.Client.ServiceReference.BlobData>();
                    foreach (var result in results)
                    {
                        sql.Append(result.sql).Append(";");
                        blobData.Add(new BlobData() { Blob = result.Blob, Guid = result.Guid });
                    }
                    var sqlData = new ES.Client.ServiceReference.SqlData()
                    {
                        ConfigGuid = config.Guid.ToString(),
                        RowCount = results.Count(),
                        MaxTMstamp = results.Count(),
                        HeaderSql = config.HeaderSql,
                        DetailSql = sql.ToString(),
                        FooterSql = config.FooterSql,
                        BlobDatas = blobData.ToArray()
                    };

                    var response = _server.Post(tranferNo, clientCode, Common.MD5(md5Pulickey + clientGuid), sqlData);

                    if (response.State == 0)
                    {
                        //更新配置时间戳
                        var maxItem = results.OrderByDescending(c => c.stamp).FirstOrDefault();
                        lastStamp = maxItem == null ? 0 : maxItem.stamp;
                        _db.ExecuteCommand("Update tranconfig Set Cstamp={0} Where Guid={1}", lastStamp, config.Guid);
                    }
                    else
                    {
                        log = new TranLog()
                        {
                            Client = clientCode,
                            ConfigCode = config.Code,
                            ConfigName = config.Name,
                            Count = results.Count(),
                            Direct = 0,
                            Remark = response.Message,
                            Sort = config.Sort,
                            Stamp = config.Cstamp,
                            Header = config.HeaderSql,
                            Detail = sql.ToString(),
                            Footer = config.FooterSql,
                            TranTime = DateTime.Now,
                            Result = "提交数据出错"
                        };

                        isError = true;
                        //继续下一条配置数据传输
                        break;
                    }
                }
            } while (results.Count() >= config.MaxCount);

            try
            {
                if (log == null && !isError)
                {
                    log = new TranLog()
                    {
                        Client = clientCode,
                        ConfigCode = config.Code,
                        ConfigName = config.Name,
                        Count = results.Count(),
                        Direct = 1,
                        Result="上传数据成功",
                        Sort = config.Sort,
                        Stamp = config.Cstamp,
                        TranTime = DateTime.Now
                    };
                }

                _db.TranLogs.InsertOnSubmit(log);
                _db.SubmitChanges();
            }
            catch (System.Data.Linq.ChangeConflictException ex)
            {
                _db.ChangeConflicts.ResolveAll(RefreshMode.OverwriteCurrentValues);//保持原来的更新,放弃了当前的值.
                if(isError)
                    throw;
            }
        }

        private void UpdateConfigs()
        {
            var md5Pulickey = Common.MD5(Common.PublicKey);
            string clientCode;
            string clientGuid = QueryCurrentClientGuid(out clientCode);
            string sql = string.Empty;
            TranLog log = null;

            var config = _db.TranConfigs.FirstOrDefault(c => c.Code == "PZSJ" && c.Status == 0);

            var result = _server.GetTranConfigs(tranferNo, clientCode, Common.MD5(md5Pulickey + clientGuid), config == null ? 0 : Convert.ToInt64(config.Sstamp));

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
                    Stamp = config == null ? 0 : config.Sstamp,
                    TranTime = DateTime.Now
                };

                _db.TranLogs.InsertOnSubmit(log);
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
                    Stamp = config == null ? 0 : config.Sstamp,
                    TranTime = DateTime.Now
                };

                _db.TranLogs.InsertOnSubmit(log);
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
                    Stamp = config == null ? 0 : config.Sstamp,
                    TranTime = DateTime.Now
                };

                _db.TranLogs.InsertOnSubmit(log);
                _db.SubmitChanges();

                //没有获取到数据,直接返回
                return;
            }

            if (config == null)
            {
                config = _db.TranConfigs.FirstOrDefault(c => c.Code == "PZSJ" && c.Status == 0);
            }

            var sqlData = result.data as SqlData;

            if (sqlData == null)
            {
                throw new Exception("转换出错");
            }

            string errorMsg = null;
            try
            {
                UpdateDbByResponse(sqlData, sqlData.ConfigGuid, config.TargetTableName, config.BlobColumn,out sql);
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
                Stamp = sqlData.MaxTMstamp,
                Detail = sql,
                TranTime = DateTime.Now,
                Remark = errorMsg
            };

            _db.TranLogs.InsertOnSubmit(log);
            _db.SubmitChanges();

            if (!string.IsNullOrWhiteSpace(errorMsg))
            {
                throw new Exception("更新TranConfig失败。");
            }
        }

        private void UpdateDbByResponse(SqlData sqlData, string configGuid, string table, string bloblColumn, out string execSql)
        {
            StringBuilder sql = new StringBuilder(sqlData.HeaderSql + ";" + sqlData.DetailSql + ";");
            StringBuilder updateBlobSql=new StringBuilder();
            object[] paramters = null;

            if (!string.IsNullOrEmpty(bloblColumn))
            {
                var blobs = sqlData.BlobDatas;
                paramters = new object[blobs.Length*2];
                for (var i = 0; i < blobs.Length; i++)
                {
                    updateBlobSql.Append("Update ")
                        .Append("#temp_" + table)
                        .Append(" set ")
                        .Append(bloblColumn + "= {" + (i*2) + "}")
                        .Append(" Where [Guid]=")
                        .Append("{" + (i*2 + 1) + "}")
                        .Append(";");

                    paramters[i*2] = blobs[i].Blob;
                    paramters[i*2 + 1] = blobs[i].Guid;
                }
            }

            sql.Append(updateBlobSql)
                .Append(sqlData.FooterSql)
                .Append(";")
                .Append(
                    string.Format(
                        "Update tranconfig Set Sstamp={0},Cstamp=(Select CAST(max(TMStamp) as bigint) From [{1}]) Where Guid='{2}'",
                        sqlData.MaxTMstamp, table, configGuid));

            execSql = sql.ToString();

            if (paramters == null)
            {
                _db.ExecuteCommand(execSql);
            }else
            {
                _db.ExecuteCommand(execSql, paramters);
            }
        }

        private string QueryCurrentClientGuid(out string clientCode)
        {
            var client = _db.Clients.FirstOrDefault(c => c.Status == 0 && c.IsCurrent == true);

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
            if (!LoadServiceAddress()) {
                return;
            }

            tranferNo = Guid.NewGuid().ToString();

            t = new Thread(new ParameterizedThreadStart(SyncData), 0) {IsBackground = true};

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

        private void FinishTransfer(object o)
        {
            if (t != null && t.IsAlive)
            {
                t.Abort();
            }
            开始传输ToolStripMenuItem.Enabled = true;
            停止传输ToolStripMenuItem.Enabled = false;

            tl_tName.Text = "传输结束";
        }

        private void toolStripMenuItemConfig_Click(object sender, EventArgs e)
        {
            var configForm=new ServiceConfig();
            configForm.ShowDialog();
        }
    }
}
