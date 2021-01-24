﻿using EvotingBizlayer1;
using EvotingEntity1;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace EvotingWebApiframe.Controllers
{
    public class UserDetMPController : ApiController
    {
        UserBiz bizlayer = new UserBiz();
        //user home page for MP details
        [HttpGet]
        public string GetUserVoterInfoMP(string userid)
        {
            List<UserEntity> userlist = new List<UserEntity>();
            try
            {
                userlist = bizlayer.GetUserVoterInfoMP(userid);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException);
                userlist = null;
                throw;
            }

            return JsonConvert.SerializeObject(userlist);
        }
    }
}
