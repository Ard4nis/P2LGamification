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

        public void AddCourse(string name, int customerID, int completionPercentage, int time, int completion, double? maxScore)
        {
            handler.AddParm("@Name", SqlDbType.VarChar, name);
            handler.AddParm("@CustomerID", SqlDbType.Int, customerID);
            handler.AddParm("@CompletionPercentage", SqlDbType.Int, completionPercentage);
            handler.AddParm("@Time", SqlDbType.Bit, time);
            handler.AddParm("@Completion", SqlDbType.Bit, completion);
            handler.AddParm("@MaxScore", SqlDbType.Int, maxScore);

            handler.ExecuteNonStp("AddCourse");
        }

    }
}