using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Music_pv.Models;

namespace Music_pv.Controllers
{
    public class BinhLuansController : Controller
    {
        QuanLyNhacEntities db = new QuanLyNhacEntities();
        // GET: BinhLuans
        public ActionResult Index(int? id)
        {
            var binhluan = db.BinhLuans.Where(t => t.IDNhac == id).Include(t => t.TraLoiBinhLuans).OrderByDescending(t => t.NgayDang).ToList();
            return View(binhluan);
        }
        [HttpPost]
        public ActionResult ThemBinhLuan(BinhLuan bl)
        {
            User info = (User)Session["flag"];
            if (Session["flag"] == null)
            {
                return Redirect(Request.UrlReferrer.ToString());
            }
            bl.IDUser = info.IDUser;
            bl.IDNhac = Int32.Parse(Session["maNhac"].ToString());
            bl.NgayDang = DateTime.Now;
            db.BinhLuans.Add(bl);
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }
        // Create new Reply
        [HttpPost]
        public ActionResult ThemTraLoi(TraLoiBinhLuan tl)
        {
            User info = (User)Session["flag"];
            if (Session["flag"] == null)
            {
                return Redirect(Request.UrlReferrer.ToString());
            }
            tl.IDUser = info.IDUser;
            tl.NgayDang = DateTime.Now;
            db.TraLoiBinhLuans.Add(tl);
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}