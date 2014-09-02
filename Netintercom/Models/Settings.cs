using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Netintercom.Models
{
    public class Settings
    {
        public int SettingId { get; set; }
        public string Setting { get; set; }
        public string Value { get; set; }
        public int ClientId { get; set; }
        public string ClientName { get; set; }
    }
}