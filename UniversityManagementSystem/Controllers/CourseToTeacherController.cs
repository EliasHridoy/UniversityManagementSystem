using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystem.Manger;
using UniversityManagementSystem.Models;

namespace UniversityManagementSystem.Controllers
{
    public class CourseToTeacherController : Controller
    {
        //
        // GET: /CourseToTeacher/

        private CourseToTeacherManager courseToTeacherManager;

        public CourseToTeacherController()
        {
            courseToTeacherManager = new CourseToTeacherManager();
        }

        [HttpGet]
        public ActionResult Save()
        {
            ViewBag.departments = courseToTeacherManager.DepartmentDropdownlist();

            return View();
        }
        [HttpPost]
        public ActionResult Save(CourseToTeacherModel courseToTeacher)
        {
            ViewBag.departments = courseToTeacherManager.DepartmentDropdownlist();

            return View();
        }
	}
}