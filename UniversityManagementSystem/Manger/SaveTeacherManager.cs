using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Gateway;
using UniversityManagementSystem.Models;
using UniversityManagementSystem.Models.ViewModel;

namespace UniversityManagementSystem.Manger
{
    public class SaveTeacherManager
    {
        private SaveTeacherGateway saveTeacherGateway;

        public SaveTeacherManager()
        {
            saveTeacherGateway = new SaveTeacherGateway();
        }



        public string Save(SaveTeacher teacher)
        {
            int rowEffect = saveTeacherGateway.Save(teacher);

            if (rowEffect > 0)
            {
                return "Save Success";
            }
            else
            {
                return "Save Faild";
            }
        }

         public List<Department> DepartmentDropDownlist()
         {
             return saveTeacherGateway.DepartmentDropDownlist();
         }

         public List<DesignationModel> DesignationDropDownList()
         {

             return saveTeacherGateway.DesignationDropDownList();
         }
    }
}