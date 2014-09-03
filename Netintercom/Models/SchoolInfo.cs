using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Netintercom.Models
{
    public class Client
    {
        [DisplayName("Client Id")]
        public int ClientId { get; set; }

        [DisplayName("Client Name")]
        [Required(ErrorMessage = "Client Name is Required")]
        public string Name { get; set; }

        [DisplayName("Logo URL")]
        public string LogoUrl { get; set; }

        [DisplayName("CSS URL")]
        public string CssUrl { get; set; }
    }
}