﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityManagementSystem.Models.ViewModel
{
    public class TeacherViewModel
    {
        public int  Id { get; set; }
        public string Name { get; set; }
        public double Credit { get; set; }
        public double RemainingCredit { get; set; }

    }
}