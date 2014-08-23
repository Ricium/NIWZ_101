using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Netintercom.Models
{
    public class Advertisement
    {
        [DisplayName("Advertisement Id")]
        public int AdvertisementId { get; set; }

        [DisplayName("School Id")]
        public int ClientId { get; set; }

        [DisplayName("Title")]
        [Required]
        public string Title { get; set; }

        [DisplayName("Text Body")]
        [Required]
        public string Body { get; set; }

        [DisplayName("Picture Id")]
        public int PictureId { get; set; }
        public string PicUrl { get; set; }

        [DisplayName("Contact Number")]
        [Required]
        public string Number { get; set; }

        [DisplayName("E-Mail")]
        [Required]
        public string Email { get; set; }

        [DisplayName("Website URL")]
        [Required]
        public string WebSiteUrl { get; set; }
    }
}