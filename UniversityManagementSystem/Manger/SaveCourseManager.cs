using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Gateway;
using UniversityManagementSystem.Models;

namespace UniversityManagementSystem.Manger
{
    public class SaveCourseManager
    {
        private SaveCourseGateway saveCourseGateway;

        public SaveCourseManager() ///Constructor
        {
            saveCourseGateway = new SaveCourseGateway();
        }


        public string Save(SaveCourseModel course)
        {
            int rowEffect = saveCourseGateway.Save(course);

            if (rowEffect > 0)
            {
                return "Save Successful";

            }
            else
            {
                return "Save Faild";
            }
        }


        public List<DepartmentModel> DepartmentDropDownlist()
        {
            return saveCourseGateway.DepartmentDropDownlist();
        }

        public List<Semester> SemesterDropDownlist()
        {
            return saveCourseGateway.SemesterDropDownlist();
        }

    }
}