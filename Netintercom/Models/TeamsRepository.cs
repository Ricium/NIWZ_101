using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mvc;
namespace Netintercom.Models
{
    public class TeamsRepository
    {
        public Teams GetTeams(int TeamsId)
        {
            Teams ins = new Teams();

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT t.*,sc.CategoryName,sch.* FROM Teams t inner join SportCategory sc on t.SportCategoryID = sc.SportCategoryId inner join Schools sch on t.SchoolId =sch.SchoolId  WHERE TeamsId =" + TeamsId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.TeamsId = Convert.ToInt32(drI["TeamsId"]);
                    ins.Name = drI["Name"].ToString();
                    ins.Age = drI["Age"].ToString();
                    ins.Ranks = drI["Ranks"].ToString();
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.SportCategoryID = Convert.ToInt32(drI["SportCategoryID"]);
                    ins.SchoolId = Convert.ToInt32(drI["SchoolId"]);
                    ins.schoolname = drI["SchoolName"].ToString();
                    ins.PictureId = Convert.ToInt32(drI["PictureId"]);

                }
            }
            drI.Close();
            con.Close();

            return ins;
        }

        public Teams InsertTeams(Teams ins)
        {
            //...Get User and Date Data...
            string strTrx = "Insert_Teams";

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
                cmdI.CommandText = "f_Admin_Insert_Teams";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
                cmdI.Parameters.AddWithValue("@Name", ins.Name);
                cmdI.Parameters.AddWithValue("@Age", ins.Age);
                cmdI.Parameters.AddWithValue("@Ranks", ins.Ranks);
                cmdI.Parameters.AddWithValue("@SportCategoryID", ins.SportCategoryID);
                cmdI.Parameters.AddWithValue("@SchoolId", ins.SchoolId);

                //...Return new ID...
                ins.TeamsId = (int)cmdI.ExecuteScalar();

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

        public Teams UpdateTeams(Teams ins)
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
            cmdI.CommandText = "f_Admin_Update_Teams";
            cmdI.CommandType = System.Data.CommandType.StoredProcedure;
            cmdI.Parameters.AddWithValue("@TeamsId", ins.TeamsId);
            cmdI.Parameters.AddWithValue("@ClientId", ins.ClientId);
            cmdI.Parameters.AddWithValue("@Name", ins.Name);
            cmdI.Parameters.AddWithValue("@Age", ins.Age);
            cmdI.Parameters.AddWithValue("@Ranks", ins.Ranks);
            cmdI.Parameters.AddWithValue("@SportCategoryID", ins.SportCategoryID);
            cmdI.Parameters.AddWithValue("@SchoolId", ins.SchoolId);
            cmdI.ExecuteNonQuery();
            cmdI.Connection.Close();

            return ins;
        }

        public List<Teams> GetListTeams()
        {
            List<Teams> list = new List<Teams>();
            Teams ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT t.*,sc.CategoryName,sch.* FROM Teams t inner join SportCategory sc on t.SportCategoryID = sc.SportCategoryId inner join Schools sch on t.SchoolId =sch.SchoolId ", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Teams();
                    ins.TeamsId = Convert.ToInt32(drI["TeamsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.Name = drI["Name"].ToString();
                    ins.Age = drI["Age"].ToString();
                    ins.Ranks = drI["Ranks"].ToString();
                    ins.SportCategoryID = Convert.ToInt32(drI["SportCategoryID"]);
                    ins.sportcategory = drI["CategoryName"].ToString();
                    ins.SchoolId = Convert.ToInt32(drI["SchoolId"]);
                    ins.schoolname = drI["SchoolName"].ToString();
                    ins.PictureId = Convert.ToInt32(drI["PictureId"]);
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            return list;
        }

        public List<Teams> GetListTeams(int ClientId)
        {
            List<Teams> list = new List<Teams>();
            Teams ins;

            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT t.*,sc.CategoryName,sch.* FROM Teams t inner join SportCategory sc on t.SportCategoryID = sc.SportCategoryId inner join Schools sch on t.SchoolId =sch.SchoolId  WHERE t.ClientId = " + ClientId + " ORDER BY t.TeamsId DESC", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins = new Teams();
                    ins.TeamsId = Convert.ToInt32(drI["TeamsId"]);
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.Name = drI["Schoolabbreviation"].ToString();
                    ins.Age = drI["Age"].ToString();
                    ins.Ranks = drI["Ranks"].ToString();
                    ins.SportCategoryID = Convert.ToInt32(drI["SportCategoryID"]);
                    ins.sportcategory = drI["CategoryName"].ToString();
                    ins.SchoolId = Convert.ToInt32(drI["SchoolId"]);
                    ins.schoolname = drI["SchoolName"].ToString();
                    ins.PictureId = Convert.ToInt32(drI["PictureId"]);
                    list.Add(ins);
                }
            }
            drI.Close();
            con.Close();

            PictureRepository picRep = new PictureRepository();

            foreach (Teams item in list)
            {
                if (item.PictureId != 0)
                {
                    item.PicUrl = picRep.GetPicture(item.PictureId).PicUrl;
                    /*if (item.PicUrl.Contains("\\Images\\"))
                    {
                        string path = item.PicUrl.Substring(item.PicUrl.IndexOf("\\Images\\"));
                        path = path.Replace('\\', '/');
                        item.PicUrl = "http://www.netintercom.co.za" + path;
                    }*/
                }
            }
            return list;
        }

        public bool RemoveTeams(int TeamsId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Teams";

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
                cmdI.CommandText = "f_Admin_Remove_Teams";
                //cmdI.Connection.Open();
                cmdI.CommandType = System.Data.CommandType.StoredProcedure;
                cmdI.Parameters.AddWithValue("@TeamsId", TeamsId);        // int

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

        public bool RemoveSchoolTeamss(int ClientId)
        {
            bool Removed = true;

            //...Get User and Date Data...
            string strTrx = "Remove_Teams";

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
                cmdI.CommandText = "f_Admin_Remove_Teams_Per_School";
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

        public Teams GetTeamA(int? TeamsId)
        {
            Teams ins = new Teams();
            int sport = 0;
            //...Database Connection...
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI;

            //...SQL Commands...
            cmdI = new SqlCommand("SELECT * FROM Teams WHERE TeamsId =" + TeamsId, con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            //...Retrieve Data...
            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    ins.TeamsId = Convert.ToInt32(drI["TeamsId"]);
                    ins.Name = drI["Name"].ToString();
                    ins.Age = drI["Age"].ToString();
                    ins.Ranks = drI["Ranks"].ToString();
                    ins.ClientId = Convert.ToInt32(drI["ClientId"]);
                    ins.SportCategoryID = Convert.ToInt32(drI["SportCategoryID"]);
                    ins.SchoolId = Convert.ToInt32(drI["SchoolId"]);
                }
            }
            drI.Close();
            con.Close();

            return ins;
        }
        public List<SelectListItem> GetTeamRank()
        {
            List<SelectListItem> obj = new List<SelectListItem>();

            var result1 = new SelectListItem();
            result1.Text = "A";
            result1.Value = "A";
            result1.Selected = true;
            obj.Add(result1);

            var result2 = new SelectListItem();
            result2.Text = "B";
            result2.Value = "B";
            obj.Add(result2);

            var result3 = new SelectListItem();
            result3.Text = "C";
            result3.Value = "C";
            obj.Add(result3);

            var result4 = new SelectListItem();
            result4.Text = "D";
            result4.Value = "D";
            obj.Add(result4);

            var result5 = new SelectListItem();
            result5.Text = "E";
            result5.Value = "E";
            obj.Add(result5);

            var result6 = new SelectListItem();
            result6.Text = "F";
            result6.Value = "F";
            obj.Add(result6);

            var result7 = new SelectListItem();
            result7.Text = "G";
            result7.Value = "G";
            obj.Add(result7);

            var result8 = new SelectListItem();
            result8.Text = "H";
            result8.Value = "H";
            obj.Add(result8);

            var result9 = new SelectListItem();
            result9.Text = "I";
            result9.Value = "I";
            obj.Add(result9);

            var result10 = new SelectListItem();
            result10.Text = "J";
            result10.Value = "J";
            obj.Add(result10);

            var result11 = new SelectListItem();
            result11.Text = "K";
            result11.Value = "K";
            obj.Add(result11);

            var result12 = new SelectListItem();
            result12.Text = "L";
            result12.Value = "L";
            obj.Add(result12);

            var result13 = new SelectListItem();
            result13.Text = "M";
            result13.Value = "M";
            obj.Add(result13);

            var result14 = new SelectListItem();
            result14.Text = "N";
            result14.Value = "N";
            obj.Add(result14);

            var result15 = new SelectListItem();
            result15.Text = "O";
            result15.Value = "O";
            obj.Add(result15);

            var result16 = new SelectListItem();
            result16.Text = "P";
            result16.Value = "P";
            obj.Add(result16);

            var result17 = new SelectListItem();
            result17.Text = "Q";
            result17.Value = "Q";
            obj.Add(result17);

            var result18 = new SelectListItem();
            result18.Text = "R";
            result18.Value = "R";
            obj.Add(result18);

            var result19 = new SelectListItem();
            result19.Text = "S";
            result19.Value = "S";
            obj.Add(result19);

            var result20 = new SelectListItem();
            result20.Text = "T";
            result20.Value = "T";
            obj.Add(result20);

            var result21 = new SelectListItem();
            result21.Text = "U";
            result21.Value = "U";
            obj.Add(result21);

            var result22 = new SelectListItem();
            result22.Text = "V";
            result22.Value = "V";
            obj.Add(result22);

            var result23 = new SelectListItem();
            result23.Text = "W";
            result23.Value = "W";
            obj.Add(result23);

            var result24 = new SelectListItem();
            result24.Text = "X";
            result24.Value = "X";
            obj.Add(result24);

            var result25 = new SelectListItem();
            result25.Text = "Y";
            result25.Value = "Y";
            obj.Add(result25);

            var result26 = new SelectListItem();
            result26.Text = "Z";
            result26.Value = "Z";
            obj.Add(result26);
            return obj;
        }

        #region DropDowns
        public List<SelectListItem> GetTeamssPerSC(int? Field)
        {
            List<SelectListItem> obj = new List<SelectListItem>();

            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();
            SqlCommand cmdI = new SqlCommand("SELECT t.*,sc.CategoryName,sch.* FROM Teams t inner join SportCategory sc on t.SportCategoryID =sc.SportCategoryId inner join Fields f on sc.SportCategoryId = f.SportCategoryID inner join Schools sch on t.SchoolId=sch.SchoolId where f.FieldsId ='" + Field + "'", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    var result = new SelectListItem();
                    result.Text = drI["Schoolabbreviation"].ToString() + " " + drI["Age"].ToString() + "/" + drI["Ranks"].ToString();
                    result.Value = drI["TeamsId"].ToString();
                    obj.Add(result);
                }
            }
            drI.Close();
            con.Close();
            con.Dispose();

            return obj;
        }
        public List<SelectListItem> GetTeamssPerSCB(int? Team)
        {
            List<SelectListItem> obj = new List<SelectListItem>();
            Teams sport = GetTeamA(Team);
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();

            SqlCommand cmdI = new SqlCommand("SELECT t.*,sc.CategoryName,sch.* FROM Teams t inner join SportCategory sc on t.SportCategoryID =sc.SportCategoryId inner join Schools sch on t.SchoolId=sch.SchoolId where t.Age='" + sport.Age + "'" + " and t.SportCategoryID='" + sport.SportCategoryID + "'" + " and t.TeamsId !='" + Team + "'", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    var result = new SelectListItem();
                    result.Text = drI["Schoolabbreviation"].ToString() + " " + drI["Age"].ToString() + "/" + drI["Ranks"].ToString();
                    result.Value = drI["TeamsId"].ToString();
                 
                    obj.Add(result);
                }
            }
            drI.Close();
            con.Close();
            con.Dispose();

            return obj;
        }

        public List<SelectListItem> GetSchool(int ClientId)
        {
            List<SelectListItem> obj = new List<SelectListItem>();
            DataBaseConnection dbConn = new DataBaseConnection();
            SqlConnection con = dbConn.SqlConn();

            SqlCommand cmdI = new SqlCommand("SELECT * from Schools where ClientId ='"+ ClientId+"'", con);
            cmdI.Connection.Open();
            SqlDataReader drI = cmdI.ExecuteReader();

            if (drI.HasRows)
            {
                while (drI.Read())
                {
                    var result = new SelectListItem();
                    result.Text = drI["Schoolabbreviation"].ToString();
                    result.Value = drI["SchoolId"].ToString();

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