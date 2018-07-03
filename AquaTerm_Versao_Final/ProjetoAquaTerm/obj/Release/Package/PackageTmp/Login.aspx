<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProjetoAquaTerm.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="css/login.css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="img/logoPequeno.ico" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>AquaTerm System | Login</title>
</head>
<body>
    <form id="formLogar" runat="server">
        <div id= "formulario">
            <div id="label">LOGIN</div>

              <div class="input-div" id="input-usuario">
                  <asp:TextBox ID="txtUser" runat="server" placeholder="Usuario"></asp:TextBox>
            </div>

            <div class="input-div" id="input-senha">
                <asp:TextBox ID="txtSenha" runat="server" placeholder="Senha" TextMode="Password"></asp:TextBox>
            </div>
            
            <asp:Button ID="btnLogar" runat="server" Text="Logar" OnClick="btnLogar_Click" />
            <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" PostBackUrl="~/Cadastro.aspx" />
            
            <div id="divLabel">
            <asp:Label ID="lblMensagem" runat="server"></asp:Label>
            </div>
            </div>
            </form>
</body>
</html>
