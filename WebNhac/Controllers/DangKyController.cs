using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music_pv.Models;

namespace Music_pv.Controllers
{
    public class DangKyController : Controller
    {
        QuanLyNhacEntities db = new QuanLyNhacEntities();
        // GET: DangKy
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult DangKy()
        {
            return PartialView();
        }
        [HttpPost]
        public ActionResult DangKy(User nd)
        {
            if (ModelState.IsValid)
            {
                nd.NgayTao = DateTime.Now;
                nd.Token = Guid.NewGuid().ToString();
                nd.VaiTro = 0;
                db.Users.Add(nd);
                db.SaveChanges();
            }
            return Redirect("/HienThi/Index");
        }
        [HttpPost]
        public JsonResult ktraTK(string Email)
        {
            bool isExists = db.Users.FirstOrDefault(t => t.Email == Email) != null;
            return Json(!isExists, JsonRequestBehavior.AllowGet);
        }
    }
}