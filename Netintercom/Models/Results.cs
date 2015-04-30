using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Netintercom.Models
{
    public class Results
    {
        public int ResultsId { get; set; }
        [DisplayName("Home Team Points")]
        public string PointsA { get; set; }
        [DisplayName("Home Team")]
        public string TeamA { get; set; }
        [DisplayName("Away Team Points")]
        public string PointsB { get; set; }
        [DisplayName("Away Team")]
        public string TeamB { get; set; }
        [DisplayName("Time In Match")]
        public string TimeInMatch { get; set; }
        [DisplayName("Commetary")]
        public string Comentry { get; set; }
        [DisplayName("Fixtures")]
        public string fixtures { get; set; }
        [DisplayName("Field")]
        public string field { get; set; }
        [DisplayName("Fixtures")]
        public int FixturesID { get; set; } 
        public int ClientId { get; set; }
        [DisplayName("Sport Category")]
        public int SportCategory { get; set; }
 
    }
}