<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AtualizaQuartilUm.aspx.cs" Inherits="ProjetoAquaTerm.controller.AtualizaQuartilUm" %>

           <%

                string strConn = ConfigurationManager.ConnectionStrings["MyDB"].ToString();

                using (System.Data.SqlClient.SqlConnection conn = new System.Data.SqlClient.SqlConnection(strConn))
            {

                    conn.Open();
                    System.Data.SqlClient.SqlCommand command = conn.CreateCommand();
                    command.CommandText = "SELECT DISTINCT PERCENTILE_CONT(0.25) WITHIN GROUP(ORDER BY [valor]) OVER(PARTITION BY 1) from leitura";

                    System.Data.SqlClient.SqlDataReader rd = command.ExecuteReader();

                    if (rd.Read())
                    {
                        Response.Write(rd.GetDouble(0));
                        
                    }
                }

                %>
