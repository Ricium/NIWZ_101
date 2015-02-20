using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mvc;
namespace Netintercom.Models
{
    public class TeamsRepository
    {
        public Teams GetTeams(int TeamsId)
        {
            Teams ins = new Teams();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Teams WHERE TeamsId =" + TeamsId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.TeamsId = Convert.ToInt32(drI["TeamsId"]);
                    ins.Name = drI["Name"].ToString();
                    ins.Age = drI["Age"].ToString();
                    ins.Ranks = drI["Ranks"].ToString();
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);

                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public Teams InsertTeams(Teams ins)
        {
            //...Get User and Date Data...
            string strTrx = "Insert_Teams";

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
                cmdI.CommandText = "f_Admin_Insert_Teams";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
                cmdI.Parameters.AddWithValue("@Name", ins.Name);
                cmdI.Parameters.AddWithValue("@Age", ins.Age);
                cmdI.Parameters.AddWithValue("@Ranks", ins.Ranks);

                //...Return new ID...
                ins.TeamsId = (int)cmdI.ExecuteScalar();

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

        public Teams UpdateTeams(Teams ins)
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
            cmdI.CommandText = "f_Admin_Update_Teams";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@TeamsId", ins.TeamsId);
            cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
            cmdI.Parameters.AddWithValue("@Name", ins.Name);
            cmdI.Parameters.AddWithValue("@Age", ins.Age);
            cmdI.Parameters.AddWithValue("@Ranks", ins.Ranks);
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public List<Teams> GetListTeams()
        {
            List<Teams> list = new List<Teams>();
            Teams ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Teams", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Teams();
                    ins.TeamsId = Convert.ToInt32(drI["TeamsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.Name = drI["Name"].ToString();
                    ins.Age = drI["Age"].ToString();
                    ins.Ranks = drI["Ranks"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<Teams> GetListTeams(int ClientId)
        {
            List<Teams> list = new List<Teams>();
            Teams ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Teams WHERE ClientId = " + ClientId + " ORDER BY TeamsId DESC", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Teams();
                    ins.TeamsId = Convert.ToInt32(drI["TeamsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.Name = drI["Name"].ToString();
                    ins.Age = drI["Age"].ToString();
                    ins.Ranks = drI["Ranks"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();


            return list;
        }

        public bool RemoveTeams(int TeamsId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Teams";

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
                cmdI.CommandText = "f_Admin_Remove_Teams";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@TeamsId", TeamsId);        // int

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

        public bool RemoveSchoolTeamss(int ClientId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Teams";

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
                cmdI.CommandText = "f_Admin_Remove_Teams_Per_School";
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


        public List<SelectListItem> GetTeamRank()
        {
            List<SelectListItem> obj = new List<SelectListItem>();

            var result1 = new SelectListItem();
            result1.Text = "A";
            result1.Value = "0";
            result1.Selected = true;
            obj.Add(result1);

            var result2 = new SelectListItem();
            result2.Text = "B";
            result2.Value = "1";
            obj.Add(result2);

            var result3 = new SelectListItem();
            result3.Text = "C";
            result3.Value = "2";
            obj.Add(result3);

            var result4 = new SelectListItem();
            result4.Text = "D";
            result4.Value = "3";
            obj.Add(result4);

            var result5 = new SelectListItem();
            result5.Text = "E";
            result5.Value = "4";
            obj.Add(result5);

            var result6 = new SelectListItem();
            result6.Text = "F";
            result6.Value = "5";
            obj.Add(result6);

            var result7 = new SelectListItem();
            result7.Text = "G";
            result7.Value = "6";
            obj.Add(result7);

            var result8 = new SelectListItem();
            result8.Text = "H";
            result8.Value = "7";
            obj.Add(result8);

            var result9 = new SelectListItem();
            result9.Text = "I";
            result9.Value = "8";
            obj.Add(result9);

            var result10 = new SelectListItem();
            result10.Text = "J";
            result10.Value = "9";
            obj.Add(result10);

            var result11 = new SelectListItem();
            result11.Text = "K";
            result11.Value = "10";
            obj.Add(result11);

            var result12 = new SelectListItem();
            result12.Text = "L";
            result12.Value = "11";
            obj.Add(result12);

            var result13 = new SelectListItem();
            result13.Text = "M";
            result13.Value = "12";
            obj.Add(result13);

            var result14 = new SelectListItem();
            result14.Text = "N";
            result14.Value = "13";
            obj.Add(result14);

            var result15 = new SelectListItem();
            result15.Text = "O";
            result15.Value = "14";
            obj.Add(result15);

            var result16 = new SelectListItem();
            result16.Text = "P";
            result16.Value = "15";
            obj.Add(result16);

            var result17 = new SelectListItem();
            result17.Text = "Q";
            result17.Value = "16";
            obj.Add(result17);

            var result18 = new SelectListItem();
            result18.Text = "R";
            result18.Value = "17";
            obj.Add(result18);

            var result19 = new SelectListItem();
            result19.Text = "S";
            result19.Value = "18";
            obj.Add(result19);

            var result20 = new SelectListItem();
            result20.Text = "T";
            result20.Value = "19";
            obj.Add(result20);

            var result21 = new SelectListItem();
            result21.Text = "U";
            result21.Value = "20";
            obj.Add(result21);

            var result22 = new SelectListItem();
            result22.Text = "V";
            result22.Value = "21";
            obj.Add(result22);

            var result23 = new SelectListItem();
            result23.Text = "W";
            result23.Value = "22";
            obj.Add(result23);

            var result24 = new SelectListItem();
            result24.Text = "X";
            result24.Value = "23";
            obj.Add(result24);

            var result25 = new SelectListItem();
            result25.Text = "Y";
            result25.Value = "24";
            obj.Add(result25);

            var result26 = new SelectListItem();
            result26.Text = "Z";
            result26.Value = "25";
            obj.Add(result26);
            return obj;
        }

           }
}