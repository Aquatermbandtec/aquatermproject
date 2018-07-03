﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;


namespace ProjetoAquaTerm
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["nomeUsuario"] = "";
        }

        protected void btnLogar_Click(object sender, EventArgs e)
        {
            string nome = txtUser.Text;
            string senha = txtSenha.Text;

            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();

            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                SqlCommand command = conn.CreateCommand();
                command.CommandText = "SELECT id, nome,senha FROM tbUsuarios WHERE nome LIKE @nome and senha LIKE @senha";
                command.Parameters.AddWithValue("@nome", nome);
                command.Parameters.AddWithValue("@senha", senha);

              
                //string linhaDeComando = command.ExecuteScalar() as string;
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        int id = reader.GetInt32(0);
                        string rNome = reader.GetString(1);
                        string rSenha = reader.GetString(2);

                        if (string.IsNullOrEmpty(nome) || string.IsNullOrEmpty(senha))
                        {
                            this.lblMensagem.Text = "Por favor preencha o(s) campo(s) obrigatório";
                        }
                        else {
                            if (rNome == nome && rSenha == senha)
                            {
                                 Session["nomeUsuario"] = nome;
                                 Session["idUsuario"] = id;
                                 Response.Redirect("Sistema.aspx");
                            }
                              else
                              {
                                 this.lblMensagem.Text = "Usuário ou senha incorretos";
                              }
                        }
                }
            }
                conn.Close();
            }
        }
    }
}



