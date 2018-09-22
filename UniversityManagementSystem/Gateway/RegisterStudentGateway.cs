using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Gateway;
using UniversityManagementSystem.Models;
using UniversityManagementSystemApp.Models;

namespace UniversityManagementSystemApp.Gateway
{
    public class RegisterStudentGateway: CommonGateway
    {
        public int Save(RegisterStudent registerStudent)
        {


            string RegNo = GenerateRegNo(registerStudent.DepartmentId, registerStudent.Date);


            string query = "INSERT INTO RegisterStudentTable VALUES('"+RegNo+"',@name,@email,@contactno,@date,@address,@departmentid)";
            Command = new SqlCommand(query, Connection);
            Command.Parameters.AddWithValue("@name", registerStudent.Name);
            Command.Parameters.AddWithValue("@email", registerStudent.Email);
            Command.Parameters.AddWithValue("@contactno", registerStudent.ContactNo);
            Command.Parameters.AddWithValue("@date", registerStudent.Date);
            Command.Parameters.AddWithValue("@address", registerStudent.Address);
            Command.Parameters.AddWithValue("@departmentId", registerStudent.DepartmentId);
            Connection.Open();
            int rowAffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffect;
        }



        public string GenerateRegNo(int departmentId, string date)
        {
            string query = "SELECT Code  FROM DEPARTMENTTABLE WHERE ID = " + departmentId;

            Command = new SqlCommand(query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();

            Reader.Read();
            string name = Reader["Code"].ToString();
            Connection.Close();

            string year = date.Substring(6, 4);
            
            string RegNo = name + "-" + year + "-" ;


            query = "SELECT COUNT(REGNO) as Number  FROM RegisterStudentTable as R INNER JOIN DepartmentTable AS D ON R.DEPARTMENTID = D.ID  WHERE REGNO LIKE '" + RegNo+"%" + "' ";

            Command = new SqlCommand(query, Connection);
            Connection.Open();

            int number = 0;
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                Reader.Read();
                number = Convert.ToInt32(Reader["Number"]);
            }
            
            Reader.Close();

            Connection.Close();
            number += 1;
            RegNo += number.ToString();

            return RegNo;
        }

        public bool IsEmailExists(string Email)
        {
            string query = "SELECT * FROM RegisterStudentTable WHERE Email = '" + Email + "' ";
            Command = new SqlCommand(query,Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            bool isExists = Reader.HasRows;
            Connection.Close();
            return isExists;
        }

        public List<DepartmentModel> GetDepartmentList()
        {
            string query = "SELECT * FROM DepartmentTable";
            Command = new SqlCommand(query,Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<DepartmentModel> departmentList = new List<DepartmentModel>();
            while (Reader.Read())
            {
                DepartmentModel department = new DepartmentModel();

                department.Id = Convert.ToInt32(Reader["Id"]);
                department.Code = Reader["Code"].ToString();
                
                departmentList.Add(department);
            }
            Reader.Close();
            Connection.Close();
            return departmentList;

        }
        

        
    }
}