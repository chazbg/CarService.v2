using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//namespace CarService.DAL
//{
//    public class CarServiceDAL : Object
//    {
//        protected static CarServiceEntities db = new CarServiceEntities();

//        public static int AdminUserId()
//        {
//            return db.UserProfiles.Where(u => u.UserName == "admin"
//                     || u.UserName == "Admin")
//                     .Select(u => u.UserId)
//                     .Single();
//        }

//        public static List<SparePart> SparePartsList()
//        {
//            return db.SpareParts.Where(p => p.Activated == true).ToList();
//        }
//    }
//}
