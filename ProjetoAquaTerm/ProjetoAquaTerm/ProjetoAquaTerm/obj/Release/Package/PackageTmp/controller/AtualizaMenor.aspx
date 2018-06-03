<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AtualizaMenor.aspx.cs" Inherits="ProjetoAquaTerm.controller.AtualizaMenor" %>

     <%

                string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();

                using (System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(strConn))
            {

                    conn.Open();
                    System.Data.SqlClient.SqlCommand command = conn.CreateCommand();
                    command.CommandText = "SELECT MIN (valor) from leitura";

                    System.Data.SqlClient.SqlDataReader rd = command.ExecuteReader();

                    if (rd.Read())
                    {
                        Response.Write(rd.GetDecimal(0));
                        
                    }
                }

                %>
