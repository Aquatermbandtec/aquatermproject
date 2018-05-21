using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;


namespace ProjetoAquaTerm
{
    public partial class Contato : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {

            string remetenteEmail = "aquatermsuporte@gmail.com"; //variavel String está recebendo o email do nosso grupo que criei

            MailMessage mail = new MailMessage(); // instacia MailMessage uma espécie de "API"

            mail.To.Add(txtEmailUsuario.Text); // adiciona o destinatário que vai receber a caixa de texto que o usuario vai digitar

            mail.From = new MailAddress(remetenteEmail, "AquaTerm", System.Text.Encoding.UTF8); // acrescenta o nome do remetente

            mail.Subject = txtAssunto.Text; // adiciona um assunto para o email que vai receber a caixa de texto assunto

            mail.SubjectEncoding = System.Text.Encoding.UTF8; // codifica o assunto para o padrao UTF-8 do html

            mail.Body = "Olá "+txtNomeUsuario.Text+" iremos resolver o seu problema o mais rápido possivel"; // corpo da mensagem que será enviada que vai receber a caixa de texto mensagem

            mail.BodyEncoding = System.Text.Encoding.UTF8; // codifica a caixa de texto para o padrao UTF-8 do html

            mail.IsBodyHtml = true; // o corpo da mensagem vai ser padronizada html recebendo true

            mail.Priority = MailPriority.High; //Prioridade do E-Mail

            
            SmtpClient client = new SmtpClient();  //Adicionando as credenciais do seu e-mail e senha:

            client.Credentials = new System.Net.NetworkCredential(remetenteEmail, "Projeto123"); // insere a senha e o remetente do email do aquaterm que criei



            client.Port = 587; // Esta porta é a utilizada pelo Gmail para envio

            client.Host = "smtp.gmail.com"; //Definindo o provedor que irá disparar o e-mail

            client.EnableSsl = true; //Gmail trabalha com Server Secured Layer

            try

            {

                client.Send(mail);

                Response.Write("<script>alert('Mensagem enviada com sucesso');</script>");

            }

            catch (Exception ex)

            {
                Response.Write("<script>alert('Ocorreu um erro ao enviar :(');</script>");


            }

        }





        }
    }
