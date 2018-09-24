using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Gateway;
using UniversityManagementSystem.Models;
using UniversityManagementSystem.Models.ViewModel;

namespace UniversityManagementSystem.Manger
{
    public class AllocateClassroomManager
    {

        private AllocateClassroomGateway allocateClassroomGateway;

        public AllocateClassroomManager()   // constructor
        {
            allocateClassroomGateway = new AllocateClassroomGateway();
            
        }
        //----------------------------------------------------------------//

        public bool IsRoomFree(int dayId,int roomId, string fromTime, string toTime)
        {
            return allocateClassroomGateway.IsRoomFree(dayId, roomId, fromTime, toTime);
        }





        //----------------------------------------------------------------//

        public string Allocate(AllocateClassroomModel allocateClassroom)
        {
            int rowEffect = allocateClassroomGateway.Allocate(allocateClassroom);

            if (rowEffect > 0)
            {
                return "Save Successful";
            }
            else
            {
                return "Save Faild";
            }
        }

        //------------------------------------------------//
        
        public List<RoomViewModel> ViewRoom()
        {
            return allocateClassroomGateway.ViewRoom();
        }
        //------------------------------------------------//
        public List<DayViewModel> DayView()
        {
            return allocateClassroomGateway.DayView();
        }
        //------------------------------------------------//
        public List<CourseViewModel> ViewCourse(int departmentId)
        {
            return allocateClassroomGateway.ViewCourse(departmentId);
        }

    }
}