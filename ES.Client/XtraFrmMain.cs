using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Drawing;
using System.ServiceModel;
using System.Text;
using System.Linq;
using System.Threading;
using System.Windows.Forms;
using DevExpress.XtraBars;
using DevExpress.XtraBars.Helpers;
using DevExpress.XtraGrid.Views.Grid;
using ES.Client.ServiceReference;
using ES.Repository;

namespace ES.Client
{
    public partial class XtraFrmMain : DevExpress.XtraEditors.XtraForm
    {
        private bool isStart = false;
        private DateTime lastTransferTime;
        private readonly object _lockFlag = new object();
        readonly SynchronizationContext _syncContext = null;
        ServiceReference.TransferSoapClient _server = new ServiceReference.TransferSoapClient();
        dbDataContext _db = new dbDataContext();
        private string tranferNo = string.Empty;
        Thread t = null;
        private System.Windows.Forms.Timer timer = null;

        public XtraFrmMain()
        {
            InitializeComponent();
            _syncContext = SynchronizationContext.Current;
            InitComponents();

            LoadGridData();
        }

        private void InitComponents()
        {
            timer = new System.Windows.Forms.Timer();
            lastTransferTime = DateTime.Now;
            timer.Interval = 1000;
            timer.Tick += timer_Tick;

            SkinHelper.InitSkinGallery(ribbonGalleryBarItem1, true);

            barBtnStop.Enabled = false;
            barButtonItemRestart.Enabled = false;
        }

        void timer_Tick(object sender, EventArgs e)
        {
            var mins = Convert.ToInt32(barEditItemTimeSpan.EditValue);
            var minSpan = mins*60 - (DateTime.Now - lastTransferTime).TotalSeconds;
            barStaticItemStatus.Caption = string.Format("距离下次传输还有 {0}分{1}秒", (int) minSpan/60, (int) minSpan%60);

            if (minSpan<=0){
                this.StartTransfer();
            }
        }

        private void ShowLogDetail(string html)
        {
            recLogDetail.Document.HtmlText = html;
        }

        private void LoadGridData()
        {
            var count = Convert.ToInt16(barCboxRowCount.EditValue);
            var days = Convert.ToInt16(barEditItemDays.EditValue);

            var logs = _db.TranLog.Where(l => l.TranTime >= DateTime.Now.Date.AddDays(-days)).OrderByDescending(l=>l.ID).Take(count).ToList();
            gridLog.DataSource = logs;
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
            barStaticItemStatus.Caption = name.ToString();
        }

        public void InsertLogToGrid(object log) {
            var logs = gridView1.DataSource as List<TranLog>;
            if (logs != null) {
                logs.Insert(0, log as TranLog);
                gridView1.RefreshData();
            }
        }

