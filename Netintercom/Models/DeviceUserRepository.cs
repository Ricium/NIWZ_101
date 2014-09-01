using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Netintercom.Models
{
    public class DeviceUserRepository
    {
        public DeviceUser GetDeviceUser(int DeviceUserId)
        {
            //...Get DeviceUser based on DeviceUserId...//

            DeviceUser ins = new DeviceUser();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM DeviceUsers WHERE DeviceUserId =" + DeviceUserId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.DeviceUserId = Convert.ToInt32(drI["DeviceUserId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.DeviceId = drI["DeviceId"].ToString();
                    ins.Name = drI["Name"].ToString();
                    ins.Surname = drI["Surname"].ToString();
                    ins.Phone = drI["Phone"].ToString();
                    ins.Email = drI["Email"].ToString();
                    ins.Password = drI["Password"].ToString();
                    ins.Approved = Convert.ToBoolean(drI["Approved"]);
                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public DeviceUser GetDeviceUser(string DeviceId, string Phone, string Client)
        {
            //...Get DeviceUser based on DeviceUserId...//

            DeviceUser ins = new DeviceUser();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM DeviceUsers WHERE DeviceId ='" + DeviceId + "' AND Phone = '" + Phone + "' AND ClientId = " + Client, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.DeviceUserId = Convert.ToInt32(drI["DeviceUserId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.DeviceId = drI["DeviceId"].ToString();
                    ins.Name = drI["Name"].ToString();
                    ins.Surname = drI["Surname"].ToString();
                    ins.Phone = drI["Phone"].ToString();
                    ins.Email = drI["Email"].ToString();
                    ins.Password = drI["Password"].ToString();
                    ins.Approved = Convert.ToBoolean(drI["Approved"]);
                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public DeviceUser InsertDeviceUser(DeviceUser ins)
        {
            //...Insert DeviceUser into Database...//

            //...Transaction...
            string strTrx = "Insert_DeviceUser";

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
                cmdI.CommandText = "f_Admin_Insert_DeviceUser";
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);            //  int 
                cmdI.Parameters.AddWithValue("@DeviceId", ins.DeviceId);            //  varchar(max) 
                cmdI.Parameters.AddWithValue("@Name", ins.Name);                    //  varchar(50) 
                cmdI.Parameters.AddWithValue("@Surname ", ins.Surname);             // varchar(50) 
                cmdI.Parameters.AddWithValue("@Phone", ins.Phone);                  //  varchar(15) 
                cmdI.Parameters.AddWithValue("@Email", ins.Email);                  //  varchar(250) 
                cmdI.Parameters.AddWithValue("@Password", ins.Password);            //  varchar(500) 
                cmdI.Parameters.AddWithValue("@Approved", ins.Approved);            //  bit 

                //...Return new ID...
                ins.DeviceUserId = (int)cmdI.ExecuteScalar();

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

        public DeviceUser UpdateDeviceUser(DeviceUser ins)
        {
            //....Update DeviceUser in Database...//

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            //...Update Record...
            cmdI.Parameters.Clear();
            cmdI.CommandText = "f_Admin_Update_DeviceUser";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@DeviceUserId", ins.DeviceUserId);        // int
            cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);                // int 
            cmdI.Parameters.AddWithValue("@DeviceId", ins.DeviceId);                // varchar(max) 
            cmdI.Parameters.AddWithValue("@Name", ins.Name);                        // varchar(50) 
            cmdI.Parameters.AddWithValue("@Surname", ins.Surname);                  // varchar(50) 
            cmdI.Parameters.AddWithValue("@Phone", ins.Phone);                      // varchar(15) 
            cmdI.Parameters.AddWithValue("@Email", ins.Email);                      // varchar(250) 
            cmdI.Parameters.AddWithValue("@Password", ins.Password);                // varchar(500) 
            cmdI.Parameters.AddWithValue("@Approved", ins.Approved);                // bit  
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public List<DeviceUser> GetListDeviceUser()
        {
            //...Gets ALL Advertisments in Database...//

            List<DeviceUser> list = new List<DeviceUser>();
            DeviceUser ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM DeviceUser", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new DeviceUser();
                    ins.DeviceUserId = Convert.ToInt32(drI["DeviceUserId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.DeviceId = drI["DeviceId"].ToString();
                    ins.Name = drI["Name"].ToString();
                    ins.Surname = drI["Surname"].ToString();
                    ins.Phone = drI["Phone"].ToString();
                    ins.Email = drI["Email"].ToString();
                    ins.Password = drI["Password"].ToString();
                    ins.Approved = Convert.ToBoolean(drI["Approved"]);

                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<DeviceUser> GetListDeviceUser(int ClientId)
        {
            //...Gets Advertisments based on School in Database...//

            List<DeviceUser> list = new List<DeviceUser>();
            DeviceUser ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM DeviceUsers WHERE ClientId = " + ClientId + " ORDER BY Approved, Surname, Name", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new DeviceUser();
                    ins.DeviceUserId = Convert.ToInt32(drI["DeviceUserId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.DeviceId = drI["DeviceId"].ToString();
                    ins.Name = drI["Name"].ToString();
                    ins.Surname = drI["Surname"].ToString();
                    ins.Phone = drI["Phone"].ToString();
                    ins.Email = drI["Email"].ToString();
                    ins.Password = drI["Password"].ToString();
                    ins.Approved = Convert.ToBoolean(drI["Approved"]);
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();            
            return list;
        }

        public bool RemoveDeviceUser(int DeviceUserId)
        {
            /// TODO 
            return false;
        }

        public bool RemoveSchoolDeviceUser(int ClientId)
        {
            /// TODO 
            return false;
        }
    }
}