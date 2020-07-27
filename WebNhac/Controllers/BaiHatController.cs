using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNhac.Models;
using PagedList;
using PagedList.Mvc;
using System.Net;

namespace WebNhac.Controllers
{
    public class BaiHatController : Controller
    {
        // GET: BaiHat
        NgheNhacEntities db = new NgheNhacEntities();
        const int PAGE_SIZE = 20;
        public ActionResult TatCaBaiHat(int? page)
        {
            ViewBag.ketqua = "Có " + db.tbNhacs.Count() + " bài hát";
            ViewBag.Title = "Tất cả bài hát ";
            IPagedList<tbNhac> nhacs = db.tbNhacs.OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("dsNhac", nhacs);
        }
        public ActionResult BaiHatTheoCaSy(int? id, int? page)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.ketqua = "Có " + db.tbTrinhBays.Where(t => t.MaCaSi == id).Count() + " bài hát";
            ViewBag.Title = "Ca sỹ: " + db.tbCaSis.Find(id).TenCaSi;
            IPagedList<tbNhac> nhacs = db.tbTrinhBays.Where(t => t.MaCaSi == id).Select(t => t.tbNhac).ToList().OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("dsNhac", nhacs);
        }
        public ActionResult BaiHatTheoQuocGia(int? id, int? page)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.Title = "Quốc gia: " + db.tbQuocGias.Find(id).TenQuocGia;
            ViewBag.ketqua = "Có " + db.tbNhacs.Where(t => t.MaQuocGia == id).Count() + " bài hát";
            IPagedList<tbNhac> nhacs = db.tbNhacs.Where(t => t.MaQuocGia == id).OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("dsNhac", nhacs);
        }
        public ActionResult BaiHatTheoChuDe(int? id, int? page)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.ketqua = "Có " + db.tbNhacs.Where(t => t.MaTheLoai == id).Count() + " bài hát";
            ViewBag.Title = "Chủ đề: " + db.tbTheLoais.Find(id).TenTheLoai;
            IPagedList<tbNhac> nhacs = db.tbNhacs.Where(t => t.MaTheLoai == id).OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("dsNhac", nhacs);
        }
        public ActionResult ChiTietBaiHat(int? id)
        {
            if(id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            tbNhac nhac = db.tbNhacs.Find(id);
            if(nhac == null)
            {
                return HttpNotFound();
            }
            return View(nhac);
        }
    }
}