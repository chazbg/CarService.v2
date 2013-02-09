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
    public static class EmployeeDAL
    {
        private static CarServiceEntities db = new CarServiceEntities();

        public static void RemoveEmployee(int id)
        {
            Employee employee = db.Employees.Find(id);
            Employee notAvailableEmployee = db.Employees.Where(e => e.FirstName == "N/A").FirstOrDefault();
            foreach (var repairCard in employee.RepairCards)
            {
                repairCard.EmployeeId = notAvailableEmployee.Id;
            }
            db.Employees.Remove(employee);
            db.SaveChanges();
        }

        public static Employee GetEmployeeById(int id)
        {
            return db.Employees.Find(id);
        }

        public static void AddEmployee(Employee employee)
        {
            db.Employees.Add(employee);
            db.SaveChanges();
        }

        public static void UpdateEmployee(Employee employee)
        {
            db.Entry(employee).State = EntityState.Modified;
            db.SaveChanges();
        }

        public static List<Employee> EmployeesList()
        {
            return db.Employees.Include(e => e.UserProfile).ToList();
        }
    }
}
