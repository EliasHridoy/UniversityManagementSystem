using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystem.Manger;
using UniversityManagementSystem.Models;

namespace UniversityManagementSystem.Controllers
{
    public class DepartmentController : Controller
    {
        //
        // GET: /Department/
        private DepartmentManager departmentManager;

        public DepartmentController()
        {
            departmentManager = new DepartmentManager();
        }
        [HttpGet]
        public ActionResult Save()
        {
            ViewBag.Title = "Save Department";
            return View();
        }

        [HttpPost]
        public ActionResult Save(DepartmentModel department)
        {


            ViewBag.Title = "Save Department";
            if (department.Code.Length >= 2 && department.Code.Length <= 7)
            {
                if (departmentManager.IsCodeExists(department) == false)
                {
                    if (departmentManager.IsNameExists(department) == false)
                    {
                        ViewBag.message = departmentManager.Save(department);
                    }
                    else
                    {
                        ViewBag.message = "Name is already exists";
                    }
                }
                else
                {
                    ViewBag.message = "Code is already exists";
                }
            }
            else
            {
                ViewBag.message = "Code must be two (2) to seven (7) characters long";
            }
            return View();
        }
    }
}