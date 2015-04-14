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

namespace ES.Server.Controllers
{
    public class TranBlobConfigsController : Controller
    {
        private Entities db = new Entities();

        // GET: TranBlobConfigs
        public ActionResult Index()
        {
            return View(db.TranBlobConfig.ToList());
        }

        // GET: TranBlobConfigs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TranBlobConfig tranBlobConfig = db.TranBlobConfig.Find(id);
            if (tranBlobConfig == null)
            {
                return HttpNotFound();
            }
            return View(tranBlobConfig);
        }

        // GET: TranBlobConfigs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: TranBlobConfigs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Guid,TableName,ColName,Sort,Direct,MaxCount,Cstamp,Sstamp,Timestamp,CreatedBy,CreatedTime")] TranBlobConfig tranBlobConfig)
        {
            if (ModelState.IsValid)
            {
                tranBlobConfig.Guid = Guid.NewGuid();
                tranBlobConfig.CreatedBy = User.Identity.Name;
                tranBlobConfig.CreatedTime = DateTime.Now;
                db.TranBlobConfig.Add(tranBlobConfig);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tranBlobConfig);
        }

        public JsonResult GetBlobColumnsByTableName(string table)
        {
            var cols =
                db.Database.SqlQuery<string>(
                    "select COLUMN_NAME+','+DATA_TYPE from INFORMATION_SCHEMA.COLUMNS Where TABLE_NAME = @table And (DATA_TYPE ='varbinary' or DATA_TYPE = 'binary' or DATA_TYPE = 'image')",
                    new SqlParameter("@table", table));

            List<string> cs = cols.Select(col => col.Split(',')).Select(fields => fields[0]).ToList();

            return Json(cs, JsonRequestBehavior.AllowGet);
        }

        // GET: TranBlobConfigs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TranBlobConfig tranBlobConfig = db.TranBlobConfig.Find(id);
            if (tranBlobConfig == null)
            {
                return HttpNotFound();
            }
            return View(tranBlobConfig);
        }

        // POST: TranBlobConfigs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Guid,TableName,ColName,Sort,Direct,MaxCount,Cstamp,Sstamp,Timestamp,CreatedBy,CreatedTime")] TranBlobConfig tranBlobConfig)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tranBlobConfig).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tranBlobConfig);
        }

        // GET: TranBlobConfigs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TranBlobConfig tranBlobConfig = db.TranBlobConfig.Find(id);
            if (tranBlobConfig == null)
            {
                return HttpNotFound();
            }
            return View(tranBlobConfig);
        }

        // POST: TranBlobConfigs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TranBlobConfig tranBlobConfig = db.TranBlobConfig.Find(id);
            db.TranBlobConfig.Remove(tranBlobConfig);
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
