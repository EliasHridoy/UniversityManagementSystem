using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystemApp.Models
{
    public class RegisterStudent
    {
        public int Id { get; set; }

          [Required(ErrorMessage = "Please Provide Name")]
        public string Name { get; set; }

          [EmailAddress]
          [Required(ErrorMessage = "Please Provide Valid Email")]
        public string Email { get; set; }

          [Required(ErrorMessage = "Please Provide ContactNo")]
          //[RegularExpression("[0-9]", ErrorMessage = "Negative Value")]
        public string ContactNo { get; set; }

          [Required(ErrorMessage = "Please Select Date")]
        public string Date { get; set; }

          [Required(ErrorMessage = "Please Provide Address")]
        public string Address { get; set; }
          [Required(ErrorMessage = "Please Select Department")]
        public int DepartmentId { get; set; }
        
    }
}