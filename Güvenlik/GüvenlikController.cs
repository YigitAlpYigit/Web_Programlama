using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Mvc;
using HayvanSahiplendirmeSitesi.Models.Entity;

namespace WebMvcStok.Controllers
{
    public class GuvenlikController : Controller
    {
        HayvanSahiplenmeEntities db = new HayvanSahiplenmeEntities();

        [HttpGet]
        public ActionResult GirisYap()
        {
            return View();
        }

        [HttpPost]
        public ActionResult GirisYap(TBLADMIN t)
        {
            var bilgiler = db.TBLADMIN.FirstOrDefault(x => x.ADMINEPOSTA == t.ADMINEPOSTA && x.ADMINSIFRE == t.ADMINSIFRE);
            if (bilgiler != null)
            {
                FormsAuthentication.SetAuthCookie(bilgiler.ADMINEPOSTA, false);
                return RedirectToAction("Index", "Kategori");
            }
            else
            {
                ViewBag.LoginError = "Giriş Bilgileriniz Hatalıdır...";
                return View();
            }
        }

        [HttpGet]
        public ActionResult UyeGirisYap()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UyeGirisYap(TBLALICI t)
        {
            var bilgiler = db.TBLALICI.FirstOrDefault(x => x.KULLANICIEPOSTA == t.KULLANICIEPOSTA && x.KULLANICISIFRE == t.KULLANICISIFRE);
            if (bilgiler != null)
            {
                bilgiler.KULLANICIIP = t.KULLANICIIP;
                db.SaveChanges();
                return RedirectToAction("Index", "Anasayfa");
            }
            else
            {
                ViewBag.LoginError = "Giriş Bilgileriniz Hatalıdır...";
                return View();
            }
        }

        [HttpGet]
        public ActionResult YeniUye()
        {
            return View();
        }

        [HttpPost]
        public ActionResult YeniUye(TBLALICI p1)
        {
            bool kontrol = true;

            foreach (var yeniuye in db.TBLALICI)
            {
                if (yeniuye.KULLANICIEPOSTA == p1.KULLANICIEPOSTA)
                {
                    kontrol = false;
                }
            }

            if (kontrol == true)
            {
                db.TBLALICI.Add(p1);
                db.SaveChanges();
                return RedirectToAction("UyeGirisYap", "Guvenlik");
            }
            else
            {
                ViewBag.LoginError = "E-Posta Kullanılmaktadır.";
                return View();
            }
        }
        public ActionResult Logout()
        { 
            FormsAuthentication.SignOut();
            return RedirectToAction("GirisYap", "Guvenlik");
        }
        public ActionResult LogoutUye()
        { 
            FormsAuthentication.SignOut();
            return RedirectToAction("UyeGirisYap", "Guvenlik");
        }
    }
}
