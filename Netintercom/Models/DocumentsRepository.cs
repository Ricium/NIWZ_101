using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Netintercom.Models
{
   
    public class DocumentsRepository
    {
        public Documents GetDocument(int id)
        {
            Documents ins = new Documents();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Documents WHERE DocId =" + id, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.DocId = Convert.ToInt32(drI["DocId"]);
                    ins.DocumentName = drI["DocumentName"].ToString();
                    ins.PathUrl = drI["PathUrl"].ToString();

                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public List<Documents> GetDocuments(int ClientId)
        {
            List<Documents> lsDocumentsList = new List<Documents>();
            Documents ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Documents WHERE ClientId ="+ClientId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Documents();
                    ins.DocId = Convert.ToInt32(drI["DocId"]);
                    ins.DocumentName = drI["DocumentName"].ToString();
                    ins.PathUrl = drI["PathUrl"].ToString();
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    lsDocumentsList.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return lsDocumentsList;
        }

        public List<Documents> GetDocuments(int ClientId, int LastId)
        {
            List<Documents> lsDocumentsList = new List<Documents>();
            Documents ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            StringBuilder w = new StringBuilder();

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Documents WHERE ClientId =" + ClientId + " AND DocId > " + LastId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Documents();
                    ins.DocId = Convert.ToInt32(drI["DocId"]);
                    ins.DocumentName = drI["DocumentName"].ToString();
                    ins.PathUrl = drI["PathUrl"].ToString();
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);

                    //ins.PathUrl = ins.PathUrl.Substring(ins.PathUrl.IndexOf("Images"),ins.PathUrl.Length - ins.PathUrl.IndexOf("Images"));
                    //ins.PathUrl = ins.PathUrl.Replace('\\','/');
                    //w.Clear();
                    //w.Append("http://www.netintercom.co.za/").Append(ins.PathUrl);
                    //ins.PathUrl = w.ToString();

                    lsDocumentsList.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return lsDocumentsList;
        }

        public Documents UpdateDocument(Documents ins)
        {
            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            con.Open();
            SqlCommand cmdI = con.CreateCommand();
            cmdI.Connection = con;

            //...Update Record...
            cmdI.Parameters.Clear();
            cmdI.CommandText = "f_Admin_Update_Document";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@DocId", ins.DocId);
            cmdI.Parameters.AddWithValue("@DocumentName", ins.DocumentName);
            cmdI.Parameters.AddWithValue("@PathUrl", ins.PathUrl);
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public Documents AddDocument(Documents ins)
        {
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
                cmdI.CommandText = "f_Admin_Insert_Document";
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@DocumentName", ins.DocumentName);
                cmdI.Parameters.AddWithValue("@PathUrl", ins.PathUrl);
                cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);                       

                //...Return new ID
                ins.DocId = (int)cmdI.ExecuteScalar();

                trx.Commit();
                cmdI.Connection.Close();
            }
            catch (SqlException ex)
            {
                if (trx != null) trx.Rollback();
                //throw ex;
                //Console.WriteLine("Rollback Exception Type: {0}", ex.GetType());
                //Console.WriteLine("  Message: {0}", ex.Message);
            }
            finally
            {
                //Check for close and respond accordingly
                if (con.State != ConnectionState.Closed)
                {
                    con.Close();
                }
                //Clean up
                con.Dispose();
                cmdI.Dispose();
                trx.Dispose();
            }
            return ins;
        }
       
        public bool RemoveDocument(int DocId)
        {
            bool Removed = true;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("DELETE FROM Documents WHERE DocId = " + DocId, con);
            cmdI.Connection.Open();
            cmdI.ExecuteNonQuery();
            con.Close();
            
            return Removed;
        }

        public void DocumentFix()
        {
            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("ALTER TABLE Documents ADD ClientId int", con);
            cmdI.Connection.Open();
            cmdI.ExecuteNonQuery();
            con.Close();

        }

        public void DocumentFix2()
        {
            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("ALTER PROCEDURE [dbo].[f_Admin_Insert_Document] @DocumentName varchar(100),@PathUrl varchar(250)" 
		   +",@ClientId int AS INSERT INTO [dbo].[Documents] ([DocumentName],[PathUrl],[ClientId]) VALUES (@DocumentName,@PathUrl,@ClientId) SELECT CAST(SCOPE_IDENTITY() AS int); SET NOCOUNT ON "
            +"RETURN", con);
            cmdI.Connection.Open();
            cmdI.ExecuteNonQuery();
            con.Close();
        }

    }
}