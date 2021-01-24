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
    public class AdminDac
    {


        string DBcon = ConfigurationManager.ConnectionStrings["EvotingDbCon"].ConnectionString;
        //add data for the participants in each election
        public DataSet  UploadParticipantData(string PPersonName, string Party, string locationfrom, string state, string district, string city, string country, string Role)
        {
            SqlParameter[] arr_sqlparam = new SqlParameter[8];
            DataSet objaddperson = new DataSet();
            try
            {
                arr_sqlparam[0] = new SqlParameter("@txtPPersonName", SqlDbType.VarChar, 50);
                arr_sqlparam[0].Value = PPersonName;
                arr_sqlparam[1] = new SqlParameter("@txtPartyname", SqlDbType.VarChar, 100);
                arr_sqlparam[1].Value = Party;
                arr_sqlparam[2] = new SqlParameter("@txtParticipatingfrom", SqlDbType.VarChar, 100);
                arr_sqlparam[2].Value = locationfrom;
                arr_sqlparam[3] = new SqlParameter("@txtState", SqlDbType.VarChar, 50);
                arr_sqlparam[3].Value = state;
                arr_sqlparam[4] = new SqlParameter("@txtdistrict", SqlDbType.VarChar, 50);
                arr_sqlparam[4].Value = district;
                arr_sqlparam[5] = new SqlParameter("@txtcity", SqlDbType.VarChar, 50);
                arr_sqlparam[5].Value = city;
                arr_sqlparam[6] = new SqlParameter("@txtcountry", SqlDbType.VarChar, 10);
                arr_sqlparam[6].Value = country;
                arr_sqlparam[7] = new SqlParameter("@txtRole", SqlDbType.VarChar, 6);
                arr_sqlparam[7].Value = Role;
                objaddperson = SqlHelper.ExecuteDataset(DBcon, CommandType.StoredProcedure, "SpAddCandidates", arr_sqlparam);

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException);
                objaddperson = null;
            }
            finally
            {
                arr_sqlparam = null;
            }
            return objaddperson;
        }

        public DataSet GetCandidatesData()
        {
            DataSet objresultdetails = new DataSet();
            try
            {


                objresultdetails = SqlHelper.ExecuteDataset(DBcon, CommandType.StoredProcedure, "SpGetCandidates");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException);
                objresultdetails = null;
            }
            finally
            {

            }
            return objresultdetails;
        }

        //progress of no of casted votes
       
        //progress of no of casted votes add a dropdown too select state
        public DataSet GetElectionDataChartViewByStatewiseByBarGraph()
        {
            DataSet objresultdetails1 = new DataSet();
            try
            {


                objresultdetails1 = SqlHelper.ExecuteDataset(DBcon, CommandType.StoredProcedure, "spResultforAdminviewstatewise");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException);
                objresultdetails1 = null;
            }
            finally
            {

            }
            return objresultdetails1;
        }


        public DataSet GetElectionDataChartViewbydistrict(string state)
        {
            SqlParameter[] arr_sqlparam = new SqlParameter[1];
            DataSet objresultdetails = new DataSet();
            try
            {
                arr_sqlparam[0] = new SqlParameter("@txtState", SqlDbType.VarChar, 50);
                arr_sqlparam[0].Value = state;

                objresultdetails = SqlHelper.ExecuteDataset(DBcon, CommandType.StoredProcedure, "spResultforAdminviewDistrictwise",arr_sqlparam);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException);
                objresultdetails = null;
            }
            finally
            {

            }
            return objresultdetails;
        }

        public DataSet GetElectionDataChartViewbyConstituency(string district)
        {
            SqlParameter[] arr_sqlparam = new SqlParameter[1];
            DataSet objresultdetails = new DataSet();
            try
            {
                arr_sqlparam[0] = new SqlParameter("@txtdistrict", SqlDbType.VarChar, 50);
                arr_sqlparam[0].Value = district;

                objresultdetails = SqlHelper.ExecuteDataset(DBcon, CommandType.StoredProcedure, "spResultforAdminviewconstituencywise", arr_sqlparam);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException);
                objresultdetails = null;
            }
            finally
            {

            }
            return objresultdetails;
        }
    }
}
