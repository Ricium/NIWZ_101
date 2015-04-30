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
    public class MatchController : Controller
    {
       
        #region Repositories
        FieldRepository FieldsRep = new FieldRepository();
        TeamsRepository TeamsRep = new TeamsRepository();
        FixturesRepository FixRep = new FixturesRepository();
        ResultsRepository ResRep = new ResultsRepository();
        SportCategoryRepository SCRep = new SportCategoryRepository();
        private AppRequestRepository AppRep = new AppRequestRepository();
        private CommunicationRepository comrep = new CommunicationRepository();
        private Functions func = new Functions();
        SchoolsRepository SchRep = new SchoolsRepository();
       
        #endregion

        #region ImageUpload
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
                string serverpath = Server.MapPath("~/Images/Client/" + HttpContext.Session["ClientId"].ToString() + "/Schools");
                if (!Directory.Exists(serverpath))
                {
                    Directory.CreateDirectory(serverpath);
                }

                var physicalPath = Path.Combine(Server.MapPath("~/Images/Client/" + HttpContext.Session["ClientId"].ToString() + "/Schools"), newfilename);

                //...Resize..
                Image original = Image.FromStream(file.InputStream, true, true);
                Image resized = functions.ResizeImage(original, new Size(100, 100));

                resized.Save(physicalPath, ImageFormat.Jpeg);

                string finalpath = physicalPath.ToString();
                finalpath = finalpath.Substring(finalpath.IndexOf("Images"));
                finalpath = finalpath.Replace('\\', '/');

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
                string serverpath = Server.MapPath("~/Images/Client/" + HttpContext.Session["ClientId"].ToString() + "/Schools");
                if (!Directory.Exists(serverpath))
                {
                    Directory.CreateDirectory(serverpath);
                }

                var physicalPath = Path.Combine(Server.MapPath("~/Images/Client/" + HttpContext.Session["ClientId"].ToString() + "/Schools"), newfilename);

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
        #endregion

        #region Ajax

        private static void DelayResponse()
        {
            System.Threading.Thread.Sleep(100);
        }

        public ActionResult _AsyncResults(int? SportCategory)
        {
            DelayResponse();
            List<SelectListItem> Result = ResRep.GetFixtures(((int)SportCategory));
            return Json(Result);
        }
        public ActionResult _AsyncFields(int? SportCategoryId)
        {
            DelayResponse();
            List<SelectListItem> Fields = FieldsRep.GetFieldsPerSC((int)SportCategoryId);
            return Json(Fields);
        }

        public ActionResult _AsyncTeams(int? FieldId)
        {
            DelayResponse();
            List<SelectListItem> Teams = TeamsRep.GetTeamssPerSC((int)FieldId);
            return Json(Teams);
        }
        public ActionResult _AsyncTeamsB(int? TeamIdA)
        {
            DelayResponse();
            List<SelectListItem> Teams = TeamsRep.GetTeamssPerSCB((int)TeamIdA);
            return Json(Teams);
        }
      

        #endregion

        #region SportCategory
        [Authorize(Roles = "news")]
        public ActionResult SportCategory()
        {
            ViewData["SportCategoryID"] = SCRep.GetSportCategorys(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View();
        }

        [GridAction]
        public ActionResult _ListSportCategory()
        {
            //...Initialize List...
            List<SportCategory> lst = new List<SportCategory>();

            //...Populate List...
            lst = SCRep.GetListSportCategory(Convert.ToInt32(HttpContext.Session["ClientId"]));

            //...Return List to Grid...
            return View(new GridModel(lst));
        }


        [GridAction]
        public ActionResult _InsertSportCategory(SportCategory ins)
        {

            ins.ClientID = Convert.ToInt32(HttpContext.Session["ClientId"]);

            //...Insert into Database...
            SportCategory ins2 = SCRep.Insert(ins);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(ins.ClientID);
            List<string> reg = AppRep.GetAllRegIdsList(ins.ClientID);
            if (!regIds.Equals(""))
            {
                comrep.NewsyncData(regIds, "CMD_NEWSportCategory", reg, ins.ClientID);
            }

            //...Facebook...
            string access_token = FacebookPost.GetAccessToken(ins.ClientID);

            if (!access_token.Equals(""))
            {
                string page_id = FacebookPost.GetPageId(ins.ClientID);
                if (!page_id.Equals(""))
                {
                    FacebookPost.Post(access_token, page_id, "SportCategory Update: " + ins.CategoryName);
                }
            }

            //...Repopulate Grid...
            List<SportCategory> lst = new List<SportCategory>();
            lst = SCRep.GetListSportCategory(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }

        [GridAction]
        public ActionResult _UpdateSportCategory(SportCategory ins)
        {
            //...ViewData...
            ins.ClientID = Convert.ToInt32(HttpContext.Session["ClientId"]);
            SportCategory ins2 = SCRep.UpdateSport(ins);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(ins.ClientID);
            if (!regIds.Equals(""))
            {
                comrep.NewUpdateData(regIds, "CMD_EDITSportCategory", ins2.SportCategoryID.ToString());
            }

            //...Repopulate Grid...
            List<SportCategory> lst = new List<SportCategory>();
            lst = SCRep.GetListSportCategory(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _DeleteSportCategory(int id)
        {

            SportCategory ins = SCRep.GetSportCategory(id);
            bool ins2 = SCRep.Remove(id);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(Convert.ToInt32(HttpContext.Session["ClientId"]));
            if (!regIds.Equals(""))
            {
                comrep.NewUpdateData(regIds, "CMD_DELSportCategory", id.ToString());
            }

            //...Repopulate Grid...
            List<SportCategory> lst = new List<SportCategory>();
            lst = SCRep.GetListSportCategory(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }
        #endregion



        #region Fields
        [Authorize(Roles = "news")]
        public ActionResult Fields()
        {
            ViewData["SportCategoryID"] = SCRep.GetSportCategorys(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View();
        }

        [GridAction]
        public ActionResult _ListFields()
        {
            //...Initialize List...
            List<Fields> lst = new List<Fields>();

            //...Populate List...
            lst = FieldsRep.GetListFields(Convert.ToInt32(HttpContext.Session["ClientId"]));

            //...Return List to Grid...
            return View(new GridModel(lst));
        }

        
        [GridAction]
        public ActionResult _InsertFields(Fields ins)
        {
         
            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);

            //...Insert into Database...
            Fields ins2 = FieldsRep.InsertFields(ins);

            //...Notify...
            //string regIds = AppRep.GetAllRegIds(ins.ClientId);
            //List<string> reg = AppRep.GetAllRegIdsList(ins.ClientId);
            //if (!regIds.Equals(""))
            //{
            //    comrep.NewsyncData(regIds, "CMD_NEWFields", reg, ins.ClientId);
            //}

            //...Facebook...
            string access_token = FacebookPost.GetAccessToken(ins.ClientId);

            if (!access_token.Equals(""))
            {
                string page_id = FacebookPost.GetPageId(ins.ClientId);
                if (!page_id.Equals(""))
                {
                    FacebookPost.Post(access_token, page_id, "Fields Update: " + ins.FieldName);
                }
            }

            //...Repopulate Grid...
            List<Fields> lst = new List<Fields>();
            lst = FieldsRep.GetListFields(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }

        [GridAction]
        public ActionResult _UpdateFields(Fields ins)
        {
            //...ViewData...
            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);
            Fields ins2 = FieldsRep.UpdateFields(ins);

            ////...Notify...
            //string regIds = AppRep.GetAllRegIds(ins.ClientId);
            //if (!regIds.Equals(""))
            //{
            //    comrep.NewUpdateData(regIds, "CMD_EDITFields", ins2.FieldsId.ToString());
            //}

            //...Repopulate Grid...
            List<Fields> lst = new List<Fields>();
            lst = FieldsRep.GetListFields(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _DeleteFields(int id)
        {
          
            Fields ins = FieldsRep.GetFields(id);
            bool ins2 = FieldsRep.RemoveFields(id);

            ////...Notify...
            //string regIds = AppRep.GetAllRegIds(Convert.ToInt32(HttpContext.Session["ClientId"]));
            //if (!regIds.Equals(""))
            //{
            //    comrep.NewUpdateData(regIds, "CMD_DELFields", id.ToString());
            //}

            //...Repopulate Grid...
            List<Fields> lst = new List<Fields>();
            lst = FieldsRep.GetListFields(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }
#endregion

        #region Teams
        [Authorize(Roles = "news")]
        public ActionResult Teams()
        {
            ViewData["Ranks"] = TeamsRep.GetTeamRank();
            ViewData["SportCategoryID"] = SCRep.GetSportCategorys(Convert.ToInt32(HttpContext.Session["ClientId"]));
            ViewData["SchoolId"] = TeamsRep.GetSchool(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View();
        }

        [GridAction]
        public ActionResult _ListTeams()
        {
            //...Initialize List...
            List<Teams> lst = new List<Teams>();

            //...Populate List...
            lst = TeamsRep.GetListTeams(Convert.ToInt32(HttpContext.Session["ClientId"]));

            //...Return List to Grid...
            return View(new GridModel(lst));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _InsertTeams(Teams ins)
        {

            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);
            ins.Name = Convert.ToString(ins.SchoolId);
            //...Insert into Database...
            Teams ins2 = TeamsRep.InsertTeams(ins);

            //...Repopulate Grid...
            List<Teams> lst = new List<Teams>();
            lst = TeamsRep.GetListTeams(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }

        [GridAction]
        public ActionResult _UpdateTeams(Teams ins)
        {
            //...ViewData...
            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);
            ins.Name = Convert.ToString(ins.SchoolId);
            Teams ins2 = TeamsRep.UpdateTeams(ins);
            //...Repopulate Grid...
            List<Teams> lst = new List<Teams>();
            lst = TeamsRep.GetListTeams(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _DeleteTeams(int id)
        {

            Teams ins = TeamsRep.GetTeams(id);
            bool ins2 = TeamsRep.RemoveTeams(id);

            //...Repopulate Grid...
            List<Teams> lst = new List<Teams>();
            lst = TeamsRep.GetListTeams(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }

        #endregion

        #region Fixtures
        [Authorize(Roles = "news")]
        public ActionResult Fixtures()
        {
            ViewData["SportCategoryId"] = SCRep.GetSportCategorys(Convert.ToInt32(HttpContext.Session["ClientId"]));
            ViewData["TeamIdA"] = FixRep.GetTeams();
            ViewData["TeamIdB"] = FixRep.GetTeams();
            ViewData["FieldId"] = FixRep.GetFields();
            return View();
        }

        [GridAction]
        public ActionResult _ListFixtures()
        {
            //...Initialize List...
            List<Fixtures> lst = new List<Fixtures>();

            //...Populate List...
            lst = FixRep.GetListFixtures(Convert.ToInt32(HttpContext.Session["ClientId"]));

            //...Return List to Grid...
            return View(new GridModel(lst));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _InsertFixtures(Fixtures ins)
        {

            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);

            //...Insert into Database...
            Fixtures ins2 = FixRep.InsertFixtures(ins);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(ins.ClientId);
            List<string> reg = AppRep.GetAllRegIdsList(ins.ClientId);
            if (!regIds.Equals(""))
            {
                comrep.NewsyncData(regIds, "CMD_NEWFixtures", reg, ins.ClientId);
            }

            //...Facebook...
            string access_token = FacebookPost.GetAccessToken(ins.ClientId);

            if (!access_token.Equals(""))
            {
                string page_id = FacebookPost.GetPageId(ins.ClientId);
                if (!page_id.Equals(""))
                {
                    FacebookPost.Post(access_token, page_id, "Fixtures Update: " + ins.TeamIdA);
                }
            }

            //...Repopulate Grid...
            List<Fixtures> lst = new List<Fixtures>();
            lst = FixRep.GetListFixtures(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }

        [GridAction]
        public ActionResult _UpdateFixtures(Fixtures ins)
        {
            //...ViewData...
            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);
            Fixtures ins2 = FixRep.UpdateFixtures(ins);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(ins.ClientId);
            if (!regIds.Equals(""))
            {
                comrep.NewUpdateData(regIds, "CMD_EDITFixtures", ins2.FixturesId.ToString());
            }

            //...Repopulate Grid...
            List<Fixtures> lst = new List<Fixtures>();
            lst = FixRep.GetListFixtures(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _DeleteFixtures(int id)
        {

            Fixtures ins = FixRep.GetFixtures(id);
            bool ins2 = FixRep.RemoveFixtures(id);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(Convert.ToInt32(HttpContext.Session["ClientId"]));
            if (!regIds.Equals(""))
            {
                comrep.NewUpdateData(regIds, "CMD_DELFixtures", id.ToString());
            }

            //...Repopulate Grid...
            List<Fixtures> lst = new List<Fixtures>();
            lst = FixRep.GetListFixtures(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }
        #endregion

        #region Results
        [Authorize(Roles = "news")]
        public ActionResult Results()
        {
            ViewData["SportCategoryId"] = SCRep.GetSportCategorys(Convert.ToInt32(HttpContext.Session["ClientId"]));


            return View();
        }

        [GridAction]
        public ActionResult _ListResults()
        {
            //...Initialize List...
            List<Results> lst = new List<Results>();

            //...Populate List...
            lst = ResRep.GetListResults(Convert.ToInt32(HttpContext.Session["ClientId"]));

            //...Return List to Grid...
            return View(new GridModel(lst));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _InsertResults(Results ins)
        {

            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);

            //...Insert into Database...
            if(ins.Comentry == null)
            {
                ins.Comentry = "No Commentry";
            }
            Results ins2 = ResRep.InsertResults(ins);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(ins.ClientId);
            List<string> reg = AppRep.GetAllRegIdsList(ins.ClientId);
            if (!regIds.Equals(""))
            {
               // comrep.NewUpdateData(regIds, "CMD_NEWResultWithID", ins2.ResultsId.ToString());
                comrep.NewsyncData(regIds, "CMD_NEWResults", reg, ins.ClientId);                
            }

            //...Facebook...
            string access_token = FacebookPost.GetAccessToken(ins.ClientId);

            if (!access_token.Equals(""))
            {
                string page_id = FacebookPost.GetPageId(ins.ClientId);
                if (!page_id.Equals(""))
                {
                    FacebookPost.Post(access_token, page_id, "Results Update: " + ins.Comentry);
                }
            }

            //...Repopulate Grid...
            List<Results> lst = new List<Results>();
            lst = ResRep.GetListResults(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }

        [GridAction]
        public ActionResult _UpdateResults(Results ins)
        {
            //...ViewData...
            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);
            Results o = ResRep.GetResults(ins.ResultsId);
            Results ins2 = ResRep.UpdateResults(ins,o.FixturesID);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(ins.ClientId);
            if (!regIds.Equals(""))
            {
                comrep.NewUpdateData(regIds, "CMD_EDITResults", ins2.ResultsId.ToString());
            }

            //...Repopulate Grid...
            List<Results> lst = new List<Results>();
            lst = ResRep.GetListResults(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _DeleteResults(int id)
        {

            Results ins = ResRep.GetResults(id);
            bool ins2 = ResRep.RemoveResults(id);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(Convert.ToInt32(HttpContext.Session["ClientId"]));
            if (!regIds.Equals(""))
            {
                comrep.NewUpdateData(regIds, "CMD_DELResults", id.ToString());
            }

            //...Repopulate Grid...
            List<Results> lst = new List<Results>();
            lst = ResRep.GetListResults(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }
        #endregion

        #region Schools
        [Authorize(Roles = "news")]
        public ActionResult Schools()
        {

            return View();
        }

        [GridAction]
        public ActionResult _ListSchools()
        {
            //...Initialize List...
            List<Schoolsc> lst = new List<Schoolsc>();

            //...Populate List...
            lst = SchRep.GetListSchools(Convert.ToInt32(HttpContext.Session["ClientId"]));

            //...Return List to Grid...
            return View(new GridModel(lst));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _InsertSchools(Schoolsc ins)
        {

            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);

            //...Insert into Database...
            Schoolsc ins2 = SchRep.InsertSchools(ins);
            //...Notify...
            string regIds = AppRep.GetAllRegIds(ins.ClientId);
            List<string> reg = AppRep.GetAllRegIdsList(ins.ClientId);
            if (!regIds.Equals(""))
            {
                comrep.NewsyncData(regIds, "CMD_NEWSchools", reg, ins.ClientId);
            }

            //...Facebook...
            string access_token = FacebookPost.GetAccessToken(ins.ClientId);

            if (!access_token.Equals(""))
            {
                string page_id = FacebookPost.GetPageId(ins.ClientId);
                if (!page_id.Equals(""))
                {
                    FacebookPost.Post(access_token, page_id, "Schools Update: " + ins.SchoolName);
                }
            }
            //...Repopulate Grid...
            List<Schoolsc> lst = new List<Schoolsc>();
            lst = SchRep.GetListSchools(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }

        [GridAction]
        public ActionResult _UpdateSchools(Schoolsc ins)
        {
            //...ViewData...
            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);
            Schoolsc ins2 = SchRep.UpdateSchools(ins);
            //...Notify...
            string regIds = AppRep.GetAllRegIds(ins.ClientId);
            if (!regIds.Equals(""))
            {
                comrep.NewUpdateData(regIds, "CMD_EDITSchools", ins2.SchoolId.ToString());
            }

   
            //...Repopulate Grid...
            List<Schoolsc> lst = new List<Schoolsc>();
            lst = SchRep.GetListSchools(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _DeleteSchools(int id)
        {

            Schoolsc ins = SchRep.GetSchools(id);
            bool ins2 = SchRep.RemoveSchools(id);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(Convert.ToInt32(HttpContext.Session["ClientId"]));
            if (!regIds.Equals(""))
            {
                comrep.NewUpdateData(regIds, "CMD_DELSchools", id.ToString());
            }

            //...Repopulate Grid...
            List<Schoolsc> lst = new List<Schoolsc>();
            lst = SchRep.GetListSchools(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }

        #endregion


        ReportRepository reportRep = new ReportRepository();

        public ActionResult FixturesReport()
        {
            ViewData["SportCategoryID"] = reportRep.GetSportCategorys(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View();
        }

        [HttpPost]
        public ActionResult GetFixtureReport(SportCategoryID SC)
        {



            List<FixturesReport> report = reportRep.GetFixtureReport(SC.SportCategory, SC.Date.Date);
            SportCategoryRepository screp = new SportCategoryRepository();
            StringWriter sw = new StringWriter();
            sw.WriteLine("\"StartTime\",\"TeamA\",\"TeamsB\",\"Field\",\"FixtureId\"");

            string name = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString();

            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment;filename=Fixture" + "_" + name + ".csv");
            Response.ContentType = "text/csv";

            sw.WriteLine("\"Fixtures\"");
            sw.WriteLine(SC.SportCategory);
            sw.WriteLine(SC.Date.Date);

            foreach (FixturesReport ex in report)
            {
                sw.WriteLine(string.Format("\"{0}\",\"{1}\",\"{2}\",\"{3}\",\"{4}\""
                                      , ex.StartTime
                                      , ex.TeamIdA
                                      , ex.TeamIdB
                                      , ex.Field
                                      , ex.FixturesId
                                      ));
            }




            Response.Write(sw.ToString());
            Response.End();
            return null;
        }

        public ActionResult ResultsReport()
        {
            ViewData["SportCategoryID"] = reportRep.GetSportCategorys(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View();
        }
        public ActionResult GetResultsReport(SportCategoryID SC)
        {



            List<ResultsReport> report = reportRep.GetResultsReport(SC.SportCategory, SC.Date.Date);
            SportCategoryRepository screp = new SportCategoryRepository();
            StringWriter sw = new StringWriter();
            sw.WriteLine("\"StartTime\",\"TeamA\",\"PointsA\",\"TeamsB\",\"PointsB\",\"FixtureId\"");

            string name = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString();

            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment;filename=Results" + "_" + name + ".csv");
            Response.ContentType = "text/csv";

            sw.WriteLine("\"Results\"");
            sw.WriteLine(SC.SportCategory);
            sw.WriteLine(SC.Date.Date);

            foreach (ResultsReport ex in report)
            {
                sw.WriteLine(string.Format("\"{0}\",\"{1}\",\"{2}\",\"{3}\",\"{4}\",\"{5}\""
                                      , ex.StartTime
                                      , ex.TeamIdA
                                      , ex.PointsA
                                      , ex.TeamIdB
                                      , ex.PointsB
                                      , ex.FixturesId
                                      ));
            }




            Response.Write(sw.ToString());
            Response.End();
            return null;
        }
    }
}
