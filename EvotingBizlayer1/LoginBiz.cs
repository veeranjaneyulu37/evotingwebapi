using EvotingDacLayer1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EvotingBizlayer1
{
    public class LoginBiz
    {
        private LoginDac logindac;
        public LoginDac dac
        {
            get
            {
                return logindac;
            }
            set
            {
                logindac = value;
            }
        }
        public LoginBiz()
        {
            logindac = new LoginDac();
        }
        
        //to get the role and navigate to respective Pages.
        public object GetUserRole(string voterid)
        {
            object Role;
            try
            {
                Role = logindac.GetUserRole(voterid);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException);
                Role = $"{ex.InnerException}";
            }
            return Role;
        }
    }
}
