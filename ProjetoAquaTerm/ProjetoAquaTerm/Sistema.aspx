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
                    <asp:Label ID="lblTemp" runat="server" Text="0"></asp:Label><label>º</label>
                </div>
                        
                        <p>TEMPERATURA DO AQUÁRIO X</p>

            </div>

        <div id="grafico">

        <canvas id="chart" width="550px" height="470px"></canvas>

        <script>
            var ctx = document.getElementById("chart").getContext("2d");

            const colors = {
                green: {
                    fill: '#e0eadf',
                    stroke: '#5eb84d',
                },
                lightBlue: {
                    stroke: '#6fccdd',
                },
                darkBlue: {
                    fill: '#92bed2',
                    stroke: '#3282bf',
                },
                purple: {
                    fill: '#8fa8c8',
                    stroke: '#75539e',
                },
            };

            const loggedIn = [26, 36, 42, 38, 40, 30, 12];
            const available = [34, 44, 33, 24, 25, 28, 25];
            const availableForExisting = [16, 13, 25, 33, 40, 33, 45];
            const unavailable = [5, 9, 10, 9, 18, 19, 20];
            const xData = [13, 14, 15, 16, 17, 18, 19];

            const myChart = new Chart(ctx, {
                type: 'line',
                data: {
                    labels: xData,
                    datasets: [{
                        label: "Unavailable",
                        fill: true,
                        backgroundColor: colors.purple.fill,
                        pointBackgroundColor: colors.purple.stroke,
                        borderColor: colors.purple.stroke,
                        pointHighlightStroke: colors.purple.stroke,
                        borderCapStyle: 'butt',
                        data: unavailable,

                    }, {
                        label: "Available for Existing",
                        fill: true,
                        backgroundColor: colors.darkBlue.fill,
                        pointBackgroundColor: colors.darkBlue.stroke,
                        borderColor: colors.darkBlue.stroke,
                        pointHighlightStroke: colors.darkBlue.stroke,
                        borderCapStyle: 'butt',
                        data: availableForExisting,
                    }, {
                        label: "Available",
                        fill: true,
                        backgroundColor: colors.green.fill,
                        pointBackgroundColor: colors.lightBlue.stroke,
                        borderColor: colors.lightBlue.stroke,
                        pointHighlightStroke: colors.lightBlue.stroke,
                        borderCapStyle: 'butt',
                        data: available,
                    }, {
                        
                    }]
                },
                options: {
                    responsive: false,
                    // Can't just just `stacked: true` like the docs say
                    scales: {
                        yAxes: [{
                            stacked: true,
                        }]
                    },
                    animation: {
                        duration: 750,
                    },
                }
            });
		
        </script>

       </div>
           
</body>
</html>
