using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.ApplicationBlocks.Data;


namespace EvotingDacLayer1
{
    public class LoginDac
    {
       //string  DBcon = ConfigurationManager.ConnectionStrings["EvotingDbCon"].ConnectionString;
        string DBcon = ConfigurationManager.ConnectionStrings["EvotingDbCon"].ConnectionString;
        //to get the role and navigate to respective Pages.
        public object  GetUserRole(string voterid)
        {
            
            object result;
            SqlParameter[] arr_sqlparam = new SqlParameter[1];
            try
            {
               
                arr_sqlparam[0] = new SqlParameter("@txtvoterid", SqlDbType.VarChar, 12);
                arr_sqlparam[0].Value = voterid;
                result = SqlHelper.ExecuteScalar(DBcon,CommandType.StoredProcedure, "SpGetUIAccess",arr_sqlparam);
              
            }
            catch (Exception ex)
            {
                result = "No result found";
                throw;
            }
            return result;

        }
    }
}
