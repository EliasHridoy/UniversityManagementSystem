using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystem.Manger;
using UniversityManagementSystem.Models;
using UniversityManagementSystem.Models.ViewModel;

namespace UniversityManagementSystem.Controllers
{
    public class EnrollCourseController : Controller
    {
        private EnrollCoursesManager enrollCoursesManager;

        public EnrollCourseController() // Constructor
        {
            enrollCoursesManager = new EnrollCoursesManager();
        }

        [HttpGet]
        public ActionResult Enroll()
        {
            ViewBag.studentRegNos = enrollCoursesManager.RegNoDropdown();

            return View();
        }
        [HttpPost]
        public ActionResult Enroll(EnrollCourseModel Enrollcourse)
        {
            ViewBag.studentRegNos = enrollCoursesManager.RegNoDropdown();

           


            ViewBag.message = enrollCoursesManager.Enroll(Enrollcourse);

            return View();
        }

        public JsonResult studentById(int studentId)
        {
            StudentCourseViewModel students = enrollCoursesManager.studentById(studentId);
            
            Courses(students.DepartmentId);
            
            return Json(students);
        }

        public void Courses(int departmentId )
        {
             ViewBag.courses = enrollCoursesManager.Courses(departmentId);
        }

	}
}