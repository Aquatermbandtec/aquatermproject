<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AtualizaMediana.aspx.cs" Inherits="ProjetoAquaTerm.controller.AtualizaMediana" %>

           <%

                string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();

                using (System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(strConn))
            {

                    conn.Open();
                    System.Data.SqlClient.SqlCommand command = conn.CreateCommand();
                    command.CommandText = "SELECT DISTINCT PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY [valor]) OVER(PARTITION BY 1) from leitura";

                    System.Data.SqlClient.SqlDataReader rd = command.ExecuteReader();

                    if (rd.Read())
                    {
                        Response.Write(rd.GetDouble(0));
                        
                    }
                }

                %>
