using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Netintercom.Models
{
    public class RegisterClient
    {
            public int RegisterClientID {get;set;}
            public int ClientId {get;set;} 
            public string ClientNo{get;set;} 
            public string Email {get;set;}
            public string Passwords {get;set;}
            public bool Approved { get; set; } 
    }

    public class Visitors
    {
            public int VisitorsId { get; set; }
            public int ClientId { get; set; }
            public string ClientNo { get; set; }
            public string VisitorNo {get;set;}
            public DateTime ModifiedDate {get;set;}
            public bool SendReceived { get; set; } 
    }
}