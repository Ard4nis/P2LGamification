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

            Course course = ch.GetCourse(Convert.ToInt32(CoursesDDL.SelectedValue));

            if (Convert.ToInt32(CompletionDDL.SelectedValue) >= course.CompletionPercentage)
            {
                ScoreHandler sh = new ScoreHandler();


                int score = sh.AddScore(Convert.ToInt32(CompletionDDL.SelectedValue), course.MaxScore, course.Id, Convert.ToInt32(UsersDDL.SelectedValue));
                if (course.AchievementID > 0)
                {
                    AchievementHandler ah = new AchievementHandler();
                    ah.GrantAchievement(Convert.ToInt32(UsersDDL.SelectedValue), course.AchievementID);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Du har gennemført " + course.Name + " og dermed optjent en ny achievement. Du scorede " + score + " point ud af " + course.MaxScore + ".');", true);
                } else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Du har gennemført " + course.Name + ". Du scorede " + score + " point ud af " + course.MaxScore + ".');", true);
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Du opfylder ikke kravene til at kunne gennemføre dette kursus.');", true);
            }
        }

        protected void CustomersDDL_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            UsersDDL.DataBind();
            CoursesDDL.DataBind();
        }
    }
}