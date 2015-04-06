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
    public class ReportsController : Controller
    {
        //
        // GET: /Reports/
        ReportRepository reportRep = new ReportRepository();
    
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult GetFixturesReport(int FixtureId, DateTime ReportDate)
        {
            FixturesReport query = new FixturesReport();
            query.FixturesId = FixtureId;
            query.ReportDate = ReportDate;

            FixturesReport report = reportRep.GetFixtureReport(query);

            return new Rotativa.ViewAsPdf("CashierReportPDF", report);
        }
    }
}
