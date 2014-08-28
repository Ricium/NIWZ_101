﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Netintercom.Models
{
    public class ServicesRepository
    {
        public Services GetServices(int id)
        {
            Services ins = new Services();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM t_Services WHERE ServiceId =" + id, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.ServiceId = Convert.ToInt32(drI["ServicesID"]);
                    ins.Service = drI["Service"].ToString();
                    ins.Query = drI["Query"].ToString();
                    ins.ModifiedDate = Convert.ToDateTime(drI["ModifiedDate"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.DeviceUserId = Convert.ToInt32(drI["DeviceUserId"]);
                   


                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public List<Services> GetServices()
        {
            List<Services> lsServicesList = new List<Services>();
            Services ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM t_Services WHERE Removed = '0'", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Services();
                    ins.ServiceId = Convert.ToInt32(drI["ServicesID"]);
                    ins.Service = drI["Service"].ToString();
                    ins.Query = drI["Query"].ToString();
                    ins.ModifiedDate = Convert.ToDateTime(drI["ModifiedDate"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.DeviceUserId = Convert.ToInt32(drI["DeviceUserId"]);
                    lsServicesList.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return lsServicesList;
        }

        public Services UpdateServices(Services ins)
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
            cmdI.CommandText = "f_Admin_Update_Services";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@ServicesId", ins.ServiceId);
            cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
            cmdI.Parameters.AddWithValue("@DeviceUserId", ins.DeviceUserId);
            cmdI.Parameters.AddWithValue("@Service", ins.Service);
            cmdI.Parameters.AddWithValue("@Query", ins.Query);
            cmdI.Parameters.AddWithValue("@ModifiedDate", ins.ModifiedDate);
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public Services AddServices(Services ins)
        {
            //...Get User and Date Data...
            string ModifiedDate = string.Format("{0:yyyy-MM-dd hh:mm:ss}", DateTime.Now);
            int UserId = Convert.ToInt32(HttpContext.Current.Session["UserID"]);
            string strTrx = "AddService" + UserId;

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
                cmdI.CommandText = "f_Admin_Insert_Services";
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
                cmdI.Parameters.AddWithValue("@DeviceUserId", ins.DeviceUserId);
                cmdI.Parameters.AddWithValue("@Service", ins.Service);
                cmdI.Parameters.AddWithValue("@Query", ins.Query);
                cmdI.Parameters.AddWithValue("@ModifiedDate", ins.ModifiedDate);                                                            // int,
                // int

                //...Return new ID
                ins.ServiceId = (int)cmdI.ExecuteScalar();

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


        public bool RemoveServices(int ServicesId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Services";

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
                cmdI.CommandText = "f_Admin_Remove_Services";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@ServiceId", ServicesId);        // int

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