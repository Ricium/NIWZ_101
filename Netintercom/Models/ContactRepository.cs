using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Netintercom.Models
{
    public class ContactRepository
    {
        public Contact GetContact(int ContactId)
        {
            Contact ins = new Contact();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Contacts WHERE ContactsId =" + ContactId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.ContactId = Convert.ToInt32(drI["ContactsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.Name = drI["Name"].ToString();
                    ins.Surname = drI["Surname"].ToString();
                    ins.Number = drI["Number"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.Email = drI["Email"].ToString();
                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public Contact InsertContact(Contact ins)
        {
            //...Get User and Date Data...
            string strTrx = "Insert_Contact";

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
                cmdI.CommandText = "f_Admin_Insert_Contact";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@Name", ins.Name);                 // varchar(50)
                cmdI.Parameters.AddWithValue("@Surname", ins.Surname);           // varchar(50)
                cmdI.Parameters.AddWithValue("@Number", ins.Number);             //Varrchar(20)
                cmdI.Parameters.AddWithValue("@Body", ins.Body);                 //Varchar(max)
                cmdI.Parameters.AddWithValue("@Email", ins.Email);               //varchar(100)
                cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);                //int

                //...Return new ID...
                ins.ContactId = (int)cmdI.ExecuteScalar();

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

        public Contact UpdateContact(Contact ins)
        {
            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            //...Update Record...
            cmdI.Parameters.Clear();
            cmdI.CommandText = "f_Admin_Update_Contact";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@ContactId", ins.ContactId);  // int
            cmdI.Parameters.AddWithValue("@Name", ins.Name);            // varchar(50)
            cmdI.Parameters.AddWithValue("@Surname", ins.Surname);      // varchar(max)
            cmdI.Parameters.AddWithValue("@Number", ins.Number);        //varchar(20)
            cmdI.Parameters.AddWithValue("@Body", ins.Body);            //Varchar(max)
            cmdI.Parameters.AddWithValue("@Email", ins.Email);          //Varchar(100)
            cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);           //int
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public List<Contact> GetListContact()
        {
            List<Contact> list = new List<Contact>();
            Contact ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Contact", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Contact();
                    ins.ContactId = Convert.ToInt32(drI["ContactId"]);
                    ins.Number = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.Surname = drI["Surname"].ToString();
                    ins.Name = drI["Name"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<Contact> GetListContact(int ClientId)
        {
            List<Contact> list = new List<Contact>();
            Contact ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Contacts WHERE ClientId = " + ClientId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Contact();
                    ins.ContactId = Convert.ToInt32(drI["ContactsId"]);
                    ins.Number = drI["Number"].ToString();
                    ins.Email = drI["Email"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.Surname = drI["Surname"].ToString();
                    ins.Name = drI["Name"].ToString();
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        } 
        
        public bool RemoveContact(int ContactId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Contact";

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
                cmdI.CommandText = "f_Admin_Remove_Contact";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@ContactId", ContactId);        // int

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

        public bool RemoveSchoolContacts(int ClientId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Contact";

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
                cmdI.CommandText = "f_Admin_Remove_Contact_Per_School";
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
    }
}