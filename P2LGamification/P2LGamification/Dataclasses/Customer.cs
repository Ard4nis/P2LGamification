using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace P2LGamification.Dataclasses
{
    public class Customer
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public Customer()
        {
        }

        public Customer(DataRow dr)
        {
            Id = (int)dr["ID"];
            Name = (string)dr["Name"];
        }
    }
}