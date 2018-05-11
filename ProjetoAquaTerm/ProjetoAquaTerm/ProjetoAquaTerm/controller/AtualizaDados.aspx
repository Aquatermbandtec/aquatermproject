<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AtualizaDados.aspx.cs" Inherits="ProjetoAquaTerm.AtualizaDados" %>

            <%

                string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();

                using (System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(strConn))
            {

                    conn.Open();
                    System.Data.SqlClient.SqlCommand command = conn.CreateCommand();
                    command.CommandText = "SELECT TOP 1 valor from leitura ORDER BY id_leitura DESC";

                    System.Data.SqlClient.SqlDataReader rd = command.ExecuteReader();

                    if (rd.Read())
                    {
                        Response.Write(rd.GetDecimal(0));
                        
                    }
                }

                %>

