using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Models;
using UniversityManagementSystem.Models.ViewModel;

namespace UniversityManagementSystem.Gateway
{
    public class EnrollCourseGateway : CommonGateway
    {



         //-----------------------------------------------------------


        public List<EnrollCourseModel> Courses(int studentId)
        {

            query = "SELECT * FROM EnrollCourseView where studentId=" + studentId;

            Command = new SqlCommand(query, Connection);

            List<EnrollCourseModel> CourseList = new List<EnrollCourseModel>();

            Connection.Open();
            Reader = Command.ExecuteReader();

            while (Reader.Read())
            {
                EnrollCourseModel  course = new EnrollCourseModel();
                course.CourseId = Convert.ToInt32(Reader["Id"]);
                course.CoursesName = Reader["Name"].ToString();

                CourseList.Add(course);
            }
            Connection.Close();

            return CourseList;
        }
        

        //-------------------------------------------------------------------------


        public int Enroll(EnrollCourseModel student)
        {
            query = "INSERT INTO EnrollCourseTable VALUES(@studentId,@courseId,@date,1)";

            Command = new SqlCommand(query,Connection);

            Command.Parameters.AddWithValue("@studentId", student.StudentId);
            Command.Parameters.AddWithValue("@courseId", student.CourseId);
            Command.Parameters.AddWithValue("@date", student.Date);


            Connection.Open();
            int rowEffect = Command.ExecuteNonQuery();
            Connection.Close();

            return rowEffect;
        }

        

        //-------------------------------------------------------------------------

        public bool IsCourseAvailable(int studentId, int courseId)
        {
            query = "SELECT * FROM EnrollCourseTable WHERE studentId='"+studentId+"' AND courseId= '"+courseId+"'  ";
            Command = new SqlCommand(query,Connection);

            Connection.Open();

            Reader = Command.ExecuteReader();
            bool check = Reader.HasRows;
            Reader.Close();
            Connection.Close();
            return check;
            ;
        }




        //-------------------------------------------------------------------------
        public List<StudentCourseViewModel> RegNoDropdown()
        {
            query = "SELECT * FROM RegisterStudentTable";
            Command = new SqlCommand(query,Connection);

            List<StudentCourseViewModel> StudentList = new List<StudentCourseViewModel>();
            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                StudentCourseViewModel student = new StudentCourseViewModel()
                {
                    Id = Convert.ToInt32(Reader["Id"]),
                    RegNo = Reader["RegNo"].ToString()
                    
                };

                StudentList.Add(student);
            }
            Connection.Close();
            return StudentList;
        }


        //-------------------------------------------------------------------------


        public StudentCourseViewModel studentById(int studentId)
        {
            query = "SELECT * FROM RegNoDropdownView WHERE ID="+studentId ;
            Command = new SqlCommand(query,Connection);

            
            Connection.Open();
            Reader = Command.ExecuteReader();
            Reader.Read();
                StudentCourseViewModel student = new StudentCourseViewModel()
                {
                    Id = Convert.ToInt32(Reader["Id"]),
                    Name = Reader["Name"].ToString(),
                    Email = Reader["Email"].ToString(),
                    DepartmentId = Convert.ToInt32(Reader["DepartmentId"]),
                    DepartmentName = Reader["DepartmentName"].ToString()
                };

                
            
            Connection.Close();
            return student;
        }


    }
}