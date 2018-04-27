<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sistema.aspx.cs" Inherits="ProjetoAquaTerm.Sistema" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="css/sistema.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>AquaTerm</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<script src="http://www.chartjs.org/dist/2.7.1/Chart.js"></script>
	<script src="http://www.chartjs.org/samples/latest/utils.js"></script>
</head>
<body>
           


<div class="menu">

<div class="risquinho">	
	<p id="voltar" onclick="myVoltar()">&#9776;</p>
	<p id ="ir" onclick="myIr()">&#9776;</p> 
						
</div>

</div>
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

<div class="conteudo">	

<div class="temperatura">
	<div id="redondoTemp">
            <img src="img/aquario.png" />
        <asp:Label ID="lblTemp" runat="server" Text="0"></asp:Label><label>ºC</label>
    </div>

    <p class="pMedia">Temperatura média do aquário</p>
</div>

<div class="grafico">
	<canvas id="chart"></canvas>
</div>


</div>

<script>

    //Abrir Scrípt "Ação abrir e fechar menu"
    function myIr() {
        document.getElementById("menuLateral").style.transition = "all 0.3s";
        document.getElementById("menuLateral").style.width = "190px";
        document.getElementById("ir").style.display = "none";
    }

    function myVoltar() {
        document.getElementById("ir").style.display = "initial";
        document.getElementById("menuLateral").style.transition = "all 0.3s";
        document.getElementById("menuLateral").style.width = "0px";
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

        document.getElementById('lblTemp').textContent = Math.floor(obj.average);
        console.log(listTemp);

    }

    get_data();

    setInterval(() => {
        get_data();
    }, 1000);

// Fechar Função de jogar a temperatura na Label

</script>
           
</body>
</html>
