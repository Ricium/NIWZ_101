using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.IO;

namespace Netintercom.Models
{
    public class CommunicationRepository
    {
        public void Notify(string regId, string Message)
        {
            var result = "";
            var API_key = "AIzaSyDtmW1crR9S4UOUCa8uzGwiX7OfkRXxkY4";
            var CONTENTTYPE = "application/json";
            var httpWebRequest = (HttpWebRequest)WebRequest.Create("https://android.googleapis.com/gcm/send");

            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "POST";
            httpWebRequest.Headers.Add(string.Format("Authorization: key={0}", API_key));
            httpWebRequest.ContentType = CONTENTTYPE;

            using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
            {
                string json = "{\"registration_ids\":[" + regId + "]," + "\"data\": { \"CMD\" : \"CMD_NOTIFY\", \"MSG\" : \"" + Message + "\"}}";
                Console.WriteLine(json);
                streamWriter.Write(json);
                streamWriter.Flush();
                streamWriter.Close();

                var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                {
                    result = streamReader.ReadToEnd();
                }
            }
        }

        public void NewsyncData(string regId, string DataContent)
        {
            var result = "";
            var API_key = "AIzaSyDtmW1crR9S4UOUCa8uzGwiX7OfkRXxkY4";
            var CONTENTTYPE = "application/json";
            var httpWebRequest = (HttpWebRequest)WebRequest.Create("https://android.googleapis.com/gcm/send");

            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "POST";
            httpWebRequest.Headers.Add(string.Format("Authorization: key={0}", API_key));
            httpWebRequest.ContentType = CONTENTTYPE;

            using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
            {
                string json = "{\"registration_ids\":[" + regId + "]," + "\"data\": { \"CMD\" : \"" + DataContent + "\"}}";
                Console.WriteLine(json);
                streamWriter.Write(json);
                streamWriter.Flush();
                streamWriter.Close();

                var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                {
                    result = streamReader.ReadToEnd();
                }
            }
        }

        public void NewUpdateData(string regId, string DataContent, string id)
        {
            var result = "";
            var API_key = "AIzaSyDtmW1crR9S4UOUCa8uzGwiX7OfkRXxkY4";
            var CONTENTTYPE = "application/json";
            var httpWebRequest = (HttpWebRequest)WebRequest.Create("https://android.googleapis.com/gcm/send");

            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "POST";
            httpWebRequest.Headers.Add(string.Format("Authorization: key={0}", API_key));
            httpWebRequest.ContentType = CONTENTTYPE;

            using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
            {
                string json = "{\"registration_ids\":[" + regId + "]," + "\"data\": { \"CMD\" : \"" + DataContent + "\", \"ID\" : \"" + id + "\"}}";
                Console.WriteLine(json);
                streamWriter.Write(json);
                streamWriter.Flush();
                streamWriter.Close();

                var httpResponse = (HttpWebResponse)httpWebRequest.GetResponse();
                using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
                {
                    result = streamReader.ReadToEnd();
                }
            }
        }

        /* Email Functions To Add Here */
    }
}