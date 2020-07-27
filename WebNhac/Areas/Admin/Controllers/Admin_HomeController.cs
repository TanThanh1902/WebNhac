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
        public ActionResult DangNhap(string taikhoan, string matkhau)
        {
            tbAdmin admin = db.tbAdmins.SingleOrDefault(t => t.TaiKhoan == taikhoan && t.MatKhau == matkhau);
            return RedirectToAction("Index");
        }
    }
}