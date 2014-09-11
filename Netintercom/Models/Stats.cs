using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Netintercom.Models
{
    public class Stats
    {
        public string Username { get; set; }
        public int Users { get; set; }
        public int News { get; set; }
        public int Events { get; set; }
        public int Notifications { get; set; }
        public int Ads { get; set; }
        public List<string> Services { get; set; }
        public List<int> ServiceCounts { get; set; }
    }
}