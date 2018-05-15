using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace P2LGamification.Dataclasses
{
    public class Achievement
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string PopupText { get; set; }
        public string ImageURL { get; set; }
        public int KundeID { get; set; }
        public int AchievementRequirementID { get; set; }

        public Achievement()
        {
        }

        public Achievement(DataRow dr)
        {
            Id = (int)dr["ID"];
            KundeID = (int)dr["KundeID"];
            AchievementRequirementID = (int)dr["AchievementReqID"];
            Name = (string)dr["Name"];
            Description = (string)dr["Description"];
            PopupText = (string)dr["PopupText"];
            ImageURL = (string)dr["ImageURL"];
        }
    }
}