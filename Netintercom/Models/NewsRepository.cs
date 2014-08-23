using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Netintercom.Models
{
    public class NewsRepository
    {
        public News GetNews(int NewsId)
        {
            News ins = new News();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM News WHERE NewsId =" + NewsId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.NewsId = Convert.ToInt32(drI["NewsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.CategoryId = Convert.ToInt32(drI["CategoryId"]);
                    ins.SubCategoryId = Convert.ToInt32(drI["SubCategoryId"]);
                    ins.PictureId = Convert.ToInt32(drI["PictureId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public News InsertNews(News ins)
        {
            //...Get User and Date Data...
            string strTrx = "Insert_News";

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
                cmdI.CommandText = "f_Admin_Insert_News";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@Title", ins.Title);
                cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
                cmdI.Parameters.AddWithValue("@CategoryId", ins.CategoryId);
                cmdI.Parameters.AddWithValue("@SubCategoryId", ins.SubCategoryId);
                cmdI.Parameters.AddWithValue("@PictureId", ins.PictureId);
                cmdI.Parameters.AddWithValue("@Body", ins.Body);
                 cmdI.Parameters.AddWithValue("@PostDate", DateTime.Now);

                //...Return new ID...
                ins.NewsId = (int)cmdI.ExecuteScalar();

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

        public News UpdateNews(News ins)
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
            cmdI.CommandText = "f_Admin_Update_News";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@NewsId", ins.NewsId);
            cmdI.Parameters.AddWithValue("@Title", ins.Title);
            cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
            cmdI.Parameters.AddWithValue("@CategoryId", ins.CategoryId);
            cmdI.Parameters.AddWithValue("@SubCategoryId", ins.SubCategoryId);
            cmdI.Parameters.AddWithValue("@PictureId", ins.PictureId);
            cmdI.Parameters.AddWithValue("@Body", ins.Body);
            cmdI.Parameters.AddWithValue("@PostDate", DateTime.Now);
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public List<News> GetListNews()
        {
            List<News> list = new List<News>();
            News ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM News", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new News();
                    ins.NewsId = Convert.ToInt32(drI["NewsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.CategoryId = Convert.ToInt32(drI["CategoryId"]);
                    ins.SubCategoryId = Convert.ToInt32(drI["SubCategoryId"]);
                    ins.PictureId = Convert.ToInt32(drI["PictureId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.PostDate = Convert.ToDateTime(drI["PostDate"]);

                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<News> GetListNews(int ClientId)
        {
            List<News> list = new List<News>();
            News ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM News WHERE ClientId = " + ClientId + " ORDER BY PostDate DESC", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new News();
                    ins.NewsId = Convert.ToInt32(drI["NewsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.CategoryId = Convert.ToInt32(drI["CategoryId"]);
                    ins.SubCategoryId = Convert.ToInt32(drI["SubCategoryId"]);
                    ins.PictureId = Convert.ToInt32(drI["PictureId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.PostDate = Convert.ToDateTime(drI["PostDate"]);
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            PictureRepository picRep = new PictureRepository();

            foreach(News item in list)
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

        public bool RemoveNews(int NewsId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_News";

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
                cmdI.CommandText = "f_Admin_Remove_News";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@NewsId", NewsId);        // int

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

        public bool RemoveSchoolNewss(int ClientId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_News";

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
                cmdI.CommandText = "f_Admin_Remove_News_Per_School";
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