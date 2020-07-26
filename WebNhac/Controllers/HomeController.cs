using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNhac.Models;

namespace Web_Nhac.Controllers
{
    public class HomeController : Controller
    {
        NgheNhacEntities db = new NgheNhacEntities();
        public ActionResult Index()
        {
            return View();
        }
        public PartialViewResult Banner()
        {
            return PartialView(db.tbNhacs.OrderByDescending(n => n.NgayDang).Take(3).ToList());
        }
        public PartialViewResult Menu()
        {
            return PartialView();
        }
        // danh sách nhạc
        public PartialViewResult NgheGiHomNay()
        {
            List<tbNhac> nhacs = db.tbNhacs.OrderByDescending(n => n.NgayDang).Take(12).ToList();
            return PartialView("dsNhac", nhacs);
        }
        public PartialViewResult BaiHatNgheNhieu()
        {
            List<tbNhac> nhacs = db.tbNhacs.OrderByDescending(n => n.LuotXem).Take(12).ToList();
            return PartialView("dsNhac", nhacs);
        }
        public PartialViewResult VietNamMoiNhat()
        {
            List<tbNhac> nhacs = db.tbNhacs.Where(n => n.MaQuocGia == 1).OrderByDescending(n => n.LuotXem).Take(12).ToList();
            return PartialView("dsNhac", nhacs);
        }
        public PartialViewResult HanQuocMoiNhat()
        {
            List<tbNhac> nhacs = db.tbNhacs.Where(n => n.MaQuocGia == 2).OrderByDescending(n => n.LuotXem).Take(12).ToList();
            return PartialView("dsNhac", nhacs);
        }
        public PartialViewResult AuMyMoiNhat()
        {
            List<tbNhac> nhacs = db.tbNhacs.Where(n => n.MaQuocGia == 3).OrderByDescending(n => n.LuotXem).Take(12).ToList();
            return PartialView("dsNhac", nhacs);
        }
        // BXH âm nhạc
        public PartialViewResult BXHVietNam()
        {
            return PartialView(db.tbNhacs.Where(n => n.MaQuocGia == 1).OrderByDescending(n => n.LuotXem).Take(10).ToList());
        }
        public PartialViewResult BXHHanQuoc()
        {
            return PartialView(db.tbNhacs.Where(n => n.MaQuocGia == 2).OrderByDescending(n => n.LuotXem).Take(10).ToList());
        }
        public PartialViewResult BXHAuMy()
        {
            return PartialView(db.tbNhacs.Where(n => n.MaQuocGia == 3).OrderByDescending(n => n.LuotXem).Take(10).ToList());
        }
        // Top 100 album
        public ActionResult Top100BaiHatNhacTre()
        {
            return View();
        }
        public PartialViewResult LinkNhacTop100NhacTre()
        {
            return PartialView();
        }
        // danh mục âm nhạc
        public PartialViewResult DanhSachCaSy()
        {
            return PartialView(db.tbCaSis.ToList());
        }
        public PartialViewResult DanhSachTheLoai()
        {
            return PartialView(db.tbTheLoais.ToList());
        }
    }
}