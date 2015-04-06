using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mvc;
namespace Netintercom.Models
{
    public class FieldRepository
    {

       
        public Fields GetFields(int FieldsId)
        {
            Fields ins = new Fields();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Fields WHERE FieldsId =" + FieldsId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.FieldsId = Convert.ToInt32(drI["FieldsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.FieldName = drI["FieldName"].ToString();
                    ins.SportCategoryID = Convert.ToInt32(drI["SportCategoryID"]);
                 
                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public Fields InsertFields(Fields ins)
        {
            //...Get User and Date Data...
            string strTrx = "Insert_Fields";

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
                cmdI.CommandText = "f_Admin_Insert_Fields";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
                cmdI.Parameters.AddWithValue("@FieldName", ins.FieldName);
                cmdI.Parameters.AddWithValue("@SportCategoryID", ins.SportCategoryID);

                //...Return new ID...
                ins.FieldsId = (int)cmdI.ExecuteScalar();

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

        public Fields UpdateFields(Fields ins)
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
            cmdI.CommandText = "f_Admin_Update_Fields";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@FieldsId", ins.FieldsId);
            cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
            cmdI.Parameters.AddWithValue("@FieldName", ins.FieldName);
            cmdI.Parameters.AddWithValue("@SportCategoryID", ins.SportCategoryID);
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public List<Fields> GetListFields()
        {
            List<Fields> list = new List<Fields>();
            Fields ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT f.*,sc.CategoryName FROM Fields f inner join SportCategory sc on f.SportCategoryID =sc.SportCategoryID", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Fields();
                    ins.FieldsId = Convert.ToInt32(drI["FieldsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.SportCategoryID = Convert.ToInt32(drI["SportCategoryID"]);
                    ins.FieldName = drI["FieldName"].ToString();
                    ins.sportcategory = drI["CategoryName"].ToString();

                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<Fields> GetListFields(int ClientId)
        {
            List<Fields> list = new List<Fields>();
            Fields ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT f.*,sc.CategoryName  FROM Fields f inner join SportCategory sc on f.SportCategoryID =sc.SportCategoryID  WHERE f.ClientId = " + ClientId + " ORDER BY FieldsId DESC", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Fields();
                    ins.FieldsId = Convert.ToInt32(drI["FieldsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.FieldName = drI["FieldName"].ToString();
                    ins.SportCategoryID = Convert.ToInt32(drI["SportCategoryID"]);
                    ins.sportcategory = drI["CategoryName"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();


            return list;
        }

        public bool RemoveFields(int FieldsId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Fields";

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
                cmdI.CommandText = "f_Admin_Remove_Fields";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@FieldsId", FieldsId);        // int

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

        public bool RemoveSchoolFieldss(int ClientId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Fields";

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
                cmdI.CommandText = "f_Admin_Remove_Fields_Per_School";
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

        #region DropDowns
        public List<SelectListItem> GetFieldsPerSC(int? SportCategory)
        {
            List<SelectListItem> obj = new List<SelectListItem>();

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = new SqlCommand("SELECT f.*,sc.CategoryName FROM Fields f inner join SportCategory sc on f.SportCategoryID =sc.SportCategoryId where f.SportCategoryID ='" + SportCategory+"'", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    var result = new SelectListItem();
                    result.Text = drI["FieldName"].ToString();
                    result.Value = drI["FieldsId"].ToString();
                    obj.Add(result);
                }
            }
            drI.Close();
            con.Close();
            con.Dispose();

            return obj;
        }
        #endregion
    }
}