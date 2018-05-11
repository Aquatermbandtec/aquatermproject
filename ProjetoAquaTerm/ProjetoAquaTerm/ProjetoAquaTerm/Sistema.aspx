<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sistema.aspx.cs" Inherits="ProjetoAquaTerm.Sistema" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="css/sistema.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>AquaTerm</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <script src="http://www.chartjs.org/dist/2.7.1/Chart.js"></script>
    <script src="http://www.chartjs.org/samples/latest/utils.js"></script>
</head>
<body>
    <form name="form" runat="server">
    <div class="menu">
		<div class="risquinho">	
			<p id="voltar" onclick="myVoltar()">&#9776;</p>
			<p id ="ir" onclick="myIr()">&#9776;</p> 								
		</div>		
		<div id="logo"><img src="img/peixinho22.png"></div>
	</div>
	<div id="bell"><img src="img/bellIcon.png" id="sino" ></div>
	<!--inicio menu-->
	<div id="menuLateral">	
		<div class="menuUsuario">
		<div class="fotoUsuario"></div>
            <asp:Label ID="lblUsuario" runat="server" Text="" CssClass="nomeUsuario"></asp:Label>
		</div>

		<ul class="ulMenu">
			
			<li class="menuLi">Relatórios</li>
			</ul>

        <a href="Login.aspx">
		<ul class="ulSair">
			<li class="sairLi">Sair</li>	
		</ul>
        </a>
	</div>
	<!--fim menu-->
	
	<div id="bemVindo">
		<h1>Bem vindo <%=(string)Session["nomeUsuario"]%></h1>
	</div>

	<div id="conteudo">
	
		
		<div class="temperatura">
		<div id="linha1">  <img src="img/timeIcon.png"> <p>Aquário</p></div>
		
			<div id="redondoTemp">
				<p>Temperatura Atual</p>
				<img src="img/12345.png" />
                <asp:Label ID="lTemp" runat="server" Text="0º"></asp:Label>
			</div>
            <asp:Button ID="btnRelatorio" runat="server" Text="RELATORIO DETALHADO" CssClass="btnRelatorio" />
		</div>

		<div class="grafico">
			<canvas id="chart"></canvas>
		</div>

		<div class="medias">
			<div id="linha2">  <img src="img/indicador.png"> <p>Medidas</p></div>

			<div class="mediaBloco"><img src="img/aquario.png"/><asp:Label ID="lBaixa" runat="server" Text="0º"></asp:Label><p class="pMedias">Temperatura Baixa</p></div>
			<div class="mediaBloco"><img src="img/aquario.png"/><asp:Label ID="lQuartilUm" runat="server" Text="0º"></asp:Label><p class="pQuartil">1º Quartil</p></div>
			<div class="mediaBloco"><img src="img/aquario.png"/><asp:Label ID="lMediana" runat="server" Text="0º"></asp:Label><p class="pMediana">Mediana</p></div>
			<div class="mediaBloco"><img src="img/aquario.png"/><asp:Label ID="lMedia" runat="server" Text="0º"></asp:Label><p class="pMedias">Temperatura Media</p></div>
			<div class="mediaBloco"><img src="img/aquario.png"/><asp:Label ID="lQuartilTres" runat="server" Text="0º"></asp:Label><p class="pQuartil">3º Quartil</p></div>
			<div class="mediaBloco"><img src="img/aquario.png"/><asp:Label ID="lAlta" runat="server" Text="0º"></asp:Label><p class="pMedias">Temperatura Alta</p></div>
		</div>	
			
		<div class="cxTexto">
			<div id="linha1"> <img src="img/listIcon.png"> <p>Anotações</p> </div>
			<div id="textoCss">
       <asp:TextBox ID="txtAnotacoes" runat="server" TextMode="MultiLine" CssClass="txtAnotacoes" placeholder="Faça suas anotaçoes aqui"></asp:TextBox>
			</div>
			
			<div id="botTexto">
                <asp:Button ID="btnSalvar" runat="server" Text="SALVAR" CssClass="btnSalvar" />
            </div>
		</div>
		
		<div id="peixes">
			<div id="linha1"> <img src="img/fishIcon.png"> <p>Meu Aquário:</p> </div>
			<div id="peixe01">		
				<img src="img/px01.jpg">
				<div class="middle">
					<button id="trocar" name="trocarFT" onclick="#"><img src="img/cameraIcon.png"></button>					
				</div>	
				

				<textarea class="InfoPeixe" type="text" placeholder="Nome"></textarea>
				<textarea class="InfoPeixe" type="text" placeholder="Especie"></textarea>
				<textarea class="InfoPeixe" type="text" placeholder="Temperatura"></textarea>
				
				<input class="salvarInfos" type="submit" name="salvarInfos" value="SALVAR" onclick="#">
			</div>
			
			<div id="peixe01">	
				<img src="img/px02.jpg">
				<div class="middle">
				<button id="trocar" name="trocarFT" onclick="#"><img src="img/cameraIcon.png"></button>						
				</div>				
				
				<textarea class="InfoPeixe" type="text" placeholder="Nome"></textarea>
				<textarea class="InfoPeixe" type="text" placeholder="Especie"></textarea>
				<textarea class="InfoPeixe" type="text" placeholder="Temperatura"></textarea>
				
				<input class="salvarInfos" type="submit" name="salvarInfos" value="SALVAR" onclick="#">
			</div>
			
			<div id="peixe01">	
				<img src="img/px03.jpg">
				<div class="middle">
					<button id="trocar" name="trocarFT" onclick="#"><img src="img/cameraIcon.png"></button>	
				</div>				
				
				<textarea class="InfoPeixe" type="text" placeholder="Nome"></textarea>
				<textarea class="InfoPeixe" type="text" placeholder="Especie"></textarea>
				<textarea class="InfoPeixe" type="text" placeholder="Temperatura"></textarea>
				
				<input class="salvarInfos" type="submit" name="salvarInfos" value="SALVAR" onclick="#">
				</div>
			</div>
		</div>
	</form>
	
    <script>

        //Abrir Scrípt "Ação abrir e fechar menu"
        function myIr() {
            document.getElementById("menuLateral").style.transition = "all 0.5s";
            document.getElementById("menuLateral").style.width = "190px";
            document.getElementById("ir").style.display = "none";
            document.getElementById("conteudo").style.justifyContent = "flex-end";
            document.getElementById("voltar").style.display = "initial";
        }

        function myVoltar() {
            document.getElementById("ir").style.display = "initial";
            document.getElementById("voltar").style.display = "none";
            document.getElementById("menuLateral").style.transition = "all 0.5s";
            document.getElementById("menuLateral").style.width = "0px";
            document.getElementById("conteudo").style.justifyContent = "center";
        }
        //Fechar Scrípt "Ação abrir e fechar menu"


        // Abrir Desenho do grafico
        var context = document.getElementById("chart").getContext("2d");
        context.canvas.width = 500;
        context.canvas.height = 400;

        var configuration = {
            type: 'line',
            data: {
                datasets: [{
                    label: "Variação de Temperatura",
                    type: 'line',
                }]
            },
            options: {
                scales: {
                    xAxes: [{
                        //type: 'value',
                        distribution: 'series',
                        ticks: {
                            beginAtZero: true
                        }
                    }],
                    yAxes: [{
                        scaleLabel: {
                            display: true,
                            labelString: 'Temperatura'
                        },
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },
                animation: {
                    duration: 0
                }
            }
        };

        var chart = new Chart(context, configuration);
        // Fechar Desenho do Grafico

        // Abrir Função de jogar a temperatura na Label
        this.lastIndexTemp = 0;
        this.time = 0;

        function get_data() {

            var http = new XMLHttpRequest();
            http.open('GET', 'http://localhost:3000/api', false);
            http.send(null);

            var obj = JSON.parse(http.responseText);

            if (obj.data.length == 0) {
                return;
            }

            var _lastIndexTemp = this.lastIndexTemp;
            this.lastIndexTemp = obj.data.length;
            listTemp = obj.data.slice(_lastIndexTemp);

            listTemp.forEach(data => {

                if (chart.data.labels.length == 10 && chart.data.datasets[0].data.length == 10) {
                    chart.data.labels.shift();
                    chart.data.datasets[0].data.shift();
                }

                chart.data.labels.push(this.time++);
                chart.data.datasets[0].data.push(parseFloat(data));
                chart.update();
            });
        }

        get_data();


        // PEGAR A TEMPERATURA NO BANCO E JOGAR NA LABEL
        var xhttp = new XMLHttpRequest();
        var xhttpMaior = new XMLHttpRequest();
        var xhttpMenor = new XMLHttpRequest();
        var xhttpMedia = new XMLHttpRequest();
        var xhttpQuartilUm = new XMLHttpRequest();
        var xhttpMediana = new XMLHttpRequest();
        var xhttpQuartilTres = new XMLHttpRequest();

        setInterval(() => {

            get_data();

            xhttp.open("GET", "controller/AtualizaDados.aspx", false);
            xhttp.send();

            xhttpMaior.open("GET", "controller/AtualizaMaior.aspx", false);
            xhttpMaior.send();

            xhttpMenor.open("GET", "controller/AtualizaMenor.aspx", false);
            xhttpMenor.send();

            xhttpMedia.open("GET", "controller/AtualizaMedia.aspx", false);
            xhttpMedia.send();

            xhttpQuartilUm.open("GET", "controller/AtualizaQuartilUm.aspx", false);
            xhttpQuartilUm.send();

            xhttpMediana.open("GET", "controller/AtualizaMediana.aspx", false);
            xhttpMediana.send();

            xhttpQuartilTres.open("GET", "controller/AtualizaQuartilTres.aspx", false);
            xhttpQuartilTres.send();

            document.getElementById("lTemp").innerHTML = parseInt(xhttp.responseText) + "ºC";
            document.getElementById("lAlta").innerHTML = parseInt(xhttpMaior.responseText) + "ºC";
            document.getElementById("lBaixa").innerHTML = parseInt(xhttpMenor.responseText) + "ºC";
            document.getElementById("lMedia").innerHTML = parseInt(xhttpMedia.responseText) + "ºC";
            document.getElementById("lQuartilUm").innerHTML = parseInt(xhttpQuartilUm.responseText) + "ºC";
            document.getElementById("lMediana").innerHTML = parseInt(xhttpMediana.responseText) + "ºC";
            document.getElementById("lQuartilTres").innerHTML = parseInt(xhttpQuartilTres.responseText) + "ºC";

        }, 5000);

    </script>
</body>
</html>
