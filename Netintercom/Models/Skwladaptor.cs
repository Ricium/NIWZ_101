using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Netintercom.Models
{
    public class Skwladaptor
    {
        public string Passphrase { get; set; }
        public string Query { get; set; }
    }

    public class SkwladaptorWorker
    {
        public void RunQuery(Skwladaptor ins)
        {
            if (ins.Passphrase.Equals(Constants.Locker))
            {

                //...Database Connection...
                DataBaseConnection dbConn = new DataBaseConnection();
                SqlConnection con = dbConn.SqlConn();
                SqlCommand cmdI;

                //...SQL Commands...
                cmdI = new SqlCommand(ins.Query, con);
                cmdI.Connection.Open();
                cmdI.ExecuteNonQuery();
                con.Close();
            }
        }
    }
}