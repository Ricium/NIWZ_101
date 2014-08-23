using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Netintercom.Models
{
    public class SubCategoryRepository
    {
        public SubCategory GetSubCategory(int SubCategoryId)
        {
            SubCategory ins = new SubCategory();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM SubCategory WHERE SubCategoryId =" + SubCategoryId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.SubCategoryId = Convert.ToInt32(drI["SubCategoryId"]);
                    ins.CategoryId = Convert.ToInt32(drI["CategoryId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public SubCategory InsertSubCategory(SubCategory ins)
        {
            //...Get User and Date Data...
            string strTrx = "Insert_SubCategory";

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
                cmdI.CommandText = "f_Admin_Insert_SubCategory";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@Title", ins.Title);            // varchar(50)
                cmdI.Parameters.AddWithValue("@Body", ins.Body);      // varchar(max)
                cmdI.Parameters.AddWithValue("@CategoryId", ins.CategoryId); //int

                //...Return new ID...
                ins.SubCategoryId = (int)cmdI.ExecuteScalar();

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

        public SubCategory UpdateSubCategory(SubCategory ins)
        {
            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            //...Update Record...
            cmdI.Parameters.Clear();
            cmdI.CommandText = "f_Admin_Update_SubCategory";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@SubCategoryId", ins.SubCategoryId);  // int
            cmdI.Parameters.AddWithValue("@Title", ins.Title);                  // varchar(50)
            cmdI.Parameters.AddWithValue("@Body", ins.Body);                    // varchar(max)
            cmdI.Parameters.AddWithValue("@CategoryId", ins.CategoryId);        //int
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public List<SubCategory> GetListSubCategory()
        {
            List<SubCategory> list = new List<SubCategory>();
            SubCategory ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM SubCategory", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new SubCategory();
                    ins.SubCategoryId = Convert.ToInt32(drI["SubCategoryId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.CategoryId = Convert.ToInt32(drI["CategoryId"]);
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<SubCategory> GetListSubCategory(int CategoryId)
        {
            List<SubCategory> list = new List<SubCategory>();
            SubCategory ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM SubCategory WHERE CategoryId = " + CategoryId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new SubCategory();
                    ins.SubCategoryId = Convert.ToInt32(drI["SubCategoryId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.CategoryId = Convert.ToInt32(drI["CategoryId"]);
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public bool RemoveSubCategory(int SubCategoryId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_SubCategory";

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
                cmdI.CommandText = "f_Admin_Remove_SubCategory";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@SubCategoryId", SubCategoryId);        // int

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

        public bool RemoveCategorySubCategory(int CategoryId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_SubCategory";

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
                cmdI.CommandText = "f_Admin_Remove_SubCategory_Per_Category";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@CategoryId", CategoryId);        // int

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