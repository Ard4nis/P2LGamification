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
    public partial class ConfigureCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {

            if (ChbxListScoreSettings.SelectedItems.Count > 0 && PointBox.Value > 0)
            {
                CourseHandler ch = new CourseHandler();
                int percentageCompletion = Convert.ToInt32(CompletionDDL.SelectedValue);
                int time = 0;
                int completion = 0;

                foreach (ButtonListItem item in ChbxListScoreSettings.SelectedItems)
                {
                    if (item.Value.Equals("0"))
                    {
                        time = 1;
                    }

                    if (item.Value.Equals("1"))
                    {
                        completion = 1;
                    }
                }



                ch.AddCourse(NameBox.Text, Convert.ToInt32(CustomersDDL.SelectedValue), percentageCompletion, time, completion, PointBox.Value);

                CurrentCourses.DataBind();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Du skal udfylde alle scoreboard indstillinger, minimum 1 af parameterne skal vælges til.');", true);
            }
        }

        protected void CustomersDDL_SelectedIndexChanged(object sender, DropDownListEventArgs e)
        {
            CurrentCourses.DataBind();
        }
    }
}