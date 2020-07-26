using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music_pv.Models;

namespace Music_pv.Controllers
{
    public class DangNhapController : Controller
    {
        QuanLyNhacEntities db = new QuanLyNhacEntities();
        // GET: DangNhap
        [HttpGet]
        public PartialViewResult DangNhap()
        {
            return PartialView();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            string sTaiKhoan = f["txtTaiKhoan"].ToString();
            string sMatKhau = f["txtMatKhau"].ToString();
            User nd = db.Users.Where(t => t.VaiTro == 0).SingleOrDefault(n => n.Email == sTaiKhoan && n.MatKhau == sMatKhau);
            User ad = db.Users.Where(t => t.VaiTro == 1).SingleOrDefault(n => n.Email == sTaiKhoan && n.MatKhau == sMatKhau);
            if (nd != null)
            {
                Session["NguoiDung"] = nd;
                Session["flag"] = nd;
                return Redirect("/HienThi/Index");
            }
            else if (ad != null)
            {
                Session["Admin"] = ad;
                Session["flag"] = ad;
                return Redirect("/Admin/Admin/Index");
            }
            else
            {
                ViewBag.ThongBao = "Sai Email hoặc mật khẩu!";
            }
            return Redirect(Request.UrlReferrer.ToString());
        }
        public ActionResult DangXuat()
        {
            Session["Admin"] = Session["NguoiDung"] = Session["flag"] = null;
            return Redirect("/HienThi/Index");
        }
    }
}