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
        public int KundeID { get; set; }

        public Course()
        {
        }

        public Course(DataRow dr)
        {
            Id = (int)dr["ID"];
            Name = (string)dr["Name"];
            KundeID = (int)dr["KundeID"];
        }
    }
}