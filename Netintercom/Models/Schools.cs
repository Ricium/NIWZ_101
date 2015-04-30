using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Netintercom.Models
{
    public class Schoolsc
    {
        
        public int SchoolId { get; set; }
         [DisplayName("School Name")]
        public string SchoolName { get; set; }
         [DisplayName("School abbreviation")]
        public string Schoolabbreviation { get; set; }
         [DisplayName("Picture")]
         public int PictureId { get; set; }
        public int ClientId { get; set; }
        public string PicUrl { get; set; }

    }
}