using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace Netintercom.Models
{
    public class UserRepository
    {
        public void GetClientId(string UserName)
        {
            string ClientId = "";

            MembershipUser user = Membership.GetUser(UserName);
            Guid guid = (Guid)user.ProviderUserKey;

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.AuthConn();
            SqlCommand cmdI = new SqlCommand("SELECT ClientId FROM Users WHERE UserId='" + guid + "'", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ClientId = drI["ClientId"].ToString();
                }
            }
            drI.Close();
            con.Close();
            drI.Dispose();
            con.Dispose();
           
            HttpContext.Current.Session["ClientId"] = ClientId;
        }

        public void GetUserID(string UserName)
        {
            MembershipUser user = Membership.GetUser(UserName);
            Guid guid = (Guid)user.ProviderUserKey;
            
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.AuthConn();
            SqlCommand cmdI = new SqlCommand("SELECT UserId,UserName FROM aspnet_Users WHERE UserId='" + guid + "'", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    HttpContext.Current.Session["UserID"] = drI[0].ToString();
                    HttpContext.Current.Session["UserName"] = UserName;
                }
            }
            drI.Close();
            con.Close();
            drI.Dispose();
            con.Dispose();
        }

        public string GetUsername(int id)
        {
            string ret = "";

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.AuthConn();
            SqlCommand cmdI = new SqlCommand("SELECT aU.UserName FROM Users U INNER JOIN aspnet_Users aU ON U.UserId = aU.UserId WHERE U.UsersId = " + id, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ret = drI["UserName"].ToString();
                }
            }
            drI.Close();
            con.Close();
            drI.Dispose();
            con.Dispose();

            return ret;
        }

        public string InsertUserSchool(Guid UserId, int ClientId)
        {
            string strReturn = "";
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.AuthConn();
           
            SqlCommand cmdI = new SqlCommand("INSERT INTO Users VALUES ('" + UserId + "'," + ClientId + ")", con);
            cmdI.Connection.Open();
            cmdI.ExecuteNonQuery();

            con.Close();
            con.Dispose();
            return strReturn;
        }

        public List<RegisterModel> GetUsers()
        {
            List<RegisterModel> list = new List<RegisterModel>();
            RegisterModel ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT us.UsersId, u.UserId, u.UserName, u.LastActivityDate, us.ClientId, m.LoweredEmail, m.IsApproved, m.IsLockedOut FROM aspnet_Users u INNER JOIN Users us ON u.UserId = us.UserId INNER JOIN aspnet_Membership m ON u.UserId = m.UserId", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new RegisterModel();
                    ins.UserId = (Guid)drI["UserId"];
                    ins.UserName = drI["UserName"].ToString();
                    ins.LastLogin = Convert.ToDateTime(drI["LastActivityDate"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.Email = drI["LoweredEmail"].ToString();
                    ins.Approved = Convert.ToBoolean(drI["IsApproved"]);
                    ins.Locked = Convert.ToBoolean(drI["IsLockedOut"]);
                    ins.UsersId = Convert.ToInt32(drI["UsersId"]);
                   
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }
    }
}