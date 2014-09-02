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
using System.Net;

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

        [Authorize(Roles = "facebook,email,twitter,sms")]
        public ActionResult MySettings()
        {
            if (setRep.HasFacebookToken(Convert.ToInt32(HttpContext.Session["ClientId"])))
            {
                ViewBag.Facebook = "Yes";
            }
            else
            {
                ViewBag.Facebook = "No";
            }
            
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

        public ActionResult FacebookLogin()
        {
            string app_id = Constants.FB_API_ID;
            string app_secret = Constants.FB_Secret;
            string scope = Constants.FB_Scope;

            if (Request["code"] == null)
            {
                Response.Redirect(string.Format(
                    "https://graph.facebook.com/oauth/authorize?client_id={0}&redirect_uri={1}&scope={2}",
                    app_id, Request.Url.AbsoluteUri, scope));
            }
            else
            {
                Dictionary<string, string> tokens = new Dictionary<string, string>();

                string url = string.Format("https://graph.facebook.com/oauth/access_token?client_id={0}&redirect_uri={1}&scope={2}&code={3}&client_secret={4}",
                    app_id, Request.Url.AbsoluteUri, scope, Request["code"].ToString(), app_secret);

                HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;

                using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
                {
                    StreamReader reader = new StreamReader(response.GetResponseStream());

                    string vals = reader.ReadToEnd();

                    foreach (string token in vals.Split('&'))
                    {
                        //meh.aspx?token1=steve&token2=jake&...
                        tokens.Add(token.Substring(0, token.IndexOf("=")),
                            token.Substring(token.IndexOf("=") + 1, token.Length - token.IndexOf("=") - 1));
                    }
                }

                string access_token = tokens["access_token"];

                Settings setting = new Settings();
                setting.Setting = "facebook";
                setting.Value = access_token;
                setting.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);

                setRep.AddSettings(setting);
            }


            return RedirectToAction("MySettings");
        }

    }
}
