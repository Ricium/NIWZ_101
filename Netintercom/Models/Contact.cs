using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Netintercom.Models
{
    public class Contact
    {
        [DisplayName("Contact Id")]
        public int ContactId { get; set; }

        [DisplayName("School Id")]
        public int ClientId { get; set; }

        [DisplayName("Name")]
        [Required]
        public string Name { get; set; }

        [DisplayName("Surname")]
        [Required]
        public string Surname { get; set; }

        [DisplayName("Contact Number")]
        [Required]
        public string Number { get; set; }

        [DisplayName("Description")]
        [Required]
        public string Body { get; set; }

        [DisplayName("E-Mail")]
        [Required]
        public string Email { get; set; }
    }
}