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
            ViewBag.Title = "Allocate Classroom ";
            ViewBag.departments = registerStudentManager.GetDepartmentList();
            ViewBag.rooms = allocateClassroomManager.ViewRoom();
            ViewBag.days = allocateClassroomManager.DayView();
            return View();
        }

        [HttpPost]

        public ActionResult Allocate(AllocateClassroomModel allocateClass)
        {
            ViewBag.Title = "Allocate Classroom";
            ViewBag.departments = registerStudentManager.GetDepartmentList();
            ViewBag.rooms = allocateClassroomManager.ViewRoom();
            ViewBag.days = allocateClassroomManager.DayView();

            if (IsRoomFree(allocateClass.DayId, allocateClass.RoomId, allocateClass.FromTime, allocateClass.ToTime) ==
                false)
            {
                ViewBag.message = allocateClassroomManager.Allocate(allocateClass);
            }
            else
            {
                ViewBag.message = "Room is not available";
            }

            return View();
        }


        public JsonResult GetCoursesByDepartmentId(int departmentID)
        {
            List<CourseViewModel> courseDetails = allocateClassroomManager.ViewCourse(departmentID);
            JsonResult jsonResult = Json(courseDetails);
            return jsonResult;
        }


        public bool IsRoomFree(int dayId, int roomId ,string fromTime, string toTime )
        {
            return allocateClassroomManager.IsRoomFree(dayId, roomId, fromTime, toTime);
        }

	}
}