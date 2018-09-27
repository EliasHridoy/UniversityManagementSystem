
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystem.Models
{
    public class EnrollCourseModel
    {
        [Required(ErrorMessage = "Please Select Student")]
        public int StudentId { get; set; }
        
        public int  CourseId { get; set; }
        [Required(ErrorMessage = "Please Select Course")]
        public string CoursesName { get; set; }

        [Required(ErrorMessage = "Please Select Date")]
        public string Date { get; set; }

       
    }
}