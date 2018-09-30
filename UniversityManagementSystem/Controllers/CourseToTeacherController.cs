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
    public class CourseToTeacherController : Controller
    {
        //
        // GET: /CourseToTeacher/

        private CourseToTeacherManager courseToTeacherManager;

        public CourseToTeacherController()
        {
            courseToTeacherManager = new CourseToTeacherManager();
        }

        [HttpGet]
        public ActionResult Save()
        {

            ViewBag.Title = "Course To Teacher";
            ViewBag.departments = courseToTeacherManager.DepartmentDropdownlist();

            return View();
        }
        [HttpPost]
        public ActionResult Save(CourseToTeacherModel courseToTeacher)
        {

            ViewBag.Title = "Course To Teacher ";
            ViewBag.departments = courseToTeacherManager.DepartmentDropdownlist();

            if (courseToTeacherManager.IsCoursAssigned(courseToTeacher.CourseId) == false)
            {
                ViewBag.message = courseToTeacherManager.Assign(courseToTeacher);
            }
            else
            {
                ViewBag.message = "Course is not available";
            }

            return View();
        }



        public JsonResult TeacherByDepartmentId(int deptId)
        {
            List<TeacherViewModel> teaachersList = courseToTeacherManager.TeacherByDepartmentId(deptId);
            return Json(teaachersList);
        }
         public JsonResult TeacherByTeacherId(int teacherId)
        {
            TeacherViewModel teaachersList = courseToTeacherManager.TeacherByTeacherId(teacherId);
            return Json(teaachersList);
        }

         public JsonResult CourseByDepartmentId(int deptId)
         {
             List<CourseViewModel> CourseList = courseToTeacherManager.CourseByDepartmentId(deptId);
             return Json(CourseList);
         }
         public JsonResult CourseByCourseId(int courseId)
         {
             CourseViewModel Course = courseToTeacherManager.CourseByCourseId(courseId);
             return Json(Course);
         }

	}
}