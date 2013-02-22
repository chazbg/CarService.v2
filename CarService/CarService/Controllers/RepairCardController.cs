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
        //
        // GET: /RepairCard/

        public ActionResult Index()
        {
            ViewBag.CurrentUserId = WebSecurity.CurrentUserId;
            ViewBag.IsAdmin = RepairCardDAL.AdminUserId() == WebSecurity.CurrentUserId; 
            
            PopulateEntryDatesList();
            return View(RepairCardDAL.RepairCardsList());
        }

        public void PopulateEntryDatesList()
        {
            HashSet<string> entryDates = RepairCardDAL.EntryDatesHashSet();
            ViewBag.EntryDates = entryDates.OrderBy(x => x); 
        }

        //
        // POST: /RepairCard/
        [HttpPost]
        public ActionResult Index(FormCollection fc)
        {
            ViewBag.CurrentUserId = WebSecurity.CurrentUserId;
            ViewBag.IsAdmin = RepairCardDAL.AdminUserId() == WebSecurity.CurrentUserId;

            List<RepairCard> repairCards = RepairCardDAL.RepairCardsList();

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
            return View(repairCards);
        }

        // GET: /RepairCard/Details/5

        public ActionResult Details(int id = 0)
        {
            RepairCard repaircard = RepairCardDAL.GetRepairCardById(id);
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
            ViewBag.CarId = RepairCardDAL.CarIdList();
            ViewBag.EmployeeId = RepairCardDAL.EmployeeIdList(); 
            ViewBag.SpareParts = RepairCardDAL.SparePartsList();
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

                    foreach (var sparePart in RepairCardDAL.ActivatedSpareCards())
                    {
                        if (selectedPartsHS.Contains(sparePart.Id.ToString()))
                        {
                            repairCard.SpareParts.Add(sparePart);
                            repairCard.PartsPrice += sparePart.Price;
                        }
                    }

                    repairCard.RepairFinishDate = null;
                    repairCard.TotalPrice = null;
                    repairCard.UserId = WebSecurity.CurrentUserId;
                    repairCard.EntryDate = DateTime.Now;

                    RepairCardDAL.AddRepairCard(repairCard);
                    return RedirectToAction("Index");
                }
            }
            catch (DataException)
            {
                //Log the error (add a variable name after DataException)
                ModelState.AddModelError("", "Unable to save changes. Try again, and if the problem persists, see your system administrator.");
            }
            ViewBag.CarId = RepairCardDAL.CarIdList(repairCard);
            ViewBag.EmployeeId = RepairCardDAL.EmployeeIdList(repairCard); 
            ViewBag.SpareParts = RepairCardDAL.SparePartsList();
            return View(repairCard);
        }

        //
        // GET: /RepairCard/Edit/5

        public ActionResult Edit(int id = 0)
        {
            RepairCard repairCard = RepairCardDAL.GetRepairCardById(id);
            if (repairCard == null)
            {
                return HttpNotFound();
            }
            else if (repairCard.UserId != WebSecurity.CurrentUserId && !User.IsInRole("Admin"))
            {
                return RedirectToAction("Index","Error");
            }

            ViewBag.CarId = RepairCardDAL.CarIdList(repairCard);
            ViewBag.EmployeeId = RepairCardDAL.EmployeeIdList(repairCard); 
            InitializeEditViewModel(repairCard);
            return View(repairCard);
        }

        public void InitializeEditViewModel(RepairCard repaircard)
        {
            var allSpareParts = RepairCardDAL.SparePartsList();
            var repairCardParts = RepairCardDAL.SparePartsForCard(repaircard);
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
            var repairCardToUpdate = RepairCardDAL.GetRepairCardById(id);

            if (TryUpdateModel(repairCardToUpdate, "", null, excludeProperties: new string[] { "SpareParts" }))
            {
                try
                {
                    if (formCollection["TotalPrice"] != null)
                    {
                        decimal totalPrice;
                        decimal.TryParse(formCollection["TotalPrice"], out totalPrice);
                        repairCardToUpdate.TotalPrice = totalPrice;
                        repairCardToUpdate.RepairFinishDate = DateTime.Now;
                    }
                    else
                    {
                        UpdateRepairCardSpareParts(selectedParts, repairCardToUpdate);

                        repairCardToUpdate.PartsPrice = 0;
                        foreach (var sparePart in repairCardToUpdate.SpareParts)
                        {
                            repairCardToUpdate.PartsPrice += sparePart.Price;
                        }
                    }

                    RepairCardDAL.UpdateRepairCard(repairCardToUpdate);
                    return RedirectToAction("Index");
                }
                catch (DataException)
                {
                    //Log the error (add a variable name after DataException)
                    ModelState.AddModelError("", "Unable to save changes. Try again, and if the problem persists, see your system administrator.");
                }
            }
            ViewBag.CarId = RepairCardDAL.CarIdList(repairCardToUpdate);
            ViewBag.EmployeeId = RepairCardDAL.EmployeeIdList(repairCardToUpdate); 
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
            var repairCardSpareParts = RepairCardDAL.SparePartsForCard(repairCardToUpdate);

            foreach (var sparePart in RepairCardDAL.SparePartsList())
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
    }
}