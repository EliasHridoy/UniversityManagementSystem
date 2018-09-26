using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Gateway;
using UniversityManagementSystem.Models;
using UniversityManagementSystem.Models.ViewModel;

namespace UniversityManagementSystem.Manger
{
    public class CourseToTeacherManager
    {
        

        private CourseToTeacherGateway courseToTeacherGateway;

        public CourseToTeacherManager()
        {
            courseToTeacherGateway = new CourseToTeacherGateway();
        }




        public string Assign(CourseToTeacherModel courseToTeacher)
        {
            int rowEffect = courseToTeacherGateway.Assign(courseToTeacher);
            if (rowEffect > 0)
            {
                return "Sace Success";
            }
            else
            {
                return "Sace Faild";
            }
        }



        public bool IsCoursAssigned(int courseId)
        {
            return courseToTeacherGateway.IsCoursAssigned(courseId);
        }


        public List<DepartmentModel> DepartmentDropdownlist()
        {
            return courseToTeacherGateway.DepartmentDropdownlist();
        }



        public List<TeacherViewModel> TeacherByDepartmentId(int departmentId)
        {
            return courseToTeacherGateway.TeacherByDepartmentId(departmentId);
        }

        public TeacherViewModel TeacherByTeacherId(int teacherId)
        {
            return courseToTeacherGateway.TeacherByTeacherId(teacherId);
        }


        public List<CourseViewModel> CourseByDepartmentId(int DepartmentId)
        {
            return courseToTeacherGateway.CourseByDepartmentId(DepartmentId);
        }



        public CourseViewModel CourseByCourseId(int courseId)
        {
            return courseToTeacherGateway.CourseByCourseId(courseId);
        }

    }
}