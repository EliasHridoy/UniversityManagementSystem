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

        [HttpGet]
        public ActionResult UnassignCourse()
        {
            return View();
        }
        [HttpPost]
        public ActionResult UnassignCourse()
        {
            ViewBag.message = unassignAllCoursesManager.UnassignCourses();
            return View();
        }
	}
}