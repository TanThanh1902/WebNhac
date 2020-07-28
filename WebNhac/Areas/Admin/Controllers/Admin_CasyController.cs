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
using System.IO;

namespace WebNhac.Areas.Admin.Controllers
{
    public class Admin_CasyController : Controller
    {
        private NgheNhacEntities db = new NgheNhacEntities();
        const int PAGE_SIZE = 10;
        // GET: Admin/Admin_Casy
        public ActionResult Index(int? page)
        {
            return View(db.tbCaSis.OrderBy(t => t.MaCaSi).ToPagedList(page ?? 1, PAGE_SIZE));
        }

        // GET: Admin/Admin_Casy/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbCaSi tbCaSi = db.tbCaSis.Find(id);
            if (tbCaSi == null)
            {
                return HttpNotFound();
            }
            return View(tbCaSi);
        }

        // GET: Admin/Admin_Casy/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Admin_Casy/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaCaSi,TenCaSi,AnhCaSi")] tbCaSi tbCaSi, HttpPostedFileBase img_ca_sy)
        {
            if (ModelState.IsValid)
            {
                var img = img_ca_sy.FileName;
                var pathimg = Path.Combine(Server.MapPath("~/Content/images/CaSy"), img);
                if (img_ca_sy == null)
                {
                    ViewBag.thongbao = "Vui lòng chọn ảnh";
                    return View(tbCaSi);
                }
                else if (System.IO.File.Exists(pathimg))
                    ViewBag.thongbao = "Ảnh đã tồn tại";
                else
                    img_ca_sy.SaveAs(pathimg);
                tbCaSi.AnhCaSi = img_ca_sy.FileName;
                db.tbCaSis.Add(tbCaSi);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tbCaSi);
        }

        // GET: Admin/Admin_Casy/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbCaSi tbCaSi = db.tbCaSis.Find(id);
            if (tbCaSi == null)
            {
                return HttpNotFound();
            }
            return View(tbCaSi);
        }

        // POST: Admin/Admin_Casy/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaCaSi,TenCaSi,AnhCaSi")] tbCaSi tbCaSi, HttpPostedFileBase img_ca_sy)
        {
            if (ModelState.IsValid)
            {
                if(img_ca_sy != null)
                {
                    // xoa anh cu
                    string fullPath = Request.MapPath("~/Content/images/CaSy/" + tbCaSi.AnhCaSi);
                    System.IO.File.Delete(fullPath);
                    var img = img_ca_sy.FileName;
                    var pathimg = Path.Combine(Server.MapPath("~/Content/images/CaSy"), img);
                    if (img_ca_sy == null)
                    {
                        ViewBag.thongbao = "Vui lòng chọn ảnh";
                        return View(tbCaSi);
                    }
                    else if (System.IO.File.Exists(pathimg))
                        ViewBag.thongbao = "Ảnh đã tồn tại";
                    else
                        img_ca_sy.SaveAs(pathimg);
                    tbCaSi.AnhCaSi = img_ca_sy.FileName;
                }
                db.Entry(tbCaSi).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tbCaSi);
        }

        // GET: Admin/Admin_Casy/Delete/5
        public ActionResult DeleteConfirmed(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tbCaSi tbCaSi = db.tbCaSis.Find(id);
            if (tbCaSi == null)
            {
                return HttpNotFound();
            }
            foreach (var item in tbCaSi.tbTrinhBays)
            {
                // xoa anh cu
                string fullPath_img = Request.MapPath("~/Content/images/BaiHat/" + item.tbNhac.Nhac);
                System.IO.File.Delete(fullPath_img);
                // xoa nhac cu
                string fullPath_file = Request.MapPath("~/Content/fileNhac/" + item.tbNhac.Nhac);
                System.IO.File.Delete(fullPath_file);
                db.tbTrinhBays.Remove(item);
                db.tbNhacs.Remove(item.tbNhac);
            }
            db.SaveChanges();
            string fullPath_tbcasy = Request.MapPath("~/Content/images/ChuDe/" + tbCaSi.AnhCaSi);
            System.IO.File.Delete(fullPath_tbcasy);
            db.tbCaSis.Remove(tbCaSi);
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
