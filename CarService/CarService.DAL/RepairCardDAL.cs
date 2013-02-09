using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Web.Mvc;

namespace CarService.DAL
{
    public static class RepairCardDAL
    {
        private static CarServiceEntities db = new CarServiceEntities();

        public static int AdminUserId()
        {
            return db.UserProfiles.Where(u => u.UserName == "admin"
                     || u.UserName == "Admin")
                     .Select(u => u.UserId)
                     .Single();
        }

        public static List<SparePart> SparePartsList()
        {
            return db.SpareParts.Where(p => p.Activated == true).ToList();
        }

        public static HashSet<string> EntryDatesHashSet()
        {
            HashSet<string> entryDates = new HashSet<string>();
            foreach (var repairCard in db.RepairCards)
            {
                if (!entryDates.Contains(repairCard.EntryDate.ToShortDateString()))
                {
                    entryDates.Add(repairCard.EntryDate.ToShortDateString());
                }
            }
            return entryDates;
        }

        public static List<RepairCard> RepairCardsList()
        {
            return db.RepairCards.ToList();
        }

        public static void AddRepairCard(RepairCard repairCard)
        {
            db.RepairCards.Add(repairCard);
            db.SaveChanges();
        }

        public static void UpdateRepairCard(RepairCard repairCard)
        {
            db.Entry(repairCard).State = EntityState.Modified;
            db.SaveChanges();
        }

        public static HashSet<int> SparePartsForCard(RepairCard repairCard)
        { 
            return new HashSet<int>(repairCard.SpareParts.Select(c => c.Id));
        }

        public static RepairCard GetRepairCardById(int id)
        {
            return db.RepairCards.Find(id);
        }

        public static SelectList CarIdList(RepairCard repairCard = null)
        {
            if (null == repairCard)
            {
                return new SelectList(db.Cars, "Id", "RegistryNumber");
            }
            return new SelectList(db.Cars, "Id", "RegistryNumber", repairCard.CarId);
        }

        public static SelectList EmployeeIdList(RepairCard repairCard = null)
        {
            if (null == repairCard)
            {
                return new SelectList(db.Employees.Where(e => e.FirstName != "N/A"), "Id", "FirstName");
            }
            return new SelectList(db.Employees.Where(e => e.FirstName != "N/A"), "Id", "FirstName", repairCard.EmployeeId);
        }

        public static List<SparePart> ActivatedSpareCards()
        {
         return db.SpareParts.Where(p => p.Activated == true).ToList();
        }
    }
}
