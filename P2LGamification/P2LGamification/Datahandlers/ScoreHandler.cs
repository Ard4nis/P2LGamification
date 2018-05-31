using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace P2LGamification.Datahandlers
{
    public class ScoreHandler
    {
        DBHandler handler = new DBHandler();

        public int AddScore(int percentage, int maxScore, int courseID, int userID)
        {
            double percent = (double)percentage / 100.00;
            double point = maxScore * percent;
            

            handler.AddParm("@Point", System.Data.SqlDbType.Int, point);
            handler.AddParm("@UserID", System.Data.SqlDbType.Int, userID);
            handler.AddParm("@CourseID", System.Data.SqlDbType.Int, courseID);

            handler.ExecuteNonStp("AddScore");

            return (int)point;
        }
    }
}