using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Gateway;
using UniversityManagementSystem.Models.ViewModel;

namespace UniversityManagementSystem.Manger
{
    public class ViewScheduleManager
    {

        private ViewScheduleGateway viewScheduleGateway;

        public ViewScheduleManager()
        {
            viewScheduleGateway = new ViewScheduleGateway();
        }





        public List<ViewScheduleViewModel> ViewSchedule(int departmentId)
        {
            return viewScheduleGateway.ViewSchedule(departmentId);
        }
    }
}