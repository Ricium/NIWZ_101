using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using Netintercom.Models;
using System.Data.SqlClient;
using Telerik.Web.Mvc;
using System.Web.Profile;

namespace Netintercom.Controllers
{
    /*[Authorize]
    [InitializeSimpleMembership]*/

    public class AccountController : Controller
    {
        public IFormsAuthenticationService FormsService { get; set; }
        public IMembershipService MembershipService { get; set; }

        protected override void Initialize(RequestContext requestContext)
        {
            if (FormsService == null) { FormsService = new FormsAuthenticationService(); }
            if (MembershipService == null) { MembershipService = new AccountMembershipService(); }

            base.Initialize(requestContext);
        }

        public ActionResult LogOn()
        {
            if (HttpContext.Session["UserID"] == null)
            {
                HttpContext.Session.Abandon();
                FormsService.SignOut();
            }
            return View();
        }

        [HttpPost]
        public ActionResult LogOn(LogOnModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                if (MembershipService.ValidateUser(model.UserName, model.Password))
                {
                    FormsService.SignIn(model.UserName, model.RememberMe);
                    UserRepository userRep = new UserRepository();

                    if (!String.IsNullOrEmpty(returnUrl))
                    {
                        userRep.GetUserID(model.UserName);
                        userRep.GetClientId(model.UserName);
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        userRep.GetUserID(model.UserName);
                        userRep.GetClientId(model.UserName);
                        return RedirectToAction("Home", "Home");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "The user name or password provided is incorrect.");
                }
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        public ActionResult LogOff()
        {
            FormsService.SignOut();
            HttpContext.Session["UserID"] = null;
            return RedirectToAction("Index", "Home");
        }

        public ActionResult Register()
        {
            ViewBag.PasswordLength = MembershipService.MinPasswordLength;
            SelectList sl = new SelectList(Roles.GetAllRoles(), "roleNames");
            string password = Membership.GeneratePassword(8, 1);
            
            ViewData["roleNames"] = sl;

            RegisterModel rM = new RegisterModel();
            rM.Password = password;
            return View(rM);
        }

        [HttpPost]
        public ActionResult Register(RegisterModel model)
        {
           // model.roleName = "School";
            if (ModelState.IsValid)
            {
                // Attempt to register the user
                MembershipCreateStatus createStatus = MembershipService.CreateUser(model.UserName, model.Password, model.Email);

                if (createStatus == MembershipCreateStatus.Success)
                {
                    //FormsService.SignIn(model.UserName, false /* createPersistentCookie */);
                    Roles.AddUserToRole(model.UserName, model.roleName.ToString());
                    MembershipUser user = Membership.GetUser(model.UserName);
                    Guid guid = (Guid)user.ProviderUserKey;
                    if (model.FirstName == null) { model.FirstName = ""; }
                    if (model.Surname == null) { model.Surname = ""; }

                    //...Add School Details...
                    UserRepository userRep = new UserRepository();
                    userRep.InsertUserSchool(guid, model.ClientId);

                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", AccountValidation.ErrorCodeToString(createStatus));
                    return View(model);
                }
            }

            // If we got this far, something failed, redisplay form
            ViewBag.PasswordLength = MembershipService.MinPasswordLength;
            SelectList sl = new SelectList(Roles.GetAllRoles(), "roleNames");
            //remove items as needed
            ViewData["roleNames"] = sl;
            return View(model);
        }

       
    }
}
