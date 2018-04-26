 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sistema.aspx.cs" Inherits="ProjetoAquaTerm.Sistema" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="css/sistema.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>AquaTerm</title>
</head>
<body>
            <div id="menuLateral">
                <div id="usuario">

                    <div id ="foto"></div>
                    <span id="labelNome"><asp:Label ID="lblUsuario" runat="server" Text=""></asp:Label></span>
                </div>

                <ul>
                    <li >Início</li>
                    <li >Gráficos</li>
                    <li >Relatórios</li>
                    <li >Suporte</li>
                </ul>

                <ul id="menuSair"> 
                 <li><a href ="Login.aspx">Sair</a></li>
                </ul>
                    
            </div>
    
            <div id="blocos">
             Bem vindo, <b><%=(string)Session["nomeUsuario"]%></b>!  
            <div id="bloco1"></div>
            <div id="bloco2"></div>
            </div>
</body>
</html>
