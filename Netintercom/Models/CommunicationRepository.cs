using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.IO;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace Netintercom.Models
{
    public class CommunicationRepository
    {
        public void Notify(string regId, string Message, string Id)
        {
            var result = "";
            var API_key = Constants.API_key;
            var CONTENTTYPE = "application/json";
            var httpWebRequest = (HttpWebRequest)WebRequest.Create("https://android.googleapis.com/gcm/send");

            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "POST";
            httpWebRequest.Headers.Add(string.Format("Authorization: key={0}", API_key));
            httpWebRequest.ContentType = CONTENTTYPE;

            string remessage = Message.Replace("\n", "\\n");

            using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
            {
                string json = "{\"registration_ids\":[" + regId + "]," + "\"data\": { \"CMD\" : \"CMD_NOTIFY\", \"MSG\" : \"" + remessage + "\", \"ID\" : \"" + Id + "\"}}";
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

        public void NewsyncData(string regId, string DataContent, List<string> idlist, int ClientId)
        {
            AppRequestRepository apprep = new AppRequestRepository();

            var result = "";
            var API_key = Constants.API_key;
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

            //Do something with result
            string res = result.ToString();
            res.Replace("\"","'");

            List<string> fields = JSONParseObject(res);

            for (int i = 0; i < fields.Count; i++)
            {
                if (fields[i] != null)
                {
                    apprep.UpdateRegId(idlist[i], fields[i], ClientId);
                }
            }

            apprep.DeleteDuplicateReg();
        }

        public List<string> JSONParseObject(string jsonText)
        {
            JObject jResults = JObject.Parse(jsonText);
            List<string> fields = new List<string>();
            foreach (var field in jResults["results"])
            {
                try
                {
                    fields.Add((string)field["registration_id"]);
                }
                catch(Exception e)
                {
                    fields.Add("");
                }
            }
            return fields;
        }
     
        public void NewUpdateData(string regId, string DataContent, string id)
        {
            var result = "";
            var API_key = Constants.API_key;
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