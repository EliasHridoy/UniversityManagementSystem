using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Models;
using UniversityManagementSystem.Models.ViewModel;

namespace UniversityManagementSystem.Gateway
{
    public class SaveTeacherGateway : CommonGateway
    {



        public int Save(SaveTeacher teacher)
        {
            query = "INSERT INTO TeacherTable VALUES(@Name,@Address,@Email,@ContactNo,@DesignationId,@DepartmentID,@Credit)";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@Address", teacher.Address);
            Command.Parameters.AddWithValue("@Name", teacher.Name);
            Command.Parameters.AddWithValue("@Credit", teacher.Credit);
            Command.Parameters.AddWithValue("@ContactNo", teacher.ContactNo);
            Command.Parameters.AddWithValue("@DepartmentID", teacher.DepartmentId);
            Command.Parameters.AddWithValue("@DesignationId", teacher.DesignationId);
            Command.Parameters.AddWithValue("@Email", teacher.Email);


            Connection.Open();
            int rowEffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowEffect;
        }


        public List<Department> DepartmentDropDownlist()
        {
            query = "SELECT * FROM DepartmentTable";

            Command = new SqlCommand(query, Connection);

            List<Department> departments = new List<Department>();

            Connection.Open();

            Reader = Command.ExecuteReader();

            while (Reader.Read())
            {
                Department department = new Department();
                department.Id = Convert.ToInt32(Reader["Id"]);
                department.Code = Reader["Code"].ToString();
                department.Name = Reader["Name"].ToString();

                departments.Add(department);
            }
            Reader.Close();
            Connection.Close();
            return departments;
        }
        public List<DesignationModel> DesignationDropDownList()
        {
            query = "SELECT * FROM DesignationTable";

            Command = new SqlCommand(query, Connection);

            List<DesignationModel> designations = new List<DesignationModel>();

            Connection.Open();

            Reader = Command.ExecuteReader();

            while (Reader.Read())
            {
                DesignationModel designation = new DesignationModel();
                designation.Id = Convert.ToInt32(Reader["Id"]);
                designation.Name = Reader["Designation"].ToString();

                designations.Add(designation);
            }
            Reader.Close();
            Connection.Close();
            return designations;
        }





    }
}