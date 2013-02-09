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
    public static class UserDAL
    {
        private static CarServiceEntities db = new CarServiceEntities();

        public static UserProfile GetUserById(int id)
        {
            return db.UserProfiles.Find(id);
        }

        public static UserProfile GetUserByName(string name)
        {
            return db.UserProfiles.FirstOrDefault(u => u.UserName.ToLower() == name.ToLower());
        }

        public static void AddUser(UserProfile user)
        {
            db.UserProfiles.Add(user);
            db.SaveChanges();
        }

        public static void UpdateUser(UserProfile user)
        {
            db.Entry(user).State = EntityState.Modified;
            db.SaveChanges();
        }

        public static List<UserProfile> UsersList()
        {
            return db.UserProfiles.ToList();
        }
    }
}
