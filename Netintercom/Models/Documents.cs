using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Netintercom.Models
{
    public class Documents
    {
        public int DocId { get; set; }
        public string DocumentName { get; set; }
        public string PathUrl { get; set; }
        public int ClientId { get; set; }
    }
}