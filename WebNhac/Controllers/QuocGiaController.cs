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
    public class QuocGiaController : Controller
    {
        // GET: QuocGia
        NgheNhacEntities db = new NgheNhacEntities();
        const int PAGE_SIZE = 20;
        public PartialViewResult dsQuocGia()
        {
            List<tbQuocGia> quocGias = db.tbQuocGias.Take(7).ToList();
            return PartialView(quocGias);
        }
        public ActionResult TatCaQuocGia(int? page)
        {
            ViewBag.ketqua = " Có " + db.tbQuocGias.Count() + " kết quả ";
            IPagedList<tbQuocGia> quocGias = db.tbQuocGias.OrderBy(t => t.TenQuocGia).ToPagedList(page ?? 1, PAGE_SIZE);
            return View(quocGias);
        }
    }
}