using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNhac.Models;
using PagedList;
using PagedList.Mvc;

namespace Music_pv.Controllers
{
    public class BoSuuTapController : Controller
    {
        NgheNhacEntities db = new NgheNhacEntities();
        // GET: BoSuuTap
        public ActionResult Index(int? page)
        {
            return View();
        }
        public ActionResult ThemVaoList(int? id)
        {
            return View();
        }
        public ActionResult NhacTheoCS(int? id, int? page)
        {
            return View();
        }

    }
}