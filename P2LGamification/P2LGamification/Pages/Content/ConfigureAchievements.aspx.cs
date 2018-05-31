using P2LGamification.Datahandlers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace P2LGamification.Pages.Content
{
    public partial class ConfigureAchievements : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void CustomersDDL_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            CourseDDL.DataBind();
            CurrentAchievements.DataBind();
        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(NameBox.Text) &&
                !String.IsNullOrEmpty(DescriptionTextBox.Text) &&
                !String.IsNullOrEmpty(CompletionTextBox.Text) &&
                !String.IsNullOrEmpty(FilePath.Value))
            {
                AchievementHandler ah = new AchievementHandler();
                string ImageUrl = FilePath.Value;


                ah.AddAchievement(NameBox.Text, Convert.ToInt32(CustomersDDL.SelectedValue), DescriptionTextBox.Text, CompletionTextBox.Text, ImageUrl, Convert.ToInt32(CourseDDL.SelectedValue));

                CurrentAchievements.DataBind();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Du skal udfylde alle felterne og vælge et billede til din achievement for at kunne oprette den.');", true);
            }
        }
    }
}