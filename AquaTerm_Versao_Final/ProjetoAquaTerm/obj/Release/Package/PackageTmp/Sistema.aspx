<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sistema.aspx.cs" Inherits="ProjetoAquaTerm.Sistema" EnableEventValidation="true" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="css/sistema.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="img/logoPequeno.ico" type="image/x-icon" />
    <title>AquaTerm System</title>
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
                curveType: 'function',
                width: 420,
                height: 400,
                chartArea: { width: "50px", height: "70px" },
                legend: { position: 'none' },
                backgroundColor: { stroke: 'black', fill: '', strokeSize: 1 },
                vAxis: { minValue: 0, maxValue: 50 },

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
                        $('#lAuxiliar').text(Math.floor(response.d));

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
                        $('#lAlta').text(Math.floor(response.d) + "ºC");
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
                    $('#lMedia').text(Math.floor(response.d) + "ºC");
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
                    $('#lMediana').text(Math.floor(response.d) + "ºC");
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
                    $('#lQuartilUm').text(Math.floor(response.d) + "ºC");
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
                    $('#lQuartilTres').text(Math.floor(response.d) + "ºC");
                    //document.getElementById(chamadas[c].destino).innerHTML = Math.round(response.d);
                    enviando = false;
                },

                error: function () {
                }
            });
        }, 5000);

        //Medidas de Analytics com o novo jeito

        
    </script>
