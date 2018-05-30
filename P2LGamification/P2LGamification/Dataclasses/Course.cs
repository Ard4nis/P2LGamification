using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace P2LGamification.Dataclasses
{
    public class Course
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Customer Customer { get; set; }
        public int CompletionPercentage { get; set; }
        public bool Time { get; set; }
        public bool Completion { get; set; }
        public int MaxScore { get; set; }
        public int AchievementID { get; set; }

        public Course()
        {
        }

        public Course(DataRow dr)
        {
            Id = (int)dr["ID"];
            Name = (string)dr["Name"];
            CompletionPercentage = (int)dr["CompletionPercentage"];
            Time = (bool)dr["Time"];
            Completion = (bool)dr["Completion"];
            MaxScore = (int)dr["MaxScore"];
            AchievementID = (int)dr["AchievementID"];
            Customer = new Customer()
            {
                Id = (int)dr["CustomerID"],
                Name = (string)dr["CustomerName"]
            };
        }
    }
}