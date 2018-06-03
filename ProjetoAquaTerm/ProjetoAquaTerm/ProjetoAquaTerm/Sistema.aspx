<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sistema.aspx.cs" Inherits="ProjetoAquaTerm.Sistema" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="css/sistema.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>AquaTerm</title>
    <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

       
        google.charts.load('current', { packages: ['corechart', 'line'] });
        google.charts.setOnLoadCallback(desenharGrafico);


        var total = 0, data = null, grafico = null;

       

        function desenharGrafico() {
            if (data == null) {

                data = new google.visualization.DataTable();
                data.addColumn('number', 'Tempo');
                data.addColumn('number', 'Temperatura');
                data.addRow([undefined, undefined]);
                grafico = new google.charts.Line(document.getElementById('chartdiv'));

            }
            var options = {
                title: 'Variação de temperaturas',
                color: ['#fff000'],
                width: 420,
                height: 400,
                chartArea: { width: "50px", height: "70px" },
                legend: { position: 'none' },
                curverType: 'function',

                vAxis: { minValue: 0, maxValue: 1000 },
            };

            grafico.draw(data, options);
            

            setTimeout(function () {
                
                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json',
                    url: 'controller/AtualizaDados.aspx/temperaturaAtual',
                    data: '{}',
                    success: function (response) {

                        data.addRow([total, response.d]);//adiciona uma linha com duas colunas e insira os valores0(temperatura)valores1(tempo)
                        total++;
                        desenharGrafico();
                        $('#lTemp').text(Math.floor(response.d) + "ºC");

                    },
                    error: function () {
                    }
                });

            
            }, 5000);

            };
      


        //AJAX PARA PEGAR A MAIOR TEMPERATURA
        var enviando = false;
        setInterval(() => {

            // SE ELE RETORNA UM VALOR NULO OU UM VALOR QUE OU NÃO CONVERTIDO ELE MOSTRARA O ULTIMO VALOR (POR PRECAUÇÃO)
            if (!enviando) {
                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json',
                    url: 'controller/AtualizaDados.aspx/temperaturaMaior',
                    data: '{}',
                    beforeSend: function () {
                        enviando = true;
                    },
                    success: function (response) {
                        $('#lAlta').text(Math.floor(response.d)+"ºC");
                        //document.getElementById(chamadas[c].destino).innerHTML = Math.round(response.d);
                        enviando = false;
                    },

                    error: function () {
                    }
                });
            }

            // ajax para pegar a maior temp
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: 'controller/AtualizaDados.aspx/temperaturaMenor',
                data: '{}',
                beforeSend: function () {
                    enviando = true;
                },
                success: function (response) {
                    $('#lBaixa').text(Math.floor(response.d) + "ºC");
                    //document.getElementById(chamadas[c].destino).innerHTML = Math.round(response.d);
                    enviando = false;
                },

                error: function () {
                }
            });

            //AJAX PARA PEGAR A MENOR TEMPERATURA
                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json',
                    url: 'controller/AtualizaDados.aspx/temperaturaMedia',
                    data: '{}',
                    beforeSend: function () {
                        enviando = true;
                    },
                    success: function (response) {
                        $('#lMedia').text(Math.floor(response.d)+"ºC");
                        //document.getElementById(chamadas[c].destino).innerHTML = Math.round(response.d);
                        enviando = false;
                    },

                    error: function () {
                    }
            });
            //AJAX PARA PEGAR A TEMPERATURA MÉDIA
                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json',
                    url: 'controller/AtualizaDados.aspx/temperaturaMediana',
                    data: '{}',
                    beforeSend: function () {
                        enviando = true;
                    },
                    success: function (response) {
                        $('#lMediana').text(Math.floor(response.d)+"ºC");
                        //document.getElementById(chamadas[c].destino).innerHTML = Math.round(response.d);
                        enviando = false;
                    },

                    error: function () {
                    }
                });

            //AJAX PARA PEGAR A TEMPERATURA MEDIANA
                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json',
                    url: 'controller/AtualizaDados.aspx/temperaturaQuartilUm',
                    data: '{}',
                    beforeSend: function () {
                        enviando = true;
                    },
                    success: function (response) {
                        $('#lQuartilUm').text(Math.floor(response.d)+"ºC");
                        //document.getElementById(chamadas[c].destino).innerHTML = Math.round(response.d);
                        enviando = false;
                    },

                    error: function () {
                    }
                });

            //AJAX PARA PEGAR O PRIMEIRO QUARTIL
                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json',
                    url: 'controller/AtualizaDados.aspx/temperaturaQuartilTres',
                    data: '{}',
                    beforeSend: function () {
                        enviando = true;
                    },
                    success: function (response) {
                        $('#lQuartilTres').text(Math.floor(response.d)+"ºC");
                        //document.getElementById(chamadas[c].destino).innerHTML = Math.round(response.d);
                        enviando = false;
                    },

                    error: function () {
                    }
                });
        }, 5000);


     


        // alerta de temperatura
        //setInterval(() => {

        //    var n = document.getElementById('lTemp').innerHTML;

        //    if (n > 20){ 
        //        var div = document.getElementById('conteudo').style.transition = "0.5s";
        //        var div = document.getElementById('conteudo').style.backgroundColor = "blue";
        //        var div = document.getElementById('conteudo').style.backgroundColor = "red";
        //    }


        //},100);





        //Medidas de Analytics com o novo jeito
        </script>
