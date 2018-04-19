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
            
            <div id="temp">
                <div id="redondoTemp">
                    <img src="img/aquario.png" />
                    <label id="lblTemp"></label><label>ºC</label>
                </div>
                        
                        <p>TEMPERATURA DO AQUÁRIO X</p>

            </div>

        <div id="grafico">

        <canvas id="chart"></canvas>

        <script>
            var context = document.getElementById("chart").getContext("2d");
            context.canvas.width = 600;
            context.canvas.height = 500;

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

                document.getElementById('lblTemp').textContent = Math.floor(listTemp);
                console.log(listTemp);
			
		} 
		
            get_data();

            setInterval(() => {
                get_data();
            }, 1000);

        </script>

       </div>
           
</body>
</html>
