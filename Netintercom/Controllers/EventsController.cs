using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Netintercom.Models;
using Telerik.Web.Mvc;
using System.IO;
using Telerik.Web.Mvc.Extensions;
using System.Drawing;
using System.Drawing.Imaging;

namespace Netintercom.Controllers
{
    [AutoLogOffActionFilter]
    public class EventsController : Controller
    {
        public CategoryRepository CatRep = new CategoryRepository();
        public EventRepository EventRep = new EventRepository();
        private AppRequestRepository AppRep = new AppRequestRepository();
        private CommunicationRepository comrep = new CommunicationRepository();

        public ActionResult _AsyncSubCategorys(int? CategoryId)
        {
            List<SelectListItem> SubCategory = CatRep.GetSubCategoryList((int)CategoryId);
            return Json(SubCategory);
        }

        public ActionResult Save(IEnumerable<HttpPostedFileBase> attachments)
        {
            PictureRepository picRep = new PictureRepository();
            Functions functions = new Functions();
            int NewPicID = picRep.GetLastPictureId(Convert.ToInt32(HttpContext.Session["ClientId"]));
            NewPicID++;
            Picture ins = new Picture();

            foreach (var file in attachments)
            {
                // Some browsers send file names with full path. This needs to be stripped.
                var fileName = Path.GetFileName(file.FileName);
                var extention = fileName.Substring(fileName.IndexOf('.'));
                var newfilename = NewPicID.ToString() + extention;

                // Check if Path exsits
                string serverpath = Server.MapPath("~/Images/Client/" + HttpContext.Session["ClientId"].ToString() + "/Events");
                if (!Directory.Exists(serverpath))
                {
                    Directory.CreateDirectory(serverpath);
                }

                var physicalPath = Path.Combine(Server.MapPath("~/Images/Client/" + HttpContext.Session["ClientId"].ToString() + "/Events"), newfilename);

                //...Resize..
                Image original = Image.FromStream(file.InputStream, true, true);
                Image resized = functions.ResizeImage(original, new Size(100, 100));

                resized.Save(physicalPath, ImageFormat.Jpeg);

                string finalpath = physicalPath.ToString();
                finalpath = finalpath.Substring(finalpath.IndexOf("Images"));
                finalpath = finalpath.Replace('\\', '/');
                //finalpath = "http://ni.4dtech.co.za/" + finalpath;

                //...Save In DB...                
                ins.PicUrl = Constants.HTTPPath + finalpath;
                ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);

                ins = picRep.InsertPicture(ins);
            }
            // Return an empty string to signify success
            if (ins.PictureId != 0)
                return Json(new { status = ins.PictureId.ToString() }, "text/plain");
            else
                return Json(new { status = "0" }, "text/plain");
        }
        public ActionResult Remove(string[] fileNames)
        {
            PictureRepository picRep = new PictureRepository();
            int NewPicID = picRep.GetLastPictureId(Convert.ToInt32(HttpContext.Session["ClientId"]));

            // The parameter of the Remove action must be called "fileNames"
            foreach (var fullName in fileNames)
            {
                var fileName = Path.GetFileName(fullName);
                var extention = fileName.Substring(fileName.IndexOf('.'));
                var newfilename = NewPicID.ToString() + extention;

                // Check if Path exsits
                string serverpath = Server.MapPath("~/Images/Client/" + HttpContext.Session["ClientId"].ToString() + "/Events");
                if (!Directory.Exists(serverpath))
                {
                    Directory.CreateDirectory(serverpath);
                }


                var physicalPath = Path.Combine(Server.MapPath("~/Images/Client/" + HttpContext.Session["ClientId"].ToString() + "/Events"), newfilename);

                // TODO: Verify user permissions
                if (System.IO.File.Exists(physicalPath))
                {
                    // The files are not actually removed in this demo
                    System.IO.File.Delete(physicalPath);

                    picRep.RemovePicture(NewPicID);
                }
            }
            // Return an empty string to signify success
            return Content("");
        }

        [Authorize(Roles = "events")]
        public ActionResult Events()
        {
            CategoryRepository CatRep = new CategoryRepository();
            ViewData["Category"] = CatRep.GetListCategoryDropDown();
            return View();
        }
        
        [GridAction]
        public ActionResult _ListEvent()
        {
            //...Initialize List...
            List<Event> lst = new List<Event>();

            //...Populate List...
            lst = EventRep.GetListEvent(Convert.ToInt32(HttpContext.Session["ClientId"]));

            //...Return List to Grid...
            return View(new GridModel(lst));
        }
        
        [AcceptVerbs(HttpVerbs.Post)]        
        [GridAction]
        public ActionResult _InsertEvent(Event ins)
        {
            //...Fix...
            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);

            //...Insert into Database...
            Event ins2 = EventRep.InsertEvent(ins);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(ins.ClientId);
            List<string> reg = AppRep.GetAllRegIdsList(ins.ClientId);
            if (!regIds.Equals(""))
            {
                comrep.NewsyncData(regIds, "CMD_NEWEVENT", reg, ins.ClientId);
            }

            //...Facebook...
            string access_token = FacebookPost.GetAccessToken(ins.ClientId);

            if (!access_token.Equals(""))
            {
                string page_id = FacebookPost.GetPageId(ins.ClientId);
                if (!page_id.Equals(""))
                {
                    FacebookPost.Post(access_token, page_id, "Event: " + ins.Body + " FROM: " + ins.StartDate.ToString() + " UNTIL: " + ins.EndDate.ToString());
                }
            }

            //...Repopulate Grid...
            List<Event> lst = new List<Event>();
            lst = EventRep.GetListEvent(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }
        
        [GridAction]
        public ActionResult _UpdateEvent(Event ins)
        {
            //...ViewData...
            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);

            Event ins2 = EventRep.UpdateEvent(ins);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(ins.ClientId);
            if (!regIds.Equals(""))
            {
                comrep.NewUpdateData(regIds, "CMD_EDITEVENT", ins2.EventsId.ToString());
            }

            //...Repopulate Grid...
            List<Event> lst = new List<Event>();
            lst = EventRep.GetListEvent(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }
        
        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _DeleteEvent(int id)
        {
            PictureRepository picRep = new PictureRepository();
            Event ins = EventRep.GetEvent(id);
            if (ins.PictureId != 0)
            {
                //...Get Picture...
                Picture pic = picRep.GetPicture(ins.PictureId);
                string path = pic.PicUrl.Substring(pic.PicUrl.IndexOf("/Images/") + 8);
                path = path.Replace('/', '\\');
                var finalpath = Path.Combine(Server.MapPath("~/Images"), path);
                System.IO.File.Delete(finalpath);
                bool picrem = picRep.RemovePicture(ins.PictureId);
            }

            bool ins2 = EventRep.RemoveEvent(id);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(Convert.ToInt32(HttpContext.Session["ClientId"]));
            if (!regIds.Equals(""))
            {
                comrep.NewUpdateData(regIds, "CMD_DELEVENT", id.ToString());
            }

            //...Repopulate Grid...
            List<Event> lst = new List<Event>();
            lst = EventRep.GetListEvent(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }
    }
}
