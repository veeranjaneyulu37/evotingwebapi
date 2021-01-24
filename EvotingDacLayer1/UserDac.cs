using EvotingEntity1;
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EvotingDacLayer1
{
    public class UserDac
    {
        string DBcon = ConfigurationManager.ConnectionStrings["EvotingDbCon"].ConnectionString;


        //for user at pooling boths to caste their votes
        public DataSet GetUserVoterInfoMLA(string voterid)
        {
            //List<UserEntity> objreturn = new List<UserEntity>();
            SqlParameter[] arr_sqlparam = new SqlParameter[1];
            DataSet objuserdetails= new DataSet();
            try
            {
                arr_sqlparam[0] = new SqlParameter("@txtvoterid", SqlDbType.VarChar, 12);
                arr_sqlparam[0].Value = voterid;
                objuserdetails = SqlHelper.ExecuteDataset(DBcon, CommandType.StoredProcedure, "SpGetPartiesForUsersMLA", arr_sqlparam);
                
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException);
                objuserdetails = null;
            }
            finally
            {
                arr_sqlparam = null;
            }
            return objuserdetails;
        }

        public DataSet UpdatePin(string userid, string pin)
        {
            SqlParameter[] arr_sqlparam = new SqlParameter[2];
            DataSet objupdateresponse = new DataSet();
            try
            {
                arr_sqlparam[0] = new SqlParameter("@txtvoterid", SqlDbType.VarChar, 12);
                arr_sqlparam[0].Value = userid;
                arr_sqlparam[1] = new SqlParameter("@txtPin", SqlDbType.VarChar, 255);
                arr_sqlparam[1].Value = pin;
               
                objupdateresponse = SqlHelper.ExecuteDataset(DBcon, CommandType.StoredProcedure, "SpUpdatePin", arr_sqlparam);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException);
                objupdateresponse = null;
            }
            finally
            {
                arr_sqlparam = null;
            }
            return objupdateresponse;
        }

        public DataSet GetUserVoterInfoMP(string voterid)
        {
            //List<UserEntity> objreturn = new List<UserEntity>();
            SqlParameter[] arr_sqlparam = new SqlParameter[1];
            DataSet objuserdetails = new DataSet();
            try
            {
                arr_sqlparam[0] = new SqlParameter("@txtvoterid", SqlDbType.VarChar, 12);
                arr_sqlparam[0].Value = voterid;
                objuserdetails = SqlHelper.ExecuteDataset(DBcon, CommandType.StoredProcedure, "SpGetPartiesForUsersMP", arr_sqlparam);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException);
                objuserdetails = null;
            }
            finally
            {
                arr_sqlparam = null;
            }
            return objuserdetails;
        }


        //to add the respective vote , voted by user in election table.
        public DataSet CastUserVote(string votersid, string PPersonName, string Party, string Position)
        {
            SqlParameter[] arr_sqlparam = new SqlParameter[4];
            DataSet objcastvote = new DataSet();
            try
            {
                arr_sqlparam[0] = new SqlParameter("@txtvoterid", SqlDbType.VarChar, 12);
                arr_sqlparam[0].Value = votersid;
                arr_sqlparam[1] = new SqlParameter("@txtPartyname", SqlDbType.VarChar, 100);
                arr_sqlparam[1].Value = Party;
                arr_sqlparam[2] = new SqlParameter("@txtPPerson", SqlDbType.VarChar, 50);
                arr_sqlparam[2].Value = PPersonName;
                arr_sqlparam[3] = new SqlParameter("@txtPosition", SqlDbType.VarChar, 3);
                arr_sqlparam[3].Value = PPersonName;
                objcastvote = SqlHelper.ExecuteDataset(DBcon, CommandType.StoredProcedure, "SpInsertVotingdata", arr_sqlparam);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException);
                objcastvote = null;
            }
            finally
            {
                arr_sqlparam = null;
            }
            return objcastvote;
        }

        public DataSet GetAccess(string userid)
        {
            SqlParameter[] arr_sqlparam = new SqlParameter[1];
            DataSet userdata = new DataSet();
            try
            {
                arr_sqlparam[0] = new SqlParameter("@txtvoterid", SqlDbType.VarChar, 12);
                arr_sqlparam[0].Value = userid;
                userdata = SqlHelper.ExecuteDataset(DBcon, CommandType.StoredProcedure, "SpGetUIAccess", arr_sqlparam);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException);
                userdata = null;
                throw ex;
            }
            finally
            {
                arr_sqlparam = null;
            }
            return userdata;
        }



        public DataSet ViewProgressionInUserLocationMLA(string voterid)
        {
            SqlParameter[] arr_sqlparam = new SqlParameter[2];
            DataSet objuserdetailsMla = new DataSet();
            try
            {
                var role = "MLA";
                arr_sqlparam[0] = new SqlParameter("@txtvoterid", SqlDbType.VarChar, 12);
                arr_sqlparam[0].Value = voterid;
                arr_sqlparam[1] = new SqlParameter("@txtRole", SqlDbType.VarChar, 6);
                arr_sqlparam[1].Value =role ;

                objuserdetailsMla = SqlHelper.ExecuteDataset(DBcon, CommandType.StoredProcedure, "spResultofuserConstituency", arr_sqlparam);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException);
                objuserdetailsMla = null;
            }
            finally
            {
                arr_sqlparam = null;
            }
            return objuserdetailsMla;
        }
        public DataSet ViewProgressionInUserLocationMP(string voterid)
        {
            SqlParameter[] arr_sqlparam = new SqlParameter[2];
            DataSet objuserdetailsMp = new DataSet();
            try
            {
                var role = "MP";
                arr_sqlparam[0] = new SqlParameter("@txtvoterid", SqlDbType.VarChar, 12);
                arr_sqlparam[0].Value = voterid;
                arr_sqlparam[1] = new SqlParameter("@txtRole", SqlDbType.VarChar, 6);
                arr_sqlparam[1].Value = role;

                objuserdetailsMp = SqlHelper.ExecuteDataset(DBcon, CommandType.StoredProcedure, "spResultofuserConstituency", arr_sqlparam);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException);
                objuserdetailsMp = null;
            }
            finally
            {
                arr_sqlparam = null;
            }
            return objuserdetailsMp;
        }
    }
}
