using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace UniversityManagementSystem.Gateway
{
    public class UnassignAllCoursesGateway: CommonGateway
    {
        public int UnassignCourses()
        {
            query = "UPDATE EnrollCourseTable SET Assigned=0; ";

            Command = new SqlCommand(query,Connection);

            Connection.Open();
            int rowEffect = Command.ExecuteNonQuery();
            
            Connection.Close();


            if (rowEffect > 0)
            {

                query = "UPDATE CourseToTeacher SET Assigned=0; ";

                Command = new SqlCommand(query, Connection);

                Connection.Open();
                rowEffect = Command.ExecuteNonQuery();

                Connection.Close();
            }

            return rowEffect;
        }




    }
}