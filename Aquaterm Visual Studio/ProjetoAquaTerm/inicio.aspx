<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="ProjetoAquaTerm.inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Página Inicial</title>
</head>
<body>
    		<!--INICIO DO MENU-->
		<ul id="menuUL">
			<a href="inicio.html"><img class="logo" src="img/logo.png"></a>
			<li class="logar"><a href="index.html" target="blank" title="Entrar no sistema"><img class="loginIcon" src="img/login.png" a href="#"></a>
			
			</li>
			
			<li class="menu"><a href="Manual.html"><p>MANUAL</p></a></li>
			<li class="menu"><a href="CONTATO.html"><p>CONTATO</p></a></li>
			<li class="menu"><a href="sobreNos.aspx"><p>SOBRE NÓS</p></a></li>

		</ul>
		<!--FIM DO MENU-->
		
		<!--INICIO DO SLIDE-->	
		<div class="slideshow-container">

			<div class="mySlides fade">
			  <img src="img/sli1.png" style="width:100%">
			  <div class="text">Conheça abaixo nossos planos para lojistas, e aquarios de pequeno porte!</div>
			</div>

			<div class="mySlides fade">
			  <img src="img/sli2.png" style="width:100%">
			  <div class="text">Conheça abaixo nossos planos para lojistas, e aquarios de pequeno porte!</div>
			</div>

			<div class="mySlides fade">
			  <img src="img/sli3.png" style="width:100%">
			  <div class="text">Conheça abaixo nossos planos para lojistas, e aquarios de pequeno porte!</div>
			</div>

			<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
			<a class="next" onclick="plusSlides(1)">&#10095;</a>

		</div>
		<!--FIM DO SLIDE-->
		
		<div id="conteudoP"> 
			<h1>O QUE NÓS FAZEMOS ?</h1>
			<p>
O projeto AquaTermº oferece um gerenciador de temperatura para aquários, com objetivo de facilitar o controle e visualização do usuário, aumentando a expectativa de vida dos peixes e inovando com criatividade e tecnologia IoT.
			</p>
			<div> <a href="CONTATO.html" class="saibaMais">SAIBA MAIS...</a></div>
		</div>
		
		<div id="blocos">
			<div class="bloco">
				<h1>1º PASSO</h1>
				<p>Possuir um dispositivo AquaTerm programado para gerenciar a temperatura do seu aquario</p>
				<img src="img/arduino.jpg">
			</div>
			
			<div class="bloco">
				<h1>2° PASSO</h1>
				<p>Colocar o Dispositivo AquaTerm em seu aquario para que possa ser feita a medição</p>
				<img src="img/aquarioWall.jpg">
			</div>
			
			<div class="bloco">
				<h1>3° PASSO</h1>
				<p>Fazer cadastro/login no site, acessar seu perfil de gerenciamento, e pronto!</p>
				<img src="img/image2.jpg">
			</div>
		</div>
			
		<div class="lojaCasa">
			<div id="casa">	
				<h1>CASA</h1>
				<ul> 
				  <li class="listPlanos"> <img src="img/OKicon.png"/> Painel de temperatura</li> <br>
				  <li class="listPlanos"> <img src="img/OKicon.png"/> Gráficos de gerenciamento</li> <br> 
				  <li class="listPlanos"> <img src="img/OKicon.png"/> Caixa de anotações</li> <br> 
				  <li class="listPlanos"> <img src="img/OKicon.png"/> Nome/Foto dos peixes</li> <br> 
				</ul>
				
				<div class="adquirir"> <a href="contato.html">QUERO ESSE!</a></div>
				
			</div>
			
			<div id="loja">
				<h1>LOJA</h1>
				<ul> 
				  <li class="listPlanos"> <img src="img/OKicon.png"/> Painel de temperatura</li> <br>
				  <li class="listPlanos"> <img src="img/OKicon.png"/> Gráficos de gerenciamento</li> <br> 
				  <li class="listPlanos"> <img src="img/OKicon.png"/> Controle de luminosidade</li> <br> 
				  <li class="listPlanos"> <img src="img/OKicon.png"/> Especificação de temperatura ideal</li> <br> 
				  <li class="listPlanos"> <img src="img/OKicon.png"/> Campo para anotações</li> <br> 
				</ul>
				
				<div class="adquirir"> <a href="contato.html">QUERO ESSE!</a></div>
				
			</div>
		</div>	
		
		

		
		<!--INICIO RODAPE-->
		<div id="rodape">
			<div id= "infor">
				<img class="redeIcon" src="img/map.png" a href="#">
				<p id="titulo">ENDEREÇO E TELEFONE</p>
				<p id="info">
					Rua Haddock Lobo, 595 - Cerqueira César, São Paulo - SP, 01310-300<br><br>
					Telefone: (11) 1111-1111
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
		<!--FIM RODAPE-->
		
		<!--JS DO SLIDE-->
		<script>
			var slideIndex = 1;
			showSlides(slideIndex);

			function plusSlides(n) {
			  showSlides(slideIndex += n);
			}

			function currentSlide(n) {
			  showSlides(slideIndex = n);
			}

			function showSlides(n) {
			  var i;
			  var slides = document.getElementsByClassName("mySlides");
			  if (n > slides.length) {slideIndex = 1}    
			  if (n < 1) {slideIndex = slides.length}
			  for (i = 0; i < slides.length; i++) {
				  slides[i].style.display = "none";  
			  }
			  slides[slideIndex-1].style.display = "block";  
			}
		</script>
</body>
</html>
