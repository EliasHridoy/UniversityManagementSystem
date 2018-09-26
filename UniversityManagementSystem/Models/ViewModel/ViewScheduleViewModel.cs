using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagementSystem.Models.ViewModel
{
    public class ViewScheduleViewModel
    {
        public int CourseId { get; set; }
        public string CourseCode { get; set; }
        public string Name { get; set; }
        public string ScheduleInFo { get; set; }
    }
}