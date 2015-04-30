using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Netintercom.Models;
using Telerik.Web.Mvc;
using System.IO;
using Telerik.Web.Mvc.Extensions;
using System.Data.OleDb;
using System.Text;
using System.Data;

using System.Globalization;

namespace Netintercom.Controllers
{
    
    public class Reports2Controller : Controller
    {
        //
        // GET: /Reports/
        ReportRepository reportRep = new ReportRepository();

        [Authorize(Roles = "news")]
        public ActionResult FixturesReport()
        {
            ViewData["SportCategoryID"] = reportRep.GetSportCategorys(Convert.ToInt32(HttpContext.Session["ClientId"]));
            return View();
        }

        [HttpPost]
        public ActionResult GetFixtureReport(SportCategoryID SC)
        {
            

       
            List<FixturesReport> report = reportRep.GetFixtureReport(SC.SportCategory,SC.Date.Date);
            SportCategoryRepository screp = new SportCategoryRepository();
            StringWriter sw = new StringWriter();
            sw.WriteLine("\"StartTime\",\"TeamA\",\"TeamsB\",\"Field\",\"FixtureId\",");

            string name = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString();
            
            Response.ClearContent();
            Response.AddHeader("content-disposition", "attachment;filename=Fixture" + "_" + name + ".csv");
            Response.ContentType = "text/csv";

            sw.WriteLine("\"Fixtures\"");
            sw.WriteLine(SC.SportCategory);
            sw.WriteLine(SC.Date.Date);

            foreach (FixturesReport ex in report)
            {
                sw.WriteLine(string.Format("\"{0}\",\"{1}\",\"{2}\",\"{3}\",\"{4}\","
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
    }
}
