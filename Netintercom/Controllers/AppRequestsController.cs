using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Netintercom.Models;
using System.Text;

namespace Netintercom.Controllers
{
    public class AppRequestsController : Controller
    {
        private AppRequestRepository appRep = new AppRequestRepository();
        private SettingRepository setRep = new SettingRepository();

        [HttpPost]
        public JsonResult GetNews(int ClientId, int LastId)
        {
            //...Query DB....
            List<NewsRequest> list = new List<NewsRequest>();
            list = appRep.GetNews(ClientId, LastId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetFixtures(int ClientId, int LastId)
        {
            //...Query DB....
            List<FixturesRequest> list = new List<FixturesRequest>();
            list = appRep.GetFixtures(ClientId, LastId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetResults(int ClientId, int LastId)
        {
            //...Query DB....
            List<ResultRequest> list = new List<ResultRequest>();
            list = appRep.GetResults(ClientId, LastId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetSportCategory(int ClientId, int LastId)
        {
            //...Query DB....
            List<SportCategoryRequest> list = new List<SportCategoryRequest>();
            list = appRep.GetSportCategory(ClientId, LastId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetNotifications(int ClientId, int LastId)
        {
            //...Query DB....
            List<Notifications> list = new List<Notifications>();
            list = appRep.GetNotifications(ClientId, LastId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetEvents(int ClientId, int LastId)
        {
            //...Query DB....
            List<EventRequest> list = new List<EventRequest>();
            list = appRep.GetEvents(ClientId, LastId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetContacts(int ClientId)
        {
            //...Query DB....
            List<ContactRequest> list = new List<ContactRequest>();
            list = appRep.GetContact(ClientId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetAds(int ClientId, int LastId)
        {
            //...Query DB....
            List<AdRequest> list = new List<AdRequest>();
            list = appRep.GetAd(ClientId, LastId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetSplashAd(int ClientId)
        {
            //...Query DB....
            AdRequest list = new AdRequest();
            list = appRep.GetRandomSplashAdd(ClientId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult RegisterDevice(int ClientId, string RegId)
        {
            bool done = appRep.RegisterDevice(ClientId, RegId);

            return null;
        }

        [HttpPost]
        public JsonResult EditNews(int ClientId, int EditId)
        {
            //...Query DB....
            List<NewsRequest> list = new List<NewsRequest>();
            list = appRep.GetEditNews(ClientId, EditId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }
       
        [HttpPost]
        public JsonResult EditFixtures(int ClientId, int EditId)
        {
            //...Query DB....
            List<FixturesRequest> list = new List<FixturesRequest>();
            list = appRep.GetEditFixtures(ClientId, EditId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }
       
        [HttpPost]
        public JsonResult EditResults(int ClientId, int EditId)
        {
            //...Query DB....
            List<ResultRequest> list = new List<ResultRequest>();
            list = appRep.GetEditResults(ClientId, EditId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult EditSportCategory(int ClientId, int EditId)
        {
            //...Query DB....
            List<SportCategoryRequest> list = new List<SportCategoryRequest>();
            list = appRep.GetEditSportCategory(ClientId, EditId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult EditEvent(int ClientId, int EditId)
        {
            //...Query DB....
            List<EventRequest> list = new List<EventRequest>();
            list = appRep.GetEditEvent(ClientId, EditId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult EditContact(int ClientId, int EditId)
        {
            //...Query DB....
            List<ContactRequest> list = new List<ContactRequest>();
            list = appRep.GetEditContact(ClientId, EditId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult EditAd(int ClientId, int EditId)
        {
            //...Query DB....
            List<AdRequest> list = new List<AdRequest>();
            list = appRep.GetEditAd(ClientId, EditId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult RegisterUser(int ClientId, string NameSurname, string Email, string Password, string Phone, string DeviceId, string RawPW, string Address)
        {
            DeviceUser newUser = new DeviceUser(ClientId, DeviceId, NameSurname, Phone, Email, Password, Address);
            Client c = new Client();
            ClientRepository cr = new ClientRepository();
            c = cr.GetClient(Convert.ToInt32(ClientId));

            if (appRep.CheckDeviceUserRegistration(DeviceId, Phone, ClientId.ToString(), Password))
            {
                newUser.DeviceUserId = -1;
                var j = this.Json(newUser);
                return Json(j, JsonRequestBehavior.AllowGet);
            }
            else
            {
                //* In app, check if the DeviceUserId field != 0 for a successfull registration *//
                DeviceUser insertedUser = appRep.AddDeviceUser(newUser);

                if (insertedUser.DeviceUserId != 0)
                {
                    Functions f = new Functions();
                    f.SendEmail("You have been successfully registered. \n Registration details: \n Phone: " + Phone + " \n Password: " + RawPW + "\n\n Please keep this information safe, and do not delete this email.", Email, "Registration Details for: " + c.Name);
                    
                    //...Send Email to Registrar
                    //Get Client Service Mail List
                    List<Settings> mails = setRep.GetSettings("registrar", ClientId);
                    
                    if (mails.Count >= 1)
                    {
                        StringBuilder maillist = new StringBuilder();

                        foreach (Settings setting in mails)
                        {
                            maillist.Append(setting.Value).Append(",");
                        }
                        maillist.Remove(maillist.Length - 1, 1);

                        f.SendEmail("Please Approve:\n"+NameSurname, maillist.ToString(), "Netintercom User Request's Approval");
                    }  
                }

                var j = this.Json(newUser);
                return Json(j, JsonRequestBehavior.AllowGet);                
            }         
        }

        [HttpPost]
        public ActionResult LoginDeviceUser(string DeviceId, string Phone, string ClientId, string Password)
        {
            return Content(appRep.CheckDeviceUserLogin(Phone, ClientId, Password), "text/html");
        }

        [HttpPost]
        public JsonResult GetDocs(int ClientId, int LastId)
        {
            DocumentsRepository DocRep = new DocumentsRepository();
            //...Query DB....
            List<Documents> list = new List<Documents>();
            list = DocRep.GetDocuments(ClientId, LastId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult RequestService(int DeviceUserId, string ServiceRequest, string Query)
        {
            DeviceUserRepository DevURep = new DeviceUserRepository();
            ServicesRepository ServRep = new ServicesRepository();

            Services service = new Services();
            DeviceUser user = DevURep.GetDeviceUser(DeviceUserId);
            

            service.ClientId = user.ClientId;
            service.DeviceUserId = DeviceUserId;
            service.Service = ServiceRequest;
            service.Query = Query;
            service.ModifiedDate = DateTime.Now;

            StringBuilder w = new StringBuilder();
            w.Append(user.Name).Append(" ").Append(user.Surname).Append("\n");
            w.Append("Address: ").Append(user.Address).Append("\n");
            w.Append("Contact Details: Phone - ").Append(user.Phone).Append(" Email - ").Append(user.Email).Append("\n");
            w.Append("Request: ").Append(service.Service);
            w.Append("\n").Append(service.Query);


            Services ins = ServRep.AddServices(service);

            if (ins.ServiceId != 0)
            {
                //Send email
                Functions f = new Functions();

                //Get Client Service Mail List
                List<Settings> mails = setRep.GetSettings("email", user.ClientId);
                
                if (mails.Count >= 1)
                {
                    StringBuilder maillist = new StringBuilder();

                    foreach (Settings setting in mails)
                    {
                        maillist.Append(setting.Value).Append(",");
                    }
                    maillist.Remove(maillist.Length - 1, 1);

                    f.SendEmail(w.ToString(), maillist.ToString(), service.Service);
                }  
                return Content("Success", "text/html");
            }
            else
            {
                return Content("Fail", "text/html");
            }

            
        }
    }
}
