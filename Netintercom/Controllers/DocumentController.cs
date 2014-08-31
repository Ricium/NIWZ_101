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
    public class DocumentController : Controller
    {
        private DocumentsRepository DocRep = new DocumentsRepository();
        private AppRequestRepository AppRep = new AppRequestRepository();
        private CommunicationRepository comrep = new CommunicationRepository();
        private Functions func = new Functions();

        public ActionResult Documents()
        {
            return View();
        }

        [GridAction]
        public ActionResult _ListDocuments()
        {
            //...Initialize List...
            List<Documents> lst = new List<Documents>();

            //...Populate List...
            lst = DocRep.GetDocuments(Convert.ToInt32(HttpContext.Session["ClientId"]));

            //...Return List to Grid...
            return View(new GridModel(lst));
        }

        public ActionResult Save(IEnumerable<HttpPostedFileBase> attachments)
        {
            Functions functions = new Functions();
            Documents ins = new Documents();

            // The Name of the Upload component is "attachments"            
            foreach (var file in attachments)
            {
                // Some browsers send file names with full path. This needs to be stripped.
                var fileName = Path.GetFileName(file.FileName);
                
                // Check if Path exsits
                string serverpath = Server.MapPath("~/Images/Client/" + HttpContext.Session["ClientId"].ToString() + "/Docs");
                if (!Directory.Exists(serverpath))
                {
                    Directory.CreateDirectory(serverpath);
                }

                var physicalPath = Path.Combine(Server.MapPath("~/Images/Client/" + HttpContext.Session["ClientId"].ToString() + "/Docs"), fileName);


                file.SaveAs(physicalPath);

                //...Save In DB... 
                ins.DocumentName = fileName;
                ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);
                ins.PathUrl = physicalPath;

                ins = DocRep.AddDocument(ins);
            }
            // Return an empty string to signify success
            if (ins.DocId != 0)
                return Json(new { status = ins.DocId.ToString() }, "text/plain");
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
                string serverpath = Server.MapPath("~/Images/Client/" + HttpContext.Session["ClientId"].ToString() + "/Ads");
                if (!Directory.Exists(serverpath))
                {
                    Directory.CreateDirectory(serverpath);
                }


                var physicalPath = Path.Combine(Server.MapPath("~/Images/Client/" + HttpContext.Session["ClientId"].ToString() + "/Ads"), newfilename);

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

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _InsertDocument(Documents ins)
        {
            //...Fix...
            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);

            //...Insert into Database...
            Documents ins2 = DocRep.AddDocument(ins);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(ins.ClientId);
            comrep.NewsyncData(regIds, "CMD_NEWDOC");

            //...Initialize List...
            List<Documents> lst = new List<Documents>();
            //...Populate List...
            lst = DocRep.GetDocuments(Convert.ToInt32(HttpContext.Session["ClientId"]));
            //...Return List to Grid...
            return View(new GridModel(lst));
        }
       
        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _DeleteDocument(int id)
        {
            Documents ins = DocRep.GetDocument(id);

            func.DeleteFile(ins.PathUrl);

            DocRep.RemoveDocument(id);

            //...Initialize List...
            List<Documents> lst = new List<Documents>();
            //...Populate List...
            lst = DocRep.GetDocuments(Convert.ToInt32(HttpContext.Session["ClientId"]));
            //...Return List to Grid...
            return View(new GridModel(lst));
        }      
    }
}
