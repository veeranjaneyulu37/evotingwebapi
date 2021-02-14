using EvotingDacLayer1;
using EvotingEntity1;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

namespace EvotingBizlayer1

{
    public class UserBiz
    {
        
        String[] colorlst={"0xFFE8AA14","0xFF1BE7FF","0xFFFB7883","0xFFFCDDBC","0xFFb8d8ba","0xFFe4c1f9","0xFFf2ed6f","0xFFabfaa9","0xFFee4266","0xFFd95d39","0xFFffa9e7" };
        private UserDac userdac;
        public UserDac usdac { get; set; }
        public UserBiz()
        {
            userdac = new UserDac();
        }
        //for user at pooling boths to caste their votes
        public List<UserEntity> GetUserVoterInfoMLA(string voterid)
        {
            List<UserEntity> userlistbiz = new List<UserEntity>();
            DataSet ds = new DataSet();
            try
            {
                ds = userdac.GetUserVoterInfoMLA(voterid);
                if (ds.Tables.Count>0)
                {
                    var dstable = ds.Tables[0];
                    for (int i = 0; i < dstable.Rows.Count; i++)
                    {
                        UserEntity objuserentity = new UserEntity();
                        objuserentity.id = i.ToString();
                        objuserentity.strPartyName = dstable.Rows[i]["txtPartyName"].ToString();
                        objuserentity.StrPartyImage = dstable.Rows[i]["image"].ToString();
                        objuserentity.strPPersonName = dstable.Rows[i]["txtPPersonName"].ToString();
                        objuserentity.strPPersonImage = dstable.Rows[i]["txtPPersonImage"].ToString();
                        objuserentity.strPosition = dstable.Rows[i]["txtRole"].ToString();
                        objuserentity.color = colorlst[i];
                        userlistbiz.Add(objuserentity);

                    }
                }
                
            }
            catch (Exception ex)
            {
                userlistbiz = null;
                Console.WriteLine(ex.InnerException);

                throw;
            }
            return userlistbiz;
        }


        public List<UserEntity> GetUserVoterInfoMP(string voterid)
        {
            List<UserEntity> userlistbiz = new List<UserEntity>();
            DataSet ds = new DataSet();
            try
            {
                ds = userdac.GetUserVoterInfoMP(voterid);
                if (ds.Tables.Count > 0)
                {
                    var dstable = ds.Tables[0];
                    for (int i = 0; i < dstable.Rows.Count; i++)
                    {
                        UserEntity objuserentity = new UserEntity();
                        objuserentity.id = i.ToString();
                        objuserentity.strPartyName = dstable.Rows[i]["txtPartyName"].ToString();
                        objuserentity.StrPartyImage = dstable.Rows[i]["image"].ToString();
                        objuserentity.strPPersonName = dstable.Rows[i]["txtPPersonName"].ToString();
                        objuserentity.strPPersonImage = dstable.Rows[i]["txtPPersonImage"].ToString();
                        objuserentity.strPosition = dstable.Rows[i]["txtRole"].ToString();
                        objuserentity.color = colorlst[i];
                        userlistbiz.Add(objuserentity);

                    }
                }

            }
            catch (Exception ex)
            {
                userlistbiz = null;
                Console.WriteLine(ex.InnerException);

                throw;
            }
            return userlistbiz;
        }
        //to add the respective vote , voted by user in election table.
        public string CastUserVote(string votersid, string PPersonName, string Party,string Position)
        {
            string response = "";
            DataSet objds = new DataSet();
            try
            {
                objds = userdac.CastUserVote(votersid, PPersonName, Party,Position);
                if (objds.Tables.Count>0)
                {
                    var dstable = objds.Tables[0];
                    for (int i = 0; i < dstable.Rows.Count; i++)
                    {
                        response = dstable.Rows[i]["txtmessage"].ToString();
                    }
                    
                }
                
            }
            catch (Exception)
            {
                response = "-99";
                throw;
            }


            return response;

        }
        public string UpdatePin(string userid, string pin)
        {
            string response = "";
            DataSet objds = new DataSet();
            try
            {
                objds = userdac.UpdatePin(userid, pin);
                if (objds.Tables.Count > 0)
                {
                    var dstable = objds.Tables[0];
                    for (int i = 0; i < dstable.Rows.Count; i++)
                    {
                        response = dstable.Rows[i]["txtResponse"].ToString();
                    }

                }

            }
            catch (Exception e)
            {
                response = "-99";
                throw e;
            }


            return response;

        }
        public List<User> GetAccess(string userid)
        {
            List<User> userdata = new List<User>();
            DataSet userds = new DataSet();
            try
            {
                userds = userdac.GetAccess(userid);
                if (userds.Tables.Count > 0)
                {
                    var dstable = userds.Tables[0];
                    for (int i = 0; i < dstable.Rows.Count; i++)
                    {
                        User objuserentity = new User();
                        objuserentity.UserName = dstable.Rows[i]["txtUserName"].ToString();
                        objuserentity.AadharNumber = dstable.Rows[i]["txtAadharNumber"].ToString();
                        objuserentity.IsEligible = dstable.Rows[i]["flgis_eligible"].ToString();
                        objuserentity.IsVoted_mla = dstable.Rows[i]["flgisvoted_MLA"].ToString();
                        objuserentity.IsVoted_mp = dstable.Rows[i]["flgisvoted_MP"].ToString();
                        objuserentity.pin = dstable.Rows[i]["txtpin"].ToString();
                        objuserentity.MobileNum = dstable.Rows[i]["txtMblNo"].ToString();

                        userdata.Add(objuserentity);

                    }
                }
            }
            catch (Exception e)
            {
                userdata = null;

                throw e;
            }
            return userdata;
        }



