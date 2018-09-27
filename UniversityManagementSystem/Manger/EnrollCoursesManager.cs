using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Gateway;
using UniversityManagementSystem.Models;
using UniversityManagementSystem.Models.ViewModel;

namespace UniversityManagementSystem.Manger
{
    public class EnrollCoursesManager
    {

        private EnrollCourseGateway enrollCourseGateway;

        public EnrollCoursesManager()//Constructor
        {
            enrollCourseGateway = new EnrollCourseGateway();
        }

        //-----------------------------------------------------------



        public bool IsCourseAvailable(int studentId, int courseId)
        {
            return enrollCourseGateway.IsCourseAvailable(studentId, courseId);


        }

        //-----------------------------------------------------------


        public List<EnrollCourseModel> Courses(int studentId)
        {
            return enrollCourseGateway.Courses(studentId);
        }



        //-----------------------------------------------------------


        public string Enroll(EnrollCourseModel student)
        {
            int rowEffect = enrollCourseGateway.Enroll(student);
            if (rowEffect > 0)
            {
                return "Save Success";
            }
            else
            {

                return "Save Faild";

            }
        }

        //-----------------------------------------------------------



        public List<StudentCourseViewModel> RegNoDropdown()
        {
            return enrollCourseGateway.RegNoDropdown();
        }

        //-----------------------------------------------------------
        public StudentCourseViewModel studentById(int studentId)
        {
            return enrollCourseGateway.studentById(studentId);
        }

    }
}