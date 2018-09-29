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
            query = "UPDATE AllocateClassroomTable SET allocate=1; " ;

            Command = new SqlCommand(query,Connection);

            Connection.Open();
            int rowEffect = Command.ExecuteNonQuery();
            
            Connection.Close();

            return rowEffect;
        }
    }
}