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
    public class ChuDeController : Controller
    {
        // GET: ChuDe
        NgheNhacEntities db = new NgheNhacEntities();
        const int PAGE_SIZE = 20;
        public PartialViewResult dsChuDe()
        {
            List<tbTheLoai> theLoais = db.tbTheLoais.Take(7).ToList();
            return PartialView(theLoais);
        }
        public ActionResult TatCaChuDe(int? page)
        {
            ViewBag.ketqua = " Có " + db.tbTheLoais.Count() + " kết quả ";
            IPagedList<tbTheLoai> theLoais = db.tbTheLoais.OrderBy(t => t.TenTheLoai).ToPagedList(page ?? 1, PAGE_SIZE);
            return View(theLoais);
        }
    }
}