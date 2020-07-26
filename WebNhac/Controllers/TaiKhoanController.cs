using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNhac.Models;

namespace WebNhac.Controllers
{
    public class TaiKhoanController : Controller
    {
        // GET: TaiKhoan
        NgheNhacEntities db = new NgheNhacEntities();
        public ActionResult DangKy()
        {
            return PartialView();
        }
        [HttpPost]
        public ActionResult DangKy(tbNguoiDung nd)
        {
            return Redirect("/HienThi/Index");
        }
        public PartialViewResult DangNhap()
        {
            return PartialView();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            return Redirect(Request.UrlReferrer.ToString());
        }
        public ActionResult DangXuat()
        {
            Session["Admin"] = Session["NguoiDung"] = Session["flag"] = null;
            return Redirect("/HienThi/Index");
        }
    }
}