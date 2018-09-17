using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagementSystem.Models
{
    public class SaveCourse
    {
        public string Code { get; set; }
        public string Name { get; set; }

        public double Credit { get; set; }

        public string Description { get; set; }
        public int DepartmentID { get; set; }
        public int  SemesterID { get; set; }
    }
}