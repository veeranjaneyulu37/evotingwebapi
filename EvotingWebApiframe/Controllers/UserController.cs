using EvotingBizlayer1;
using EvotingEntity1;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;

namespace EvotingWebApiframe.Controllers
{
    public class UserController : ApiController
    {
        UserBiz bizlayer = new UserBiz();




        [System.Web.Http.AcceptVerbs("GET", "POST")]
        // users to caste their vote
        [HttpPost]
        public string CastUserVote(string votersid, string PPersonName, string Party, string Position)
        {
            string message = "";
            try
            {
                message = bizlayer.CastUserVote(votersid, PPersonName, Party,Position);

            }
            catch (Exception)
            {
                message = "-9";
                throw;
            }
            return message;
        }
        public static void Log(string message)
        {
            StringBuilder sb = new StringBuilder();
            string path = @"D:\";
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            path = path + @"\Log" + (((DateTime.Now.Year * 100) + DateTime.Now.Month) * 100 + DateTime.Now.Day).ToString();
            sb.Append(message + Environment.NewLine);
            File.AppendAllText(path + ".txt", sb.ToString());
            sb.Clear();

        }

        [HttpGet]
        public List<User> GetAccess(string userid)
            
        {
            Log("started");
          
            List<User> response = new List<User>();
            try
            {
                Log("hitted biz");
                response = bizlayer.GetAccess(userid);
                Log(response.ToString());
            }
            catch (Exception ex)
            {
                response = null;
                Log("entterd catch");
                Log(ex.Message.ToString());
                Log(ex.InnerException.ToString());
                throw ex;
                
               
            }
            return response;
        }
        [HttpGet]
        public string SendOtp(string mobilenumber)
        {
            var otp = "";
            try
            {
                otp = bizlayer.Otp(mobilenumber);
            }
            catch (Exception e)
            {

                throw e;
            }
            return otp;
        }


    }
}
