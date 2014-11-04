using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Netintercom.Models
{
    public class EventRepository
    {
        public Event GetEvent(int EventsId)
        {
            Event ins = new Event();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Events WHERE EventsId =" + EventsId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.EventsId = Convert.ToInt32(drI["EventsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.CategoryId = Convert.ToInt32(drI["CategoryId"]);
                    ins.SubCategoryId = Convert.ToInt32(drI["SubCategoryId"]);
                    ins.PictureId = Convert.ToInt32(drI["PictureId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.StartDate = Convert.ToDateTime(drI["StartDate"]);
                    ins.EndDate = Convert.ToDateTime(drI["EndDate"]);
                    ins.AllDay = Convert.ToBoolean(drI["AllDay"]);               
                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public Event InsertEvent(Event ins)
        {
            //...Get User and Date Data...
            string strTrx = "Insert_Event";

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
                cmdI.CommandText = "f_Admin_Insert_Events";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);            
                cmdI.Parameters.AddWithValue("@CategoryId", ins.CategoryId);                      
                cmdI.Parameters.AddWithValue("@SubCategoryId", ins.SubCategoryId);
                cmdI.Parameters.AddWithValue("@PictureId", ins.PictureId);
                cmdI.Parameters.AddWithValue("@Title", ins.Title);
                cmdI.Parameters.AddWithValue("@Body", ins.Body);
                cmdI.Parameters.AddWithValue("@StartDate", ins.StartDate);
                cmdI.Parameters.AddWithValue("@EndDate", ins.EndDate);
                cmdI.Parameters.AddWithValue("@AllDay", 1); 

                //...Return new ID...
                ins.EventsId = (int)cmdI.ExecuteScalar();

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

        public Event UpdateEvent(Event ins)
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
            cmdI.CommandText = "f_Admin_Update_Events";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@EventsId", ins.EventsId);  
            cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
            cmdI.Parameters.AddWithValue("@CategoryId", ins.CategoryId);
            cmdI.Parameters.AddWithValue("@SubCategoryId", ins.SubCategoryId);
            cmdI.Parameters.AddWithValue("@PictureId", ins.PictureId);
            cmdI.Parameters.AddWithValue("@Title", ins.Title);
            cmdI.Parameters.AddWithValue("@Body", ins.Body);
            cmdI.Parameters.AddWithValue("@StartDate", ins.StartDate);
            cmdI.Parameters.AddWithValue("@EndDate", ins.EndDate);
            cmdI.Parameters.AddWithValue("@AllDay", ins.AllDay);
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public List<Event> GetListEvent()
        {
            List<Event> list = new List<Event>();
            Event ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Events", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Event();
                    ins.EventsId = Convert.ToInt32(drI["EventsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.CategoryId = Convert.ToInt32(drI["CategoryId"]);
                    ins.SubCategoryId = Convert.ToInt32(drI["SubCategoryId"]);
                    ins.PictureId = Convert.ToInt32(drI["PictureId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.StartDate = Convert.ToDateTime(drI["StartDate"]);
                    ins.EndDate = Convert.ToDateTime(drI["EndDate"]);
                    ins.AllDay = Convert.ToBoolean(drI["AllDay"]);

                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<Event> GetListEvent(int ClientId)
        {
            List<Event> list = new List<Event>();
            Event ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Events WHERE ClientId = " + ClientId + " ORDER BY EventsId DESC", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Event();
                    ins.EventsId = Convert.ToInt32(drI["EventsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.CategoryId = Convert.ToInt32(drI["CategoryId"]);
                    ins.SubCategoryId = Convert.ToInt32(drI["SubCategoryId"]);
                    ins.PictureId = Convert.ToInt32(drI["PictureId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.StartDate = Convert.ToDateTime(drI["StartDate"]);
                    ins.EndDate = Convert.ToDateTime(drI["EndDate"]);
                    ins.AllDay = Convert.ToBoolean(drI["AllDay"]);

                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            PictureRepository picRep = new PictureRepository();

            foreach (Event item in list)
            {
                if (item.PictureId != 0)
                {
                    item.PicUrl = picRep.GetPicture(item.PictureId).PicUrl;
                    /*if (item.PicUrl.Contains("\\Images\\"))
                    {
                        string path = item.PicUrl.Substring(item.PicUrl.IndexOf("\\Images\\"));
                        path = path.Replace('\\', '/');
                        item.PicUrl = "http://www.netintercom.co.za" + path;
                    }*/
                }
            }

            return list;
        }

        public bool RemoveEvent(int EventsId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Events";

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
                cmdI.CommandText = "f_Admin_Remove_Events";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@EventsId", EventsId);        // int

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

        public bool RemoveSchoolEvents(int ClientId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Events";

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
                cmdI.CommandText = "f_Admin_Remove_Event_Per_School";
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