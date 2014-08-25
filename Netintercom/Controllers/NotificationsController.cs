using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Netintercom.Models;
using Telerik.Web.Mvc;
using System.IO;
using Telerik.Web.Mvc.Extensions;

namespace Netintercom.Controllers
{
    [AutoLogOffActionFilter]
    public class NotificationsController : Controller
    {
        //
        // GET: /Announcements/
        public CategoryRepository CatRep = new CategoryRepository();
        public NotificationsRepository NotRep = new NotificationsRepository();
        private AppRequestRepository AppRep = new AppRequestRepository();
        private CommunicationRepository comrep = new CommunicationRepository();

        public ActionResult _AsyncSubCategorys(int? CategoryId)
        {
            List<SelectListItem> SubCategory = CatRep.GetSubCategoryList((int)CategoryId);
            return Json(SubCategory);
        }

        public ActionResult Announcements()
        {
            CategoryRepository CatRep = new CategoryRepository();
            ViewData["Category"] = CatRep.GetListCategoryDropDown();

            return View();
        }

        [GridAction]
        public ActionResult _ListNotifications()
        {
            //...Initialize List...
            List<Notifications> lst = new List<Notifications>();

            //...Populate List...
            lst = NotRep.GetListNotifications(Convert.ToInt32(HttpContext.Session["ClientId"]));

            //...Return List to Grid...
            return View(new GridModel(lst));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _InsertNotifications(Notifications ins)
        {
            //...Fix...
            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);

            //...Insert into Database...
            Notifications ins2 = NotRep.InsertNotifications(ins);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(ins.ClientId);
            comrep.Notify(regIds, ins2.Body);

            //...Repopulate Grid...
            List<Notifications> lst = new List<Notifications>();
            lst = NotRep.GetListNotifications(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }

        [GridAction]
        public ActionResult _UpdateNotifications(Notifications ins)
        {
            //...ViewData...
            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);
            Notifications ins2 = NotRep.UpdateNotifications(ins);

            //...Repopulate Grid...
            List<Notifications> lst = new List<Notifications>();
            lst = NotRep.GetListNotifications(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _DeleteNotifications(int id)
        {
            bool ins2 = NotRep.RemoveNotifications(id);

            //...Repopulate Grid...
            List<Notifications> lst = new List<Notifications>();
            lst = NotRep.GetListNotifications(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }

    }
}
