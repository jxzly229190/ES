using System;
using System.Data.Entity;
using System.Data.OleDb;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace ES.Server.Controllers
{
    [Authorize]
    public class ClientsController : Controller
    {
        private Entities db = new Entities();

        // GET: Clients
        public ActionResult Index()
        {
            return View(db.Client.Where(c => c.Status != 255).ToList());
        }

        // GET: Clients/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Client client = db.Client.Find(id);
            if (client == null)
            {
                return HttpNotFound();
            }
            return View(client);
        }

        // GET: Clients/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Clients/Create
        // 为了防止“过多发布”攻击，请启用要绑定到的特定属性，有关 
        // 详细信息，请参阅 http://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,GUID,Code,Name,IsCurrent,Type,Address,Timestamp,Status,CreatedBy,CreatedTime,ModifiedBy,ModifiedTime")] Client client)
        {
            if (db.Client.Count(c => c.Code == client.Code) > 0)
            {
                AddErrors("门店编码 " + client.Code + " 已被使用。");
                return View(client);
            }

            if (ModelState.IsValid)
            {
                client.GUID = Guid.NewGuid();
                client.IsCurrent = false;
                client.CreatedBy = User.Identity.Name;
                client.CreatedTime = DateTime.Now;
                client.Type = 1;
                db.Client.Add(client);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(client);
        }

        // GET: Clients/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Client client = db.Client.Find(id);
            if (client == null)
            {
                return HttpNotFound();
            }
            return View(client);
        }

        // POST: Clients/Edit/5
        // 为了防止“过多发布”攻击，请启用要绑定到的特定属性，有关 
        // 详细信息，请参阅 http://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,GUID,Code,Name,IsCurrent,Type,Address,Timestamp,Status,CreatedBy,CreatedTime,ModifiedBy,ModifiedTime")] Client client)
        {
            if (ModelState.IsValid)
            {
                var old = db.Client.FirstOrDefault(c => c.ID == client.ID);
                if (old == null)
                {
                    AddErrors("当前修改的门店不存在。");
                }
                else
                {
                    old.Name = client.Name;
                    old.Address = client.Address;
                    old.Status = client.Status;
                    old.ModifiedBy = User.Identity.Name;
                    old.ModifiedTime = DateTime.Now;
                    //db.Entry(client).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            return View(client);
        }

        // GET: Clients/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Client client = db.Client.Find(id);
            if (client == null)
            {
                return HttpNotFound();
            }
            return View(client);
        }

        // POST: Clients/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Client client = db.Client.Find(id);
            db.Client.Remove(client);
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

        private void AddErrors(params string[] errors)
        {
            foreach (var error in errors)
            {
                this.ModelState.AddModelError("", error);
            }
        }
    }
}
