using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ES.Server;
using ES.Server.Models;

namespace ES.Server.Controllers
{
    [Authorize]
    public class TranConfigsController : Controller
    {
        private Entities db = new Entities();

        // GET: TranConfigs
        public ActionResult Index()
        {
            return View(db.TranConfig.ToList());
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
            var model = new CreateTranConfigViewModel();
            var tables =
                db.Database.SqlQuery<string>(
                    "select Table_Name from INFORMATION_SCHEMA.TABLES Where TABLE_NAME not like 'AspNet%' And TABLE_NAME <>'__MigrationHistory'");
            if (tables.Any())
            {
                model.TableNames = new List<SelectListItem>();
                model.ColumnList = new List<SelectListItem>();
                model.TableNames.Add(new SelectListItem(){ Text = "--请选择--", Value = "-1"});
                foreach (var table in tables)
                {
                    model.TableNames.Add(new SelectListItem() {Text = table, Value = table});
                }
            }
            return View(model);
        }

        // POST: TranConfigs/Create
        // 为了防止“过多发布”攻击，请启用要绑定到的特定属性，有关 
        // 详细信息，请参阅 http://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(string Name, string Code, int Sort, int MaxCount, int Direct,string TableNames, string[] ColumnList)
        {
            if (ModelState.IsValid)
            {
                //todo:生成Sql代码
                //db.TranConfig.Add(model);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View();
        }

        public JsonResult GetColumnsByTableName(string table)
        {
            var cols =
                db.Database.SqlQuery<string>(
                    "select COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS Where TABLE_NAME = @table",
                    new SqlParameter("@table", table));

            return Json(cols, JsonRequestBehavior.AllowGet);
        }

        // GET: TranConfigs/Edit/5
        public ActionResult Edit(int? id)
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

        // POST: TranConfigs/Edit/5
        // 为了防止“过多发布”攻击，请启用要绑定到的特定属性，有关 
        // 详细信息，请参阅 http://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Guid,Name,Code,Sort,MaxCount,LastStamp,Direct,HeaderSql,DetailSql,FooterSql,Remark,Status,Timestamp,CreatedTime,CreatedBy,ModifiedTime,ModifiedBy")] TranConfig tranConfig)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tranConfig).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
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
