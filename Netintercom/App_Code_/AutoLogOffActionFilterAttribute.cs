using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Netintercom
{
    public class AutoLogOffActionFilterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            HttpContextBase ctx = filterContext.HttpContext;
            if (ctx.Session["UserID"] == null)
            {
                ctx.Session.Abandon();
                filterContext.Result = OnSessionExpiryRedirectResult(filterContext);
            }

            base.OnActionExecuting(filterContext);
        }

        public virtual ActionResult OnSessionExpiryRedirectResult(ActionExecutingContext filterContext)
        {
            return new RedirectToRouteResult(new RouteValueDictionary{
                    { "controller", "Account" },
                    { "action", "LogOn" },
                    { "ReturnUrl", filterContext.HttpContext.Request.Url.PathAndQuery }
                });
        }

    }
}