using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Netintercom.Models
{
    public class SubCategory
    {
        [DisplayName("Subcategory Id")]
        public int SubCategoryId { get; set; }

        [DisplayName("Category Id")]
        public int CategoryId { get; set; }

        [DisplayName("Title")]
        [Required(ErrorMessage="Title is Required")]
        public string Title { get; set; }

        [DisplayName("Description")]
        [Required(ErrorMessage = "Description is Required")]
        public string Body { get; set; }
    }
}