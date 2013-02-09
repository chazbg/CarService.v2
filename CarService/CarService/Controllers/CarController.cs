using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CarService.DAL;
using WebMatrix.WebData;

namespace CarService.Controllers
{
    [Authorize]
    public class CarController : Controller
    {
        private CarServiceEntities db = new CarServiceEntities();

        //
        // GET: /Car/

        public ActionResult Index()
        {
            return View(CarDAL.CarsList());
        }

        //
        // GET: /Car/Details/5

        public ActionResult Details(int id = 0)
        {
            Car car = CarDAL.GetCarById(id);
            if (car == null)
            {
                return HttpNotFound();
            }
            return View(car);
        }

        //
        // GET: /Car/Create
        
        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Car/Create

        [HttpPost]
        public ActionResult Create(Car car)
        {
            if (ModelState.IsValid)
            {
                car.UserId = WebSecurity.CurrentUserId;
                CarDAL.AddCar(car);
                return RedirectToAction("Index");
            }
            return View(car);
        }

        //
        // GET: /Car/Edit/5
        
        public ActionResult Edit(int id = 0)
        {
            Car car = CarDAL.GetCarById(id);
            if (car == null)
            {
                return HttpNotFound();
            }
            return View(car);
        }

        //
        // POST: /Car/Edit/5

        [HttpPost]
        public ActionResult Edit(Car car)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    CarDAL.UpdateCar(car);
                    return RedirectToAction("Index");
                }
            }
            catch
            {
                //Log the error (add a variable name after DataException)
                ModelState.AddModelError("", "Unable to save changes. Try again, and if the problem persists, see your system administrator.");
            }
            ViewBag.UserId = car.UserId;
            return View(car);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}