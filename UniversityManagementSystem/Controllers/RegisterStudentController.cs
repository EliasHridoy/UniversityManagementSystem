using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystem.Manger;
using UniversityManagementSystemApp.Mannager;
using UniversityManagementSystemApp.Models;

namespace UniversityManagementSystemApp.Controllers
{
    public class RegisterStudentController : Controller
    {

        private RegisterStudentManager registerStudentManager;

        public RegisterStudentController()
        {
            registerStudentManager = new RegisterStudentManager();
        }


        [HttpGet]
        public ActionResult Save()
        {
            ViewBag.departments = registerStudentManager.GetDepartmentList();
            return View();
        }

        [HttpPost]
        public ActionResult Save(RegisterStudent registerStudent)
        {

            ViewBag.departments = registerStudentManager.GetDepartmentList();

            string message = registerStudentManager.Save(registerStudent);
            ViewBag.Message = message;
            return View();
        }
        
     
	}
}