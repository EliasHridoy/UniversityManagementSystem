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



        public int Save(SaveTeacherModel teacher)
        {
            query = "INSERT INTO TeacherTable VALUES(@Name,@Address,@Email,@ContactNo,@DesignationId,@DepartmentID,@Credit,0)";
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
            Reader.Close();
            Connection.Close();
            return departments;
        }
        public List<DesignationViewModel> DesignationDropDownList()
        {
            query = "SELECT * FROM DesignationTable";

            Command = new SqlCommand(query, Connection);

            List<DesignationViewModel> designations = new List<DesignationViewModel>();

            Connection.Open();

            Reader = Command.ExecuteReader();

            while (Reader.Read())
            {
                DesignationViewModel designation = new DesignationViewModel();
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