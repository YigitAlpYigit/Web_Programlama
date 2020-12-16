using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HayvanSahiplendirmeSitesi.Models.Entity;

namespace WebMvcStok.Controllers
{
    public class AdminController : Controller
    {
        HayvanSahiplenmeEntities db = new HayvanSahiplenmeEntities();

        [Authorize]
        public ActionResult Index()
        {
            var degerler = db.TBLADMIN.ToList();
            return View(degerler);
        }

        [Authorize]
        [HttpGet]
        public ActionResult YeniAdmin()
        {
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult YeniAdmin(TBLADMIN p1)
        {
            db.TBLADMIN.Add(p1);
            db.SaveChanges();
            return View();
        }

        [Authorize]
        public ActionResult Sil(int id)
        {
            var admin = db.TBLADMIN.Find(id);
            db.TBLADMIN.Remove(admin);
            db.SaveChanges();
            return RedirectToAction("Index");

        }

        [Authorize]
        public ActionResult AdminGetir(int id)
        {
            var admin = db.TBLADMIN.Find(id);
            return View("AdminGetir", admin);
        }

        [Authorize]
        public ActionResult Guncelle(TBLADMIN p1)
        {
            var admin = db.TBLADMIN.Find(p1.ADMINID);
            admin.ADMINEPOSTA = p1.ADMINEPOSTA;
            admin.ADMINSIFRE = p1.ADMINSIFRE;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}