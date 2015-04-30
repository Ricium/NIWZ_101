using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Netintercom.Models
{
    public class ReportRepository
    {
        public List<FixturesReport> GetFixtureReport(int SportCategoryId , DateTime odate)
        {
            FixturesRepository Fixrep = new FixturesRepository();

            //...Create New Instance of Object...
            List<FixturesReport> list = new List<FixturesReport>();
            FixturesReport ins;

            int Y = odate.Year;
            int M = odate.Month;
            int d = odate.Day;

           // DateTime date = Convert.ToDateTime((Y) + "/" + (M) + "/" + (d));
            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = new SqlCommand();
            cmdI.CommandTimeout = 540;
            cmdI.Connection = con;
            cmdI.CommandText = "f_Admin_Report_Fixtures";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@SportCategoryID", SportCategoryId);
            cmdI.Parameters.AddWithValue("@Date", odate);

            cmdI.Connection.Open();

            
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new FixturesReport();
                    ins.StartTime = Convert.ToDateTime(drI["StartTime"]).ToLongDateString();
                    ins.TeamIdA = drI["HomeTeam"].ToString()+" "+drI["AgeA"].ToString()+"/"+drI["RanksA"].ToString()+" VS ";
                    ins.TeamIdB = drI["AwayTeam"].ToString() + " " + drI["AgeB"].ToString() + "/" + drI["RanksB"].ToString();
                    ins.Field = drI["FieldName"].ToString();
                    ins.SportCategory = drI["CategoryName"].ToString();
                    ins.ReportDate = DateTime.Now;
      
                    list.Add(ins);
                }
            }

            //...Close Connections...
            cmdI.Connection.Close();
            con.Dispose();

            //...Return...
            return list;
        }

        public List<ResultsReport> GetResultsReport(int SportCategoryId, DateTime odate)
        {
            ResultsReport Fixrep = new ResultsReport();

            //...Create New Instance of Object...
            List<ResultsReport> list = new List<ResultsReport>();
            ResultsReport ins;

            int Y = odate.Year;
            int M = odate.Month;
            int d = odate.Day;

            // DateTime date = Convert.ToDateTime((Y) + "/" + (M) + "/" + (d));
            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = new SqlCommand();
            cmdI.CommandTimeout = 540;
            cmdI.Connection = con;
            cmdI.CommandText = "[f_Admin_Report_Results]";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@SportCategoryID", SportCategoryId);
            cmdI.Parameters.AddWithValue("@Date", odate);

            cmdI.Connection.Open();


            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new ResultsReport();
                    ins.ResultId = drI["ResultsId"].ToString();
                    ins.FixturesId = drI["FixtureId"].ToString();
                    ins.TeamIdA = drI["teamA"].ToString() + " " + drI["AgeA"].ToString() + "/" + drI["RankA"].ToString();
                    ins.TeamIdB = drI["teamB"].ToString() + " " + drI["AgeB"].ToString() + "/" + drI["RankB"].ToString();
                    ins.fixtures = ins.TeamIdA + " VS " + ins.TeamIdB;
                    ins.PointsA = drI["PointsA"].ToString();
                    ins.PointsB = drI["PointsB"].ToString();
                    ins.TimeInMatch = drI["TimeInMatch"].ToString();
                    ins.ReportDate = DateTime.Now;

                    list.Add(ins);
                }
            }

            //...Close Connections...
            cmdI.Connection.Close();
            con.Dispose();

            //...Return...
            return list;
        }

        public List<SelectListItem> GetSportCategorys(int ClientId)
        {
            List<SelectListItem> obj = new List<SelectListItem>();

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = new SqlCommand("SELECT * FROM SportCategory where ClientId='" + ClientId + "' ", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    var result = new SelectListItem();
                    result.Text = drI["CategoryName"].ToString();
                    result.Value = drI["SportCategoryId"].ToString();
                    obj.Add(result);
                }
            }
            drI.Close();
            con.Close();
            con.Dispose();

            return obj;
        }
    }
}