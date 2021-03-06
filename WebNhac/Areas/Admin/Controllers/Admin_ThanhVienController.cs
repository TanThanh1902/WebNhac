﻿using System;
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
    public class Admin_ThanhVienController : Controller
    {
        private NgheNhacEntities db = new NgheNhacEntities();

        // GET: Admin/Admin_ThanhVien
        public ActionResult Index(int? page)
        {
            return View(db.tbNguoiDungs.OrderBy(t => t.MaND).ToPagedList(page ?? 1, 20));
        }

        // GET: Admin/Admin_ThanhVien/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbNguoiDung tbNguoiDung = db.tbNguoiDungs.Find(id);
            if (tbNguoiDung == null)
            {
                return HttpNotFound();
            }
            return View(tbNguoiDung);
        }

        // GET: Admin/Admin_ThanhVien/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Admin_ThanhVien/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaND,TenND,TaiKhoan,MatKhau,NgayTao,Token,Email")] tbNguoiDung tbNguoiDung)
        {
            if (ModelState.IsValid)
            {
                db.tbNguoiDungs.Add(tbNguoiDung);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tbNguoiDung);
        }

        // GET: Admin/Admin_ThanhVien/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbNguoiDung tbNguoiDung = db.tbNguoiDungs.Find(id);
            if (tbNguoiDung == null)
            {
                return HttpNotFound();
            }
            return View(tbNguoiDung);
        }

        // POST: Admin/Admin_ThanhVien/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaND,TenND,TaiKhoan,MatKhau,NgayTao,Token,Email")] tbNguoiDung tbNguoiDung)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tbNguoiDung).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbNguoiDung);
        }

        // GET: Admin/Admin_ThanhVien/Delete/5
        public ActionResult DeleteConfirmed(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbNguoiDung tbNguoiDung = db.tbNguoiDungs.Find(id);
            if (tbNguoiDung == null)
            {
                return HttpNotFound();
            }
            foreach(var item in tbNguoiDung.tbBinhLuans)
            {
                db.tbBinhLuans.Remove(item);
            }
            foreach(var item in tbNguoiDung.tbAlbumCaNhans)
            {
                db.tbAlbumCaNhans.Remove(item);
            }
            db.SaveChanges();
            db.tbNguoiDungs.Remove(tbNguoiDung);
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
