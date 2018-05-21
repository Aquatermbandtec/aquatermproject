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
		
            <p class="pTempReal">TEMPERATURA ATUAL</p>
				
			<div id="redondoTemp">
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
            
           <div class="mediaBloco"><img src="img/aquario.png"/>
                
                <asp:Label ID="lBaixa" runat="server" Text="0º"></asp:Label>
                
                <p class="pMedias">Temperatura Baixa</p></div>
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
				


                <asp:TextBox ID="txtNomePeixe1" runat="server" CssClass="infoPeixe" placeholder="Nome"></asp:TextBox>
                <asp:TextBox ID="txtEspeciePeixe1" runat="server" CssClass="infoPeixe" placeholder="Espécie"></asp:TextBox>
                <asp:TextBox ID="txtTemperaturaPeixe1" runat="server" CssClass="infoPeixe" placeholder="Temperatura ideal"></asp:TextBox>

				 <asp:Button ID="btnSalvarInfos1" runat="server" Text="SALVAR" CssClass="salvarInfos" />

               </div>
			
			<div id="peixe01">	
				<img src="img/px02.jpg">
				<div class="middle">
				<button id="trocar" name="trocarFT" onclick="#"><img src="img/cameraIcon.png"></button>						
				</div>				
				
				<asp:TextBox ID="txtNomePeixe2" runat="server" CssClass="infoPeixe" placeholder="Nome"></asp:TextBox>
                <asp:TextBox ID="txtEspeciePeixe2" runat="server" CssClass="infoPeixe" placeholder="Espécie"></asp:TextBox>
                <asp:TextBox ID="txtTemperaturaPeixe2" runat="server" CssClass="infoPeixe" placeholder="Temperatura ideal"></asp:TextBox>

			     <asp:Button ID="btnSalvarInfos2" runat="server" Text="SALVAR" CssClass="salvarInfos" />
	
            </div>
			
			<div id="peixe01">	
				<img src="img/px03.jpg">
				<div class="middle">
					<button id="trocar" name="trocarFT" onclick="#"><img src="img/cameraIcon.png"></button>	
				</div>				
				


				<asp:TextBox ID="txtNomePeixe3" runat="server" CssClass="infoPeixe" placeholder="Nome"></asp:TextBox>
                <asp:TextBox ID="txtEspeciePeixe3" runat="server" CssClass="infoPeixe" placeholder="Espécie"></asp:TextBox>
                <asp:TextBox ID="txtTemperaturaPeixe3" runat="server" CssClass="infoPeixe" placeholder="Temperatura Ideal"></asp:TextBox>

                <asp:Button ID="btnSalvarInfos3" runat="server" Text="SALVAR" CssClass="salvarInfos" />

				</div>
			</div>
		</div>
	</form>
	

    <script>
        //BACK-END


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


       //  CRIA UMA VETOR QUE RECEBE TODOS OS ARQUIVOS QUE ESTÃO FAZENDO A ATUALIZAÇÃO E JOGANDO ELES NAS LABELS
        // ISSO ANTES DO SETINTERVAL

       
        
        
        
        
        var chamadas = [
            { pagina: 'AtualizaMenor.aspx', destino: 'lBaixa' },
            { pagina: 'AtualizaMaior.aspx', destino: 'lAlta' },
           { pagina: 'AtualizaDados.aspx', destino: 'lTemp' },
            { pagina: 'AtualizaQuartilUm.aspx', destino: 'lQuartilUm' },
            { pagina: 'AtualizaQuartilTres.aspx', destino: 'lQuartilTres' },
            { pagina: 'AtualizaMediana.aspx', destino: 'lMediana' },
            { pagina: 'AtualizaMedia.aspx', destino: 'lMedia' }
        

        setInterval(() => {

            get_data();

            // CRIA UM FOR QUE DECLARA C QUE SERÁ CONTADOR, A CONDIÇÃO QUE SE FOR MENOR QUE O TAMANHO DO VETOR, E INCREMENTA

            for (c=0; c < chamadas.length; c = c +1) {
                var xhttp = new XMLHttpRequest();
                xhttp.destino = chamadas[c].destino;

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var numero = parseInt(this.responseText)

                        // SE ELE RETORNA UM VALOR NULO OU UM VALOR QUE OU NÃO CONVERTIDO ELE MOSTRARA O ULTIMO VALOR (POR PRECAUÇÃO)
                        if (!isNaN(numero)) {
                            document.getElementById(this.destino).innerHTML = numero + "ºC";
                        }
                        
                    }
                };

                
                // "TRUE" PARA DEIXAR UMA SICRONIA NA HORA DE ATUALIZAR OS DADOS DA PAGINA, EVITANDO ASSIM TRAVAMENTOS
                xhttp.open("GET", "controller/" + chamadas[c].pagina, true);
                xhttp.send();

            }
        }, 5000);

    </script>
</body>
</html>
