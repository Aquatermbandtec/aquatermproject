<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Relatorio.aspx.cs" Inherits="ProjetoAquaTerm.Relatorio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Relatórios AquaTerm</title>
    <link rel="stylesheet" type="text/css" href="css/relatorio.css"/>
    <link rel="shortcut icon" href="img/logoPequeno.ico" type="image/x-icon" />

</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lValida" runat="server" Text=""></asp:Label>
        <div id="relatorios">
	<div id="logo"></div>
	<div id="dados">
		<p><b>Usuário:</b> <asp:Label ID="lNomeUser" runat="server" Text=""></asp:Label></p>
		<p><b>Email:</b> <asp:Label ID="lEmailUser" runat="server" Text=""></asp:Label></p>
		<p><b>Telefone:</b> <asp:Label ID="lTelefoneUser" runat="server" Text=""></asp:Label></p>
	</div>
	<div id="valores">
		<table id="tabela">
			<tr>
				<th>Menor Temperatura</th>
				<th>Maior Temperatura</th>
				<th>Media das Temperaturas</th>
				<th>Mediana</th>
				<th>1º Quartil</th>
				<th>3° Quartil</th>
			</tr>

			<tr>
				<td>
                <asp:Label ID="lbMenor" runat="server" Text="Label"></asp:Label>
				</td>
				<td>
                <asp:Label ID="lbMaior" runat="server" Text="Label"></asp:Label>
				</td>
				<td>
                <asp:Label ID="lbMedia" runat="server" Text="Label"></asp:Label>
				</td>
				<td>
                <asp:Label ID="lbMediana" runat="server" Text="Label"></asp:Label>
				</td>
				<td>
                <asp:Label ID="lbQuartilUm" runat="server" Text="Label"></asp:Label>
				</td>
				<td>
                <asp:Label ID="lbQuartilTres" runat="server" Text="Label"></asp:Label>
				</td>
			</tr>			
		</table>

        
		<br><p><b>Total de temperaturas medidas: </b><asp:Label ID="lQuantas" runat="server" Text=""></asp:Label></p>
        <br><p><b>Desvio padrão das temperaturas: </b><asp:Label ID="lDesvio" runat="server" Text=""></asp:Label></p>
	</div>
</div>
    </form>
</body>
</html>
