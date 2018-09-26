using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Models;

namespace UniversityManagementSystem.Gateway
{
    public class StudentResultGateway : CommonGateway
    {

        //-----------------------------------------------------------

        public int Save(StudentResultModel studentResult)
        {
            query = "INSERT INTO StudentResultTable VALUES(@StudentId,@CourseId,@GradeId)";

            Command = new SqlCommand(query,Connection);

            Command.Parameters.AddWithValue("@StudentId", studentResult.StudentId);
            Command.Parameters.AddWithValue("@CourseId", studentResult.CourseId);
            Command.Parameters.AddWithValue("@GradeId", studentResult.GradeLetterId);


            Connection.Open();
            int rowEffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowEffect;
        }




        //-----------------------------------------------------------


        public List<GradeLetterModel> GradeLetter()
        {
            query = "SELECT * FROM GradeLetterTable";
            Command = new SqlCommand(query,Connection);

            List<GradeLetterModel> gradeLetterList = new List<GradeLetterModel>();

            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                GradeLetterModel gradeLetter = new GradeLetterModel();
                gradeLetter.Id = Convert.ToInt32(Reader["Id"]);
                gradeLetter.GradeLetter = Reader["GradeLetter"].ToString();

                gradeLetterList.Add(gradeLetter);
            }
            Connection.Close();

            return gradeLetterList;

        }

        //-----------------------------------------------------------


        public List<EnrollCourseModel> Courses(int studentId)
        {

            query = "SELECT * FROM ResultCourseView where studentId=" + studentId;

            Command = new SqlCommand(query, Connection);

            List<EnrollCourseModel> CourseList = new List<EnrollCourseModel>();

            Connection.Open();
            Reader = Command.ExecuteReader();

            while (Reader.Read())
            {
                EnrollCourseModel course = new EnrollCourseModel();
                course.CourseId = Convert.ToInt32(Reader["Id"]);
                course.CoursesName = Reader["Name"].ToString();

                CourseList.Add(course);
            }
            Connection.Close();

            return CourseList;
        }


    }
}