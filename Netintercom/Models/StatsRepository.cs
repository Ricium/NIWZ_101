using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace Netintercom.Models
{
    public class StatsRepository
    {
        public Stats GetStats(Guid UserId, int ClientId)
        {
            Stats ins = new Stats();
            ins.Username = GetUsername(UserId);
            ins.Users = GetUsers(ClientId);
            ins.News= GetNews(ClientId);
            ins.Notifications = GetNotifications(ClientId);
            ins.Ads = GetAds(ClientId);
            ins.Events = GetEvents(ClientId);
            ins.Services = GetServices(ClientId);
            ins.ServiceCounts = GetServiceCount(ClientId);

            return ins;
        }

        public Stats GetStats(int ClientId)
        {
            Stats ins = new Stats();
            ins.Users = GetUsers(ClientId);
            ins.News = GetNews(ClientId);
            ins.Notifications = GetNotifications(ClientId);
            ins.Ads = GetAds(ClientId);
            ins.Events = GetEvents(ClientId);
            ins.Services = GetServices(ClientId);
            ins.ServiceCounts = GetServiceCount(ClientId);

            return ins;
        }

        public string GetUsername(Guid UserId)
        {
            UserRepository urep = new UserRepository();
            return urep.GetUsername(UserId);
        }

        public int GetUsers(int ClientId)
        {
            int returnValue = 0;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT COUNT(ClientId) as NumberOfUsers FROM DeviceUsers WHERE ClientId =" + ClientId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    returnValue = Convert.ToInt32(drI["NumberOfUsers"]);
                }
            }

            //...Clean Up...
            drI.Close();
            con.Close();

            //...Return...
            return returnValue;
        }

        public int GetNews(int ClientId)
        {
            int returnValue = 0;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT COUNT(ClientId) as NumberOfUsers FROM News WHERE ClientId =" + ClientId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    returnValue = Convert.ToInt32(drI["NumberOfUsers"]);
                }
            }

            //...Clean Up...
            drI.Close();
            con.Close();

            //...Return...
            return returnValue;
        }

        public int GetEvents(int ClientId)
        {
            int returnValue = 0;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT COUNT(ClientId) as NumberOfUsers FROM Events WHERE ClientId =" + ClientId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    returnValue = Convert.ToInt32(drI["NumberOfUsers"]);
                }
            }

            //...Clean Up...
            drI.Close();
            con.Close();

            //...Return...
            return returnValue;
        }

        public int GetNotifications(int ClientId)
        {
            int returnValue = 0;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT COUNT(ClientId) as NumberOfUsers FROM Notifications WHERE ClientId =" + ClientId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    returnValue = Convert.ToInt32(drI["NumberOfUsers"]);
                }
            }

            //...Clean Up...
            drI.Close();
            con.Close();

            //...Return...
            return returnValue;
        }

        public int GetAds(int ClientId)
        {
            int returnValue = 0;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT COUNT(ClientId) as NumberOfUsers FROM Advertisement WHERE ClientId =" + ClientId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    returnValue = Convert.ToInt32(drI["NumberOfUsers"]);
                }
            }

            //...Clean Up...
            drI.Close();
            con.Close();

            //...Return...
            return returnValue;
        }

        public List<string> GetServices(int ClientId)
        {
            List<string> list = new List<string>();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT DISTINCT Service FROM Services WHERE ClientId =" + ClientId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    list.Add(drI["Service"].ToString());
                }
            }

            //...Clean Up...
            drI.Close();
            con.Close();

            return list;
        }

        public List<int> GetServiceCount(int ClientId)
        {
            List<int> list = new List<int>();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT COUNT(Service) ServiceCount FROM Services WHERE ClientId =" + ClientId + " GROUP BY Service", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    list.Add(Convert.ToInt32(drI["ServiceCount"]));
                }
            }

            //...Clean Up...
            drI.Close();
            con.Close();

            return list;
        }
    }
}