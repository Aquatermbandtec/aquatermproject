<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cadastro.aspx.cs" Inherits="ProjetoAquaTerm.Cadastro" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="css/cadastro.css" />
    <link rel="shortcut icon" href="img/logoPequeno.ico" type="image/x-icon" />
     <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>AquaTerm System | Cadastro</title>
</head>
<body>
    <div id="login-box">
        <div id="login-box-interno">
            <div id="login-box-label">CADASTRE-SE</div>
            <form id="formCadastro" runat="server">

                <div class="input-div" id="input-usuario">
                    <asp:TextBox ID="txtUsuario" runat="server" placeholder="Insira seu nome de usuário"></asp:TextBox>
                </div>

                <div class="input-div" id="input-senha">
                    <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" placeholder="Insira sua senha"></asp:TextBox>
                </div>

                <div class="input-div" id="input-email">
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Insira seu e-mail"></asp:TextBox>
                </div>

                <div class="input-div" id="input-telefone">
                    <asp:TextBox ID="txtTelefone" runat="server" TextMode="Phone" placeholder="Insira seu telefone"></asp:TextBox>
                </div>

                <asp:Button ID="btnCadastrar" runat="server" Text="Efetuar Cadastro" OnClick="btnCadastrar_Click" />
                <asp:Button ID="btnVoltar" runat="server" Text="Voltar" PostBackUrl="~/Login.aspx" />

            </form>
        </div>
    </div>
</body>
</html>
