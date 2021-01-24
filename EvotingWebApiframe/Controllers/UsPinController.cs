using EvotingBizlayer1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace EvotingWebApiframe.Controllers
{
    public class UsPinController : ApiController
    {
        UserBiz bizlayer = new UserBiz();
        [System.Web.Http.AcceptVerbs("GET", "POST")]
        [HttpPost]
        public string UpdatePin(string userid, string pin)
        {
            string message = "";
            try
            {
                message = bizlayer.UpdatePin(userid, pin);

            }
            catch (Exception)
            {
                message = "-9";
                throw;
            }
            return message;
        }
    }
}
