using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystem.Manger;
using UniversityManagementSystem.Models;

namespace UniversityManagementSystem.Controllers
{
    public class SaveTeacherController : Controller
    {
        //
        // GET: /SaveTeacher/


        private SaveTeacherManager saveTeacherManager;

        public SaveTeacherController()
        {
            saveTeacherManager = new SaveTeacherManager();
        }

        [HttpGet]
        public ActionResult Save()
        {


            ViewBag.departments = saveTeacherManager.DepartmentDropDownlist();
            ViewBag.designations = saveTeacherManager.DesignationDropDownList();


            return View();
        }
        [HttpPost]
        public ActionResult Save(SaveTeacher teacher)
        {


            ViewBag.departments = saveTeacherManager.DepartmentDropDownlist();
            ViewBag.designations = saveTeacherManager.DesignationDropDownList();

            ViewBag.message = saveTeacherManager.Save(teacher);



            return View();
        }
	}
}