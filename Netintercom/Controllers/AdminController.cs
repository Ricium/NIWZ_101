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
    public class AdminController : Controller
    {
        private AppRequestRepository appRep = new AppRequestRepository();
        public ClientRepository schReP = new ClientRepository();
        public CommunicationRepository comrep = new CommunicationRepository();
        private UserRepository userRep = new UserRepository();

        public IFormsAuthenticationService FormsService { get; set; }
        public IMembershipService MembershipService { get; set; }

        protected override void Initialize(RequestContext requestContext)
        {
            if (FormsService == null) { FormsService = new FormsAuthenticationService(); }
            if (MembershipService == null) { MembershipService = new AccountMembershipService(); }

            base.Initialize(requestContext);
        }

        [Authorize(Roles = "Admin")]
        public ActionResult RegisterSchool()
        {           
            return View();
        }

        [GridAction]
        public ActionResult _ListClient()
        {

            //...Initialize List...
            List<Client> lst = new List<Client>();

            //...Populate List...
            lst = schReP.GetListClient();

            //...Return List to Grid...
            return View(new GridModel(lst));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _InsertClient(Client ins)
        {
            //....Insert School...
            Client ins2 = schReP.InsertClient(ins);
            
            //...Create Folders...
            string targetPath = Server.MapPath("~/Images/Client/" + ins2.ClientId + "/News");
            if (!System.IO.Directory.Exists(targetPath))
            {
                System.IO.Directory.CreateDirectory(targetPath);
            }

            targetPath = Server.MapPath("~/Images/Client/" + ins2.ClientId + "/Events");
            if (!System.IO.Directory.Exists(targetPath))
            {
                System.IO.Directory.CreateDirectory(targetPath);
            }

            targetPath = Server.MapPath("~/Images/Client/" + ins2.ClientId + "/Ads");
            if (!System.IO.Directory.Exists(targetPath))
            {
                System.IO.Directory.CreateDirectory(targetPath);
            }

            targetPath = Server.MapPath("~/Images/Client/" + ins2.ClientId + "/Logo");
            if (!System.IO.Directory.Exists(targetPath))
            {
                System.IO.Directory.CreateDirectory(targetPath);
            }

            //...Repopulate Grid...
            List<Client> lst = new List<Client>();
            lst = schReP.GetListClient();
            return View(new GridModel(lst));
        }

        [GridAction]
        public ActionResult _UpdateClient(Client ins)
        {
            Client ins2 = schReP.UpdateClient(ins);

            //...Repopulate Grid...
            List<Client> lst = new List<Client>();
            lst = schReP.GetListClient();
            return View(new GridModel(lst));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _DeleteClient(int id)
        {   
            bool ins2 = schReP.RemoveClient(id);

            //...Delete Rest...
            schReP.RemoveSchoolData(id);

            //...Delete Files...
            Functions func = new Functions();
            func.DeleteFiles(Server.MapPath("~/Images/Client/" + id + "/"));         

            //...Repopulate Grid...
            List<Client> lst = new List<Client>();
            lst = schReP.GetListClient();
            return View(new GridModel(lst));
        }

        [Authorize(Roles = "Admin")]
        public ActionResult RegisterUser()
        {
            SelectList sl = new SelectList(Roles.GetAllRoles(), "roleNames");
            //List<string> roles = new List<string>();
            //foreach (SelectListItem item in sl)
            //{
            //    roles.Add(item.Text);
            //}
            ViewData["roleNames"] = sl;
            ViewData["Clients"] = schReP.GetSchoolList();

            return View();
        }

        [GridAction]
        public ActionResult _ListUser()
        {
            //...Initialize List...
            List<RegisterModel> lst = new List<RegisterModel>();

            //...Populate List...
            lst = userRep.GetUsers();

            //...Return List to Grid...
            return View(new GridModel(lst));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _InsertUser(FormCollection form)// RegisterModel model)
        {
            ViewData["Clients"] = schReP.GetSchoolList();
            string x = form["x[]"].ToString();

            List<string> roles = x.Split(',').ToList();

            RegisterModel model = new RegisterModel();
            model.Approved = false;
            model.FirstName = form["FirstName"].ToString();
            model.Surname = form["Surname"].ToString();
            model.UserName = form["UserName"].ToString();
            model.Email = form["Email"].ToString();
            model.Password = form["Password"].ToString();
            model.ConfirmPassword = form["ConfirmPassword"].ToString();
            model.ClientId = Convert.ToInt32(form["ClientId"]);

            //....Insert User...
            if (ModelState.IsValid)
            {
                // Attempt to register the user
                MembershipCreateStatus createStatus = MembershipService.CreateUser(model.UserName, model.Password, model.Email);

                if (createStatus == MembershipCreateStatus.Success)
                {
                    //FormsService.SignIn(model.UserName, false /* createPersistentCookie */);
                    //Roles.AddUserToRole(model.UserName, model.roleName.ToString());
                    foreach (string role in roles)
                    {
                        Roles.AddUserToRole(model.UserName,  role);
                    }

                    MembershipUser user = Membership.GetUser(model.UserName);
                    Guid guid = (Guid)user.ProviderUserKey;
                    if (model.FirstName == null) { model.FirstName = ""; }
                    if (model.Surname == null) { model.Surname = ""; }

                    //...Add School Details...
                    //UserRepository userRep = new UserRepository();
                    userRep.InsertUserSchool(guid, model.ClientId);
                }
                else
                {
                    ModelState.AddModelError("", AccountValidation.ErrorCodeToString(createStatus));
                }
            }

            //...Repopulate Grid...
            //...Initialize List...
            List<RegisterModel> lst = new List<RegisterModel>();

            //...Populate List...
            lst = userRep.GetUsers();

            //...Return List to Grid...
            return View(new GridModel(lst));
        }

        [GridAction]
        public ActionResult _UpdateUser(RegisterModel model)
        {
            ViewData["Clients"] = schReP.GetSchoolList();

            //...Repopulate Grid...
            List<Client> lst = new List<Client>();
            lst = schReP.GetListClient();
            return View(new GridModel(lst));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _DeleteUser(int id)
        {
            string username = userRep.GetUsername(id);

            //MembershipUser user = Membership.GetUser(username);
            Membership.DeleteUser(username, true);

            //...Repopulate Grid...
            //...Initialize List...
            List<RegisterModel> lst = new List<RegisterModel>();

            //...Populate List...
            lst = userRep.GetUsers();

            //...Return List to Grid...
            return View(new GridModel(lst));
        }

        [Authorize(Roles = "Admin")]
        public ActionResult Devices()
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

        [Authorize(Roles = "admin")]
        public ActionResult Skwladaptor()
        {
            return View();
        }

        [Authorize(Roles = "admin")]
        [HttpPost]
        public ActionResult SkwladaptorInstall(Skwladaptor ins)
        {
            SkwladaptorWorker s = new SkwladaptorWorker();
            s.RunQuery(ins);
            return RedirectToAction("Home", "Home");
        }
      }
}
