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




        
        // users to caste their vote
        [HttpPost]
        public String CastUserVote(string votersid, string PPersonName, string Party, string Position)
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
        [HttpGet]
        public String GetAccess(string userid)
            
        {
            Log("fluttercalled  the function");
            List<User> response = new List<User>();
            try
            {
                response = bizlayer.GetAccess(userid);
            }
            catch (Exception)
            {
                response = null;
                throw;
            }
            return JsonConvert.SerializeObject(response);
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
    }
}
