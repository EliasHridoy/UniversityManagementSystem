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
    public class StudentRsultController : Controller
    {
        private EnrollCoursesManager enrollCoursesManager;
        private StudentResultManager studentResultManager;

        public StudentRsultController()
        {
            enrollCoursesManager = new EnrollCoursesManager();
            studentResultManager = new StudentResultManager();
        }
        

        [HttpGet]
        public ActionResult Save()
        {
            ViewBag.studentRegNos = enrollCoursesManager.RegNoDropdown();
            ViewBag.gradeLetter = studentResultManager.GradeLetter();

            return View();
        }

        [HttpPost]
        public ActionResult Save(StudentResultModel studentResult)
        {
            ViewBag.studentRegNos = enrollCoursesManager.RegNoDropdown();
            ViewBag.gradeLetter = studentResultManager.GradeLetter();


            ViewBag.message = studentResultManager.Save(studentResult);

            return View();
        }




        public JsonResult StudentById(int studentId)
        {
            StudentCourseViewModel students = enrollCoursesManager.studentById(studentId);

            return Json(students);
        }

        public JsonResult Courses(int studentId)
        {
            List<EnrollCourseModel> courses = studentResultManager.Courses(studentId);

            return Json(courses);
        }
	}
}