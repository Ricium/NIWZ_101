using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Netintercom.Models
{
    public class Event
    {
        [DisplayName("Event Id")]
        public int EventsId { get; set; }

        [DisplayName("School Id")]
        public int ClientId { get; set; }

        [DisplayName("Title")]
        [Required(ErrorMessage="Event Title is Required")]
        public string Title { get; set; }

        [DisplayName("Description")]
        [Required(ErrorMessage = "Event Description is Required")]
        public string Body { get; set; }

        [DisplayName("Start Date & Time")]
        [Required(ErrorMessage = "Start Date & Time is Required")]
        public DateTime StartDate { get; set; }

        [DisplayName("End Date & Time")]
        [Required(ErrorMessage = "End Date & Time is Required")]
        public DateTime EndDate { get; set; }

        [DisplayName("All Day")]
        //[Required]
        public bool AllDay { get; set; }

        [DisplayName("Picture Id")]
        public int PictureId { get; set; }
        public string PicUrl { get; set; }

        [DisplayName("Category")]
        public int CategoryId { get; set; }
        public Category Category_Obj { get; set; }

        [DisplayName("Subcategory")]
        public int SubCategoryId { get; set; }
        public SubCategory SubCategory_Obj { get; set; }
    }
}