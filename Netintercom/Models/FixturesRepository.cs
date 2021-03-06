﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mvc;

namespace Netintercom.Models
{
    public class FixturesRepository
    {
        public Fixtures GetFixtures(int FixturesId)
        {
            Fixtures ins = new Fixtures();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM fixtures WHERE FixturesId =" + FixturesId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.FixturesId = Convert.ToInt32(drI["FixturesId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.TeamIdA = Convert.ToInt32(drI["TeamIdA"]);
                    ins.TeamIdB = Convert.ToInt32(drI["TeamIdB"]);
                    ins.StartTime = Convert.ToDateTime(drI["StartTime"]);
                    ins.FieldId = Convert.ToInt32(drI["FieldsId"]);
                    ins.SportCategoryId = Convert.ToInt32(drI["SportCategoryId"]);

                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public Fixtures InsertFixtures(Fixtures ins)
        {
            //...Get User and Date Data...
            string strTrx = "Insert_Fixtures";

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
                cmdI.CommandText = "f_Admin_Insert_Fixtures";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
                cmdI.Parameters.AddWithValue("@TeamIdA", ins.TeamIdA);
                cmdI.Parameters.AddWithValue("@TeamIdB", ins.TeamIdB);
                cmdI.Parameters.AddWithValue("@StartTime", ins.StartTime);
                cmdI.Parameters.AddWithValue("@FieldsId", ins.FieldId);
                cmdI.Parameters.AddWithValue("@SportCategoryId", ins.SportCategoryId);
                //...Return new ID...
                ins.FixturesId = (int)cmdI.ExecuteScalar();

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

        public Fixtures UpdateFixtures(Fixtures ins)
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
            cmdI.CommandText = "f_Admin_Update_Fixtures";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@FixturesId", ins.FixturesId);
            cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
            cmdI.Parameters.AddWithValue("@TeamIdA", ins.TeamIdA);
            cmdI.Parameters.AddWithValue("@TeamIdB", ins.TeamIdB);
            cmdI.Parameters.AddWithValue("@StartTime", ins.StartTime);
            cmdI.Parameters.AddWithValue("@FieldsId", ins.FieldId);
            cmdI.Parameters.AddWithValue("@SportCategoryId", ins.SportCategoryId);
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public List<Fixtures> GetListFixtures()
        {
            List<Fixtures> list = new List<Fixtures>();
            Fixtures ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT f.*,fd.FieldName,t.Name,sc.CategoryName as HomeTeam,tb.Name as AwayTeam FROM fixtures f inner join Fields fd on f.FieldsId = fd.FieldsId inner join Teams t on f.TeamIdA = t.TeamsId inner join Teams tb on f.TeamIdB =tb.TeamsId inner join SportCategory sc on f.SportCategoryId =sc.SportCategoryId", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Fixtures();
                    ins.FixturesId = Convert.ToInt32(drI["FixturesId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.TeamIdA = Convert.ToInt32(drI["TeamIdA"]);
                    ins.hometeam = drI["HomeTeam"].ToString();
                    ins.awayteam = drI["AwayTeam"].ToString();
                    ins.TeamIdB = Convert.ToInt32(drI["TeamIdB"]);
                    ins.StartTime = Convert.ToDateTime(drI["StartTime"]);
                    ins.FieldId = Convert.ToInt32(drI["FieldsId"]);
                    ins.field = drI["FieldName"].ToString();
                    ins.SportCategoryId = Convert.ToInt32(drI["SportCategoryId"]);
                    ins.sportcategory = drI["CategoryName"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<Fixtures> GetListFixtures(int ClientId)
        {
            List<Fixtures> list = new List<Fixtures>();
            Fixtures ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT f.*,fd.FieldName,t.Age as AgeA,tb.Age as AgeB,t.Ranks as RankA,tb.Ranks as RankB,sh.Schoolabbreviation as HomeTeam,shb.Schoolabbreviation as AwayTeam,sc.CategoryName FROM fixtures f inner join Fields fd on f.FieldsId = fd.FieldsId inner join Teams t on f.TeamIdA = t.TeamsId inner join Teams tb on f.TeamIdB =tb.TeamsId inner join SportCategory sc on f.SportCategoryId =sc.SportCategoryId inner join Schools sh on t.SchoolId= sh.SchoolId inner join Schools shb on tb.SchoolId = shb.SchoolId WHERE f.FixturesId not in (select FixtureId from Results) and  f.ClientId = " + ClientId + " ORDER BY f.FixturesId DESC", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Fixtures();
                    ins.FixturesId = Convert.ToInt32(drI["FixturesId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.TeamIdA = Convert.ToInt32(drI["TeamIdA"]);
                    ins.hometeam = drI["HomeTeam"].ToString()+" "+drI["AgeA"].ToString()+"/"+drI["RankA"].ToString();
                    ins.awayteam = drI["AwayTeam"].ToString() + " " + drI["AgeB"].ToString() + "/" + drI["RankB"].ToString();
                    ins.TeamIdB = Convert.ToInt32(drI["TeamIdB"]);
                    ins.StartTime = Convert.ToDateTime(drI["StartTime"]);
                    ins.FieldId = Convert.ToInt32(drI["FieldsId"]);
                    ins.field = drI["FieldName"].ToString();
                    ins.SportCategoryId = Convert.ToInt32(drI["SportCategoryId"]);
                    ins.sportcategory = drI["CategoryName"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();


            return list;
        }

        public bool RemoveFixtures(int FixturesId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Fixtures";

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
                cmdI.CommandText = "f_Admin_Remove_Fixtures";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@FixturesId", FixturesId);        // int

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

        public bool RemoveSchoolFixturess(int ClientId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Fixtures";

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
                cmdI.CommandText = "f_Admin_Remove_Fixtures_Per_School";
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

        public List<SelectListItem> GetTeams()
        {
            List<SelectListItem> obj = new List<SelectListItem>();

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = new SqlCommand("SELECT t.*,s.* FROM Teams t inner join Schools s on t.SchoolId = s.SchoolId ", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    var result = new SelectListItem();
                    result.Text = drI["Schoolabbreviation"].ToString() + " " + drI["Age"].ToString() + "/" + drI["Ranks"].ToString();
                    result.Value = drI["TeamsId"].ToString();
                    obj.Add(result);
                }
            }
            drI.Close();
            con.Close();
            con.Dispose();

            return obj;
        }

        public List<SelectListItem> GetFields()
        {
            List<SelectListItem> obj = new List<SelectListItem>();

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = new SqlCommand("SELECT * FROM Fields ", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    var result = new SelectListItem();
                    result.Text = drI["FieldName"].ToString();
                    result.Value = drI["FieldsId"].ToString();
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