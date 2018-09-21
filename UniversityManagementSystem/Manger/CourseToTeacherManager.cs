using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Gateway;
using UniversityManagementSystem.Models;

namespace UniversityManagementSystem.Manger
{
    public class CourseToTeacherManager
    {


        private CourseToTeacherGateway courseToTeacherGateway;

        public CourseToTeacherManager()
        {
            courseToTeacherGateway = new CourseToTeacherGateway();
        }


        public List<DepartmentModel> DepartmentDropdownlist()
        {
            return courseToTeacherGateway.DepartmentDropdownlist();
        }

    }
}