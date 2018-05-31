using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace P2LGamification.Pages.Content
{
    public partial class Scoreboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CustomersDDL_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            CoursesDDL.DataBind();
            Scores.DataBind();
        }

        protected void CoursesDDL_SelectedIndexChanged(object sender, Telerik.Web.UI.DropDownListEventArgs e)
        {
            Scores.DataBind();
        }
    }
}