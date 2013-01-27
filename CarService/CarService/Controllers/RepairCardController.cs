using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CarService.DAL;
using WebMatrix.WebData;
using CarService.ViewModels;

namespace CarService.Controllers
{   [Authorize]
    public class RepairCardController : Controller
    {
        private CarServiceEntities db = new CarServiceEntities();

        //
        // GET: /RepairCard/

        public ActionResult Index()
        {
            ViewBag.CurrentUserId = WebSecurity.CurrentUserId;
            ViewBag.IsAdmin = db.UserProfiles.Where(u => u.UserName == "admin" || u.UserName == "Admin")
                .Select(u => u.UserId)
                .Single() == WebSecurity.CurrentUserId; 
            
            var repairCards = db.RepairCards
                .Include(r => r.Car)
                .Include(r => r.Employee)
                .Include(r => r.UserProfile);

            PopulateEntryDatesList();
            return View(repairCards.ToList());
        }

        public void PopulateEntryDatesList()
        {
            HashSet<string> entryDates = new HashSet<string>();
            foreach (var repairCard in db.RepairCards)
            {
                if (!entryDates.Contains(repairCard.EntryDate.ToShortDateString()))
                {
                    entryDates.Add(repairCard.EntryDate.ToShortDateString());
                }
            }

            ViewBag.EntryDates = entryDates.OrderBy(x => x); 
        }

        //
        // POST: /RepairCard/
        [HttpPost]
        public ActionResult Index(FormCollection fc)
        {
            ViewBag.CurrentUserId = WebSecurity.CurrentUserId;
            ViewBag.IsAdmin = db.UserProfiles.Where(u => u.UserName == "admin" || u.UserName == "Admin")
                .Select(u => u.UserId)
                .Single() == WebSecurity.CurrentUserId;

            var repairCards = db.RepairCards
                .Include(r => r.Car)
                .Include(r => r.Employee)
                .Include(r => r.UserProfile);

            //Handle Search By Substring
            if (!String.IsNullOrEmpty(fc["searchString"]) && null != fc["entryDate"])
            {
                List<RepairCard> searchedRepairCards = new List<RepairCard>();

                foreach (var repairCard in repairCards)
                {
                    if ((fc["entryDate"] == repairCard.EntryDate.ToShortDateString())
                        && (repairCard.Car.RegistryNumber.Contains(fc["searchString"]) || repairCard.Car.FrameNumber.ToString().Contains(fc["searchString"])))
                    {
                        searchedRepairCards.Add(repairCard);
                    }
                }
                PopulateEntryDatesList();
                return View(searchedRepairCards);
            }

            //Handle Search By Time Interval
            if (null != fc["startDate"] && null != fc["endDate"])
            {
                List<RepairCard> searchedRepairCards = new List<RepairCard>();
                DateTime startDate = new DateTime(1950, 1, 1);
                DateTime endDate = DateTime.Now;
                decimal totalIncome = 0;

                if (DateTime.TryParse(fc["startDate"], out startDate) && DateTime.TryParse(fc["endDate"], out endDate))
                {
                    if (startDate > endDate)
                    {
                        DateTime tempDate = startDate;
                        startDate = endDate;
                        endDate = tempDate;
                    }
                    foreach (var repairCard in repairCards)
                    {
                        if ((null != repairCard.RepairFinishDate) && startDate <= repairCard.RepairFinishDate && endDate >= repairCard.RepairFinishDate)
                        {
                            if (null != repairCard.TotalPrice)
                            {
                                totalIncome += (decimal)repairCard.TotalPrice;
                                searchedRepairCards.Add(repairCard);
                            }
                            else
                            {
                                ModelState.AddModelError("", "Program logic error.");
                            }

                        }
                    }
                    ViewBag.TotalIncome = totalIncome;
                    PopulateEntryDatesList();
                    return View(searchedRepairCards);
                    
                }
                else
                {
                    ModelState.AddModelError("", "Could not parse the given dates.");
                }
            }

            PopulateEntryDatesList();
            return View(repairCards.ToList());
        }

