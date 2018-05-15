using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace P2LGamification.Dataclasses
{
    public class User
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int KundeID { get; set; }

        public User()
        {
        }

        public User(DataRow dr)
        {
            Id = (int)dr["ID"];
            Name = (string)dr["Name"];
            KundeID = (int)dr["KundeID"];
        }
    }
}