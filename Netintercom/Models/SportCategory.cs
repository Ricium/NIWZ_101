using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
namespace Netintercom.Models
{
    public class SportCategory
    {
        [DisplayName("Sport Category ID")]
        public int SportCategoryID { get; set; }
        [DisplayName("Sport Name")]
        public string CategoryName { get; set; }
        public int ClientID { get; set; }
    }
}