        //public void QueryBySubstring(FormCollection fc)
        //{
        //    if (!String.IsNullOrEmpty(fc["searchString"]) && null != fc["entryDate"])
        //    {
        //        List<RepairCard> searchedRepairCards = new List<RepairCard>();

        //        foreach (var repairCard in db.RepairCards)
        //        {
        //            if ((fc["entryDate"] == repairCard.EntryDate.ToString())
        //                && (repairCard.Car.RegistryNumber.Contains(fc["searchString"]) || repairCard.Car.FrameNumber.ToString().Contains(fc["searchString"])))
        //            {
        //                searchedRepairCards.Add(repairCard);
        //            }
        //        }
        //        PopulateEntryDatesList();
        //        return View(searchedRepairCards);
        //    }
        //}
        //
        // GET: /RepairCard/Details/5

        public ActionResult Details(int id = 0)
        {
            RepairCard repaircard = db.RepairCards.Find(id);
            if (repaircard == null)
            {
                return HttpNotFound();
            }      

            return View(repaircard);
        }

        //
        // GET: /RepairCard/Create

        public ActionResult Create()
        {
            ViewBag.CarId = new SelectList(db.Cars, "Id", "RegistryNumber");
            ViewBag.EmployeeId = new SelectList(db.Employees.Where(e => e.FirstName != "N/A"), "Id", "FirstName");
            ViewBag.SpareParts = db.SpareParts.Where(p => p.Activated == true).ToList();
            return View();
        }

        //
        // POST: /RepairCard/Create

