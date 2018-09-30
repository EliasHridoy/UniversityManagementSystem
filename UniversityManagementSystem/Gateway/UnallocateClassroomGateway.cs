using System.Data.SqlClient;

namespace UniversityManagementSystem.Gateway
{
    public class UnallocateClassroomGateway:CommonGateway
    {
        public int UnallocateClassroom()
        {
            query = "UPDATE AllocateClassroomTable SET Allocate=0; ";

            Command = new SqlCommand(query, Connection);

            Connection.Open();
            int rowEffect = Command.ExecuteNonQuery();

            Connection.Close();


           

            return rowEffect;
        }


    }
}