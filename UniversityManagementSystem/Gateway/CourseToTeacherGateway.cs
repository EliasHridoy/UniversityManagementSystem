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
    }
}