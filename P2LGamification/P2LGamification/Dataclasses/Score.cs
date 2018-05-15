using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace P2LGamification.Dataclasses
{
    public class Score
    {
        public int Id { get; set; }
        public int UserID { get; set; }
        public int CourseID { get; set; }
        public int Points { get; set; }

        public Score()
        {
        }

        public Score(DataRow dr)
        {
            Id = (int)dr["ID"];
            UserID = (int)dr["BrugerID"];
            CourseID = (int)dr["KursusID"];
            Points = (int)dr["Point"];
        }
    }
}