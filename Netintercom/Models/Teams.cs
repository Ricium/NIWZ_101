using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
namespace Netintercom.Models
{
    public class Teams
    {
        public int TeamsId { get; set; }
        [DisplayName("Team Name")]
        public string Name { get; set; }
        [DisplayName("Age Category")]
        public string Age { get; set; }
        [DisplayName("Team Rank In Age Category")]
        public string Ranks { get; set; }
        public int ClientId { get; set; }
    }
}