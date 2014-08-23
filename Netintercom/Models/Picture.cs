using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Netintercom.Models
{
    public class Picture
    {
        [DisplayName("Picture Id")]
        public int PictureId { get; set; }

        [DisplayName("Picture URL")]
        public string PicUrl { get; set; }

        [DisplayName("School Id")]
        public int ClientId { get; set; }
    }
}