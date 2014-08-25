using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.Mvc;

namespace Netintercom.Models
{
    public class ClientRepository
    {
        public Client GetClient(int ClientId)
        {
            Client ins = new Client();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Client WHERE ClientId =" + ClientId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.Name = drI["Name"].ToString();
                }
            }
            drI.Close();
            con.Close();
            
            return ins;
        }

        public Client InsertClient(Client ins)
        {
            //...Get User and Date Data...
            string strTrx = "Insert_Client";

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
                cmdI.CommandText = "f_Admin_Insert_Client";
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@Name", ins.Name);            // varchar(50)
                cmdI.Parameters.AddWithValue("@APIKey", "");

                //...Return new ID...
                ins.ClientId = (int)cmdI.ExecuteScalar();

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

        public Client UpdateClient(Client ins)
        {
            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            //...Update Record...
            cmdI.Parameters.Clear();
            cmdI.CommandText = "f_Admin_Update_Client";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);    // int
            cmdI.Parameters.AddWithValue("@Name", ins.Name);                    // varchar(50)
            cmdI.Parameters.AddWithValue("@APIKey", "");
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public List<Client> GetListClient()
        {
            List<Client> list = new List<Client>();
            Client ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Client", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Client();
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.Name = drI["Name"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<SelectListItem> GetSchoolList()
        {
            List<SelectListItem> list = new List<SelectListItem>();
            SelectListItem ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Client", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new SelectListItem();
                    ins.Value = drI["ClientId"].ToString();
                    ins.Text = drI["Name"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public bool RemoveClient(int ClientId)
        {
            bool Removed = true;
            
            //...Get User and Date Data...
            string strTrx = "Remove_Client";

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
                cmdI.CommandText = "f_Admin_Remove_Client";
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

        public void RemoveSchoolData(int ClientId)
        {
            PictureRepository picrep = new PictureRepository();
            picrep.RemoveSchoolPictures(ClientId);

            NotificationsRepository nrep = new NotificationsRepository();
            nrep.RemoveSchoolNotificationss(ClientId);

            EventRepository erep = new EventRepository();
            erep.RemoveSchoolEvents(ClientId);

            AdvertisementRepository arep = new AdvertisementRepository();
            arep.RemoveSchoolAdvertisement(ClientId);

            NewsRepository nerep = new NewsRepository();
            nerep.RemoveSchoolNewss(ClientId);

            ContactRepository crep = new ContactRepository();
            crep.RemoveSchoolContacts(ClientId);
        }
    }
}