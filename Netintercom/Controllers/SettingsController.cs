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
    public class SettingsController : Controller
    {
        private SettingRepository setRep = new SettingRepository();

        [Authorize(Roles = "admin")]
        public ActionResult Settings()
        {
            return View();
        }

        [GridAction]
        public ActionResult _ListSettings()
        {
            //...Initialize List...
            List<Settings> lst = new List<Settings>();

            //...Populate List...
            lst = setRep.GetSettings();

            //...Return List to Grid...
            return View(new GridModel(lst));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _InsertSetting(Settings ins)
        {
            //...Insert into Database...
            Settings ins2 = setRep.AddSettings(ins);

            //...Initialize List...
            List<Settings> lst = new List<Settings>();
            //...Populate List...
            lst = setRep.GetSettings();
            //...Return List to Grid...
            return View(new GridModel(lst));
        }

        [GridAction]
        public ActionResult _UpdateSetting(Settings ins)
        {
            Settings ins2 = setRep.UpdateSettings(ins);

            //...Initialize List...
            List<Settings> lst = new List<Settings>();
            //...Populate List...
            lst = setRep.GetSettings();
            //...Return List to Grid...
            return View(new GridModel(lst));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _DeleteSetting(int id)
        {
            bool ins2 = setRep.RemoveSettings(id);

            //...Initialize List...
            List<Settings> lst = new List<Settings>();
            //...Populate List...
            lst = setRep.GetSettings();
            //...Return List to Grid...
            return View(new GridModel(lst));
        }       

    }
}
