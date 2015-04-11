using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ES.Server;

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
            return View();
        }

        // POST: TranConfigs/Create
        // 为了防止“过多发布”攻击，请启用要绑定到的特定属性，有关 
        // 详细信息，请参阅 http://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Guid,Name,Code,Sort,MaxCount,LastStamp,Direct,HeaderSql,DetailSql,FooterSql,Remark,Status,Timestamp,CreatedTime,CreatedBy,ModifiedTime,ModifiedBy")] TranConfig tranConfig)
        {
            if (ModelState.IsValid)
            {
                db.TranConfig.Add(tranConfig);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tranConfig);
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
