﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Netintercom.Models;
using Telerik.Web.Mvc;
using System.IO;
using Telerik.Web.Mvc.Extensions;
using System.Collections;
using System.Text;
using System.Web.UI.WebControls;
using System.Security.Cryptography;

namespace Netintercom.Controllers
{
    
    public class HomeController : Controller
    {
        private AppRequestRepository AppRep = new AppRequestRepository();
        private CommunicationRepository comrep = new CommunicationRepository();
        private ContactRepository conRep = new ContactRepository();
        private StatsRepository statsRep = new StatsRepository();
        SchoolsRepository SchRep = new SchoolsRepository();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Home()
        {
            if (HttpContext.Session["UserID"] != null)
            {
                if (HttpContext.Session["ClientId"] != null)
                {
                    string sclientid = HttpContext.Session["ClientId"].ToString();
                    int clientid = 0;

                    if (!sclientid.Equals(""))
                        clientid = Convert.ToInt32(sclientid);
                    
                    Stats ins = statsRep.GetStats(clientid);
                    ins.Username = HttpContext.Session["UserName"].ToString();
                    return View(ins);
                }
                else
                {
                    return View();
                }
                
                
            }
            else
            {
                return RedirectToAction("LogOn", "Account");
            } 
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult ContactUs()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Mail(FormCollection form)
        {
            Functions f = new Functions();
            string message = "Someone did something wrong";

            if (form.AllKeys.Count() > 3)
            {
                message = "Name: " + form["name"].ToString() + "\nEmail: " + form["email"].ToString() + "\nWebsite: " + form["website"].ToString() + "\n\nMessage:\n" + form["message"].ToString();
            }            

            f.SendEmail(message, Constants.ContactUsEmail, "Netintercom [Web Request]");

            return RedirectToAction("Index");
        }

        [AutoLogOffActionFilter]
        [Authorize(Roles = "contacts")]
        public ActionResult Contact()
        {
            return View();
        }

        [GridAction]
        public ActionResult _ListContact()
        {
            //...Initialize List...
            List<Contact> lst = new List<Contact>();

            //...Populate List...
            lst = conRep.GetListContact(Convert.ToInt32(HttpContext.Session["ClientId"]));

            //...Return List to Grid...
            return View(new GridModel(lst));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _InsertContact(Contact ins)
        {
            //...Fix...
            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);

            //...Insert into Database...
            Contact ins2 = conRep.InsertContact(ins);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(ins.ClientId);
            List<string> reg = AppRep.GetAllRegIdsList(ins.ClientId);
            if (!regIds.Equals(""))
            {
                comrep.NewsyncData(regIds, "CMD_NEWCONTACT", reg, ins.ClientId);
            }

            //...Repopulate Grid...
            List<Contact> lst = new List<Contact>();
            lst = conRep.GetListContact(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }
        
        [GridAction]
        public ActionResult _UpdateContact(Contact ins)
        {
            ContactRepository conRep = new ContactRepository();
            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);

            Contact ins2 = conRep.UpdateContact(ins);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(ins.ClientId);
            if (!regIds.Equals(""))
            {
                comrep.NewUpdateData(regIds, "CMD_EDITCONTACT", ins2.ContactId.ToString());
            }

            //...Repopulate Grid...
            List<Contact> lst = new List<Contact>();
            lst = conRep.GetListContact(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }
        
        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _DeleteContact(int id)
         {
             bool ins2 = conRep.RemoveContact(id);

             //...Notify...
             string regIds = AppRep.GetAllRegIds(Convert.ToInt32(HttpContext.Session["ClientId"]));
             if (!regIds.Equals(""))
             {
                 comrep.NewUpdateData(regIds, "CMD_DELCONTACT", id.ToString());
             }

             //...Repopulate Grid...
             List<Contact> lst = new List<Contact>();
             lst = conRep.GetListContact(Convert.ToInt32(HttpContext.Session["ClientId"]));
             return View(new GridModel(lst));
         }

       
    }
}
