using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Models.ViewModel;

namespace UniversityManagementSystem.Gateway
{
    public class ViewCourseStaticsGateway : CommonGateway
    {



        public List<ViewCourseViewModel> ViewCourse(int departmentId)
        {
            query = "select * from ViewCourseStatics where departmentId=" + departmentId;
            Command = new SqlCommand(query,Connection);

            List<ViewCourseViewModel> courseList = new List<ViewCourseViewModel>();

            Connection.Open();

            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                ViewCourseViewModel course = new ViewCourseViewModel()
                {
                    Code = Reader["Code"].ToString(),
                    Name = Reader["Name"].ToString(),
                    Semester = Reader["Semester"].ToString(),
                    AssignedTo = Reader["AssignedTo"].ToString()
                    
                };
                if (course.AssignedTo == "") { course.AssignedTo = "Not Assigned Yet"; }

                courseList.Add(course);
            }

            Connection.Close();
        }
    }
}