using System.Data;

namespace P2LGamification.Dataclasses
{
    public class AchievementRequirement
    {
        public int Id { get; set; }
        public int Logins { get; set; }
        public int Courses { get; set; }
        public int Points { get; set; }

        public AchievementRequirement()
        {
        }

        public AchievementRequirement(DataRow dr)
        {
            Id = (int)dr["ID"];
            Logins = (int)dr["Logins"];
            Courses = (int)dr["Courses"];
            Points = (int)dr["Point"];
        }
    }
}