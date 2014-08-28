using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace Netintercom.Models
{
    public class NotificationGroupsRepository
    {
        public NotificationGroups GetNotificationGroups(int id)
        {
            NotificationGroups ins = new NotificationGroups();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM t_NotificationGroups WHERE NotifcationGroupId =" + id, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.NotificationGroupId = Convert.ToInt32(drI["NotificationGroupId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.GroupName = drI["GroupName"].ToString();


                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public List<NotificationGroups> GetNotificationGroups()
        {
            List<NotificationGroups> lsNotificationGroupsList = new List<NotificationGroups>();
            NotificationGroups ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM t_NotificationGroups WHERE Removed = '0'", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new NotificationGroups();
                    ins.NotificationGroupId = Convert.ToInt32(drI["NotificationGroupId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.GroupName = drI["GroupName"].ToString();
                    lsNotificationGroupsList.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return lsNotificationGroupsList;
        }

        public NotificationGroups UpdateNotificationGroups(NotificationGroups ins)
        {
            //...Get Date and Current User
            string ModifiedDate = string.Format("{0:yyyy-MM-dd hh:mm:ss}", DateTime.Now);
            int UserId = Convert.ToInt32(HttpContext.Current.Session["UserID"]);

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            //...Update Record...
            cmdI.Parameters.Clear();
            cmdI.CommandText = "f_Admin_Update_NotifactionGroupLink";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@NotifcationGroupId", ins.NotificationGroupId);
            cmdI.Parameters.AddWithValue("@ClientID", ins.ClientId);
            cmdI.Parameters.AddWithValue("@GroupName", ins.GroupName);

            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public NotificationGroups AddNotificationGroups(NotificationGroups ins)
        {
            //...Get User and Date Data...
            string ModifiedDate = string.Format("{0:yyyy-MM-dd hh:mm:ss}", DateTime.Now);
            int UserId = Convert.ToInt32(HttpContext.Current.Session["UserID"]);
            string strTrx = "AddVehicle_" + UserId;

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
                cmdI.CommandText = "f_Admin_Insert_NotifactionGroupLink";
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;

                cmdI.Parameters.AddWithValue("@ClientID", ins.ClientId);
                cmdI.Parameters.AddWithValue("@GroupName", ins.GroupName);                                                            // int,
                // int

                //...Return new ID
                ins.NotificationGroupId = (int)cmdI.ExecuteScalar();

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


        public bool RemoveNotificationGroups(int NotifcationGroupId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Doc";

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
                cmdI.CommandText = "f_Admin_Remove_NotifactionGroupLink";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@NotifcationGroupId", NotifcationGroupId);        // int

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
    }
}