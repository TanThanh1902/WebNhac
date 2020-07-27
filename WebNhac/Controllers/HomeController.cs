using System;
using System.Collections.Generic;
using System.Data.Entity;
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
            ViewBag.Title = "Trang chủ";
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
        public PartialViewResult MoiPhatHanh()
        {
            ViewBag.tus = "Mới phát hành";
            List<tbNhac> nhacs = db.tbNhacs.OrderByDescending(n => n.NgayDang).Take(8).ToList();
            return PartialView("dsNhac", nhacs);
        }
        public PartialViewResult NgheGiHomNay()
        {
            ViewBag.tus = "Nghe gì hôm nay";
            List<tbNhac> nhacs = db.tbNhacs.OrderByDescending(n => n.NgayDang).Take(8).ToList();
            return PartialView("dsNhac", nhacs);
        }
        public PartialViewResult ThinhHanh()
        {
            ViewBag.tus = "Thịnh hành";
            List<tbNhac> nhacs = db.tbNhacs.Where(t => DbFunctions.DiffDays(t.NgayDang, DateTime.Now) <= 30).OrderByDescending(n => n.LuotXem).Take(8).ToList();
            return PartialView("dsNhac", nhacs);
        }
        public PartialViewResult BaiHatNgheNhieu()
        {
            ViewBag.tus = "Những bài hát nghe nhiều";
            List<tbNhac> nhacs = db.tbNhacs.OrderByDescending(n => n.LuotXem).Take(8).ToList();
            return PartialView("dsNhac", nhacs);
        }
        public PartialViewResult NhacVietMoiNhat()
        {
            ViewBag.tus = "Nhạc Việt";
            List<tbNhac> nhacs = db.tbNhacs.Where(n => n.MaQuocGia == 1).OrderByDescending(n => n.LuotXem).Take(8).ToList();
            return PartialView("dsNhac", nhacs);
        }
        public PartialViewResult NhacHanMoiNhat()
        {
            ViewBag.tus = "KPOP";
            List<tbNhac> nhacs = db.tbNhacs.Where(n => n.MaQuocGia == 2).OrderByDescending(n => n.LuotXem).Take(8).ToList();
            return PartialView("dsNhac", nhacs);
        }
        public PartialViewResult NhacAuMyMoiNhat()
        {
            ViewBag.tus = "US - UK";
            List<tbNhac> nhacs = db.tbNhacs.Where(n => n.MaQuocGia == 3).OrderByDescending(n => n.LuotXem).Take(8).ToList();
            return PartialView("dsNhac", nhacs);
        }
        public PartialViewResult Album()
        {
            ViewBag.tus = "US - UK";
            List<tbAlbum> albums = db.tbAlbums.Take(8).ToList();
            return PartialView(albums);
        }
        // BXH âm nhạc
        public PartialViewResult BXHVietNam()
        {
            ViewBag.bhx = "BXH Việt Nam";
            List<tbNhac> nhacs = db.tbNhacs.Where(n => n.MaQuocGia == 1).OrderByDescending(n => n.LuotXem).Take(7).ToList();
            return PartialView("dsBHX", nhacs);
        }
        public PartialViewResult BXHHanQuoc()
        {
            ViewBag.bhx = "BXH Hàn Quốc";
            List<tbNhac> nhacs = db.tbNhacs.Where(n => n.MaQuocGia == 4).OrderByDescending(n => n.LuotXem).Take(7).ToList();
            return PartialView("dsBHX", nhacs);
        }
        public PartialViewResult BXHAuMy()
        {
            ViewBag.bhx = "BXH Âu Mỹ";
            List<tbNhac> nhacs = db.tbNhacs.Where(n => n.MaQuocGia == 3).OrderByDescending(n => n.LuotXem).Take(7).ToList();
            return PartialView("dsBHX", nhacs);
        }
        // danh mục âm nhạc
        public PartialViewResult DanhSachTheLoai()
        {
            List<tbTheLoai> theLoais = db.tbTheLoais.Take(8).ToList();
            return PartialView(theLoais);
        }
        public PartialViewResult DanhSachCaSy()
        {
            List<tbCaSi> caSis = db.tbCaSis.Take(8).ToList();
            return PartialView(caSis);
        }
        public PartialViewResult DanhSachQuocGia()
        {
            List<tbQuocGia> quocGias = db.tbQuocGias.Take(8).ToList();
            return PartialView(quocGias);
        }
    }
}