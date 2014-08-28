using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;

namespace Netintercom.Models
{
    public class AppRequestRepository
    {
        private PictureRepository picRep = new PictureRepository();

        public List<NewsRequest> GetNews(int ClientId, int LastId)
        {
            //...Get Data for App, based on the School Requesting the data, and the LastId of the data currently in the App...//

            List<NewsRequest> list = new List<NewsRequest>();
            NewsRequest ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT n.NewsId, n.Title, n.Body, n.PostDate, n.PictureId "
                                + "FROM News n WHERE n.ClientId=" + ClientId + " AND n.NewsId >" + LastId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new NewsRequest();
                    ins.NewsId = Convert.ToInt32(drI["NewsId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.Date = Convert.ToDateTime(drI["PostDate"]);
                    ins.PicUrl = drI["PictureId"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            foreach (NewsRequest item in list)
            {
                if (!item.PicUrl.Equals("0"))
                {
                    int id = Convert.ToInt32(item.PicUrl);
                    item.PicUrl = picRep.GetPicture(id).PicUrl;
                }
            }

            return list;
        }

        public List<Notifications> GetNotifications(int ClientId, int LastId)
        {
            //...Get Data for App, based on the School Requesting the data, and the LastId of the data currently in the App...//

            List<Notifications> list = new List<Notifications>();
            Notifications ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * "
                                + "FROM Notifications n WHERE n.ClientId=" + ClientId + " AND n.NotificationsId >" + LastId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Notifications();
                    ins.NotificationsId = Convert.ToInt32(drI["NotificationsId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.PostDate = Convert.ToDateTime(drI["PostDate"]);
                    ins.CategoryId = Convert.ToInt32(drI["CategoryId"]);
                    ins.SubCategoryId = Convert.ToInt32(drI["SubCategoryId"]);
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<NewsRequest> GetEditNews(int ClientId, int EditId)
        {
            //...Get Data for App, based on the School Requesting the data, and the Edit of the News Requestes...//

            List<NewsRequest> list = new List<NewsRequest>();
            NewsRequest ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT n.NewsId, n.Title, n.Body, n.PostDate, n.PictureId "
                                + "FROM News n WHERE n.ClientId=" + ClientId + " AND n.NewsId =" + EditId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new NewsRequest();
                    ins.NewsId = Convert.ToInt32(drI["NewsId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.Date = Convert.ToDateTime(drI["PostDate"]);
                    ins.PicUrl = drI["PictureId"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            foreach (NewsRequest item in list)
            {
                if (!item.PicUrl.Equals("0"))
                {
                    int id = Convert.ToInt32(item.PicUrl);
                    item.PicUrl = picRep.GetPicture(id).PicUrl;
                }
            }

            return list;
        }

        public List<EventRequest> GetEvents(int ClientId, int LastId)
        {
            List<EventRequest> list = new List<EventRequest>();
            EventRequest ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT n.EventsId, n.Title, n.Body, n.StartDate,n.EndDate,n.AllDay, n.PictureId "
                                + "FROM Events n WHERE n.ClientId=" + ClientId + " AND n.EventsId >" + LastId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new EventRequest();
                    ins.EventId = Convert.ToInt32(drI["EventsId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.StartDate = Convert.ToDateTime(drI["StartDate"]);
                    ins.EndDate = Convert.ToDateTime(drI["EndDate"]);
                    ins.AllDay = Convert.ToBoolean(drI["AllDay"]);
                    ins.PicUrl = drI["PictureId"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            foreach (EventRequest item in list)
            {
                if (!item.PicUrl.Equals("0"))
                {
                    int id = Convert.ToInt32(item.PicUrl);
                    item.PicUrl = picRep.GetPicture(id).PicUrl;
                }
            }

            return list;
        }

        public List<EventRequest> GetEditEvent(int ClientId, int EditId)
        {
            List<EventRequest> list = new List<EventRequest>();
            EventRequest ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT n.EventsId, n.Title, n.Body, n.StartDate,n.EndDate,n.AllDay, n.PictureId "
                                + "FROM Events n WHERE n.ClientId=" + ClientId + " AND n.EventsId =" + EditId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new EventRequest();
                    ins.EventId = Convert.ToInt32(drI["EventsId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.StartDate = Convert.ToDateTime(drI["StartDate"]);
                    ins.EndDate = Convert.ToDateTime(drI["EndDate"]);
                    ins.AllDay = Convert.ToBoolean(drI["AllDay"]);
                    ins.PicUrl = drI["PictureId"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            foreach (EventRequest item in list)
            {
                if (!item.PicUrl.Equals("0"))
                {
                    int id = Convert.ToInt32(item.PicUrl);
                    item.PicUrl = picRep.GetPicture(id).PicUrl;
                }
            }

            return list;
        }

        public List<ContactRequest> GetContact(int ClientId)
        {
            List<ContactRequest> list = new List<ContactRequest>();
            ContactRequest ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT n.ContactsId, n.Name, n.Surname, n.Number, n.Body ,n.Email FROM Contacts n WHERE n.ClientId=" + ClientId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new ContactRequest();
                    ins.ContactId = Convert.ToInt32(drI["ContactsId"]);
                    ins.Name = drI["Name"].ToString();
                    ins.Surname = drI["Surname"].ToString();
                    ins.Number = drI["Number"].ToString();
                    ins.Desc = drI["Body"].ToString();
                    ins.Email = drI["Email"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();



            return list;
        }

        public List<ContactRequest> GetEditContact(int ClientId, int EditId)
        {
            List<ContactRequest> list = new List<ContactRequest>();
            ContactRequest ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT n.ContactsId, n.Name, n.Surname, n.Number, n.Body ,n.Email "
                                + "FROM Contacts n WHERE n.ClientId=" + ClientId + " and n.ContactsId = " + EditId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new ContactRequest();
                    ins.ContactId = Convert.ToInt32(drI["ContactsId"]);
                    ins.Name = drI["Name"].ToString();
                    ins.Surname = drI["Surname"].ToString();
                    ins.Number = drI["Number"].ToString();
                    ins.Desc = drI["Body"].ToString();
                    ins.Email = drI["Email"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<AdRequest> GetAd(int ClientId, int LastId)
        {
            List<AdRequest> list = new List<AdRequest>();
            AdRequest ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT n.AdvertisementId, n.Title, n.Body, n.Number,n.WebSiteUrl,n.Email,n.PictureId "
                                + "FROM Advertisement n WHERE n.ClientId=" + ClientId + " AND n.AdvertisementId >" + LastId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new AdRequest();
                    ins.AdId = Convert.ToInt32(drI["AdvertisementId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.Number = drI["Number"].ToString();
                    ins.Url = drI["WebSiteUrl"].ToString();
                    ins.Email = drI["Email"].ToString();
                    ins.PicUrl = drI["PictureId"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            foreach (AdRequest item in list)
            {
                if (!item.PicUrl.Equals("0"))
                {
                    int id = Convert.ToInt32(item.PicUrl);
                    item.PicUrl = picRep.GetPicture(id).PicUrl;
                }
            }

            return list;
        }

        public List<AdRequest> GetEditAd(int ClientId, int EditId)
        {
            List<AdRequest> list = new List<AdRequest>();
            AdRequest ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT n.AdvertisementId, n.Title, n.Body, n.Number,n.WebSiteUrl,n.Email,n.PictureId "
                                + "FROM Advertisement n WHERE n.ClientId=" + ClientId + " AND n.AdvertisementId =" + EditId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new AdRequest();
                    ins.AdId = Convert.ToInt32(drI["AdvertisementId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.Number = drI["Number"].ToString();
                    ins.Url = drI["WebSiteUrl"].ToString();
                    ins.Email = drI["Email"].ToString();
                    ins.PicUrl = drI["PictureId"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            foreach (AdRequest item in list)
            {
                if (!item.PicUrl.Equals("0"))
                {
                    int id = Convert.ToInt32(item.PicUrl);
                    item.PicUrl = picRep.GetPicture(id).PicUrl;
                }
            }

            return list;
        }

        public AdRequest GetRandomSplashAdd(int ClientId)
        {
            List<AdRequest> list = new List<AdRequest>();
            AdRequest ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT n.AdvertisementId, n.Title, n.Body, n.Number,n.WebSiteUrl,n.Email,n.PictureId "
                                 + "FROM Advertisement n WHERE n.ClientId=" + ClientId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new AdRequest();
                    ins.AdId = Convert.ToInt32(drI["AdvertisementId"]);
                    ins.Title = drI["Title"].ToString();
                    ins.Body = drI["Body"].ToString();
                    ins.Number = drI["Number"].ToString();
                    ins.Url = drI["WebSiteUrl"].ToString();
                    ins.Email = drI["Email"].ToString();
                    ins.PicUrl = drI["PicUrl"].ToString();
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            foreach (AdRequest item in list)
            {
                if (!item.PicUrl.Equals("0"))
                {
                    int id = Convert.ToInt32(item.PicUrl);
                    item.PicUrl = picRep.GetPicture(id).PicUrl;
                }
            }

            if (list.Count != 0)
            {
                Random rnd = new Random();
                int random = rnd.Next(0, list.Count);
                return list[random];
            }
            else
                return new AdRequest();
        }

        public string GetAllRegIds(int ClientId)
        {
            StringBuilder returnValue = new StringBuilder();
            List<RegistrationModel> RegIds = new List<RegistrationModel>();
            RegistrationModel ins;
                        
            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT DISTINCT DeviceReg FROM Registration WHERE ClientId = " + ClientId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new RegistrationModel();
                    ins.DeviceId = drI["DeviceReg"].ToString();
                    RegIds.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            foreach (RegistrationModel rm in RegIds)
            {
                returnValue.Append("\"");
                returnValue.Append(rm.DeviceId);
                returnValue.Append("\"");
                returnValue.Append(",");
            }

            if(returnValue.Length != 0)
                returnValue.Length--;

            return returnValue.ToString();
        }

        public bool RegisterDevice(int ClientId, string RegId)
        {
            //...Get User and Date Data...
            string strTrx = "Insert_Device";

            bool retb = false;

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
                cmdI.CommandText = "f_Admin_Insert_DeviceRegister";
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@ClientId", ClientId);            // int,
		        cmdI.Parameters.AddWithValue("@RegId", RegId);                  // varchar(250)

                //...Return new ID...
                int ret = (int)cmdI.ExecuteScalar();
                if (ret != 0)
                    retb = true;

                //...Commit Transaction...
                trx.Commit();
                cmdI.Connection.Close();
            }
            catch (SqlException ex)
            {
                if (trx != null) trx.Rollback();
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

            return retb;
        }

        public List<DeviceModel> GetRegisteredDevices()
        {
            List<DeviceModel> list = new List<DeviceModel>();
            DeviceModel ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Registration", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new DeviceModel();
                    ins.DeviceReg = drI["DeviceReg"].ToString();
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public DeviceUser AddDeviceUser(DeviceUser ins)
        {
            DeviceUserRepository devurep = new DeviceUserRepository();

            DeviceUser ins2 = devurep.InsertDeviceUser(ins);

            return ins2;
        }

        public int CheckDeviceUserLogin(int DeviceUserId, string Password)
        {
             DeviceUserRepository devurep = new DeviceUserRepository();
             DeviceUser checkMe = devurep.GetDeviceUser(DeviceUserId);

             if (checkMe.Approved)
             {
                 if (checkMe.Password.Equals(Password))
                 {
                     return 0; //... Success
                 }
                 else
                 {
                     return 1; //... Incorrect Password
                 }
             }
             else
             {
                 return 2; //... Not Approved
             }
        }
    }
}