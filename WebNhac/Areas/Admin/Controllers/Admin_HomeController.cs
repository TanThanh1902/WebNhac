using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNhac.Models;

namespace WebNhac.Areas.Admin.Controllers
{
    public class Admin_HomeController : Controller
    {
        // GET: Admin/Admin_Home
        NgheNhacEntities db = new NgheNhacEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(string taikhoan, string matkhau)
        {
            tbAdmin admin = db.tbAdmins.SingleOrDefault(t => t.TaiKhoan == taikhoan && t.MatKhau == matkhau);
            if(admin != null)
            {
                HttpCookie cookie = new HttpCookie("admin", admin.MaAdmin.ToString());
                cookie.Expires.AddDays(10);
                Response.Cookies.Set(cookie);
                return RedirectToAction("Index");
            }
            ViewBag.ThongBao = "Sai tài khoản hoặc mật khẩu!";
            return View();
        }
        public PartialViewResult thongke()
        {
            ViewBag.thongkebaihat = db.tbNhacs.Count();
            ViewBag.thongkealbum = db.tbAlbums.Count();
            ViewBag.thongkecasy = db.tbCaSis.Count();
            ViewBag.thongkethanhvien = db.tbNguoiDungs.Count();
            return PartialView();
        }
    }
}