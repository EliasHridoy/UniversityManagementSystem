using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystem.Models
{
    public class SaveCourseModel
    {
        [Required(ErrorMessage = "Please Provide Code")]
        public string Code { get; set; }
        [Required(ErrorMessage = "Please Provide Name")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Please Provide Credit")]
        [RegularExpression(@"^[0-9]\d*(\.\d+)?$", ErrorMessage = "Special Characters are not allowed.")]
        public double Credit { get; set; }

        [Required(ErrorMessage = "Please Select Description")]
        public string Description { get; set; }

        [Required(ErrorMessage = "Please Select Department")]
        public int DepartmentID { get; set; }

        [Required(ErrorMessage = "Please Select Semester")]
        public int  SemesterID { get; set; }
    }
}