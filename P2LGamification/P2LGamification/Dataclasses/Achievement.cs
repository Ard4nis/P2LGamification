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
        public string CompletionText { get; set; }
        public string ImageURL { get; set; }
        public Customer Customer { get; set; }

        public Achievement()
        {
        }

        public Achievement(DataRow dr)
        {
            Id = (int)dr["ID"];

            Customer = new Customer()
            {
                Id = (int)dr["CustomerID"],
                Name = (string)dr["CustomerName"]
            };

            Name = (string)dr["Name"];
            Description = (string)dr["Description"];
            CompletionText = (string)dr["CompletionText"];
            ImageURL = (string)dr["ImageURL"];
        }
    }
}