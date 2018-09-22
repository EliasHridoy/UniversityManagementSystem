using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystem.Manger;
using UniversityManagementSystem.Models;
using UniversityManagementSystem.Models.ViewModel;
using UniversityManagementSystemApp.Mannager;

namespace UniversityManagementSystem.Controllers
{
    public class AllocateClassroomController : Controller
    {
        //
        // GET: /AllocateClassroom/

        private RegisterStudentManager registerStudentManager;
        private AllocateClassroomManager allocateClassroomManager;

        public AllocateClassroomController()
        {
            registerStudentManager = new RegisterStudentManager();
            allocateClassroomManager = new AllocateClassroomManager();
        }

        [HttpGet]
        public ActionResult Allocate()
        {
            ViewBag.departments = registerStudentManager.GetDepartmentList();
            ViewBag.rooms = allocateClassroomManager.ViewRoom();
            ViewBag.days = allocateClassroomManager.DayView();
            return View();
        }
        [HttpPost]
        public ActionResult Allocate(AllocateClassroomModel allocateClassroomModel)
        {
            ViewBag.departments = registerStudentManager.GetDepartmentList();
            ViewBag.rooms = allocateClassroomManager.ViewRoom();
            ViewBag.days = allocateClassroomManager.DayView();

            ViewBag.message = allocateClassroomManager.Allocate(allocateClassroomModel);

            return View();
        }


        public JsonResult GetCoursesByDepartmentId(int departmentID)
        {
            List<CourseViewModel> courseDetails = allocateClassroomManager.ViewCourse(departmentID);
            JsonResult jsonResult = Json(courseDetails);
            return jsonResult;
        }
	}
}