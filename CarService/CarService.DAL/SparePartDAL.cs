using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;

namespace CarService.DAL
{
    public static class SparePartDAL
    {
        private static CarServiceEntities db = new CarServiceEntities();

        public static List<SparePart> SparePartsList()
        {
            return db.SpareParts.Include(s => s.UserProfile).ToList();
        }

        public static SparePart GetSparePartById(int id)
        {
            return db.SpareParts.Find(id);
        }

        public static void AddSparePart(SparePart sparePart)
        {
            db.SpareParts.Add(sparePart);
            db.SaveChanges();
        }

        public static void UpdateSparePart(SparePart sparePart)
        {
            db.Entry(sparePart).State = EntityState.Modified;
            db.SaveChanges();
        }

        public static void DisableSparePart(int id)
        {
            SparePart sparePart = db.SpareParts.Find(id);
            sparePart.Activated = false;
            db.Entry(sparePart).State = EntityState.Modified;
            db.SaveChanges();
        }
    }
}
