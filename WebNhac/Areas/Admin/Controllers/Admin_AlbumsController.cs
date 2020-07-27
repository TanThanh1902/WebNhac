using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebNhac.Models;

namespace WebNhac.Areas.Admin.Controllers
{
    public class Admin_AlbumsController : Controller
    {
        private NgheNhacEntities db = new NgheNhacEntities();

        // GET: Admin/Admin_Albums
        public ActionResult Index()
        {
            return View(db.tbAlbums.ToList());
        }

        // GET: Admin/Admin_Albums/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbAlbum tbAlbum = db.tbAlbums.Find(id);
            if (tbAlbum == null)
            {
                return HttpNotFound();
            }
            return View(tbAlbum);
        }

        // GET: Admin/Admin_Albums/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Admin_Albums/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaAlbum,TenAlbum,AnhAlbum,NgayDang")] tbAlbum tbAlbum)
        {
            if (ModelState.IsValid)
            {
                db.tbAlbums.Add(tbAlbum);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tbAlbum);
        }

        // GET: Admin/Admin_Albums/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbAlbum tbAlbum = db.tbAlbums.Find(id);
            if (tbAlbum == null)
            {
                return HttpNotFound();
            }
            return View(tbAlbum);
        }

        // POST: Admin/Admin_Albums/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaAlbum,TenAlbum,AnhAlbum,NgayDang")] tbAlbum tbAlbum)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tbAlbum).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbAlbum);
        }

        // GET: Admin/Admin_Albums/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbAlbum tbAlbum = db.tbAlbums.Find(id);
            if (tbAlbum == null)
            {
                return HttpNotFound();
            }
            return View(tbAlbum);
        }

        // POST: Admin/Admin_Albums/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tbAlbum tbAlbum = db.tbAlbums.Find(id);
            db.tbAlbums.Remove(tbAlbum);
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
