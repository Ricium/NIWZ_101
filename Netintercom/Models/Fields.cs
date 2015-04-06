using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Netintercom.Models
{
    public class Fields
    {
        [DisplayName("Field ID")]
        public int FieldsId { get; set; }
        [DisplayName("Client ID")]
        public int ClientId { get; set; }
        [DisplayName("FieldName")]
        public string FieldName { get; set; }
        [DisplayName("Sport Category")]
        public string sportcategory { get; set; }
        public int SportCategoryID { get; set; }
    }
}