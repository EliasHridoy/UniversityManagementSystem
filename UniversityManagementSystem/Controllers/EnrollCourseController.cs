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
        public ActionResult Enroll(EnrollCourseModel enrollcourse)
        {
            ViewBag.studentRegNos = enrollCoursesManager.RegNoDropdown();


            if (enrollCoursesManager.IsCourseAvailable(enrollcourse.StudentId, enrollcourse.CourseId) == false)
            {

                ViewBag.message = enrollCoursesManager.Enroll(enrollcourse);
            }
            else
            {
                ViewBag.message = "Already Enrolled This course";
            }

            return View();
        }

        public JsonResult StudentById(int studentId)
        {
            StudentCourseViewModel students = enrollCoursesManager.studentById(studentId);

            return Json(students);
        }

        public JsonResult Courses(int studentId)
        {
            List<EnrollCourseModel> courses = enrollCoursesManager.Courses(studentId);

            return Json(courses);
        }

	}
}