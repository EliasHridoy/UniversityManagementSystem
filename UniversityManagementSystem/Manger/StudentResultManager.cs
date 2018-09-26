using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Gateway;
using UniversityManagementSystem.Models;

namespace UniversityManagementSystem.Manger
{
    public class StudentResultManager
    {
        private StudentResultGateway studentResultGateway;

        public StudentResultManager()
        {
            studentResultGateway = new StudentResultGateway();
        }


         //-----------------------------------------------------------

        public string Save(StudentResultModel studentResult)
        {
            int rowEffect = studentResultGateway.Save(studentResult);

            if (rowEffect > 0)
            {
                return "Save Successful";
            }
            else
            {
                return "Save Faild";
            }
        }


        public List<GradeLetterModel> GradeLetter()
        {
            return studentResultGateway.GradeLetter();
        }




        public List<EnrollCourseModel> Courses(int studentId)
        {
            return studentResultGateway.Courses(studentId);
        }
    }
}