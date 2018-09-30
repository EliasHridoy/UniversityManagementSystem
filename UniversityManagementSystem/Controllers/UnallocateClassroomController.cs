using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityManagementSystem.Manger;

namespace UniversityManagementSystem.Controllers
{
    public class UnallocateClassroomController : Controller
    {
        private UnallocateClassRoomManager unallocateClassRoomManager;

        public UnallocateClassroomController()
        {
            unallocateClassRoomManager = new UnallocateClassRoomManager();
        }
        public ActionResult Index()
        {
            ViewBag.Title = "Unallocate ClassRoom";
            return View();
        }

        public ActionResult UnallocateClassroom()
        {
            ViewBag.Title = "Unallocate ClassRoom";
            ViewBag.message = unallocateClassRoomManager.UnallocateClassroom();
            return View();
        }
	}
}