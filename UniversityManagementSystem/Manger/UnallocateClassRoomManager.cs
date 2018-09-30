using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityManagementSystem.Gateway;

namespace UniversityManagementSystem.Manger
{
    public class UnallocateClassRoomManager
    {
        private UnallocateClassroomGateway unallocateClassroomGateway;

        public UnallocateClassRoomManager()
        {
            unallocateClassroomGateway = new UnallocateClassroomGateway();
        }

        public string UnallocateClassroom()
        {
            int rowEffect = unallocateClassroomGateway.UnallocateClassroom();
            if (rowEffect > 0)
            {
                return "Unallocate Successful";
            }
            else
            {
                return "Unallocate Faild";
            }

        }
    }
}