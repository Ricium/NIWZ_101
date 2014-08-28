using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
namespace Netintercom.Models
{
    public class NotificationGroups
    {
        public int NotificationGroupId { get; set; }
        public int ClientId { get; set; }
        public string GroupName { get; set; }
    }
}