using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Netintercom.Models
{
    /* All Request Models return Data form the Database to the App */

    public class NewsRequest
    {
        public int NewsId { get; set; }
        public string Title { get; set; }
        public string Body { get; set; }
        public DateTime Date { get; set; }
        public string PicUrl { get; set; }
    }

    public class EventRequest
    {
        public int EventId { get; set; }
        public string Title { get; set; }
        public string Body { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public bool AllDay { get; set; }
        public string PicUrl { get; set; }
    }

    public class ContactRequest
    {
        public int ContactId { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Number { get; set; }
        public string Desc { get; set; }
        public string Email { get; set; }
    }

    public class AdRequest
    {
        public int AdId { get; set; }
        public string Title { get; set; }
        public string Body { get; set; }
        public string Url { get; set; }
        public string Number { get; set; }
        public string Email { get; set; }
        public string PicUrl { get; set; }
    }

    public class RegistrationModel
    {
        public int RegistrationId { get; set; }
        public int ClientId { get; set; }
        public string DeviceId { get; set; }
    }

    public class DeviceModel
    {
        public string DeviceReg { get; set; }
        public int ClientId { get; set; }
    }
}