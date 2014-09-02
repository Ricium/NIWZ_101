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
    public class ServicesController : Controller
    {
        private ServicesRepository ServRep = new ServicesRepository();

        [Authorize(Roles = "services")]
        public ActionResult Services()
        {
            return View();
        }

        [GridAction]
        public ActionResult _ListServices()
        {
            //...Initialize List...
            List<Services> lst = new List<Services>();

            //...Populate List...
            lst = ServRep.GetServices(Convert.ToInt32(HttpContext.Session["ClientId"]));

            //...Return List to Grid...
            return View(new GridModel(lst));
        }
    }
}
