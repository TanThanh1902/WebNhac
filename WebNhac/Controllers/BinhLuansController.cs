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