using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;

namespace ProjetoAquaTerm
{
    public partial class Sistema : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUsuario.Text = (string)Session["nomeUsuario"];

            if (lblUsuario.Text == "") {
                Response.Redirect("Login.aspx");
            }
        }
    }
}