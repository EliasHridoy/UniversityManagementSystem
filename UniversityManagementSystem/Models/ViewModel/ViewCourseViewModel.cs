using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagementSystem.Models.ViewModel
{
    public class ViewCourseViewModel
    {
        public string Code { get; set; }
        public string Name { get; set; }

        public string Semester { get; set; }
        public string AssignedTo { get; set; }
    }
}