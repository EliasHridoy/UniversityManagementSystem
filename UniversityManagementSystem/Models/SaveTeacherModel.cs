using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystem.Models
{
    public class SaveTeacherModel
    {
         [Required(ErrorMessage = "Please Provide Name")]
        public string Name { get; set; }
         [Required(ErrorMessage = "Please Provide Address")]
        public string  Address { get; set; }
        
        [EmailAddress]
        [Required(ErrorMessage = "Please Provide Email")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Please Provide ContactNo")]
        [RegularExpression(@"^[+]?[0-9]\d*(\.\d+)?$", ErrorMessage = "Special Characters are not allowed.")]
        public string ContactNo { get; set; }

        [Required(ErrorMessage = "Please Select Designation")]
        public int DesignationId { get; set; }

        [Required(ErrorMessage = "Please Select Department")]
        public int  DepartmentId { get; set; }

        [Required(ErrorMessage = "Please Select Credit")]
        [RegularExpression(@"^[\w. ]+$", ErrorMessage = "Special Characters are not allowed.")]
        public double Credit { get; set; }

    }
}