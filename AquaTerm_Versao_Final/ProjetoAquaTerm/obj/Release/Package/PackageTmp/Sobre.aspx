<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sobre.aspx.cs" Inherits="ProjetoAquaTerm.Sobre" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="img/logoPequeno.ico" type="image/x-icon" />
    <title>AquaTerm | Sobre Nós</title>
    <link rel="stylesheet" type="text/css" href="css/sobre.css" />
</head>
<body>
    <!-- INICIO DO MENU -->
		<ul id="menuID">
			<a href="Inicio.aspx"><img class="logo" src="img/logoPrincipal.png"></a>
			<li class="logar"><a href="Login.aspx" target="blank" title="Entrar no sistema"><img class="loginIcon" src="img/login.png" a href="#"></a>
			
			</li>
			
			<!--<li class="menu"><a href="Manual.html"><p>MANUAL</p></a></li>-->
			<li class="menu"><a href="Contato.aspx"><p>CONTATO</p></a></li>
			<li class="menu"><a href="Sobre.aspx"><p>SOBRE NÓS</p></a></li>
			
		</ul>
		<!-- FIM DO MENU -->	
		
		<!--INICIO INTEGRANTES-->		
		<div id="integrantes"><p class="inte">INTEGRANTES</p>

			<div id= "integrante1"><p id="int1"> Thiago Lima</p></div>
			<div id= "integrante2"><p id="int2"> Giuliana Miniguiti</p></div>
			<div id= "integrante3"><p id="int3"> Caio Massayuki</p></div>
			<div id= "integrante4"><p id="int4"> Gustavo Batistuti</p></div>
			<div id= "integrante5"><p id="int5"> Andressa Souza</p></div>

		</div>
		<!--FIM INTEGRANTES-->
		
		<div id="conteudoP"> 
			<h1>O QUE NÓS FAZEMOS ?</h1>
			<p>
O projeto AquaTermº oferece um gerenciador de temperatura para aquários, com objetivo de facilitar o controle e visualização do usuário, aumentando a expectativa de vida dos peixes e inovando com criatividade e tecnologia IoT.
			</p>
		</div>
		
		<!--INICIO SOBRE NOS-->	
		<div class="riscaHori">SOBRE NÓS</div>

		<div id="blocos">

			<div id= "bloco1"><img src="img/missao.png">
			<h1>Missão</h1>
			<p id="qmSomos">Facilitar o controle e manutenção do aquario, aumentando a vida util do peixe e otimizando seu tempo</p>
			</div>

			<div id= "bloco2"><img src="img/visao.png">
			<h1>Visão</h1>
			<p id="projet">Ser referencia na manutenção e controle de temperatura em aquarios, operando como facilitador.</p>
			</div>

			<div id= "bloco3"><img src="img/valores.png"">
			<h1>Valores</h1>
			<p id="ideia">Preocupação, Qualidade e Tecnologia é a motivação para criação da solução IoT AquaTermº </p>
			</div>
		
		</div>
		<!--FIM SOBRE NOS-->


		
		<div id="rodape">
			<div id= "infor">
				<img class="redeIcon" src="img/map.png" a href="#">
				<p id="titulo">ENDEREÇO E TELEFONE</p>
				<p id="info">
					Rua Haddock Lobo, 595 - Cerqueira César, São Paulo - SP, 01310-300<br><br>
					Telefone: 4002-8922<br><br>
                    Suporte 24h: <a href ="https://aquaterm.supportsystem.com/" target="_blank">https://aquaterm.supportsystem.com/</a>
				
				</p>
			</div>
			
			<div id= "risca"></div>
			
			<div id="redeSoc">
				<p id="titleRede">AQUA TERM COM VOCÊ:</p>
				
				<img class="redeIcon" src="img/face.png" a href="#">
				<img class="redeIcon" src="img/insta.png" a href="#">
				<img class="redeIcon" src="img/twitter.png" a href="#">
				<img class="redeIcon" src="img/github.png" a href="#">
			</div>			
		</div>
</body>
</html>