        private void SyncData(object form)
        {
            XtraFrmMain formObj = form as XtraFrmMain;
            _db = new dbDataContext();

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
                        _syncContext.Post(formObj.ShowTranferName, "数据更新完成");
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

        private void PostDataToServer(XtraFrmMain formObj, TranConfig config, string md5Pulickey, string clientCode, string clientGuid)
        {
            if (formObj != null)
            {
                _syncContext.Post(formObj.ShowTranferName, "上传 " + config.Name);
            }

            Post(formObj, md5Pulickey, clientCode, clientGuid, config);
        }

        private void GetDataFromServer(XtraFrmMain formObj, TranConfig config, string md5Pulickey, string clientCode, string clientGuid)
        {
            if (formObj != null)
            {
                _syncContext.Post(formObj.ShowTranferName, "下载 " + config.Name);
                Get(formObj, md5Pulickey, clientCode, clientGuid, config);
            }
        }

        public void HandleError(object msg)
        {
            MessageBox.Show(msg.ToString(), "错误", MessageBoxButtons.OK, MessageBoxIcon.Error);
            this.FinishTransfer(null);
        }

        private void Get(XtraFrmMain formObj, string md5Pulickey, string clientCode, string clientGuid, TranConfig config)
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
                    log = new TranLog(){
                        Client = clientCode,
                        TransferNo = tranferNo,
                        ConfigCode = config.Code,
                        ConfigName = config.Name,
                        Count = 0,
                        Direct = 0,
                        IsSuccess = false,
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
                        TransferNo = tranferNo,
                        ConfigCode = config.Code,
                        ConfigName = config.Name,
                        Count = 0,
                        Direct = 0,
                        IsSuccess = true,
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
                        TransferNo = tranferNo,
                        ConfigName = config.Name,
                        Count = 0,
                        Direct = 0,
                        IsSuccess = false,
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
                    config.Sstamp = sqlData.MaxTimeStamp;
                    //_db.SubmitChanges();
                }
                catch (Exception ex)
                {
                    errorMsg = ex.Message;

                    log = new TranLog()
                    {
                        Client = clientCode,
                        ConfigCode = config.Code,
                        TransferNo = tranferNo,
                        ConfigName = config.Name,
                        Count = 0,
                        Direct = 0,
                        IsSuccess = false,
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
                if (log == null)
                {
                    log = new TranLog()
                    {
                        Client = clientCode,
                        ConfigCode = config.Code,
                        ConfigName = config.Name,
                        TransferNo = tranferNo,
                        Count = (times * config.MaxCount) + sqlData.RowCount,
                        Direct = 0,
                        IsSuccess = true,
                        Result = "下载数据成功。",
                        Sort = config.Sort,
                        TranTime = DateTime.Now
                    };
                }
                _db.TranLog.InsertOnSubmit(log);
                _db.SubmitChanges();

                if (formObj != null)
                    _syncContext.Post(formObj.InsertLogToGrid, log);
            }
            catch (System.Data.Linq.ChangeConflictException conflictEx)
            {
                _db.ChangeConflicts.ResolveAll(RefreshMode.OverwriteCurrentValues);//保持原来的更新,放弃了当前的值.
                _db.SubmitChanges();
                if (isError)
                    throw new Exception("获取数据发生异常，详情请查看传输日志。");
            }
        }

        private void Post(XtraFrmMain formObj, string md5Pulickey, string clientCode, string clientGuid, TranConfig config)
        {
            List<ES.Repository.Model.QueryResult> results = null;
            TranLog log = null;
            bool isError = false;
            StringBuilder sql = new StringBuilder();
            long lastStamp = Convert.ToInt64(config.Cstamp);
            int times = -1;

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
                            TransferNo = tranferNo,
                            Count = 0,
                            Direct = 0,
                            IsSuccess = false,
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
                        MaxTimeStamp = results.Count(),
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
                            TransferNo = tranferNo,
                            Count = 0,
                            Direct = 0,
                            IsSuccess = false,
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
                times += 1;
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
                        TransferNo = tranferNo,
                        Count = times*config.MaxCount + results.Count(),
                        Direct = 1,
                        IsSuccess = true,
                        Result = "上传数据成功",
                        Sort = config.Sort,
                        Stamp = config.Cstamp,
                        TranTime = DateTime.Now
                    };
                }

                _db.TranLog.InsertOnSubmit(log);
                _db.SubmitChanges();

                if (formObj != null)
                    _syncContext.Post(formObj.InsertLogToGrid, log);
            }
            catch (System.Data.Linq.ChangeConflictException ex)
            {
                _db.ChangeConflicts.ResolveAll(RefreshMode.OverwriteCurrentValues);//保持原来的更新,放弃了当前的值.
                if (isError)
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
                    TransferNo = tranferNo,
                    Direct = 0,
                    Count = 0,
                    Result = "返回数据出错",
                    IsSuccess = false,
                    Sort = -1,
                    Stamp = config == null ? 0 : config.Sstamp,
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
                    TransferNo = tranferNo,
                    ConfigCode = "PZSJ",
                    ConfigName = "传输配置数据",
                    Direct = 0,
                    Count = 0,
                    Result = "服务器发生错误",
                    Remark = result.Message,
                    Sort = -1,
                    IsSuccess = false,
                    Stamp = config == null ? 0 : config.Sstamp,
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
                    TransferNo = tranferNo,
                    ConfigCode = "PZSJ",
                    ConfigName = "传输配置数据",
                    Direct = 0,
                    Count = 0,
                    Result = "没有返回数据",
                    Remark = "已经是最新数据",
                    Sort = -1,
                    IsSuccess = true,
                    Stamp = config == null ? 0 : config.Sstamp,
                    TranTime = DateTime.Now
                };

