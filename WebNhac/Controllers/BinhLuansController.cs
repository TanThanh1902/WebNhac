using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNhac.Models;

namespace Music_pv.Controllers
{
    public class BinhLuansController : Controller
    {
        NgheNhacEntities db = new NgheNhacEntities();
        // GET: BinhLuans
        public ActionResult Index(int? id)
        {
            var binhluan = db.tbBinhLuans.Where(t => t.MaNhac == id).Include(t => t.tbTraLois).OrderByDescending(t => t.NgayDang).ToList();
            return View(binhluan);
        }
    }
}