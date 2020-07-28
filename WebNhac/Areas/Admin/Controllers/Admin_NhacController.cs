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
    public class Admin_NhacController : Controller
    {
        private NgheNhacEntities db = new NgheNhacEntities();

        // GET: Admin/Admin_Nhac
        public ActionResult Index(int? page)
        {
            IPagedList<tbNhac> tbNhacs = db.tbNhacs.OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, 10);
            return View(tbNhacs);
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
        public PartialViewResult dsCaSy()
        {
            return PartialView(db.tbCaSis.ToList());
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
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaNhac,TenBaiHat,HinhAnh,LoiBaiHat,Nhac,LuotXem,LinkTaiVe,LuotLike,MaTheLoai,MaQuocGia,NgayDang")] tbNhac tbNhac, int[] MaCaSy, HttpPostedFileBase img_nhac, HttpPostedFileBase file_nhac)
        {
            if (ModelState.IsValid)
            {
                tbNhac.LuotXem = 0;
                tbNhac.NgayDang = DateTime.Now;
                // them anh
                var img = img_nhac.FileName;
                var pathimg = Path.Combine(Server.MapPath("~/Content/images/BaiHat"), img);
                if (img_nhac == null)
                {
                    ViewBag.thongbao = "Vui lòng chọn ảnh";
                    return View(tbNhac);
                }
                else if (System.IO.File.Exists(pathimg))
                    ViewBag.thongbao = "Ảnh đã tồn tại";
                else
                    img_nhac.SaveAs(pathimg);
                tbNhac.HinhAnh = img_nhac.FileName;
                // them nhac
                var file = file_nhac.FileName;
                var pathfile = Path.Combine(Server.MapPath("~/Content/fileNhac"), file);
                if (file_nhac == null)
                {
                    ViewBag.thongbao = "Vui lòng chọn bài hát";
                    return View(tbNhac);
                }
                else if (System.IO.File.Exists(pathfile))
                    ViewBag.thongbao = "Bài hát đã tồn tại";
                else
                    file_nhac.SaveAs(pathfile);
                tbNhac.Nhac = file_nhac.FileName;
                db.tbNhacs.Add(tbNhac);
                db.SaveChanges();
                foreach (var item in MaCaSy)
                {
                    tbTrinhBay trinhBay = new tbTrinhBay()
                    {
                        MaNhac = tbNhac.MaNhac,
                        MaCaSi = item
                    };
                    db.tbTrinhBays.Add(trinhBay);
                }
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
            ViewBag.MaCaSy = "";
            List<tbCaSi> casy = db.tbTrinhBays.Where(t => t.MaNhac == id).ToList().Select(t => t.tbCaSi).ToList();
            int lastItem = 1;
            foreach (var item in casy)
            {
                if (lastItem == casy.Count())
                {
                    ViewBag.MaCaSy += item.MaCaSi;
                }
                else
                {
                    ViewBag.MaCaSy += item.MaCaSi + ";";
                }
            }
            return View(tbNhac);
        }

        // POST: Admin/Admin_Nhac/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaNhac,TenBaiHat,HinhAnh,LoiBaiHat,Nhac,LuotXem,LinkTaiVe,LuotLike,MaTheLoai,MaQuocGia,NgayDang")] tbNhac tbNhac, HttpPostedFileBase img_nhac, int[] MaCaSy, HttpPostedFileBase file_nhac)
        {
            if (ModelState.IsValid)
            {
                if(img_nhac != null)
                {
                    // xoa anh cu
                    string fullPath = Request.MapPath("~/Content/images/BaiHat/" + tbNhac.HinhAnh);
                    System.IO.File.Delete(fullPath);
                    // them anh
                    var img = img_nhac.FileName;
                    var pathimg = Path.Combine(Server.MapPath("~/Content/images/BaiHat"), img);
                    if (img_nhac == null)
                    {
                        ViewBag.thongbao = "Vui lòng chọn ảnh";
                        return View(tbNhac);
                    }
                    else if (System.IO.File.Exists(pathimg))
                        ViewBag.thongbao = "Ảnh đã tồn tại";
                    else
                        img_nhac.SaveAs(pathimg);
                    tbNhac.HinhAnh = img_nhac.FileName;
                }
                if(file_nhac != null)
                {
                    // xoa anh cu
                    string fullPath = Request.MapPath("~/Content/fileNhac/" + tbNhac.Nhac);
                    System.IO.File.Delete(fullPath);
                    // them nhac
                    var file = file_nhac.FileName;
                    var pathfile = Path.Combine(Server.MapPath("~/Content/fileNhac"), file);
                    if (file_nhac == null)
                    {
                        ViewBag.thongbao = "Vui lòng chọn bài hát";
                        return View(tbNhac);
                    }
                    else if (System.IO.File.Exists(pathfile))
                        ViewBag.thongbao = "Bài hát đã tồn tại";
                    else
                        file_nhac.SaveAs(pathfile);
                    tbNhac.Nhac = file_nhac.FileName;
                }
                db.Entry(tbNhac).State = EntityState.Modified;
                db.SaveChanges();
                List<tbTrinhBay> trinhBays = db.tbTrinhBays.Where(t => t.MaNhac == tbNhac.MaNhac).ToList();
                // xoa ca sy
                var removeitem = trinhBays.Where(t => !MaCaSy.Contains((int)t.MaCaSi)).ToList();
                foreach(var item in removeitem)
                {
                    db.Entry(item).State = EntityState.Deleted;
                }
                db.SaveChanges();
                // them ca sy
                var additem = MaCaSy.Where(t => !trinhBays.Select(x => x.MaCaSi).Contains(t));
                foreach (var item in additem)
                {
                    tbTrinhBay tmp = new tbTrinhBay()
                    {
                        MaNhac = tbNhac.MaNhac,
                        MaCaSi = item
                    };
                    db.tbTrinhBays.Add(tmp);
                }
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaQuocGia = new SelectList(db.tbQuocGias, "MaQuocGia", "TenQuocGia", tbNhac.MaQuocGia);
            ViewBag.MaTheLoai = new SelectList(db.tbTheLoais, "MaTheLoai", "TenTheLoai", tbNhac.MaTheLoai);
            return View(tbNhac);
        }

        // GET: Admin/Admin_Nhac/Delete/5
        public ActionResult DeleteConfirmed(int? id)
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
            // xoa anh cu
            string fullPath_img = Request.MapPath("~/Content/images/BaiHat/" + tbNhac.Nhac);
            System.IO.File.Delete(fullPath_img);
            // xoa nhac cu
            string fullPath_file = Request.MapPath("~/Content/fileNhac/" + tbNhac.Nhac);
            System.IO.File.Delete(fullPath_file);
            foreach(var item in tbNhac.tbTrinhBays)
            {
                db.tbTrinhBays.Remove(item);
            }
            db.SaveChanges();
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
