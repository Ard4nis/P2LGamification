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

        public Course()
        {
        }

        public Course(DataRow dr)
        {
            Id = (int)dr["ID"];
            Name = (string)dr["Name"];

            Customer = new Customer()
            {
                Id = (int)dr["CustomerID"],
                Name = (string)dr["CustomerName"]
            };
        }
    }
}