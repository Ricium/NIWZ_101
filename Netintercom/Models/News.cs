using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Netintercom.Models
{
    public class News
    {
        [DisplayName("News Id")]
        public int NewsId { get; set; }

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
       // public Picture Picture_Obj { get; set; }

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