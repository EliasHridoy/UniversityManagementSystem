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





        
     public List<DepartmentModel> ViewAllDepartment()
     {
         return departmentGateway.ViewAllDepartment();
     }



        public DepartmentManager()
        {
            departmentGateway = new DepartmentGateway();
        }

        public string Save(DepartmentModel department)
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


        public bool IsCodeExists(DepartmentModel department)
        {
            return departmentGateway.IsCodeExists(department);
        }

        public bool IsNameExists(DepartmentModel department)
        {
            return departmentGateway.IsNameExists(department);
        }

    }
}