using System.Data.Sql;
using System.Data;
using System.Web.Services;
using System.Configuration;
using System.Data.SqlClient;

namespace ProjetoAquaTerm.controller
{
    public partial class AtualizaMediana : System.Web.UI.Page
    {

        [WebMethod]
        public static double temperaturaMediana()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:pazthiago1.database.windows.net,1433;Initial Catalog=bdProjeto;Persist Security Info=False;User ID=pazthiago1;Password=Projeto123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY[valor]) OVER(PARTITION BY 1) from leitura", conn))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read() == true)
                        {
                            return double.Parse(dr["valor"].ToString());
                        }
                        else
                        {
                            return 0;
                        }
                    }
                }
            }

        }
    }
}