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
        public User User { get; set; }
        public Course Course { get; set; }
        public int Points { get; set; }

        public Score()
        {
        }

        public Score(DataRow dr)
        {
            Id = (int)dr["ID"];
            User = new User()

            {
                Id = (int)dr["UserID"],
                Name = (string)dr["UserName"],

                Customer = new Customer()
                {
                    Id = (int)dr["CustomerID"],
                    Name = (string)dr["CustomerName"]
                }
            };

            Course = new Course()
            {
                Id = (int)dr["KursusID"],
                Name = (string)dr["CourseName"],

                Customer = new Customer()
                {
                    Id = (int)dr["CustomerID"],
                    Name = (string)dr["CustomerName"]
                }
            };

            Points = (int)dr["Point"];
        }
    }
}