using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


namespace Netintercom.Models
{
    public class PictureRepository
    {
        public Picture GetPicture(int PictureId)
        {
            Picture ins = new Picture();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Picture WHERE PictureId =" + PictureId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.PictureId = Convert.ToInt32(drI["PictureId"]);
                    ins.PicUrl = drI["PicUrl"].ToString();
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public Picture InsertPicture(Picture ins)
        {
            //...Get User and Date Data...
            string strTrx = "Insert_Picture";

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
                cmdI.CommandText = "f_Admin_Insert_Picture";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@PicUrl", ins.PicUrl);
                cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);

                //...Return new ID...
                ins.PictureId = (int)cmdI.ExecuteScalar();

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

        public Picture UpdatePicture(Picture ins)
        {
            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            //...Update Record...
            cmdI.Parameters.Clear();
            cmdI.CommandText = "f_Admin_Update_Picture";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@PictureId", ins.PictureId);
            cmdI.Parameters.AddWithValue("@PicUrl", ins.PicUrl);
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public List<Picture> GetListPicture()
        {
            List<Picture> list = new List<Picture>();
            Picture ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Picture", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Picture();
                    ins.PictureId = Convert.ToInt32(drI["PictureId"]);
                    ins.PicUrl = drI["PicUrl"].ToString();
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);

                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<Picture> GetListPicture(int ClientId)
        {
            List<Picture> list = new List<Picture>();
            Picture ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Picture WHERE ClientId = " + ClientId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Picture();
                    ins.PictureId = Convert.ToInt32(drI["PictureId"]);
                    ins.PicUrl = drI["PicUrl"].ToString();
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);

                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public bool RemovePicture(int PictureId)
        {
            bool Removed = true;

            //...Check Id...
            if (PictureId != 0)
            {
                //...Get Picture...
                //Picture pic = GetPicture(PictureId);
                //string path = pic.PicUrl.Substring(pic.PicUrl.IndexOf("/Images"));
                //path = path.Replace('/','\\');
                //path = Path.Combine(Server.MapPath("~"),
                //System.IO.File.Delete(pic.PicUrl);                

                //...Get User and Date Data...
                string strTrx = "Remove_Picture";

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
                    cmdI.CommandText = "f_Admin_Remove_Picture";
                    //cmdI.Connection.Open();
                    cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                    cmdI.Parameters.AddWithValue("@PictureId", PictureId);        // int

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
            }

            return Removed;
        }

        public bool RemoveSchoolPictures(int ClientId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Picture";

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
                cmdI.CommandText = "f_Admin_Remove_Picture_Per_School";
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

        public int GetLastPictureId(int ClientId)
        {
            int returnValue = 0;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT TOP 1 PictureId FROM Picture WHERE ClientId=" + ClientId + " ORDER BY PictureId DESC", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    returnValue = Convert.ToInt32(drI["PictureId"]);
                }
            }
            drI.Close();
            con.Close();

            return returnValue;
        }
    }
}