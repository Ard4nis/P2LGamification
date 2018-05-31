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
                DBHandler db = new DBHandler();
                string ImageUrl = FilePath.Value;

                db.AddParm("@Name", SqlDbType.VarChar, NameBox.Text);
                db.AddParm("@CustomerID", SqlDbType.Int, CustomersDDL.SelectedValue);
                db.AddParm("@Description", SqlDbType.VarChar, DescriptionTextBox.Text);
                db.AddParm("@CompletionText", SqlDbType.VarChar, CompletionTextBox.Text);
                db.AddParm("@ImageURL", SqlDbType.VarChar, ImageUrl);
                db.AddParm("@CourseID", SqlDbType.Int, CourseDDL.SelectedValue);

                db.ExecuteNonStp("AddAchievement");

                CurrentAchievements.DataBind();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Du skal udfylde alle felterne og vælge et billede til din achievement for at kunne oprette den.');", true);
            }
        }
    }
}