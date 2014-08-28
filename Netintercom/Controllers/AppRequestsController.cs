using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Netintercom.Models;

namespace Netintercom.Controllers
{
    public class AppRequestsController : Controller
    {
        private AppRequestRepository appRep = new AppRequestRepository();

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
        public JsonResult RegisterUser(int ClientId, string DeviceId, string NameSurname, string Phone, string Email, string Password)
        {
            DeviceUser newUser = new DeviceUser(ClientId, DeviceId, NameSurname, Phone, Email, Password);
            DeviceUser insertedUser = appRep.AddDeviceUser(newUser);

            //* In app, check if the DeviceUserId field != 1 for a successfull registration *//

            var j = this.Json(insertedUser);
            return Json(j, JsonRequestBehavior.AllowGet);

        }

        [HttpPost]
        public ActionResult LoginDeviceUser(int DeviceUserId, string Password)
        {
            return Content(appRep.CheckDeviceUserLogin(DeviceUserId, Password).ToString(), "text/html");
        }
    }
}
