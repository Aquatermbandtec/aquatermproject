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
            string remetenteEmail = "aquatermsuporte@gmail.com";
            MailMessage mail = new MailMessage();
            mail.To.Add(txtEmailUsuario.Text);
            mail.From = new MailAddress(remetenteEmail, "AquaTerm", System.Text.Encoding.UTF8);

            if(AssuntosList.SelectedItem.Value == "Arduino") { 
                mail.Subject = "Arduino"; 
                mail.SubjectEncoding = System.Text.Encoding.UTF8;
                mail.Body = "Olá "+txtNomeUsuario.Text+" desculpe o transtorno, nos envie seu arduino que iremos arruma-lo e entregaremos o mais rapido possível";
                mail.BodyEncoding = System.Text.Encoding.UTF8;
                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;
            }

            if (AssuntosList.SelectedItem.Value == "Problemas com medição de temperatura")
            {
                mail.Subject = "Problemas com medição de temperatura";
                mail.SubjectEncoding = System.Text.Encoding.UTF8;
                mail.Body = "Olá " + txtNomeUsuario.Text + " iremos reportar o erro para nossa equipe de desenvolvimento e ele será resolvido o mais breve possível";
                mail.BodyEncoding = System.Text.Encoding.UTF8;
                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;
            }

            if (AssuntosList.SelectedItem.Value == "Problemas com gráfico")
            {
                mail.Subject = "Problemas com gráfico";
                mail.SubjectEncoding = System.Text.Encoding.UTF8;
                mail.Body = "Olá " + txtNomeUsuario.Text + " iremos reportar o erro para nossa equipe de desenvolvimento e logo seu gráfico voltará ao normal";
                mail.BodyEncoding = System.Text.Encoding.UTF8;
                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;
            }

            if (AssuntosList.SelectedItem.Value == "Problemas com cadastro de peixe")
            {
                mail.Subject = "Problemas com cadastro de peixe";
                mail.SubjectEncoding = System.Text.Encoding.UTF8;
                mail.Body = "Olá " + txtNomeUsuario.Text + " iremos constatar nosso banco de dados e logo iremos resolver o problema";
                mail.BodyEncoding = System.Text.Encoding.UTF8;
                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;
            }

            if (AssuntosList.SelectedItem.Value == "Compra do produto")
            {
                mail.Subject = "Compra do produto";
                mail.SubjectEncoding = System.Text.Encoding.UTF8;
                mail.Body = "Olá " + txtNomeUsuario.Text + " ficamos felizes por seu interesse em nosso produto, infelizmente " +
                    "não realizamos a venda online, porém venha conhecer nosso estabelecimento na Rua Haddock Lobo, 595 - Cerqueira César," +
                    " São Paulo - SP, 01310-300 na Avenida Paulista. Se você for de muito longe, por favor responda esse email com seu endereço que a AquaTerm " +
                    "irá até você ";
                mail.BodyEncoding = System.Text.Encoding.UTF8;
                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;
            }

            if (AssuntosList.SelectedItem.Value == "FeedBack")
            {
                mail.Subject = "FeedBack";
                mail.SubjectEncoding = System.Text.Encoding.UTF8;
                mail.Body = "Olá " + txtNomeUsuario.Text + " agradecemos pelo seu FeedBack para nossa empresa";
                mail.BodyEncoding = System.Text.Encoding.UTF8;
                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;
            }

            SmtpClient client = new SmtpClient();
            client.Credentials = new System.Net.NetworkCredential(remetenteEmail, "Projeto123");
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;

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
