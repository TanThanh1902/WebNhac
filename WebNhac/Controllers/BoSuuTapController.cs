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
    public class BoSuuTapController : Controller
    {
        QuanLyNhacEntities db = new QuanLyNhacEntities();
        // GET: BoSuuTap
        public ActionResult Index(int? page)
        {
            return View(db.YeuThiches.OrderBy(t => t.IDNhac).ToPagedList(page ?? 1, 30));
        }
        public ActionResult ThemVaoList(int? id)
        {
            User info = (User)Session["flag"];
            YeuThich yt = new YeuThich();
            if(ModelState.IsValid)
            {
                yt.IDNhac = id;
                yt.IDUser = info.IDUser;
                db.YeuThiches.Add(yt);
                db.SaveChanges();
            }
            return Redirect(Request.UrlReferrer.ToString());
        }
        public ActionResult NhacTheoCS(int? id, int? page)
        {
            return View(db.DSNhacs.Where(t => t.IDCaSy == id).OrderByDescending(t => t.NgayDangNhac).ToPagedList(page ?? 1, 30));
        }

    }
}