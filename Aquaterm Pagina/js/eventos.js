/*ATENÇÃO, VOCÊ NÃO ENTENDERA NADA DO QUE ESTÁ AQUI, POIS ATÉ EU QUE CRIEI NÃO SEI O PQ DE FUNCIONAR :C*/

var temperatura_atual = 0, nova_temperatura = 0;

var temp_menor_atual = 0, temp_menor_nova = 0;
var temp_media_atual = 0, temp_media_nova = 0;
var temp_maior_atual = 0, temp_maior_nova = 0;

function atualiza_numeros(antes, agora) {
    temperatura_atual = antes;
    nova_temperatura = agora;
    atualiza_termometro();
}

function atualiza_termometro() {
    if (temperatura_atual != nova_temperatura) {

        setTimeout(atualiza_termometro, 100);
        atualiza_fundo_termometro(temperatura_atual);
        alerta(temperatura_atual);
       
        infos_temperatura(temperatura_atual);       

    } 

    document.getElementById("txt_temperatura").innerHTML = temperatura_atual + "°c";
  
    if (temperatura_atual < nova_temperatura) {
        temperatura_atual++;

    }
    else if (temperatura_atual > nova_temperatura) {
        temperatura_atual--;
    }
    
}

function redir_page(url) {
    
}

function atualiza_fundo_termometro(grau) {
    if (grau <= 10) {
        document.getElementById("area_termometro").className = "";
        document.getElementById("area_termometro").className = "muito_frio";
    }
    else if (grau >= 11 && grau <= 20) {
        document.getElementById("area_termometro").className = "";
        document.getElementById("area_termometro").className = "frio";
    } else if (grau >= 21 && grau <= 30) {
        document.getElementById("area_termometro").className = "";
        document.getElementById("area_termometro").className = "tropical";
    } else {
        document.getElementById("area_termometro").className = "";
        document.getElementById("area_termometro").className = "calor";
    }
}

function alerta(grau) {
    if (grau >= 38 && grau <= 50) {
       document.getElementById("alerta").play();
    } else {
        document.getElementById("alerta").pause();
    }
}

function remove_infos() {
    var div = document.getElementById("textos");
    var pt = document.getElementById("desc_temp");
    var p = div.getElementsByTagName("p");

    try {
        pt.parentNode.removeChild(p[0]);
    } catch (err) { }   
    
}

function getSizeP() {
    var tamanho;
    var div = document.getElementById("textos");
    var p = textos.getElementsByTagName("p");
    
    return p.length * 5;
}

function infos_temperatura(temperatura) {

    vetor_menor_dez = new Array(4);
    vetor_menor_dez[0] = "FRIO FRIO FRIO";
    vetor_menor_dez[1] = "TEMPERATURA INFERIOR A 10";
    vetor_menor_dez[2] = "FRIO FRIO FRIO";
    vetor_menor_dez[3] = "TEMPERATURA INFERIOR A 10";
   

    vetor_onze_vinte = new Array(4);
    vetor_onze_vinte[0] = "MENOS FRIO MENO FRIO";
    vetor_onze_vinte[1] = "TEMPERATURA DE 11 A 20";
    vetor_onze_vinte[2] = "MENOS FRIO MENO FRIO";
    vetor_onze_vinte[3] = "TEMPERATURA DE 11 A 20";

    vetor_vinte1_trinta = new Array(4);
    vetor_vinte1_trinta[0] = "NEM FRIO NEM QUENTE";
    vetor_vinte1_trinta[1] = "TEMPERATURA DE 21 A 30";
    vetor_vinte1_trinta[2] = "NEM FRIO NEM QUENTE";
    vetor_vinte1_trinta[3] = "TEMPERATURA DE 21 A 30";

    vetor_trinta1_quarenta = new Array(4);
    vetor_trinta1_quarenta[0] = "TA ESQUENTANDO TA ESQUENTANDO";
    vetor_trinta1_quarenta[1] = "TEMPERATURA DE 31 A 40";
    vetor_trinta1_quarenta[2] = "TA ESQUENTANDO TA ESQUENTANDO";
    vetor_trinta1_quarenta[3] = "TEMPERATURA DE 31 A 40";

    vetor_quarenta1 = new Array(4);
    vetor_quarenta1[0] = "CHURASQUINHO TA R$ 2 CHURASQUINHO TA R$ 2";
    vetor_quarenta1[1] = "TEMPERATURA SUPERIOR A 41";
    vetor_quarenta1[2] = "CHURASQUINHO TA R$ 2 CHURASQUINHO TA R$ 2";
    vetor_quarenta1[3] = "TEMPERATURA SUPERIOR A 41";

    if (temperatura <= 10) {
        for (var i = 0; i < getSizeP(); i++){
            remove_infos();
        }
       
        for (var i = 0; i < vetor_menor_dez.length; i++) {
            var txt = document.getElementById("textos");
            var p = txt.getElementsByTagName("p");
            txt.innerHTML += "<p id='desc_temp'>" + vetor_menor_dez[i] + "</p>";

        }
        
    } else if (temperatura > 10 && temperatura <= 20) {
        for (var i = 0; i < getSizeP(); i++) {
            remove_infos();
        }
        for (var i = 0; i < vetor_onze_vinte.length; i++) {
            var txt = document.getElementById("textos");
            txt.innerHTML += "<p id='desc_temp'>" + vetor_onze_vinte[i] + "</p>";

        }
    } else if (temperatura > 20 && temperatura <= 30) {
        for (var i = 0; i < getSizeP(); i++) {
            remove_infos();
        }
        for (var i = 0; i < vetor_vinte1_trinta.length; i++) {
            var txt = document.getElementById("textos");
            txt.innerHTML += "<p id='desc_temp'>" + vetor_vinte1_trinta[i] + "</p>";

        }
    } else if (temperatura > 30 && temperatura <= 40) {
        for (var i = 0; i < getSizeP(); i++) {
            remove_infos();
        }
        for (var i = 0; i < vetor_trinta1_quarenta.length; i++) {
            var txt = document.getElementById("textos");
            txt.innerHTML += "<p id='desc_temp'>" + vetor_trinta1_quarenta[i] + "</p>";

        }
    }  else if (temperatura > 40) {
        for (var i = 0; i < getSizeP(); i++) {
            remove_infos();
        }
        for (var i = 0; i < vetor_quarenta1.length; i++) {
            var txt = document.getElementById("textos");
            txt.innerHTML += "<p id='desc_temp'>" + vetor_quarenta1[i] + "</p>";
        }
    }
    

}

