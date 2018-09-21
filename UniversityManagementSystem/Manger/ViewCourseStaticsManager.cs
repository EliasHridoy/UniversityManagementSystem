using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Gateway;
using UniversityManagementSystem.Models.ViewModel;

namespace UniversityManagementSystem.Manger
{
    public class ViewCourseStaticsManager
    {
        private ViewCourseStaticsGateway viewCourseStaticsGateway;

        public ViewCourseStaticsManager()
        {
            viewCourseStaticsGateway = new ViewCourseStaticsGateway();
        }

        public List<ViewCourseViewModel> ViewCourse(int departmentId)
        {
            return viewCourseStaticsGateway.ViewCourse(departmentId);
        }
    }
}