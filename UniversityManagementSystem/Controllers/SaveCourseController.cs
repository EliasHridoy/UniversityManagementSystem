using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystem.Manger;
using UniversityManagementSystem.Models;

namespace UniversityManagementSystem.Controllers
{
    public class SaveCourseController : Controller
    {
        //
        // GET: /SaveCourse/

        private SaveCourseManager saveCourseManager;

        public SaveCourseController()
        {
            saveCourseManager = new SaveCourseManager();
        }

        [HttpGet]
        public ActionResult Save()
        {
            ViewBag.departments = saveCourseManager.DepartmentDropDownlist();
            ViewBag.semesters = saveCourseManager.SemesterDropDownlist();


            return View();
        } 
        
        [HttpPost]
        public ActionResult Save(SaveCourse course)
        {

            ViewBag.departments = saveCourseManager.DepartmentDropDownlist();
            ViewBag.semesters = saveCourseManager.SemesterDropDownlist();

            ViewBag.message = saveCourseManager.Save(course);


            return View();
        }
	}
}