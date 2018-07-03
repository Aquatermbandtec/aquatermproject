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
    public partial class Relatorio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lValida.Text = (string)Session["nomeUsuario"];
            if (lValida.Text == "")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                temperaturaMaior();
                temperaturaMenor();
                temperaturaMedia();
                temperaturaMediana();
                temperaturaQuartilUm();
                temperaturaQuartilTres();
                quantasForam();
                dadosUsuarios();
                desvioPadrao();


            }
        }


        [WebMethod]
        public void temperaturaMaior()
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
                            lbMaior.Text = Convert.ToInt32(dr["valor"]).ToString() + "ºC";
                        }
                    }
                }
            }
        }

        [WebMethod]
        public void temperaturaMenor()
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
                            lbMenor.Text = Convert.ToInt32(dr["valor"]).ToString() + "ºC";
                        }
                    }
                }
            }
        }

        [WebMethod]
        public void temperaturaMedia()
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
                            lbMedia.Text = Convert.ToInt32(dr["valor"]).ToString() + "ºC";
                        }
                    }
                }
            }
        }

        [WebMethod]
        public void temperaturaMediana()
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
                            lbMediana.Text = Convert.ToInt32(dr["valor"]).ToString() + "ºC";
                        }
                    }
                }
            }
        }

        [WebMethod]
        public void temperaturaQuartilTres()
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
                            lbQuartilTres.Text = Convert.ToInt32(dr["valor"]).ToString() + "ºC";
                        }
                    }
                }
            }
        }

        [WebMethod]
        public void temperaturaQuartilUm()
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
                            lbQuartilUm.Text = Convert.ToInt32(dr["valor"]).ToString() + "ºC";
                        }
                    }
                }
            }
        }

        public void quantasForam()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:pazthiago1.database.windows.net,1433;Initial Catalog=bdProjeto;Persist Security Info=False;User ID=pazthiago1;Password=Projeto123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(valor) FROM leitura", conn))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read() == true)
                        {
                            lQuantas.Text = dr.GetInt32(0).ToString();
                        }
                    }
                }
            }

        }

        public void dadosUsuarios()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:pazthiago1.database.windows.net,1433;Initial Catalog=bdProjeto;Persist Security Info=False;User ID=pazthiago1;Password=Projeto123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT nome,email,telefone FROM tbUsuarios WHERE id = @id", conn))
                {
                    cmd.Parameters.AddWithValue("@id", Session["idUsuario"]);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read() == true)
                        {
                            lNomeUser.Text = reader.GetString(0);
                            lEmailUser.Text = reader.GetString(1);
                            lTelefoneUser.Text = reader.GetString(2);
                        }
                    }
                }
            }
        }




        [WebMethod]
        public void desvioPadrao()
        {
            using (SqlConnection conn = new SqlConnection("Server=tcp:pazthiago1.database.windows.net,1433;Initial Catalog=bdProjeto;Persist Security Info=False;User ID=pazthiago1;Password=Projeto123;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT STDEV(distinct valor) as 'desvio' FROM leitura", conn))
                {
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read() == true)
                        {
                            lDesvio.Text = dr["desvio"].ToString();
                        }
                    }
                }
            }
        }
    }
}