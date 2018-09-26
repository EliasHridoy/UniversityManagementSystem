using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Gateway;
using UniversityManagementSystem.Models.ViewModel;

namespace UniversityManagementSystem.Manger
{
    public class ViewResultManager
    {
        private ViewResultGateway viewResultGateway;

        public ViewResultManager()
        {
            viewResultGateway = new ViewResultGateway();
        }


        public List<ViewResultCourseViewModel> CoursesResult(int studentId)
        {
            return viewResultGateway.CoursesResult(studentId);
        }
    }
}