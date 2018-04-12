<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="ProjetoAquaTerm.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>Home</title>
</head>
<body>
    <ul>
			<a href="Inicio.aspx"><img class="logo" src="img/logo.png"></a>
			<li class="logar"><a href="Login.aspx" target="blank" title="Entrar no sistema"><img class="loginIcon" src="img/login.png" a href="#"></a>
			
			</li>
			
			<!--<li class="menu"><a href="pagePadrao.html"><p>MENU 1</p></a></li>-->
			<li class="menu"><a href="Contato.aspx"><p>CONTATO</p></a></li>
			<!--<li class="menu"><a href="pagePadrao.html"><p>MENU 3</p></a></li>-->
			<!--<li class="menu"><a href="pagePadrao.html"><p>MENU 4</p></a></li>-->
		</ul>
		
		<div class="slideshow-container">

			<div class="mySlides fade">
			  <img src="img/sli1.png" style="width:100%">
			  <div class="text">O CONTROLE DE TEMPERATURA DO AQUÁRIO DE SEU PEIXE EM NOSSAS MÃOS</div>
			</div>

			<div class="mySlides fade">
			  <img src="img/sli2.png" style="width:100%">
			  <div class="text">O CONTROLE DE TEMPERATURA DO AQUÁRIO DE SEU PEIXE EM NOSSAS MÃOS</div>
			</div>

			<div class="mySlides fade">
			  <img src="img/sli3.png" style="width:100%">
			  <div class="text">O CONTROLE DE TEMPERATURA DO AQUÁRIO DE SEU PEIXE EM NOSSAS MÃOS</div>
			</div>

			<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
			<a class="next" onclick="plusSlides(1)">&#10095;</a>

		</div>
		
		<div class="riscaHori">SOBRE NÓS</div>

		<div id="blocos">

			<div id= "bloco1"><img src="img/qm.png"/>
			<h1>Missão</h1>
			<p id="qmSomos">Facilitar o controle e manutenção do aquario, aumentando a vida util do peixe e otimizando seu tempo</p>
			</div>

			<div id= "bloco2"><img src="img/projeto.png"/>
			<h1>Visão</h1>
			<p id="projet">Ser referencia na manutenção e controle de temperatura em aquarios, operando como facilitador.</p>
			</div>

			<div id= "bloco3"><img src="img/metodologia.png"/>
			<h1>Valores</h1>
			<p id="ideia">Preocupação, Qualidade e Tecnologia é a motivação para criação da solução IoT nomeDoProjetoAqui </p>
			</div>


		</div>

		<div id="integrantes"><p class="inte">INTEGRANTES</p>

			<div id= "integrante1"><p id="int1"> Thiago Lima</p></div>
			<div id= "integrante2"><p id="int2"> Giuliana França</p></div>
			<div id= "integrante3"><p id="int3"> Caio Massayuki</p></div>
			<div id= "integrante4"><p id="int4"> Gustavo Batistuti</p></div>
			<div id= "integrante5"><p id="int5"> Andressa Souza</p></div>

		</div>

		<div id="rodape">
			<div id= "infor">
				<img class="redeIcon" src="img/map.png"/>
				<p id="titulo">ENDEREÇO E TELEFONE</p>
				<p id="info">
					Rua Haddock Lobo, 595 - Cerqueira César, São Paulo - SP, 01310-300<br><br>
					Telefone: (11) 1111-1111
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
