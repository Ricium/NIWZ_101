using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mvc;

namespace Netintercom.Models
{
    public class ResultsRepository
    {
        public Results GetResults(int ResultsId)
        {
            Results ins = new Results();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Results WHERE ResultsId =" + ResultsId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.ResultsId = Convert.ToInt32(drI["ResultsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.FixturesID = Convert.ToInt32(drI["FixtureId"]);
                    ins.PointsA = drI["PointsA"].ToString();
                    ins.PointsB = drI["PointsB"].ToString();
                    ins.TimeInMatch = drI["TimeInMatch"].ToString();
                    ins.Comentry = drI["Comentry"].ToString();

                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public Results InsertResults(Results ins)
        {
            //...Get User and Date Data...
            string strTrx = "Insert_Results";

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();

            //...Command Interface...
            SqlCommand cmdI = con.CreateCommand();
            SqlTransaction trx;
            trx = con.BeginTransaction(strTrx);
            cmdI.Connection = con;
            cmdI.Transaction = trx;

            try
            {
                //...Insert Picture...

                //...Insert Record...
                cmdI.Parameters.Clear();
                cmdI.CommandText = "f_Admin_Insert_Results";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
                cmdI.Parameters.AddWithValue("@PointsA", ins.PointsA);
                cmdI.Parameters.AddWithValue("@PointsB", ins.PointsB);
                cmdI.Parameters.AddWithValue("@FixtrureId", ins.FixturesID);
                cmdI.Parameters.AddWithValue("@Comentry", ins.Comentry);
                cmdI.Parameters.AddWithValue("@TimeInMatch", ins.TimeInMatch);

                //...Return new ID...
                ins.ResultsId = (int)cmdI.ExecuteScalar();

                //...Commit Transaction...
                trx.Commit();
                cmdI.Connection.Close();
            }
            catch (SqlException ex)
            {
                if (trx != null) trx.Rollback();
                //...Save Error to Log...
                Functions func = new Functions();
                func.LogError(ex.ToString());
            }
            finally
            {
                //...Check for close and respond accordingly..
                if (con.State != ConnectionState.Closed)
                {
                    con.Close();
                }

                //...Clean up...
                con.Dispose();
                cmdI.Dispose();
                trx.Dispose();
            }

            return ins;
        }

        public Results UpdateResults(Results ins)
        {
            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            //...Update Picture...

            //...Update Record...
            cmdI.Parameters.Clear();
            cmdI.CommandText = "f_Admin_Update_Results";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@ResultsId", ins.ResultsId);
            cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
            cmdI.Parameters.AddWithValue("@PointsA", ins.PointsA);
            cmdI.Parameters.AddWithValue("@PointsB", ins.PointsB);
            cmdI.Parameters.AddWithValue("@FixturesID", ins.FixturesID);
            cmdI.Parameters.AddWithValue("@Comentry", ins.Comentry);
            cmdI.Parameters.AddWithValue("@TimeInMatch", ins.TimeInMatch);
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public List<Results> GetListResults()
        {
            List<Results> list = new List<Results>();
            Results ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT r.*,f.*,t.Name as teamA,tb.Name as teamB,fl.FieldName FROM Results r inner join fixtures f on r.FixtureId = f.FieldsId inner join Teams t on f.TeamIdA = t.TeamsId inner join Teams tb on f.TeamIdB =tb.TeamsId inner join Fields fl on f.FieldsId =fl.FieldsId", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Results();
                    ins.ResultsId = Convert.ToInt32(drI["ResultsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.FixturesID = Convert.ToInt32(drI["Fixtures"]);
                    ins.fixtures = drI["teamA"].ToString()+" "+drI["PiontsA"].ToString() + " VS " + drI["teamB"].ToString()+" "+drI["PointsB"].ToString();
                    ins.field = drI["FieldName"].ToString();
                    ins.PointsA = drI["PointsA"].ToString();
                    ins.PointsB = drI["PointsB"].ToString();
                    ins.TimeInMatch = drI["TimeInMatch"].ToString();
                    ins.Comentry = drI["Comentry"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<Results> GetListResults(int ClientId)
        {
            List<Results> list = new List<Results>();
            Results ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("select r.*,t.Name as HomeTeam,tb.Name as AwayTeam,fd.FieldName  from Results r inner join fixtures f on r.FixtureId = f.FixturesId inner join Teams t on f.TeamIdA = t.TeamsId inner join Teams tb on f.TeamIdB = tb.TeamsId inner join Fields fd on f.FieldsId = fd.FieldsId where r.ClientId ='" + ClientId + "' ORDER BY ResultsId DESC", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Results();
                    ins.ResultsId = Convert.ToInt32(drI["ResultsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.fixtures = drI["HomeTeam"].ToString() + " VS " + drI["AwayTeam"].ToString();
                    ins.TeamA = drI["HomeTeam"].ToString();
                    ins.TeamB = drI["AwayTeam"].ToString();
                    ins.field = drI["FieldName"].ToString();
                    ins.PointsA = drI["PointsA"].ToString();
                    ins.PointsB = drI["PointsB"].ToString();
                    ins.TimeInMatch = drI["TimeInMatch"].ToString();
                    ins.Comentry = drI["Comentry"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();


            return list;
        }

        public bool RemoveResults(int ResultsId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Results";

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();

            //...Command Interface...
            SqlCommand cmdI = con.CreateCommand();
            SqlTransaction trx;
            trx = con.BeginTransaction(strTrx);
            cmdI.Connection = con;
            cmdI.Transaction = trx;

            try
            {
                //...Insert Record...
                cmdI.Parameters.Clear();
                cmdI.CommandText = "f_Admin_Remove_Results";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@ResultsId", ResultsId);        // int

                //...Return new ID...
                int ret = (int)cmdI.ExecuteScalar();

                //...Commit Transaction...
                trx.Commit();
                cmdI.Connection.Close();
            }
            catch (SqlException ex)
            {
                if (trx != null)
                {
                    trx.Rollback();
                    Removed = false;
                }
                //...Save Error to Log...
                Functions func = new Functions();
                func.LogError(ex.ToString());
            }
            finally
            {
                //...Check for close and respond accordingly..
                if (con.State != ConnectionState.Closed)
                {
                    con.Close();
                }

                //...Clean up...
                con.Dispose();
                cmdI.Dispose();
                trx.Dispose();
            }

            return Removed;
        }

        public bool RemoveSchoolResultss(int ClientId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Results";

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();

            //...Command Interface...
            SqlCommand cmdI = con.CreateCommand();
            SqlTransaction trx;
            trx = con.BeginTransaction(strTrx);
            cmdI.Connection = con;
            cmdI.Transaction = trx;

            try
            {
                //...Insert Record...
                cmdI.Parameters.Clear();
                cmdI.CommandText = "f_Admin_Remove_Results_Per_School";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@ClientId", ClientId);        // int

                //...Return new ID...
                int ret = (int)cmdI.ExecuteScalar();

                //...Commit Transaction...
                trx.Commit();
                cmdI.Connection.Close();
            }
            catch (SqlException ex)
            {
                if (trx != null)
                {
                    trx.Rollback();
                    Removed = false;
                }
                //...Save Error to Log...
                Functions func = new Functions();
                func.LogError(ex.ToString());
            }
            finally
            {
                //...Check for close and respond accordingly..
                if (con.State != ConnectionState.Closed)
                {
                    con.Close();
                }

                //...Clean up...
                con.Dispose();
                cmdI.Dispose();
                trx.Dispose();
            }

            return Removed;
        }

        public List<SelectListItem> GetFixtures()
        {
            List<SelectListItem> obj = new List<SelectListItem>();

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = new SqlCommand("select f.*,t.Name as teamA,tb.Name as teamB from fixtures f inner join Teams t on f.TeamIdA = t.TeamsId inner join Teams tb on f.TeamIdB=tb.TeamsId where f.FixturesId not in (select FixtureId from Results) ", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    var result = new SelectListItem();
                    result.Text = drI["teamA"].ToString() + " VS " + drI["teamB"].ToString()+ " "+drI["StartTime"].ToString();
                    result.Value = drI["FixturesId"].ToString();
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