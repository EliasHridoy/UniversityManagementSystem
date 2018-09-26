using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystem.Manger;
using UniversityManagementSystem.Models.ViewModel;
using UniversityManagementSystemApp.Mannager;

namespace UniversityManagementSystem.Controllers
{
    public class ViewClassScheduleController : Controller
    {
        private RegisterStudentManager registerStudentManager;
        private ViewScheduleManager viewScheduleManager;


        public ViewClassScheduleController()
        {
            registerStudentManager = new RegisterStudentManager();
            viewScheduleManager = new ViewScheduleManager();
        }
        public ActionResult ViewClassSchedule()
        {
            ViewBag.departments = registerStudentManager.GetDepartmentList();

            return View();
        }


        public JsonResult ScheduelByDepartmentId(int departmentId)
        {
            List<ViewScheduleViewModel> schedule = viewScheduleManager.ViewSchedule(departmentId);

            return Json(schedule);
        }



	}
}