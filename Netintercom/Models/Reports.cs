using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace Netintercom.Models
{
   
        public class SportCategoryID
        {
            public int SportCategory { get; set; }
            public DateTime Date { get;set;}

        }

        public class FixturesReport
        {
            public string FixturesId { get; set; }
            public string TeamIdA { get; set; }
            public string TeamIdB { get; set; }
            public string StartTime { get; set; }
            public string Field { get; set; }
            public string SportCategory { get; set; }
            public DateTime ReportDate { get; set; }
        }

        public class ResultsReport
        {
            public string ResultId { get; set; }
            public string FixturesId { get; set; }
            public string fixtures { get; set; }
            public string TeamIdA { get; set; }
            public string PointsA { get; set; }
            public string PointsB { get; set; }
            public string TeamIdB { get; set; }
            public string StartTime { get; set; }
            public string TimeInMatch { get; set; }
            public string Field { get; set; }
            public string SportCategory { get; set; }
            public DateTime ReportDate { get; set; }
        }
}