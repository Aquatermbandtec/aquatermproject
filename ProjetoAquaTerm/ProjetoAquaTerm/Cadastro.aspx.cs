using System;
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
    public partial class Cadastro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            {
                if (txtUsuario.Text == "" || txtSenha.Text == "" || txtEmail.Text == "" || txtTelefone.Text == "") {

                  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Por favor preencha os campos necessários')", true);


                }
                else { 


                string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();
                using (SqlConnection conn = new SqlConnection(strConn))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("INSERT INTO tbUsuarios (nome, senha, email, telefone) VALUES (@nome, @senha, @email, @telefone)"))
                    {
                        cmd.Parameters.AddWithValue("@nome", txtUsuario.Text);
                        cmd.Parameters.AddWithValue("@senha", txtSenha.Text);
                        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@telefone", txtTelefone.Text);

                        cmd.Connection = conn;
                        cmd.ExecuteNonQuery();
                        
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Usuario Cadastrado com Sucesso!!')", true);
                        }
                    }
                }
            }
        }
    }
}