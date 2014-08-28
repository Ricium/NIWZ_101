using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Netintercom.Models
{
    public class Services
    {
        public int ServiceId { get; set; }
        public int ClientId { get; set; }
        public string Service { get; set; }
        public string Query { get; set; }
        public int DeviceUserId { get; set; }
        public DateTime ModifiedDate { get; set; }

    }
}