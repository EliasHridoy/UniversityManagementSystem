using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Models;
using UniversityManagementSystem.Models.ViewModel;

namespace UniversityManagementSystem.Gateway
{
    public class AllocateClassroomGateway : CommonGateway
    {






        public bool IsRoomFree(int dayId, int roomId, string fromTime, string toTime)
        {
            query =
                "SELECT * FROM AllocateClassroomTable WHERE DayId='"+dayId+"' " +
                "AND RoomId= '"+roomId+"' " +
                "AND (FromTime BETWEEN '"+fromTime+"' AND '"+toTime+"') " +
                "OR (ToTime BETWEEN '" + fromTime + "' AND '"+toTime+"' )";


            Command = new SqlCommand(query,Connection);


            Connection.Open();
            Reader = Command.ExecuteReader();
            bool check = Reader.HasRows;
            Connection.Close();
            return check;
        }






        //---------------------------------------------------------------------------------//


        public int Allocate(AllocateClassroomModel allocateClassroom)
        {
            query =
                "INSERT INTO AllocateClassroomTable " +
                "VALUES(@departmentId,@courseId,@roomId,@dayId,@fromTime,@toTime,1)";

            Command = new SqlCommand(query,Connection);
            Command.Parameters.AddWithValue("@departmentId", allocateClassroom.DepartmentId);
            Command.Parameters.AddWithValue("@courseId", allocateClassroom.CourseId);
            Command.Parameters.AddWithValue("@roomId", allocateClassroom.RoomId);
            Command.Parameters.AddWithValue("@dayId", allocateClassroom.DayId);
            Command.Parameters.AddWithValue("@fromTime", allocateClassroom.FromTime);
            Command.Parameters.AddWithValue("@toTime", allocateClassroom.ToTime);


            Connection.Open();
            int rowEffect = Command.ExecuteNonQuery();
            Connection.Close();
            return rowEffect;
        }

        //---------------------------------------------------------------------------------//
        public List<DayViewModel> DayView()
        {
            query = "SELECT * FROM DayTable";
            Command = new SqlCommand(query, Connection);

            List<DayViewModel> dayList = new List<DayViewModel>();

            Connection.Open();

            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                DayViewModel days = new DayViewModel();

                days.Id = Convert.ToInt32(Reader["Id"]);
                days.Day = Reader["Day"].ToString();

                dayList.Add(days);
            }

            Reader.Close();
            Connection.Close();
            
            return dayList;
        }

        //----------------------------------------------------------------------------//

        public List<RoomViewModel> ViewRoom()
        {

            query = "SELECT * FROM ClassRoomTable";
            Command = new SqlCommand(query, Connection);

            List<RoomViewModel> roomList = new List<RoomViewModel>();

            Connection.Open();

            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                RoomViewModel classroomRoom = new RoomViewModel();

                classroomRoom.Id = Convert.ToInt32(Reader["Id"]);
                classroomRoom.RoomNo = Reader["RoomNo"].ToString();

                roomList.Add(classroomRoom);
            }
            Reader.Close();
            Connection.Close();


            return roomList;
        }

        //-------------------------------------------------------------------------------//

        public List<CourseViewModel> ViewCourse(int departmentId)
        {
            query = "select * from SaveCoursesTable where departmentId=" + departmentId;
            Command = new SqlCommand(query, Connection);

            List<CourseViewModel> courseList = new List<CourseViewModel>();

            Connection.Open();

            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                CourseViewModel course = new CourseViewModel()
                {
                    Id = Convert.ToInt32(Reader["ID"]),
                    Code = Reader["Code"].ToString(),
                    Name = Reader["Name"].ToString()
                };


                courseList.Add(course);
            }

            Connection.Close();

            return courseList;
        }


    }
}