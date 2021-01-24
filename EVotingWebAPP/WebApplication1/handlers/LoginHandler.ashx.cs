using EvotingBizlayer1;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace WebApplication1.handlers
{
    /// <summary>
    /// Summary description for LoginHandler
    /// </summary>
    public class LoginHandler : IHttpHandler,IRequiresSessionState
    {
        
        private LoginBiz loginbiz;
        public LoginBiz Lbiz
        {
            get
            {
                return loginbiz;
            }
            set
            {
                loginbiz = value;
            }
        }
        public LoginHandler()
        {
            loginbiz = new LoginBiz();
        }


        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");

            switch (context.Request["CallName"])
            {
                case "GetUIAccess":
                   context.Response.Write( GetUIAccess(context.Request.Form["voterid"].ToString()));
                    break;

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

        //to get the role and navigate to respective Pages.
        public object GetUIAccess(string voterid)
        {
            object Role;
            try
            {
                Role = loginbiz.GetUserRole(voterid);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException);
                Role = $"{ex.InnerException}";
            }
            return JsonConvert.SerializeObject(Role);
        }
    }
}