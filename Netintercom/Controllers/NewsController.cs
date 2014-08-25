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
using System.Drawing;
using System.Drawing.Imaging;

namespace Netintercom.Controllers
{
    [AutoLogOffActionFilter]
    public class NewsController : Controller
    {
        //
        // GET: /News/
     
        public CategoryRepository CatRep = new CategoryRepository();
        public NewsRepository NewsRep = new NewsRepository();
        private AppRequestRepository AppRep = new AppRequestRepository();
        private CommunicationRepository comrep = new CommunicationRepository();
        private Functions func = new Functions();
        
        public ActionResult Save(IEnumerable<HttpPostedFileBase> attachments)
        {
            PictureRepository picRep = new PictureRepository();
            Functions functions = new Functions();
            // The Name of the Upload component is "attachments" 
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
                string serverpath = Server.MapPath("~/Images/Client/" + HttpContext.Session["ClientId"].ToString() + "/News");
                if (!Directory.Exists(serverpath))
                {
                    Directory.CreateDirectory(serverpath);
                }

                var physicalPath = Path.Combine(Server.MapPath("~/Images/Client/" + HttpContext.Session["ClientId"].ToString() + "/News"), newfilename);

                //...Resize..
                Image original = Image.FromStream(file.InputStream, true, true);
                Image resized = functions.ResizeImage(original, new Size(100, 100));

                resized.Save(physicalPath);

                string finalpath = physicalPath.ToString();
                finalpath = finalpath.Substring(finalpath.IndexOf("Images"));
                finalpath = finalpath.Replace('\\', '/');
                finalpath = "http://www.Netintercom.co.za/" + finalpath;

                //...Save In DB...                
                ins.PicUrl = finalpath;
                ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);

                ins = picRep.InsertPicture(ins);
            }
            // Return an empty string to signify success
            if(ins.PictureId != 0)
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
                string serverpath = Server.MapPath("~/Images/Client/" + HttpContext.Session["ClientId"].ToString() + "/News");
                if (!Directory.Exists(serverpath))
                {
                    Directory.CreateDirectory(serverpath);
                }

                var physicalPath = Path.Combine(Server.MapPath("~/Images/Client/" + HttpContext.Session["ClientId"].ToString() + "/News"), newfilename);

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
        
        public ActionResult _AsyncSubCategory(int? CategoryId)
        {
            List<SelectListItem> SubCategory = CatRep.GetSubCategoryList((int)CategoryId);
            return Json(SubCategory);
        }

        public ActionResult News()
        {
            CategoryRepository CatRep = new CategoryRepository();
            ViewData["Category"] = CatRep.GetListCategoryDropDown();
            return View();
        }
        
        [GridAction]
        public ActionResult _ListNews()
        {
            //...Initialize List...
            List<News> lst = new List<News>();

            //...Populate List...
            lst = NewsRep.GetListNews(Convert.ToInt32(HttpContext.Session["ClientId"]));

            //...Return List to Grid...
            return View(new GridModel(lst));
        }
          
        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _InsertNews(News ins)
        {
            ins.PostDate = DateTime.Now;
            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);

            //...Insert into Database...
            News ins2 = NewsRep.InsertNews(ins);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(ins.ClientId);
            comrep.NewsyncData(regIds, "CMD_NEWNEWS");

            //...Repopulate Grid...
            List<News> lst = new List<News>();
            lst = NewsRep.GetListNews(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }
        
        [GridAction]
        public ActionResult _UpdateNews(News ins)
        {
            //...ViewData...
            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);
            News ins2 = NewsRep.UpdateNews(ins);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(ins.ClientId);
            comrep.NewUpdateData(regIds, "CMD_EDITNEWS", ins2.NewsId.ToString());

            //...Repopulate Grid...
            List<News> lst = new List<News>();
            lst = NewsRep.GetListNews(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }
        
        [AcceptVerbs(HttpVerbs.Post)]        
        [GridAction]
        public ActionResult _DeleteNews(int id)
        {
            PictureRepository picRep = new PictureRepository();
            News ins = NewsRep.GetNews(id);

            if (ins.PictureId != 0)
            {
                //...Get Picture...
                Picture pic = picRep.GetPicture(ins.PictureId);
                string path = pic.PicUrl.Substring(pic.PicUrl.IndexOf("/Images/")+8);
                path = path.Replace('/', '\\');
                var finalpath = Path.Combine(Server.MapPath("~/Images"), path);
                System.IO.File.Delete(finalpath);
                bool picrem = picRep.RemovePicture(ins.PictureId);
            }

            bool ins2 = NewsRep.RemoveNews(id);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(Convert.ToInt32(HttpContext.Session["ClientId"]));
            comrep.NewUpdateData(regIds, "CMD_DELNEWS", id.ToString());

            //...Repopulate Grid...
            List<News> lst = new List<News>();
            lst = NewsRep.GetListNews(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }

    }
}
