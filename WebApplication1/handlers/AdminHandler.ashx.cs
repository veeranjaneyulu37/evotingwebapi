//using EvotingBizLayer1;
//using EvotingEntity1;
//using Newtonsoft.Json;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;

//namespace EvotingWebApplication1.handlers
//{
//    /// <summary>
//    /// Summary description for AdminHandler
//    /// </summary>
//    public class AdminHandler : IHttpHandler
//    {

//        private AdminBiz adminbiz;
//        public AdminBiz abiz { get; set; }
        
//        public AdminHandler()
//        {
//            adminbiz = new AdminBiz();
//        }

//        public void ProcessRequest(HttpContext context)
//        {
//            switch (context.Request["CallName"])
//            {
//                case "GetElectionDataChartViewbyConstituency":
//                    context.Response.Write(GetElectionDataChartViewbyConstituency(context.Request.Form["DistrictNames"].ToString()));
//                    break;
//                case "GetElectionDataChartViewByStatewise":
//                    context.Response.Write(GetElectionDataChartViewByStatewise());
                
//                    break;
//                case "GetElectionDataChartViewBydistrict":
//                    context.Response.Write(GetElectionDataChartViewBydistrict(context.Request.Form["Statename"].ToString()));
//                    break;
//                case "GetCandidatesData":
//                    context.Response.Write(GetCandidatesData());
//                    break;
//                case "UploadParticipantData":
//                    context.Response.Write(UploadParticipantData(context.Request.Form["PPersonName"].ToString(), context.Request.Form["Party"].ToString(), context.Request.Form["locationfrom"].ToString(), context.Request.Form["state"].ToString(), context.Request.Form["district"].ToString(), context.Request.Form["city"].ToString(), context.Request.Form["country"].ToString(), context.Request.Form["Role"].ToString()));
//                    break;
//                //case "BUlkUploadNewParties":
//                //    context.Response.Write(BUlkUploadNewParties(context.Request.Form["votersid"].ToString(), context.Request.Form["PPersonName"].ToString(), context.Request.Form["Party"].ToString()));
//                //    break;


//                default:
//                    throw new ArgumentException("Unknown Method");
//            }
//        }


//        public bool IsReusable
//        {
//            get
//            {
//                return false;
//            }
//        }


//        //add data for the participants in each election
//        public string UploadParticipantData(string PPersonName,string Party, string locationfrom,string state,string district,string city,string country,string Role)
//        {
//            List<UserEntity> list = new List<UserEntity>();
//            string response = "";
//            try
//            {
//                response = adminbiz.UploadParticipantData(PPersonName,Party,locationfrom,state,district,city,country,Role);
                
//            }
//            catch (Exception ex)
//            {
//                Console.WriteLine(ex.InnerException);
//                response = null;
//                throw;
//            }

//            return JsonConvert.SerializeObject(response);
//        }
        
        

//        public string GetCandidatesData()
//        {
//            List<UserEntity> candidateslist = new List<UserEntity>();
//            try
//            {
//                candidateslist = adminbiz.GetCandidatesData();
//            }
//            catch (Exception ex)
//            {
//                Console.WriteLine(ex.InnerException);
//                candidateslist = null;
//                throw;
//            }

//            return JsonConvert.SerializeObject(candidateslist);
//        }
//        //progress of no of casted votes add a dropdown too select state
//        public string GetElectionDataChartViewByStatewise()
//        {
//            List<UserEntity> list = new List<UserEntity>();
//            try
//            {
//                list = adminbiz.GetElectionDataChartViewByStatewise();
//            }
//            catch (Exception ex)
//            {
//                Console.WriteLine(ex.InnerException);
//                list = null;
//                throw;
//            }

//            return JsonConvert.SerializeObject(list);
//        }


//        public string GetElectionDataChartViewBydistrict(string Statename)
//        {
//            List<UserEntity> list = new List<UserEntity>();
//            try
//            {
//                list = adminbiz.GetElectionDataChartViewBydistrict(Statename);
//            }
//            catch (Exception ex)
//            {
//                Console.WriteLine(ex.InnerException);
//                list = null;
//                throw;
//            }

//            return JsonConvert.SerializeObject(list);
//        }
//        //progress of no of casted votes
//        public string  GetElectionDataChartViewbyConstituency(string DistrictNames)
//        {
//            List<UserEntity> list = new List<UserEntity>();
//            try
//            {
//                list = adminbiz.GetElectionDataChartViewbyConstituency(DistrictNames);
//            }
//            catch (Exception ex)
//            {
//                Console.WriteLine(ex.InnerException);
//                list = null;
//                throw;
//            }

//            return JsonConvert.SerializeObject(list);
//        }



//        public void BUlkUploadNewParties()
//        {

//        }


//        //data for each person participated in election as mla or mp add a dropdown too select 
//        public void GetLeadershipdata()
//        {

//        }

//    }
//}