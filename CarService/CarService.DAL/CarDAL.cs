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
    public static class CarDAL
    {
        private static CarServiceEntities db = new CarServiceEntities();

        public static Car GetCarById(int id)
        {
            return db.Cars.Find(id);
        }

        public static void AddCar(Car Car)
        {
            db.Cars.Add(Car);
            db.SaveChanges();
        }

        public static void UpdateCar(Car Car)
        {
            db.Entry(Car).State = EntityState.Modified;
            db.SaveChanges();
        }

        public static List<Car> CarsList()
        {
            return db.Cars.Include(e => e.UserProfile).ToList();
        }
    }
}
