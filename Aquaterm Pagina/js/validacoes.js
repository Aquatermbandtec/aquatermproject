function validacao(){
	if(document.form.nome.value==""){
		alert("Por favor, preencha o campo nome.")
		document.form.nome.focus();
		return false;
	}
	if(document.form.senha.value.length < 5){
		alert("A senha deve conter no minimo 5 digitos.")
		document.form.senha.focus();
		return false;
	}
	if(document.form.email.value=="" || document.form.email.value.indexOf('@')==-1 || document.form.email.value.indexOf('.')==-1){
		alert("Por favor, digite um endereço de email válido")
		document.form.email.focus();
		return false;
		
	}
	if(document.form.telefone.value=="" || document.form.telefone.value.length < 8){
		alert("Por favor digite um numero de telefone valido");
		document.form.telefone.focus();
		return false;
	}
	else{
		alert("Cadastrado com sucesso!!")
		document.form.submit.focus();
		return true;
	}
}