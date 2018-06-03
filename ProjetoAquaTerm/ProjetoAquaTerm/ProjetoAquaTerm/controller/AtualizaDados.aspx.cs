using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data;
using System.Web.Services;
using System.Configuration;
using System.Data.SqlClient;

namespace ProjetoAquaTerm
{
    public partial class AtualizaDados : System.Web.UI.Page
    {
        [WebMethod]
        public static double temperaturaAtual()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:pazthiago1.database.windows.net,1433;Initial Catalog=bdProjeto;Persist Security Info=False;User ID=pazthiago1;Password=Projeto123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();
                using(SqlCommand cmd = new SqlCommand("SELECT TOP 1 valor from leitura ORDER BY id_leitura DESC", conn))
                {
                    using(SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if(dr.Read() == true)
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

        [WebMethod]
        public static double temperaturaMaior()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:pazthiago1.database.windows.net,1433;Initial Catalog=bdProjeto;Persist Security Info=False;User ID=pazthiago1;Password=Projeto123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT MAX (valor) as 'valor' from leitura", conn))
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
        [WebMethod]
        public static double temperaturaMenor()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:pazthiago1.database.windows.net,1433;Initial Catalog=bdProjeto;Persist Security Info=False;User ID=pazthiago1;Password=Projeto123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT MIN (valor) as 'valor' from leitura", conn))
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
        [WebMethod]
        public static double temperaturaMedia()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:pazthiago1.database.windows.net,1433;Initial Catalog=bdProjeto;Persist Security Info=False;User ID=pazthiago1;Password=Projeto123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT AVG (valor) as 'valor' from leitura", conn))
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

        [WebMethod]
        public static double temperaturaMediana()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:pazthiago1.database.windows.net,1433;Initial Catalog=bdProjeto;Persist Security Info=False;User ID=pazthiago1;Password=Projeto123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY[valor]) OVER(PARTITION BY 1) AS 'valor' from leitura", conn))
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

        [WebMethod]
        public static double temperaturaQuartilTres()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:pazthiago1.database.windows.net,1433;Initial Catalog=bdProjeto;Persist Security Info=False;User ID=pazthiago1;Password=Projeto123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT PERCENTILE_CONT(0.75) WITHIN GROUP(ORDER BY [valor]) OVER(PARTITION BY 1) AS 'valor' from leitura", conn))
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

        [WebMethod]
        public static double temperaturaQuartilUm()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:pazthiago1.database.windows.net,1433;Initial Catalog=bdProjeto;Persist Security Info=False;User ID=pazthiago1;Password=Projeto123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT PERCENTILE_CONT(0.25) WITHIN GROUP(ORDER BY [valor]) OVER(PARTITION BY 1)AS 'valor' from leitura", conn))
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