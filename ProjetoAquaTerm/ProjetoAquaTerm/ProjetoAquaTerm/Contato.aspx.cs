using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjetoAquaTerm
{
    public partial class Contato : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Mensagem enviada com sucesso')", true);

            txtNomeUsuario.Text = "";
            txtEmailUsuario.Text = "";
            TxtAreaMensagem.Text = "";



        }
    }
}