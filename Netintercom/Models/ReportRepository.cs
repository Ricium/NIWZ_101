using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Netintercom.Models
{
    public class ReportRepository
    {
        public FixturesReport GetFixtureReport(FixturesReport query)
        {
            #region Repositories
            FixturesRepository Fix = new FixturesRepository();
            #endregion

            //...Get All Details
            FixturesReport report = new FixturesReport();
            report.ReportDate = query.ReportDate;
            report = Fix.GetListFixtures(query.ClientId);

            return report;
        }
    }
}