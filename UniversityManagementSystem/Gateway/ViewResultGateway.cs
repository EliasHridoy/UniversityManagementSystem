using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Models;
using UniversityManagementSystem.Models.ViewModel;

namespace UniversityManagementSystem.Gateway
{
    public class ViewResultGateway : CommonGateway
    {
        //-------------------------------------------------------------

        public List<ViewResultCourseViewModel> CoursesResult(int studentId)
        {
            query = "SELECT * FROM ViewResultView WHERE studentId="+studentId;
            Command = new SqlCommand(query, Connection);

            List<ViewResultCourseViewModel> resultList = new List<ViewResultCourseViewModel>();

            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                ViewResultCourseViewModel result = new ViewResultCourseViewModel();

                result.CourseCode = Reader["Code"].ToString();
                result.Name = Reader["Name"].ToString();
                result.Grade = Reader["GradeLetter"].ToString();
                if (result.Grade == "")
                {
                    result.Grade = "Not Graded Yet";
                }

                resultList.Add(result);
            }
            Connection.Close();

            return resultList;

        }
    }
}