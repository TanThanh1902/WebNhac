using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebNhac.Models;

namespace WebNhac.Areas.Admin.Controllers
{
    public class Admin_ChuDeController : Controller
    {
        private NgheNhacEntities db = new NgheNhacEntities();

        // GET: Admin/Admin_ChuDe
        public ActionResult Index()
        {
            return View(db.tbTheLoais.ToList());
        }

        // GET: Admin/Admin_ChuDe/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbTheLoai tbTheLoai = db.tbTheLoais.Find(id);
            if (tbTheLoai == null)
            {
                return HttpNotFound();
            }
            return View(tbTheLoai);
        }

        // GET: Admin/Admin_ChuDe/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Admin_ChuDe/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaTheLoai,TenTheLoai,AnhTheloai")] tbTheLoai tbTheLoai, HttpPostedFileBase img_chu_de)
        {
            if (ModelState.IsValid)
            {
                var img = img_chu_de.FileName;
                var pathimg = Path.Combine(Server.MapPath("~/Content/images/ChuDe"), img);
                if (img_chu_de == null)
                {
                    ViewBag.thongbao = "Vui lòng chọn ảnh";
                    return View(tbTheLoai);
                }
                else if (System.IO.File.Exists(pathimg))
                    ViewBag.thongbao = "Ảnh đã tồn tại";
                else
                    img_chu_de.SaveAs(pathimg);
                tbTheLoai.AnhTheloai = img_chu_de.FileName;
                db.tbTheLoais.Add(tbTheLoai);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tbTheLoai);
        }

        // GET: Admin/Admin_ChuDe/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbTheLoai tbTheLoai = db.tbTheLoais.Find(id);
            if (tbTheLoai == null)
            {
                return HttpNotFound();
            }
            return View(tbTheLoai);
        }

        // POST: Admin/Admin_ChuDe/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaTheLoai,TenTheLoai,AnhTheloai")] tbTheLoai tbTheLoai, HttpPostedFileBase img_chu_de)
        {
            if (ModelState.IsValid)
            {
                if(img_chu_de != null)
                {
                    // xoa anh cu
                    string fullPath = Request.MapPath("~/Content/images/ChuDe/" + tbTheLoai.AnhTheloai);
                    System.IO.File.Delete(fullPath);
                    // them dai dien danh_muc
                    var img = img_chu_de.FileName;
                    var pathimg = Path.Combine(Server.MapPath("~/Content/images/ChuDe"), img);
                    if (img_chu_de == null)
                    {
                        ViewBag.thongbao = "Vui lòng chọn ảnh";
                        return View(tbTheLoai);
                    }
                    else if (System.IO.File.Exists(pathimg))
                        ViewBag.thongbao = "Ảnh đã tồn tại";
                    else
                        img_chu_de.SaveAs(pathimg);
                    tbTheLoai.AnhTheloai = img_chu_de.FileName;
                }
                db.Entry(tbTheLoai).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbTheLoai);
        }

        // GET: Admin/Admin_ChuDe/Delete/5
        public ActionResult DeleteConfirmed(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbTheLoai tbTheLoai = db.tbTheLoais.Find(id);
            if (tbTheLoai == null)
            {
                return HttpNotFound();
            }
            foreach(var item in tbTheLoai.tbNhacs)
            {
                // xoa anh cu
                string fullPath_tbnhac = Request.MapPath("~/Content/images/BaiHat/" + item.HinhAnh);
                System.IO.File.Delete(fullPath_tbnhac);
                db.tbNhacs.Remove(item);
            }
            db.SaveChanges();
            string fullPath_tbtheloai = Request.MapPath("~/Content/images/ChuDe/" + tbTheLoai.AnhTheloai);
            System.IO.File.Delete(fullPath_tbtheloai);
            db.tbTheLoais.Remove(tbTheLoai);
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
