using HayvanSahiplendirmeSitesi.Models.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HayvanSahiplendirmeSitesi.Controllers
{
    public class HayvanController : Controller
    {
        HayvanSahiplenmeEntities db = new HayvanSahiplenmeEntities();

        [Authorize]
        public ActionResult Index()
        {
            var degerler = db.TBLHAYVAN.ToList();
            return View(degerler);
        }

        [Authorize]
        [HttpGet]
        public ActionResult YeniHayvan()
        {
            List<SelectListItem> degerler = (from i in db.TBLKATEGORILER.ToList()
                                             select new SelectListItem
                                             {
                                                 Text = i.KATEGORIAD,
                                                 Value = i.KATEGORIID.ToString()
                                             }).ToList();
            ViewBag.dgr = degerler;
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult YeniHayvan(TBLHAYVAN p1)
        {
            var ktg = db.TBLKATEGORILER.Where(m => m.KATEGORIID == p1.TBLKATEGORILER.KATEGORIID).FirstOrDefault();
            p1.TBLKATEGORILER = ktg;
            db.TBLHAYVAN.Add(p1);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [Authorize]
        public ActionResult Sil(int id)
        {
            var hayvan = db.TBLHAYVAN.Find(id);
            db.TBLHAYVAN.Remove(hayvan);
            db.SaveChanges();
            return RedirectToAction("Index");

        }

        [Authorize]
        public ActionResult HayvanGetir(int id)
        {
            var hayvan = db.TBLHAYVAN.Find(id);
            List<SelectListItem> degerler = (from i in db.TBLKATEGORILER.ToList()
                                             select new SelectListItem
                                             {
                                                 Text = i.KATEGORIAD,
                                                 Value = i.KATEGORIID.ToString()
                                             }).ToList();
            ViewBag.dgr = degerler;
            return View("HayvanGetir", hayvan);
        }

        [Authorize]
        public ActionResult Guncelle(TBLHAYVAN p1)
        {
            var hayvan = db.TBLHAYVAN.Find(p1.HAYVANID);
            hayvan.HAYVANAD = p1.HAYVANAD;
            var ktg = db.TBLKATEGORILER.Where(m => m.KATEGORIID == p1.TBLKATEGORILER.KATEGORIID).FirstOrDefault();
            hayvan.HAYVANKATEGORI = ktg.KATEGORIID;
            hayvan.HAYVANCINSIYET = p1.HAYVANCINSIYET;
            hayvan.HAYVANYAS = p1.HAYVANYAS;
            hayvan.HAYVANCINS = p1.HAYVANCINS;
            hayvan.HAYVANIC = p1.HAYVANIC;
            hayvan.HAYVANRESIM_1 = p1.HAYVANRESIM_1;
            hayvan.HAYVANRESIM_2 = p1.HAYVANRESIM_2;
            hayvan.HAYVANRESIM_3 = p1.HAYVANRESIM_3;
            hayvan.HAYVANRESIM_4 = p1.HAYVANRESIM_4;
            hayvan.HAYVANRESIM_5 = p1.HAYVANRESIM_5;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}