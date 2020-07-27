using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNhac.Models;
using PagedList;
using PagedList.Mvc;
using System.Net;

namespace Music_pv.Controllers
{
    public class BoSuuTapController : Controller
    {
        NgheNhacEntities db = new NgheNhacEntities();
        const int PAGE_SIZE = 20;
        // GET: BoSuuTap
        public ActionResult BoSuuTapCaNhan(int? page)
        {
            if(Request.Cookies["id"] == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            int id = int.Parse(Request.Cookies["id"].Value.ToString());
            ViewBag.ketqua = "Có " + db.tbAlbumCaNhans.Where(t => t.MaNguoiDung == id).Count() + " bài hát";
            IPagedList<tbAlbumCaNhan> albumCaNhans = db.tbAlbumCaNhans.Where(t => t.MaNguoiDung == id).OrderByDescending(t => t.NgayThem).ToPagedList(page ?? 1, PAGE_SIZE);
            return View(albumCaNhans);
        }
        public ActionResult ThemVaoList(int? id)
        {
            if(id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (Request.Cookies["id"] == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            int mand = int.Parse(Request.Cookies["id"].Value.ToString());
            if (db.tbAlbumCaNhans.SingleOrDefault(t => t.MaNhac == id && t.MaNguoiDung == mand) != null)
            {
                return Redirect(Request.UrlReferrer.ToString());
            }
            tbAlbumCaNhan albumCaNhan = new tbAlbumCaNhan()
            {
                MaNguoiDung = mand,
                MaNhac = id,
                NgayThem = DateTime.Now
            };
            db.tbAlbumCaNhans.Add(albumCaNhan);
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }
        public ActionResult XoaAlBumCaNhan(int? id)
        {
            if(id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (Request.Cookies["id"] == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            int idND = int.Parse(Request.Cookies["id"].Value.ToString());
            tbAlbumCaNhan albumCaNhan = db.tbAlbumCaNhans.FirstOrDefault(t => t.MaNguoiDung == idND && t.MaNhac == id);
            db.tbAlbumCaNhans.Remove(albumCaNhan);
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }

    }
}