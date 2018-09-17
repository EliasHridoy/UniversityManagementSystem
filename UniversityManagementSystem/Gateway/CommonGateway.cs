using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace UniversityManagementSystem.Gateway
{
    public class CommonGateway
    {
        public SqlConnection Connection { get; set; }
        public SqlCommand Command { get; set; }
        public SqlDataReader Reader { get; set; }
        public string query;

        public CommonGateway()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["UniversityDB"].ConnectionString;
            Connection = new SqlConnection(connectionString);
        }
    }
}