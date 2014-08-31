using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Netintercom.Models
{
    /*****************************************************/
    /*                                                   */
    /* Functions to retreive Advertisments from Database */
    /*                                                   */
    /*****************************************************/

    public class AdvertisementRepository
    {
        public Advertisement GetAdvertisement(int AdvertisementId)
        {
            //...Get Advertisement based on AdvertisementId...//
            Advertisement ins = new Advertisement();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Advertisement WHERE AdvertisementId =" + AdvertisementId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.AdvertisementId = Convert.ToInt32(drI["AdvertisementId"]);
                    ins.PictureId = Convert.ToInt32(drI["PictureId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.Number = drI["Number"].ToString();
                    ins.Email = drI["Email"].ToString();
                    ins.WebSiteUrl = drI["WebSiteUrl"].ToString();
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                }
            }

            //...Clean Up...
            drI.Close();
            con.Close();

            //...Return...
            return ins;
        }

        public Advertisement InsertAdvertisement(Advertisement ins)
        {
            //...Insert Advertisement into Database...//

            //...Transaction...
            string strTrx = "Insert_Advertisement";

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
                cmdI.CommandText = StoredProcedures.InsertAdvertisement;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@PictureId", ins.PictureId);
                cmdI.Parameters.AddWithValue("@Title", ins.Title);
                cmdI.Parameters.AddWithValue("@Body", ins.Body);
                cmdI.Parameters.AddWithValue("@Number", ins.Number);
                cmdI.Parameters.AddWithValue("@Email", ins.Email);
                cmdI.Parameters.AddWithValue("@WebSiteUrl", ins.WebSiteUrl);
                cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);            

                //...Return new ID...
                ins.AdvertisementId = (int)cmdI.ExecuteScalar();

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

        public Advertisement UpdateAdvertisement(Advertisement ins)
        {
            //....Update Advertisement in Database...//

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            //...Update Record...
            cmdI.Parameters.Clear();
            cmdI.CommandText = StoredProcedures.UpdateAdvertisement;
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@AdvertisementId", ins.AdvertisementId);
            cmdI.Parameters.AddWithValue("@PictureId", ins.PictureId);
            cmdI.Parameters.AddWithValue("@Title", ins.Title);
            cmdI.Parameters.AddWithValue("@Body", ins.Body);
            cmdI.Parameters.AddWithValue("@Number", ins.Number);
            cmdI.Parameters.AddWithValue("@Email", ins.Email);
            cmdI.Parameters.AddWithValue("@WebSiteUrl", ins.WebSiteUrl); 
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public List<Advertisement> GetListAdvertisement()
        {
            //...Gets ALL Advertisments in Database...//

            List<Advertisement> list = new List<Advertisement>();
            Advertisement ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Advertisement", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Advertisement();
                    ins.AdvertisementId = Convert.ToInt32(drI["AdvertisementId"]);
                    ins.PictureId = Convert.ToInt32(drI["PictureId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.Number = drI["Number"].ToString();
                    ins.Email = drI["Email"].ToString();
                    ins.WebSiteUrl = drI["WebSiteUrl"].ToString();

                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<Advertisement> GetListAdvertisement(int ClientId)
        {
            //...Gets Advertisments based on School in Database...//

            List<Advertisement> list = new List<Advertisement>();
            Advertisement ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Advertisement WHERE ClientId = " + ClientId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Advertisement();
                    ins.AdvertisementId = Convert.ToInt32(drI["AdvertisementId"]);
                    ins.PictureId = Convert.ToInt32(drI["PictureId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.Number = drI["Number"].ToString();
                    ins.Email = drI["Email"].ToString();
                    ins.WebSiteUrl = drI["WebSiteUrl"].ToString();
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            PictureRepository picRep = new PictureRepository();

            foreach (Advertisement item in list)
            {
                if (item.PictureId != 0)
                {
                    item.PicUrl = picRep.GetPicture(item.PictureId).PicUrl;
                    string path = item.PicUrl.Substring(item.PicUrl.IndexOf("/Images/"));
                    path = path.Replace('/', '\\');
                    item.PicUrl = path;
                }
            }

            return list;
        }

        public List<Advertisement> GetListAdvertisement(int ClientId, int LastId)
        {
            //...Gets Advertisments based on School in Database...//

            List<Advertisement> list = new List<Advertisement>();
            Advertisement ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Advertisement WHERE ClientId = " + ClientId + " AND AdvertisementId > " + LastId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Advertisement();
                    ins.AdvertisementId = Convert.ToInt32(drI["AdvertisementId"]);
                    ins.PictureId = Convert.ToInt32(drI["PictureId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.Number = drI["Number"].ToString();
                    ins.Email = drI["Email"].ToString();
                    ins.WebSiteUrl = drI["WebSiteUrl"].ToString();
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            PictureRepository picRep = new PictureRepository();

            foreach (Advertisement item in list)
            {
                if (item.PictureId != 0)
                {
                    item.PicUrl = picRep.GetPicture(item.PictureId).PicUrl;
                    string path = item.PicUrl.Substring(item.PicUrl.IndexOf("/Images/"));
                    path = path.Replace('/', '\\');
                    item.PicUrl = path;
                }
            }

            return list;
        }

        public bool RemoveAdvertisement(int AdvertisementId)
        {
            //...Removes Spesific Advertisment...//

            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Advertisement";

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
                cmdI.Parameters.Clear();
                cmdI.CommandText = StoredProcedures.RemoveAdvertisement;
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@AdvertisementId", AdvertisementId);        // int

                //...Return...
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

        public bool RemoveClientAdvertisement(int ClientId)
        {
            //...Remove All Advertisements of School...//

            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Advertisement";

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
                cmdI.CommandText = StoredProcedures.RemoveAdvertisementPerClient;
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