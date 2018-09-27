using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Models;
using UniversityManagementSystem.Models.ViewModel;

namespace UniversityManagementSystem.Gateway
{
    public class CourseToTeacherGateway : CommonGateway
    {






        public int Assign(CourseToTeacherModel courseToTeacher)
        {
            query = "update TeacherTable set RemainingCredit=RemainingCredit+'" + courseToTeacher.CourseCredit +
                    "' where id=" + courseToTeacher.TeacherId;


            Command = new SqlCommand(query,Connection);

            Connection.Open();
            int rowEffect = Command.ExecuteNonQuery();
            Connection.Close();



            query = "INSERT INTO CourseToTeacher VALUES('"+courseToTeacher.TeacherId+"', '"+courseToTeacher.CourseId+"',1)";
            Command = new SqlCommand(query,Connection);
            if (rowEffect > 0)
            {
                Connection.Open();
                rowEffect = Command.ExecuteNonQuery();
                Connection.Close();
            }

            return rowEffect;

        }





        public bool IsCoursAssigned(int courseId)
        {
            query ="SELECT * FROM CourseToTeacher WHERE CourseID="+courseId;
            Command = new SqlCommand(query,Connection);

            Connection.Open();

            Reader = Command.ExecuteReader();
            bool check = Reader.HasRows;
            Connection.Close();
            return check;
        }








        public List<DepartmentModel> DepartmentDropdownlist()
        {
            query = "SELECT * FROM DepartmentTable";

            Command = new SqlCommand(query, Connection);

            List<DepartmentModel> departments = new List<DepartmentModel>();

            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                DepartmentModel department = new DepartmentModel();
                department.Id = Convert.ToInt32(Reader["Id"]);
                department.Code = Reader["Code"].ToString();


                departments.Add(department);
            }
            Reader.Close();
            Connection.Close();
            return departments;
        }



        public List<TeacherViewModel> TeacherByDepartmentId(int departmentId)
        {
            query = "SELECT * FROM TeacherTable where departmentId=" + departmentId;

            Command = new SqlCommand(query, Connection);

            List<TeacherViewModel> teachers = new List<TeacherViewModel>();

            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                TeacherViewModel teacher = new TeacherViewModel();
                teacher.Id = Convert.ToInt32(Reader["Id"]);
                teacher.Name = Reader["Name"].ToString();
                teachers.Add(teacher);
            }
            Reader.Close();
            Connection.Close();
            return teachers;
        }

        public TeacherViewModel TeacherByTeacherId(int TeacherId)
        {
            query = "SELECT * FROM TeacherTable where Id=" + TeacherId;

            Command = new SqlCommand(query, Connection);

            Connection.Open();
            Reader = Command.ExecuteReader();
            Reader.Read();
            
                TeacherViewModel teacher = new TeacherViewModel();
                teacher.Id = Convert.ToInt32(Reader["Id"]);
                teacher.Name = Reader["Name"].ToString();
                teacher.Credit = Convert.ToInt32(Reader["CreditToTaken"]);
                teacher.RemainingCredit = Convert.ToInt32(Reader["RemainingCredit"]);
                
            
            Reader.Close();
            Connection.Close();
            return teacher;
        }

        public List<CourseViewModel> CourseByDepartmentId(int DepartmentId)
        {
            query = "SELECT * FROM SaveCoursesTable where departmentId=" +DepartmentId ;

            Command = new SqlCommand(query, Connection);

            List<CourseViewModel> courses = new List<CourseViewModel>();

            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                CourseViewModel course = new CourseViewModel();
                course.Id = Convert.ToInt32(Reader["Id"]);
                course.Code = Reader["Code"].ToString();
                courses.Add(course);
            }
            Reader.Close();
            Connection.Close();
            return courses;
        }

        public CourseViewModel CourseByCourseId(int courseId)
        {
            query = "SELECT * FROM SaveCoursesTable where Id=" + courseId;

            Command = new SqlCommand(query, Connection);

            Connection.Open();
            Reader = Command.ExecuteReader();
            Reader.Read();

            CourseViewModel course = new CourseViewModel();
           
            course.Name = Reader["Name"].ToString();
            course.Credit = Convert.ToInt32(Reader["Credit"]);
              
                
            
            Reader.Close();
            Connection.Close();
            return course;
        }
    }
}