using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace Netintercom.Models
{
    public class NotifactionGroupLinksRepository
    {
        
            public NotifactionGroupLinks GetNotifactionGroupLinks(int id)
            {
                NotifactionGroupLinks ins = new NotifactionGroupLinks();

                //...Database Connection...
                DataBaseConnection dbConn = new DataBaseConnection();
                SqlConnection con = dbConn.SqlConn();
                SqlCommand cmdI;

                //...SQL Commands...
                cmdI = new SqlCommand("SELECT * FROM NotifactionGroupLinks WHERE LinkId =" + id, con);
                cmdI.Connection.Open();
                SqlDataReader drI = cmdI.ExecuteReader();

                //...Retrieve Data...
                if (drI.HasRows)
                {
                    while (drI.Read())
                    {
                        ins.NotifcationGroupId = Convert.ToInt32(drI["NotifcationGroupId"]);
                        ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                        ins.DeviceUserId = Convert.ToInt32(drI["DeviceUserId"]);
                        ins.LinkId = Convert.ToInt32(drI["LinkId"]);               
                    }
                }
                drI.Close();
                con.Close();

                return ins;
            }

            public List<NotifactionGroupLinks> GetNotifactionGroupLinks()
            {
                List<NotifactionGroupLinks> lsNotifactionGroupLinksList = new List<NotifactionGroupLinks>();
                NotifactionGroupLinks ins;

                //...Database Connection...
                DataBaseConnection dbConn = new DataBaseConnection();
                SqlConnection con = dbConn.SqlConn();
                SqlCommand cmdI;

                //...SQL Commands...
                cmdI = new SqlCommand("SELECT * FROM NotifactionGroupLinks", con);
                cmdI.Connection.Open();
                SqlDataReader drI = cmdI.ExecuteReader();

                //...Retrieve Data...
                if (drI.HasRows)
                {
                    while (drI.Read())
                    {
                        ins = new NotifactionGroupLinks();
                        ins.NotifcationGroupId = Convert.ToInt32(drI["NotifcationGroupId"]);
                        ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                        ins.DeviceUserId = Convert.ToInt32(drI["DeviceUserId"]);
                        ins.LinkId = Convert.ToInt32(drI["LinkId"]);
                        lsNotifactionGroupLinksList.Add(ins);
                    }
                }
                drI.Close();
                con.Close();

                return lsNotifactionGroupLinksList;
            }

            public List<NotifactionGroupLinks> GetNotifactionGroupLinks(int ClientId)
            {
                List<NotifactionGroupLinks> lsNotifactionGroupLinksList = new List<NotifactionGroupLinks>();
                NotifactionGroupLinks ins;

                //...Database Connection...
                DataBaseConnection dbConn = new DataBaseConnection();
                SqlConnection con = dbConn.SqlConn();
                SqlCommand cmdI;

                //...SQL Commands...
                cmdI = new SqlCommand("SELECT * FROM NotifactionGroupLinks WHERE ClientId=" + ClientId, con);
                cmdI.Connection.Open();
                SqlDataReader drI = cmdI.ExecuteReader();

                //...Retrieve Data...
                if (drI.HasRows)
                {
                    while (drI.Read())
                    {
                        ins = new NotifactionGroupLinks();
                        ins.NotifcationGroupId = Convert.ToInt32(drI["NotifcationGroupId"]);
                        ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                        ins.DeviceUserId = Convert.ToInt32(drI["DeviceUserId"]);
                        ins.LinkId = Convert.ToInt32(drI["LinkId"]);
                        lsNotifactionGroupLinksList.Add(ins);
                    }
                }
                drI.Close();
                con.Close();

                return lsNotifactionGroupLinksList;
            }

            public List<NotifactionGroupLinks> GetNotifactionGroupLinks(int ClientId, int GroupId)
            {
                List<NotifactionGroupLinks> lsNotifactionGroupLinksList = new List<NotifactionGroupLinks>();
                NotifactionGroupLinks ins;

                //...Database Connection...
                DataBaseConnection dbConn = new DataBaseConnection();
                SqlConnection con = dbConn.SqlConn();
                SqlCommand cmdI;

                //...SQL Commands...
                cmdI = new SqlCommand("SELECT * FROM NotifactionGroupLinks WHERE ClientId=" + ClientId + " AND NotifcationGroupId=" + GroupId, con);
                cmdI.Connection.Open();
                SqlDataReader drI = cmdI.ExecuteReader();

                //...Retrieve Data...
                if (drI.HasRows)
                {
                    while (drI.Read())
                    {
                        ins = new NotifactionGroupLinks();
                        ins.NotifcationGroupId = Convert.ToInt32(drI["NotifcationGroupId"]);
                        ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                        ins.DeviceUserId = Convert.ToInt32(drI["DeviceUserId"]);
                        ins.LinkId = Convert.ToInt32(drI["LinkId"]);
                        lsNotifactionGroupLinksList.Add(ins);
                    }
                }
                drI.Close();
                con.Close();

                return lsNotifactionGroupLinksList;
            }

            public NotifactionGroupLinks UpdateNotifactionGroupLinks(NotifactionGroupLinks ins)
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
                cmdI.Parameters.AddWithValue("@NotifcationGroupId", ins.NotifcationGroupId);
                cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
                cmdI.Parameters.AddWithValue("@DeviceUserId", ins.DeviceUserId);
                cmdI.Parameters.AddWithValue("@LinkId", ins.LinkId);
                cmdI.ExecuteNonQuery();
                cmdI.Connection.Close();

                return ins;
            }

            public NotifactionGroupLinks AddNotifactionGroupLinks(NotifactionGroupLinks ins)
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
               
                    cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
                    cmdI.Parameters.AddWithValue("@DeviceUserId", ins.DeviceUserId);
                    cmdI.Parameters.AddWithValue("@LinkId", ins.LinkId);                                                            // int,
                    // int

                    //...Return new ID
                    ins.NotifcationGroupId = (int)cmdI.ExecuteScalar();

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

            public bool RemoveNotifactionGroupLinks(int NotifcationGroupId)
            {
                bool Removed = true;

               // TODO

                return Removed;
            }
        }
    }
