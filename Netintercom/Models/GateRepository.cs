using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mvc;

namespace Netintercom.Models
{
    public class GateRepository
    {
        #region RegisterClient
        public RegisterClient GetRegisterClient(int RegisterClientId)
        {
            RegisterClient ins = new RegisterClient();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM RegisterClient WHERE RegisterClientId =" + RegisterClientId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.RegisterClientID = Convert.ToInt32(drI["RegisterClientId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.ClientNo = drI["TeamIdA"].ToString();
                    ins.Email = drI["TeamIdB"].ToString();
                    ins.Passwords = drI["StartTime"].ToString();
                    ins.Approved = Convert.ToBoolean(drI["Approved"]);

                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public RegisterClient InsertRegisterClient(RegisterClient ins)
        {
            //...Get User and Date Data...
            string strTrx = "Insert_RegisterClient";

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
                cmdI.CommandText = "f_Admin_Insert_RegisterClient";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
                cmdI.Parameters.AddWithValue("@ClientNo", ins.ClientNo);
                cmdI.Parameters.AddWithValue("@Email", ins.Email);
                cmdI.Parameters.AddWithValue("@Passwords", ins.Passwords);
                cmdI.Parameters.AddWithValue("@Approved", ins.Approved);

                //...Return new ID...
                ins.RegisterClientID = (int)cmdI.ExecuteScalar();

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

        public RegisterClient UpdateRegisterClient(RegisterClient ins)
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
            cmdI.CommandText = "f_Admin_Update_RegisterClient";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@RegisterClientID", ins.RegisterClientID);
            cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
            cmdI.Parameters.AddWithValue("@ClientNo", ins.ClientNo);
            cmdI.Parameters.AddWithValue("@Email", ins.Email);
            cmdI.Parameters.AddWithValue("@Passwords", ins.Passwords);
            cmdI.Parameters.AddWithValue("@Approved", ins.Approved);
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public List<RegisterClient> GetListRegisterClient()
        {
            List<RegisterClient> list = new List<RegisterClient>();
            RegisterClient ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT f.*,fd.FieldName FROM RegisterClient f inner join Fields fd on f.FieldsId = fd.FieldsId", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new RegisterClient();
                    ins.RegisterClientID = Convert.ToInt32(drI["RegisterClientId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.ClientNo = drI["TeamIdA"].ToString();
                    ins.Email = drI["TeamIdB"].ToString();
                    ins.Passwords = drI["StartTime"].ToString();
                    ins.Approved = Convert.ToBoolean(drI["Approved"]);
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<RegisterClient> GetListRegisterClient(int ClientId)
        {
            List<RegisterClient> list = new List<RegisterClient>();
            RegisterClient ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM RegisterClient WHERE ClientId = " + ClientId + " ORDER BY RegisterClientId DESC", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new RegisterClient();
                    ins.RegisterClientID = Convert.ToInt32(drI["RegisterClientId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.ClientNo = drI["TeamIdA"].ToString();
                    ins.Email = drI["TeamIdB"].ToString();
                    ins.Passwords = drI["StartTime"].ToString();
                    ins.Approved = Convert.ToBoolean(drI["Approved"]);
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();


            return list;
        }

        public bool RemoveRegisterClient(int RegisterClientId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_RegisterClient";

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
                cmdI.CommandText = "f_Admin_Remove_RegisterClient";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@RegisterClientId", RegisterClientId);        // int

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

        public bool RemoveSchoolRegisterClients(int ClientId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_RegisterClient";

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
                cmdI.CommandText = "f_Admin_Remove_RegisterClient_Per_School";
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

        #endregion


        #region Visitors
        public Visitors GetVisitors(int VisitorsId)
        {
            Visitors ins = new Visitors();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Visitors WHERE VisitorsId =" + VisitorsId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.VisitorsId = Convert.ToInt32(drI["VisitorsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.ClientNo = drI["ClientNo"].ToString();
                    ins.VisitorNo = drI["VisitorNo"].ToString();
                    ins.ModifiedDate = Convert.ToDateTime(drI["ModifiedDate"]);
                    ins.SendReceived = Convert.ToBoolean(drI["SendReceived"]);

                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public Visitors InsertVisitors(Visitors ins)
        {
            //...Get User and Date Data...
            string strTrx = "Insert_Visitors";

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
                cmdI.CommandText = "f_Admin_Insert_Visitors";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
                cmdI.Parameters.AddWithValue("@ClientNo", ins.ClientNo);
                cmdI.Parameters.AddWithValue("@Email", ins.VisitorNo);
                cmdI.Parameters.AddWithValue("@Passwords", ins.ModifiedDate);
                cmdI.Parameters.AddWithValue("@Approved", ins.SendReceived);

                //...Return new ID...
                ins.VisitorsId = (int)cmdI.ExecuteScalar();

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

        public Visitors UpdateVisitors(Visitors ins)
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
            cmdI.CommandText = "f_Admin_Update_Visitors";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@VisitorsID", ins.VisitorsId);
            cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
            cmdI.Parameters.AddWithValue("@ClientNo", ins.ClientNo);
            cmdI.Parameters.AddWithValue("@Email", ins.VisitorNo);
            cmdI.Parameters.AddWithValue("@Passwords", ins.ModifiedDate);
            cmdI.Parameters.AddWithValue("@Approved", ins.SendReceived);

            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public List<Visitors> GetListVisitors()
        {
            List<Visitors> list = new List<Visitors>();
            Visitors ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT f.*,fd.FieldName FROM Visitors f inner join Fields fd on f.FieldsId = fd.FieldsId", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Visitors();
                    ins.VisitorsId = Convert.ToInt32(drI["VisitorsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.ClientNo = drI["ClientNo"].ToString();
                    ins.VisitorNo = drI["VisitorNo"].ToString();
                    ins.ModifiedDate = Convert.ToDateTime(drI["ModifiedDate"]);
                    ins.SendReceived = Convert.ToBoolean(drI["SendReceived"]);
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<Visitors> GetListVisitors(int ClientId)
        {
            List<Visitors> list = new List<Visitors>();
            Visitors ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Visitors WHERE ClientId = " + ClientId + " ORDER BY VisitorsId DESC", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Visitors();
                    ins.VisitorsId = Convert.ToInt32(drI["VisitorsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.ClientNo = drI["ClientNo"].ToString();
                    ins.VisitorNo = drI["VisitorNo"].ToString();
                    ins.ModifiedDate = Convert.ToDateTime(drI["ModifiedDate"]);
                    ins.SendReceived = Convert.ToBoolean(drI["SendReceived"]);
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();


            return list;
        }

        public bool RemoveRegisterClient1(int RegisterClientId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_RegisterClient";

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
                cmdI.CommandText = "f_Admin_Remove_RegisterClient";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@RegisterClientId", RegisterClientId);        // int

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

        public bool RemoveSchoolRegisterClients1(int ClientId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_RegisterClient";

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
                cmdI.CommandText = "f_Admin_Remove_RegisterClient_Per_School";
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

        #endregion
    }
}