using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagementSystem.Models
{
    public class CourseToTeacherModel
    {

        public double CourseCredit { get; set; }

        public int CourseId { set; get; }

        public int TeacherId { get; set; }

    }
}