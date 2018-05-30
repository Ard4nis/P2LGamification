using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace P2LGamification.Datahandlers
{
    public class ScoreHandler
    {
        public void AddScore(int percentage, int maxScore, int courseID, int userID)
        {
            int point = maxScore * (percentage / 100);
            DBHandler handler = new DBHandler();

            handler.AddParm("@Point", System.Data.SqlDbType.Int, point);
            handler.AddParm("@UserID", System.Data.SqlDbType.Int, userID);
            handler.AddParm("@CourseID", System.Data.SqlDbType.Int, courseID);

            handler.ExecuteNonSql("AddScore");
        }
    }
}