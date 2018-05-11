<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AtualizaMaior.aspx.cs" Inherits="ProjetoAquaTerm.controller.AtualizaMaior" %>


            <%

                string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();

                using (System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(strConn))
            {

                    conn.Open();
                    System.Data.SqlClient.SqlCommand command = conn.CreateCommand();
                    command.CommandText = "SELECT MAX (valor) from leitura";

                    System.Data.SqlClient.SqlDataReader rd = command.ExecuteReader();

                    if (rd.Read())
                    {
                        Response.Write(rd.GetDecimal(0));
                        
                    }
                }

                %>
