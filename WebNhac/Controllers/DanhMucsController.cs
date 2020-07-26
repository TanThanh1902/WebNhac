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
    public class DanhMucsController : Controller
    {
        NgheNhacEntities db = new NgheNhacEntities();
        // GET: DanhMucs
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult BaiHatNgheNhieu(int? page)
        {
            return View();
        }
        public ActionResult DSCaSy(int? page)
        {
            return View();
        }
        public PartialViewResult DSTheLoaiN()
        {
            return PartialView();
        }
        public ActionResult NhacTheoTL(int? id, int? page)
        {
            return View();
        }
        public PartialViewResult DSQuocGiaN()
        {
            return PartialView();
        }
        public ActionResult Top100QG(int? id, int? page)
        {
            return View();
        }
    }
}