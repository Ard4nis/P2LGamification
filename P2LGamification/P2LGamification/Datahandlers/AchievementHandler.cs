using System;
using System.Collections.Generic;
using System.Data;
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

        public void AddAchievement(string name, int customerID, string description, string completionText, string imageURL, int courseID)
        {
            handler.AddParm("@Name", SqlDbType.VarChar, name);
            handler.AddParm("@CustomerID", SqlDbType.Int, customerID);
            handler.AddParm("@Description", SqlDbType.VarChar, description);
            handler.AddParm("@CompletionText", SqlDbType.VarChar, completionText);
            handler.AddParm("@ImageURL", SqlDbType.VarChar, imageURL);
            handler.AddParm("@CourseID", SqlDbType.Int, courseID);

            handler.ExecuteNonStp("AddAchievement");
        }
    }
}