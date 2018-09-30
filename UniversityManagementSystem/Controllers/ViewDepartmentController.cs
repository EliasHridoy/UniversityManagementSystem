using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystem.Manger;
using UniversityManagementSystem.Models;

namespace UniversityManagementSystem.Controllers
{
    public class ViewDepartmentController : Controller
    {
        //
        // GET: /ViewDepartment/
        DepartmentManager departmentManager = new DepartmentManager();

        public ViewDepartmentController()
        {
            ViewBag.Title = "View Department";
            departmentManager = new DepartmentManager();
        }
        public ActionResult ViewAllDepartment()
        {
            List<DepartmentModel> departments = departmentManager.ViewAllDepartment();
            ViewBag.departments = departments;
            return View();
        }
	}
}