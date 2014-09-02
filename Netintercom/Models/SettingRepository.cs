using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Netintercom.Models
{
    public class SettingRepository
    {
        public Settings GetSetting(int id)
        {
            Settings ins = new Settings();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Settings WHERE SettingId =" + id, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.SettingId = Convert.ToInt32(drI["SettingId"]);
                    ins.Setting = drI["Setting"].ToString();
                    ins.Value = drI["Value"].ToString();
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public List<Settings> GetSettings()
        {
            ClientRepository clientrep = new ClientRepository();
            List<Settings> lsSettingsList = new List<Settings>();
            Settings ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Settings", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Settings();
                    ins.SettingId = Convert.ToInt32(drI["SettingId"]);
                    ins.Setting = drI["Setting"].ToString();
                    ins.Value = drI["Value"].ToString();
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    lsSettingsList.Add(ins);
                }
            }

            foreach (Settings setting in lsSettingsList)
            {
                setting.ClientName = clientrep.GetClient(setting.ClientId).Name;
            }


            drI.Close();
            con.Close();

            return lsSettingsList;
        }

        public List<Settings> GetSettings(int ClientId)
        {
            ClientRepository clientrep = new ClientRepository();
            List<Settings> lsSettingsList = new List<Settings>();
            Settings ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Settings WHERE ClientId=" + ClientId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Settings();
                    ins.SettingId = Convert.ToInt32(drI["SettingId"]);
                    ins.Setting = drI["Setting"].ToString();
                    ins.Value = drI["Value"].ToString();
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    lsSettingsList.Add(ins);
                }
            }

            foreach (Settings setting in lsSettingsList)
            {
                setting.ClientName = clientrep.GetClient(setting.ClientId).Name;
            }

            drI.Close();
            con.Close();

            return lsSettingsList;
        }

        public Settings UpdateSettings(Settings ins)
        {
            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            //...Update Record...
            cmdI.Parameters.Clear();
            cmdI.CommandText = StoredProcedures.UpdateSetting;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@SettingId", ins.SettingId);          // int
            cmdI.Parameters.AddWithValue("@Setting", ins.Setting);          // varchar(100)
            cmdI.Parameters.AddWithValue("@Value", ins.Value);          // varchar(500)
            cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);          // int
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public Settings AddSettings(Settings ins)
        {
            string strTrx = "AddSetting";

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
                cmdI.CommandText = StoredProcedures.InsertSetting;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@Setting", ins.Setting);          // varchar(100)
                cmdI.Parameters.AddWithValue("@Value", ins.Value);              // varchar(500)
                cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);        // int

                //...Return new ID
                ins.SettingId = (int)cmdI.ExecuteScalar();

                trx.Commit();
                cmdI.Connection.Close();
            }
            catch (SqlException ex)
            {
                if (trx != null) trx.Rollback();
                //throw ex;
                //Console.WriteLine("Rollback Exception Type: {0}", ex.GetType());
                //Console.WriteLine("  Message: {0}", ex.Message);
            }
            finally
            {
                //Check for close and respond accordingly
                if (con.State != ConnectionState.Closed)
                {
                    con.Close();
                }
                //Clean up
                con.Dispose();
                cmdI.Dispose();
                trx.Dispose();
            }
            return ins;
        }

        public bool RemoveSettings(int SettingsId)
        {
            bool Removed = true;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("DELETE FROM Settings WHERE SettingId =" + SettingsId, con);
            cmdI.Connection.Open();
            cmdI.ExecuteNonQuery();
            con.Close();

            return Removed;
        }

        public List<Settings> GetSettings(string Field, int ClientId)
        {
            List<Settings> lsSettingsList = new List<Settings>();
            Settings ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Settings WHERE ClientId = " + ClientId + " AND Setting = '" + Field + "'", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Settings();
                    ins.SettingId = Convert.ToInt32(drI["SettingId"]);
                    ins.Setting = drI["Setting"].ToString();
                    ins.Value = drI["Value"].ToString();
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    lsSettingsList.Add(ins);
                }
            }
            

            drI.Close();
            con.Close();

            return lsSettingsList;
        }
    }
}