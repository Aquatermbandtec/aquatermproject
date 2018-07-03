using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;
using System.Net.Mail;

namespace ProjetoAquaTerm
{
    public partial class Sistema : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //SELECT DO AQUARIO
            if (IsPostBack == false)
            {
                lblUsuario.Text = (string)Session["nomeUsuario"];

                if (lblUsuario.Text == "")
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                
            
            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();
            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                //O cmd precisa saber ter a referencia a conexão para executar o comando.
                using (SqlCommand cmd = new SqlCommand("SELECT IDpeixe, nomePx, especiePx, temperaturaPx FROM tbAquario WHERE idUsuario = @id", conn))
                {
                    cmd.Parameters.AddWithValue("@id", Session["idUsuario"]);

                    List<Peixe> peixes = new List<Peixe>();

                    //string linhaDeComando = command.ExecuteScalar() as string;
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read() == true)
                        {
                            Peixe p = new Peixe();
                            p.Id = reader.GetInt32(0);
                            p.Nome = reader.GetString(1);
                            p.Especie = reader.GetString(2);
                            p.Temperatura = reader.GetInt32(3);
                            peixes.Add(p);
                        }
                    }

                    repetidor.DataSource = peixes;
                    repetidor.DataBind();
                }
                using (SqlCommand cmd = new SqlCommand("SELECT notas FROM tbUsuarios WHERE id = @id"))
                {
                    cmd.Parameters.AddWithValue("@id", Session["idUsuario"]);

                    //O cmd precisa saber ter a referencia a conexão para executar o comando.
                    cmd.Connection = conn;
                    //string linhaDeComando = command.ExecuteScalar() as string;
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read() == true)
                        {
                            if (reader.IsDBNull(0))
                            {

                            }
                            else
                            {
                                txtAnotacoes.Text = reader.GetString(0);
                            }
                        }

                    }
                }
                //temperatura ideal

                using (SqlCommand cmd = new SqlCommand("SELECT tempIdeal FROM tbUsuarios WHERE id = @id"))
                {
                    cmd.Parameters.AddWithValue("@id", Session["idUsuario"]);
                    cmd.Connection = conn;

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                            while (reader.Read() == true)
                            {
                                if (reader.IsDBNull(0))
                                {


                                }
                                else
                                {
                                    txtValorTemp.Text = reader.GetInt32(0).ToString();


                                }
                            }
                        }
                    }
                }
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();
            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("UPDATE tbUsuarios SET notas = @notas WHERE id = @id"))
                {
                    cmd.Parameters.AddWithValue("@id", HttpContext.Current.Session["idUsuario"]);
                    cmd.Parameters.AddWithValue("@notas", txtAnotacoes.Text);

                    cmd.Connection = conn;
                    cmd.ExecuteNonQuery();

                }
            }
        }

        protected void btnValorTemp_Click(object sender, EventArgs e)
        {

            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();
            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("UPDATE tbUsuarios SET tempIdeal = @valorTemp WHERE id = @id"))
                {
                    cmd.Parameters.AddWithValue("@id", HttpContext.Current.Session["idUsuario"]);
                    cmd.Parameters.AddWithValue("@valorTemp", txtValorTemp.Text);

                    cmd.Connection = conn;
                    cmd.ExecuteNonQuery();


                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Temperatura máxima ideal para seu " +
                        "aquário foi salva, você será notificado se essa temperatura ultrapassar o valor desejado')", true);

                }
            }
        }


        protected void repetidor_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            TextBox txtNomePeixe = (TextBox)e.Item.FindControl("txtNomePeixe");
            TextBox txtEspeciePeixe = (TextBox)e.Item.FindControl("txtEspeciePeixe");
            TextBox txtTemperaturaPeixe = (TextBox)e.Item.FindControl("txtTemperaturaPeixe");
            HiddenField idPeixe = (HiddenField)e.Item.FindControl("idPeixe");
         
            int id, temp;
            int.TryParse(idPeixe.Value, out id);
            int.TryParse(txtTemperaturaPeixe.Text, out temp);

            if (txtNomePeixe.Text == "" || txtEspeciePeixe.Text == "" || txtTemperaturaPeixe.Text == "" || id <= 0 || temp < 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Por favor preencha os campos necessários')", true);
                return;
            }

           
            string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();
            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand("UPDATE tbAquario SET nomePx = @nomePx, especiePx = @especiePx, temperaturaPx = @temperaturaPx WHERE IDpeixe = @IDpeixe", conn))
                {
                    cmd.Parameters.AddWithValue("@nomePx", txtNomePeixe.Text);
                    cmd.Parameters.AddWithValue("@especiePx", txtEspeciePeixe.Text);
                    cmd.Parameters.AddWithValue("@temperaturaPx", temp);
                    cmd.Parameters.AddWithValue("@IDpeixe", id);

                    cmd.ExecuteNonQuery();

                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Peixe salvo!!!')", true);
                }
            }

            //if (txtNomePeixe1.Text == "" || txtEspeciePeixe1.Text == "" || txtTemperaturaPeixe1.Text == "")
            //{
            //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Por favor preencha os campos necessários')", true);
            //}
            //else
            //{
            //    string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();
            //    //if (idPeixe1.Value == null)
            //    //{
            //    using (SqlConnection conn = new SqlConnection(strConn))
            //    {
            //        conn.Open();

            //        using (SqlCommand cmd = new SqlCommand("INSERT INTO tbAquario (fotoPx, nomePx, especiePx, temperaturaPx) VALUES (@fotoPx, @nomePx, @especiePx, @temperaturaPx)"))
            //        {
            //            cmd.Parameters.AddWithValue("@fotoPx", FileUploadPeixe1.FileName);
            //            cmd.Parameters.AddWithValue("@nomePx", txtNomePeixe1.Text);
            //            cmd.Parameters.AddWithValue("@especiePx", txtEspeciePeixe1.Text);
            //            cmd.Parameters.AddWithValue("@temperaturaPx", txtTemperaturaPeixe1.Text);

            //            cmd.Connection = conn;
            //            cmd.ExecuteNonQuery();

            //            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Peixe Cadastrado!!!')", true);
            //        }
            //    }
            //    //}
            //    //else
            //    //{
            //    //    using (SqlConnection conn = new SqlConnection(strConn))
            //    //    {
            //    //        conn.Open();

            //    //        using (SqlCommand cmd = new SqlCommand("UPDATE tbAquario SET nomePx = @nomePx, especiePx = @especiePx, temperaturaPx = @temperaturaPx WHERE IDpeixe = @idPeixe", conn))
            //    //        {
            //    //            cmd.Parameters.AddWithValue("@nomePx", txtNomePeixe1.Text);
            //    //            cmd.Parameters.AddWithValue("@especiePx", txtEspeciePeixe1.Text);
            //    //            cmd.Parameters.AddWithValue("@temperaturaPx", txtTemperaturaPeixe1.Text);
            //    //            cmd.Parameters.AddWithValue("@idPeixe", int.Parse(idPeixe1.Value));

            //    //            cmd.ExecuteNonQuery();
            //    //            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Peixe Alterado!!!')", true);
            //    //        }
            //    //    }
            //    //}
            //}
            ////{
            ////    if (txtNomePeixe1.Text == "" || txtEspeciePeixe1.Text == "" || txtTemperaturaPeixe1.Text == "")
            ////    {
            ////        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Por favor preencha os campos necessários')", true);
            ////    }
            ////    else
            ////    {


            ////        string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();
            ////        using (SqlConnection conn = new SqlConnection(strConn))
            ////        {
            ////            conn.Open();

            ////            using (SqlCommand cmd = new SqlCommand("INSERT INTO tbAquario2 (nomePeixe, especiePeixe, temperaturaPeixe, idUsuario) VALUES (@nomePx, @especiePx, @temperaturaPx, @id)"))
            ////            {
            ////                cmd.Parameters.AddWithValue("@nomePx", txtNomePeixe1.Text);
            ////                cmd.Parameters.AddWithValue("@especiePx", txtEspeciePeixe1.Text);
            ////                cmd.Parameters.AddWithValue("@temperaturaPx", txtTemperaturaPeixe1.Text);
            ////                cmd.Parameters.AddWithValue("@id", Session["idUsuario"]);

            ////                cmd.Connection = conn;
            ////                cmd.ExecuteNonQuery();

            ////                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Primeiro Peixe Cadastrado!!!')", true);
            ////            }


            ////        }
            ////    }
            ////}
        }

        protected void btnInsere_Click(object sender, EventArgs e)
        {
            if (txtNomePeixel.Text == "" || txtEspeciePeixel.Text == "" || txtTemperaturaPeixel.Text == "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Por favor preencha os campos necessários')", true);
                }
                else
                {

                    string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();
                    using (SqlConnection conn = new SqlConnection(strConn))
                    {
                        conn.Open();

                        using (SqlCommand cmd = new SqlCommand("INSERT INTO tbAquario (nomePx, especiePx, temperaturaPx, idUsuario, id_usuario) VALUES (@nomePx, @especiePx, @temperaturaPx, @id, @id)"))
                        {
                            cmd.Parameters.AddWithValue("@nomePx", txtNomePeixel.Text);
                            cmd.Parameters.AddWithValue("@especiePx", txtEspeciePeixel.Text);
                            cmd.Parameters.AddWithValue("@temperaturaPx", txtTemperaturaPeixel.Text);
                            cmd.Parameters.AddWithValue("@id", Session["idUsuario"]);

                            cmd.Connection = conn;
                            cmd.ExecuteNonQuery();

                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Peixe Cadastrado!!!')", true);
                    }


                    }
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void btnRelatorio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Relatorio.aspx");
        }
    }
}