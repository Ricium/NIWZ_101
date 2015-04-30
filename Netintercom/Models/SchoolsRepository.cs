using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mvc;
namespace Netintercom.Models
{
    public class SchoolsRepository
    {
        public Schoolsc GetSchools(int SchoolsId)
        {
            Schoolsc ins = new Schoolsc();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Schools WHERE SchoolId =" + SchoolsId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.SchoolId = Convert.ToInt32(drI["SchoolId"]);
                    ins.SchoolName = drI["SchoolName"].ToString();
                    ins.Schoolabbreviation = drI["Schoolabbreviation"].ToString();
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.PictureId = Convert.ToInt32(drI["PictureId"]);

                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public Schoolsc InsertSchools(Schoolsc ins)
        {
            //...Get User and Date Data...
            string strTrx = "Insert_Schools";

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
                cmdI.CommandText = "f_Admin_Insert_Schools";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
                cmdI.Parameters.AddWithValue("@SchoolName", ins.SchoolName);
                cmdI.Parameters.AddWithValue("@Schoolabbreviation", ins.Schoolabbreviation);
                cmdI.Parameters.AddWithValue("@PictureID", ins.PictureId);

                //...Return new ID...
                ins.SchoolId = (int)cmdI.ExecuteScalar();

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

        public Schoolsc UpdateSchools(Schoolsc ins)
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
            cmdI.CommandText = "f_Admin_Update_Schools";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@SchoolId", ins.SchoolId);
            cmdI.Parameters.AddWithValue("@SchoolName", ins.SchoolName);
            cmdI.Parameters.AddWithValue("@Schoolabbreviation", ins.Schoolabbreviation);
            cmdI.Parameters.AddWithValue("@PictureID", ins.PictureId);
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public List<Schoolsc> GetListSchools()
        {
            List<Schoolsc> list = new List<Schoolsc>();
            Schoolsc ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Schools ", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Schoolsc();
                    ins.SchoolId = Convert.ToInt32(drI["SchoolId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.SchoolName = drI["SchoolName"].ToString();
                    ins.Schoolabbreviation = drI["Schoolabbreviation"].ToString();
                    ins.PictureId = Convert.ToInt32(drI["PictureId"]);
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<Schoolsc> GetListSchools(int ClientId)
        {
            List<Schoolsc> list = new List<Schoolsc>();
            Schoolsc ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * from Schools WHERE ClientId = " + ClientId + " ORDER BY SchoolId DESC", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Schoolsc();
                    ins.SchoolId = Convert.ToInt32(drI["SchoolId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.SchoolName = drI["SchoolName"].ToString();
                    ins.Schoolabbreviation = drI["Schoolabbreviation"].ToString();
                    ins.PictureId = Convert.ToInt32(drI["PictureId"]);
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            PictureRepository picRep = new PictureRepository();

            foreach (Schoolsc item in list)
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

        public bool RemoveSchools(int SchoolsId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Schools";

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
                cmdI.CommandText = "f_Admin_Remove_Schools";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@SchoolId", SchoolsId);        // int

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

        public bool RemoveSchoolSchoolss(int ClientId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Schools";

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
                cmdI.CommandText = "f_Admin_Remove_Schools_Per_School";
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