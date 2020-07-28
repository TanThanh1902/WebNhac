using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebNhac.Models;
using PagedList;
using PagedList.Mvc;

namespace WebNhac.Areas.Admin.Controllers
{
    public class Admin_BinhLuanController : Controller
    {
        private NgheNhacEntities db = new NgheNhacEntities();

        // GET: Admin/Admin_BinhLuan
        public ActionResult Index(int? page)
        {
            IPagedList<tbBinhLuan> tbBinhLuans = db.tbBinhLuans.OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, 20);
            return View(tbBinhLuans);
        }

        // GET: Admin/Admin_BinhLuan/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbBinhLuan tbBinhLuan = db.tbBinhLuans.Find(id);
            if (tbBinhLuan == null)
            {
                return HttpNotFound();
            }
            return View(tbBinhLuan);
        }

        // GET: Admin/Admin_BinhLuan/Create
        public ActionResult Create()
        {
            ViewBag.MaND = new SelectList(db.tbNguoiDungs, "MaND", "TenND");
            ViewBag.MaNhac = new SelectList(db.tbNhacs, "MaNhac", "TenBaiHat");
            return View();
        }

        // POST: Admin/Admin_BinhLuan/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaBinhLuan,NoiDungBinhLuan,NgayDang,MaNhac,MaND")] tbBinhLuan tbBinhLuan)
        {
            if (ModelState.IsValid)
            {
                db.tbBinhLuans.Add(tbBinhLuan);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaND = new SelectList(db.tbNguoiDungs, "MaND", "TenND", tbBinhLuan.MaND);
            ViewBag.MaNhac = new SelectList(db.tbNhacs, "MaNhac", "TenBaiHat", tbBinhLuan.MaNhac);
            return View(tbBinhLuan);
        }

        // GET: Admin/Admin_BinhLuan/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbBinhLuan tbBinhLuan = db.tbBinhLuans.Find(id);
            if (tbBinhLuan == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaND = new SelectList(db.tbNguoiDungs, "MaND", "TenND", tbBinhLuan.MaND);
            ViewBag.MaNhac = new SelectList(db.tbNhacs, "MaNhac", "TenBaiHat", tbBinhLuan.MaNhac);
            return View(tbBinhLuan);
        }

        // POST: Admin/Admin_BinhLuan/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaBinhLuan,NoiDungBinhLuan,NgayDang,MaNhac,MaND")] tbBinhLuan tbBinhLuan)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tbBinhLuan).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaND = new SelectList(db.tbNguoiDungs, "MaND", "TenND", tbBinhLuan.MaND);
            ViewBag.MaNhac = new SelectList(db.tbNhacs, "MaNhac", "TenBaiHat", tbBinhLuan.MaNhac);
            return View(tbBinhLuan);
        }

        // GET: Admin/Admin_BinhLuan/Delete/5
        public ActionResult DeleteConfirmed(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbBinhLuan tbBinhLuan = db.tbBinhLuans.Find(id);
            if (tbBinhLuan == null)
            {
                return HttpNotFound();
            }
            db.tbBinhLuans.Remove(tbBinhLuan);
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
