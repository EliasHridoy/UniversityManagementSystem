using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Models;

namespace UniversityManagementSystem.Gateway
{
    public class SaveCourseGateway : CommonGateway
    {


        public int Save(SaveCourseModel course)
        {
            query = "INSERT INTO SaveCoursesTable VALUES(@Code,@Name,@Credit,@Description,@DepartmentID,@SemesterID)";
            Command = new SqlCommand(query,Connection);
            Command.Parameters.AddWithValue("@Code", course.Code);
            Command.Parameters.AddWithValue("@Name", course.Name);
            Command.Parameters.AddWithValue("@Credit", course.Credit);
            Command.Parameters.AddWithValue("@Description", course.Description);
            Command.Parameters.AddWithValue("@DepartmentID", course.DepartmentID);
            Command.Parameters.AddWithValue("@SemesterID", course.SemesterID);


            Connection.Open();
            int rowEffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowEffect;
        }


        public bool IsCodeExists(string Code)
        {
            query = "SELECT * FROM SaveCoursesTable WHERE Code=@Code";

            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@Code", Code);

            Connection.Open();
            Reader = Command.ExecuteReader();
            bool hasRows = Reader.HasRows;
            Connection.Close();
            return hasRows;

        }



        public List<DepartmentModel> DepartmentDropDownlist()
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
                department.Name = Reader["Name"].ToString();

                departments.Add(department);
            }

            Connection.Close();
            return departments;
        }
        
        
        
        public List<Semester> SemesterDropDownlist()
        {
            query = "SELECT * FROM SemesterTable";

            Command = new SqlCommand(query, Connection);

            List<Semester> semesters = new List<Semester>();

            Connection.Open();

            Reader = Command.ExecuteReader();

            while (Reader.Read())
            {
                Semester semester = new Semester();
                semester.Id = Convert.ToInt32(Reader["Id"]);
                semester.Name = Reader["Semester"].ToString();

                semesters.Add(semester);
            }

            Connection.Close();
            return semesters;
        }





    }
}