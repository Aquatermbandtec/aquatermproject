
<?php
$host = "localhost";
$user = "root";
$pass = "";
$banco = "bdprojeto";
$conexao = @mysql_connect($host,$user,$pass);
@mysql_select_db($banco);
?>

<?php
$nome=$_POST['nome'];
$senha=$_POST['senha'];
$email=$_POST['email'];
$telefone=$_POST['telefone'];

if($nome == ""){
echo"<script language='javascript' type='text/javascript'>alert('O campo usuario deve ser preenchido');window.location.href='cadastro.html';</script>"; 
}

if($senha == ""){
echo"<script language='javascript' type='text/javascript'>alert('O campo senha deve ser preenchido');window.location.href='cadastro.html';</script>"; 
}

if($email == ""){
echo"<script language='javascript' type='text/javascript'>alert('O campo email deve ser preenchido');window.location.href='cadastro.html';</script>"; 
}

if($telefone == ""){
echo"<script language='javascript' type='text/javascript'>alert('O campo telefone deve ser preenchido');window.location.href='cadastro.html';</script>"; 
}
else{
$sql = mysql_query("INSERT INTO tbUsuarios(nome,senha,email,telefone) VALUES ('$nome','$senha','$email','$telefone')");

if($sql){
echo"<script language='javascript' type='text/javascript'>alert('Usuário cadastrado com sucesso!');window.location.href='../index.html'</script>";

else{
	echo"<script language='javascript' type='text/javascript'>alert('Ocorreu um erro ao cadastrar');window.location.href='cadastro.html'</script>";
}
}
}
?>