        public void SendOtp(string mobileNumber,string otp)
            
        {
            mobileNumber = "+" + mobileNumber;
            var accountsid = Environment.GetEnvironmentVariable("AC7b6403c9e1256c003012aee712a6c9fd");
            try
            {
                 
                
                
                TwilioClient.Init("AC7b6403c9e1256c003012aee712a6c9fd", "7b119c320c68ddfe78c2a39ca743d6cc");
                var message = MessageResource.Create(
                    body: otp + "\n" +"Enter this Verification code  for logging into the VeeVote app.",
                    from: new Twilio.Types.PhoneNumber(" +16504092003"),
                    to:new Twilio.Types.PhoneNumber(mobileNumber)

                    );
                var res = message.Sid;

            }
            catch (Exception ex)
            {

                throw;
            }
            

            
        }
        public  string Otp(string mblno)
        {
            var otp = "";
            otp = generateOtp();
            SendOtp(mblno, otp);
            return otp;
        }

        public string generateOtp()
        {
            Random randomnumber = new Random();
            var generatednum="";
            try
            {
                generatednum = randomnumber.Next(0, 9999).ToString("0000");
            }
            catch (Exception ex)
            {
                generatednum = "";
                throw ex;
                
            }
            return generatednum;
        }
        

        //public List<UserEntity> ViewProgressionInUserLocationMLA(string voterid)
        //{
        //    List<UserEntity> userlistbizmla = new List<UserEntity>();
        //    DataSet ds = new DataSet();
        //    try
        //    {
        //        ds = userdac.ViewProgressionInUserLocationMLA(voterid);
        //        if (ds.Tables.Count > 0)
        //        {
        //            var dstable = ds.Tables[0];
        //            for (int i = 0; i < dstable.Rows.Count; i++)
        //            {
        //                UserEntity objuserentity = new UserEntity();
        //                objuserentity.strPartyName = dstable.Rows[i]["txtpartyname"].ToString();
        //                objuserentity.inttotalvotes = dstable.Rows[i]["totalvotes"].ToString();
        //                userlistbizmla.Add(objuserentity);

        //            }
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        userlistbizmla = null;
        //        throw;
        //    }
        //    return userlistbizmla;
        //}
        //public List<UserEntity> ViewProgressionInUserLocationMP( string voterid)
        //{
        //    List<UserEntity> userlistbizmp = new List<UserEntity>();
        //    DataSet ds = new DataSet();
        //    try
        //    {
        //        ds = userdac.ViewProgressionInUserLocationMP(voterid);
        //        if (ds.Tables.Count > 0)
        //        {
        //            var dstable = ds.Tables[0];
        //            for (int i = 0; i < dstable.Rows.Count; i++)
        //            {
        //                UserEntity objuserentity = new UserEntity();
        //                objuserentity.strPartyName = dstable.Rows[i]["totalvotes"].ToString();
        //                objuserentity.strPPersonName = dstable.Rows[i]["txtpartyname"].ToString();
        //                userlistbizmp.Add(objuserentity);

        //            }
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        userlistbizmp = null;
        //        throw;
        //    }
        //    return userlistbizmp;
        //}
    }
}
