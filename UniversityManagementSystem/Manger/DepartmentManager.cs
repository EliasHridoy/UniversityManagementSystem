using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Owin.Security.Provider;
using UniversityManagementSystem.Gateway;
using UniversityManagementSystem.Models;

namespace UniversityManagementSystem.Manger
{

    public class DepartmentManager
    {
        private DepartmentGateway departmentGateway;





        
     public List<Department> ViewAllDepartment()
     {
         return departmentGateway.ViewAllDepartment();
     }



        public DepartmentManager()
        {
            departmentGateway = new DepartmentGateway();
        }

        public string Save(Department department)
        {
            int rowEffect = departmentGateway.Save(department);
            if (rowEffect > 0)
            {
                return "Save Successful";

            }
            else
            {
                return "Save Faild";
            }
        }


        public bool IsCodeExists(Department department)
        {
            return departmentGateway.IsCodeExists(department);
        }

        public bool IsNameExists(Department department)
        {
            return departmentGateway.IsNameExists(department);
        }

    }
}