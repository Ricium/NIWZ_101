using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mvc;

namespace Netintercom.Models
{
    public class CategoryRepository
    {
        public Category GetCategory(int CategoryId)
        {
            Category ins = new Category();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Category WHERE CategoryId =" + CategoryId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.CategoryId = Convert.ToInt32(drI["CategoryId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public Category InsertCategory(Category ins)
        {
            //...Get User and Date Data...
            string strTrx = "Insert_Category";

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
                cmdI.CommandText = "f_Admin_Insert_Category";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@Title", ins.Title);              // varchar(50)
                cmdI.Parameters.AddWithValue("@Body", ins.Body);                // varchar(max)

                //...Return new ID...
                ins.CategoryId = (int)cmdI.ExecuteScalar();

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

        public Category UpdateCategory(Category ins)
        {
            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            //...Update Record...
            cmdI.Parameters.Clear();
            cmdI.CommandText = "f_Admin_Update_Category";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@CategoryId", ins.CategoryId);    // int
            cmdI.Parameters.AddWithValue("@Title", ins.Title);              // varchar(50)
            cmdI.Parameters.AddWithValue("@Body", ins.Body);                // varchar(max)
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public List<Category> GetListCategory()
        {
            //...Get all Categories...//

            List<Category> list = new List<Category>();
            Category ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Category", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Category();
                    ins.CategoryId = Convert.ToInt32(drI["CategoryId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<SelectListItem> GetListCategoryDropDown()
        {
            List<SelectListItem> list = new List<SelectListItem>();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Category", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    var toAdd = new SelectListItem();
                    toAdd.Text = drI["Title"].ToString();
                    toAdd.Value = drI["CategoryId"].ToString();
                    list.Add(toAdd);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<SelectListItem> GetSubCategoryList(int CategoryId)
        {
            //...Initialize Instance Variable...
            List<SelectListItem> lst = new List<SelectListItem>();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();

            //...SQL Commands...
            SqlCommand cmdI = new SqlCommand("SELECT SubCategoryId,Title FROM SubCategory WHERE  CategoryId = " + CategoryId + " order by Title ", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    //...Retrieve Values from Database, Handle NULL Values...
                    var result = new SelectListItem();
                    result.Value = drI["SubCategoryId"].ToString();

                    if (drI["Title"] != DBNull.Value)
                        result.Text = drI["Title"].ToString();
                    else
                        result.Text = "Oops No Text";

                    lst.Add(result);
                }
            }
            //...Close Connections...
            drI.Close();
            con.Close();
            con.Dispose();

            //...Return List...
            return lst;
        }

        public bool RemoveCategory(int CategoryId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Category";

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
                cmdI.CommandText = "f_Admin_Remove_Category";
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