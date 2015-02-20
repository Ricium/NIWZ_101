﻿using System;
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
        private AppRequestRepository AppRep = new AppRequestRepository();
        private CommunicationRepository comrep = new CommunicationRepository();
        private Functions func = new Functions();
       
        #endregion

        #region Fields
        [Authorize(Roles = "fields")]
        public ActionResult Fields()
        {
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

        [AcceptVerbs(HttpVerbs.Post)]
        [GridAction]
        public ActionResult _InsertFields(Fields ins)
        {
         
            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);

            //...Insert into Database...
            Fields ins2 = FieldsRep.InsertFields(ins);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(ins.ClientId);
            List<string> reg = AppRep.GetAllRegIdsList(ins.ClientId);
            if (!regIds.Equals(""))
            {
                comrep.NewsyncData(regIds, "CMD_NEWFields", reg, ins.ClientId);
            }

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

            //...Notify...
            string regIds = AppRep.GetAllRegIds(ins.ClientId);
            if (!regIds.Equals(""))
            {
                comrep.NewUpdateData(regIds, "CMD_EDITFields", ins2.FieldsId.ToString());
            }

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

            //...Notify...
            string regIds = AppRep.GetAllRegIds(Convert.ToInt32(HttpContext.Session["ClientId"]));
            if (!regIds.Equals(""))
            {
                comrep.NewUpdateData(regIds, "CMD_DELFields", id.ToString());
            }

            //...Repopulate Grid...
            List<Fields> lst = new List<Fields>();
            lst = FieldsRep.GetListFields(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View(new GridModel(lst));
        }
#endregion

        #region Teams
        [Authorize(Roles = "teams")]
        public ActionResult Teams()
        {
            ViewData["Teams"] = TeamsRep.GetTeamRank();
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
        public ActionResult _InsertTeamss(Teams ins)
        {

            ins.ClientId = Convert.ToInt32(HttpContext.Session["ClientId"]);

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
        [Authorize(Roles = "fixtures")]
        public ActionResult Fixtures()
        {
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
        public ActionResult _InsertFields(Fixtures ins)
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
        [Authorize(Roles = "results")]
        public ActionResult Results()
        {
            ViewData["FixturesId"] = ResRep.GetFixtures();
        
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
            Results ins2 = ResRep.InsertResults(ins);

            //...Notify...
            string regIds = AppRep.GetAllRegIds(ins.ClientId);
            List<string> reg = AppRep.GetAllRegIdsList(ins.ClientId);
            if (!regIds.Equals(""))
            {
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
            Results ins2 = ResRep.UpdateResults(ins);

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
    }
}