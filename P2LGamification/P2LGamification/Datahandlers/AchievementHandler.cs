using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace P2LGamification.Datahandlers
{
    public class AchievementHandler
    {
        DBHandler handler = new DBHandler();
        public void GrantAchievement(int userID, int achievementID)
        {
            handler.AddParm("@UserID", System.Data.SqlDbType.Int, userID);
            handler.AddParm("@AchievementID", System.Data.SqlDbType.Int, achievementID);

            handler.ExecuteNonStp("GrantAchievement");
        }
    }
}