using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProjetoAquaTerm
{
    /// <summary>
    /// Descrição resumida de Foto
    /// </summary>
    public class Foto : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            context.Response.Cache.SetNoStore();
            context.Response.ContentType = "image/jpeg";
            int id;
            int.TryParse(context.Request.QueryString["id"], out id);
            string caminho = context.Server.MapPath($"~/App_Data/{id}.jpg");
            if (id <= 0 || System.IO.File.Exists(caminho) == false)
            {
                context.Response.WriteFile(context.Server.MapPath("~/img/peixeteste123.jpg"));
            }
            else
            {
                context.Response.WriteFile(caminho);
            }
        }

        public bool IsReusable
        {
            get
            {
                return true;
            }
        }
    }
}