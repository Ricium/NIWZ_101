using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Netintercom.Models
{
    public class Notifications
    {
        [DisplayName("Announcement Id")]
        public int NotificationsId { get; set; }

        [DisplayName("School Id")]
        public int ClientId { get; set; }

        [DisplayName("Title")]
        [Required(ErrorMessage="Title is Required")]
        public string Title { get; set; }

        [DisplayName("Message")]
        [Required(ErrorMessage = "Message is Required")]
        public string Body { get; set; }

        [DisplayName("Category")]
        public int CategoryId { get; set; }
        public Category Category_Obj { get; set; }

        [DisplayName("Subcategory")]
        public int SubCategoryId { get; set; }
        public SubCategory SubCategory_Obj { get; set; }

        [DisplayName("Post Date")]
        public DateTime PostDate { get; set; }
    }
}