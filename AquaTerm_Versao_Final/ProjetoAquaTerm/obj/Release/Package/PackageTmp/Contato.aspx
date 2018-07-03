<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contato.aspx.cs" Inherits="ProjetoAquaTerm.Contato" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <link rel="stylesheet" type="text/css" href="css/contato.css" />
    <link rel="shortcut icon" href="img/logoPequeno.ico" type="image/x-icon" />

    <title>AquaTerm | Contato</title>
</head>
<body>
    <!-- INICIO DO MENU -->
		<ul>
			<a href="Inicio.aspx"><img class="logo" src="img/logobranco.png"></a>
			<li class="logar"> <a href="Login.aspx" target="blank" title="Entrar no sistema"><img class="loginIcon" src="img/loginB.png" a href="#"></a>
			</li>
			<li class="menu"><a href="Contato.aspx"><p>CONTATO</p></a></li>
            <li class="menu"><a href="Sobre.aspx"><p>SOBRE NÓS</p></a></li>
		</ul>
		<!-- FIM DO MENU -->	
		
		<div id="conteudoDaP">
			<div class="riscaHori">CONTATO</div>
			<p id="texto">Quer saber como adquirir nossa solução, precisa de ajuda ou gostaria de enviar um feedback ? Deixe aqui seu comentário e responderemos assim que possível :)

			</p>
			
			<form id="formContato" runat="server" name="Contato">
				<div class="divform">
					<label for="nome">Nome:</label>
                    <asp:TextBox ID="txtNomeUsuario" runat="server" placeholder="Seu Nome"></asp:TextBox>
				</div>
				<div class="divform">
					<label for="email">E-mail:</label>
                    <asp:TextBox ID="txtEmailUsuario" runat="server" TextMode="Email" placeholder="Seu E-mail" ></asp:TextBox>
				</div>
                <div class="divform">
					<label for="assunto">Assunto:</label>
                    <%--<asp:TextBox ID="txtAssunto" runat="server" placeholder="Assunto"></asp:TextBox>--%>
                    <asp:DropDownList ID="AssuntosList" runat="server">
                        <asp:ListItem>Arduino</asp:ListItem>
                        <asp:ListItem>Problemas com medição de temperatura</asp:ListItem>
                        <asp:ListItem>Problemas com gráfico</asp:ListItem>
                        <asp:ListItem>Problemas com cadastro de peixe</asp:ListItem>
                        <asp:ListItem>Compra do produto</asp:ListItem>
                        <asp:ListItem>FeedBack</asp:ListItem>
                    </asp:DropDownList>
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
					Telefone: 4002-8922<br><br>
                    Suporte 24h: <a href ="https://aquaterm.supportsystem.com/" target="_blank">https://aquaterm.supportsystem.com/</a>
				
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
