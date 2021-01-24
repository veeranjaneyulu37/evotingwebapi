//using EvotingDacLayer1;
//using EvotingEntity1;
//using System;
//using System.Collections.Generic;
//using System.Data;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

//namespace EvotingBizLayer1
//{
//    public class AdminBiz
//    {
//        private AdminDac admindac;
//        public AdminDac dac { get; set; }
//        public AdminBiz()
//        {
//            admindac = new AdminDac();
//        }
//        //add data for the participants in each election
//        public string UploadParticipantData(string PPersonName, string Party, string locationfrom, string state, string district, string city, string country, string Role)
//        {
//            string response = "";
//            DataSet objds = new DataSet();
//            try
//            {
//                objds = admindac.UploadParticipantData(PPersonName, Party, locationfrom, state, district, city, country, Role);
//                response = "1";
//            }
//            catch (Exception)
//            {
//                response = "-99";
//                throw;
//            }


//            return response;
//        }
        
//        public List<UserEntity> GetCandidatesData()
//        {
//            List<UserEntity> userlistbizmp = new List<UserEntity>();
//            DataSet ds = new DataSet();
//            try
//            {
//                ds = admindac.GetCandidatesData();
//                if (ds.Tables.Count > 0)
//                {
//                    var dstable = ds.Tables[0];
//                    for (int i = 0; i < dstable.Rows.Count; i++)
//                    {
//                        UserEntity objuserentity = new UserEntity();
//                        objuserentity.strPPersonName = dstable.Rows[i]["txtPPersonName"].ToString();
//                        objuserentity.strPartyName = dstable.Rows[i]["txtpartyname"].ToString();
//                        objuserentity.strParticipatingFrom = dstable.Rows[i]["txtParticipatingfrom"].ToString();
//                        objuserentity.strState = dstable.Rows[i]["txtState"].ToString();
//                        objuserentity.strDistrict = dstable.Rows[i]["txtdistrict"].ToString();
//                        objuserentity.strCity = dstable.Rows[i]["txtcity"].ToString();
//                        objuserentity.strCountry = dstable.Rows[i]["txtcountry"].ToString();
//                        objuserentity.strRole = dstable.Rows[i]["txtRole"].ToString();
//                        userlistbizmp.Add(objuserentity);

//                    }
//                }
//            }
//            catch (Exception)
//            {
//                userlistbizmp = null;
//                throw;
//            }
//            return userlistbizmp;
//        }

        
        
//        //progress of no of casted votes add a dropdown too select state
//        public List<UserEntity> GetElectionDataChartViewByStatewise()
//        {
//            List<UserEntity> userlistbizmp = new List<UserEntity>();
//            DataSet ds = new DataSet();
//            try
//            {
//                ds = admindac.GetElectionDataChartViewByStatewiseByBarGraph();
//                if (ds.Tables.Count > 0)
//                {
//                    var dstable = ds.Tables[0];
//                    for (int i = 0; i < dstable.Rows.Count; i++)
//                    {
//                        UserEntity objuserentity = new UserEntity();
//                        objuserentity.strState = dstable.Rows[i]["txtstate"].ToString();
//                        objuserentity.strjson = dstable.Rows[i]["txtarrayjson"].ToString();
//                        userlistbizmp.Add(objuserentity);

//                    }
//                }
//            }
//            catch (Exception)
//            {
//                userlistbizmp = null;
//                throw;
//            }
//            return userlistbizmp;
//        }


//        public List<UserEntity> GetElectionDataChartViewBydistrict(string state)
//        {
//            List<UserEntity> userlistbizmp = new List<UserEntity>();
//            DataSet ds = new DataSet();
//            try
//            {
//                ds = admindac.GetElectionDataChartViewbydistrict(state);
//                if (ds.Tables.Count > 0)
//                {
//                    var dstable = ds.Tables[0];
//                    for (int i = 0; i < dstable.Rows.Count; i++)
//                    {
//                        UserEntity objuserentity = new UserEntity();
                        
//                        objuserentity.strDistrict = dstable.Rows[i]["txtDistrict"].ToString();
//                        objuserentity.strjson = dstable.Rows[i]["txtarrayjson"].ToString();
//                        userlistbizmp.Add(objuserentity);

//                    }
//                }
//            }
//            catch (Exception)
//            {
//                userlistbizmp = null;
//                throw;
//            }
//            return userlistbizmp;
//        }


//        public List<UserEntity> GetElectionDataChartViewbyConstituency(string district)
//        {
//            List<UserEntity> userlistbizmp = new List<UserEntity>();
//            DataSet ds = new DataSet();
//            try
//            {
//                ds = admindac.GetElectionDataChartViewbyConstituency(district);
//                if (ds.Tables.Count > 0)
//                {
//                    var dstable = ds.Tables[0];
//                    for (int i = 0; i < dstable.Rows.Count; i++)
//                    {
//                        UserEntity objuserentity = new UserEntity();
//                        objuserentity.strParticipatingFrom = dstable.Rows[i]["txtconstituency"].ToString();
//                        objuserentity.strjson = dstable.Rows[i]["txtarrayjson"].ToString();

//                        userlistbizmp.Add(objuserentity);

//                    }
//                }
//            }
//            catch (Exception)
//            {
//                userlistbizmp = null;
//                throw;
//            }
//            return userlistbizmp;
//        }


//    }
//}
