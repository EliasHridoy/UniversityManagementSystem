using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Models;
using UniversityManagementSystemApp.Gateway;
using UniversityManagementSystemApp.Models;

namespace UniversityManagementSystemApp.Mannager
{
    public class RegisterStudentManager
    {
        private RegisterStudentGateway registerStudentGateway;

        public RegisterStudentManager()
        {
            registerStudentGateway = new RegisterStudentGateway();
        }

        public string Save(RegisterStudent registerStudent)
        {
            if (registerStudentGateway.IsEmailExists(registerStudent.Email))
            {
                return "Email already exists";
            }
            else
            {
                int rowAffect = registerStudentGateway.Save(registerStudent);
                if (rowAffect > 0)
                {
                    return "Save Successful";
                }
                else
                {
                    return "Register Failed";
                }
            }
        }

        public List<DepartmentModel> GetDepartmentList()
        {
            return registerStudentGateway.GetDepartmentList();
        }
    }
}