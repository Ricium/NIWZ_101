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
    public class DeviceUserController : Controller
    {
        private DeviceUserRepository DevURep = new DeviceUserRepository();

        public ActionResult DeviceUsers()
        {
            return View();
        }

        [GridAction]
        public ActionResult _ListDeviceUsers()
        {
            //...Initialize List...
            List<DeviceUser> lst = new List<DeviceUser>();

            //...Populate List...
            lst = DevURep.GetListDeviceUser(Convert.ToInt32(HttpContext.Session["ClientId"]));

            //...Return List to Grid...
            return View(new GridModel(lst));
        }

        public ActionResult _ApproveUser(int id)
        {
            DeviceUser toUpdate = DevURep.GetDeviceUser(id);
            toUpdate.Approved = true;
            DeviceUser Updated = DevURep.UpdateDeviceUser(toUpdate);

            return RedirectToAction("DeviceUsers");

            ////...Repopulate Grid...
            //List<DeviceUser> lst = new List<DeviceUser>();
            ////...Populate List...
            //lst = DevURep.GetListDeviceUser(Convert.ToInt32(HttpContext.Session["ClientId"]));
            ////...Return List to Grid...
            //return View(new GridModel(lst));
        }
    }
}