</head>
<body>
    <form name="form" runat="server">
        <div class="menu">
            <div id="risquinho">
                <p id="voltar" onclick="myVoltar()">&#9776;</p>
                <p id="ir" onclick="myIr()">&#9776;</p>
            </div>
            <div id="logo">
                <img src="img/logobranco.png" />
            </div>
        </div>
        <!-- abre div de notificaçoes -->
        <div id="notifica">
            <div class="linha">
                <img src="img/alert.png">
            </div>
            <br />
            <p>A temperatura de seu aquário ultrapassou o valor ideal </p>
            <div class="linhaBaixo">
                <img src="img/setaBaixo.png">
            </div>
        </div>
        <!-- fecha div de notificaçoes -->
        <div id="bell" title="Sua temperatura ultrapassou o valor ideal, por favor verifique seu arduino">
            <img src="img/bellIcon.png" id="sino" />
        </div>
        <!--inicio menu-->
        <div id="menuLateral">
            <div class="menuUsuario">
                <div class="fotoUsuario"></div>
                <asp:Label ID="lblUsuario" runat="server" Text="" CssClass="nomeUsuario"></asp:Label>
            </div>

            <ul class="ulMenu">

                <li class="menuLi">Temperatura ideal
			<asp:TextBox ID="txtValorTemp" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:Button ID="btnValorTemp" runat="server" Text="Salvar" OnClick="btnValorTemp_Click" />
                </li>
            </ul>
            
            <div class="cadPeixeMenu">
                <p>CADASTRE UM PEIXE</p>
                 
                  <asp:TextBox ID="txtNomePeixel" runat="server" CssClass="cadInfoPeixe" placeholder="Nome" Text='<%#Eval("Nome") %>'></asp:TextBox>
                  <asp:TextBox ID="txtEspeciePeixel" runat="server" CssClass="cadInfoPeixe" placeholder="Espécie" Text='<%#Eval("Especie") %>'></asp:TextBox>
                  <asp:TextBox ID="txtTemperaturaPeixel" runat="server" CssClass="cadInfoPeixe" placeholder="Temperatura ideal" Text='<%#Eval("Temperatura") %>'></asp:TextBox>
                  <asp:HiddenField ID="idPeixel" runat="server" Value='<%#Eval("Id") %>' />
                  <asp:Button ID="btnInsere" runat="server" Text="Cadastrar" CssClass="cadSalvarInfos" OnClick="btnInsere_Click" />
            </div>



              <div class="dataDeHoje">
              <p id="Data"></p><br>
              <div id="timer">
              <span class="hours"></span>
              <span class="minutes"></span>
              <span class="seconds"></span>
              </div>

          </div>


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
                <div class="linha1">
                    <img src="img/timeIcon.png" />
                    <p>Aquário</p>
                </div>
                <asp:Label ID="lAuxiliar" runat="server" Text="0"></asp:Label>
                <p class="pTempReal">TEMPERATURA ATUAL</p>

                <div id="redondoTemp">
                    <img src="img/12345.png" />
                    <asp:Label ID="lTemp" runat="server" Text="0º"></asp:Label>
                </div>
                <asp:Button ID="btnRelatorio" runat="server" Text="RELATORIO DETALHADO" CssClass="btnRelatorio" OnClick="btnRelatorio_Click"/>
            </div>

            <div class="grafico">
                <div id="chartdiv"></div>
            </div>

            <div class="medias">
                <div id="linha2">
                    <img src="img/indicador.png" />
                    <p>Medidas</p>
                </div>

                <div class="mediaBloco">
                    <img src="img/aquario.png" />

                    <asp:Label ID="lBaixa" runat="server" Text="0º"></asp:Label>

                    <p class="pMedias">Temperatura Baixa</p>
                </div>
                <div class="mediaBloco">
                    <img src="img/aquario.png" /><asp:Label ID="lQuartilUm" runat="server" Text="0º"></asp:Label><p class="pQuartil">1º Quartil</p>
                </div>
                <div class="mediaBloco">
                    <img src="img/aquario.png" /><asp:Label ID="lMediana" runat="server" Text="0º"></asp:Label><p class="pMediana">Mediana</p>
                </div>
                <div class="mediaBloco">
                    <img src="img/aquario.png" /><asp:Label ID="lMedia" runat="server" Text="0º"></asp:Label><p class="pMedias">Temperatura Media</p>
                </div>
                <div class="mediaBloco">
                    <img src="img/aquario.png" /><asp:Label ID="lQuartilTres" runat="server" Text="0º"></asp:Label><p class="pQuartil">3º Quartil</p>
                </div>
                <div class="mediaBloco">
                    <img src="img/aquario.png" /><asp:Label ID="lAlta" runat="server" Text="0º"></asp:Label><p class="pMedias">Temperatura Alta</p>
                </div>
            </div>
            <!-- BLOCO DE NOTAS -->
            <div class="cxTexto">
                <div class="linha1">
                    <img src="img/listIcon.png" />
                    <p>Anotações</p>
                </div>
                <div id="textoCss">
                    <asp:TextBox ID="txtAnotacoes" runat="server" TextMode="MultiLine" CssClass="txtAnotacoes" placeholder="Faça suas anotaçoes aqui"></asp:TextBox>
                </div>

                <div id="botTexto">
                    <asp:Button ID="btnSalvar" runat="server" Text="SALVAR" CssClass="btnSalvar" OnClick="btnSalvar_Click" />
                </div>
            </div>
            <!-- FIM BLOCO DE NOTAS -->
            <!-- PEIXE -->
            <div id="peixes">
                <div class="linha1">
                    <img src="img/fishIcon.png" />
                    <p>Meu Aquário:</p>
                </div>
                <asp:Repeater ID="repetidor" runat="server" OnItemCommand="repetidor_ItemCommand">
                    <ItemTemplate>
                        <div class="peixe01">
                            <img class="img1" src="Foto.ashx?id=<%#Eval("Id") %>" />                           
                            <asp:TextBox ID="txtNomePeixe" runat="server" CssClass="infoPeixe" placeholder="Nome" Text='<%#Eval("Nome") %>'></asp:TextBox>
                            <asp:TextBox ID="txtEspeciePeixe" runat="server" CssClass="infoPeixe" placeholder="Espécie" Text='<%#Eval("Especie") %>'></asp:TextBox>
                            <asp:TextBox ID="txtTemperaturaPeixe" runat="server" CssClass="infoPeixe" placeholder="Temperatura ideal" Text='<%#Eval("Temperatura") %>'></asp:TextBox>
                            <asp:HiddenField ID="idPeixe" runat="server" Value='<%#Eval("Id") %>' />
                            <asp:Button CommandName="Salvar" runat="server" Text="SALVAR" CssClass="salvarInfos" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <!-- FIM PEIXE -->
        </div>

    </form>

    <audio id="audio">
        <source src="img/sino.mp3" type="audio/mp3" />
    </audio>

    <script>
        //BACK-END
        var audio = new Audio("img/sino.mp3");

        setInterval(() => {
            var n = Math.floor(document.getElementById('lAuxiliar').innerText);
            var valorIdeal = Math.floor(document.getElementById('txtValorTemp').value);

            if (n < valorIdeal) {
                document.getElementById('bell').style.display = 'none';
            }
            else {
                audio.play();
                document.getElementById('bell').style.display = 'initial';
            }


        }, 100);

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

        //FUNÇOES DE DATA E HORA ATUAL

        function dataAtualFormatada() {
            var data = new Date();
            var dia = data.getDate();
            if (dia.toString().length == 1)
                dia = "0" + dia;
            var mes = data.getMonth() + 1;
            if (mes.toString().length == 1)
                mes = "0" + mes;
            var ano = data.getFullYear();
            return dia + "/" + mes + "/" + ano;
        }


        window.onload = function () {
            document.getElementById("Data").innerHTML = dataAtualFormatada();
        }

        var Timer = function (element) {
            var secondsElement = element.getElementsByClassName("seconds")[0],
                minutesElement = element.getElementsByClassName("minutes")[0],
                hoursElement = element.getElementsByClassName("hours")[0],
                show = function (num) {
                    return ("0" + num).slice(-2);
                };

            return {
                update: function () {
                    var now = new Date();
                    secondsElement.innerHTML = show(now.getSeconds());
                    minutesElement.innerHTML = show(now.getMinutes());
                    hoursElement.innerHTML = show(now.getHours());
                }
            };
        };

        var timer = new Timer(document.getElementById("timer"));

        setInterval(function () {
            timer.update();
        }, 500);


    </script>
</body>
</html>