                _db.TranLog.InsertOnSubmit(log);
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
                UpdateDbByResponse(sqlData, sqlData.ConfigGuid, config.TargetTableName, config.BlobColumn, out sql);
            }
            catch (Exception ex)
            {
                errorMsg = ex.Message;
            }

            log = new TranLog()
            {
                Client = clientCode,
                TransferNo = tranferNo,
                ConfigCode = "PZSJ",
                ConfigName = "传输配置数据",
                Direct = 0,
                Count = errorMsg == null ?sqlData.RowCount:0,
                Result = errorMsg == null ? "更新数据成功" : "更新出错，详情见备注。",
                IsSuccess = errorMsg==null,
                Sort = -1,
                Stamp = sqlData.MaxTimeStamp,
                Detail = sql,
                TranTime = DateTime.Now,
                Remark = errorMsg
            };

            _db.TranLog.InsertOnSubmit(log);
            _db.SubmitChanges();

            if (!string.IsNullOrWhiteSpace(errorMsg))
            {
                throw new Exception("更新TranConfig失败。");
            }
        }

        private void UpdateDbByResponse(SqlData sqlData, string configGuid, string table, string bloblColumn, out string execSql)
        {
            StringBuilder sql = new StringBuilder(sqlData.HeaderSql + ";" + sqlData.DetailSql + ";");
            StringBuilder updateBlobSql = new StringBuilder();
            object[] paramters = null;

            if (!string.IsNullOrEmpty(bloblColumn))
            {
                var blobs = sqlData.BlobDatas;
                paramters = new object[blobs.Length * 2];
                for (var i = 0; i < blobs.Length; i++)
                {
                    updateBlobSql.Append("Update ")
                        .Append("#temp_" + table)
                        .Append(" set ")
                        .Append(bloblColumn + "= {" + (i * 2) + "}")
                        .Append(" Where [Guid]=")
                        .Append("{" + (i * 2 + 1) + "}")
                        .Append(";");

                    paramters[i * 2] = blobs[i].Blob;
                    paramters[i * 2 + 1] = blobs[i].Guid;
                }
            }

            sql.Append(updateBlobSql)
                .Append(sqlData.FooterSql)
                .Append(";")
                .Append(
                    string.Format(
                        "Update tranconfig Set Sstamp={0},Cstamp=(Select CAST(max(timestamp) as bigint) From [{1}]) Where Guid='{2}'",
                        sqlData.MaxTimeStamp, table, configGuid));

            execSql = sql.ToString();

            if (paramters == null)
            {
                _db.ExecuteCommand(execSql);
            }
            else
            {
                _db.ExecuteCommand(execSql, paramters);
            }
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

        private void FinishTransfer(object o)
        {
            if (t != null && t.IsAlive)
            {
                t.Abort();
            }

            barStaticItemStatus.Caption = "传输结束";
            barEditItemProgress.Visibility = BarItemVisibility.Never;

            this.timer.Start();
            lastTransferTime = DateTime.Now;

            SetActions();
        }

        private void SetActions()
        {
            if (isStart)
            {
                barBtnStart.Enabled = false;
                barBtnStop.Enabled = true;
                barButtonItemRestart.Enabled = true;
            }
            else
            {
                barBtnStart.Enabled = true;
                barBtnStop.Enabled = false;
                barButtonItemRestart.Enabled = false;
            }
        }

        private void StartTransfer()
        {
            this.timer.Stop();

            tranferNo = Guid.NewGuid().ToString();

            if (t != null && t.IsAlive)
            {
                t.Abort();
            }

            t = new Thread(new ParameterizedThreadStart(SyncData), 0) {IsBackground = true};

            t.Start(this);

            barStaticItemStatus.Caption = "开始传输";
            barEditItemProgress.Visibility = BarItemVisibility.Always;

            SetActions();
        }

        #region 事件开始

        private void barBtnStart_ItemClick(object sender, ItemClickEventArgs e)
        {
            if (!LoadServiceAddress())
            {
                return;
            }

            isStart = true;
            StartTransfer();
        }

        private void barButtonItemRestart_ItemClick(object sender, ItemClickEventArgs e)
        {
            StartTransfer();
        }

        private void barBtnStop_ItemClick(object sender, ItemClickEventArgs e)
        {
            FinishTransfer(null);
            
            this.timer.Stop();
            isStart = false;
            barStaticItemStatus.Caption = "传输结束";
            SetActions();

        }

        private void gridView1_FocusedRowChanged(object sender, DevExpress.XtraGrid.Views.Base.FocusedRowChangedEventArgs e)
        {
            if (e.FocusedRowHandle < 0)
            {
                return;
            }

            List<TranLog> data = gridView1.DataSource as List<TranLog>;

            if (data != null && data.Count > 0)
            {
                var log = data[gridView1.GetDataSourceRowIndex(e.FocusedRowHandle)];

                StringBuilder htmlText = new StringBuilder();

                htmlText.Append("<h3>传输项目：").Append(log.ConfigName).Append("<h3/>");
                htmlText.Append("<h4>项目代码：").Append(log.ConfigCode).Append("<h4/>");
                htmlText.Append("<h4>是否成功：").Append(log.IsSuccess == true ? "是" : "否");

                if (log.IsSuccess == true)
                {
                    htmlText.Append("&nbsp;&nbsp;&nbsp;&nbsp;").Append("传输行数：").Append(log.Count);
                }
                htmlText.Append("<h4/>");
                htmlText.Append("<h4>传输时间：").Append(log.TranTime).Append("<h4/>");
                htmlText.Append("<h4>传输方向：").Append(log.Direct == 0 ? "总部到门店" : log.Direct == 1 ? "门店到总部" : "双向传输").Append("<h4/>");
                htmlText.Append("<h4>处理结果：").Append(log.Result).Append("<h4/>");
                htmlText.Append("<h4>备注：").Append(log.Remark).Append("<h4/>");

                if (log.IsSuccess == false)
                {
                    htmlText.Append("<h4>Sql</h4>").Append("<p>Header: ").AppendLine(log.Header).Append("</p><p>Detail: ").AppendLine(log.Detail).Append("</p><p>Footer: ").AppendLine(log.Footer).Append("<p/>");
                }

                ShowLogDetail(htmlText.ToString());
            }
        }

        private void gridView1_CustomUnboundColumnData(object sender, DevExpress.XtraGrid.Views.Base.CustomColumnDataEventArgs e)
        {
            if (e.Column.FieldName == "icon" && e.IsGetData)
            {
                GridView view = sender as GridView;
                var log = e.Row as TranLog;
                if (log != null)
                {
                    try
                    {
                        string fileName = log.IsSuccess == true ? "success.png" : "fail.png";
                        string filePath = DevExpress.Utils.FilesHelper.FindingFileName(Application.StartupPath, "images/" + fileName, false);
                        var img = Image.FromFile(filePath);
                        //Images.Add(img, fileName);
                        e.Value = img;
                    }
                    catch { }
                }
            }
        }

        private void gridView1_CustomDrawCell(object sender, DevExpress.XtraGrid.Views.Base.RowCellCustomDrawEventArgs e)
        {
            if (e.Column.FieldName == "Direct")
            {
                if (e.CellValue.Equals(0))
                {
                    e.DisplayText = "下载";
                }
                else
                {
                    e.DisplayText = "上传";
                }
            }
        }

        private void gridView1_CustomDrawRowIndicator(object sender, RowIndicatorCustomDrawEventArgs e)
        {
            if (e.Info.IsRowIndicator && e.RowHandle >= 0)
            {
                e.Info.DisplayText = (e.RowHandle + 1).ToString();
            }
        }

        private void barBtnRefresh_ItemClick(object sender, ItemClickEventArgs e)
        {
            LoadGridData();
        }

        private void repositoryItemComboBoxDays_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (barEditItemDays.EditValue == null || Convert.ToInt32(barEditItemDays.EditValue) <= 0)
            //{
            //    barEditItemDays.EditValue = 0;
            //}

            //LoadGridData();
        }

        private void repositoryItemComboBoxDays_EditValueChanged(object sender, EventArgs e)
        {
            //int days = 0;
            //if (int.TryParse(barEditItemDays.EditValue.ToString(),out days))
            //{
            //    MessageBox.Show("请输入数字。");
            //    return;
            //}

            //if (barEditItemDays.EditValue == null || days <= 0)
            //{
            //    barEditItemDays.EditValue = 0;
            //}

            //LoadGridData();
        }

        private void repositoryItemComboBox1_SelectedValueChanged(object sender, EventArgs e)
        {
            //if (barCboxRowCount.EditValue == null || Convert.ToInt32(barCboxRowCount.EditValue) <= 0)
            //{
            //    barCboxRowCount.EditValue = 0;
            //}

            //LoadGridData();
        }

        private void repositoryItemComboBox1_EditValueChanged(object sender, EventArgs e)
        {
            //if (barCboxRowCount.EditValue == null || Convert.ToInt32(barCboxRowCount.EditValue) <= 0)
            //{
            //    barCboxRowCount.EditValue = 0;
            //}

            //LoadGridData();
        }

        private void repositoryItemSpinEdit1_EditValueChanged(object sender, EventArgs e)
        {
            lastTransferTime = DateTime.Now;
        }

        private void barBtnAddClient_ItemClick(object sender, ItemClickEventArgs e)
        {
            MessageBox.Show("本功能尚未添加，请手动在数据库配置。");
        }

        private void barBtnAddServer_ItemClick(object sender, ItemClickEventArgs e)
        {
            MessageBox.Show("本功能尚未添加，请手动在App.config文件中注册。");
        }

        #endregion 事件结束
    }
}