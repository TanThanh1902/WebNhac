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
        public ActionResult TaiKhoan()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(tbNguoiDung nd, string NhapLaiMatKhau)
        {
            if(db.tbNguoiDungs.FirstOrDefault(t => t.Email == nd.Email) != null)
            {
                Session["tb"] = "DangKy";
                Session["ThongBao"] = "Email đã tồn tại";
                return RedirectToAction("TaiKhoan");
            }
            else if(NhapLaiMatKhau != nd.MatKhau)
            {
                Session["tb"] = "DangKy";
                Session["ThongBao"] = "Mật khẩu không trùng khớp";
                return RedirectToAction("TaiKhoan");
            }
            else if (ModelState.IsValid)
            {
                nd.NgayTao = DateTime.Now;
                nd.Token = Guid.NewGuid().ToString();
                db.tbNguoiDungs.Add(nd);
                db.SaveChanges();
                return Redirect("/Home/Index");
            }
            Session["tb"] = "DangKy";
            return RedirectToAction("TaiKhoan");
        }
        [HttpPost]
        public ActionResult DangNhap(string taikhoan, string matkhau)
        {
            tbNguoiDung nd = db.tbNguoiDungs.SingleOrDefault(t => t.Email == taikhoan && t.MatKhau == matkhau);
            if(nd != null)
            {
                HttpCookie cookie = new HttpCookie("id", nd.MaND.ToString());
                cookie.Expires.AddDays(10);
                Response.Cookies.Set(cookie);
                Session["nd"] = nd;
                return Redirect("/Home/Index");
            }
            Session["tb"] = "DangNhap";
            Session["ThongBao"] = "Sai tài khoản hoặc mật khẩu";
            return RedirectToAction("TaiKhoan");
        }
        public ActionResult DangXuat()
        {
            HttpCookie cookie = Request.Cookies["id"];
            cookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Set(cookie);
            return Redirect("/Home/Index");
        }
    }
}