        [HttpPost]
        public ActionResult Create(RepairCard repairCard, string[] selectedParts)
        {
                try
                {
                    repairCard.PartsPrice = 0;

                    if (selectedParts == null)
                    {
                        repairCard.SpareParts = new List<SparePart>();
                    }
                    else
                    {
                        var selectedPartsHS = new HashSet<string>(selectedParts);

                        foreach (var sparePart in db.SpareParts.Where(p => p.Activated == true))
                        {
                            if (selectedPartsHS.Contains(sparePart.Id.ToString()))
                            {
                                repairCard.SpareParts.Add(sparePart);
                                repairCard.PartsPrice += sparePart.Price;
                            }
                        }

                        repairCard.UserId = WebSecurity.CurrentUserId;
                        repairCard.EntryDate = DateTime.Now;
                        db.RepairCards.Add(repairCard);
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                }
                catch (DataException)
                {
                    //Log the error (add a variable name after DataException)
                    ModelState.AddModelError("", "Unable to save changes. Try again, and if the problem persists, see your system administrator.");
                }
            ViewBag.CarId = new SelectList(db.Cars, "Id", "RegistryNumber", repairCard.CarId);
            ViewBag.EmployeeId = new SelectList(db.Employees.Where(e => e.FirstName != "N/A"), "Id", "FirstName", repairCard.EmployeeId);
            ViewBag.SpareParts = db.SpareParts.Where(p => p.Activated == true).ToList();
            return View(repairCard);
        }

        //
        // GET: /RepairCard/Edit/5

        public ActionResult Edit(int id = 0)
        {
            RepairCard repaircard = db.RepairCards.Find(id);
            if (repaircard == null)
            {
                return HttpNotFound();
            }
            ViewBag.CarId = new SelectList(db.Cars, "Id", "RegistryNumber", repaircard.CarId);
            ViewBag.EmployeeId = new SelectList(db.Employees.Where(e => e.FirstName != "N/A"), "Id", "FirstName", repaircard.EmployeeId);

            InitializeEditViewModel(repaircard);

            return View(repaircard);
        }

        public void InitializeEditViewModel(RepairCard repaircard)
        {
            var allSpareParts = db.SpareParts.Where(p => p.Activated == true);
            var repairCardParts = new HashSet<int>(repaircard.SpareParts.Select(c => c.Id));
            var viewModel = new List<SelectedPartData>();
            foreach (var part in allSpareParts)
            {
                viewModel.Add(new SelectedPartData
                {
                    Id = part.Id,
                    Price = part.Price,
                    PartName = part.PartName,
                    Selected = repairCardParts.Contains(part.Id)
                });
            }
            ViewBag.SpareParts = viewModel;
        }

        //
        // POST: /RepairCard/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection formCollection, string[] selectedParts)
        {
            var repairCardToUpdate = db.RepairCards
                                       .Include(i => i.SpareParts)
                                       .Where(i => i.Id == id)
                                       .Single();

            if (TryUpdateModel(repairCardToUpdate, "", null, excludeProperties: new string[] { "SpareParts" }))
            {
                try
                {
                    UpdateRepairCardSpareParts(selectedParts, repairCardToUpdate);

                    repairCardToUpdate.PartsPrice = 0;
                    foreach (var sparePart in repairCardToUpdate.SpareParts)
                    {
                        repairCardToUpdate.PartsPrice += sparePart.Price;
                    }

                    db.Entry(repairCardToUpdate).State = EntityState.Modified;
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
                catch (DataException)
                {
                    //Log the error (add a variable name after DataException)
                    ModelState.AddModelError("", "Unable to save changes. Try again, and if the problem persists, see your system administrator.");
                }
            }
            ViewBag.CarId = new SelectList(db.Cars, "Id", "RegistryNumber", repairCardToUpdate.CarId);
            ViewBag.EmployeeId = new SelectList(db.Employees, "Id", "FirstName", repairCardToUpdate.EmployeeId);
            InitializeEditViewModel(repairCardToUpdate);
            return View(repairCardToUpdate);
        }

        private void UpdateRepairCardSpareParts(string[] selectedParts, RepairCard repairCardToUpdate)
        {


            if (selectedParts == null)
            {
                repairCardToUpdate.SpareParts = new List<SparePart>();
                return;
            }

            var selectedPartsHS = new HashSet<string>(selectedParts);
            var repairCardSpareParts = new HashSet<int>
                (repairCardToUpdate.SpareParts.Select(c => c.Id));
            foreach (var sparePart in db.SpareParts.Where(p => p.Activated == true))
            {
                if (selectedPartsHS.Contains(sparePart.Id.ToString()))
                {
                    if (!repairCardSpareParts.Contains(sparePart.Id))
                    {
                        repairCardToUpdate.SpareParts.Add(sparePart);
                    }
                }
                else
                {
                    if (repairCardSpareParts.Contains(sparePart.Id))
                    {
                        repairCardToUpdate.SpareParts.Remove(sparePart);
                    }
                }
            }
        }
        //
        // GET: /RepairCard/RepairFinish/5

        public ActionResult RepairFinish(int id = 0)
        {
            RepairCard repaircard = db.RepairCards.Find(id);
            if (repaircard == null)
            {
                return HttpNotFound();
            }
            ViewBag.CarId = new SelectList(db.Cars, "Id", "RegistryNumber", repaircard.CarId);
            ViewBag.EmployeeId = new SelectList(db.Employees.Where(e => e.FirstName != "N/A"), "Id", "FirstName", repaircard.EmployeeId);
            return View(repaircard);
        }

        //
        // POST: /RepairCard/RepairFinish/5

        [HttpPost]
        public ActionResult RepairFinish(RepairCard repaircard)
        {
            if (ModelState.IsValid)
            {
                if (repaircard.TotalPrice > repaircard.PartsPrice)
                {
                    repaircard.RepairFinishDate = DateTime.Now;
                    db.Entry(repaircard).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else 
                {
                    ModelState.AddModelError("", "Total Cost must be higher than the price of the parts.");
                }
            }

            ViewBag.CarId = new SelectList(db.Cars, "Id", "RegistryNumber", repaircard.CarId);
            ViewBag.EmployeeId = new SelectList(db.Employees.Where(e => e.FirstName != "N/A"), "Id", "FirstName", repaircard.EmployeeId);
            return View(repaircard);
        }

        //
        // GET: /RepairCard/Delete/5

        public ActionResult Delete(int id = 0)
        {
            RepairCard repaircard = db.RepairCards.Find(id);
            if (repaircard == null)
            {
                return HttpNotFound();
            }
            return View(repaircard);
        }

        //
        // POST: /RepairCard/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            RepairCard repaircard = db.RepairCards.Find(id);
            db.RepairCards.Remove(repaircard);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}