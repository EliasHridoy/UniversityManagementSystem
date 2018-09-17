using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using UniversityManagementSystem.Models;

namespace UniversityManagementSystem.Gateway
{
    public class DepartmentGateway : CommonGateway
    {




        public List<Department> ViewAllDepartment()
        {
            query = "SELECT * FROM DepartmentTable";

            Command = new SqlCommand(query, Connection);
           
            List<Department> departments = new List<Department>();

            Connection.Open();
           
            Reader = Command.ExecuteReader();

            while (Reader.Read())
            {
                Department department = new Department();
                department.Code = Reader["Code"].ToString();
                department.Name = Reader["Name"].ToString();

                departments.Add(department);
            }
            
            Connection.Close();
            return departments;

        }




        public int Save(Department department)
        {
            query = "INSERT INTO DepartmentTable VALUES(@Code,@Name)";
            Command = new SqlCommand(query,Connection);
            Command.Parameters.AddWithValue("@Code", department.Code);
            Command.Parameters.AddWithValue("@Name", department.Name);

            Connection.Open();
            int rowEffect = Command.ExecuteNonQuery();

            Connection.Close();
            return rowEffect;
        }

        public bool IsCodeExists(Department department)
        {
            query = "SELECT * FROM DepartmentTable WHERE Code=@Code";
            
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@Code", department.Code);

            Connection.Open();
            Reader = Command.ExecuteReader();
            bool hasRows = Reader.HasRows          ;
            Connection.Close();
            return hasRows;

        }
        public bool IsNameExists(Department department)
        {
            query = "SELECT * FROM DepartmentTable WHERE Name=@Name";
            
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@Name", department.Name);

            Connection.Open();
            Reader = Command.ExecuteReader();
            bool hasRows = Reader.HasRows          ;
            Connection.Close();
            return hasRows;

        }
    }
}