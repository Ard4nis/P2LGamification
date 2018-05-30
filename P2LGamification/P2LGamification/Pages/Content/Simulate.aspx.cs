using P2LGamification.Dataclasses;
using P2LGamification.Datahandlers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace P2LGamification.Pages.Content
{
    public partial class Simulate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SimulateBtn_Click(object sender, EventArgs e)
        {
            CourseHandler ch = new CourseHandler();

            Course course = ch.GetCourse(CoursesDDL.SelectedValue);

            if (Convert.ToInt32(CompletionDDL.SelectedValue) >= course.CompletionPercentage)
            {
                ScoreHandler sh = new ScoreHandler();
                AchievementHandler ah = new AchievementHandler();

                sh.AddScore(Convert.ToInt32(CompletionDDL.SelectedValue), course.MaxScore, course.Id, Convert.ToInt32(UsersDDL.SelectedValue));
                ah.GrantAchievement(Convert.ToInt32(UsersDDL.SelectedValue), course.AchievementID);

                Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Du har gennemført " + course.Name +" og dermed optjent en ny achievement.');", true);
            } else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Du opfylder ikke kravene til at kunne gennemføre dette kursus.');", true);
            }
        }
    }
}