using System;
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

namespace Netintercom.Controllers
{
    [AutoLogOffActionFilter]
    public class HomeController : Controller
    {
        private AppRequestRepository AppRep = new AppRequestRepository();
        private CommunicationRepository comrep = new CommunicationRepository();
        private ContactRepository conRep = new ContactRepository();
        
        public ActionResult Index()
        {
            if (HttpContext.Session["UserID"] != null)
            {
                AppRequestRepository app = new AppRequestRepository();
                return View();
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
            comrep.NewsyncData(regIds, "CMD_NEWCONTACT");

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
            comrep.NewUpdateData(regIds, "CMD_EDITCONTACT", ins2.ContactId.ToString());

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
             comrep.NewUpdateData(regIds, "CMD_DELCONTACT", id.ToString());

             //...Repopulate Grid...
             List<Contact> lst = new List<Contact>();
             lst = conRep.GetListContact(Convert.ToInt32(HttpContext.Session["ClientId"]));
             return View(new GridModel(lst));
         }       
    }
}
