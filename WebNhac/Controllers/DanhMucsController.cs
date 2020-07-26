using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music_pv.Models;
using PagedList;
using PagedList.Mvc;

namespace Music_pv.Controllers
{
    public class DanhMucsController : Controller
    {
        QuanLyNhacEntities db = new QuanLyNhacEntities();
        // GET: DanhMucs
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult BaiHatNgheNhieu(int? page)
        {
            return View(db.DSNhacs.OrderByDescending(t => t.LuotNghe).ToPagedList(page ?? 1, 30));
        }
        public ActionResult DSCaSy(int? page)
        {
            return View(db.DSCaSies.OrderBy(t => t.TenCaSy).ToPagedList(page ?? 1, 30));
        }
        public PartialViewResult DSTheLoaiN()
        {
            return PartialView(db.DSTheLoais.ToList());
        }
        public ActionResult NhacTheoTL(int? id, int? page)
        {
            return View(db.DSNhacs.Where(t => t.IDTheLoai == id).OrderBy(t => t.TenBaiHat).ToPagedList(page ?? 1, 30));
        }
        public PartialViewResult DSQuocGiaN()
        {
            return PartialView(db.QuocGias.ToList());
        }
        public ActionResult Top100QG(int? id, int? page)
        {
            return View(db.DSNhacs.Where(t => t.IDQuocGia == id).OrderByDescending(t => t.LuotNghe).Take(100).ToPagedList(page ?? 1, 30));
        }
    }
}