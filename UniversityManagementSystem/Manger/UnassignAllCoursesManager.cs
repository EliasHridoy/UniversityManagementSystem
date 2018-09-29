using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Gateway;

namespace UniversityManagementSystem.Manger
{
    public class UnassignAllCoursesManager
    {
        private UnassignAllCoursesGateway unassignAllCoursesGateway;

        public UnassignAllCoursesManager()
        {
            unassignAllCoursesGateway = new UnassignAllCoursesGateway();
        }



        public string UnassignCourses()
        {
            int rowEffect = unassignAllCoursesGateway.UnassignCourses();
            if (rowEffect > 0)
            {
                return "Unassign Successful";
            }
            else
            {
                return "Unassign Faild";
            }

        }
    }
}