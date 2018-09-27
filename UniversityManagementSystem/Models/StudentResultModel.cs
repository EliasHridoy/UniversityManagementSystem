using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystem.Models
{
    public class StudentResultModel
    {

        [Required(ErrorMessage = "Please Select Student")]
        public int StudentId { get; set; }
         [Required(ErrorMessage = "Please Select Course")]
        public int EnrollCourseId { get; set; }
         [Required(ErrorMessage = "Please Select Course")]
        public int GradeLetterId { get; set; }

    }
}