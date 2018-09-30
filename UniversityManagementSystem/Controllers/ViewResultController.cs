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
    public class ViewResultController : Controller
    {

        private EnrollCoursesManager enrollCoursesManager;
        private ViewResultManager viewResultManager;

        public ViewResultController()
        {
            enrollCoursesManager = new EnrollCoursesManager();
            viewResultManager = new ViewResultManager();
        }
        
        [HttpGet]
        public ActionResult ViewResult()
        {


            ViewBag.Title = "View Result";
            ViewBag.studentRegNos = enrollCoursesManager.RegNoDropdown();
             

            return View();
        }





        public JsonResult StudentById(int studentId)
        {
            StudentCourseViewModel students = enrollCoursesManager.studentById(studentId);

            return Json(students);
        }

        public JsonResult CoursesResult(int studentId)
        {
            List<ViewResultCourseViewModel> courses = viewResultManager.CoursesResult(studentId);

            return Json(courses);
        }


        


	}
}