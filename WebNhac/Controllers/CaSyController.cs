using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNhac.Models;
using PagedList;
using PagedList.Mvc;

namespace WebNhac.Controllers
{
    public class CaSyController : Controller
    {
        const int PAGE_SIZE = 20;
        // GET: CaSy
        NgheNhacEntities db = new NgheNhacEntities();
        public PartialViewResult dsCaSy()
        {
            List<tbCaSi> tbCaSis = db.tbCaSis.Take(7).ToList();
            return PartialView(tbCaSis);
        }
        public ActionResult TatCaCaSy(int? page)
        {
            ViewBag.ketqua = " Có " + db.tbCaSis.Count() + " kết quả ";
            IPagedList<tbCaSi> tbCaSis = db.tbCaSis.OrderBy(t => t.TenCaSi).ToPagedList(page ?? 1, PAGE_SIZE);
            return View(tbCaSis);
        }
        public PartialViewResult CaSyTheoNhac(int id)
        {
            List<tbCaSi> caSis = db.tbTrinhBays.Where(t => t.MaNhac == id).Select(t => t.tbCaSi).ToList();
            return PartialView(caSis);
        }
    }
}