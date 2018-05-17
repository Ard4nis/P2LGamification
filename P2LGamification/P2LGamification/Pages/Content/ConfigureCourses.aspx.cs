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
                DBHandler db = new DBHandler();
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

                db.AddParm("@Name", SqlDbType.VarChar, NameBox.Text);
                db.AddParm("@CustomerID", SqlDbType.Int, CustomersDDL.SelectedValue);
                db.AddParm("@CompletionPercentage", SqlDbType.Int, percentageCompletion);
                db.AddParm("@Time", SqlDbType.Bit, time);
                db.AddParm("@Completion", SqlDbType.Bit, completion);
                db.AddParm("@MaxScore", SqlDbType.Int, PointBox.Value);

                db.ExecuteNonStp("AddCourse");

                CurrentCourses.DataBind();
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Du skal udfylde alle scoreboard indstillinger, minimum 1 af parameterne skal vælges til.');", true);
            }
        }
    }
}