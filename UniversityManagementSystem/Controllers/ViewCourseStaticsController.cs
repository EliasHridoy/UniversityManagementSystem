using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystem.Manger;
using UniversityManagementSystemApp.Mannager;

namespace UniversityManagementSystem.Controllers
{
    public class ViewCourseStaticsController : Controller
    {
        //
        // GET: /ViewCourseStatics/

        private RegisterStudentManager registerStudentManager;
        private ViewCourseStaticsManager viewCourseStaticsManager;

        public ViewCourseStaticsController()
        {
            registerStudentManager = new RegisterStudentManager();
            viewCourseStaticsManager = new ViewCourseStaticsManager();
        }


        [HttpGet]
        public ActionResult ViewCourse()
        {
            ViewBag.departments = registerStudentManager.GetDepartmentList();
            return View();
        }
        [HttpPost]
        public ActionResult ViewCourse(int departmentId)
        {
            ViewBag.departments = registerStudentManager.GetDepartmentList();
            ViewBag.courseList = viewCourseStaticsManager.ViewCourse(departmentId);

            return View();
        }
    }
}