using EvotingBizlayer1;
using EvotingEntity1;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace EvotingWebApplication1.handlers
{
    /// <summary>
    /// Summary description for UserHandler
    /// </summary>
    public class UserHandler : IHttpHandler
    {

        private UserBiz userbiz;
        public UserBiz ubiz
        {
            get
            {
                return userbiz;
            }
            set
            {
                userbiz = value;
            }
        }
        public UserHandler()
        {
            userbiz = new UserBiz();
        }

        public void ProcessRequest(HttpContext context)
        {
            switch (context.Request["CallName"])
            {
                case "GetUserVoterInfo":
                    context.Response.Write(GetUserVoterInfo(context.Request.Form["userid"].ToString()));
                    break;
                case "CastUserVote":
                    context.Response.Write(CastUserVote(context.Request.Form["votersid"].ToString(), context.Request.Form["PPersonName"].ToString(), context.Request.Form["Party"].ToString(), context.Request.Form["position"].ToString()));
                    break;
                //case "ViewProgressionInUserLocationMLA":
                //    context.Response.Write(ViewProgressionInUserLocationMLA(context.Request.Form["voterid"].ToString()));
                //    break;
                //case "ViewProgressionInUserLocationMP":
                //    context.Response.Write(ViewProgressionInUserLocationMP(context.Request.Form["voterid"].ToString()));
                //    break;
                default:
                    throw new ArgumentException("Unknown Method");
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        //for user at pooling boths to caste their votes
        public string GetUserVoterInfo(string userid)
        {
            List<UserEntity> userlist = new List<UserEntity>();
            try
            {
                userlist = userbiz.GetUserVoterInfoMLA(userid);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException);
                userlist = null;
                throw;
            }

            return JsonConvert.SerializeObject(userlist);
        }
        //to add the respective vote , voted by user in election table.
        public string CastUserVote(string votersid,string PPersonName,string Party, string position)
        {
            string message = "";
            try
            {
                message = userbiz.CastUserVote(votersid, PPersonName, Party,position);
                
            }
            catch (Exception)
            {
                message = "-9";
                throw;
            }
            return message;
        }
        //public string  ViewProgressionInUserLocationMLA(string voterid)
        //{
        //    List<UserEntity> resultmlaview = new List<UserEntity>();
        //    try
        //    {
        //        resultmlaview = userbiz.ViewProgressionInUserLocationMLA(voterid);
        //    }
        //    catch (Exception)
        //    {
        //        resultmlaview = null;
        //        throw;
        //    }
        //    return JsonConvert.SerializeObject(resultmlaview);
        //}
        //need towrite sp 
        //public string ViewProgressionInUserLocationMP(string voterid)
        //{
        //    List<UserEntity> resultmpview = new List<UserEntity>();
        //    try
        //    {
        //        resultmpview = userbiz.ViewProgressionInUserLocationMP(voterid);
        //    }
        //    catch (Exception)
        //    {
        //        resultmpview = null;

        //        throw;
        //    }
        //    return JsonConvert.SerializeObject(resultmpview);
        //}
    }
}