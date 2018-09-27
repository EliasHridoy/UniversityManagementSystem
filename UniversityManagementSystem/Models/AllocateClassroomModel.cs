using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UniversityManagementSystem.Models
{
    public class AllocateClassroomModel
    {
         [Required(ErrorMessage = "Please Provide Department")]
        public int  DepartmentId { get; set; }
        [Required(ErrorMessage = "Please Provide Course")]
         public int  CourseId { get; set; }
        [Required(ErrorMessage = "Please Provide Room")]
        public int  RoomId { get; set; }
        [Required(ErrorMessage = "Please Provide Day")]
        public int  DayId { get; set; }
        [Required(ErrorMessage = "Please Provide FromTime")]
        public string  FromTime { get; set; }
        [Required(ErrorMessage = "Please Provide ToTime")]
        public string  ToTime { get; set; }
    }
}