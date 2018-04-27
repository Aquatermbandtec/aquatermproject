<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contato.aspx.cs" Inherits="ProjetoAquaTerm.Contato" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <link rel="stylesheet" type="text/css" href="css/contato.css" />
    <title>Contato</title>
</head>
<body>
    <!-- INICIO DO MENU -->
		<ul>
			<a href="Inicio.aspx"><img class="logo" src="img/peixinho2.png"></a>
			<li class="logar"> <a href="Login.aspx" target="blank" title="Entrar no sistema"><img class="loginIcon" src="img/loginB.png" a href="#"></a>
			</li>
			
			
			<li class="menu"><a href="Contato.aspx"><p>CONTATO</p></a></li>
            <li class="menu"><a href="Sobre.aspx"><p>SOBRE NÓS</p></a></li>
		</ul>
		<!-- FIM DO MENU -->	
		
		<div id="conteudoDaP">
		
			
			
			
			<div class="riscaHori">CONTATO</div>
			<p id="texto">Está precisando de um help? Entre em contato com a gente que te ajudaremos!
			<br><br>
			Deixe aqui embaixo seus dados e a mensagem que deseja enviar que responderemos assim que possível
			</p>
			
			<form id="formContato" runat="server" name="Contato">
				<div class="divform">
					<label for="nome">Nome:</label>
                    <asp:TextBox ID="txtNomeUsuario" runat="server" placeholder="Seu Nome"></asp:TextBox>
				</div>
				<div class="divform">
					<label for="email">E-Mail:</label>
                    <asp:TextBox ID="txtEmailUsuario" runat="server" TextMode="Email" placeholder="Seu E-mail" ></asp:TextBox>
				</div>
				<div class="divform">
					<label for="msg">Mensagem:</label>
                    <asp:TextBox ID="TxtAreaMensagem" runat="server" TextMode="MultiLine" placeholder="Sua Mensagem" CssClass="txtAreaMensagem"></asp:TextBox>
				</div>
				<div class="button">
                    <asp:Button ID="btnEnviar" runat="server" Text="Enviar Sua Mensagem" CssClass="btnEnviar" OnClick="btnEnviar_Click" />
				</div>
			</form>
		</div>
		
		<div id="rodape">
			<div id= "infor">
				<img class="redeIcon" src="img/map.png"/>
				<p id="titulo">ENDEREÇO E TELEFONE</p>
				<p id="info">
					Rua Haddock Lobo, 595 - Cerqueira César, São Paulo - SP, 01310-300<br><br>
					Telefone: 4567-8977
				</p>
			</div>
			
			<div id= "risca"></div>
			
			<div id="redeSoc">
				<p id="titleRede">AQUA TERM COM VOCÊ:</p>
				
				<img class="redeIcon" src="img/face.png"/>
				<img class="redeIcon" src="img/insta.png"/>
				<img class="redeIcon" src="img/twitter.png"/>
				<img class="redeIcon" src="img/github.png"/>
			</div>			
		</div>
</body>
</html>
