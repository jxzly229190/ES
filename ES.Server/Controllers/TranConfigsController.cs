using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace ES.Server.Controllers
{
    [Authorize]
    public class TranConfigsController : Controller
    {
        private Entities db = new Entities();

        // GET: TranConfigs
        public ActionResult Index()
        {
            return View(db.TranConfig.Where(t => t.Status != 255).ToList());
        }

        // GET: TranConfigs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TranConfig tranConfig = db.TranConfig.Find(id);
            if (tranConfig == null)
            {
                return HttpNotFound();
            }
            return View(tranConfig);
        }

        // GET: TranConfigs/Create
        public ActionResult Create()
        {
            var model = new TranConfig();
            return View(model);
        }

        // POST: TranConfigs/Create
        // 为了防止“过多发布”攻击，请启用要绑定到的特定属性，有关 
        // 详细信息，请参阅 http://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Guid,Name,Code,Sort,MaxCount,Cstamp,Sstamp,SourceTableName,TargetTableName,ColumnList,BlobColumn,Direct,Import,HeaderSql,DetailSql,FooterSql,Remark,Status,TMstamp,CreatedTime,CreatedBy,ModifiedTime,ModifiedBy")] TranConfig tranConfig)
        {
            if (ModelState.IsValid)
            {
                if (db.TranConfig.FirstOrDefault(t => t.Code == tranConfig.Code) != null)
                {
                    ModelState.AddModelError("Code", "传输编码 " + tranConfig.Code + " 已被使用，请更换。");
                    return View(tranConfig);
                }

                tranConfig.Guid = Guid.NewGuid();
                tranConfig.Status = 0;
                tranConfig.CreatedBy = User.Identity.Name;
                tranConfig.CreatedTime = DateTime.Now;

                db.TranConfig.Add(tranConfig);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tranConfig);
        }

        public JsonResult GetColumnsByTableName(string table)
        {
            var cols =
                db.Database.SqlQuery<string>(
                    "select COLUMN_NAME+','+DATA_TYPE from INFORMATION_SCHEMA.COLUMNS Where TABLE_NAME = @table",
                    new SqlParameter("@table", table));
            
            List<string> cs=new List<string>();
            foreach (var col in cols)
            {
                var fields = col.Split(',');
                if (fields[0].ToUpper() != "ID" && fields[1].ToLower() != "timestamp")
                {
                    if (fields[1].EndsWith("varbinary"))
                    {
                        cs.Add(fields[0]+"(Blob)");
                    }
                    else
                    {
                        cs.Add(fields[0]);
                    }
                }
            }

            return Json(cs, JsonRequestBehavior.AllowGet);
        }

        // GET: TranConfigs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TranConfig tranConfig = db.TranConfig.FirstOrDefault(t => t.ID == id && t.Status != 255);
            if (tranConfig == null)
            {
                return HttpNotFound();
            }
            return View(tranConfig);
        }

        // POST: TranConfigs/Edit/5
        // 为了防止“过多发布”攻击，请启用要绑定到的特定属性，有关 
        // 详细信息，请参阅 http://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Guid,Name,Code,Sort,MaxCount,SourceTableName,TargetTableName,BlobColumn,,Direct,HeaderSql,DetailSql,FooterSql,Remark,Status,TMstamp,CreatedTime,CreatedBy,ModifiedTime,ModifiedBy")] TranConfig tranConfig)
        {
            if (ModelState.IsValid)
            {
                if (db.TranConfig.FirstOrDefault(t => t.Code == tranConfig.Code&&t.ID!=tranConfig.ID) != null)
                {
                    ModelState.AddModelError("Code", "传输编码 " + tranConfig.Code + " 已被使用，请更换。");
                    return View(tranConfig);
                }

                var original = db.TranConfig.FirstOrDefault(t => t.ID == tranConfig.ID && t.Status != 255);
                if (original != null)
                {
                    original.Code = tranConfig.Code;
                    original.Name = tranConfig.Name;
                    original.SourceTableName = tranConfig.SourceTableName;
                    original.TargetTableName = tranConfig.TargetTableName;
                    original.BlobColumn = tranConfig.BlobColumn;
                    original.Sort = tranConfig.Sort;
                    original.MaxCount = tranConfig.MaxCount;
                    original.Direct = tranConfig.Direct;
                    original.Import = tranConfig.Import;
                    original.HeaderSql = tranConfig.HeaderSql;
                    original.DetailSql = tranConfig.DetailSql;
                    original.FooterSql = tranConfig.FooterSql;
                    original.Remark = tranConfig.Remark;
                    original.Status = tranConfig.Status;
                    original.ModifiedBy = User.Identity.Name;
                    original.ModifiedTime = DateTime.Now;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                return HttpNotFound();
            }
            return View(tranConfig);
        }

        // GET: TranConfigs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TranConfig tranConfig = db.TranConfig.Find(id);
            if (tranConfig == null)
            {
                return HttpNotFound();
            }
            return View(tranConfig);
        }

        // POST: TranConfigs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TranConfig tranConfig = db.TranConfig.Find(id);
            db.TranConfig.Remove(tranConfig);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
