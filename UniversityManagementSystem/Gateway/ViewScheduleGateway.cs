using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Models.ViewModel;

namespace UniversityManagementSystem.Gateway
{
    public class ViewScheduleGateway : CommonGateway
    {

        public List<ViewScheduleViewModel> ViewSchedule(int departmentId)
        {
            query = "SELECT * FROM SaveCoursesTable WHERE departmentId=" + departmentId;
            Command = new SqlCommand(query, Connection);

            List<ViewScheduleViewModel> ScheduleList = new List<ViewScheduleViewModel>();

            Connection.Open();
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                ViewScheduleViewModel schedule = new ViewScheduleViewModel();

                schedule.CourseId = Convert.ToInt32(Reader["Id"]);
                schedule.CourseCode = Reader["Code"].ToString();
                schedule.Name = Reader["Name"].ToString();

                ScheduleList.Add(schedule);
            }
            Connection.Close();

            // room and day time 


            foreach (ViewScheduleViewModel schedule in ScheduleList)
            {

                query = "SELECT * FROM ViewClassSchedule WHERE CourseId=" + schedule.CourseId;

                Command = new SqlCommand(query, Connection);

                Connection.Open();
                Reader = Command.ExecuteReader();
                schedule.ScheduleInFo = "";
                while (Reader.Read())
                {
                    schedule.ScheduleInFo += "R.No : ";
                    schedule.ScheduleInFo += Reader["RoomNo"];
                    schedule.ScheduleInFo += ", ";
                    schedule.ScheduleInFo += Reader["Day"];
                    schedule.ScheduleInFo += ", ";
                    schedule.ScheduleInFo += Reader["FromTime"];
                    schedule.ScheduleInFo += " - ";
                    schedule.ScheduleInFo += Reader["ToTime"];
                    schedule.ScheduleInFo += ";  ";
                    
                }

                if (schedule.ScheduleInFo == "")
                {
                    schedule.ScheduleInFo = "Not Scheduled Yet";
                }

                Reader.Close();
                Connection.Close();
            }


            return ScheduleList;
        }
    }
}