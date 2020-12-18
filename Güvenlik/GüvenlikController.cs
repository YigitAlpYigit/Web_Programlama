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
                return View();
            }
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("GirisYap", "Guvenlik");
        }
    }
}