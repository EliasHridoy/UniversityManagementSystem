
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagementSystem.Models
{
    public class EnrollCourseModel
    {
        public int StudentId { get; set; }
        public int  CourseId { get; set; }
        public string CoursesName { get; set; }
        public DateTime Date { get; set; }

       
    }
}