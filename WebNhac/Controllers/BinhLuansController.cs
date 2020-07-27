using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebNhac.Models;
using PagedList;
using PagedList.Mvc;

namespace Music_pv.Controllers
{
    public class BinhLuansController : Controller
    {
        NgheNhacEntities db = new NgheNhacEntities();
        // GET: BinhLuans
        public ActionResult dsBinhLuan(int? id, int? page)
        {
            if(id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            IPagedList<tbBinhLuan> binhLuans = db.tbBinhLuans.Where(t => t.MaNhac == id).OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, 10);
            return PartialView(binhLuans);
        }
        public ActionResult ThemBinhLuan(string NoiDungBinhLuan, int MaNhac)
        {
            tbBinhLuan binhLuan = new tbBinhLuan()
            {
                NoiDungBinhLuan = NoiDungBinhLuan,
                MaNhac = MaNhac,
                MaND = int.Parse(Request.Cookies["id"].Value.ToString()),
                NgayDang = DateTime.Now
            };
            db.tbBinhLuans.Add(binhLuan);
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}