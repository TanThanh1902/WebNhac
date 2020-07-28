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
    public class Admin_QuocGiaController : Controller
    {
        private NgheNhacEntities db = new NgheNhacEntities();

        // GET: Admin/Admin_QuocGia
        public ActionResult Index()
        {
            return View(db.tbQuocGias.ToList());
        }

        // GET: Admin/Admin_QuocGia/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbQuocGia tbQuocGia = db.tbQuocGias.Find(id);
            if (tbQuocGia == null)
            {
                return HttpNotFound();
            }
            return View(tbQuocGia);
        }

        // GET: Admin/Admin_QuocGia/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Admin_QuocGia/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaQuocGia,TenQuocGia,AnhQuocGia")] tbQuocGia tbQuocGia, HttpPostedFileBase img_quoc_gia)
        {
            if (ModelState.IsValid)
            {
                var img = img_quoc_gia.FileName;
                var pathimg = Path.Combine(Server.MapPath("~/Content/images/QuocGia"), img);
                if (img_quoc_gia == null)
                {
                    ViewBag.thongbao = "Vui lòng chọn ảnh";
                    return View(tbQuocGia);
                }
                else if (System.IO.File.Exists(pathimg))
                    ViewBag.thongbao = "Ảnh đã tồn tại";
                else
                    img_quoc_gia.SaveAs(pathimg);
                tbQuocGia.AnhQuocGia = img_quoc_gia.FileName;
                db.tbQuocGias.Add(tbQuocGia);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tbQuocGia);
        }

        // GET: Admin/Admin_QuocGia/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbQuocGia tbQuocGia = db.tbQuocGias.Find(id);
            if (tbQuocGia == null)
            {
                return HttpNotFound();
            }
            return View(tbQuocGia);
        }

        // POST: Admin/Admin_QuocGia/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaQuocGia,TenQuocGia,AnhQuocGia")] tbQuocGia tbQuocGia, HttpPostedFileBase img_quoc_gia)
        {
            if (ModelState.IsValid)
            {
                if(img_quoc_gia != null)
                {
                    // xoa anh cu
                    string fullPath = Request.MapPath("~/Content/images/QuocGia/" + tbQuocGia.AnhQuocGia);
                    System.IO.File.Delete(fullPath);
                    var img = img_quoc_gia.FileName;
                    var pathimg = Path.Combine(Server.MapPath("~/Content/images/QuocGia"), img);
                    if (img_quoc_gia == null)
                    {
                        ViewBag.thongbao = "Vui lòng chọn ảnh";
                        return View(tbQuocGia);
                    }
                    else if (System.IO.File.Exists(pathimg))
                        ViewBag.thongbao = "Ảnh đã tồn tại";
                    else
                        img_quoc_gia.SaveAs(pathimg);
                    tbQuocGia.AnhQuocGia = img_quoc_gia.FileName;
                }
                db.Entry(tbQuocGia).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbQuocGia);
        }

        // GET: Admin/Admin_QuocGia/Delete/5
        public ActionResult DeleteConfirmed(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbQuocGia tbQuocGia = db.tbQuocGias.Find(id);
            if (tbQuocGia == null)
            {
                return HttpNotFound();
            }
            foreach (var item in tbQuocGia.tbNhacs)
            {
                // xoa anh cu
                string fullPath_img = Request.MapPath("~/Content/images/BaiHat/" + item.Nhac);
                System.IO.File.Delete(fullPath_img);
                // xoa nhac cu
                string fullPath_file = Request.MapPath("~/Content/fileNhac/" + item.Nhac);
                System.IO.File.Delete(fullPath_file);
                foreach (var item1 in item.tbTrinhBays)
                {
                    db.tbTrinhBays.Remove(item1);
                }
                db.SaveChanges();
                db.tbNhacs.Remove(item);
            }
            db.SaveChanges();
            string fullPath_tbquocgia= Request.MapPath("~/Content/images/QuocGia/" + tbQuocGia.AnhQuocGia);
            System.IO.File.Delete(fullPath_tbquocgia);
            db.tbQuocGias.Remove(tbQuocGia);
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