</head>
<body>
    <form name="form" runat="server">
    <div class="menu">
		<div class="risquinho">	
			<p id="voltar" onclick="myVoltar()">&#9776;</p>
			<p id ="ir" onclick="myIr()">&#9776;</p> 								
		</div>		
		<div id="logo"><img src="img/peixinho22.png"/></div>
	</div>
	<div id="bell"><img src="img/bellIcon.png" id="sino" /></div>
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
		<div id="linha1">  <img src="img/timeIcon.png"/> <p>Aquário</p></div>
		
            <p class="pTempReal">TEMPERATURA ATUAL</p>
				
			<div id="redondoTemp">
				<img src="img/12345.png" />
                <asp:Label ID="lTemp" runat="server" Text="0º"></asp:Label>
			</div>
            <asp:Button ID="btnRelatorio" runat="server" Text="RELATORIO DETALHADO" CssClass="btnRelatorio" />
		</div>

		<div class="grafico">
			<div id="chartdiv"></div>
		</div>

		<div class="medias">
			<div id="linha2">  <img src="img/indicador.png"/> <p>Medidas</p></div>
            
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
			<div id="linha1"> <img src="img/listIcon.png"/> <p>Anotações</p> </div>
			<div id="textoCss">
       <asp:TextBox ID="txtAnotacoes" runat="server" TextMode="MultiLine" CssClass="txtAnotacoes" placeholder="Faça suas anotaçoes aqui"></asp:TextBox>
			</div>
			
			<div id="botTexto">
                <asp:Button ID="btnSalvar" runat="server" Text="SALVAR" CssClass="btnSalvar" />
            </div>
		</div>
		
		<div id="peixes">
			<div id="linha1"> <img src="img/fishIcon.png"/> <p>Meu Aquário:</p> </div>
			<div id="peixe01">		
				<img src="img/px01.jpg"/>
				<div class="middle">
					<button id="trocar" name="trocarFT" onclick="#"><img src="img/cameraIcon.png"/></button>					
				</div>	
				


                <asp:TextBox ID="txtNomePeixe1" runat="server" CssClass="infoPeixe" placeholder="Nome"></asp:TextBox>
                <asp:TextBox ID="txtEspeciePeixe1" runat="server" CssClass="infoPeixe" placeholder="Espécie"></asp:TextBox>
                <asp:TextBox ID="txtTemperaturaPeixe1" runat="server" CssClass="infoPeixe" placeholder="Temperatura ideal"></asp:TextBox>

				 <asp:Button ID="btnSalvarInfos1" runat="server" Text="SALVAR" CssClass="salvarInfos" />

               </div>
			
			<div id="peixe01">	
				<img src="img/px02.jpg"/>
				<div class="middle">
				<button id="trocar" name="trocarFT" onclick="#"><img src="img/cameraIcon.png"/></button>						
				</div>				
				
				<asp:TextBox ID="txtNomePeixe2" runat="server" CssClass="infoPeixe" placeholder="Nome"></asp:TextBox>
                <asp:TextBox ID="txtEspeciePeixe2" runat="server" CssClass="infoPeixe" placeholder="Espécie"></asp:TextBox>
                <asp:TextBox ID="txtTemperaturaPeixe2" runat="server" CssClass="infoPeixe" placeholder="Temperatura ideal"></asp:TextBox>

			     <asp:Button ID="btnSalvarInfos2" runat="server" Text="SALVAR" CssClass="salvarInfos" />
	
            </div>
			
			<div id="peixe01">	
				<img src="img/px03.jpg"/>
				<div class="middle">
					<button id="trocar" name="trocarFT" onclick="#"><img src="img/cameraIcon.png"/></button>	
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
        

        //  CRIA UMA VETOR QUE RECEBE TODOS OS ARQUIVOS QUE ESTÃO FAZENDO A ATUALIZAÇÃO E JOGANDO ELES NAS LABELS
        // ISSO ANTES DO SETINTERVAL
        /*
        var chamadas = [
            { pagina: 'AtualizaMenor.aspx', destino: 'lBaixa' },
            { pagina: 'AtualizaMaior.aspx', destino: 'lAlta' },
            { pagina: 'AtualizaDados.aspx', destino: 'lTemp' },
            { pagina: 'AtualizaQuartilUm.aspx', destino: 'lQuartilUm' },
            { pagina: 'AtualizaQuartilTres.aspx', destino: 'lQuartilTres' },
            { pagina: 'AtualizaMediana.aspx', destino: 'lMediana' },
            { pagina: 'AtualizaMedia.aspx', destino: 'lMedia' }
        ]
        

        setInterval(() => {

            get_data();

            // CRIA UM FOR QUE DECLARA C QUE SERÁ CONTADOR, A CONDIÇÃO QUE SE FOR MENOR QUE O TAMANHO DO VETOR, E INCREMENTA

            for (c = 0; c < chamadas.length; c++) {
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
        */

    </script>
</body>
</html>
