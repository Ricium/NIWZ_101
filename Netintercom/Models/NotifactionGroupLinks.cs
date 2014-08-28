using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Netintercom.Models
{
    public class NotifactionGroupLinks
    {
        public int LinkId { get; set; }
        public int ClientId { get; set; }
        public int DeviceUserId { get; set; }
        public int NotifcationGroupId { get; set; }
    }
}