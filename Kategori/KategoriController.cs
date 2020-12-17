using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HayvanSahiplendirmeSitesi.Models.Entity;

namespace WebMvcStok.Controllers
{
    public class KategoriController : Controller
    {
        HayvanSahiplenmeEntities db = new HayvanSahiplenmeEntities();

        [Authorize]
        public ActionResult Index()
        {
            var degerler = db.TBLKATEGORILER.ToList();
            return View(degerler);
        }

        [Authorize]
        [HttpGet]
        public ActionResult YeniKategori()
        {
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult YeniKategori(TBLKATEGORILER p1)
        {
            db.TBLKATEGORILER.Add(p1);
            db.SaveChanges();
            return View();
        }

        [Authorize]
        public ActionResult Sil(int id)
        {
            int a = 0;
            var kategori = db.TBLKATEGORILER.Find(id);
            foreach (var item in db.TBLHAYVAN)
            {
                if (item.HAYVANKATEGORI == id)
                    a++;
            }
            if (a == 0)
            {
                db.TBLKATEGORILER.Remove(kategori);
                db.SaveChanges();
            }
            return RedirectToAction("Index");

        }

        [Authorize]
        public ActionResult KategoriGetir(int id)
        {
            var kategori = db.TBLKATEGORILER.Find(id);
            return View("KategoriGetir", kategori);
        }

        [Authorize]
        public ActionResult Guncelle(TBLKATEGORILER p1)
        {
            var kategori = db.TBLKATEGORILER.Find(p1.KATEGORIID);
            kategori.KATEGORIAD = p1.KATEGORIAD;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}