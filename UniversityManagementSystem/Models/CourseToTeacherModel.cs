using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystem.Models
{
    public class CourseToTeacherModel
    {

         [Required(ErrorMessage = "Please Select Department")]
        public int DepartmentId { get; set; }
        public double CourseCredit { get; set; }

         [Required(ErrorMessage = "Please Select Course")]
        public int CourseId { set; get; }
         [Required(ErrorMessage = "Please Select Teacher")]
        public int TeacherId { get; set; }

    }
}