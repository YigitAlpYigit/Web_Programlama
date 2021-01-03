using HayvanSahiplendirmeSitesi.Models.Entity;
using HayvanSahiplendirmeSitesi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HayvanSahiplendirmeSitesi.Controllers
{
    public class AnasayfaController : Controller
    {
        HayvanSahiplenmeEntities db = new HayvanSahiplenmeEntities();

        public ActionResult Index()
        {
            var kategoriler = db.TBLKATEGORILER.ToList();
            var hayvanlar = db.TBLHAYVAN.ToList();
            var alicilar = db.TBLALICI.ToList();
            ViewModel vm = new ViewModel();
            vm.Hayvan = hayvanlar.ToList();
            vm.Kategori = kategoriler.ToList();
            vm.Alıcı = alicilar.ToList();
            return View(vm);
        }
    }
}