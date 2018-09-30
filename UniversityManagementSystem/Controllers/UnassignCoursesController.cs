using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystem.Manger;

namespace UniversityManagementSystem.Controllers
{
    public class UnassignCoursesController : Controller
    {
        //
        // GET: /UnassignCourses/

        private UnassignAllCoursesManager unassignAllCoursesManager;

        public UnassignCoursesController()
        {

            unassignAllCoursesManager = new UnassignAllCoursesManager();
        }

        
        public ActionResult UnassignCourse()
        {
            ViewBag.Title = "Unassign All Courses";
            return View();
        }

        public ActionResult UnassignAllCourse()
        {
            ViewBag.Title = "Unassign All Courses";
            ViewBag.message = unassignAllCoursesManager.UnassignCourses();
            return View();
            
        }
	}
}