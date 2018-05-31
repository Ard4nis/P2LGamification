using P2LGamification.Dataclasses;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace P2LGamification.Datahandlers
{
    public class CourseHandler
    {
        DBHandler handler = new DBHandler();

        public CourseHandler()
        {

        }
        
        public Course GetCourse(int id)
        {
            DataTable dt = new DataTable();

            handler.AddParm("@ID", SqlDbType.Int, id);
            handler.ExecuteStp("GetCourse", ref dt);

            Course course = new Course(dt.Rows[0]);
            return course;
        }

    }
}