function getValue(id_div) {
   // return document.getElementById(id_div).innerHTML.replace('°c', '');
    return (id_div);
}

function getRandom(max) {
    Math.floor(Math.random() * max)
}

function atualiza_numeros_medias(menor_antes, menor_nova, media_antes, media_nova, maior_antes, maior_nova) {
    temp_menor_atual = menor_antes;
    temp_menor_nova = menor_nova;  

    temp_media_atual = media_antes;
    temp_media_nova = media_nova;

    temp_maior_atual = maior_antes;
    temp_maior_nova = maior_nova;

    atualiza_temp_menor();
    atualiza_temp_media();
    atualiza_temp_maior();
}

function atualiza_temp_menor() {
    if (temp_menor_atual != temp_menor_nova) {
        setTimeout(atualiza_temp_menor, 100);      
    }

    document.getElementById("txt_temp_menor").innerHTML = temp_menor_atual + "°c";

    if (temp_menor_atual < temp_menor_nova) {
        temp_menor_atual++;

    }
    else if (temp_menor_atual > temp_menor_nova) {
        temp_menor_atual--;
    }
}

function atualiza_temp_media() {

    if (temp_media_atual != temp_media_nova) {
        setTimeout(atualiza_temp_media, 100);
    }

    document.getElementById("txt_temp_media").innerHTML = temp_media_atual + "°c";

    if (temp_media_atual < temp_media_nova) {
        temp_media_atual++;

    }
    else if (temp_media_atual > temp_media_nova) {
        temp_media_atual--;
    }
}

function atualiza_temp_maior() {
    if (temp_maior_atual != temp_maior_nova) {
        setTimeout(atualiza_temp_maior, 100);
    }


    document.getElementById("txt_temp_maior").innerHTML = temp_maior_atual + "°c";

    if (temp_maior_atual < temp_maior_nova) {
        temp_maior_atual++;

    }
    else if (temp_maior_atual > temp_maior_nova) {
        temp_maior_atual--;
    }
}


function getViewConfiguracoes(){

    var div = document.getElementById('ar');
    div.innerHTML += "<div id='fundo_modal'>"
                        +"<div id='tela_confs'>"
                            +"<p class='titulo'>Configurações</p>"
                            +"<a href='#' class='confs_opc'>Adicionar Termometro</a>"
                            +"<a href='#' class='confs_opc'>Editar suas Informações</a>"
                            +"<a href='#' class='confs_opc'>Editar Usuários do Sistema</a>"
                            +"<a href='#' class='confs_opc'>Ajuda</a>"
                            +"<a href='#' class='fechar' onclick='removerViewConfiguracoes()'>x</a>"
                            +"</div>"
                    +" </div>" ;

    /*<div id="fundo_modal" onclick='removerViewConfiguracoes()''>               
                <div id="tela_confs" id="view_confs">
                    <p class="titulo">Configurações</p>
                    <a href="#" class="confs_opc">Adicionar Termometro</a>
                    <a href="#" class="confs_opc">Editar suas Informações</a>
                    <a href="#" class="confs_opc">Editar Usuários do Sistema</a>
                    <a href="#" class="confs_opc"'>Ajuda</a>
                    <a href= "#" class="fechar" onclick='removerViewConfiguracoes()'>x</a>
                </div>
    </div>*/
}
function removerViewConfiguracoes(){

    var div_com_id = document.getElementById("fundo_modal");
    
    try {
         div_com_id.parentNode.removeChild(div_com_id);
    } catch (err) { }

}