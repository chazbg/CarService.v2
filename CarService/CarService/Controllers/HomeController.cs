using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CarService.DAL;
using System.Web.Security;

namespace CarService.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";

            if (User.IsInRole("Administrator"))
            {
                return RedirectToAction("Index", "Administrator");
            }
            using (CarServiceEntities db = new CarServiceEntities())
            {
                //db.Cars.Add(new Car { Brand = "Opel", Color = "Blue", Description = "Troubleshoot Anti-Theft System", EngineNumber = 184223, EngineWorkVolume = 350, FrameNumber = 252596, Model = "Astra", Owner = "Victor Cristal", PhoneNumber = 265403, RegistryNumber = "UX1WSIRR", Year = 2001, UserId = RepairCardDAL.AdminUserId() });
                //db.Cars.Add(new Car { Brand = "Mazda", Color = "Red", Description = "Engine Overheating", EngineNumber = 286217, EngineWorkVolume = 500, FrameNumber = 343475, Model = "717C", Owner = "Gemma Bessie", PhoneNumber = 218468, RegistryNumber = "HLO2IDI7", Year = 1995, UserId = RepairCardDAL.AdminUserId() });
                //db.Cars.Add(new Car { Brand = "Peugeot", Color = "Green", Description = " Coolant Leak", EngineNumber = 210750, EngineWorkVolume = 450, FrameNumber = 291182, Model = "106", Owner = "Demelza Charmaine", PhoneNumber = 893870, RegistryNumber = "DC9PCVBO", Year = 1999, UserId = RepairCardDAL.AdminUserId() });
                //db.Cars.Add(new Car { Brand = "Fiat", Color = "Black", Description = "Car Won't Start (Possible Causes & Quick Checks)", EngineNumber = 327299, EngineWorkVolume = 550, FrameNumber = 425151, Model = "Uno", Owner = "Wayland Ewart", PhoneNumber = 852887, RegistryNumber = "8KAXZTGI", Year = 2005, UserId = RepairCardDAL.AdminUserId() });
                //db.Cars.Add(new Car { Brand = "Opel", Color = "Yellow", Description = "Engine Won't Crank or Start", EngineNumber = 295469, EngineWorkVolume = 600, FrameNumber = 453585, Model = "Agila", Owner = "Katharina Eireann", PhoneNumber = 408691, RegistryNumber = "QYLDCZ34", Year = 2002, UserId = RepairCardDAL.AdminUserId() });
                //db.Cars.Add(new Car { Brand = "Mazda", Color = "Brown", Description = "Engine Won't Start, No Fuel (Bad Fuel Pump?)", EngineNumber = 399185, EngineWorkVolume = 350, FrameNumber = 547847, Model = " 727C", Owner = "Harry Finnegan", PhoneNumber = 366342, RegistryNumber = "2UCCXJYK", Year = 1997, UserId = RepairCardDAL.AdminUserId() });
                //db.Cars.Add(new Car { Brand = "Peugeot", Color = "Purple", Description = "Engine Won't Start, No Spark", EngineNumber = 476151, EngineWorkVolume = 600, FrameNumber = 573631, Model = "307", Owner = "Emely Shae", PhoneNumber = 328080, RegistryNumber = "WK4XPWAB", Year = 1998, UserId = RepairCardDAL.AdminUserId() });
                //db.Cars.Add(new Car { Brand = "Fiat", Color = "Cyan", Description = "Engine Idles Rough or Misfires", EngineNumber = 537441, EngineWorkVolume = 500, FrameNumber = 602128, Model = "Tipo", Owner = "Jeanna Santa", PhoneNumber = 649787, RegistryNumber = "QTPCJJ8V", Year = 1994, UserId = RepairCardDAL.AdminUserId() });
                //db.Cars.Add(new Car { Brand = "Opel", Color = "Magenta", Description = "Engine Idle Surge ", EngineNumber = 573472, EngineWorkVolume = 500, FrameNumber = 656553, Model = "Calibra", Owner = "Wenona Ornella", PhoneNumber = 290856, RegistryNumber = "SIJ2Y6JM", Year = 2000, UserId = RepairCardDAL.AdminUserId() });
                //db.Cars.Add(new Car { Brand = "Mazda", Color = "White", Description = "Engine Vacuum Leak", EngineNumber = 657682, EngineWorkVolume = 600, FrameNumber = 708391, Model = " 737C", Owner = "Elettra Ethelyn", PhoneNumber = 944766, RegistryNumber = "FH6IVUQ4", Year = 2007, UserId = RepairCardDAL.AdminUserId() });
                //db.Cars.Add(new Car { Brand = "Peugeot", Color = "Red", Description = "Warning Lights On", EngineNumber = 682857, EngineWorkVolume = 350, FrameNumber = 709522, Model = "206", Owner = "Catrin Lexa", PhoneNumber = 734451, RegistryNumber = "DVBRPYBL", Year = 2006, UserId = RepairCardDAL.AdminUserId() });
                //db.Cars.Add(new Car { Brand = "Fiat", Color = "Black", Description = "Failed Emissions Test", EngineNumber = 929261, EngineWorkVolume = 450, FrameNumber = 725365, Model = "Bravo", Owner = "Dahlia Alexander", PhoneNumber = 600644, RegistryNumber = "44BHD1ID", Year = 2003, UserId = RepairCardDAL.AdminUserId() });
                //db.Cars.Add(new Car { Brand = "Opel", Color = "Yellow", Description = "Smoke In Exhaust", EngineNumber = 927880, EngineWorkVolume = 600, FrameNumber = 842912, Model = "Corsa", Owner = "Farran Moreen", PhoneNumber = 342636, RegistryNumber = "1AITTTZP", Year = 2004, UserId = RepairCardDAL.AdminUserId() });
                //db.Cars.Add(new Car { Brand = "Mazda", Color = "Green", Description = "Engine Noise", EngineNumber = 968532, EngineWorkVolume = 500, FrameNumber = 949550, Model = "757", Owner = "Flannery Adriano", PhoneNumber = 692305, RegistryNumber = "Y62HLUI9", Year = 2008, UserId = RepairCardDAL.AdminUserId() });
                //db.Cars.Add(new Car { Brand = "Peugeot", Color = "White", Description = "Poor Fuel Economy", EngineNumber = 961684, EngineWorkVolume = 450, FrameNumber = 898464, Model = "306", Owner = "Giffard Maurice", PhoneNumber = 892354, RegistryNumber = "UYTUXVPK", Year = 2011, UserId = RepairCardDAL.AdminUserId() });
                //db.Cars.Add(new Car { Brand = "Fiat", Color = "Blue", Description = "Engine Stalls", EngineNumber = 984300, EngineWorkVolume = 350, FrameNumber = 999216, Model = "500", Owner = "Kole Carol", PhoneNumber = 416500, RegistryNumber = "M4BM8J0D", Year = 2009, UserId = RepairCardDAL.AdminUserId() });

                //db.Employees.Add(new Employee { FirstName = "Dian", LastName = "Nikolov", UserId = RepairCardDAL.AdminUserId() });
                //db.Employees.Add(new Employee { FirstName = "Deyan", LastName = "Hadjiev", UserId = RepairCardDAL.AdminUserId() });
                //db.Employees.Add(new Employee { FirstName = "Herman", LastName = "Renn", UserId = RepairCardDAL.AdminUserId() });
                //db.Employees.Add(new Employee { FirstName = "Joni", LastName = "Gama", UserId = RepairCardDAL.AdminUserId() });
                //db.Employees.Add(new Employee { FirstName = "Clyde", LastName = "Hollowell", UserId = RepairCardDAL.AdminUserId() });
                //db.Employees.Add(new Employee { FirstName = "Maribel", LastName = "Reiner", UserId = RepairCardDAL.AdminUserId() });
                //db.Employees.Add(new Employee { FirstName = "Vernon", LastName = "Tauber", UserId = RepairCardDAL.AdminUserId() });
                //db.Employees.Add(new Employee { FirstName = "Shane", LastName = "Mucci", UserId = RepairCardDAL.AdminUserId() });
                //db.Employees.Add(new Employee { FirstName = "Dan", LastName = "Bellomy", UserId = RepairCardDAL.AdminUserId() });
                //db.Employees.Add(new Employee { FirstName = "Glen", LastName = "Haworth", UserId = RepairCardDAL.AdminUserId() });
                //db.Employees.Add(new Employee { FirstName = "Daphne", LastName = "Blocher", UserId = RepairCardDAL.AdminUserId() });
                //db.Employees.Add(new Employee { FirstName = "Ricardo", LastName = "Freeberg", UserId = RepairCardDAL.AdminUserId() });
                //db.Employees.Add(new Employee { FirstName = "Dustin", LastName = "Lebaron", UserId = RepairCardDAL.AdminUserId() });
                //db.Employees.Add(new Employee { FirstName = "Mollie", LastName = "Telles", UserId = RepairCardDAL.AdminUserId() });
                //db.Employees.Add(new Employee { FirstName = "Pedro", LastName = "Olguin", UserId = RepairCardDAL.AdminUserId() });
                //db.Employees.Add(new Employee { FirstName = "Cherie", LastName = "Schlosser", UserId = RepairCardDAL.AdminUserId() });

                //db.SpareParts.Add(new SparePart { Price = 200, PartName = "Alternator", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 50, PartName = "Window regulator", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 10, PartName = "Battery cable", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 15, PartName = "Battery control system", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 20, PartName = "Battery plate", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 25, PartName = "Battery tray", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 30, PartName = "Ammeter", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 50, PartName = "Dynamometer", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 50, PartName = "Fuel gauge", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 60, PartName = "Voltmeter", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 31, PartName = "Coil wire", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 22, PartName = "Distributor", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 120, PartName = "Ignition controller", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 100, PartName = "Spark plug", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 70, PartName = "Halogen", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 140, PartName = "Airbag sensor", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 40, PartName = "Anti-pinch sensor", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 80, PartName = "Coolant temperature sensor", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 40, PartName = "Starter", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 180, PartName = "Remote lock", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SpareParts.Add(new SparePart { Price = 340, PartName = "Transmission computer", Activated = true, UserId = RepairCardDAL.AdminUserId() });
                //db.SaveChanges();
            }
            
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
