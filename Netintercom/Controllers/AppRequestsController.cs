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
        public JsonResult GetNews(int SchoolId, int LastId)
        {
            //...Query DB....
            List<NewsRequest> list = new List<NewsRequest>();
            list = appRep.GetNews(SchoolId, LastId);
           
            //...Dummy Data...
            //NewsRequest ins = new NewsRequest();
            //ins.NewsId = 1;
            //ins.PicUrl = "test";
            //ins.Title = "Test";
            //ins.Body = "Test";
            //ins.Date = DateTime.Now;
            //list.Add(ins);

            //NewsRequest ins2 = new NewsRequest();
            //ins2.NewsId = 2;
            //ins2.PicUrl = "test";
            //ins2.Title = "Test";
            //ins2.Body = "Test 2";
            //ins2.Date = DateTime.Now;
            //list.Add(ins2);

            //NewsRequest ins3 = new NewsRequest();
            //ins3.NewsId = 3;
            //ins3.PicUrl = "test";
            //ins3.Title = "Test";
            //ins3.Body = "Test 3";
            //ins3.Date = DateTime.Now;
            //list.Add(ins3);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetEvents(int SchoolId, int LastId)
        {
            //...Query DB....
            List<EventRequest> list = new List<EventRequest>();
            list = appRep.GetEvents(SchoolId, LastId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetContacts(int SchoolId)
        {
            //...Query DB....
            List<ContactRequest> list = new List<ContactRequest>();
            list = appRep.GetContact(SchoolId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetAds(int SchoolId, int LastId)
        {
            //...Query DB....
            List<AdRequest> list = new List<AdRequest>();
            list = appRep.GetAd(SchoolId, LastId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetSplashAd(int SchoolId)
        {
            //...Query DB....
            AdRequest list = new AdRequest();
            list = appRep.GetRandomSplashAdd(SchoolId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult RegisterDevice(int SchoolId, string RegId)
        {
            bool done = appRep.RegisterDevice(SchoolId, RegId);

            return null;
        }

        [HttpPost]
        public JsonResult EditNews(int SchoolId, int EditId)
        {
            //...Query DB....
            List<NewsRequest> list = new List<NewsRequest>();
            list = appRep.GetEditNews(SchoolId, EditId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult EditEvent(int SchoolId, int EditId)
        {
            //...Query DB....
            List<EventRequest> list = new List<EventRequest>();
            list = appRep.GetEditEvent(SchoolId, EditId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult EditContact(int SchoolId, int EditId)
        {
            //...Query DB....
            List<ContactRequest> list = new List<ContactRequest>();
            list = appRep.GetEditContact(SchoolId, EditId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult EditAd(int SchoolId, int EditId)
        {
            //...Query DB....
            List<AdRequest> list = new List<AdRequest>();
            list = appRep.GetEditAd(SchoolId, EditId);

            var j = this.Json(list);
            return Json(j, JsonRequestBehavior.AllowGet);
        }
    }
}
