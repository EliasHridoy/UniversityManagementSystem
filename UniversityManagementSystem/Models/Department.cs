using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystem.Models
{
    public class Department
    {

        public int Id { get; set; }

         [Required(ErrorMessage = "Please Provide Code")]
        public string Code { get; set; }
         [Required(ErrorMessage = "Please Provide Name")]
        public string  Name { get; set; }

    }
}