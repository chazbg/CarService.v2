using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CarService.DAL;
using WebMatrix.WebData;

namespace CarService.Areas.Administrator.Controllers
{
    public class SparePartController : AdminController
    {

        //
        // GET: /Administrator/SparePart/

        public ActionResult Index()
        {
            return View(SparePartDAL.SparePartsList());
        }

        //
        // GET: /Administrator/SparePart/Details/5

        public ActionResult Details(int id = 0)
        {
            SparePart sparepart = SparePartDAL.GetSparePartById(id);
            if (sparepart == null)
            {
                return HttpNotFound();
            }
            return View(sparepart);
        }

        //
        // GET: /Administrator/SparePart/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Administrator/SparePart/Create

        [HttpPost]
        public ActionResult Create(SparePart sparepart)
        {
            if (ModelState.IsValid)
            {
                sparepart.UserId = WebSecurity.CurrentUserId;
                sparepart.Activated = true;
                SparePartDAL.AddSparePart(sparepart);
                return RedirectToAction("Index");
            }

            return View(sparepart);
        }

        //
        // GET: /Administrator/SparePart/Edit/5

        public ActionResult Edit(int id = 0)
        {
            SparePart sparepart = SparePartDAL.GetSparePartById(id);
            if (sparepart == null || sparepart.Activated == false)
            {
                return HttpNotFound();
            }
            return View(sparepart);
        }

        //
        // POST: /Administrator/SparePart/Edit/5

        [HttpPost]
        public ActionResult Edit(SparePart sparepart)
        {
            if (ModelState.IsValid)
            {
                SparePartDAL.UpdateSparePart(sparepart);
                return RedirectToAction("Index");
            }
            return View(sparepart);
        }

        //
        // GET: /Administrator/SparePart/Delete/5

        public ActionResult Delete(int id = 0)
        {
            SparePart sparepart = SparePartDAL.GetSparePartById(id);
            if (sparepart == null || sparepart.Activated == false)
            {
                return HttpNotFound();
            }
            return View(sparepart);
        }

        //
        // POST: /Administrator/SparePart/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            SparePartDAL.DisableSparePart(id);
            return RedirectToAction("Index");
        }

        //protected override void Dispose(bool disposing)
        //{
        //    db.Dispose();
        //    base.Dispose(disposing);
        //}
    }
}