using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HayvanSahiplendirmeSitesi.Models.Entity;
namespace WebMvcStok.ControllerS
{
    public class MusteriController : Controller
    {
        HayvanSahiplenmeEntities db = new HayvanSahiplenmeEntities();

        [Authorize]
        public ActionResult Index(string p)
        {
            var degerler = from d in db.TBLALICI select d;
            if (!string.IsNullOrEmpty(p))
            {
                degerler = degerler.Where(m => m.KULLANICIAD.Contains(p));
            }
            return View(degerler.ToList());
        }

        [Authorize]
        [HttpGet]
        public ActionResult YeniMusteri()
        {
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult YeniMusteri(TBLALICI p1)
        {
            db.TBLALICI.Add(p1);
            db.SaveChanges();
            return View();
        }

        [Authorize]
        public ActionResult Sil(int id)
        {
            var mstr = db.TBLALICI.Find(id);
            db.TBLALICI.Remove(mstr);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [Authorize]
        public ActionResult MusteriGetir(int id)
        {
            var mstr = db.TBLALICI.Find(id);
            return View("MusteriGetir", mstr);
        }

        [Authorize]
        public ActionResult Guncelle(TBLALICI p1)
        {
            var mstr = db.TBLALICI.Find(p1.KULLANICIID);
            mstr.KULLANICIAD = p1.KULLANICIAD;
            mstr.KULLANICISOYAD = p1.KULLANICISOYAD;
            mstr.KULLANICIEPOSTA = p1.KULLANICIEPOSTA;
            mstr.KULLANICITEL = p1.KULLANICITEL;
            mstr.KULLANICIADRES = p1.KULLANICIADRES;
            mstr.KULLANICIALIM = p1.KULLANICIALIM;
            db.SaveChanges();
            return RedirectToAction("Index");
        }


        public ActionResult SahiplenmeGuncelle(TBLALICI p1)
        {
            var mstr = db.TBLALICI.Find(p1.KULLANICIID);
            if(p1.KULLANICIIP !=null)
                mstr.KULLANICIIP = p1.KULLANICIIP;
            if (p1.KULLANICIAD != null)
                mstr.KULLANICIAD = p1.KULLANICIAD;
            if (p1.KULLANICISOYAD != null)
                mstr.KULLANICISOYAD = p1.KULLANICISOYAD;
            if (p1.KULLANICIEPOSTA != null)
                mstr.KULLANICIEPOSTA = p1.KULLANICIEPOSTA;
            if (p1.KULLANICITEL != null)
                mstr.KULLANICITEL = p1.KULLANICITEL;
            if (p1.KULLANICIADRES != null)
                mstr.KULLANICIADRES = p1.KULLANICIADRES;
            if (p1.KULLANICIALIM != null)
                mstr.KULLANICIALIM = p1.KULLANICIALIM;
            db.SaveChanges();
            return RedirectToAction("Index", "Anasayfa");
        }

    }
}