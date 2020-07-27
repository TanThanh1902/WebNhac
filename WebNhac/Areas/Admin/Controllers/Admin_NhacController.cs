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
    public class Admin_NhacController : Controller
    {
        private NgheNhacEntities db = new NgheNhacEntities();

        // GET: Admin/Admin_Nhac
        public ActionResult Index()
        {
            var tbNhacs = db.tbNhacs.Include(t => t.tbQuocGia).Include(t => t.tbTheLoai);
            return View(tbNhacs.ToList());
        }

        // GET: Admin/Admin_Nhac/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbNhac tbNhac = db.tbNhacs.Find(id);
            if (tbNhac == null)
            {
                return HttpNotFound();
            }
            return View(tbNhac);
        }

        // GET: Admin/Admin_Nhac/Create
        public ActionResult Create()
        {
            ViewBag.MaQuocGia = new SelectList(db.tbQuocGias, "MaQuocGia", "TenQuocGia");
            ViewBag.MaTheLoai = new SelectList(db.tbTheLoais, "MaTheLoai", "TenTheLoai");
            return View();
        }

        // POST: Admin/Admin_Nhac/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaNhac,TenBaiHat,HinhAnh,LoiBaiHat,Nhac,LuotXem,LinkTaiVe,LuotLike,MaTheLoai,MaQuocGia,NgayDang")] tbNhac tbNhac)
        {
            if (ModelState.IsValid)
            {
                db.tbNhacs.Add(tbNhac);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaQuocGia = new SelectList(db.tbQuocGias, "MaQuocGia", "TenQuocGia", tbNhac.MaQuocGia);
            ViewBag.MaTheLoai = new SelectList(db.tbTheLoais, "MaTheLoai", "TenTheLoai", tbNhac.MaTheLoai);
            return View(tbNhac);
        }

        // GET: Admin/Admin_Nhac/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbNhac tbNhac = db.tbNhacs.Find(id);
            if (tbNhac == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaQuocGia = new SelectList(db.tbQuocGias, "MaQuocGia", "TenQuocGia", tbNhac.MaQuocGia);
            ViewBag.MaTheLoai = new SelectList(db.tbTheLoais, "MaTheLoai", "TenTheLoai", tbNhac.MaTheLoai);
            return View(tbNhac);
        }

        // POST: Admin/Admin_Nhac/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaNhac,TenBaiHat,HinhAnh,LoiBaiHat,Nhac,LuotXem,LinkTaiVe,LuotLike,MaTheLoai,MaQuocGia,NgayDang")] tbNhac tbNhac)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tbNhac).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaQuocGia = new SelectList(db.tbQuocGias, "MaQuocGia", "TenQuocGia", tbNhac.MaQuocGia);
            ViewBag.MaTheLoai = new SelectList(db.tbTheLoais, "MaTheLoai", "TenTheLoai", tbNhac.MaTheLoai);
            return View(tbNhac);
        }

        // GET: Admin/Admin_Nhac/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbNhac tbNhac = db.tbNhacs.Find(id);
            if (tbNhac == null)
            {
                return HttpNotFound();
            }
            return View(tbNhac);
        }

        // POST: Admin/Admin_Nhac/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tbNhac tbNhac = db.tbNhacs.Find(id);
            db.tbNhacs.Remove(tbNhac);
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
