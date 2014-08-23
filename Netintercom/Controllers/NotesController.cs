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
using System.Web.Routing;
using System.Web.Security;
using System.Web.Profile;

namespace Netintercom.Controllers
{
    [AutoLogOffActionFilter]
    public class NotesController : Controller
    {
        //
        // GET: /Notes/
        private AppRequestRepository appRep = new AppRequestRepository();

        [Authorize(Roles = "Admin")]
        public ActionResult Notes()
        {
            return View();
        }

        [GridAction]
        public ActionResult _ListDevices()
        {
            //...Initialize List...
            List<DeviceModel> lst = new List<DeviceModel>();

            //...Populate List...
            lst = appRep.GetRegisteredDevices();

            //...Return List to Grid...
            return View(new GridModel(lst));
        }
    }
}
