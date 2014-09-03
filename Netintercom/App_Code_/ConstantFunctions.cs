using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net.Mail;
using System.Net;
using Facebook;
using System.Text;
using System.Security.Cryptography;

namespace Netintercom
{
    public class StoredProcedures
    {
        public static readonly string InsertAdvertisement = "f_Admin_Insert_Advertisement";
        public static readonly string UpdateAdvertisement = "f_Admin_Update_Advertisement";
        public static readonly string RemoveAdvertisement = "f_Admin_Remove_Advertisement";
        public static readonly string RemoveAdvertisementPerClient = "f_Admin_Remove_Advertisement_Per_Client";

        public static readonly string InsertSetting = "f_Admin_Insert_Setting";
        public static readonly string UpdateSetting = "f_Admin_Update_Setting";

    }

    public class Constants
    {
        //public static readonly string API_key = "AIzaSyDtmW1crR9S4UOUCa8uzGwiX7OfkRXxkY4";
        public static readonly string API_key = "AIzaSyDtz_XkZvkYv5DYinlbRba9-N5VmVqXGac";
        public static readonly string MailerAddress = "netintercom.systems@gmail.com";
        public static readonly string MailerPw = "Lekkereet1";

        public static readonly string FB_API_ID = "1558468101048319";
        public static readonly string FB_Secret = "b49f1edbe495851318cef0faa812c98b";
        public static readonly string FB_Scope = "manage_pages,publish_actions";

        public static readonly string Locker = "N3t1nt3rc0m";
    }

    public class Functions
    {
        public Image ResizeImage(Image image, Size size, bool preserveAspectRatio = true)
        {
            int newWidth;
            int newHeight;
            if (preserveAspectRatio)
            {
                int originalWidth = image.Width;
                int originalHeight = image.Height;
                float percentWidth = (float)size.Width / (float)originalWidth;
                float percentHeight = (float)size.Height / (float)originalHeight;
                float percent = percentHeight < percentWidth ? percentHeight : percentWidth;
                newWidth = (int)(originalWidth * percent);
                newHeight = (int)(originalHeight * percent);
            }
            else
            {
                newWidth = size.Width;
                newHeight = size.Height;
            }
            Image newImage = new Bitmap(newWidth, newHeight);
            using (Graphics graphicsHandle = Graphics.FromImage(newImage))
            {
                graphicsHandle.InterpolationMode = InterpolationMode.HighQualityBicubic;
                graphicsHandle.DrawImage(image, 0, 0, newWidth, newHeight);
            }
            return newImage;
        }

        public void LogError(string ErrorMessage)
        {
            //...Transaction...
            string strTrx = "Log_Error";

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
                cmdI.CommandText = "f_Admin_Log_Error";
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@ErrorMessage", ErrorMessage);            // varchar(1000),
                cmdI.Parameters.AddWithValue("@ErrorDate", DateTime.Now);               // datetime

                //...Return new ID...
                int ret = (int)cmdI.ExecuteScalar();

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
        }

        public void DeleteFiles(string strpath)
        {
            if (Directory.Exists(strpath))
            {
                RemoveDirectories(strpath);
            }
        }

        private void RemoveDirectories(string strpath)
        {
            //This condition is used to delete all files from the Directory
            foreach (string file in Directory.GetFiles(strpath))
            {
                File.Delete(file);
            }
            //This condition is used to check all child Directories and delete files
            foreach (string subfolder in Directory.GetDirectories(strpath))
            {
                RemoveDirectories(subfolder);
            }
            Directory.Delete(strpath);
        }

        public void DeleteFile(string path)
        {
            File.Delete(path);
        }

        public void SendEmail(string Message, string Address, string Subject)
        {
            string fromEmail = Constants.MailerAddress;
            string fromPW = Constants.MailerPw;
            string toEmail = Address;

            MailMessage message = new System.Net.Mail.MailMessage(fromEmail,toEmail,Subject,Message);
            
            //message.From = new MailAddress(fromEmail);
            //message.To.Add(toEmail);
            //message.Subject = Subject;
            //message.Body = Message;
            
            message.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
            

            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.EnableSsl = true;
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential(fromEmail, fromPW);

            smtpClient.Send(message);
            //smtpClient.Send(message.From.ToString(), message.To.ToString(), message.Subject, message.Body);
        }
    }

    public class FacebookPost
    {
        public static void Post(string access_token, string page_id, string post)
        {
            var client = new FacebookClient(access_token);

            client.Post("/"+page_id+"/feed", new { message = post });
        }

        public static string GetAccessToken(int ClientId)
        {
            string returnValue = "";

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Settings WHERE ClientId = " + ClientId + " AND Setting = 'facebook'", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    returnValue = drI["Value"].ToString();
                }
            }

            drI.Close();
            con.Close();

            return returnValue;
        }

        public static string GetPageId(int ClientId)
        {
            string returnValue = "";

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Settings WHERE ClientId = " + ClientId + " AND Setting = 'facebookpage'", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    returnValue = drI["Value"].ToString();
                }
            }

            drI.Close();
            con.Close();

            return returnValue;
        }
    }

    public class Crypto
    {
        private static string GetSHA256(string text)
        {
            UnicodeEncoding UE = new UnicodeEncoding();
            byte[] hashValue;
            byte[] message = UE.GetBytes(text);

            SHA256Managed hashString = new SHA256Managed();
            string hex = "";

            hashValue = hashString.ComputeHash(message);
            foreach (byte x in hashValue)
            {
                hex += String.Format("{0:x2}", x);
            }
            return hex;
        }
    }
}